{
  programs.nvf.settings.vim = {
    telescope.mappings = {
      buffers = "<leader>bb";
      gitBranches = "<leader>gB";
      gitBufferCommits = "<leader>gC";
      gitCommits = "<leader>gc";
      gitFiles = "<leader>gf";
      gitStash = "<leader>gx";
      gitStatus = "<leader>gs";
    };

    git.gitsigns.mappings = {
      blameLine = "<leader>ghb";
      diffProject = "<leader>ghD";
      diffThis = "<leader>ghd";
      previewHunk = "<leader>ghP";
      resetBuffer = "<leader>ghR";
      resetHunk = "<leader>ghr";
      stageBuffer = "<leader>ghS";
      stageHunk = "<leader>ghs";
      toggleBlame = "<leader>gtb";
      toggleDeleted = "<leader>gtd";
      undoStageHunk = "<leader>ghu";
    };

    utility.yazi-nvim.mappings = {
      openYazi = "<leader>ee";
      openYaziDir = "<leader>ed";
      yaziToggle = "<leader>er";
    };

    keymaps = [
      {
        key = "<leader>bn";
        action = "<cmd>bnext<CR>";
        desc = "Next buffer";
        mode = "n";
      }
      {
        key = "<leader>bp";
        action = "<cmd>bprevious<CR>";
        desc = "Previous buffer";
        mode = "n";
      }
      {
        key = "<leader>bd";
        action = "<cmd>bdelete<CR>";
        desc = "Delete buffer";
        mode = "n";
      }
      {
        key = "<leader>pp";
        action = ":Pi<CR>";
        desc = "Send to Pi";
        mode = ["n" "v"];
      }
      {
        key = "<leader>pf";
        action = "<cmd>PiSendFile<CR>";
        desc = "Send file to Pi";
        mode = "n";
      }
      {
        key = "<leader>pb";
        action = "<cmd>PiSendBuffer<CR>";
        desc = "Send buffer to Pi";
        mode = "n";
      }
      {
        key = "<leader>ps";
        action = ":PiSendSelection<CR>";
        desc = "Send selection to Pi";
        mode = "v";
      }
      {
        key = "<leader>pi";
        action = "<cmd>PiPing<CR>";
        desc = "Ping Pi session";
        mode = "n";
      }
    ];
  };
}
