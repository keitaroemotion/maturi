



# read target file
def readFile(fileLocation)
    f = File.open(fileLocation, "r")
    f.each_line do |line|
      puts line
    end
    f.close
end


if ARGV.size == 0
    abort "you need argument"
end

readFile ARGV[0]


