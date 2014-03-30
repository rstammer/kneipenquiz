# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

Kneipenquiz::Application.config.secret_key_base = ENV['SECRET_KEY_BASE'] || 'sdkflfjakjhkjfqahfq3487r19309134qeofjqlkj1394r134uk3jf134u1034riü4pkfkljf891744314r91304801834r'
