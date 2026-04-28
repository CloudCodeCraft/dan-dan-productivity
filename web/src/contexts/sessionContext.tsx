import { createContext, type Dispatch, type PropsWithChildren, type SetStateAction, useState } from "react";

type SessionContextValue = {
  sessionToken: string | null;
  setSessionToken: Dispatch<SetStateAction<string | null>> | null;
};

export const SessionContext = createContext<SessionContextValue>({
  sessionToken: null,
  setSessionToken: null,
});

export const SessionContextProvider = ({children}: PropsWithChildren) => {
  const [sessionToken, setSessionToken] = useState<string | null>(null)

  return (
    <SessionContext.Provider value={{sessionToken, setSessionToken}}>
      {children}
    </SessionContext.Provider>
  ) 
}
