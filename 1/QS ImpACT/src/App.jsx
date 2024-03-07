import { useState } from "react";
import NavBar_Banner from "./Components/NavBar/NavBar_Container/NavBar_Banner.jsx";
import NavBar_Container from "./Components/NavBar/NavBar_Banner/NavBar_Container.jsx";
import Footer from "./Components/Footer/Footer.jsx";
import Main from "./Components/Main/Main.jsx";
function App() {
  return (
    <>
      <NavBar_Banner />
      <NavBar_Container />
      <Main />
      <Footer />
    </>
  );
}

export default App;
