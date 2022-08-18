import * as React from "react";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import Typography from "@mui/material/Typography";
import classes from "./_card2.module.scss";
import GroupIcon from "@mui/icons-material/Group";
import AccountBalanceIcon from "@mui/icons-material/AccountBalance";

export default function Card2(props) {
  return (
    <Card
      className={classes.card + " " + classes.border__1}
      sx={{ maxWidth: 250 }}
    >
      {props.cardTitle === "Insurer" ? (
        <GroupIcon fontSize="large" />
      ) : (
        <AccountBalanceIcon fontSize="large"   />
      )}
      <CardContent>
        <Typography gutterBottom variant="h5" component="div">
          {props.cardTitle}
        </Typography>
        <Typography variant="body" color="text.secondary">
          {props.cardDesc}
        </Typography>
      </CardContent>
    </Card>
  );
}
