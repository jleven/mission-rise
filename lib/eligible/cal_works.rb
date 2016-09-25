module Eligible
  class CalWorks
    REGION_FROM_COUNTY = {
      'Alameda' => 'Region 1',
      'Contra Costa' => 'Region 1',
      'Los Angeles' => 'Region 1',
      'Marin' => 'Region 1',
      'Monterey' => 'Region 1',
      'Napa' => 'Region 1',
      'Orange' => 'Region 1',
      'San Diego' => 'Region 1',
      'San Francisco' => 'Region 1',
      'San Luis Obispo' => 'Region 1',
      'San Mateo' => 'Region 1',
      'Santa Barbara' => 'Region 1',
      'Santa Clara' => 'Region 1',
      'Santa Cruz' => 'Region 1',
      'Sonoma' => 'Region 1',
      'Ventura' => 'Region 1',
    }

    REGION_ONE = {
      1	=> 619,
      2	=> 1014,
      3	=> 1257,
      4	=> 1492,
      5	=> 1703,
      6	=> 1915,
      7	=> 2105,
      8	=> 2291,
      9	=> 2485,
      10	=> 2698,
    }

    REGION_TWO = {
      1	=> 587,
      2	=> 964,
      3	=> 1194,
      4	=> 1419,
      5	=> 1621,
      6	=> 1822,
      7	=> 1997,
      8	=> 2181,
      9	=> 2356,
      10	=> 2566,
    }

    def initialize(user_id)
      @questions_by_name = Question.all.index_by(&:name)
      @answers_by_question_id = Answer.where(user_id: user_id).all.index_by(&:question_id)
    end

    def eligible?
      begin
        family_size? && citizenship? && (income? || resource?)
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
      total_cash + income - medicare - ssi
    end

    def income_limit
      county = Zipcode.county(zipcode)
      region = REGION_FROM_COUNTY[county]

      map =  region == 'Region 1' ? REGION_ONE : REGION_TWO

      if family_size <= 10
        map[family_size]
      else
        limit_for_ten = map[10]
        remainder = family_size - 10
        limit_for_ten + (remainder*24)
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

    def zipcode
      value_for('q1').to_i
    end
  end
end