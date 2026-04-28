import { createSessionApi } from "@/api/createSessionApi";
import { Field } from "@/components/ui/field";
import { SessionContext } from "@/contexts/sessionContext";
import { Button, Input } from "@chakra-ui/react";
import { SubmitEvent, useContext, useState } from "react";
import { useNavigate } from "react-router";

export default function LoginPage() {
  const {setSessionToken} = useContext(SessionContext)
  const navigate = useNavigate()

  async function handleSubmit(e: SubmitEvent<HTMLFormElement>) {
    e.preventDefault();
    const session = await createSessionApi({email, password})

    if (session.bearer_token && setSessionToken) {
      setSessionToken(session.bearer_token)
      navigate('/')
      
    }
  }

  const [email, setEmail] = useState<string>('');
  const [password, setPassword] = useState<string>('');

	return (
		<form onSubmit={handleSubmit}>
		  <Field label="email">
                    <Input name="email" value={email} onChange={(e) => setEmail(e.target.value)} />
		  </Field>
		  <Field label="password">
		    <Input name="password" value={password} onChange={(e) => setPassword(e.target.value)} />
		  </Field>
		  <Button type="submit">Submit</Button>
		</form>

    
  )
}
