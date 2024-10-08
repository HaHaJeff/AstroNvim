return function(_, opts)
require("gitlab").setup({
  port = nil, -- The port of the Go server, which runs in the background, if omitted or `nil` the port will be chosen automatically
  log_path = vim.fn.stdpath("cache") .. "/home/zjf225077/gitlab.nvim.log", -- Log path for the Go server
  config_path = /home/zjf225077/.gitlab.nvim, -- Custom path for `.gitlab.nvim` file, please read the "Connecting to Gitlab" section
  debug = { go_request = true, go_response = true}, -- Which values to log
  attachment_dir = nil, -- The local directory for files (see the "summary" section)
  help = "?", -- Opens a help popup for local keymaps when a relevant view is focused (popup, discussion panel, etc)
  popup = { -- The popup for comment creation, editing, and replying
    exit = "<Esc>",
    perform_action = "<leader>s", -- Once in normal mode, does action (like saving comment or editing description, etc)
    perform_linewise_action = "<leader>l", -- Once in normal mode, does the linewise action (see logs for this job, etc)
    width = "40%",
    height = "60%",
    border = "rounded", -- One of "rounded", "single", "double", "solid"
    opacity = 1.0, -- From 0.0 (fully transparent) to 1.0 (fully opaque)
    comment = nil, -- Individual popup overrides, e.g. { width = "60%", height = "80%", border = "single", opacity = 0.85 },
    edit = nil,
    note = nil,
    pipeline = nil,
    reply = nil,
    squash_message = nil,
  },
  discussion_tree = { -- The discussion tree that holds all comments
    auto_open = true, -- Automatically open when the reviewer is opened
    switch_view = "T", -- Toggles between the notes and discussions views
    default_view = "discussions" -- Show "discussions" or "notes" by default
    blacklist = {}, -- List of usernames to remove from tree (bots, CI, etc)
    jump_to_file = "o", -- Jump to comment location in file
    jump_to_reviewer = "m", -- Jump to the location in the reviewer window
    edit_comment = "e", -- Edit comment
    delete_comment = "dd", -- Delete comment
    reply = "r", -- Reply to comment
    toggle_node = "t", -- Opens or closes the discussion
    toggle_resolved = "p" -- Toggles the resolved status of the whole discussion
    position = "left", -- "top", "right", "bottom" or "left"
    open_in_browser = "b" -- Jump to the URL of the current note/discussion
    size = "10%", -- Size of split
    relative = "editor", -- Position of tree split relative to "editor" or "window"
    resolved = '✓', -- Symbol to show next to resolved discussions
    unresolved = '-', -- Symbol to show next to unresolved discussions
    tree_type = "simple", -- Type of discussion tree - "simple" means just list of discussions, "by_file_name" means file tree with discussions under file
    winbar = nil -- Custom function to return winbar title, should return a string. Provided with WinbarTable (defined in annotations.lua)
                 -- If using lualine, please add "gitlab" to disabled file types, otherwise you will not see the winbar.
  },
  info = { -- Show additional fields in the summary view
    enabled = true,
    horizontal = false, -- Display metadata to the left of the summary rather than underneath
    fields = { -- The fields listed here will be displayed, in whatever order you choose
      "author",
      "created_at",
      "updated_at",
      "merge_status",
      "draft",
      "conflicts",
      "assignees",
      "reviewers",
      "branch",
      "pipeline",
    },
  },
  discussion_sign_and_diagnostic = {
    skip_resolved_discussion = false,
    skip_old_revision_discussion = true,
  },
  discussion_sign = {
    -- See :h sign_define for details about sign configuration.
    enabled = true,
    text = "",
    linehl = nil,
    texthl = nil,
    culhl = nil,
    numhl = nil,
    priority = 20, -- Priority of sign, the lower the number the higher the priority
    helper_signs = {
      -- For multiline comments the helper signs are used to indicate the whole context
      -- Priority of helper signs is lower than the main sign (-1).
      enabled = true,
      start = "↑",
      mid = "|",
      ["end"] = "↓",
    },
  },
  discussion_diagnostic = {
    -- If you want to customize diagnostics for discussions you can make special config
    -- for namespace `gitlab_discussion`. See :h vim.diagnostic.config
    enabled = true,
    severity = vim.diagnostic.severity.INFO,
    code = nil, -- see :h diagnostic-structure
    display_opts = {}, -- see opts in vim.diagnostic.set
  },
  pipeline = {
    created = "",
    pending = "",
    preparing = "",
    scheduled = "",
    running = "",
    canceled = "↪",
    skipped = "↪",
    success = "✓",
    failed = "",
  },
  merge = { -- The default behaviors when merging an MR, see "Merging an MR"
    squash = false,
    delete_branch = false,
  },
  create_mr = {
    target = nil, -- Default branch to target when creating an MR
    template_file = nil, -- Default MR template in .gitlab/merge_request_templates
  },
  colors = {
    discussion_tree = {
      username = "Keyword",
      date = "Comment",
      chevron = "DiffviewNonText",
      directory = "Directory",
      directory_icon = "DiffviewFolderSign",
      file_name = "Normal",
      }
  }
})
end
