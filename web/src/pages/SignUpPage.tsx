import { createUserApi } from "@/api/createUserApi";
import { Field } from "@/components/ui/field"
import { Button, Input } from "@chakra-ui/react"
import { SubmitEvent, useState } from "react"
import { useNavigate } from "react-router";

export default function SignUpPage() {
  const navigate = useNavigate()

  async function handleFormSubmit(e: SubmitEvent<HTMLFormElement>) {
    e.preventDefault()
    const result = await createUserApi({
      email,
      password,
      passwordConfirmation,
    })

    if (result.id && result.email) {
      navigate("/login")
    }
  }

  const [email, setEmail] = useState<string>("")
  const [password, setPassword] = useState<string>('')
  const [passwordConfirmation, setPasswordConfirmation] = useState<string>('')

  return (
    <form onSubmit={handleFormSubmit}>
      <Field label="email">
        <Input name="email" value={email} onChange={(e) => setEmail(e.target.value)} />
      </Field>
      <Field label="password">
        <Input name="password" value={password} onChange={(e) => setPassword(e.target.value)} />
      </Field>
      <Field label="passwordConfirmation">
        <Input name="passwordConfirmation" value={passwordConfirmation} onChange={(e) => setPasswordConfirmation(e.target.value)} />
      </Field>
      <Button type="submit">Submit</Button>
    </form>
  )
}
