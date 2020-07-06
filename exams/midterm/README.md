# CMSC330 Summer 2020  -- Midterm 1
Date: Thursday, 2 July 2020

## Q1. Programming Languages
(15 Points)

### [3pts] 1.
Excluding the `ref` type, in OCaml, can structural and physical equality be different? Explain your answer.


**Solution**: 

	Structural equality and physical equality are different in OCaml. 
	For two entities e1 and e2 if the contents are equal then they are structurally equal. (e1 = e2) 
	For two entities e1 and e2 if the memory addresses are equal. (e1 == e2) 

	`"hello" = "hello` returns true but `"hello" == "hello"` returns falls. 
	The two strings are structurally equal but physically different. 


### [3pts] 2.

In ruby, will `1.+(2)`  run? Explain why/why not.

**Solution**: 

	Yes, it will. 
	Everything in ruby is an object `+` is a method within the `Integer` object. 
	`1.+(2)` is making a call to `Integer#+`

### [3pts] 3.
What warnings can arise from `fun x1 x2 -> match (x1, x2) with (h1::t1, h2::t2) -> h1;;`
Explain what is the rationale behind these warnings.

**Solution**: 

	What warnings can arise from `fun x1 x2 -> match (x1, x2) with (h1::t1, h2::t2) -> h1;;`
	Explain what is the rationale behind these warnings.
	NonExhaustivePatternMatch warning. 
	The warning states that there are cases that are not matched such as the 
	`[],[]` case


### [3pts] 4.
List a difference between static and dynamic types. Illustrate this difference using a snippet of Ruby code.

**Solution**: 

	Static types: The types are checked at compile time.
	Dynamic types: The types are checked at run time. 

```ruby
a = 1
b = "b" 
a * b
```
This code runs but when we reach `a*b` we get an exception saying `TypeError: Cannot multiply an Integer and String` 

### [3pts] 5.
Is it possible to create a Finite Automata to check if it is possible to match all palindromes of size $$100$$ with $$\Sigma = \{a,b\}$$?
Explain why/why not.

**Solution**: 
	Yes. Because the number of palindromes are finite. 
	You can enumerate all of them as a large but
	  finite set thus you can construct an automata to match them individually.


---


## Q2. Regular Expressions
(12 points)

### [6pts] 1
Accepts any word where 3 vowels or 4 consonants occur in a row (input is only alphabetic characters). 
Hint: You do not need to enumerate every consonant. 

1. Example accepted: "q**uee**n"
1. Example accepted: "**rhyt**hm"
1. Example rejected: "hello"

**Solutions:**

`/[aeiouAEIOU]{3}|[^aeiouAEIOU]{4}/`


### [6pts] 2
Only accepts strings of names, defined as a first and last name (each at least 1 capital letter followed by any number of lowercase letters), followed by a student id which is 4 digits ranging from 0 to 2999, inclusive. Each entry will be separated by at least 1 space, with no leading or trailing spaces.
Additionally, should capture the last name and student id as `$1` and `$2`    respectively. 

1. Example accepted: `“Kalvin    Burks    0057”`
	- `$1 = “Burks”, $2 = “0057” `
1. Example rejected: `“hannah     Smith    1230”`

**Solutions:**
`/^[A-Z]+[a-z]*\s+([A-Z]+[a-z]*)\s+([0-2][0-9]{3})$/`

---


## Q3. Ruby Programming
(14 points)

Let’s say one day in the distant future,
  a friend of yours is curious about how much Ruby you have retained since taking CMSC330.
Your friend wants to test out your Ruby skills
  by having you process a text file that contains all of the classes you have taken thus far at UMD,
  as well as the corresponding grade for each class and
  the corresponding type of each class (Major Requirement or General Education).
The file you are processing has lines of the following form:

```
Class_Name/Final_Grade/Type_of_Class
```
For example:
```
CMSC131/89/MR
ENGL101/92/GE
MATH141/75/MR
HIST328R/83/GE
```
Class names must begin with 4 uppercase letters followed by 3 numbers followed by zero or 1 uppercase letter. Final grades will be an integer within the range 0-100, you can assume no preceding zeros. The type of the class will be denoted by either `“MR”` or `“GE”`. Each part of the line is separated by a forward slash (no spaces). You may assume all files are well-formed, following this format precisely.

