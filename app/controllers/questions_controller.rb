class QuestionsController < ApplicationController
  PARTIALS = {
    'MultipleChoiceQuestion' => 'questions/multiple_choice',
    'NumericQuestion' => 'questions/numeric',
  }

  COMPLETION = {
    "zipcode" => 10,
    "pregnant" => 95,
  }

  PROGRAMS = {
    "zipcode" => 1,
    "pregnant" => 2,
  }

  def show
    @question = Question.find_by_name params[:id]
    headers['Last-Modified'] = Time.now.httpdate
    @partial = PARTIALS[@question.kind]
    @percent_done = COMPLETION[@question.name]
    @programs = PROGRAMS[@question.name]
  end
end
