import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { motion } from 'framer-motion';
import { useUser } from '../../context/UserContext';
import { COUNTRIES, LANGUAGES, formatDate } from '../../utils/helpers';

const EASE = [0.22, 1, 0.36, 1];

export default function ProfilePage() {
  const { user, loading: authLoading, updateProfile } = useUser();
  const [form, setForm] = useState({});
  const [error, setError] = useState('');
  const [notice, setNotice] = useState('');
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    if (user) {
      setForm({
        display_name: user.display_name || '',
        email: user.email || '',
        country: user.country || '',
        language: user.language || '',
        birth_date: user.birth_date || '',
        short_bio: user.short_bio || '',
        portrait: user.portrait || '',
      });
    }
  }, [user]);

  const handleChange = (e) => {
    setForm((f) => ({ ...f, [e.target.name]: e.target.value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setNotice('');
    if (form.birth_date && new Date(form.birth_date) >= new Date()) {
      return setError('Date of birth must be in the past');
    }
    setSaving(true);
    try {
      await updateProfile(form);
      setNotice('Profile saved. It will appear on your author page.');
    } catch (err) {
      setError(err.message || 'Failed to save profile');
    }
    setSaving(false);
  };

  if (authLoading) return null;

  if (!user) {
    return (
      <div className="min-h-screen bg-ink-950 flex items-center justify-center px-6 py-28">
        <div className="grain-overlay" />
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, ease: EASE }}
          className="relative z-10 text-center max-w-md"
        >
          <h1 className="font-display text-4xl font-light text-ink-100 mb-3">Your profile</h1>
          <p className="font-body text-ink-400 mb-8">
            Sign in to shape how your words are credited in the archive.
          </p>
          <div className="flex flex-col gap-3">
            <Link to="/login" className="btn-primary w-full">Sign in</Link>
            <Link to="/join" className="btn-secondary w-full">Create an account</Link>
          </div>
        </motion.div>
      </div>
    );
  }

  return (
    <div className="pt-28 pb-16 min-h-screen">
      <div className="max-w-3xl mx-auto px-6">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, ease: EASE }}
          className="mb-10"
        >
          <span className="font-body text-xs uppercase tracking-[0.3em] text-gold-500/60 mb-4 block">
            Your page
          </span>
          <h1 className="font-display text-4xl md:text-5xl font-light text-ink-100 mb-2">
            Profile
          </h1>
          <p className="font-body text-ink-400 max-w-lg">
            What you share here becomes your author page once your writing is published.
          </p>
        </motion.div>

        <div className="grid grid-cols-1 gap-8">
          {/* Identity card */}
          <motion.div
            initial={{ opacity: 0, y: 16 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, ease: EASE }}
            className="p-6 bg-ink-900/40 border border-ink-800/30 rounded-sm flex items-center gap-5"
          >
            {user.portrait ? (
              <img src={user.portrait} alt={user.display_name || user.username} className="w-16 h-16 rounded-full object-cover border-2 border-gold-500/30" />
            ) : (
              <div className="w-16 h-16 rounded-full bg-gradient-to-br from-gold-500/20 to-gold-600/10 flex items-center justify-center border-2 border-gold-500/30 shrink-0">
                <span className="font-display text-2xl text-gold-400">
                  {(user.display_name || user.username).charAt(0).toUpperCase()}
                </span>
              </div>
            )}
            <div className="min-w-0">
              <h2 className="font-display text-xl text-ink-100 truncate">
                {user.display_name || user.username}
              </h2>
              <p className="font-body text-xs text-ink-500">
                @{user.username}
                {user.created_at ? ` · joined ${formatDate(user.created_at)}` : ''}
              </p>
              {user.author_slug ? (
                <Link
                  to={`/authors/${user.author_slug}`}
                  className="font-body text-xs text-gold-400 hover:text-gold-300 transition-colors mt-1 inline-block"
                >
                  View your author page →
                </Link>
              ) : (
                <p className="font-body text-xs text-ink-600 mt-1">
                  Your author page appears here after your first writing is approved.
                </p>
              )}
            </div>
          </motion.div>

          {/* Edit form */}
          <motion.form
            onSubmit={handleSubmit}
            initial={{ opacity: 0, y: 16 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: 0.05, ease: EASE }}
            className="p-6 bg-ink-900/40 border border-ink-800/30 rounded-sm space-y-5"
          >
            {error && (
              <div className="p-3 bg-red-900/20 border border-red-800/30 rounded-sm">
                <p className="font-body text-sm text-red-400">{error}</p>
              </div>
            )}
            {notice && (
              <div className="p-3 bg-emerald-900/20 border border-emerald-800/30 rounded-sm">
                <p className="font-body text-sm text-emerald-400">{notice}</p>
              </div>
            )}

            <div>
              <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">
                Display name <span className="normal-case text-ink-600">(shown on your author page)</span>
              </label>
              <input
                type="text"
                name="display_name"
                value={form.display_name}
                onChange={handleChange}
                className="input-field"
                placeholder={user.username}
              />
            </div>

            <div>
              <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">
                Email <span className="normal-case text-ink-600">(optional)</span>
              </label>
              <input
                type="email"
                name="email"
                value={form.email}
                onChange={handleChange}
                className="input-field"
                placeholder="you@example.com"
              />
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
              <div>
                <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Country</label>
                <select name="country" value={form.country} onChange={handleChange} className="select-field">
                  <option value="">Select your country</option>
                  {COUNTRIES.map((c) => (
                    <option key={c} value={c}>{c}</option>
                  ))}
                </select>
              </div>

              <div>
                <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Language you write in</label>
                <select name="language" value={form.language} onChange={handleChange} className="select-field">
                  <option value="">Select language</option>
                  {LANGUAGES.map((l) => (
                    <option key={l.value} value={l.value}>{l.label}</option>
                  ))}
                </select>
              </div>
            </div>

            <div>
              <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">
                Date of birth <span className="normal-case text-ink-600">(optional)</span>
              </label>
              <input
                type="date"
                name="birth_date"
                value={form.birth_date || ''}
                max={new Date().toISOString().split('T')[0]}
                onChange={handleChange}
                className="input-field"
              />
            </div>

            <div>
              <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Short bio</label>
              <textarea
                name="short_bio"
                value={form.short_bio}
                onChange={handleChange}
                className="textarea-field min-h-[100px]"
                placeholder="A few words about you — shown on your author page"
              />
            </div>

            <div>
              <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">
                Portrait URL <span className="normal-case text-ink-600">(optional)</span>
              </label>
              <input
                type="url"
                name="portrait"
                value={form.portrait}
                onChange={handleChange}
                className="input-field"
                placeholder="https://..."
              />
            </div>

            <div className="flex items-center gap-4 pt-2">
              <button type="submit" disabled={saving} className="btn-primary">
                {saving ? 'Saving...' : 'Save profile'}
              </button>
              <Link to="/my-submissions" className="font-body text-xs text-ink-500 hover:text-gold-400 transition-colors">
                View my submissions
              </Link>
            </div>
          </motion.form>
        </div>
      </div>
    </div>
  );
}