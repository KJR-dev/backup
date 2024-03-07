// Write a TypeScript program that declares variables using let, const, and var. Then, describe how each declaration type behaves with respect to scoping and mutability.  

let tempNumber: number= 12;
if(tempNumber){
    let tempNumber: number=15;
    console.log("First number is :",tempNumber)
}
console.log("First number is :",tempNumber);

const tempVariable: number=21;
console.log("Temp Variable is :",tempVariable);

var tempName: string= "JITU";
console.log("Name is :", tempName);
if(tempName){
    console.log("name is :",tempName);
}

if(true){
    var tempName_2:string="sahoo";
    console.log("Temp name2 is :",tempName_2)
}
console.log("Temp name 2 is",tempName_2);

if(true){
    console.log("tempVariable is :",tempVariable);
}
