1000.times do
  User.create(uid: SecureRandom.hex)
end
