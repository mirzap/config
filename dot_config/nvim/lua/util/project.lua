-- lua/util/project.lua
-- Project detection utility for conditional plugin loading
-- Uses only built-in Neovim APIs (no plugin dependencies)

local M = {}

-- Language marker definitions
M.markers = {
  java = { "pom.xml", "build.gradle", "build.gradle.kts", "settings.gradle", "mvnw", "gradlew" },
  node = { "package.json", "tsconfig.json", "jsconfig.json", "pnpm-lock.yaml", "yarn.lock", "bun.lockb", "deno.json", "deno.jsonc" },
  python = { "pyproject.toml", "poetry.lock", "requirements.txt", "Pipfile", "setup.py" },
  go = { "go.mod", "go.work" },
  rust = { "Cargo.toml" },
  clang = { "compile_commands.json", "CMakeLists.txt", "meson.build", "Makefile" },
  terraform = { "main.tf", "terraform.tf", "providers.tf" },
}

---Safe require that returns nil on failure
---@param modname string
---@return any|nil module, string|nil error
function M.safe_require(modname)
  local ok, result = pcall(require, modname)
  if ok then
    return result, nil
  end
  return nil, result
end

---Find project root by searching upward for marker files
---@param markers string[] filenames to search for
---@param start_path? string starting path (default: current buffer or cwd)
---@return string|nil dir containing the found marker
function M.find_root(markers, start_path)
  start_path = start_path or vim.fn.expand("%:p:h")
  if start_path == "" or start_path == "." then
    start_path = vim.fn.getcwd()
  end

  local found = vim.fs.find(markers, {
    path = start_path,
    upward = true,
    stop = vim.env.HOME,
    type = "file",
  })

  if found and #found > 0 then
    return vim.fn.fnamemodify(found[1], ":h")
  end
  return nil
end

---Get the best-effort project root
---@param start_path? string
---@return string project root or cwd
function M.root(start_path)
  -- Try common project markers in order of preference
  local all_markers = {}
  for _, markers in pairs(M.markers) do
    vim.list_extend(all_markers, markers)
  end
  -- Add git as fallback
  table.insert(all_markers, ".git")

  local root = M.find_root(all_markers, start_path)
  return root or vim.fn.getcwd()
end

---Check if any of the markers exist in the project
---@param markers string[]
---@param start_path? string
---@return boolean
function M.has_any(markers, start_path)
  return M.find_root(markers, start_path) ~= nil
end

---Detect which languages are present in the project
---@param start_path? string
---@return table<string, boolean> e.g., { java=true, node=true }
function M.detect_languages(start_path)
  local detected = {}
  for lang, markers in pairs(M.markers) do
    if M.has_any(markers, start_path) then
      detected[lang] = true
    end
  end
  return detected
end

---Check if this is a specific type of project
---@param lang string language key from M.markers
---@param start_path? string
---@return boolean
function M.is_project(lang, start_path)
  local markers = M.markers[lang]
  if not markers then
    return false
  end
  return M.has_any(markers, start_path)
end

return M
