import * as React from "react";
import Button from "@mui/material/Button";
import TextField from "@mui/material/TextField";
import Paper from "@mui/material/Paper";
import Box from "@mui/material/Box";
import Grid from "@mui/material/Grid";
import Typography from "@mui/material/Typography";
import { createTheme, ThemeProvider } from "@mui/material/styles";
import { useState } from "react";
import classes from "./_form.module.scss";
const theme = createTheme();
const axios = require("axios").default;
const Form = (props) => {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [age, setAge] = useState("");
  const [gender, setGender] = useState("");
  const [email, setEmail] = useState("");
  const [phoneNumber, setPhoneNumber] = useState("");
  const [mainHospital, setMainHospital] = useState("");
  const [stateOfResidence, setStateOfResisdence] = useState("");
  const url = "http://localhost:4000/admin";
  const handleFirstNameChange = (e) => {
    setFirstName(e.target.value);
  };
  const handleLastNameChange = (e) => {
    setLastName(e.target.value);
  };
  const ageHandler = (e) => {
    setAge(e.target.value);
  };
  const genderChangeHandler = (e) => {
    setGender(e.target.value);
  };
  const emailChangeHandler = (e) => {
    setEmail(e.target.value);
  };
  const phoneNumberChangeHandler = (e) => {
    setPhoneNumber(e.target.value);
  };
  const hospitalChangeHandler = (e) => {
    setMainHospital(e.target.value);
  };
  const stateOfResidenceChangeHandler = (e) => {
    setStateOfResisdence(e.target.value);
  };
  const handleSubmit = (event) => {
    event.preventDefault();

    axios
      .post(`${url}/addInsurer`, {
        firstName: firstName,
        lastName: lastName,
        age: age,
        gender: gender,
        email: email,
        phoneNumber: phoneNumber,
        mainHospital: mainHospital,
        stateOfResidence: stateOfResidence,
      })
      .then(function (response) {
        setFirstName("");
        setLastName("");
        setAge("");
        setGender("");
        setEmail("");
        setPhoneNumber("");
        setMainHospital("");
        setStateOfResisdence("");
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      });
  };
  return (
    <ThemeProvider theme={theme}>
      <Grid container component="main" sx={{ height: "auto" }}>
        <Grid
          item
          xs={12}
          sm={12}
          md={12}
          component={Paper}
          elevation={6}
          square
        >
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
              Create New Insurer Account
            </Typography>
            <Box
              className={classes.inputFields}
              component="form"
              noValidate
              onSubmit={handleSubmit}
              sx={{ mt: 1 }}
            >
              <TextField
                margin="normal"
                required
                type="text"
                value={firstName}
                fullWidth
                id="firstName"
                label="First Name"
                name="firstName"
                onChange={handleFirstNameChange}
              />
              <TextField
                margin="normal"
                required
                fullWidth
                id="lastName"
                label="Last Name"
                name="lastName"
                autoComplete="lastName"
                value={lastName}
                onChange={handleLastNameChange}
              />

              <TextField
                margin="normal"
                required
                autowidth="true"
                id="age"
                label="Age"
                name="age"
                autoComplete="age"
                value={age}
                onChange={ageHandler}
              />
              <TextField
                margin="normal"
                required
                type="gender"
                value={gender}
                autowidth="true"
                id="gender"
                label="gender"
                name="gender"
                onChange={genderChangeHandler}
              />
              <TextField
                margin="normal"
                required
                type="email"
                value={email}
                fullWidth
                id="email"
                label="Email"
                name="email"
                onChange={emailChangeHandler}
              />
              <TextField
                margin="normal"
                required
                type="text"
                value={mainHospital}
                fullWidth
                id="mainHospital"
                label="Main Hospital"
                name="mainHospital"
                onChange={hospitalChangeHandler}
              />
              <TextField
                margin="normal"
                required
                type="number"
                value={phoneNumber}
                autowidth="true"
                id="phoneNumber"
                label="Phone Number"
                name="phoneNumber"
                onChange={phoneNumberChangeHandler}
              />
              <TextField
                margin="normal"
                required
                type="text"
                value={stateOfResidence}
                autowidth="true"
                id="state"
                label="State of Residence"
                name="state"
                onChange={stateOfResidenceChangeHandler}
              />

              <Button
                type="submit"
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 2 }}
              >
                Create Account
              </Button>
            </Box>
          </Box>
        </Grid>
      </Grid>
    </ThemeProvider>
  );
};
export default Form;
