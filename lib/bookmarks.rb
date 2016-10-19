require 'sqlite3'
require 'colorize'

class Bookmarks
  def self.browse()
    bookmark_dir = "/Users/keisugano/Library/Application Support/Firefox/Profiles/u0tbyzbw.default"
    dbpath = "#{bookmark_dir}/places.sqlite"
		db = SQLite3::Database.new(dbpath)
		print "keyword: "
		keyword = $stdin.gets.chomp

    records = db.execute("select distinct p.url, p.title from moz_places p join moz_bookmarks b where p.title=b.title group by b.title ")
		db.close

		records.each do |results|
			if Inspector.matchesKeyword(results, keyword)
				print "#{results[1].green} [open: y] "
				if($stdin.gets.chomp == 'y')
					%x( open "#{results[0]}" )
					break
				end
			end
		end
  end
  

	
  def execute()

  end
end

