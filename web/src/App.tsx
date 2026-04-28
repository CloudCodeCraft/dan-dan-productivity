import { ChakraProvider } from "@chakra-ui/react";
import { system } from "./theme";
import { ColorModeProvider } from "./components/ui/color-mode";
import { SessionContextProvider } from "./contexts/sessionContext";
import { RouterProvider } from "react-router";
import router from "./router";

export default function App() {
  return (
	  <ChakraProvider value={system}>
	    <ColorModeProvider>
	      <SessionContextProvider>
	      <RouterProvider router={router}>
	      </RouterProvider>
	      </SessionContextProvider>
	    </ColorModeProvider>
	  </ChakraProvider>
  );
}
