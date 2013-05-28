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

puts "Deleting existing shirt options.."
sos = ShirtOption.all
sos.each { |so| so.destroy } if sos.present?

puts "Creating default shirt options...."
ShirtOption.create!(:name => "100% Cotton")
ShirtOption.create!(:name => "50/50 Blend")
ShirtOption.create!(:name => "Premium")
ShirtOption.create!(:name => "Tech Shirt")


puts "Deleting existing shirt sub options.."
ssos = ShirtSubOption.all
ssos.each { |so| so.destroy } if ssos.present?

puts "Creating default shirt sub options...."
ShirtSubOption.create!(:name => "Short Sleeve")
ShirtSubOption.create!(:name => "Long Sleeve")

puts "Deleting existing shirt colors.."
scs = ShirtColor.all
scs.each { |sc| sc.destroy } if scs.present?

puts "Creating default shirt colors...."
(0..17).each do
  ShirtColor.create!(:code => "%06x" % (rand * 0xffffff))
end


puts "Deleting existing shirt size categories.."
scs = SizeCategory.all
scs.each { |ss| ss.destroy } if scs.present?

puts "Creating default shirt Sizes Categories...."
%w(Youth Men Women).each do |c_name|
  SizeCategory.create!(:name => c_name)
end

puts "Deleting existing Size Option.."
scs = SizeOption.all
scs.each { |ss| ss.destroy } if scs.present?

puts "Creating default shirt Sizes Options...."
%w(S M L XL XXL).each do |name|
  SizeOption.create!(:name => name)
end

puts "Deleting existing ink color options.."
icos = InkColorOption.all
icos.each { |ico| ico.destroy } if icos.present?

puts "Creating default ink color options..."
%w(Front Back).each do |side|
  (1..10).each do |name|
    InkColorOption.create!(:name => name, :side => side)
  end
end

puts "Deleting existing charity categories.."
cgs = CharityCategory.all
cgs.each { |cg| cg.destroy } if cgs.present?

puts "Creating default Charity Categories...."
%w(Advocacy Arts Education Environment Health International Religion SocialService Youth).each do |name|
  CharityCategory.create!(:name => name)
end


