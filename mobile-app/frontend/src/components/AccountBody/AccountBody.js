import Typography from "@mui/material/Typography";
import classes from "./_accountBody.module.scss";
import Grid from "@mui/material/Grid";
import avatar from "../../img/avatar.png";
import Button from "@mui/material/Button";
const AccountBody = () => {
  return (
    <div>
      <div className={classes.accountBodyHeaderBox}>
        <Typography component="h1" variant="h4">
          <b>Hospital Profile</b>
        </Typography>
        <br />
        <Typography
          component="h1"
          variant="h6"
          color="text.secondary"
          className={classes.mainInfo}
        >
          Main Info
        </Typography>
      </div>
      <Grid container component="main" sx={{ height: "auto" }}>
        <Grid
          item
          xs={12}
          sm={12}
          md={2}
          elevation={6}
          square
          className={classes.avatar__box}
        >
          <img
            src={avatar}
            alt="avatar"
            className={classes.avatar__box_avatar}
          />
        </Grid>
        <Grid item xs={12} sm={12} md={5} elevation={6} square>
          <Typography component="p" variant="p" className={classes.text_box}>
            <b>Hospital Name :</b>
          </Typography>
          <br />
          <Typography component="p" variant="p">
            <b>Identification Number :</b>
          </Typography>
        </Grid>
        <Grid item xs={12} sm={12} md={5} elevation={6} square>
          <Typography
            component="p"
            variant="p"
            color="text.secondary"
            className={classes.text_box}
          >
            Aminu Kano Hospital
          </Typography>
          <br />
          <Typography component="p" variant="p" color="text.secondary">
            #55123219890
          </Typography>
        </Grid>
        <br />
        <Typography component="h1" variant="h6" color="text.secondary">
          Security
        </Typography>
        <Grid container component="main" sx={{ height: "auto" }}>
          <Grid item xs={12} sm={12} md={6} elevation={6} square>
            <Typography component="p" variant="p" className={classes.text_box}>
              <b>Sign-in Email :</b>
            </Typography>
            <br />
            <Typography component="p" variant="p">
              <b>Password :</b>
            </Typography>
            <br />
            <Typography component="p" variant="p">
              <b>Phone Number :</b>
            </Typography>
            <br />
            <Typography component="p" variant="p">
              <b>Wallet Address :</b>
            </Typography>
          </Grid>
          <Grid item xs={12} sm={12} md={6} elevation={6} square>
            <Typography
              component="p"
              variant="p"
              color="text.secondary"
              className={classes.text_box}
            >
              abubakaralmuhandis@gmail.com
            </Typography>
            <br />
            <Button variant="text" color="success">
              Change Password
            </Button>
            <br />
            <Typography component="p" variant="p" color="text.secondary">
              08123402377
            </Typography>
            <br />
            <Typography component="p" variant="p" color="text.secondary">
              D837DKH827278E
            </Typography>
          </Grid>
        </Grid>
      </Grid>
    </div>
  );
};
export default AccountBody;
