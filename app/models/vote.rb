class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  # Ensure one user can't vote more than once for the same poll:
  validate :unique_vote_per_poll

  private

  def unique_vote_per_poll
    # if user already voted on any answer of the same poll, reject
    poll_id = answer.poll_id
    if Vote.joins(:answer).where(user_id: user_id, answers: { poll_id: poll_id }).exists?
      errors.add(:user_id, "has already voted for this poll")
    end
  end
end
