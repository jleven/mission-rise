Question.where(
  name: "q1"
).upsert(
  prompt: "What is your zip code?",
  kind: 'NumericQuestion',
  meta: [0, 99999]
)

Question.where(
  name: 'q2'
).upsert(
  prompt: "Are you a US citizen?",
  kind: 'MultipleChoiceQuestion',
  meta: ["Yes", "No"]
)

Question.where(
  name: 'q3'
).upsert(
  prompt: "Do you have legal visitation documents?",
  kind: 'MultipleChoiceQuestion',
  meta: ["Yes", "No"]
)

Question.where(
  name: 'q4'
).upsert(
  prompt: "Do you or anyone in your home receive Supplemental Security Income/ State Supplemental Payment (SSI/SSP) benefits?",
  kind: 'MultipleChoiceQuestion',
  meta: ["Yes", "No"]
)

Question.where(
  name: 'q5'
).upsert(
  prompt: "What is the total amount you receive from SSI and/or SSP?",
  kind: 'NumericQuestion',
  meta: [0, 999_999_999]
)

Question.where(
  name: 'q5a'
).upsert(
  prompt: "What is the total amount of cash you have?",
  kind: 'NumericQuestion',
  meta: [0, 999_999_999]
)

Question.where(
  name: 'q5b'
).upsert(
  prompt: "Do you currently receive money from Medicare or Food Stamps?",
  kind: 'MultipleChoiceQuestion',
  meta: ["Yes", "No"]
)

Question.where(
  name: 'q5c'
).upsert(
  prompt: "What is the total amount you receive from medicare and Food stamps?",
  kind: 'NumericQuestion',
  meta: [0, 999_999_999]
)


Question.where(
  name: 'q5d'
).upsert(
  prompt: "About how much money did your household make last month?",
  kind: 'NumericQuestion',
  meta: [0, 999_999_999]
)

Question.where(
  name: 'q6'
).upsert(
  prompt: "Over the next 6 months, how many people will be living in your household, including yourself? For this question, please do not include foster children.",
  kind: 'NumericQuestion',
  meta: [0, 30]
)

Question.where(
  name: 'q7'
).upsert(
  prompt: "Is any person living with you under 19?",
  kind: 'MultipleChoiceQuestion',
  meta: ["Yes", "No"]
)

Question.where(
  name: 'q8'
).upsert(
  prompt: "Is any person living with you over 60?",
  kind: 'MultipleChoiceQuestion',
  meta: ["Yes", "No"]
)

Question.where(
  name: 'q10'
).upsert(
  prompt: "Is anyone in your home permanently disabled?",
  kind: 'MultipleChoiceQuestion',
  meta: ["Yes", "No"]
)


Question.where(
  name: 'q12'
).upsert(
  prompt: "Are the other members of your household US citizens?",
  kind: 'MultipleChoiceQuestion',
  meta: ["Yes", "No"]
)


Question.where(
  name: 'q13'
).upsert(
  prompt: "Do they have legal visitation paperwork?",
  kind: 'MultipleChoiceQuestion',
  meta: ["Yes", "No"]
)

Question.where(
  name: 'q14'
).upsert(
  prompt: "Do you have stable housing right now?",
  kind: 'MultipleChoiceQuestion',
  meta: ["Yes", "No"]
)

Question.where(
  name: 'q15'
).upsert(
  prompt: "Are you expecting?",
  kind: 'MultipleChoiceQuestion',
  meta: ["Yes", "No"]
)


