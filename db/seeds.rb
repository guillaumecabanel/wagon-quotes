require "faker"

10.times do
  quote = Quote.create!(
    value: Faker::Commerce.product_name,
    author: Faker::Name.name,
    votes: (0..100).to_a.sample
  )
end
