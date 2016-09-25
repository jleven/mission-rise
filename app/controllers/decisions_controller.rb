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

    status, question_name = DecisionTree.next_question(answer)

    case status
    when :ok
      redirect_to question_path(question_name)
    when :done
      redirect_to report_path
    end

  end

  private
  def answer_params
    params.permit(:id, :value)
  end
end
