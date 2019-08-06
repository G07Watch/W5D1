class Array
    def my_each(&prc)
        prc ||= Proc.new {|ele| p ele }
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        selection = []
        self.my_each {|ele| selection << ele if prc.call(ele) }
        selection
    end

    def my_reject(&prc)
        selection = []
        self.my_each {|ele| selection << ele if !prc.call(ele) }
        selection
    end

    def my_any?(&prc)
        self.my_each {|ele| return true if prc.call(ele)}
        false
    end

    def my_all?(&prc)
        self.my_each {|ele|return false if !prc.call(ele)}
        true
    end

    def my_flatten
         return [self] if !self.is_a?(Array)
        flatten = []

        self.my_each do |ele|
            if ele.is_a?(Array)
                flatten + ele.my_flatten
            else
               flatten << ele
            end
        end
        flatten
    end

    def my_zip(*optional)  # optional =  [arg1, arg2,]
        zip = Array.new()        #arg1 = *[1,2,3]  = 1, 2, 3
        i = 0

        self.my_each do |ele|
            array = []
            array << ele
            optional.my_each do |subarr|
               array <<  subarr[i] 
            end
            zip << array
            i += 1
        end
        zip  
    end

    def my_rotate(optional = 1)

        if optional > 0
            optional.times do 
                first = self.shift
                self << first
            end
        else
            (-optional).times do 
                last = self.pop
                self.unshift(last)
            end
        end
        self
    end

    def my_join(separator = "")
        new_string = ""
        (0...self.length).each do |i|
            ele = self[i]
            if i == self.length-1
                new_string += ele
            else 
                new_string += ele + separator
            end
        end
        new_string
    end

    def my_reverse
        return self if self.length == 1
        ele = [self.shift] 
        self[0..-1].my_reverse + ele
    end
end

# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
#     # => 1
#     #  2
#     #  3
#     #  1
#     #  2
#     #  3
# p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []



# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]



# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

