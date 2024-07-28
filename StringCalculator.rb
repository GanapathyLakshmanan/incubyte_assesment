class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        
    numbers.split(',').map(&:to_i).sum 
    end 
end 

calculator = StringCalculator.new 
puts calculator.add("")
puts calculator.add("1")
puts calculator.add("1,5")