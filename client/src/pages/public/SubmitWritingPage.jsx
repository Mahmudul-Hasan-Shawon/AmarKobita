import { useState, useEffect } from 'react';
import { Link, useNavigate, useParams } from 'react-router-dom';
import { motion } from 'framer-motion';
import { useUser } from '../../context/UserContext';
import { apiSubmissions, apiCategories } from '../../api/client';
import { LANGUAGES, SUBMISSION_TYPES } from '../../utils/helpers';

const EASE = [0.22, 1, 0.36, 1];

const emptyState = { title: '', text: '', original_text: '', language: 'english', type: 'poetry', category_id: '' };

export default function SubmitWritingPage() {
  const { id } = useParams();
  const navigate = useNavigate();
  const isEdit = !!id;
  const { user, loading: authLoading } = useUser();
  const [form, setForm] = useState(emptyState);
  const [categories, setCategories] = useState([]);
  const [error, setError] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [done, setDone] = useState(false);

  useEffect(() => {
    async function load() {
      try {
        const data = await apiCategories.list();
        setCategories(data.categories || data || []);
      } catch {}
    }
    load();
  }, []);

  useEffect(() => {
    if (!isEdit || !user) return;
    (async () => {
      try {
        const s = await apiSubmissions.getMine(id);
        if (s.status !== 'pending' && s.status !== 'rejected') {
          setError('Only pending or rejected submissions can be edited');
          return;
        }
        setForm({
          title: s.title || '',
          text: s.text || '',
          original_text: s.original_text || '',
          language: s.language || 'english',
          type: s.type || 'poetry',
          category_id: s.category_id || '',
        });
      } catch {
        setError('Failed to load submission');
      }
    })();
  }, [isEdit, id, user]);

  const handleChange = (e) => {
    setForm((f) => ({ ...f, [e.target.name]: e.target.value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    if (!form.text.trim()) return setError('Please write something');
    setSubmitting(true);
    try {
      const payload = {
        title: form.title,
        text: form.text,
        original_text: form.original_text,
        language: form.language,
        type: form.type,
        category_id: form.category_id || null,
      };
      if (isEdit) {
        await apiSubmissions.updateMine(id, payload);
      } else {
        await apiSubmissions.create(payload);
      }
      setDone(true);
    } catch (err) {
      setError(err.message || 'Submission failed');
    }
    setSubmitting(false);
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
          <h1 className="font-display text-4xl font-light text-ink-100 mb-3">Share your words</h1>
          <p className="font-body text-ink-400 mb-8">
            Sign in to submit your writing. Once approved by our editors it earns a place in the
            archive, credited under your name.
          </p>
          <div className="flex flex-col gap-3">
            <Link to="/login" className="btn-primary w-full">Sign in</Link>
            <Link to="/join" className="btn-secondary w-full">Create an account</Link>
          </div>
        </motion.div>
      </div>
    );
  }

  if (done) {
    return (
      <div className="min-h-screen bg-ink-950 flex items-center justify-center px-6 py-28">
        <div className="grain-overlay" />
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, ease: EASE }}
          className="relative z-10 text-center max-w-md"
        >
          <div className="w-16 h-16 mx-auto mb-6 rounded-full bg-emerald-900/30 border border-emerald-800/40 flex items-center justify-center">
            <i className="fa-solid fa-feather-pointed text-emerald-400 text-xl" aria-hidden="true"></i>
          </div>
          <h1 className="font-display text-3xl font-light text-ink-100 mb-3">
            {isEdit ? 'Your words are on their way' : 'Your words are on their way'}
          </h1>
          <p className="font-body text-ink-400 mb-8">
            {isEdit
              ? "We've received your updated writing and it's back in the review queue. Follow its status from your submissions page."
              : "We'll review your submission. You can follow its status from your submissions page at any time."}
          </p>
          <div className="flex flex-col gap-3">
            <Link to="/my-submissions" className="btn-primary w-full">View my submissions</Link>
            <button type="button" onClick={() => { setDone(false); if (!isEdit) setForm(emptyState); }} className="btn-ghost">
              {isEdit ? 'Continue editing' : 'Submit another'}
            </button>
          </div>
        </motion.div>
      </div>
    );
  }

  return (
    <div className="pt-28 pb-16 min-h-screen">
      <div className="max-w-2xl mx-auto px-6">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, ease: EASE }}
          className="text-center mb-10"
        >
          <span className="font-body text-xs uppercase tracking-[0.3em] text-gold-500/60 mb-4 block">
            {isEdit ? 'Edit' : 'Contribute'}
          </span>
          <h1 className="font-display text-4xl md:text-5xl font-light text-ink-100 mb-4">
            {isEdit ? 'Edit your writing' : 'Share your writing'}
          </h1>
          <p className="font-body text-ink-400 max-w-md mx-auto">
            {isEdit
              ? 'Refine your piece and it will be sent back to our editors for a fresh review.'
              : 'Your words will be reviewed by our editors. Once approved, they appear in the archive, credited to you.'}
          </p>
        </motion.div>

        <motion.form
          onSubmit={handleSubmit}
          initial={{ opacity: 0, y: 24 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.1, ease: EASE }}
          className="space-y-5"
        >
          {error && (
            <div className="p-3 bg-red-900/20 border border-red-800/30 rounded-sm">
              <p className="font-body text-sm text-red-400">{error}</p>
            </div>
          )}

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Title <span className="normal-case text-ink-600">(optional)</span></label>
            <input
              type="text"
              name="title"
              value={form.title}
              onChange={handleChange}
              className="input-field"
              placeholder="A name for your piece"
            />
          </div>

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Your writing</label>
            <textarea
              name="text"
              value={form.text}
              onChange={handleChange}
              className="textarea-field"
              placeholder="Let your words breathe here..."
              required
            />
          </div>

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Original text <span className="normal-case text-ink-600">(if translated)</span></label>
            <textarea
              name="original_text"
              value={form.original_text}
              onChange={handleChange}
              className="input-field resize-y min-h-[100px]"
              placeholder="The original language version, if this is a translation"
            />
          </div>

          <div>
            <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Type of writing</label>
            <select name="type" value={form.type} onChange={handleChange} className="select-field">
              {SUBMISSION_TYPES.map((t) => (
                <option key={t.value} value={t.value}>{t.label}</option>
              ))}
            </select>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
            <div>
              <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Language</label>
              <select name="language" value={form.language} onChange={handleChange} className="select-field">
                {LANGUAGES.map((lang) => (
                  <option key={lang.value} value={lang.value}>{lang.label}</option>
                ))}
              </select>
            </div>

            <div>
              <label className="font-body text-xs text-ink-400 uppercase tracking-wider mb-1 block">Category <span className="normal-case text-ink-600">(optional)</span></label>
              <select name="category_id" value={form.category_id} onChange={handleChange} className="select-field">
                <option value="">None</option>
                {categories.map((cat) => (
                  <option key={cat.id} value={cat.id}>{cat.name}</option>
                ))}
              </select>
            </div>
          </div>

          <button type="submit" disabled={submitting} className="w-full btn-primary">
            {submitting ? (isEdit ? 'Saving...' : 'Submitting...') : isEdit ? 'Save changes' : 'Submit for review'}
          </button>
        </motion.form>
      </div>
    </div>
  );
}