import React from "react";
import ReactDOM from "react-dom/client";
import {NavigationMenu} from "@/components/ui/navigation-menu"

function App() {
  return <><NavigationMenu /><h1>Hello</h1></>
}

ReactDOM.createRoot(document.getElementById("root")).render(<App />);
