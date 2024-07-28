class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        
    delimiter = /,|\n/ 
        if numbers.start_with?("//")
            delimiter_line, numbers = numbers.split("\n",2)
            delimiter = Regexp.escape(delimiter_line[2..-1])
        end 
        
    numbers.split(/#{delimiter}/).map(&:to_i).sum 
    end 
end 

calculator = StringCalculator.new 
puts calculator.add("")
puts calculator.add("1")
puts calculator.add("1,5")
puts calculator.add("1,5,3,4")
puts calculator.add("10,50,30,400")
puts calculator.add("1\n2,3")
puts calculator.add("//;\n1;2")