set :stage, :production # change environment
set :branch, 'master' # change git brunch name
set :server_name, "xx.xx.xx.xx" # change to your server IP
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.
#
#role :app, %w{deploy@example.com}
#role :web, %w{deploy@example.com}
#role :db,  %w{deploy@example.com}

# set your own server's IP

role :web, "xx.xx.xx.xx" # Your HTTP server, Apache/etc
role :app, "xx.xx.xx.xx" # This may be the same as your `Web` server
role :db, "xx.xx.xx.xx", :primary => true # This is where Rails migrations will run

set :deploy_to, '/home/deployer/apps/your_app' # change the directory of project

set 'rails_env', :production

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

#server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------

# if you are deploying with ssh user
set :ssh_options, {
                    forward_agent: false,
                    auth_methods: %w(password),
                    password: '********', # change to your password
                    user: 'deployer',  # change to your server SSH user
                }

# if you are deploying to AWS

# set :ssh_options, {
#                     forward_agent: true,
#                     auth_methods: ["publickey"],
#                     keys: ["/path/of/your/pem_file/my_pem_file.pem"]
#                 }