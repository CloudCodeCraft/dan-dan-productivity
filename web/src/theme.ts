import { createSystem, defaultConfig, defineConfig } from "@chakra-ui/react";

const config = defineConfig({
  theme: {
    tokens: {
      fonts: {
        heading: { value: "\"Geist Variable\", sans-serif" },
        body: { value: "\"Geist Variable\", sans-serif" },
      },
      colors: {
        brand: {
          50: { value: "#eefbf8" },
          100: { value: "#d2f5ed" },
          200: { value: "#a9eadc" },
          300: { value: "#74dcc7" },
          400: { value: "#3fcfb2" },
          500: { value: "#18b59a" },
          600: { value: "#118a75" },
          700: { value: "#0c6556" },
          800: { value: "#084238" },
          900: { value: "#041f1b" },
        },
      },
    },
    semanticTokens: {
      colors: {
        bg: {
          canvas: { value: "{colors.white}" },
          subtle: { value: "{colors.gray.50}" },
        },
      },
    },
  },
  globalCss: {
    "html, body": {
      minHeight: "100%",
      color: "gray.900",
      bg: "bg.canvas",
    },
    a: {
      color: "inherit",
    },
  },
});

export const system = createSystem(defaultConfig, config);
