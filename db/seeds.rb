

['SuperAdmin', 'Member'].each do |role|
  Role.where(name: role).first_or_create
end

puts "roles created!"

User.create!(first_name: 'Super', last_name: 'Admin', email: 'admin@example.com', password: 'admin@password')

puts "#{User.last.email} created!"

User.last.roles << Role.first

puts "Role Assigned!"
