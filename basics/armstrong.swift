 func isArmstrong(_ value : inout Int) -> Bool {  
    var answer = 0; 
    var remainder : Int;
    let temp = value;  
    while( value > 0)  {  
        remainder = value % 10;  
        value = value / 10;  
        answer = answer + (remainder * remainder * remainder);  
    }
    
    return temp == answer;
   
   }
   
    var number  = 371;
   
    if isArmstrong(&number) {
        print("armstrong number"); 
    }
    else {  
        print("Not armstrong number");
    }