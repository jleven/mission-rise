class DecisionsController < ApplicationController
  PARTIALS = {
    'MultipleChoiceQuestion' => 'questions/multiple_choice',
    'NumericQuestion' => 'questions/numeric',
  }

  def index
    # if user is in the middle of answering, continue
    # else
    redirect_to question_path("zipcode")
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

    question_name = DecisionTree.next_question(answer)

    redirect_to question_path(question_name)
  end

  private
  def answer_params
    params.permit(:id, :value)
  end
end
