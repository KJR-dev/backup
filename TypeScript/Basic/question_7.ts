// Write a TypeScript program that creates type aliases for complex data types such as objects or custom types. Use them to define variables and explain how they improve code readability.

type Student = {
  id: number;
  name: string;
  status: boolean;
};

type Point = {
  x: number;
  y: number;
};

let student1: Student = {
  id: 1,
  name: "Jitendra Sahoo",
  status: true,
};

let student2: Student = {
  id: 2,
  name: "Jit verma",
  status: false,
};

let originDistance: Point = {
  x: 0,
  y: 0,
};

function showStudentInfo(student: Student) {
  console.log("student id : ", student.id);
  console.log("student name : ", student.name);
  console.log("student status : ", student.status);
}

function calculateDistance(point_1: Point, point_2: Point): number {
  const dx = point_1.x - point_2.x;
  const dy = point_1.y - point_2.y;
  return Math.sqrt(dx * dx + dy * dy);
}

console.log("Student Details");
showStudentInfo(student1);

console.log("Student Details");
showStudentInfo(student2);

console.log("Distance Calculation");
console.log("Distance is : ", calculateDistance({x:5,y:6},originDistance));