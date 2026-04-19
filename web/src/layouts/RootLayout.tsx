import { Box, Container, Flex, HStack, Link, Text } from "@chakra-ui/react";
import { Link as RouterLink, Outlet, useLocation } from "react-router";

export default function RootLayout() {
  const location = useLocation();

  const navItems = [
    { label: "Home", to: "/" },
    { label: "Timer", to: "/timer" }
  ];

  return (
    <>
      <Box as="header" borderBottomWidth="1px" borderColor="blackAlpha.200" bg="whiteAlpha.900" backdropFilter="blur(18px)" position="sticky" top="0" zIndex="10">
        <Container maxW="6xl" py="4">
          <Flex align="center" justify="space-between" gap="4">
            <Text fontSize="lg" fontWeight="700" letterSpacing="-0.03em">
              Dan Dan
            </Text>
            <HStack gap="2">
              {navItems.map((item) => {
                const isActive = location.pathname === item.to;

                return (
                  <Link
		    asChild
                    key={item.to}
                    px="3"
                    py="2"
                    rounded="full"
                    fontWeight="600"
                    color={isActive ? "white" : "gray.700"}
                    bg={isActive ? "teal.500" : "transparent"}
                    _hover={{
                      textDecoration: "none",
                      bg: isActive ? "teal.600" : "blackAlpha.100",
                    }}
                  >
		    <RouterLink to={item.to}> 
                    {item.label}
		    </RouterLink>
                  </Link>
                );
              })}
            </HStack>
          </Flex>
        </Container>
      </Box>
      <Outlet />
    </>
  );
}
