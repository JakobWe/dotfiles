




--local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

return {
  cmd = { 'jdtls'},
  root_markers = { 'gradlew', '.git', 'mvnw' },
  filetypes = { 'java' },
  --capabilities = capabilities
}



