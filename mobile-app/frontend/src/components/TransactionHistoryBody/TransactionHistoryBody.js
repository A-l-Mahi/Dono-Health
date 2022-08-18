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
    { title: "Transaction Date", field: "transaction_date" },
    { title: "Transaction Time", field: "transaction_time" },
    { title: "Amount Charged (N)", field: "amount_charged" },
  ];

  // Material Table Columns Rows
  const data = [
    {
      id: 1,
      insurer_name: "Abubakar Muhammad Umar",
      transaction_date: "09/05/22",
      transaction_time: "2:00am",
      amount_charged: "500,000.00",
    },
    {
      id: 2,
      insurer_name: "Uthman Ishaq Karofi",
      transaction_date: "07/05/22",
      transaction_time: "10:30am",
      amount_charged: "120,000.00",
    },
    {
      id: 3,
      insurer_name: "Almahi Aminu",
      transaction_date: "11/05/22",
      transaction_time: "12:00pm",
      amount_charged: "12,000.00",
    },
    {
      id: 4,
      insurer_name: "Abdulateef Fawaz",
      transaction_date: "14/05/22",
      transaction_time: "4:00pm",
      amount_charged: "40,000.00",
    },
    {
      id: 5,
      insurer_name: "Adamu Fura Suleiman",
      transaction_date: "23/05/22",
      transaction_time: "12:00pm",
      amount_charged: "3000.00",
    },
    {
      id: 6,
      insurer_name: "Uthman Ishaq Karofi",
      transaction_date: "03/05/22",
      transaction_time: "12:00pm",
      amount_charged: "10,000.00",
    },
    {
      id: 7,
      insurer_name: "Abdulateef Fawaz",
      transaction_date: "09/05/22",
      transaction_time: "12:00pm",
      amount_charged: "12,000.00",
    },
    {
      id: 8,
      insurer_name: "Abubakar Muhammad Umar",
      transaction_date: "12/05/22",
      transaction_time: "12:00pm",
      amount_charged: "70,000.00",
    },
    {
      id: 9,
      insurer_name: "Mustapha Ibrahim Salga",
      transaction_date: "02/01/22",
      transaction_time: "12:00pm",
      amount_charged: "40,000.00",
    },
  ];
  return (
    <div className="App wrapper">
      <MaterialTable
        title="Transactions Details"
        icons={tableIcons}
        columns={columns}
        data={data}
        actions={[
          {
            icon: UnfoldMoreIcon,
            tooltip: "View Details",
            onClick: (event, rowData) => {
              // Do save operation
              console.log(rowData);
              navigate("/dashboard");
            },
          },
        ]}
      />
    </div>
  );
};
export default InsurersList;
