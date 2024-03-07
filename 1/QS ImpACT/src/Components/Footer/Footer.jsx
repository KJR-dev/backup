import "./Footer.css";
function Footer() {
  return (
    <div className="mainFooter">
      <div className="firstInnerFooter">
        <div className="firstFooterDiv">
          <img
            src="/logo-transparent-png.png"
            alt="logo"
            className="imgStyle"
          />
          <p>
            QS ImpACT is a UK & Wales registered charity. Charity number 1161402
          </p>
          <button>
            <a href="#" rel="noopener noreferrer">
              GOVERNANCE
            </a>
          </button>
        </div>
        <div className="secondFooterDiv"></div>
        <div className="thirdFooterDiv">
          <h3>Quick Links</h3>
          <hr />
          <ul>
            <li>Contact us</li>
            <li>FAQ</li>
            <li>Partner with us</li>
            <li>Terms & Conditions</li>
            <li>Privacy Policy</li>
          </ul>
        </div>
        <div className="fourthFooterDiv">
          <h3>Quick Links</h3>
          <hr />
          <div>
            <span>
              <i class="fa-brands fa-facebook-f"></i>
            </span>
            <span>
              <i class="fa-brands fa-linkedin-in"></i>
            </span>
            <span>
              <i class="fa-brands fa-instagram"></i>
            </span>
          </div>
        </div>
      </div>
      <div className="secondInnerFooter">
        <div className="secondInnerFooterFirstDiv">© QS ImpACT 2023</div>
        <div className="secondInnerFooterSecondDiv"></div>
        <div className="secondInnerFooterThirdDiv">
          Carefully Crafted by3 Minds Digital
        </div>
      </div>
    </div>
  );
}
export default Footer;
