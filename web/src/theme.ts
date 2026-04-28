import { createSystem, defaultConfig, defineConfig } from "@chakra-ui/react";

const config = defineConfig({
  theme: {
    tokens: {
      fonts: {
        heading: { value: "\"Geist Variable\", sans-serif" },
        body: { value: "\"Geist Variable\", sans-serif" },
      },
    },
  },
  globalCss: {
    "html, body": {
      minHeight: "100%",
      bg: "bg",
      color: "fg"
    },
    a: {
      color: "inherit",
    },
  },
});

export const system = createSystem(defaultConfig, config);
