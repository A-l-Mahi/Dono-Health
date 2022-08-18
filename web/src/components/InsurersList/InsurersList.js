import { useNavigate } from "react-router-dom";
import MaterialTable from "material-table";
// Import Material Icons
import { forwardRef } from "react";
import AddBox from "@material-ui/icons/AddBox";
import ArrowDownward from "@material-ui/icons/ArrowDownward";
import Check from "@material-ui/icons/Check";
import ChevronLeft from "@material-ui/icons/ChevronLeft";
import ChevronRight from "@material-ui/icons/ChevronRight";
import Clear from "@material-ui/icons/Clear";
import DeleteOutline from "@material-ui/icons/DeleteOutline";
import Edit from "@material-ui/icons/Edit";
import FilterList from "@material-ui/icons/FilterList";
import FirstPage from "@material-ui/icons/FirstPage";
import LastPage from "@material-ui/icons/LastPage";
import Remove from "@material-ui/icons/Remove";
import SaveAlt from "@material-ui/icons/SaveAlt";
import Search from "@material-ui/icons/Search";
import ViewColumn from "@material-ui/icons/ViewColumn";
import UnfoldMoreIcon from "@mui/icons-material/UnfoldMore";
import PaymentIcon from "@mui/icons-material/Payment";
import InsurerDetails from "../InsurerDetails/InsurerDetails";
const tableIcons = {
  Add: forwardRef((props, ref) => <AddBox {...props} ref={ref} />),
  Check: forwardRef((props, ref) => <Check {...props} ref={ref} />),
  Clear: forwardRef((props, ref) => <Clear {...props} ref={ref} />),
  Delete: forwardRef((props, ref) => <DeleteOutline {...props} ref={ref} />),
  DetailPanel: forwardRef((props, ref) => (
    <ChevronRight {...props} ref={ref} />
  )),
  Edit: forwardRef((props, ref) => <Edit {...props} ref={ref} />),
  Export: forwardRef((props, ref) => <SaveAlt {...props} ref={ref} />),
  Filter: forwardRef((props, ref) => <FilterList {...props} ref={ref} />),
  FirstPage: forwardRef((props, ref) => <FirstPage {...props} ref={ref} />),
  LastPage: forwardRef((props, ref) => <LastPage {...props} ref={ref} />),
  NextPage: forwardRef((props, ref) => <ChevronRight {...props} ref={ref} />),
  PreviousPage: forwardRef((props, ref) => (
    <ChevronLeft {...props} ref={ref} />
  )),
  ResetSearch: forwardRef((props, ref) => <Clear {...props} ref={ref} />),
  Search: forwardRef((props, ref) => <Search {...props} ref={ref} />),
  SortArrow: forwardRef((props, ref) => <ArrowDownward {...props} ref={ref} />),
  ThirdStateCheck: forwardRef((props, ref) => <Remove {...props} ref={ref} />),
  ViewColumn: forwardRef((props, ref) => <ViewColumn {...props} ref={ref} />),
};

const InsurersList = () => {
  // Material Table Columns
  const navigate = useNavigate();

  const columns = [
    { title: "Id", field: "id" },
    { title: "Insurer Name", field: "insurer_name" },
    { title: "Insurer ID", field: "insurer_id" },
  ];

  // Material Table Columns Rows
  const data = [
    {
      id: 1,
      insurer_name: "Abubakar Muhammad Umar",
      insurer_id: "234567876",
      account_balance: "1,213,000.00",
    },
    {
      id: 2,
      insurer_name: "Almahi Aminu",
      insurer_id: "2434234",
      account_balance: "230,000.00",
    },
    {
      id: 3,
      insurer_name: "Adamu Fura Sulaiman",
      insurer_id: "567289",
      account_balance: "230,000.00",
    },
    {
      id: 4,
      insurer_name: "Mustapha ibrahim salga",
      insurer_id: "2287689",
      account_balance: "212,000.00",
    },
    {
      id: 5,
      insurer_name: "Yahaya Abba yahya",
      insurer_id: "987656",
      account_balance: "77,000.00",
    },
    {
      id: 6,
      insurer_name: "Muhammad Sani",
      insurer_id: "987654345",
      account_balance: "58,000.00",
    },
    {
      id: 7,
      insurer_name: "khalil usman",
      insurer_id: "98765",
      account_balance: "1,000.00",
    },
    {
      id: 8,
      insurer_name: "Musa Ahmad",
      insurer_id: "876543",
      account_balance: "80,000.00",
    },
    {
      id: 9,
      insurer_name: "Aisha sadisu",
      insurer_id: "0987654",
      account_balance: "26,000.00",
    },
  ];

  return (
    <div className="App wrapper">
      <MaterialTable
        title="Insurers"
        icons={tableIcons}
        columns={columns}
        data={data}
        actions={[
          {
            icon: PaymentIcon,
            tooltip: "Charge Insurer",
            onClick: (event, rowData) => {
              // Do save operation
              console.log(rowData);
              <InsurerDetails
                insureID={rowData.insurer_id}
                insurerName={rowData.insurer_name}
                accountBalance={rowData.account_balance}
              />;
              navigate(
                "/insurer-details/" +
                  rowData.insurer_id +
                  "-" +
                  rowData.insurer_name +
                  "-" +
                  rowData.account_balance
              );
            },
          },
        ]}
      />
    </div>
  );
};
export default InsurersList;
