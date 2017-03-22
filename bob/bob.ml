open Core.Std

let response_for message =
  let is_question = String.is_suffix ~suffix:"?" in
  let is_shouting s = 
    String.uppercase s = s 
    && List.fold (String.to_list_rev s) 
      ~init:false 
      ~f:(fun a c -> a || Char.is_alpha c) in
  match String.strip message with
  | "" -> "Fine. Be that way!"
  | m when is_shouting m -> "Whoa, chill out!"
  | m when is_question m ->  "Sure."
  | _ -> "Whatever."
