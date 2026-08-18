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
    # Use @entries.map here
    @entries.map(&:title)
  end

  # 2. Filter entries by category
  def filter_by_category(target_category)
    # Use @entries.select here
    @entries.select {|entry| entry.category.downcase == target_category.downcase}
  end

  # 3. Categorize into a Hash
  def entries_by_category
    # Use @entries.group_by here
    @entries.group_by do |entry|
      entry.category
    end
  end

  # 4. Sum up total words in all entries
  def total_word_count
    @entries.reduce(0) do |sum, entry|
    sum + entry.content.split.size
    end
  end

end