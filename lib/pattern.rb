class Pattern

  Struct.new("Tokens", :head, :tail)

  def self.tokenize(rule)
    rsp = rule.split(' ')
    return Struct::Tokens.new(rsp[0], rsp[1])
  end

  def self.trimWord(text, keyword)
    return text.gsub!(keyword, "").chomp
  end

  def self.findMatch(rule, line, results, index, matches="matches:", excludes="excludes:")
    rules = tokenize(rule)
    if(rules.head.start_with?(matches))
      keyword = trimWord(rules.head, matches)
      if(rules.tail.start_with?(excludes))
        if line.include?(rules.tail.gsub!(excludes, ""))
          return results  
        end 
      end
      if(line.include?(keyword))
        return results.push("[incorrect]\n  Term:#{keyword.red} \n  Line: #{index.to_s.green} \n  本文:" + line.gsub!(keyword, keyword).yellow)
      end 
    end
    return results
  end

	def self.findAbsentWord(arr, rule, data, lacks="lacks:")
    rules = tokenize(rule)
		if rules.head.start_with?(lacks)
			kw = trimWord(rule, lacks)
			if(!data.rawtext.include?(kw))
				arr.push "[lacks] #{kw.red}"
			end
		end
		return arr
	end

end
