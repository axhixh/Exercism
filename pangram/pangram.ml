open Core.Std

let is_pangram s = 
    let s = String.lowercase s in
    "abcdefghijklmnopqrstuvwxyz" 
    |> String.fold ~init:true ~f:(fun acc c -> acc && String.contains s c)