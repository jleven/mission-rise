module Eligible
  class CalFresh
    INCOME_LIMITS = {
      1	=> 1962,
      2	=> 2656,
      3	=> 3350,
      4	=> 4042,
      5	=> 4736,
      6	=> 5430,
      7	=> 6122,
      8	=> 6816,
    }

    def initialize(user_id)
      @questions_by_name = Question.all.index_by(&:name)
      @answers_by_question_id = Answer.where(user_id: user_id).all.index_by(&:question_id)
    end

    def eligible?
      begin
        citizenship? && (income? || elderly_or_disabled?)
      rescue ArgumentError => e
        puts "========== ERROR =========="
        p e
        false
      end
    end

    private

    def value_for(name, otherwise = nil)
      answer = @answers_by_question_id[
        @questions_by_name[name].id
      ]
      if answer
        answer.response
      else
        otherwise or fail(ArgumentError, name)
      end
    end

    def eligibility_total_amount
      total_cash + income
    end

    def income_limit
      map = INCOME_LIMITS

      if family_size <= 8
        map[family_size]
      else
        limit_for_eight = map[8]
        remainder = family_size - 8
        limit_for_eight + (remainder*618)
      end
    end

    def family_size?
      family_size > 1
    end

    def income?
      eligibility_total_amount < income_limit
    end

    def resource?
      # if <19 year old and total_cash < 2250 || >60 year old and total_cash < 3250
      (nineteen && total_cash < 2250) || (sixty && total_cash < 3250)
    end

    def citizenship?
      # citizen
      return false unless citizen || value_for('q3') == "Yes"

      return true if family_size <= 1

      # all members of family are citizens
      others_citizens || value_for('q13') == "Yes"
    end

    def elderly_or_disabled?
      sixty || disabled
    end

    def total_cash
      value_for('q5a').to_i
    end

    def income
      value_for('q5d').to_i
    end

    def citizen
      value_for('q2') == "Yes"
    end

    def medicare
      value_for('q5c', 0).to_i
    end

    def ssi
      value_for('q5', 0).to_i
    end

    def family_size
      value_for('q6').to_i
    end

    def others_citizens
      value_for('q12', "Yes") == "Yes"
    end

    def nineteen
      value_for('q7', "No") == 'Yes'
    end

    def sixty
      value_for('q8', "No") == 'Yes'
    end

    def disabled
      value_for('q10', "No") == 'Yes'
    end

    def zipcode
      value_for('q1').to_i
    end
  end
end