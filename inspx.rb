



# read target file
def fileToArray(fileLocation)
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

puts fileToArray(ARGV[0])


