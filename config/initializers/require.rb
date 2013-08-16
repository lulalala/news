Dir[Rails.root.join("lib/init/*.rb")].each {|file| require file }
