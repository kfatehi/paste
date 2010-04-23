# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_paste_session',
  :secret      => '8aa40fcafad849b46b1db16c4bf4849c9812177384bfc801607afd25e060ec3e3177ef07b88322d53353fdd8408fea6acc0baa8c148f254e1865b0259bd11c34'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
