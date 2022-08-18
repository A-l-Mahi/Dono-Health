import * as React from "react";
import Button from "@mui/material/Button";
import CssBaseline from "@mui/material/CssBaseline";
import TextField from "@mui/material/TextField";
import Paper from "@mui/material/Paper";
import Box from "@mui/material/Box";
import Grid from "@mui/material/Grid";
import Typography from "@mui/material/Typography";
import { createTheme, ThemeProvider } from "@mui/material/styles";
import { useNavigate } from "react-router-dom";
import bgImg from "../img/doctor.jpg";
import { useState } from "react";
import Logo from "../components/Logo/Logo";
const theme = createTheme();
const axios = require("axios").default;
const RequestServiceForm = (props) => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [response, setResponse] = useState("");
  const url = "http://localhost:4000/admin";
  const navigate = useNavigate();
  const usernameChangeHandler = (e) => {
    setUsername(e.target.value);
  };
  const passwordChangeHandler = (e) => {
    setPassword(e.target.value);
  };
  const handleSubmit = (event) => {
    event.preventDefault();
    navigate("/dashboard");

    try {
      const response = axios.post(`${url}/login`, {
        email: username,
        password: password,
      });
      console.log(response);
      if (response.status === 200) {
        navigate("/dashboard");
        console.log("Login successfully");
      }
    } catch (err) {
      if (err.response?.status === 400) {
        console.log("Invalid output");
        setResponse("Invalid input");
      } else if (err.response?.status === 401) {
        console.log("Incorrect credentials");
        setResponse("Incorrect credentials");
      } else {
        console.log("Login failed");
        setResponse("Login failed");
      }
    }
    console.log(response);
  };
  return (
    <ThemeProvider theme={theme}>
      <Grid container component="main" sx={{ height: "100vh" }}>
        <CssBaseline />
        <Grid
          item
          xs={12}
          sm={12}
          md={5}
          component={Paper}
          elevation={6}
          square
        >
          <Logo />
          <Box
            sx={{
              my: 8,
              mx: 4,
              display: "flex",
              flexDirection: "column",
              alignItems: "center",
            }}
          >
            <Typography component="h1" variant="h3">
              Welcome Back
            </Typography>
            <br />
            <Typography component="h1" variant="h5">
              Log into your account
            </Typography>
            <Box
              component="form"
              noValidate
              onSubmit={handleSubmit}
              sx={{ mt: 1 }}
            >
              <TextField
                margin="normal"
                required
                fullWidth
                id="username"
                label="username"
                name="username"
                autoComplete="username"
                autoFocus
                value={username}
                onChange={usernameChangeHandler}
              />
              <TextField
                margin="normal"
                required
                type="password"
                value={password}
                fullWidth
                id="password"
                label="password"
                name="password"
                onChange={passwordChangeHandler}
              />

              <Button
                type="submit"
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 2 }}
              >
                Login
              </Button>
            </Box>
          </Box>
        </Grid>
        <Grid
          item
          xs={false}
          sm={4}
          md={7}
          sx={{
            backgroundImage: `url(${bgImg})`,
            backgroundRepeat: "no-repeat",
            backgroundColor: (t) =>
              t.palette.mode === "light"
                ? t.palette.grey[50]
                : t.palette.grey[900],
            backgroundSize: "cover",
            backgroundPosition: "center",
          }}
        />
      </Grid>
    </ThemeProvider>
  );
};
export default RequestServiceForm;
