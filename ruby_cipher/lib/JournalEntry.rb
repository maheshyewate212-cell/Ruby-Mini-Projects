class JournalEntry

  attr_reader :id , :is_encrypted
  attr_accessor :title , :category , :content

  ALPHABET = "A-Za-z"
  ROT13_SHIFT = "N-ZA-Mn-za-m"
  @@entry_counter = 0

  def initialize ( title , content ,  category= "General" )
    @@entry_counter+=1
    @id = @@entry_counter
    @title = title
    @category = category
    @content = content
    @is_encrypted = false
  end

  def self.total_entries
    @@entry_counter
  end

  def encrypt!
    raise "Already encrypted " if @is_encrypted 

    @content= @content.tr(ALPHABET , ROT13_SHIFT)
    @is_encrypted = true
  end

  def decrypt!
    raise "Already Decrypted " unless @is_encrypted

    @content= @content.tr( ROT13_SHIFT,  ALPHABET)
    @is_encrypted = false
  end

end