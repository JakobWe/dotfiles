local env = {
  HOME = vim.uv.os_homedir(),
  XDG_CACHE_HOME = os.getenv 'XDG_CACHE_HOME',
}

local function get_cache_dir()
  return env.XDG_CACHE_HOME or (env.HOME .. '/.cache')
end

local function get_jdtls_workspace_dir(project_name)
  return get_cache_dir() .. '/jdtls/workspace/' .. project_name
end

return {
  cmd = function()
    local root_dir = require('lspconfig.util').root_pattern(
      'gradlew', 'mvnw', '.git'
    )(vim.fn.getcwd())

    local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')

    return {
      'jdtls',
      '-data',
      get_jdtls_workspace_dir(project_name),
    }
  end,

  root_markers = { 'gradlew', 'mvnw', '.git' },
  filetypes = { 'java' },
}

