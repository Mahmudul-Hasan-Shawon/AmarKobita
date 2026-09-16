import { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useUser } from '../../context/UserContext';
import { motion } from 'framer-motion';

const EASE = [0.22, 1, 0.36, 1];

export default function UserLoginPage() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const { login, isUser } = useUser();
  const navigate = useNavigate();

  useEffect(() => {
    if (isUser) navigate('/submit', { replace: true });
  }, [isUser, navigate]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setLoading(true);
    try {
      await login(username, password);
      navigate('/submit');
    } catch (err) {
      setError(err.message || 'Invalid credentials');
    }
    setLoading(false);
  };

  return (
    <div className="min-h-screen bg-ink-950 flex items-center justify-center px-6 py-28">
      <div className="grain-overlay" />

      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6, ease: EASE }}
        className="relative z-10 w-full max-w-sm"
      >
        <div className="text-center mb-8">
          <span className="font-body text-xs uppercase tracking-[0.3em] text-gold-500/60 mb-4 block">
            Welcome back
          </span>
          <h1 className="font-display text-3xl font-light text-ink-100">Sign in</h1>
          <p className="font-body text-sm text-ink-500 mt-2">
            Check your submissions and share new writings.
          </p>
        </div>

        <form onSubmit={handleSubmit} className="space-y-4">
          {error && (
            <div className="p-3 bg-red-900/20 border border-red-800/30 rounded-sm">
              <p className="font-body text-sm text-red-400">{error}</p>
            </div>
          )}

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Username</label>
            <input
              type="text"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              className="input-field"
              required
              autoFocus
            />
          </div>

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Password</label>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="input-field"
              required
            />
          </div>

          <button type="submit" disabled={loading} className="w-full btn-primary mt-6">
            {loading ? 'Signing in...' : 'Sign in'}
          </button>
        </form>

        <p className="font-body text-sm text-ink-500 text-center mt-6">
          New here?{' '}
          <Link to="/join" className="text-gold-400 hover:text-gold-300 transition-colors">
            Create an account
          </Link>
        </p>
      </motion.div>
    </div>
  );
}