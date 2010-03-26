# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_order-tracking_session',
  :secret      => '95ca6aa5e8e7529beafdec3b6a5340f1b502863b6794eccab6a55c700df2a58cf5e5f7dbea87997c9878bd9efbd3c3f01dd332871d480f44bbe152f7237be8fe'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
