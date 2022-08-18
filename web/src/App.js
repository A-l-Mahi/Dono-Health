import { Routes, Route } from "react-router-dom";
import SignUp from "./pages/SignUp";
import SignIn from "./pages/SignIn";
import Navigation from "./layout/Navigation";
function App() {
  return (
    <Routes>
      <Route path="/sign-up" element={<SignUp />} />
      <Route path="/" element={<SignIn />} />
      <Route path="/dashboard" element={<Navigation body="dashboard" />} />
      <Route
        path="/manage-insurers"
        element={<Navigation body="manage-insurers" />}
      />
      <Route path="/account" element={<Navigation body="account" />} />
      <Route path="/add-insurer" element={<Navigation body="add-insurer" />} />
      <Route
        path="/insurer-details"
        element={<Navigation body="insurer-details" />}
      >
        <Route
          path="/insurer-details/:id"
          element={<Navigation body="insurer-details" />}
        />
      </Route>
    </Routes>
  );
}
export default App;
