import { createContext, useContext, useState, useEffect } from 'react';
import { apiUserAuth } from '../api/client';

const UserContext = createContext(null);

export function UserProvider({ children }) {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    checkAuth();
  }, []);

  async function checkAuth() {
    try {
      const data = await apiUserAuth.me();
      setUser(data.user);
    } catch {
      setUser(null);
    } finally {
      setLoading(false);
    }
  }

  async function register(data) {
    const res = await apiUserAuth.register(data);
    setUser(res.user);
    return res;
  }

  async function login(username, password) {
    const data = await apiUserAuth.login(username, password);
    setUser(data.user);
    return data;
  }

  async function updateProfile(data) {
    const res = await apiUserAuth.updateProfile(data);
    setUser(res.user);
    return res;
  }

  async function logout() {
    await apiUserAuth.logout();
    setUser(null);
  }

  return (
    <UserContext.Provider value={{ user, loading, register, login, updateProfile, logout, isUser: !!user }}>
      {children}
    </UserContext.Provider>
  );
}

export function useUser() {
  const context = useContext(UserContext);
  if (!context) throw new Error('useUser must be used within UserProvider');
  return context;
}