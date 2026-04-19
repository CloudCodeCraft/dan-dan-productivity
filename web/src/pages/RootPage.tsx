import { Badge, Box, Button, Container, Heading, HStack, Stack, Text } from "@chakra-ui/react";
import { Link as RouterLink } from "react-router";

export default function RootPage() {
  return (
    <Box
      minH="calc(100vh - 81px)"
      bgGradient="linear(to-br, teal.50, white 45%, orange.50)"
    >
      <Container maxW="6xl" py={{ base: "14", md: "24" }}>
        <Stack gap={{ base: "8", md: "12" }} maxW="3xl">
          <Badge
            alignSelf="flex-start"
            colorPalette="teal"
            px="3"
            py="1"
            rounded="full"
            fontSize="0.75rem"
          >
            Chakra UI migration
          </Badge>
          <Stack gap="5">
            <Heading
              as="h1"
              fontSize={{ base: "4xl", md: "6xl" }}
              lineHeight="0.95"
              letterSpacing="-0.05em"
            >
              The app shell is ready for Chakra components now.
            </Heading>
            <Text fontSize={{ base: "lg", md: "xl" }} color="gray.600">
              Radix and shadcn are no longer required for the main layout. From
              here, we can build pages directly with Chakra&apos;s primitives,
              tokens, and theming system.
            </Text>
          </Stack>
          <HStack gap="4" flexWrap="wrap">
            <Button colorPalette="teal" size="lg">
              Start Building
            </Button>
            <Button asChild variant="outline" size="lg">
              <RouterLink to="/">View Home</RouterLink>
            </Button>
          </HStack>
        </Stack>
      </Container>
    </Box>
  );
}
