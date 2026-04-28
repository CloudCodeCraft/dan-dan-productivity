export function backendApiUrl() {
  if (import.meta.env.DEV) return 'http://localhost:3000/api/v1/'
}
