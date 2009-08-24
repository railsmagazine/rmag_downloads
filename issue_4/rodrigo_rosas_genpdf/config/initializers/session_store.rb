# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_artigo_session',
  :secret      => 'bb7c97406820ac03df28ec65a5edbedb50c77d28d0c20ef01867fb77879e530332049466f4fe40adae0a1401b0f297f9b5ece326911f61d3eee0b4540149a5b3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
