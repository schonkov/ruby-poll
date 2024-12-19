class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @answer = Answer.find(params[:answer_id])
    poll = @answer.poll

    if !poll.is_published?
      redirect_to poll_path(poll), alert: "You cannot vote on a closed poll."
      return
    end

    @vote = Vote.new(user: current_user, answer: @answer)
    if @vote.save
      redirect_to poll_path(@answer.poll), notice: "Vote recorded!"
    else
      redirect_to poll_path(@answer.poll), alert: @vote.errors.full_messages.to_sentence
    end
  end
end
