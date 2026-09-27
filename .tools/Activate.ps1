$WorkspaceRoot = Split-Path -Parent $PSScriptRoot
$env:PATH = "$PSScriptRoot;$env:PATH"
$env:UV_OFFLINE = 'true'
$env:UV_FROZEN = 'true'
$env:UV_PYTHON_DOWNLOADS = 'never'
$env:UV_CACHE_DIR = Join-Path $WorkspaceRoot '.uv-cache'
$env:UV_PROJECT_ENVIRONMENT = Join-Path $WorkspaceRoot 'libs/core/.venv'
$OriginUrl = git -C $WorkspaceRoot remote get-url origin
$env:GH_REPO = ($OriginUrl -replace '^https://github.com/', '' -replace '\.git$', '')
$env:LANGCHAIN_TRACING_V2 = 'false'
$env:LANGSMITH_TRACING = 'false'
Remove-Item Env:LANGCHAIN_API_KEY,Env:LANGSMITH_API_KEY,Env:LANGCHAIN_PROJECT,Env:LANGSMITH_PROJECT,Env:PYTHONPATH,Env:PYTHONHOME -ErrorAction SilentlyContinue
