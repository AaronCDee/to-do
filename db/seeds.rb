# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
main_user = User.create!(
    email: "aaron@example.com",
    password: "password",
    password_confirmation: "password"
)

10.times do 
    main_user.todos.create!(
        description: Faker::Lorem.sentence(word_count: 3)
    )
end

100.times do
    temp_user = User.create!(
        email: Faker::Internet.email,
        password: "password",
        password_confirmation: "password"
    )

    10.times do
        temp_user.todos.create!(
            description: Faker::Lorem.sentence(word_count: 3)
        ).has_overlord(main_user)
    end


end
