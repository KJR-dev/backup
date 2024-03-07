import "./NavBar_Container.css";

function NavBar_Container() {
  return (
    <nav className="navStyle">
      <div className="navFirstNavBar">
        <img className="imgStyle" src="/logo-transparent-png.png" alt="" />
      </div>
      <div className="navSecondNavBar">
        <ul>
          <li>
            <a href="#">WHO WE ARE</a>
          </li>
          <li>
            <a href="#">FOR ORGANIZATIONS</a>
          </li>
          <li>
            <a href="#">FOR YOUNG PEOPLE</a>
          </li>
          <li>
            <a href="#">IMPACT REPORTS</a>
          </li>
          <li>
            <a href="#">NEWS</a>
          </li>
          <li>
            <i className="fa-solid fa-circle-user userIcon"></i>
            <a href="#">SIGN IN</a>
          </li>
        </ul>
      </div>
      <div className="navThirdNavBar">
        <ul>
          <li className="donate">
            <a href="#">DONATE</a>
          </li>
        </ul>
      </div>
    </nav>
  );
}
export default NavBar_Container;
