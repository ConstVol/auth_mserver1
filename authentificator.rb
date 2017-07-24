require 'jwt'
require 'bunny'
require 'json'
require './model/user'

conn = Bunny.new
conn.start

ch   = conn.create_channel
q = ch.queue("user")
sign_up = ch.topic 'sign_up'
table = ch.topic "table"
users = ch.topic "users"
q.bind()
begin
  puts " [*] Waiting fUCK. To exit press CTRL+C"
  q2.subscribe(:block => true) do |delivery_info, properties, body|
    puts " [x] Received #{body}"
    users = User.all
    ch.default_exchange.publish(users.to_json, :routing_key => q3.name)
  end
rescue Interrupt => _
  conn.close
  exit(0)
end

# begin
#   puts " [*] Waiting for messages. To exit press CTRL+C"
#   q.subscribe(:block => true) do |delivery_info, properties, body|
#     user_data = JSON.parse body
#     puts " [x] Received #{user_data}"
#     p user_data['email']
#     p user_data['password']
#     @user = User.create(email: user_data['email'], password: user_data['password'])
#   end
# rescue Interrupt => _
#   conn.close
#   exit(0)
# end


  #
  # def token email
  #   JWT.encode payload(email), JWT_SECRET, 'HS256'
  # end
  #
  # def payload email
  #   {
  #       exp: Time.now.to_i + 60 * 60,
  #       iat: Time.now.to_i,
  #       iss: JWT_ISSUER,
  #       user: {
  #           user_name: email
  #       }
  #   }
  # end
