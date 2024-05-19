object Vec2 { x, y }
object Vec3 { x, y, z }
object Vec4 { x, y, z, w }

# Will be replaced by inport of math/stdlib 
(sqrt n) = n

Vec2.splat n = (Vec2 n n)
Vec3.splat n = (Vec3 n n n)
Vec4.splat n = (Vec4 n n n n)

# ( Vec -> Vec -> Vec ) arithmetic

Vec2.add (Vec2 x1 y1 ) (Vec2 x2 y2 ) = ( Vec2 (+ x1 x2) (+ y1 y2 ) )
Vec3.add (Vec3 x1 y1 z1) (Vec3 x2 y2 z2) = (Vec3 (+ x1 x2) (+ y1 y2) (+ z1 z2))
Vec4.add (Vec4 x1 y1 z1 w1) (Vec4 x2 y2 z2 w2) = (Vec4 (+ x1 x2) (+ y1 y2) (+ z1 z2) (+ w1 w2))

Vec2.sub (Vec2 x1 y1 ) (Vec2 x2 y2 ) = ( Vec2 (- x1 x2) (- y1 y2 ) )
Vec3.sub (Vec3 x1 y1 z1) (Vec3 x2 y2 z2) = (Vec3 (- x1 x2) (- y1 y2) (- z1 z2))
Vec4.sub (Vec4 x1 y1 z1 w1) (Vec4 x2 y2 z2 w2) = (Vec4 (- x1 x2) (- y1 y2) (- z1 z2) (- w1 w2))

Vec2.mul (Vec2 x1 y1 ) (Vec2 x2 y2 ) = (Vec2 (* x1 x2) (* y1 y2 ))
Vec3.mul (Vec3 x1 y1 z1) (Vec3 x2 y2 z2) = (Vec3 (* x1 x2) (* y1 y2) (* z1 z2))
Vec4.mul (Vec4 x1 y1 z1 w1) (Vec4 x2 y2 z2 w2) = (Vec4 (* x1 x2) (* y1 y2) (* z1 z2) (* w1 w2))

Vec2.div (Vec2 x1 y1 ) (Vec2 x2 y2 ) = ( Vec2 (/ x1 x2) (/ y1 y2 ) )
Vec3.div (Vec3 x1 y1 z1) (Vec3 x2 y2 z2) = (Vec3 (/ x1 x2) (/ y1 y2) (/ z1 z2))
Vec4.div (Vec4 x1 y1 z1 w1) (Vec4 x2 y2 z2 w2) = (Vec4 (/ x1 x2) (/ y1 y2) (/ z1 z2) (/ w1 w2))

# ( Vec -> f24 -> Vec ) arithmetic

Vec2.adds (Vec2 x y) scalar = (Vec2 (+ x scalar) (+ y scalar))
Vec3.adds (Vec3 x y z) scalar = (Vec3 (+ x scalar) (+ y scalar) (+ z scalar))
Vec4.adds (Vec4 x y z w) scalar = (Vec4 (+ x scalar) (+ y scalar) (+ z scalar) (+ w scalar))

Vec2.subs (Vec2 x y) scalar = (Vec2 (- x scalar) (- y scalar))
Vec3.subs (Vec3 x y z) scalar = (Vec3 (- x scalar) (- y scalar) (- z scalar))
Vec4.subs (Vec4 x y z w) scalar = (Vec4 (- x scalar) (- y scalar) (- z scalar) (- w scalar))

Vec2.muls (Vec2 x y) scalar = (Vec2 (* x scalar) (* y scalar))
Vec3.muls (Vec3 x y z) scalar = (Vec3 (* x scalar) (* y scalar) (* z scalar))
Vec4.muls (Vec4 x y z w) scalar = (Vec4 (* x scalar) (* y scalar) (* z scalar) (* w scalar))

Vec2.divs (Vec2 x y) scalar = (Vec2 (/ x scalar) (/ y scalar))
Vec3.divs (Vec3 x y z) scalar = (Vec3 (/ x scalar) (/ y scalar) (/ z scalar))
Vec4.divs (Vec4 x y z w) scalar = (Vec4 (/ x scalar) (/ y scalar) (/ z scalar) (/ w scalar))


# Will be updated if/when multi-arity arithmetic is possible o_0

Vec2.dot (Vec2 x1 y1) (Vec2 x2 y2) = 
  (+ (* x1 x2)
     (* y1 y2))
Vec3.dot (Vec3 x1 y1 z1) (Vec3 x2 y2 z2) = 
  (+ (+ (* x1 x2)
        (* y1 y2)) 
     (* z1 z2))
Vec4.dot (Vec4 x1 y1 z1 w1) (Vec4 x2 y2 z2 w2) =
  let x = (* x1 2)
  let y = (* y1 y2)
  let z = (* z1 z2)
  let w = (* w1 w2)
  (+ x (+ y (+ z w)))

cross a b c d = (- (* a b) (* c d))
Vec3.cross (Vec3 x1 y1 z1) (Vec3 x2 y2 z2) = 
  let x = (cross y1 z2 z1 y2)
  let y = (cross z1 x2 x1 z2)
  let z = (cross x1 y2 y1 x2)
  (Vec3 x y z)

Vec2.norm (Vec2 x y) = (sqrt (+ (* x x) (* y y)))
Vec3.norm (Vec3 x y z) = (sqrt (+ (+ (* x x) (* y y)) (* z z)))
Vec4.norm (Vec4 x y z w) = 
  let x = (* x x)
  let y = (* y y)
  let z = (* z z)
  let w = (* w w)
  let sum = (+ (+ x y) (+ z w))
  (sqrt sum)

Vec2.normalize vec =
  let mag = (Vec2.norm vec)
  if (== mag 0.0) {
    (Vec2 0.0 0.0)
  } else {
    match vec {
      Vec2: (Vec2 (/ vec.x mag) (/ vec.y mag))
    }
  }

Vec3.normalize vec = 
  let mag = (Vec3.norm vec)
  if (== mag 0) {
    (Vec3 0 0 0)    
  } else {
    match vec {
        Vec3: (Vec3 (/ vec.x mag) (/ vec.y mag) (/ vec.z mag))
    }
  }

vec4.norm vec = 
  let mag = (Vec4.norm vec)
  if (== mag 0.0) {
    (Vec4 0.0 0.0 0.0 0.0)
  } else {
    match vec {
        Vec4: (Vec4 (/ vec.x mag) (/ vec.y mag) (/ vec.z mag) (/ vec.w mag))
    }
  }

## Fails with "assertion failed: expo >= -63 && expo <= 63"
Main = ""
