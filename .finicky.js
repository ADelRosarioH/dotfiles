// Finicky ≥ 4.4 (profile support). Profile names must match Firefox about:profiles exactly.
export default {
  // Everything else → Firefox "Personal" profile
  defaultBrowser: { name: "Firefox", profile: "Personal" },
  handlers: [
    {
      // Links clicked inside Slack → Firefox "Work" profile
      match: (url, { opener }) => opener?.bundleId === "com.tinyspeck.slackmacgap",
      browser: { name: "Firefox", profile: "Work" },
    },
  ],
};
