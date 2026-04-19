import { createBrowserRouter } from "react-router";
import RootPage from "@/pages/RootPage";
import RootLayout from "@/layouts/RootLayout";
import TimerPage from "@/pages/TimerPage"

const router = createBrowserRouter([
  {
    Component: RootLayout,
    children: [
      { index: true, Component: RootPage },
      { path: 'timer', Component: TimerPage }
    ],
  },
]);

export default router;
