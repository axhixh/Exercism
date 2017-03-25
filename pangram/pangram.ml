open Core.Std

let is_pangram s = 
    let s = String.lowercase s in
    "abcdefghijklmnopqrstuvwxyz" 
    |> String.for_all ~f:(String.contains s)