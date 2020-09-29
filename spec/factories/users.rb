FactoryBot.define do
  factory :user do
    nickname              {"test12345"}
    email                 {"test@test"}
    password              {"eR11212"}
    password_confirmation {password}
    last_name             {"test"}
    first_name            {"test"}
    last_name_kana        {"test"}
    first_name_kana       {"test"}
    birth_date            {"1931-03-03"}
  end
end