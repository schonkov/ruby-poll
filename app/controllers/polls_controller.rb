class PollsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_poll, only: [:show, :edit, :update, :destroy, :publish, :close]
  before_action :check_admin!, only: [:new, :create, :edit, :update, :destroy, :publish, :close]


  def index
    @polls = Poll.all
  end

  def show
    # show poll and its answers, and if user has voted
    @answers = @poll.answers
    @user_voted = user_signed_in? && Vote.joins(:answer).where(user_id: current_user.id, answers: { poll_id: @poll.id }).any?
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      redirect_to @poll, notice: "Poll created successfully."
    else
      render :new
    end
  end

  # Admin could edit poll if needed
  def edit
    #edit view;
  end

  def update
    if @poll.update(poll_params)
      redirect_to @poll, notice: "Poll updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @poll.destroy
    redirect_to polls_path, notice: "Poll deleted."
  end

  def publish
    if @poll.update(is_published: true)
      redirect_to @poll, notice: "Poll has been published!"
    else
      redirect_to @poll, alert: "Failed to publish the poll."
    end
  end

  def close
    if @poll.update(is_published: false)
      redirect_to @poll, notice: "Poll has been closed!"
    else
      redirect_to @poll, alert: "Failed to close the poll."
    end
  end

  def new_answer_field
    # Create a new Answer object in memory (not saved)
    @poll = Poll.new
    @answer = @poll.answers.build

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_poll
    @poll = Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:question, :is_published, answers_attributes: [:id, :text, :_destroy])
  end

  def check_admin!
    redirect_to root_path, alert: "Access denied." unless current_user&.admin?
  end
end
