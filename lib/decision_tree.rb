module DecisionTree
  class << self
    def next_question(answer)
      question = Question.find answer.question_id

      self.send(question.name, answer)
    end

    private

    def yes_no(answer, yes, no)
      answer.response == 'Yes' ? yes : no
    end

    def q1(_)
      [:ok, 'q2']
    end

    def q2(answer)
      [:ok, yes_no(answer, 'q4', 'q3')]
    end

    def q3(_)
      [:ok, 'q4']
    end

    def q4(answer)
      [:ok, yes_no(answer, 'q5', 'q5a')]
    end

    def q5(answer)
      [:ok, 'q5a']
    end

    def q5a(answer)
      [:ok, 'q5b']
    end

    def q5b(answer)
      [:ok, yes_no(answer, 'q5c', 'q5d')]
    end

    def q5c(answer)
      [:ok, 'q5d']
    end

    def q5d(answer)
      [:ok, 'q6']
    end

    def q6(answer)
      if answer.response.to_i <= 1
        [:ok, 'q14']
      else
        [:ok, 'q7']
      end
    end

    def q7(answer)
      [:ok, 'q8']
    end

    def q8(answer)
      [:ok, 'q10']
    end

    def q10(answer)
      [:ok, 'q12']
    end

    def q12(answer)
      [:ok, yes_no(answer, 'q14', 'q13')]
    end

    def q13(answer)
      [:ok, 'q15']
    end

    def q14(answer)
      [:ok, 'q15']
    end

    def q15(answer)
      [:done]
    end
  end
end