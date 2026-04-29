import useLocalStateSessionToken from "@/hooks/useLocalStateSession";
import { createContext, type Dispatch, type PropsWithChildren, type SetStateAction, useState, useEffect } from "react";

type SessionContextValue = {
  sessionToken: string | null;
  setSessionToken: (token: string) => void;
};

export const SessionContext = createContext<SessionContextValue>({
  sessionToken: '',
  setSessionToken: (token: string) => { throw 'implement me' },
});

export const SessionContextProvider = ({children}: PropsWithChildren) => {
  const [sessionToken, setSessionTokenState] = useState<string>('')
  const {getToken, setToken} = useLocalStateSessionToken();

  useEffect(() => {
	  debugger
   const tokenFromLocalStorage = getToken()
   if (tokenFromLocalStorage) setSessionTokenState(tokenFromLocalStorage);
  }, [])

  function setSessionToken(token: string) {
	  debugger
    setSessionTokenState(token)
    setToken(token)
  }

  return (
    <SessionContext.Provider value={{sessionToken, setSessionToken}}>
      {children}
    </SessionContext.Provider>
  ) 
}
