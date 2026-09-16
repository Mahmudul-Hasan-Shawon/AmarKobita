import { useState, useEffect, useCallback } from 'react';
import { useSearchParams } from 'react-router-dom';
import { apiUserAuth } from '../../api/client';
import { Stagger, Item } from '../../components/ui/motion.jsx';

export default function UsersAdminPage() {
  const [searchParams] = useSearchParams();
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState(searchParams.get('q') || '');
  const [busyId, setBusyId] = useState(null);
  const [tokenBox, setTokenBox] = useState(null);
  const [copied, setCopied] = useState(false);

  const load = useCallback(async (q = '') => {
    try {
      const data = await apiUserAuth.admin.users(q ? { search: q } : {});
      setUsers(data.users || []);
    } catch (err) {
      alert(err.message || 'Failed to load users');
    }
    setLoading(false);
  }, []);

  useEffect(() => {
    load(searchParams.get('q') || '');
  }, [load, searchParams]);

  const handleSearch = (e) => {
    e.preventDefault();
    setLoading(true);
    load(search);
  };

  const handleGenerate = async (user) => {
    setBusyId(user.id);
    try {
      const data = await apiUserAuth.admin.generateResetToken(user.username);
      setTokenBox(data);
      setCopied(false);
    } catch (err) {
      alert(err.message || 'Failed to generate reset token');
    }
    setBusyId(null);
  };

  const handleCopy = async () => {
    if (!tokenBox) return;
    try {
      await navigator.clipboard.writeText(tokenBox.token);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch {}
  };

  const handleDelete = async (user) => {
    if (!confirm(
      `Delete user "@${user.username}" (#${user.id}) permanently?\n\n` +
      'This removes their login and password, all their submissions, and if they have a published author ' +
      'page, that author and all linked writings are deleted too. This cannot be undone.'
    )) return;
    try {
      await apiUserAuth.admin.deleteUser(user.id);
      setUsers((current) => current.filter((u) => u.id !== user.id));
    } catch (err) {
      alert(err.message || 'Failed to delete user');
    }
  };

  const formatDate = (d) => {
    if (!d) return '';
    const iso = d.includes('T') ? d : d.replace(' ', 'T');
    return new Date(iso.endsWith('Z') ? iso : iso + 'Z').toLocaleDateString();
  };

  return (
    <Stagger className="max-w-4xl">
      <Item as="h1" y={0} className="font-body text-2xl text-ink-100 mb-6">Users</Item>

      <Item y={0}>
        <div className="mb-6 p-5 bg-ink-900/30 border border-ink-800/30 rounded-sm">
          <span className="block font-body text-xs text-ink-400 uppercase tracking-wider mb-3">
            Generate password reset token
          </span>
          <p className="font-body text-sm text-ink-500 mb-4">
            Search for a user and generate a one-time reset token. The token expires in 24 hours and can only be
            used once. Share it with the user — it works without email.
          </p>
          <form onSubmit={handleSearch} className="flex gap-3">
            <input
              type="text"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder="Search by username, email, or ID"
              className="input-field flex-1"
            />
            <button type="submit" className="btn-primary text-xs whitespace-nowrap">Search</button>
          </form>
        </div>
      </Item>

      {tokenBox && (
        <Item y={0}>
          <div className="mb-6 p-5 bg-gold-500/10 border border-gold-500/40 rounded-sm">
            <span className="block font-body text-xs text-gold-400 uppercase tracking-wider mb-3">
              Reset token for @{tokenBox.username}
            </span>
            <div className="flex items-center gap-3 mb-3">
              <code className="flex-1 select-all font-body text-lg text-ink-100 bg-ink-950 border border-ink-800 rounded-sm px-4 py-3 tracking-wide overflow-x-auto whitespace-nowrap">
                {tokenBox.token}
              </code>
              <button onClick={handleCopy} className="btn-primary text-xs whitespace-nowrap">
                {copied ? 'Copied' : 'Copy'}
              </button>
            </div>
            <p className="font-body text-xs text-ink-400">
              Expires {new Date(tokenBox.expires_at.replace(' ', 'T') + 'Z').toLocaleString()}.
              Send this token to the user; they enter it along with a new password at the{' '}
              <span className="text-gold-400">/reset-password</span> page.
            </p>
          </div>
        </Item>
      )}

      {loading ? (
        <Item y={0} className="py-10 text-center text-ink-500 font-body text-sm">Loading users...</Item>
      ) : users.length === 0 ? (
        <Item y={0} className="py-10 text-center text-ink-500 font-body text-sm">No users found.</Item>
      ) : (
        <div data-lenis-prevent className="space-y-2 overflow-auto max-h-[calc(100vh-20rem)] pr-1">
          {users.map((user) => (
            <Item
              key={user.id}
              className="flex items-center justify-between p-4 bg-ink-900/30 border border-ink-800/30 rounded-sm"
            >
              <div className="min-w-0">
                <span className="font-body text-sm text-ink-100 block truncate">
                  <span className="text-gold-400">#{user.id}</span> @{user.username}
                </span>
                <span className="font-body text-xs text-ink-500 block truncate">
                  {user.email || <em className="text-ink-600">no email</em>}
                  {user.created_at ? ` · joined ${formatDate(user.created_at)}` : ''}
                </span>
              </div>
              <div className="flex items-center gap-2 shrink-0">
                <button
                  onClick={() => handleGenerate(user)}
                  disabled={busyId === user.id}
                  className="btn-ghost text-xs whitespace-nowrap"
                >
                  {busyId === user.id ? 'Generating...' : 'Generate reset token'}
                </button>
                <button
                  onClick={() => handleDelete(user)}
                  className="text-ink-500 hover:text-red-400 transition-colors text-xs whitespace-nowrap"
                >
                  Delete
                </button>
              </div>
            </Item>
          ))}
        </div>
      )}
    </Stagger>
  );
}