// Write a TypeScript program that converts a variable of one type to another using type assertions and type conversion functions like parseInt().

let tempVariable_1: number = 1000;
console.log(typeof tempVariable_1);
console.log(tempVariable_1);

let tempVariable_2: string = tempVariable_1.toString();
console.log(typeof tempVariable_2);
console.log(tempVariable_2);

let tempVariable_3: number = parseInt(tempVariable_2);
console.log(typeof tempVariable_3);
console.log(tempVariable_3);