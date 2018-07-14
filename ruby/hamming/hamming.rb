module BookKeeping
    VERSION = 3 # Where the version number matches the one in the test.
end

class Hamming
    def self.compute(n1, n2)
        raise ArgumentError, "length of nucleotide do not match" if n1.length != n2.length
        n1.length.times.count {|i| n1[i] != n2[i]}
    end
end
