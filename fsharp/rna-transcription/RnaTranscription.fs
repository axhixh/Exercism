module RnaTranscription

let toRna(dna : string) : string = 
    let mapNucleotide n = 
        match n with
        | 'G' -> 'C'
        | 'C' -> 'G'
        | 'T' -> 'A'
        | 'A' -> 'U'
    dna.ToCharArray()
    |> Array.map mapNucleotide
    |> (fun c -> System.String c)