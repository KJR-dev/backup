// Write a TypeScript program that declares variables of the following data types: number, string, boolean, and undefined. Assign values to them and perform basic operations.

const tempNumber: number = 14;
const tempName: string = "JITU";
const tempStatus: boolean = true;
const tempUndefined: undefined = undefined;

const sum: number= tempNumber + 25;
console.log("sum is :",sum);

const concatenatedString: string= tempName + " " + "SAHOO";
console.log("concatenatedString is :", concatenatedString);

if(tempStatus){
    console.log("tempStatus is : ",tempStatus);
}else{
    console.log("tempStatus is : ",tempStatus);
}

if(tempUndefined === undefined){
    console.log("tempUndefined is : ",tempUndefined);
}else{
    console.log("tempUndefined is : ",undefined);
}