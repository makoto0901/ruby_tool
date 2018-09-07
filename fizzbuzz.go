
package main

import "fmt"

func main() {
  num := 1;
  for 100 >= num {
    if num % 15 == 0 {
     fmt.Println("fizzbuzz")
    } else if num % 3 == 0 {
     fmt.Println("fizz")
    } else if num % 5 == 0 {
     fmt.Println("buzz")
    } else {
     fmt.Println(num)
    }
    num++
  }
}
