open Core.Std

let encode s = 
  let to_string c = function 
    | 1 -> String.of_char c
    | n -> Int.to_string n ^ String.of_char c in
  String.rev s
  |> String.to_list_rev
  |> List.group ~break:(<>)
  |> List.fold ~init:"" 
    ~f:(fun acc e -> acc ^ to_string (List.hd_exn e) (List.length e))

let decode s = 
  let generate n c = List.init n ~f:(fun _ -> c) |> String.of_char_list in
  String.fold s ~init:("", None)
    ~f:(fun (r, counter) c -> match (counter, Char.is_digit c) with
        | (None, true)
          -> (r, Some (Char.to_int c - Char.to_int '0'))
        | (None, false) -> (r ^ generate 1 c, None)
        | (Some n, true) 
          -> (r, Some (n * 10 + (Char.to_int c - Char.to_int '0')))
        | (Some n, false) -> (r ^ generate n c, None))
  |> fst
