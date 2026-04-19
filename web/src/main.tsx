import React from "react";
import ReactDOM from "react-dom/client";
import router from "./router";
import { RouterProvider } from "react-router/dom";
import { Provider } from "@/components/ui/provider";
import "./index.css";

function App() {
  return (
    <Provider>
      <RouterProvider router={router}></RouterProvider>
    </Provider>
  );
}

ReactDOM.createRoot(document.getElementById("root")!).render(<App />);
