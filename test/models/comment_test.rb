# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup :database_fixture

  test 'liking a comment should work' do
    comment = create(:comment)
    user = create(:user)

    ok, liked_comment = Comment.like(user, comment)

    assert_equal :ok, ok,
                 'should work'
    assert_equal 1, liked_comment.likes,
                 'should update likes'

    already_liked, = Comment.like(user, comment)

    assert_equal :already_liked, already_liked,
                 'should not allow to re-like'

    other_user = create(:user)

    ok, still_liked_comment = Comment.like(other_user, comment)

    assert_equal :ok, ok,
                 'should work with other users'
    assert_equal 2, still_liked_comment.likes,
                 'should update likes once more'
  end

  test 'disliking a comment should work' do
    like = create(:comment_like)

    ok, unliked_comment = Comment.unlike(like.user, like.comment)

    assert_equal :ok, ok,
                 'should work'
    assert_equal 0, unliked_comment.likes,
                 'should be unliked'

    not_liked, = Comment.unlike(like.user, like.comment)

    assert_equal :not_liked, not_liked,
                 'should not allow to unlike without liking again'

    other_like = create(:comment_like, comment: like.comment)

    ok, still_disliked_comment = Comment.unlike(
      other_like.user,
      other_like.comment
    )

    assert_equal :ok, ok,
                 'should work'
    assert_equal 0, still_disliked_comment.likes,
                 'should be still unliked'
  end

  test 'comment like should always be updated' do
    comment = create(:comment)

    assert_equal 0, comment.likes,
                 'should have no likes'

    100.times do
      if comment.likes.zero?
        user = create(:user)

        ok, updated_comment = Comment.like(user, comment)
      else
        case %i[like unlike].sample
        when :like
          user = create(:user)

          ok, updated_comment = Comment.like(user, comment)
        when :unlike
          like = CommentLike.all.sample

          ok, updated_comment = Comment.unlike(like.user, comment)
        end
      end

      assert_equal :ok, ok,
                   'should always work'

      comment = updated_comment
    end

    assert_equal CommentLike.count, comment.likes,
                 'likes should be the same'
  end

  test 'concurrency should be handled with comment' do
    comment = create(:comment_with_likes, like_count: 5)
    current_likes = comment.likes
    workers = Random.rand(5..10)

    (1..workers)
      .map { |_| create(:user) }
      .map { |user| Thread.new { Comment.like(user, comment) } }
      .map(&:join)

    assert_equal current_likes + workers, comment.reload.likes,
                 'likes should handle concurrency properly'

    current_likes = comment.likes

    disliking_users = CommentLike
                      .all
                      .sample(Random.rand(1..current_likes))
                      .map(&:user)

    disliking_users
      .map { |user| Thread.new { Comment.unlike(user, comment) } }
      .map(&:join)

    assert_equal current_likes - disliking_users.size, comment.reload.likes,
                 'unlikes should handle concurrency properly'
  end
end