
open Core.Std

let split s = s 
              |> String.fold ~init:([], "") 
                ~f:(fun (l,w) c -> match c with
                    | c when Char.is_digit c || Char.is_alpha c || c = '\'' -> 
                      (l, w ^ String.of_char c)
                    | _ -> let w = String.strip ~drop:((=) '\'') w in
                      let w' = if w <> "" then w::l else l in 
                      (w', ""))
              |> (fun (l, w) -> if w <> "" then w :: l else l)

let word_count s = 
  let inc m s = String.Map.update m s ~f:(function
      | None ->  1
      | Some v -> v + 1) in
  String.lowercase s
  |> split
  |> List.fold ~init:String.Map.empty ~f:inc

