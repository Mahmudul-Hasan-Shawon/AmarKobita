import { useState } from 'react';
import { Link } from 'react-router-dom';
import { useUser } from '../../context/UserContext';
import { apiUserAuth } from '../../api/client';
import { motion } from 'framer-motion';

const EASE = [0.22, 1, 0.36, 1];

export default function ResetPasswordPage() {
  const [username, setUsername] = useState('');
  const [token, setToken] = useState('');
  const [password, setPassword] = useState('');
  const [confirm, setConfirm] = useState('');
  const [message, setMessage] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const { isUser } = useUser();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setMessage('');
    setError('');
    if (password.length < 6) return setError('Password must be at least 6 characters');
    if (password !== confirm) return setError('Passwords do not match');
    setLoading(true);
    try {
      const data = await apiUserAuth.resetPassword(username, token, password);
      setMessage(data.message || 'Password reset successfully');
      setUsername('');
      setToken('');
      setPassword('');
      setConfirm('');
    } catch (err) {
      setError(err.message || 'Password reset failed');
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
            Reset password
          </span>
          <h1 className="font-display text-3xl font-light text-ink-100">Forgot your password?</h1>
          <p className="font-body text-sm text-ink-500 mt-2">
            Ask the site admin for a reset token. Enter it here with a new password to regain access.
          </p>
        </div>

        <form onSubmit={handleSubmit} className="space-y-4">
          {message && (
            <div className="p-3 bg-emerald-900/20 border border-emerald-800/30 rounded-sm">
              <p className="font-body text-sm text-emerald-400">{message}</p>
            </div>
          )}
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
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Reset token</label>
            <input
              type="text"
              value={token}
              onChange={(e) => setToken(e.target.value)}
              className="input-field"
              placeholder="XXXXXX-XXXXXX-XXXXXX"
              required
            />
            {!isUser && (
              <span className="block font-body text-xs text-ink-500 mt-2">
                No token yet? Contact the site admin to generate one for your account.
              </span>
            )}
          </div>

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">New password</label>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="input-field"
              placeholder="At least 6 characters"
              required
              minLength={6}
            />
          </div>

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Confirm new password</label>
            <input
              type="password"
              value={confirm}
              onChange={(e) => setConfirm(e.target.value)}
              className="input-field"
              required
            />
          </div>

          <button type="submit" disabled={loading} className="w-full btn-primary mt-6">
            {loading ? 'Resetting...' : 'Reset password'}
          </button>
        </form>

        <p className="font-body text-sm text-ink-500 text-center mt-6">
          Remembered it?{' '}
          <Link to="/login" className="text-gold-400 hover:text-gold-300 transition-colors">
            Sign in
          </Link>
        </p>
      </motion.div>
    </div>
  );
}