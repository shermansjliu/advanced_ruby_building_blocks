test = [5, 2, 3 , 8, 10]

def bubble_sort (arr)
    switch = true
    while switch
        switch = false
        for i in (0...arr.length-1)
            if  arr[i] > arr[i+1]
                switch = true
                arr[i], arr[i+1] = arr[i+1], arr[i]
            end
        end
    end
    return arr
end


def bubble_sort_by(arr)
        switch = true
        while switch
            for i in (0...arr.length-1)
                result = yield([arr[i], arr[i+1]])
                if result > 0
                    arr[i], arr[i+1] = arr[i+1], arr[i]
                else
                    switch = false
                end
            end
        end
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
       left.length - right.length
   end
