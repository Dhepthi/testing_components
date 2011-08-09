# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_testing_webcomponents_session',
  :secret      => 'f3acfb047475d39da1bc12e28a5b1f282dca6e76bbbe598a6ad50807c1e7c6691ce29103eef03cfdf07ceaa28be8afed8dad107904458c00446174f9a262909f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
