import { backendApiUrl } from "./urls"

export type CreateUserApiArgs = {
  email: string
  password: string
  passwordConfirmation: string
}

export async function createUserApi(args: CreateUserApiArgs) {
  const response = await fetch(`${backendApiUrl()}users`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      user: {
        email: args.email,
        password: args.password,
        password_confirmation: args.passwordConfirmation,
      },
    }),
  })

  const result = await response.json()
  return result
}
