# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# categories = %w(news guide ad promotion review)
# categories.each{|c| Category.create(name: c)}
#

Build.create(
 user_id: 1,
 b_type: "mid",
 name: "klinker's build",
 spec: "GA-Z97X-UD7 TH / i7 4790K / 32GB / GTX 770 / 10.9.4",
 mb: "Gigabyte GA-P55A-UD3 rev. 1 Bios F11",
 cpu: "Intel Core i5 750 2,66Ghz overclocked @ 3,66Ghz/183x20",
 gpu: "Gigabyte GTX560Ti 1GB Superoverclock GV-N560SO-1GI-950",
 ram: "2x2GB + 2x4GB DDR3 Kingston HyperX Blue 1600Mhz overclocked @ 1830Mhz",
 disk: "Samsung 840 Basic 120GB (OSX ML System)",
 chassis: "",
 cost: "500",
 os: "10.9.4 Mavericks",
 im: "Unibeast",
 status: "success",
 body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." )
