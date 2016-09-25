module DecisionTree
  def self.next_question(answer)
    question = Question.find answer.question_id

    self.send(question.name, answer)
  end

  def self.zipcode(answer)
    [:ok, 'pregnant']
  end

  def self.pregnant(answer)
    [:done]
  end
end