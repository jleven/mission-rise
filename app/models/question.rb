class Question < ActiveRecord::Base
  serialize :meta

  scope :upsert, ->(attrs) {
    question = self.first_or_initialize
    attrs.each do |attr, value|
      question.send("#{attr}=", value)
    end
    question.save!
  }
end
