/// the sum of the even integers in the range [i, j).
///
/// # Arguments
/// 
/// * `i` - This is a 32bit integer which is the start of the range
/// * `j` - This is a 32bit integer which is the end of the range (non inclusive)
/// # Return
/// 
/// * a 32bit integer which the sum of the even integers in the range [i, j).
///
/// # example
/// `sum_evens(0, 6) == 6`. (0 + 2 + 4)
///
pub fn sum_evens(i: i32, j: i32) -> i32 {
    unimplemented!();
}

/// Returns the Euclidean distance between two 2-dimensional points.
///
/// # Arguments
///
/// * `(ax, ay)` - This is a tuple of 64bit floats that is the first point
/// * `(bx, by)` - This is a tuple of 64bit floats that is the second point
///
/// # Return
///
/// * A 64bit float that is the eucledian distance b/w the points. 
///   i.e. ((ax - bx)*(ax - bx) + (ay - by)*(ay - by)
/// Returns the Euclidean distance between two 2-dimensional points.
/// The points are represented as 2-tuples of [f64]s.
///
/// # example
///
/// `distance((0.0, 0.0), (1.0, 1.0) == 1.414...`
pub fn distance((ax, ay): (f64, f64), (bx, by): (f64, f64)) -> f64 {
    unimplemented!();
}

/// `sum_squares(&[1, 2]) == 5 (1^2 + 2^2)`.
/// # Arguments
///
/// * `arr`  - an integer array
///
/// # Return
///
/// * An integer that is the sum of the elements squared
/// Returns the sum of the squared elements of arr.
///
/// # example
///
/// `sum_squares(&[1, 2]) == 5 (1^2 + 2^2)`.
pub fn sum_squares(arr: &[i32]) -> i32 {
    unimplemented!();
}

/// Adds 1 to each element of the array. (Mutates the array.)
///
/// # Arguments
///
/// * `arr`  - an integer array
/// # Return
/// Adds 1 to each element of the array. (Mutates the array.)
///
/// # example
///
/// `let mut arr: [i32; 3] = [0, 1, 2];`
/// `raise_1(&mut arr);`
/// `arr == [1, 2, 3]`
pub fn raise_1(arr: &mut [i32]) {
    unimplemented!();
}

// CHALLENGE PROBLEM 

/// Returns the max consecutive 1s in the array.
///
/// # Arguments
///
/// * `arr`  - an integer array
///
/// # Return
///
/// Returns the max consecutive 1s in the array.
///
/// # example
///
/// `consecutive_1s(&[1, 1, 1, 0, 1, 1]) == 3;`
/// `consecutive_1s(&[0, 1]) == 1;`
pub fn consecutive_1s(arr: &[i32]) -> i32 {
    unimplemented!();
}
