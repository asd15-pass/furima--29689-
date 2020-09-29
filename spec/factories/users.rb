FactoryBot.define do
  factory :user do
    nickname              {"test12345"}
    email                 {"asdf@tyh"}
    password              {"er11212"}
    password_confirmation {password}
    last_name             {"しいば"}
    first_name            {"たつき"}
    last_name_kana        {"シイバ"}
    first_name_kana       {"タツキ"}
    birth_date            {"1931-03-03"}
  end
end