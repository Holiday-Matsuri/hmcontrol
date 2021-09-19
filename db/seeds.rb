# puts 'Created Admin User'
# AdminUser.create!(
#   email: 'admin@test.com',
#   first_name: 'Holly',
#   last_name: 'Mat',
#   username: 'administrator',
#   password: 'E1n$tein15Floof',
#   password_confirmation: 'E1n$tein15Floof'
# )

# #staff
# puts 'Create 2 Staff Users'
# StaffUser.create!(
#   email: 'staff1@test.com',
#   first_name: 'Kaleb',
#   last_name: 'Parker',
#   username: 'kparker',
#   password: 'E1n$tein15Floof',
#   password_confirmation: 'E1n$tein15Floof'
# )
# StaffUser.create!(
#   email: 'staff2@test.com',
#   first_name: 'John',
#   last_name: 'Minicozzi',
#   username: 'jminicozzi',
#   password: 'E1n$tein15Floof',
#   password_confirmation: 'E1n$tein15Floof'
# )
# # users
# User.create!(
#   email: 'test@test.com',
#   first_name: 'Andrea',
#   last_name: 'Martin',
#   username: 'gawkymarauder',
#   password: 'E1n$tein15Floof',
#   password_confirmation: 'E1n$tein15Floof'
# )

# # convention
# puts 'Create 2021'
# Convention.create!(
#   year: 2021,
#   address: '8701 World Center Dr, Orlando, FL 32821',
#   description: 'Holiday Matsuri - The Anime Time Skip',
#   status: 'active'
# )

100.times do |panel|
  cat = rand(1..5)
  case cat
  when 1
    c = "My Hero"
  when 2
    c = "KPOP"
  when 3
    c = "Attack on Titan"
  when 4
    c = "Black Butler"
  else
    c = "Homestuck"
  end
  EventApplication.create!(
    event_name: "Seeded panel Number: #{panel+1}",
    internal_desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam placerat felis eu orci porttitor, sed ultrices elit tincidunt. Cras ligula purus, egestas id bibendum a, finibus sit amet nulla. Donec ac massa metus. Integer cursus nulla sed porta hendrerit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut turpis elit, condimentum vitae diam suscipit, tempus pulvinar erat. Etiam tellus mi, malesuada quis sagittis at, egestas sit amet nisl. Curabitur congue purus quis eleifend bibendum. Vivamus egestas efficitur viverra. Nam pharetra lectus sem, sed eleifend diam mollis ultrices. Suspendisse porttitor mollis erat. Maecenas nulla elit, elementum ac lacus elementum, maximus elementum massa. Sed et libero ornare, rutrum sapien at, ultrices est. Cras ornare, sem eget tincidunt faucibus, tortor odio lacinia magna, sit amet pellentesque urna dui sed nisl. In bibendum velit ac lacus tempus iaculis.",
    external_desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam placerat felis eu orci porttitor, sed ultrices elit tincidunt. Cras ligula purus, egestas id bibendum a, finibus sit amet nulla. Donec ac massa metus. Integer cursus nulla sed porta hendrerit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut turpis elit, condimentum vitae diam suscipit, tempus pulvinar erat. Etiam tellus mi, malesuada quis sagittis at, egestas sit amet nisl. Curabitur congue purus quis eleifend bibendum. Vivamus egestas efficitur viverra. Nam pharetra lectus sem, sed eleifend diam mollis ultrices. Suspendisse porttitor mollis erat. Maecenas nulla elit, elementum ac lacus elementum, maximus elementum massa. Sed et libero ornare, rutrum sapien at, ultrices est. Cras ornare, sem eget tincidunt faucibus, tortor odio lacinia magna, sit amet pellentesque urna dui sed nisl. In bibendum velit ac lacus tempus iaculis.",
    host_stage_name: "Panel Host #{panel+1}",
    age_rating: "G Rated",
    previous_convention: true,
    event_length: "1 Hour",
    user_id: 4,
    panel_category: c,
    convention_id: 1

  )
end