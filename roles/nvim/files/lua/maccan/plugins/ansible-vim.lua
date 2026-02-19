return {
  "pearofducks/ansible-vim",
  ft = { "yaml", "yaml.ansible" },
  init = function()
    -- detect ansible files in common ansible directory structures
    vim.g.ansible_ftdetect_filename_regex = [[\v(playbook|site|main|local|requirements)\.ya?ml$]]
    vim.g.ansible_unindent_after_newline = 1
    vim.g.ansible_attribute_highlight = "ob"
    vim.g.ansible_name_highlight = "b"
    vim.g.ansible_extra_keywords_highlight = 1
  end,
}
