class Pattern

  def self.findMatch(rule, line, results, index, matches="matches:", excludes="excludes:")
    rsp = rule.split(' ')
    head = rsp[0]
    tail = rsp[1]
    if(head.start_with?(matches))
      keyword = head.gsub!(matches, "")
      if(tail.start_with?(excludes))
        if line.include?(tail.gsub!(excludes, ""))
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
		if rule.start_with?(lacks)
			kw = rule.gsub!(lacks, "").chomp
			if(!data.rawtext.include?(kw))
				arr.push "[lacks] #{kw.red}"
			end
		end
		return arr
	end

end
