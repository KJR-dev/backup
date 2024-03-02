function HelloWorld(){
    console.log("Hello World!");
}
function Button() {
  return (
    <div>
      <button onClick={HelloWorld}>Click me!</button>
    </div>
  );
}
export default Button;
