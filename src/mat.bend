#use vec 
#use math

object Mat2 { r1, r2 }
object Mat3 { r1, r2, r3 }
object Mat4 { r1, r2, r3, r4 }

Mat2.determinant (Mat2 (Vec2 a b) (Vec2 c d)) = 
  (- (* a c)
     (* b d))

Mat3.determinant (Mat3 (Vec3 a b c) 
                        (Vec3 d e f) 
                        (Vec3 g h i)) =
  (* -1.0 
      (+ (* a 
          (- (* e i) 
          (* f h)))
         (+ (* (* -1.0 b) 
               (- (* d i) 
                  (* f g)))
            (* c 
               (- (* d h) 
                  (* e g))))))  

# NOTE: (@faycarsons) syntax error here? all parens seem to be matched up
# Mat4.determinant (Mat4 (Vec4 a11 a12 a13 a14) 
#                       (Vec4 a21 a22 a23 a24) 
#                       (Vec4 a31 a32 a33 a34) 
#                       (Vec4 a41 a42 a43 a44)) =
#  (+ (- (* a11 (Mat3.determinant (Mat3 (Vec3 a22 a23 a24) 
#                                       (Vec3 a32 a33 a34) 
#                                       (Vec3 a42 a43 a44))))
#        (* a12 (Mat3.determinant (Mat3 (Vec3 a21 a23 a24) 
#                                       (Vec3 a31 a33 a34) 
#                                       (Vec3 a41 a43 a44)))))
#     (+ (- (* a13 (Mat3.determinant (Mat3 (Vec3 a21 a22 a24) 
#                                          (Vec3 a31 a32 a34) 
#                                          (Vec3 a41 a42 a44)))))
#        (* a14 (Mat3.determinant (Mat3 (Vec3 a21 a22 a23) 
#                                       (Vec3 a31 a32 a33) 
#                                       (Vec3 a41 a42 a43)))))) 
