# Rails.application.config.middleware.use OmniAuth::Builder do
#   #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
#   provider :facebook, '857627197619811', '700cd31dd5951451aa72ffd44e9f7ce8'
# end

if Rails.env.production?
  OmniAuth.config.full_host = 'http://localhost:3000'
elsif Rails.env.staging?
  OmniAuth.config.full_host = 'http://localhost:3000'
else
  OmniAuth.config.full_host = 'http://lvh.me:3000'
end