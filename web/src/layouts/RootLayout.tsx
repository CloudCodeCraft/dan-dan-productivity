import { Box, Flex } from "@chakra-ui/react";
import { Outlet } from "react-router";
import Navbar from "@/components/NavBar/Navbar";

export default function RootLayout() {
  return (
    <Flex direction="column" minH="100vh">
      <Navbar />
      <Box as="main" flex="1" bg="bg">
        <Outlet />
      </Box>
    </Flex>
  );
}
