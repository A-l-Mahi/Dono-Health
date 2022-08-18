import classes from "./_button.module.scss";
import { Link } from "react-router-dom";
const Button = (props) => {
  return (
    <Link
      to={props.redirectTo}
      className={
        classes.btn + " " + classes.btn__primary + " " + classes.btn__text2
      }
    >
      {props.btnText}
    </Link>
  );
};
export default Button;
