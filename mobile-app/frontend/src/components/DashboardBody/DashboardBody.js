import Typography from "@mui/material/Typography";
import Grid from "@mui/material/Grid";
import Card2 from "../Card/Card2";
import classes from "./_dashboardBody.module.scss";
import TransactionHistoryBody from "../TransactionHistoryBody/TransactionHistoryBody";

const DashboardBody = () => {
  return (
    <div>
      <br />
      <div className={classes.dashboardHeaderBox}>
        <Typography component="h1" variant="h4">
          Dashboard
        </Typography>
        <Typography component="h1" variant="h6" color="text.secondary">
          A Quick data overview
        </Typography>
      </div>
      <Grid container component="main" sx={{ height: "auto" }}>
        <Grid item xs={12} sm={12} md={6}>
          <div className="row">
            <Card2 cardTitle={"Insurer"} cardDesc={"Members : 2000"} />
          </div>
        </Grid>
        <Grid item xs={12} sm={12} md={6}>
          <div className="row">
            <Card2 cardTitle={"Balance"} cardDesc={"N20,000.00"} />
          </div>
        </Grid>
      </Grid>
      <TransactionHistoryBody />
    </div>
  );
};
export default DashboardBody;
