puts 'Created Admin User'
AdminUser.create!(
  email: 'admin@test.com',
  first_name: 'Holly',
  last_name: 'Mat',
  username: 'administrator',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf'
)

#staff
puts 'Create 2 Staff Users'
StaffUser.create!(
  email: 'staff1@test.com',
  first_name: 'Kaleb',
  last_name: 'Parker',
  username: 'kparker',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf'
)
StaffUser.create!(
  email: 'staff2@test.com',
  first_name: 'John',
  last_name: 'Minicozzi',
  username: 'jminicozzi',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf'
)
# users
User.create!(
  email: 'test@test.com',
  first_name: 'Andrea',
  last_name: 'Martin',
  username: 'gawkymarauder',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf'
)

# convention
puts 'Create 2021'
Convention.create!(
  year: 2021,
  address: '8701 World Center Dr, Orlando, FL 32821',
  description: 'Holiday Matsuri - The Anime Time Skip',
  status: 'active'
)