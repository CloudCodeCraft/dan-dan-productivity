import { Alert } from "@chakra-ui/react";
export default function FormErrorAlert({msg}: {msg: string}) {
    if (msg.length === 0) return null;
    return (
      <Alert.Root status="error">
        <Alert.Indicator />
        <Alert.Content>
	  <Alert.Title>Invalid Fields</Alert.Title>
	  <Alert.Description>
	    {msg}
	  </Alert.Description>
        </Alert.Content>
      </Alert.Root>
    )
  }
