import { backendApiUrl } from "./urls"

export type CreateSessionApiArgs = {
  email: string,
  password: string
}

export type CreateSessionApiResponse = {
  id: number;
  bearer_token: string;
  user_id: number;
  created_at: string;
  updated_at: string;
}

export async function createSessionApi(args: CreateSessionApiArgs): Promise<CreateSessionApiResponse> {
  const response = await fetch(
    `${backendApiUrl()}sessions`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
	 
      },
      body: JSON.stringify({
        user: {
          email: args.email,
	  password: args.password
	}
      })
    }
  )

  const body = await response.json();
  return body
}
