// Write a TypeScript program that declares an array of a specific data type. It will demonstrates common array operations like adding elements, removing elements, and iterating through the array.

const tempName: string[] = ["jitu", "mitu", "situ"];

console.log("tempName array is");
for (const singleName of tempName) {
  console.log(singleName);
}

tempName.push("litu");
tempName.push("kitu");

console.log("tempName Array is after push");
for (const singleName of tempName) {
  console.log(singleName);
}

tempName.pop();
tempName.pop();

console.log("tempName array is after POP");
for (const singleName of tempName) {
  console.log(singleName);
}

console.log("Index of mitu is : ", tempName.indexOf("mitu"));

const searchName: string = "mitu";
const isAvailableName = tempName.includes(searchName);

console.log(
  `is ${isAvailableName} in the array? ${isAvailableName ? "yes" : "no"}`
);
