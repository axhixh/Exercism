open Core.Std

let response_for message =
  let is_question = String.is_suffix ~suffix:"?" in
  let is_shouting s = 
    String.uppercase s = s 
    && String.exists s ~f:Char.is_alpha in
  match String.strip message with
  | "" -> "Fine. Be that way!"
  | m when is_shouting m -> "Whoa, chill out!"
  | m when is_question m ->  "Sure."
  | _ -> "Whatever."
