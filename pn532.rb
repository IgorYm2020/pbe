require 'ruby-nfc'
require 'logger'



class Rfid

#return uid in hexa str

	def read_uid
		reader = NFC::Reader.all
		reader[0].poll(Mifare::Classic::Tag) do |tag|
		 
			uid = tag.uid_hex.upcase
			return uid

			
		end
	end
end

