puts 'Created Admin User'
AdminUser.create!(
  email: 'admin@test.com',
  first_name: 'Holly',
  last_name: 'Mat',
  username: 'administrator',
  password: 'E1n$tein15Floof',
  password_confirmation: 'E1n$tein15Floof'
)

#staff
puts 'Create 2 Staff Users'
StaffUser.create!(
  email: 'staff1@test.com',
  first_name: 'Kaleb',
  last_name: 'Parker',
  username: 'kparker',
  password: 'E1n$tein15Floof',
  password_confirmation: 'E1n$tein15Floof'
)
StaffUser.create!(
  email: 'staff2@test.com',
  first_name: 'John',
  last_name: 'Minicozzi',
  username: 'jminicozzi',
  password: 'E1n$tein15Floof',
  password_confirmation: 'E1n$tein15Floof'
)
# users
User.create!(
  email: 'test@test.com',
  first_name: 'Andrea',
  last_name: 'Martin',
  username: 'gawkymarauder',
  password: 'E1n$tein15Floof',
  password_confirmation: 'E1n$tein15Floof'
)

# convention
puts 'Create 2021'
Convention.create!(
  year: 2021,
  address: '8701 World Center Dr, Orlando, FL 32821',
  description: 'Holiday Matsuri - The Anime Time Skip',
  status: 'active'
)