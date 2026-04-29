import { createUserApi } from "@/api/createUserApi";
import ErrorAlert from "@/components/FormErrorAlert/FormErrorAlert";
import { Field } from "@/components/ui/field"
import { Button, Input } from "@chakra-ui/react"
import { SubmitEvent, useState } from "react"
import { useNavigate } from "react-router";

export default function SignUpPage() {
  const navigate = useNavigate()

  async function handleFormSubmit(e: SubmitEvent<HTMLFormElement>) {
    e.preventDefault()
    try {
    setSubmitting(true) 
    const result = await createUserApi({
      email,
      password,
      passwordConfirmation,
    })

    if (result.id && result.email) {
      navigate("/login")
    }
   
    if (result.error_message) {
      setErrorMessage(result.error_message)
    }
    } finally {
      setSubmitting(false)
    }
  }

  const [email, setEmail] = useState<string>("")
  const [password, setPassword] = useState<string>('')
  const [passwordConfirmation, setPasswordConfirmation] = useState<string>('')
  const [errorMessage, setErrorMessage] = useState<string>('')
  const [submitting, setSubmitting] =  useState<boolean>(false)
  
  return (
    <form onSubmit={handleFormSubmit}>
     <ErrorAlert msg={errorMessage} /> 
      <Field label="email">
        <Input required name="email" value={email} onChange={(e) => setEmail(e.target.value)} />
      </Field>
      <Field label="password">
        <Input required name="password" value={password} onChange={(e) => setPassword(e.target.value)} />
      </Field>
      <Field label="passwordConfirmation">
        <Input required name="passwordConfirmation" value={passwordConfirmation} onChange={(e) => setPasswordConfirmation(e.target.value)} />
      </Field>
      <Button disabled={submitting} type="submit">{submitting ? 'Submitting...' : 'Submit'}</Button>
    </form>
  )
}
