(** solution using map *)
open Core.Std

module M = Int.Map

type school = string list M.t 

(** Create a new empty school *)
let create () = M.empty 

(** Add a student to a school *)
let add name g school = M.add_multi school ~key:g ~data:name

(** Get all the students from a grade *)
let grade g school = Option.value ~default:[] (M.find school g) 

(** Sort the list of students in a grade, if necessary *)
let sort school = M.map school ~f:(List.sort ~cmp:String.compare)

(** Return the list of grades and students as a map *)
let to_map school = school
