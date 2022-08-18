import classes from "./_logo.module.scss";
import LogoImg from "../../img/donoHealthlogo.png";
import { Link } from "react-router-dom";

const Logo = () => {
  return (
    <Link to="/sign-in" className={classes.logo__box}>
      <img src={LogoImg} alt="logo" className={classes.logo} />
    </Link>
  );
};
export default Logo;
