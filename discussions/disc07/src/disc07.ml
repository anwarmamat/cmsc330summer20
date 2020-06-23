type 'a lelist = Empty | Cons of 'a * int * 'a lelist

let rec map (f : 'a -> 'b) (lst : 'a lelist) : 'b lelist = 
  failwith "Implement Me!"

let rec foldl (f : 'a -> 'b -> 'a) (acc : 'a) (lst : 'b lelist) : 'a =
  failwith "Implement Me!"

let rec foldr (f : 'b -> 'a -> 'a)  (lst : 'b lelist) (acc : 'a) : 'a = 
  failwith "Implement Me!"

let find (p : 'a -> bool) (l : 'a lelist) : 'a option =
  failwith "Implement Me!"

let contains (l : 'a lelist) (e : 'a) : bool =
  failwith "Implement Me!"
