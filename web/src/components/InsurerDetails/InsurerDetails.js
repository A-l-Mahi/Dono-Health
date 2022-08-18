import Grid from "@mui/material/Grid";
import Typography from "@mui/material/Typography";
import classes from "./_insurerDetails.module.scss";
import Paper from "@mui/material/Paper";
import Button from "@mui/material/Button";
import TextField from "@mui/material/TextField";
import Box from "@mui/material/Box";
import { useState } from "react";
import { useParams } from "react-router-dom";
const InsurerDetails = (props) => {
  const params = useParams();

  const insurer = params.id;
  const convert = String(insurer);
  const detail = convert.split("-");
  const [amount, setAmount] = useState("");
  const [confirmedAmount, setConfirmedAmount] = useState("");
  const [confirmedInsurerName, setConfirmedInsurerName] = useState("");
  const [confirmedInsurerId, setConfirmedInsurerId] = useState("");

  const userId = detail[0];

  //   props.insureID;
  const insurerName = detail[1];
  //   props.insurerName
  const balance = detail[2];
  //   props.accountBalance
  const amountChangeHandler = (e) => {
    setAmount(e.target.value);
  };
  const handleLoad = (e) => {
    e.preventDefault();
    setConfirmedAmount(amount);
    setConfirmedInsurerName(insurerName);
    setConfirmedInsurerId(userId);
  };
  return (
    <div>
      <Grid container component="main" sx={{ height: "auto" }}>
        <Grid item xs={12} sm={12} md={6}>
          <div className={classes.text_box__left}>
            <Typography component="p" variant="p">
              <b>NAME:</b> {insurerName}
            </Typography>
            <br />
            <Typography component="p" variant="p">
              <b>INSURER ID:</b> {userId}
            </Typography>
          </div>
        </Grid>
        <Grid item xs={12} sm={12} md={6}>
          <div className={classes.text_box__right}>
            <Typography component="p" variant="p">
              <b>TOTAL BALANCE</b>
            </Typography>

            <Typography
              component="p"
              variant="p"
              className={classes.amountBalance}
            >
              N{balance}
            </Typography>
          </div>
        </Grid>
      </Grid>
      <Grid
        container
        component="main"
        sx={{ height: "auto" }}
        className={classes.mainBody}
      >
        <Grid
          item
          xs={12}
          sm={12}
          md={6}
          component={Paper}
          elevation={2}
          square
          className={classes.Card}
        >
          <Typography component="p" variant="p">
            <b>Services/Product Fee</b>
          </Typography>
          <hr />
          <Box
            sx={{
              my: 8,
              mx: 4,
              display: "flex",
              flexDirection: "column",
              alignItems: "center",
            }}
          >
            <Typography component="h1" variant="h5">
              Enter Transaction Info
            </Typography>
            <Box
              className={classes.inputFields}
              component="form"
              noValidate
              onSubmit={handleLoad}
              sx={{ mt: 1 }}
            >
              <TextField
                margin="normal"
                required
                type="text"
                value={userId}
                fullWidth
                id="userId"
                label={"Insurer ID"}
                name="userId"
                disabled
              />
              <TextField
                margin="normal"
                required
                fullWidth
                id="amount"
                label="Total Amount"
                name="amount"
                value={amount}
                onChange={amountChangeHandler}
              />

              <Button
                type="submit"
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 2 }}
              >
                Confirm Details
              </Button>
            </Box>
          </Box>
        </Grid>
        <Grid
          item
          xs={12}
          sm={12}
          md={6}
          component={Paper}
          elevation={2}
          square
          className={classes.Card}
        >
          <Typography component="p" variant="p">
            <b>Withdrawal Details</b>
          </Typography>
          <hr />
          <Box
            sx={{
              my: 8,
              mx: 4,
              display: "flex",
              flexDirection: "column",
              alignItems: "center",
            }}
          >
            <Typography component="h1" variant="h5">
              Please Confirm Transaction
            </Typography>
            <Box
              className={classes.inputFields}
              component="form"
              noValidate
              onSubmit={handleLoad}
              sx={{ mt: 1 }}
            >
              <div className={classes.confirmationDetailsBox}>
                <Typography
                  component="p"
                  variant="p"
                  className={classes.confirmationDetailsBox__item}
                >
                  <b>Insurer ID:</b> {confirmedInsurerId}
                </Typography>
                <Typography
                  component="p"
                  variant="p"
                  className={classes.confirmationDetailsBox__item}
                >
                  <b>Insurer Name:</b> {confirmedInsurerName}
                </Typography>
                <Typography
                  component="p"
                  variant="p"
                  className={classes.confirmationDetailsBox__item}
                >
                  <b>Total Amount:</b> {confirmedAmount}
                </Typography>
                <Button
                  type="submit"
                  fullWidth
                  variant="contained"
                  sx={{ mt: 3, mb: 2 }}
                >
                  Widthraw Amount
                </Button>
              </div>
            </Box>
          </Box>
        </Grid>
      </Grid>
    </div>
  );
};
export default InsurerDetails;
