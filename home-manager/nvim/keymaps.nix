{ ... }:
{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      key = "gn";
    }
  ];
}

