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

fn update_counter(~counter : Ref[Int] = default_counter) -> Int {
  counter.val = counter.val + 1
  counter.val
}