func calculateFibonacci(_ seedOne: Int, _ seedTwo: Int, _ incrementor: inout Int)-> Void {
   if incrementor == 0 {
       print(seedOne)
       print(seedTwo)
   } 
   
   if (incrementor < 90) {
       let incrementedValue = seedOne + seedTwo;  
       print(incrementedValue)
       incrementor = incrementor + 1;
       calculateFibonacci(seedTwo, incrementedValue, &incrementor)
   }
}

var initialCount = 0;
calculateFibonacci(1, 1, &initialCount)