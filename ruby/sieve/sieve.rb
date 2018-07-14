class Sieve
    def initialize(n)
        @n = n
    end
    def primes
        result = []
        sieve = (2..@n).to_a
        while !sieve.empty?
            current = sieve.first
            sieve = sieve.select{|i| i % current != 0}
            result += [current]
        end
        result
    end
end

module BookKeeping
    VERSION = 1
end