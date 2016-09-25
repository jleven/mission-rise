class QuestionsController < ApplicationController
  PARTIALS = {
    'MultipleChoiceQuestion' => 'questions/multiple_choice',
    'NumericQuestion' => 'questions/numeric',
  }

  COMPLETION = {
    "q1" => 0,
    "q2" => 5,
    "q3" => 10,
    "q4" => 16,
    "q5" => 22,
    "q5a" => 30,
    "q5b" => 35,
    "q5c" => 38,
    "q5d" => 45,
    "q6" => 50,
    "q7" => 55,
    "q8" => 62,
    "q10" => 68,
    "q12" => 74,
    "q13" =>79,
    "q14" => 87,
    "q15" => 95,
  }

  def show
    @question = Question.find_by_name params[:id]
    @partial = PARTIALS[@question.kind]
    @percent_done = COMPLETION[@question.name]
  end
end
