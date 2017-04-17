open Core.Std

let encode s = 
  let to_string c = function 
    | 1 -> String.of_char c
    | n -> Int.to_string n ^ String.of_char c in
  String.rev s
  |> String.to_list_rev
  |> List.group ~break:(<>)
  |> List.fold ~init:"" 
    ~f:(fun acc e -> acc ^ to_string 
                       (Option.value ~default:' ' (List.hd e))
                       (List.length e))

let decode s = 
  let generate n c = List.init n ~f:(fun _ -> c) |> String.of_char_list in
  String.fold s ~init:("", None)
    ~f:(fun (r, counter) c -> match counter with
        | None when Char.is_digit c 
          -> (r, Some (Char.to_int c - Char.to_int '0'))
        | None -> (r ^ generate 1 c, None)
        | Some n when Char.is_digit c 
          -> (r, Some (n * 10 + (Char.to_int c - Char.to_int '0')))
        | Some n -> (r ^ generate n c, None))
  |> fst
