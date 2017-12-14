def caesar_cipher_reloaded(phrase, shift)
	result = ""
	phrase.each_char do |letter|
		if(letter >= "A" and letter <= "Z")
			letter = ((letter.ord + shift%26))%("Z".ord)
			if(letter < "A".ord)
				result += ("A".ord+letter%"A".ord - 1).chr
			else
				result += letter.chr
			end
		elsif( letter >= "a" and letter <= "z" )
			letter = ((letter.ord + shift%26))%("z".ord)
			if(letter < "a".ord)
				result += ("a".ord+letter%"a".ord - 1).chr
			else
				result += letter.chr
			end
		else
			result += letter
		end
	end
	return result
end