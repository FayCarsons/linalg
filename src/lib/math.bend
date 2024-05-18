# To be replaced by stdlib eventually?

EPSILON = 0.00000000001

(abs n) = 
  if (< n 0.0) {
      (* n -1.0)
  } else {
      n
  }

(sqrt_iter n guess) = 
  if (< (abs (- (* guess guess) n)) EPSILON) { guess }
  else { (sqrt_iter n (/ (/ (+ guess n) guess) 2.0))}

(sqrt n) = (sqrt_iter n (/ n +2.0))
