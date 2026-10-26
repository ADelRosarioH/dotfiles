export default {
  // Everything else → Firefox "Personal" profile
  defaultBrowser: { name: "Firefox", args: ["-P", "Personal"] },
  handlers: [
    {
      // Links clicked inside Slack → Firefox "Work" profile
      match: (url, { opener }) => opener?.bundleId === "com.tinyspeck.slackmacgap",
      browser: { name: "Firefox", args: ["-P", "Work"] },
    },
  ],
};
