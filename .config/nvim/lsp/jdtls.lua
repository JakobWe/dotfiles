--local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


local env = {
  HOME = vim.uv.os_homedir(),
  XDG_CACHE_HOME = os.getenv 'XDG_CACHE_HOME',
  JDTLS_JVM_ARGS = os.getenv 'JDTLS_JVM_ARGS',
}

local function get_cache_dir()
  return env.XDG_CACHE_HOME and env.XDG_CACHE_HOME or env.HOME .. '/.cache'
end

local function get_jdtls_cache_dir()
  return get_cache_dir() .. '/jdtls'
end

local function get_jdtls_config_dir()
  return get_jdtls_cache_dir() .. '/config'
end

local function get_jdtls_workspace_dir()
  return get_jdtls_cache_dir() .. '/workspace'
end


return {
    cmd = {
      'jdtls',
      '-data',
      get_jdtls_workspace_dir(),
    },
  root_markers = { 'gradlew', '.git', 'mvnw' },
  filetypes = { 'java' },
}


-- return {
--   cmd = { 'jdtls'},
--   root_markers = { 'gradlew', '.git', 'mvnw' },
--   filetypes = { 'java' },
--   --capabilities = capabilities
-- }



