// Write a TypeScript program that defines an enumeration 'Color' with values 'Red', 'Green', 'White' and Blue. Create a variable 'selectedColor' of type 'Color' and assign it one of the enumeration values. 
enum Colors{
    red,
    yellow,
    black,
    white,
    blue,
}

console.log("Color are", Colors);

const selectColor: Colors=Colors.black;
console.log(selectColor);