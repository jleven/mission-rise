# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.where(
  prompt: "Are you pregnant?",
  kind: 'MultipleChoiceQuestion',
  meta: ['Yes', 'No']
).first_or_create

Question.where(
  prompt: "How many children do you have?",
  kind: 'NumericQuestion',
  meta: [0, 20]
).first_or_create

