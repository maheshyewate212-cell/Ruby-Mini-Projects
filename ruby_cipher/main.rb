require_relative 'lib/JournalEntry'
require_relative 'lib/vault_manager'

vault = VaultManager.new


loop do
  puts "\n=== CIPHER VAULT JOURNAL ==="
  puts "1. Add New Entry"
  puts "2. View All Entries"
  puts "3. Lock Vault (Encrypt All)"
  puts "4. Unlock Vault (Decrypt All)"
  puts "5. Filter Entries by Category"
  puts "6. View Analytics (Titles & Word Count)"
  puts "7. Exit"
  print "\nChoose an option (1-7): "

  choice = gets.chomp

  case choice
  when "1"
    # Prompt for Title, Content, and Category
    puts "Enter the title"
    title = gets.chomp
    puts "Enter the content "
    content = gets.chomp
    puts "Enter the category"
    category = gets.chomp

    entry = JournalEntry.new(title , content , category)
    vault.add_entry(entry)
    puts " Added Successfully ..."
    
  when "2"
   vault.display
  when "3"
   vault.lock_all!
   puts "All entries locked & encrypted using ROT13 cipher!"
  when "4"
   vault.unlock_all!
   puts "All entries unlocked & decrypted!"
  when "5"
    puts "Enter the category to filter by:"
    category_choice = gets.chomp
    filtered = vault.filter_by_category(category_choice)

    if filtered.empty?
    puts "No entries found in '#{category_choice}' category."
    else
     filtered.each do |entry|
      status = entry.is_encrypted ? "[Encrypted]" : "[Plain]"
      puts "ID: #{entry.id} | Title: #{entry.title} | Content: #{entry.content} | Status: #{status}"
     end
    end

  when "6"
  puts "\n--- Vault Analytics ---"
  puts "All Titles: #{vault.all_titles.join(', ')}"
  puts "Total Word Count: #{vault.total_word_count} words"
  when "7"
    puts "Goodbye!"
    break 
  else
    puts "Invalid choice! Please select 1-7."
  end
end