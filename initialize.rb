require 'Digest'

puts 'enter username'
username = gets.chomp

puts 'enter password'
password = gets.chomp

password_digest = Digest::SHA256.base64digest password

User.create!({
	username: username,
	password_digest: password_digest
})