### [7pts] `addClasses`
Implement `addClasses`, which will open the file called `"data.txt"` and 
  process each of the lines by storing the relevant pieces of information in a data structure(s) of your choosing.
You may find it useful to reference the IO class. Please copy the starter code to your answer.

```ruby
def addClasses
     #your code here
end
```

```ruby
@majors = {}
@geneds = {}
def addClasses
  IO.foreach(“data.txt”) do |line|
    line =~ /([A-Z]{4}[0-9]{3}[A-Z]?)\/(100|[0-9]{1,2})\/(MR|GE)/
  
    If ( $3 == “MR”) then 
    	@majors[$1] = $2.to_i
    else 
    	@geneds[$1] = $2.to_i
    end
  end
end
```



### [7pts] `averages`
Implement averages which returns an Array of Integers with two elements,
  the first element being the average grade for your major classes,
  and the second element being the average grade for your gened classes. 


Using the example file from above as a reference, averages would output the following array: `[82, 87]`.
In other words, an average of 82 for Major Requirement classes 
  and an average of 87 for General Education classes.

Please copy the starter code to your answer. 
```ruby
def averages 
    #your code here
end
```

```ruby
def averages
  toReturn = []
  majorGrades = @major.values
  genedGrades = @geneds.values

  toReturn[0] = (majorGrades.sum) / (majorGrades.size)   
  toReturn[1] = (genedGrades.sum) / (genedGrades.size)   

  toReturn
end
```

---


## Q4. OCaml Typing
(15 points)

### [3pts] 1.
Write an expression with the following type
`string * int list -> (int -> int) -> string`

**Solution:**
```ocaml 
fun (s, lst) f -> 
  let _ = (f 1) :: lst in 
  let _ = s = "hello" in 
  s
```


### [3pts] 2.
Write an expression with the following type:
 `string -> (string -> int) -> bool`

 ```ocaml
 fun s f -> 
   let _ = s <> "hi" in 
   let _ = 1 + (f s) in
   true
```


### [3pts] 3.
Write an expression with the following type:
 `(int -> int) list`

 ```ocaml
   [fun x -> x + 1]
```


### [3pts] 4.
The following function does not match their expected typing,
edit the functions so that they match the types provided.
You may not edit the function header, only the function body.
 `(int -> int -> bool) -> int -> bool`
```ocaml
let func f x = let b = (f (x +. 2.0) 10) in b
```

```ocaml
let func f x = let b = (f (x + 2) 10) in not b
```

### [3pts] 5.
Complete the function `foo` such that type of `foo` matches 
 `(float * 'a) -> ('a -> float) -> float`
```ocaml
  let foo (a, b) f = 
```

```ocaml
let foo (a,b) =
  fun f -> a +. (f b)
```


---


## Q5. OCaml execution

What do the following ocaml expressions return or print out? 
If an exception/error is thrown what is the exception?
## 1. foo
```ocaml
let rec foo v n = 
  if n < 0 then 
    v 
  else 
    (foo v (n-1)) * (foo v (n-1))
in
List.fold_left foo 0 [-5; 100; 90; -1; -2];;
```

	foo returns 0, and thus the statement returns 0.
