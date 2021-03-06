FactoryGirl.define do
  factory :trail do
    name
    image_path "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz52PqqYbLtQGkKuiKmAx5YkylHCpmNUuXyCbZnyFpS4DhEKKy"
    city "Ft. Collins"
    state "CO"
  end

  sequence :name do |n|
    "#{n} Name"
  end

  factory :tag do
    name
  end

  factory :user do
    username "defaultuser"
    password "password"
    password_confirmation "password"
    role 0
  end

end
