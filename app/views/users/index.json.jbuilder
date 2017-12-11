json.users @users do |user|
  json.name user.name
  json.password user.password
end
