class Complement
    def self.of_dna(dna)
        rna = ""
        dna.each_char do |c|
            case c
            when 'G' then rna += 'C'
            when 'C' then rna += 'G'
            when 'T' then rna += 'A'
            when 'A' then rna += 'U'
            else return ''
            end
        end
        rna
    end
end

module BookKeeping
    VERSION = 4
end
