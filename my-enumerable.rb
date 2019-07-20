module Enumerable
    def my_each
        i = 0
        while i < self.length
            yield(self[i])
            i += 1
        end
    end

    def my_each_with_index()
        index = 0
        for elem in self
            yield(self[index])
            index += 1
        end
    end

    def my_select()
        result = []
        self.my_each { |elem|
            if yield(elem)
                result << elem
            end
        }
    end

    def my_all?
        self.my_each { |element|
            if !yield(element)
                return false
            end
        }
        return true
    end

    def my_any?
        self.my_each { |elem|
            if yield(elem)
                return true
            end
        }
        return false
    end

    def my_none?
        for elem in self
            if yield(elem)
                return false
            end
        end
        return true
    end

    def my_count
        result = 0
        self.my_each do |el|
            if yield(el)
                result += 1
            end
        end

        return result
    end

    def my_map(*procs)
        result = []
        if procs.count == 0
            self.my_each {|elem|
                result << yield(elem)
            }
        else
            proc = procs[0]
            self.my_each(&proc)
        end
        return result
    end

    def my_inject(*start_num)
        result = 0
        if start_num.count == 0
            self.my_each {|num|
                result = yield(result, num)
            }
        return result
        else
            start_num = start_num[0]
            self.my_each {|num|
                start_num = yield(start_num, num)
            }
            return start_num
        end
    end
end

def multiply_els(_arr)
    result = 1
    for num in _arr
        result *= num
    end
    return result
end

proc = Proc.new  { |num|
    num * 2
}
a = [1,2,3,4]
puts a.my_map(&proc).inspect()
# puts a.my_each { |elem| elem += 1}.inspect()
