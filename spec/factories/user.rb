FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {"test@example"}
    password {"a0000000"}
    password_confirmation {password}
    last_name {"阿部"}
    first_name {"太郎"}
    last_name_kana {"アベ"}
    first_name_kana {"タロウ"}
    birth_date {"19990101"}
  end
end