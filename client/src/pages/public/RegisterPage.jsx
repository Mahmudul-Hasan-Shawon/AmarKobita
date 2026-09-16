import { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useUser } from '../../context/UserContext';
import { motion } from 'framer-motion';
import { COUNTRIES, LANGUAGES } from '../../utils/helpers';

const EASE = [0.22, 1, 0.36, 1];

export default function RegisterPage() {
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirm, setConfirm] = useState('');
  const [country, setCountry] = useState('');
  const [language, setLanguage] = useState('');
  const [birthDate, setBirthDate] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const { register, isUser } = useUser();
  const navigate = useNavigate();

  useEffect(() => {
    if (isUser) navigate('/submit', { replace: true });
  }, [isUser, navigate]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    if (password.length < 6) return setError('Password must be at least 6 characters');
    if (password !== confirm) return setError('Passwords do not match');
    if (birthDate && new Date(birthDate) >= new Date()) return setError('Date of birth must be in the past');
    setLoading(true);
    try {
      await register({
        username,
        email,
        password,
        country,
        language,
        birth_date: birthDate || null,
      });
      navigate('/profile', { replace: true });
    } catch (err) {
      setError(err.message || 'Registration failed');
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
            Join the archive
          </span>
          <h1 className="font-display text-3xl font-light text-ink-100">Create your account</h1>
          <p className="font-body text-sm text-ink-500 mt-2">
            Write with us, and let the archive carry your words.
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
              placeholder="How we'll credit your words"
              required
              minLength={3}
              autoFocus
            />
          </div>

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">
              Email <span className="normal-case text-ink-600">(optional)</span>
            </label>
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="input-field"
              placeholder="you@example.com"
            />
          </div>

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Password</label>
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
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Confirm password</label>
            <input
              type="password"
              value={confirm}
              onChange={(e) => setConfirm(e.target.value)}
              className="input-field"
              required
            />
          </div>

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Country</label>
            <select
              value={country}
              onChange={(e) => setCountry(e.target.value)}
              className="select-field"
              required
            >
              <option value="">Select your country</option>
              {COUNTRIES.map((c) => (
                <option key={c} value={c}>{c}</option>
              ))}
            </select>
          </div>

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Language you write in</label>
            <select
              value={language}
              onChange={(e) => setLanguage(e.target.value)}
              className="select-field"
              required
            >
              <option value="">Select language</option>
              {LANGUAGES.map((l) => (
                <option key={l.value} value={l.value}>{l.label}</option>
              ))}
            </select>
          </div>

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">
              Date of birth <span className="normal-case text-ink-600">(optional)</span>
            </label>
            <input
              type="date"
              value={birthDate}
              max={new Date().toISOString().split('T')[0]}
              onChange={(e) => setBirthDate(e.target.value)}
              className="input-field"
            />
          </div>

          <button type="submit" disabled={loading} className="w-full btn-primary mt-6">
            {loading ? 'Creating account...' : 'Create account'}
          </button>
        </form>

        <p className="font-body text-sm text-ink-500 text-center mt-6">
          Already have an account?{' '}
          <Link to="/login" className="text-gold-400 hover:text-gold-300 transition-colors">
            Sign in
          </Link>
        </p>
      </motion.div>
    </div>
  );
}