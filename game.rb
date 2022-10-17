class CPU
  def initialize
    @range = [1, 2, 3, 4, 5, 6]
    @combinations = @range.repeated_combination(4).to_a
  end

  def combination
    @combinations[rand(1..126)]
  end
end

public

def check_matches(user, cpu)
  @new_arr = []
  4.times do |i|
    if cpu[i] == user [i]
      @new_arr.push('x')
      user.delete_at(user.index(user[i]))
    elsif cpu.include?(user[i - 1])
      @new_arr.push('o')
      next
    end
  end
  @new_arr.join
end

cpu = CPU.new
cpu_combination = cpu.combination
results = ''

# p cpu_combination

12.times do |i|
  puts 'Please enter your guess'
  user_input = gets.chomp.split('')

  until user_input.length == 4
    puts 'Please enter a 4 digits guess'
    user_input = gets.chomp.split('')
  end

  user_input.map! {|number| number.to_i}

  if cpu_combination == user_input
    puts 'Win'
    break
  else
    p results.check_matches(user_input, cpu_combination)
  end

  if i == 12
    puts 'You have failed'
  else
    puts "Try ##{i + 1}, #{12 - (i + 1)} remaining"
  end
end
