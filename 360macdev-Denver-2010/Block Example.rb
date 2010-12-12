framework 'Foundation'
require 'open-uri'
open('http://wordpress.org/extend/plugins/about/readme.txt') do |stream|
	text = stream.string
	text.enumerateLinesUsingBlock (Proc.new { |line, stop|
		puts "--> #{line}"
	})
end