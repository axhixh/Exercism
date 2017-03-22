(** solution using map *)
open Core.Std

module M = Int.Map

type school = string list M.t 

(** Create a new empty school *)
let create () = M.empty 

(** Add a student to a school *)
let add name g school = 
  let names = match M.find school g with
  | None -> [name]
  | Some n -> name :: n in
  M.add school ~key:g ~data:names

(** Get all the students from a grade *)
let grade g school = 
  match M.find school g with
  |None -> []
  |Some names -> names

(** Sort the list of students in a grade, if necessary *)
let sort school = M.map school ~f:(fun n -> List.sort n ~cmp:(fun l r -> String.compare l r))

(** Return the list of grades and students as a map *)
let to_map school = school
