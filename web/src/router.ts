import { createBrowserRouter } from "react-router";
import RootLayout from "@/layouts/RootLayout";
import RootPage from "@/pages/RootPage";
import TimerPage from "@/pages/TimerPage";
import SignUpPage from "@/pages/SignUpPage";
import LoginPage from "@/pages/LoginPage";

const router = createBrowserRouter([
  {
    Component: RootLayout,
    children: [
      { index: true, Component: RootPage },
      { path: "timer", Component: TimerPage },
      { path: "signup", Component: SignUpPage},
      { path: "login", Component: LoginPage }
    ],
  },
]);

export default router;
