



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

def findMatchedResults(records, pattern)
    results = Array.new
    records.each do |record|
        if(record.include? pattern)
            results.push record
        end
    end
    return results
end


if ARGV.size == 0
    abort "you need argument"
end

puts findMatchedResults(fileToArray(ARGV[0]), "spring")


