require 'sqlite3'
require 'colorize'

class Bookmarks
  def self.browse()
    bookmark_dir = "/Users/keisugano/Library/Application Support/Firefox/Profiles/u0tbyzbw.default"
    dbpath = "#{bookmark_dir}/places.sqlite"
		db = SQLite3::Database.new(dbpath)

    records = db.execute("select distinct p.url, p.title from moz_places p join moz_bookmarks b where p.title=b.title group by b.title ")
		db.close

    execute records, getKeyword

  end
 
  def self.getKeyword()
    print "keyword: "
		return $stdin.gets.chomp
  end
 
  def self.matchesKeyword(record, keyword)
    begin
      return (record[0]+record[1]).include?(keyword)
    rescue
      return false
    end
  end

  def self.getLinkData(record)
		print "#{record[1].green} [open: y] [search: s]"
	  return $stdin.gets.chomp
  end

  def self.userRequestedOpeningLink(record)
		return getLinkData(record) 
  end

  def self.execute(records, keyword)
    records.each do |record|
			if (matchesKeyword(record, keyword)) 
        case userRequestedOpeningLink(record)
        when 'y'
				  	%x( open "#{record[0]}" )
				  	break
        when 's'
            execute(records, getKeyword())
            break 
        end
			end
		end
  end

end

