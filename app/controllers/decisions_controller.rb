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
    redirect_to action: :index
  end
end
