// Write a TypeScript program that declares a variable as a number and then tries to assign a string to it to see type checking in action.  

let tempNumber: number=12;
tempNumber= tempNumber + "HI.";

console.log("Error is : ", tempNumber);