fn init {
  println("init 1")
}

fn main {
  loc()
  let a = @fib.fib(10)
  let b = @fib.fib2(11)
  println("fib(10) = \(a), fib(11) = \(b)")

  println(@lib.hello())

  let x = if 1 == 2 {
    1
  } else {
    2
  }
  println("x=\(x)")
  loc(label="end")
}
