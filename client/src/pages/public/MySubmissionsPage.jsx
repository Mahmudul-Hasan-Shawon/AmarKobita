import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { motion } from 'framer-motion';
import { useUser } from '../../context/UserContext';
import { apiSubmissions } from '../../api/client';
import { formatDate, languageLabel } from '../../utils/helpers';

const EASE = [0.22, 1, 0.36, 1];

const STATUS_LABELS = {
  pending: 'Under review',
  approved: 'Approved',
  rejected: 'Rejected',
};

export default function MySubmissionsPage() {
  const { user, loading: authLoading } = useUser();
  const [submissions, setSubmissions] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [deletingId, setDeletingId] = useState(null);

  async function load() {
    setLoading(true);
    try {
      const data = await apiSubmissions.mine();
      setSubmissions(data);
    } catch {
      setError('Failed to load your submissions');
    }
    setLoading(false);
  }

  useEffect(() => {
    if (user) load();
  }, [user]); // eslint-disable-line react-hooks/exhaustive-deps

  async function handleDelete(id) {
    if (!window.confirm('Delete this submission permanently? This cannot be undone.')) return;
    setDeletingId(id);
    try {
      await apiSubmissions.deleteMine(id);
      setSubmissions((s) => s.filter((x) => x.id !== id));
    } catch (err) {
      setError(err.message || 'Failed to delete');
    }
    setDeletingId(null);
  }

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
          <h1 className="font-display text-4xl font-light text-ink-100 mb-3">My submissions</h1>
          <p className="font-body text-ink-400 mb-8">Sign in to see the status of your writings.</p>
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
        >
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-10">
            <div>
              <span className="font-body text-xs uppercase tracking-[0.3em] text-gold-500/60 mb-4 block">
                My writings
              </span>
              <h1 className="font-display text-4xl md:text-5xl font-light text-ink-100">
                Your submissions
              </h1>
            </div>
            <Link to="/submit" className="btn-primary text-xs whitespace-nowrap">
              + New submission
            </Link>
          </div>

          {error && (
            <div className="p-3 bg-red-900/20 border border-red-800/30 rounded-sm mb-6">
              <p className="font-body text-sm text-red-400">{error}</p>
            </div>
          )}

          {loading ? (
            <div className="space-y-4">
              {[0, 1, 2].map((i) => (
                <div key={i} className="skeleton h-32 rounded-sm" />
              ))}
            </div>
          ) : submissions.length === 0 ? (
            <motion.div
              initial={{ opacity: 0, y: 16 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.5, ease: EASE }}
              className="text-center py-16 border border-dashed border-ink-700/50 rounded-sm"
            >
              <i className="fa-solid fa-feather text-ink-600 text-2xl mb-4" aria-hidden="true"></i>
              <p className="font-display text-xl text-ink-200 mb-2">Nothing here yet</p>
              <p className="font-body text-sm text-ink-500 mb-6">
                When you share a writing, its status will appear here.
              </p>
              <Link to="/submit" className="btn-secondary text-xs">Share your first writing</Link>
            </motion.div>
          ) : (
            <div className="space-y-4">
              {submissions.map((s) => (
                <motion.div
                  key={s.id}
                  initial={{ opacity: 0, y: 16 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ duration: 0.5, ease: EASE }}
                  className="p-6 bg-ink-900/40 border border-ink-800/30 rounded-sm"
                >
                  <div className="flex items-start justify-between gap-4">
                    <div className="min-w-0">
                      <h3 className="font-display text-xl text-ink-100 mb-1 truncate">
                        {s.title || 'Untitled'}
                      </h3>
                      <p className="font-body text-xs text-ink-500 mb-3">
                        {languageLabel(s.language)}
                        {s.category ? ` · ${s.category.name}` : ''} · {formatDate(s.created_at)}
                      </p>
                    </div>
                    <span className={`badge whitespace-nowrap badge-${s.status}`}>
                      {STATUS_LABELS[s.status] || s.status}
                    </span>
                  </div>

                  <blockquote className="border-l-2 border-ink-700 pl-4 mb-4">
                    <p className="font-serif text-sm text-ink-300 leading-relaxed line-clamp-3">
                      {s.text}
                    </p>
                  </blockquote>

                  {s.status === 'approved' && s.writing && (
                    <p className="font-body text-xs text-emerald-400 flex items-center gap-2 mb-3">
                      <i className="fa-solid fa-circle-check" aria-hidden="true"></i>
                      Approved{ s.writing.status === 'published' ? ' and now part of the archive' : ' — will be published soon' }
                    </p>
                  )}

                  {s.status === 'rejected' && s.admin_note && (
                    <div className="p-3 bg-red-900/10 border border-red-800/30 rounded-sm mb-3">
                      <p className="font-body text-xs text-red-300">
                        <span className="text-red-400 font-semibold">Editor's note: </span>
                        {s.admin_note}
                      </p>
                    </div>
                  )}

                  {s.status === 'pending' && (
                    <button
                      type="button"
                      onClick={() => handleDelete(s.id)}
                      disabled={deletingId === s.id}
                      className="text-ink-500 hover:text-red-400 transition-colors text-xs font-body"
                    >
                      {deletingId === s.id ? 'Deleting...' : 'Withdraw submission'}
                    </button>
                  )}
                </motion.div>
              ))}
            </div>
          )}
        </motion.div>
      </div>
    </div>
  );
}