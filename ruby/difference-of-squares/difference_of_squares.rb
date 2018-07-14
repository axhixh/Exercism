class Squares
    def initialize(n)
        @n = n
    end
    def square_of_sum
        (1..@n).sum ** 2
    end
    def sum_of_squares
        (1..@n).sum{|i| i ** 2}
    end
    def difference
        self.square_of_sum - self.sum_of_squares
    end
end

module BookKeeping
    VERSION = 4 # Where the version number matches the one in the test.
end