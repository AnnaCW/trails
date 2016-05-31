FactoryGirl.define do
  factory :trail do
    name "Storm Mountain Route 153"
    image_path "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz52PqqYbLtQGkKuiKmAx5YkylHCpmNUuXyCbZnyFpS4DhEKKy"
    city "Ft. Collins"
    state "CO"
  end

  sequence :name do |n|
    "#{n} Name"
  end

end