## 2. f
`f` is a function of type `'a * 'a -> 'a` that returns the minimum of a tuple of two elements (e.g. `f (1,3) = 1` and `f ("apple", "zebra") = "apple"`
```ocaml
let q param =
	1.0 +. match param with
	       | [] -> 0.0
	       | h::t -> f h
	in q [2.0, 6.9];;
```

	 f h returns 2.0, 1.0 +. 2.0 = 3.0 

## 3. eq
`eq` is a function of type `'a -> 'a -> bool` that checks whether or not its two arguments are structurally equal (e.g. `eq 330 330 = true`, `eq “cmsc” “cmsc” = true`)

```ocaml
let rec foo lst a cmp =
	match lst with
	| [] -> []
	| h::t when (cmp a h) -> a :: h :: t
	| h::t -> h :: foo t a cmp
	in foo [131;216;351;457;330;451] 330 eq;;
```

	[131;216;351;457;330;330;451]

---


## Q6. OCaml Programming
(16 points)
For the below questions, you may use the following functions: 

- `let rec map f l = match l with [ ] -> [ ] | h :: t -> (f h) :: (map f t)`

- `let rec fold_left f ac l = match l with [ ] -> ac | h :: t -> fold_left f (f ac h) t`

- `let rec fold_right f l ac = match l with [ ] -> ac | h :: t -> f h (fold_right f t ac)`

### [8pts] 1. `count_even_odd_sum`
For this function, you MAY NOT use the rec keyword.
 You may use `map` and `fold_left` and `fold_right`.
Write the function `count_even_odd_sum : (int * int) list -> (int * int)`.
This function returns a tuple where the first element is the number of tuples in the list such that the sum of their elements is even, the second element is the number of tuples in the list whose sum is odd.

Example: 
- `count_even_odd_sum [(1,1); (1;2)] = (1,1)`
- `count_even_odd_sum [(1,1); (1;1)] = (1,0)`

**Solution:**
```ocaml
let count_even_odd_sum lst =
  (fold_left
    (fun (even, odd) x ->
      if (x mod 2) = 0 then 
	      (even + 1, odd) 
	      else 
		      (even, odd + 1)) 
    (0,0) (map (fun (a,b) -> a + b) lst));; 
```

### [8pts] 2. `in_330`
Recall the definition of an `atree`

```ocaml
type 'a atree =
    Leaf
  | Node of 'a * 'a atree * 'a atree
```
Refer to the following definition for `student` which stores a student’s id and a list of their courses.

```ocaml
type student = Student of int * string list
```

Example: `let jd = Student (42, [“CMSC330”; “ENGL466”]);;`

Write the function 
```ocaml
in_330 : student atree -> int -> bool option
```
If the student is in the tree return a `Some` of whether the student is enrolled in CMSC330 or not.
If the student is not in the tree the function should return `None`.
Assume no two students have the same id, and that atree is a BST sorted by the students’ ages.

Example

- `in_330 2 (Node (Student (2, ["ENGL101"]), Leaf, Leaf) = Some false`
- `in_330 2 (Node (Student (2, ["CMSC330"]), Leaf, Leaf) = Some true`
- `in_330 1 (Node (Student (2, ["ENGL101"]), Leaf, Leaf) = None`


Note: You may use `map`, `fold_left` and `fold_right`defined above. 

```
let rec in_330  (tree : student atree) (id : int) : bool option = 
```

**Solution:**

```ocaml
let rec in_330  (tree : student atree) (id : int) : bool option = 
match tree with
| Leaf -> None
| Node (Student (i, courses), l, r) when i = id ->
   Some (fold_left (fun acc s -> (s = "CMSC330") || acc) false courses) 
| Node (Student (i, courses), l, r) -> if (id < i) then in_330 l id else in_330 r id;;

```

---


## Q7. Finite Automata
(16 points)
For the following questions are graded correctly you need to ensure that you follow the syntax described below: 
This NFA 

![F.A. Example](imgs/faex.png)

is represented like this:

```
States: 1,2,3
Start: 1
Final: 2,3
Transitions:
(1, "0", 3)
(1, "1", 2)
(2, "0", 1)
(3, "1", 2)
(3, "1", 3) 
```

### [5pts] 1. Evens    
Construct an NFA over $$\Sigma = \{0,1\}$$ such that if the input binary number is an even number then the automata should accept the string. 
Otherwise, it should reject the string. 
If you cannot construct the automata state why.
(hint: if a binary number ends with $$0$$, it is an even number)

Example: 

1. accepted: 1000
1. rejected: 1001

**Solutions:**

```
States: 1, 2
Start: 1
Final: 2
Transitions:
(1, "1", 1) 
(1, "0", 2)
(2, "1", 1)
(2, "0", 2)
```

### [5pts] 3. accept
Does the NFA accept the given inputs

![fa-accept.png](imgs/fa-acc.png)

X Marks the solutions

	[X] 0101011100
	[ ] 1100111011
	[X] 01010111
	[X] 01000100
	[ ] 100010100
