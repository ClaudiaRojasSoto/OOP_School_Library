require_relative 'app'

ACTIONS = {
  1 => :list_books,
  2 => :list_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_rentals_for_person,
  7 => :exit_app
}.freeze

def display_menu
  puts "\nPlease choose an option:"
  ACTIONS.each { |key, value| puts "#{key} - #{value.to_s.tr('_', ' ')}" }
  print 'Option: '
  gets.chomp.to_i
end

def handle_option(app, option)
  action = ACTIONS[option]
  if action
    app.send(action)
  else
    puts 'Invalid option. Please try again.'
  end
end

def main
  app = App.new

  loop do
    option = display_menu
    handle_option(app, option)
  end
end

main
