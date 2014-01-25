# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '4d6f929ea0217deccde64809c154c7b649f37d6a9c2e8836056d32c25a275b8db2bd6654d3fd7cc5a2d5257dc7ccca77bf2b87338ed7f8f62b45cf2b12e59eda'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    #Use the existing token.
    File.read(token_file).chomp
  else
    #Generate a new token and store it in token_file
    token = Securerandom.hex(64)
    File.write(token_file,token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token
