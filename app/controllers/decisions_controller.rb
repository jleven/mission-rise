class DecisionsController < ApplicationController
  PARTIALS = {
    'MultipleChoiceQuestion' => 'questions/multiple_choice',
    'NumericQuestion' => 'questions/numeric',
  }

  def index
    @question = Question.all.sample
    @partial = PARTIALS[@question.kind]
  end

  def update
    question_id = answer_params[:id]
    response = answer_params[:value]

    answer = Answer.where(
      user_id: session[:user_id],
      question_id: question_id
    ).first_or_initialize

    answer.response = response
    answer.save

    redirect_to action: :index
  end

  private
  def answer_params
    params.permit(:id, :value)
  end
end
