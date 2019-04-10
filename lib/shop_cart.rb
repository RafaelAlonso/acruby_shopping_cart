CART = []
ITENS = [
  {desc: "arroz", value: 3},
  {desc: "feijão", value: 2},
  {desc: "macarrão", value: 1},
  {desc: "café", value: 10},
  {desc: "bacon", value: 5},
]

def print_opts
  puts "1 - Buy a new item"
  puts "2 - Remove an item from the cart"
  puts "3 - See your shopping cart"
  puts "4 - Finish your purchase"
end

def route_opt(opt)
  system "clear" or system "cls"
  case opt
  when 1
    puts "What would you like to buy?"
    print_item_list
    item = ITENS[gets.chomp.to_i - 1]
    puts "How many?"
    qty = gets.chomp.to_i
    return if qty.zero?
    item[:qty] = qty
    CART << item
  when 2
    puts "Oh, what did you buy by mistake?"
    print_shopping_cart
    item_ind = gets.chomp.to_i - 1
    CART.delete_at(item_ind)
  when 3
    print_shopping_cart
  when 4
    finish_purchase
    puts "Thanks and come again!"
  else
    puts "Sorry, we didn't understand your option"
  end
end

def print_item_list
  puts "==================== IN STOCK ====================="
  ITENS.each_with_index do |item, ind|
    puts "#{ind + 1} - #{item[:desc]}: $#{item[:value]}"
  end
  puts "====================================================="
end

def print_shopping_cart
  puts "================== SHOPPING CART =================="
  CART.each_with_index do |item, ind|
    puts "#{ind + 1} - #{item[:qty]}x #{item[:desc]} ($#{item[:value]} cada)"
  end
  puts "==================================================="
end

def finish_purchase
  total = CART.map {|item| item[:value] * item[:qty] }.sum
  print_shopping_cart
  puts "TOTAL: $#{total}"
end

puts "=========== Welcome to the Ruby shopping ==========="

loop do
  puts "What do you want to do now?"
  print_opts

  opt = gets.chomp.to_i

  route_opt(opt)

  break if (opt == 4)
end
