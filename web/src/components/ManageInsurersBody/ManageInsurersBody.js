import classes from "./_manageInsurersBody.module.scss";
import Typography from "@mui/material/Typography";
import Button from "@mui/material/Button";
import InsurersList from "../InsurersList/InsurersList";
import { Link } from "react-router-dom";
const ManageInsurersBody = () => {
  return (
    <div>
      <div className={classes.manageInsurersHeaderBox}>
        <Typography component="h1" variant="h4">
          <b> Insurer (2000)</b>
        </Typography>
        <Typography component="h1" variant="h6" color="text.secondary">
          List of all registered insurers
        </Typography>
      </div>
      <div className={classes.addInsurerBtn}>
        <Link className={classes.addInsurerBtn_link} to="/add-insurer">
          <Button
            size="large"
            type="button"
            variant="contained"
            sx={{ mt: 3, mb: 2 }}
          >
            + Add Insurer
          </Button>
        </Link>
      </div>
      {/* <Grid container component="main" sx={{ height: "auto" }}>
        <Grid
          item
          xs={12}
          sm={12}
          md={12}
          component={Paper}
          elevation={6}
          square
          className={classes.insurersListBox}
        > */}
      {/* <div className={classes.transactionBox__header}>
            <Typography component="h3" variant="h5">
              Insurers
            </Typography>
          </div> */}
      <InsurersList />
      {/* </Grid>
      </Grid> */}
    </div>
  );
};
export default ManageInsurersBody;
