FactoryGirl.define do
  factory :missed_connection do
    latitude '38.8977'
    longitude '77.0366'
    title 'Your guns were cray'
    body "You went by the name Ms. First Lady and gave me a wink while Barrack wasn't looking. I knew it was love at first sight."
    location 'The White House'
    question 'What color tie was your husband wearing?'
    answer 'rainbow'
    active true
    user
  end
end
