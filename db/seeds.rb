doctor = User.create!(
  email: 'doctor@example.com',
  password: 'password',
  role: 'doctor'
)

receptionist = User.create!(
  email: 'receptionist@example.com',
  password: 'password',
  role: 'receptionist'
)

Patient.create!(
  name: 'Patient 1',
  phone: '123-456-7890',
  diagnosis: 'Fever',
  email: 'patient1@example.com',
  user: doctor
)

Patient.create!(
  name: 'Patient 2',
  phone: '987-654-3210',
  diagnosis: 'Cough',
  email: 'patient2@example.com',
  user: receptionist
)

puts 'Seed data created successfully.'
