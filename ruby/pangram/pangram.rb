class Pangram
    def self.pangram?(phrase)
        26 == phrase.
        downcase.
        chars.
        keep_if{|i| i =~ /[a-z]/}.
        uniq.
        length
    end
end 

module BookKeeping
    VERSION = 6
end