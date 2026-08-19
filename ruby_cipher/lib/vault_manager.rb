class VaultManager
  def initialize
    @entries = []
  end

  def add_entry(entry)
    @entries << entry
  end

  def display 
    @entries.each do |entry|
      status = entry.is_encrypted ? "[Encrypted]" : "[Plain]"
      puts "ID: #{entry.id} | Title: #{entry.title} | Category: #{entry.category} | Status: #{status}"
      puts "Content: #{entry.content}"
      puts "-" * 40
    end
  end

  def lock_all!
    @entries.each do |entry|
      entry.encrypt! unless entry.is_encrypted
    end
  end

  def unlock_all!
    @entries.each do |entry|
      entry.decrypt! if entry.is_encrypted
    end
  end


  def all_titles
    @entries.map(&:title)
  end

  
  def filter_by_category(target_category)
    @entries.select {|entry| entry.category.downcase == target_category.downcase}
  end

  def entries_by_category
    @entries.group_by do |entry|
      entry.category
    end
  end

  def total_word_count
    @entries.reduce(0) do |sum, entry|
    sum + entry.content.split.size
    end
  end

end
