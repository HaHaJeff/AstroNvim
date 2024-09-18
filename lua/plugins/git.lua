return {
    {
        "lewis6991/gitsigns.nvim",
        enabled = vim.fn.executable "git" == 1,
        ft = "gitcommit",
        event = "User AstroGitFile",
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "▎" },
                topdelete = { text = "󰐊" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
        },
    },
    --{
    --    'git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git',
    --    --event = { 'BufReadPre', 'BufNewFile' }, -- Activate when a file is created/opened
    --    ft = { 'cpp', 'c' }, -- Activate when a supported filetype is open
    --    opts = {
    --        statusline = {
    --            enabled = true, -- Hook into the builtin statusline to indicate the status of the GitLab Duo Code Suggestions integration
    --        },
    --    },
    --},
    {
        "harrisoncramer/gitlab.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
            "nvim-tree/nvim-web-devicons" -- Recommended but not required. Icons in discussion tree.
        },
        enabled = true,
        --build = function () require("gitlab.server").build(true) end, -- Builds the Go binary
        config = function()
            require("gitlab").setup()
        end,
    },
    {
      url="git@gitlab.alibaba-inc.com:trip-tools/aone-copilot.nvim.git",
      config = function()
        -- 如果触发补全的 mapping 有冲突，重新定义触发键
        vim.g.aone_copilot_trigger = '<c-m>'
        vim.g.aone_copilot_token = 'LSB5YVV0ckZERGVROGo0bTJzd3hjTAo='
      end
    }
}
