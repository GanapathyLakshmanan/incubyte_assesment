class NegativeNumberError < StandardError;
end
class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        
    delimiter = /,|\n/ 
        if numbers.start_with?("//")
            delimiter_line, numbers = numbers.split("\n",2)
            delimiter = Regexp.escape(delimiter_line[2..-1])
            delimiter = /#{delimiter}/
        end 
    
    number_list = numbers.split(delimiter).map(&:to_i)
    negative_numbers=number_list.select { |num| num < 0 }
    
    unless negative_numbers.empty?
        raise NegativeNumberError, "negative numbers not allowed #{negative_numbers.join(',')}"
    end 
    
    number_list.sum
    end 
end 

calculator = StringCalculator.new 
begin 
puts calculator.add("")
puts calculator.add("1")
puts calculator.add("1,5")
puts calculator.add("1,5,3,4")
puts calculator.add("10,50,30,400")
puts calculator.add("1\n2,3")
puts calculator.add("//;\n1;2")
puts calculator.add("1,-2,3,-4")


rescue NegativeNumberError => e 
    puts e.message
end 