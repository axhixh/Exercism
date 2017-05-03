open Core.Std

let index = ref (-1)

let robot_db = 
  let a = Array.init (26 * 26 * 1000) ~f:(fun i -> ref i) in
  Array.permute a;
  a

type robot = int

(* because the basic tests and unique tests run one after another
   and hence create more than 26 * 26 * 10 * 10 * 10 robots
   we recycle to reuse the robots created during basic test *)
let new_robot () = index := !index + 1;  !index % (Array.length robot_db)

let name robot = 
  let as_char a = a + Char.to_int 'A'  |> Char.of_int_exn in
  let n = !(robot_db.(robot)) in
  let digits= n % 1000 in
  let letters = n / 1000 in
  let c1 = as_char (letters / 26) and c2 = as_char (letters % 26) in
  sprintf "%c%c%03d" c1 c2 digits

(* when robot name is reset; it is available for other robots to use *)
let reset robot = 
    let n = Array.length robot_db - 1 in
    let old_name = !(robot_db.(robot))
    and new_name = !(robot_db.(n)) in
    robot_db.(robot) := new_name;
    robot_db.(n) := old_name