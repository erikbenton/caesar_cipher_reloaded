require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do

	encrypted_word = ""
	if params["unencrypted_word"] && params["shift_number"]
		unencrypted_word = params["unencrypted_word"]
		shift_number = params["shift_number"].to_i
		encrypted_word = caesar_cipher_reloaded(unencrypted_word, shift_number)
	else
		encrypted_word = "Please enter valid word and shift number"
	end

	erb :index, :locals => {:unencrypted_word => unencrypted_word, :shift_number => shift_number, :encrypted_word => encrypted_word}

end


def caesar_cipher_reloaded(phrase, shift)
	result = ""
	phrase.each_char do |letter|
		if(letter >= "A" and letter <= "Z")
			letter = ((letter.ord + shift%26))%("Z".ord+1)
			if(letter < "A".ord)
				result += ("A".ord+letter).chr
			else
				result += letter.chr
			end
		elsif( letter >= "a" and letter <= "z" )
			letter = ((letter.ord + shift%26))%("z".ord+1)
			if(letter < "a".ord)
				result += ("a".ord+letter).chr
			else
				result += letter.chr
			end
		else
			result += letter
		end
	end
	return result
end