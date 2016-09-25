class QuestionsController < ApplicationController
  PARTIALS = {
    'MultipleChoiceQuestion' => 'questions/multiple_choice',
    'NumericQuestion' => 'questions/numeric',
  }

  def show
    @question = Question.find_by_name params[:id]
    @partial = PARTIALS[@question.kind]
  end
end
