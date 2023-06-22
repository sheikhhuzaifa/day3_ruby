require 'csv'

class Randompassword
  attr_accessor :alphabet, :numbers, :symbol

  def input_data()
    puts("Enter the Alphabet length")
    @alphabet = gets().chomp.to_i
    puts("Enter the Number length")
    @numbers = gets().chomp.to_i
    puts("Enter the Symbols length")
    @symbol = gets().chomp.to_i

    while (@symbol <= 7 || @alphabet <= 7 || @numbers <= 7)
      puts("length is smaller or equal than 7")
      puts("Enter the Alphabet")
      @alphabet = gets().chomp.to_i
      puts("Enter the Numbers")
      @numbers = gets().chomp.to_i
      puts("Enter the Symbols")
      @symbol = gets().chomp.to_i
    end
  end

  def generate_password()
    all_alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
    all_number = ('0'..'9').to_a
    all_symbol = ('!'..'/').to_a + (':'..'@').to_a + ('['..'`').to_a + ('{'..'~').to_a

    rand_password = all_alphabet.sample(alphabet) + all_number.sample(numbers) + all_symbol.sample(symbol)
    return rand_password
  end

  def unique_password(rand_password)
    read = CSV.read("password.csv")

    if read.empty?
      CSV.open("password.csv", "a") do |csv|
        csv << ["Password"]
      end
    end

    CSV.foreach("password.csv") do |row|
      row.each do |column|
        if column.to_s == rand_password.to_s
          puts ("password already present in the csv file")
          return
        end
      end
    end

    CSV.open("password.csv", "a") do |csv|
      puts ("password updated successfully")
      csv << [rand_password]
    end
  end
end

obj = Randompassword.new
obj.input_data
rand_password = obj.generate_password
obj.unique_password(rand_password)
