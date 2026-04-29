import { useEffect, useState } from "react"
const localStorageKey = 'sessionToken';

export default function useLocalStateSessionToken() {
  const [token, setTokenState] = useState<string>('');

  useEffect(() => {
    getTokenFromStorage(); 
  }, [])

  function getTokenFromStorage() {
	 const localStorageToken = localStorage.getItem(localStorageKey)
	  if (localStorageToken) {
	    setToken(localStorageToken)
	  }

	  return localStorageToken;
  }

  function getToken() {
    if (token) return token;

    return getTokenFromStorage();
  }

  function clearToken() {
    setToken('');
    localStorage.setItem(localStorageKey, '')
  }

  function setToken(token: string) {
    setTokenState(token)
    localStorage.setItem(localStorageKey, token)
  }

  return {
    getToken,
    setToken,
    clearToken
  }
}
