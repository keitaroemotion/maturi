



# read target file
def readFile(fileLocation)
    records =  Array.new
    f = File.open(fileLocation, "r")
    f.each_line do |line|
      records.push line   
    end
    f.close
    return records
end


if ARGV.size == 0
    abort "you need argument"
end

puts readFile(ARGV[0])


