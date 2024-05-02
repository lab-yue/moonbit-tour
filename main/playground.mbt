let _2 = 2
let _3 = 3
let default_counter : Ref[Int] = { val: 0 }

fn init {
  println("init \(_2)")
}

fn init {
  println("init \(_3)")
}


fn init {
  println(
    #| Hello
    #| 1
    #| 2
    #| 3
  )
}

fn init {
  println(update_counter())
  let mut x = 0
  // Only toplevel functions can have labelled arguments.
  fn inc (label: String) {
    println("label=\(label) x=\(x)")
    match x {
      5 => return
      _ => x += 1
    }
    inc(label)
  }

  let q = fn () { inc("p") }
  let p = fn () { inc("q") } ()
  q()
  let label = "playground"
  loc(~label)
}

fn loc(~label: String = "default", ~loc : SourceLoc = _, ~args_loc : ArgsLoc = _) -> Unit  {
  println("[\(label)] loc of whole function call: \(loc)")
  println("[\(label)] loc of arguments: \(args_loc)")
}

fn update_counter(~counter : Ref[Int] = default_counter, ~_100 : Int = counter.val + 100) -> Int {
  println("counter + 100: \(_100)")
  counter.val = counter.val + 1
  counter.val
}

fn pack(a: Bool, b: Int, c: String, d: Double) -> (Bool, Int, String, Double) {
    (a, b, c, d)
}

fn init {
    let quad = pack(false, 100, "text", 3.14)
    let (bool_val, _a, _b, _c) = quad
    if bool_val == quad.0 {
      print("bool_val \(bool_val)")
    }
}

// type UserId Int
// type UserEmail String

struct User {
  mut id: Int
  name: String
  email: String
} derive(Debug)

fn init {
  let email = "john@doe.com"
  let u = { id: 0, name: "John Doe", email }
  u.id = 999
  println(u.id)
  debug(u)
}

// pub struct R1 {
//   x: Int
//   pub y: Int
//   priv z: Int
// }

// enum Relation {
//   Smaller
//   Greater
//   Equal
// }
