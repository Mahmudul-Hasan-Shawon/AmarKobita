import { useState, useEffect, useCallback } from 'react';
import { useSearchParams } from 'react-router-dom';
import { apiSubmissions } from '../../api/client';
import Pagination from '../../components/ui/Pagination';
import { formatShortDate, languageLabel, writingTypeLabel } from '../../utils/helpers';
import { Stagger, Item } from '../../components/ui/motion.jsx';

const TABS = [
  { value: '', label: 'All' },
  { value: 'pending', label: 'Pending' },
  { value: 'approved', label: 'Approved' },
  { value: 'rejected', label: 'Rejected' },
];

const STATUS_LABELS = {
  pending: 'Pending',
  approved: 'Approved',
  rejected: 'Rejected',
};

export default function SubmissionsPage() {
  const [submissions, setSubmissions] = useState([]);
  const [pagination, setPagination] = useState(null);
  const [loading, setLoading] = useState(true);
  const [tab, setTab] = useState('pending');
  const [expandedId, setExpandedId] = useState(null);
  const [rejectingId, setRejectingId] = useState(null);
  const [rejectNote, setRejectNote] = useState('');
  const [error, setError] = useState('');
  const [searchParams] = useSearchParams();
  const currentPage = parseInt(searchParams.get('page') || '1');

  const load = useCallback(async (p = currentPage, status = tab) => {
    setLoading(true);
    setError('');
    try {
      const data = await apiSubmissions.admin.list({ page: p, limit: 20, ...(status ? { status } : {}) });
      setSubmissions(data.submissions);
      setPagination(data.pagination);
    } catch {
      setError('Failed to load submissions');
    }
    setLoading(false);
  }, [currentPage, tab]);

  useEffect(() => { load(); }, [load]);

  const changeTab = (value) => {
    setTab(value);
    setExpandedId(null);
  };

  const handleApprove = async (id) => {
    if (!window.confirm('Approve this submission?\n\nThis creates a DRAFT writing (plus an author entry for the submitter) that you can review in Writings and publish.')) return;
    try {
      await apiSubmissions.admin.approve(id, null);
      load();
    } catch (err) {
      setError(err.message || 'Failed to approve');
    }
  };

  const handleReject = async (id) => {
    try {
      await apiSubmissions.admin.reject(id, rejectNote.trim() || null);
      setRejectingId(null);
      setRejectNote('');
      load();
    } catch (err) {
      setError(err.message || 'Failed to reject');
    }
  };

  const handleDelete = async (id) => {
    if (!window.confirm('Delete this submission permanently?')) return;
    try {
      await apiSubmissions.admin.delete(id);
      load();
    } catch (err) {
      setError(err.message || 'Failed to delete');
    }
  };

  return (
    <Stagger>
      <Item y={0} className="flex items-center justify-between mb-6">
        <div>
          <h1 className="font-body text-2xl text-ink-100">Submissions</h1>
          <p className="font-body text-sm text-ink-500 mt-1">Community writings awaiting your review</p>
        </div>
        <span className="badge badge-pending">{pagination?.total || 0} shown</span>
      </Item>

      <Item y={0} className="flex flex-wrap items-center gap-2 mb-4">
        {TABS.map((t) => (
          <button
            key={t.value}
            onClick={() => changeTab(t.value)}
            className={`px-4 py-2 rounded-sm font-body text-sm transition-all duration-200 ${
              tab === t.value
                ? 'bg-gold-500/10 text-gold-400 border border-gold-500/40'
                : 'text-ink-400 hover:text-ink-100 border border-ink-800 hover:border-ink-600'
            }`}
          >
            {t.label}
          </button>
        ))}
      </Item>

      {error && (
        <Item y={0} className="p-3 bg-red-900/20 border border-red-800/30 rounded-sm mb-4">
          <p className="font-body text-sm text-red-400">{error}</p>
        </Item>
      )}

      <Item y={0}>
      {loading ? (
        <div className="space-y-3">
          {[0, 1, 2, 3].map((i) => <div key={i} className="skeleton h-20 rounded-sm" />)}
        </div>
      ) : submissions.length === 0 ? (
        <div className="text-center py-16 border border-dashed border-ink-700/50 rounded-sm">
          <i className="fa-solid fa-inbox text-ink-600 text-2xl mb-4" aria-hidden="true"></i>
          <p className="font-display text-xl text-ink-200">No submissions here</p>
        </div>
      ) : (
        <div data-lenis-prevent className="overflow-auto max-h-[calc(100vh-15rem)] border border-ink-800/30">
          <table className="admin-table">
            <thead>
              <tr>
                <th>Submitter</th>
                <th>Writing</th>
                <th>Type</th>
                <th>Language</th>
                <th>Status</th>
                <th>Submitted</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {submissions.map((s) => (
                <Item as="tr" key={s.id}>
                  <td>
                    <p className="text-ink-100">{s.user_name}</p>
                    {s.user_email && <p className="text-xs text-ink-500">{s.user_email}</p>}
                  </td>
                  <td>
                    <button
                      onClick={() => setExpandedId(expandedId === s.id ? null : s.id)}
                      className="text-left group"
                    >
                      <p className="text-ink-100 line-clamp-2 max-w-xs group-hover:text-gold-400 transition-colors">
                        {s.title || 'Untitled'}
                      </p>
                      {s.category && <p className="text-xs text-ink-500 mt-1">{s.category.name}</p>}
                    </button>
                    {expandedId === s.id && (
                      <div className="mt-3 p-4 bg-ink-900/60 border border-ink-800/40 rounded-sm max-w-xl">
                        <p className="font-serif text-ink-200 leading-relaxed whitespace-pre-wrap mb-3">{s.text}</p>
                        {s.original_text && (
                          <div className="border-t border-ink-800 pt-3">
                            <p className="font-body text-xs text-ink-500 uppercase tracking-wider mb-1">Original text</p>
                            <p className="font-serif text-ink-400 leading-relaxed whitespace-pre-wrap">{s.original_text}</p>
                          </div>
                        )}
                        {s.status === 'rejected' && s.admin_note && (
                          <div className="mt-3 p-3 bg-red-900/10 border border-red-800/30 rounded-sm">
                            <p className="font-body text-xs text-red-300"><span className="text-red-400 font-semibold">Editor's note:</span> {s.admin_note}</p>
                          </div>
                        )}
                        {s.writing && (
                          <p className="mt-3 font-body text-xs text-emerald-400">
                            Linked to writing #{s.writing.id} — {s.writing.status === 'draft' ? 'draft awaiting publish' : 'published'}
                          </p>
                        )}
                      </div>
                    )}
                  </td>
                  <td className="text-ink-400 text-sm">{writingTypeLabel(s.type)}</td>
                  <td className="text-ink-400 text-sm">{languageLabel(s.language)}</td>
                  <td><span className={`badge badge-${s.status}`}>{STATUS_LABELS[s.status]}</span></td>
                  <td className="text-ink-500 text-xs">{formatShortDate(s.created_at)}</td>
                  <td>
                    {s.status === 'pending' ? (
                      <div className="flex items-center gap-3">
                        <button onClick={() => handleApprove(s.id)} className="font-body text-xs text-emerald-400 hover:text-emerald-300 transition-colors" title="Approve">
                          <i className="fa-solid fa-circle-check mr-1" aria-hidden="true"></i>Approve
                        </button>
                        {rejectingId === s.id ? (
                          <div className="flex items-center gap-2">
                            <input
                              value={rejectNote}
                              onChange={(e) => setRejectNote(e.target.value)}
                              placeholder="Reason (optional)"
                              className="input-field max-w-[180px] !py-1.5"
                              autoFocus
                            />
                            <button onClick={() => handleReject(s.id)} className="font-body text-xs text-red-400 font-semibold">Reject</button>
                            <button onClick={() => { setRejectingId(null); setRejectNote(''); }} className="font-body text-xs text-ink-500">Cancel</button>
                          </div>
                        ) : (
                          <button onClick={() => setRejectingId(s.id)} className="font-body text-xs text-red-400 hover:text-red-300 transition-colors" title="Reject">
                            <i className="fa-solid fa-circle-xmark mr-1" aria-hidden="true"></i>Reject
                          </button>
                        )}
                        <button onClick={() => handleDelete(s.id)} className="text-ink-400 hover:text-red-400 transition-colors" title="Delete">
                          <i className="fa-solid fa-trash-can" aria-hidden="true"></i>
                        </button>
                      </div>
                    ) : (
                      <button onClick={() => handleDelete(s.id)} className="text-ink-400 hover:text-red-400 transition-colors" title="Delete">
                        <i className="fa-solid fa-trash-can" aria-hidden="true"></i>
                      </button>
                    )}
                  </td>
                </Item>
              ))}
            </tbody>
          </table>
        </div>
      )}
      </Item>

      {pagination && <Pagination pagination={pagination} />}
    </Stagger>
  );
}