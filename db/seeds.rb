# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Deleting existing admin.."
admins = Admin.all
admins.each { |admin| admin.destroy } if admins.present?

puts "Creating default admin...."
admin = Admin.new(:email                 => "admin@obs.com",
                  :password              => "123456",
                  :password_confirmation => "123456"
)
admin.save!


puts "Deleting existing banners.."
banners = Banner.all
banners.each { |banner| banner.destroy } if banners.present?

puts "Creating default banners...."
Banner.create!(:content => "<h1><span>1 Billion</span> t-shirts are sold in the USA per year.</h1> <p>We have a simple concept that can change the world!</p>",
               :image   => File.new("doc/banners/illust_final0001.png")
)
Banner.create!(:content => "<h1>Our <span>Simple</span> Idea...</h1> <p>We will donate 25¢ per t-shirt to charity. All donations will be made to a charity of your choosing, in your name.</p>",
               :image   => File.new("doc/banners/illust_final0002.png")
)
Banner.create!(:content => "<h1>Let's <span>change</span> the world.</h1> <p>Through consumer awareness, we can all push through a change that can donate $250 Million per year to those that need it most.</p>",
               :image   => File.new("doc/banners/illust_final0003.png")
)
Banner.create!(:content => "<h1>This is how it <span>works...</span></h1> <p>If each customers demands 25¢ per shirt is donated to charity, we can change the world!</p>",
               :image   => File.new("doc/banners/illust_final0004.png")
)


puts "Deleting Participate Static Page"
p = Page.find_by_page_name("Participate")
p.destroy if p

puts "Creating Static Page for Participate"
Page.create(page_name:"Participate", page_content:"
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

puts "Creating Static Page for Facility"
Page.create(page_name:"Facility", page_content:"
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")


#puts "Deleting existing charity categories.."
#cgs = CharityCategory.all
#cgs.each { |cg| cg.destroy } if cgs.present?
#
#puts "Creating default Charity Categories...."
#%w(Advocacy Arts Education Environment Health International Religion SocialService Youth).each do |name|
#  CharityCategory.create!(:name => name)
#end






