class UserInterface
  attr_accessor :option
  def show()
    puts ' '
    puts '-------------- AWESOME CATALOG OF MY THINGS 📚 🎧 🎮 '
    puts ' '
    puts ' '
    puts '____________________________________________📚 📚 📘'
    puts '1️⃣  * List all books 📖'
    puts '2️⃣  * List all Labels ℹ 🏷'
    puts '3️⃣  * Add books ➕ 📘'
    puts ' '
    puts '____________________________________________🎧 🔊 🎷'
    puts '4️⃣  * List all Music ALbums 🎼'
    puts '5️⃣  * List all Genres 🎤'
    puts '6️⃣  * Add a music Album 🎧 '
    puts ' '
    puts '____________________________________________🎮 🎯 🎲'
    puts '7️⃣  * List of Games 🎮'
    puts '8️⃣  * List all authors 👤'
    puts '9️⃣  * Add a game ➕ 🎮'
    puts ' '
    puts '0️⃣  * Exit'
    puts ' '
    print '------------ 👉 Please enter a number  0️⃣  to  9️⃣  :'
    @option = gets.chomp.to_i
  end
end
