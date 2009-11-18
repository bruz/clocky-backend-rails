# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_trivial_timer-rails_session',
  :secret      => 'ddcb18965dbeba76e9f4e4a6abb90431e244cb943242eff71c8b10bf93c6a415b5603d6ffdb583687736df369602379e0fa9e5588bbd793cfeb69d2f7775f008'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
