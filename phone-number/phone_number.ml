open Core.Std

let to_list s = 
  let is_valid h = h = '.' || h = '(' || h = ')' || h = '-' || h = ' ' in
  let rec aux acc = function
    | [] -> Some acc
    | h::tl when Char.is_digit h -> aux (h :: acc) tl
    | h::tl when is_valid h -> aux acc tl
    | _ -> None
  in
  aux [] (String.to_list_rev s)

let adjust_for_1 = function
  | Some (h::tl) when h = '1' && List.length tl = 10 -> Some tl
  | x -> x

let check_length = function 
  | Some x when List.length x = 10 -> Some x
  | _ -> None 

let number s = to_list s 
               |> adjust_for_1 
               |> check_length  
               |> Option.value_map ~default:None 
                 ~f:(fun x -> Some (String.of_char_list x))
