# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# encoding: utf-8

require 'iconv'
Emoticon.delete_all	
puts "Importing emoticons..."

# file = Dir.glob(Rails.root.join("Emoji.txt"))

ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
open(Rails.root.join("Emoji.txt"), 'UTF-8') do |file|

	file.read.each_line do |item|
		keycap, unicode, name = item.force_encoding('iso-8859-1').chomp.split(",")
		# keycap = keycap.split("//").in_groups_of(2).map(&:last)
		# unicode = unicode.split("//").in_groups_of(2).map(&:last)
		# name = name.split("//").in_groups_of(2).map(&:last)

		puts keycap.force_encoding('UTF-8')+"\t"+keycap.length.to_s+"\t"+name


	end


end

# .force_encoding('UTF-8')
# Emoticon.delete_all	
# puts "Importing emoticons..."
# open(Rails.root.join("Emoji.txt"), headers: true, encoding: "r:ISO8859-1") do |emoticons|
#   emoticons.read.each_line do |emoticon|
#     keycap, unicode, name = emoticon.chomp.split(",")
#     Emoticon.create!(:keycap => keycap, :unicode => unicode, :name => name)
#   end
# end