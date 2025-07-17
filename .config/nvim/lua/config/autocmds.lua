-- Neovim autocommands configuration
-- Based on your .vimrc preferences

local api = vim.api

-- Create augroups
local function create_augroup(name, clear)
  return api.nvim_create_augroup(name, { clear = clear or false })
end

-- Numbering behavior (from your .vimrc)
local numbering_group = create_augroup("Numbering", true)
api.nvim_create_autocmd("InsertEnter", {
  group = numbering_group,
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = false
  end
})

api.nvim_create_autocmd("InsertLeave", {
  group = numbering_group,
  callback = function()
    vim.opt.relativenumber = true
  end
})

api.nvim_create_autocmd("BufRead", {
  group = numbering_group,
  callback = function()
    vim.opt.relativenumber = true
  end
})

-- Ruby-specific autocommands
local ruby_group = create_augroup("Ruby", true)
api.nvim_create_autocmd("FileType", {
  group = ruby_group,
  pattern = "ruby",
  callback = function()
    -- Ruby keymaps
    local map = vim.keymap.set
    local opts = { buffer = true, noremap = true, silent = true }
    
    map("n", "<Leader>eai", "aeach do |i|<CR>end<Esc>k2==o", opts)
    map("n", "<Leader>ea", "aeach do<CR>end<Esc>k2==o", opts)
    map("n", "<Leader>oa", ":call OpenAssociatedFile()<CR>", opts)
    map("n", "<Leader>bmm", "Orequire 'benchmark'; puts Benchmark.measure {  }<Left><Left><Esc>", opts)
    map("n", "<Leader>sp", "Orequire 'stackprof'; StackProf.run(mode: :wall, out: 'tmp/.dump') {  }<Esc>F/a", opts)
    map("n", "<Leader>idl", "Orequire 'pry'; binding.pry<Esc>", opts)
    map("n", "<Leader>idm", ":call AddDebugLineToEachMethod()<CR>", opts)
    map("n", "<Leader>db", "idebugger<Esc>==", opts)
    map("n", "<Leader>dd", ":call Delete(\"require 'pry'; binding.pry\")<CR>", opts)
    map("n", "<Leader>td", ":call Toggle(\"require 'pry'; binding.pry\")<CR>", opts)
    map("n", "<Leader>pry", "Orequire 'pry'; binding.pry<Esc>", opts)
    map("n", "<Leader>bye", "Orequire 'byebug'; byebug<Esc>", opts)
    map("n", "<Leader>bm", "iBenchmark.ips do |x|<CR>end<Esc>Ox.report(\"\") do<Esc>oend<Esc>k^f\"a<Esc>", opts)
    map("n", "<Leader>eq", "iActiveRecord::Base.connection.exec_query(<CR><<-SQL<CR><CR>SQL<CR>)<Esc>2kcc", opts)
    map("n", "<Leader>fbs", "A.find_by_sql(<CR><<-SQL<CR><CR>SQL<CR>)<Esc>2kcc", opts)
    map("n", "<Leader>sql", "o<<-SQL<CR><CR>SQL<Esc>ka", opts)
    
    -- Ruby insert mode shortcuts
    map("i", "mo'", "module <CR>end<Esc>kA", opts)
    map("i", "cl'", "class <CR>end<Esc>kA", opts)
    map("i", "def'", "def <CR>end<Esc>kA", opts)
    map("i", "defi'", "def ; ;end<Esc>F;;i", opts)
    map("i", "#{", "#{}<Left>", opts)
    map("i", "req'", "require ''<Left>", opts)
    map("i", "reqr'", "require_relative ''<Left>", opts)
    map("i", "wh'", "while  do<CR>end<Esc>ke2<Right>i", opts)
    map("i", "un'", "until  do<CR>end<Esc>ke2<Right>i", opts)
    map("i", "do'", "do<CR>end<Esc>O", opts)
    map("i", "do|'", "do ||<CR>end<Esc>kf|a", opts)
    map("i", "ifs'", "if <CR>else<CR>end<Up><Up><Esc>A", opts)
    map("i", "if'", "if <CR><CR>end<Up><Up><Esc>A", opts)
    map("i", "el'", "else<Esc>==A<Space>", opts)
    map("i", "wn'", "when<Esc>==A<Space>", opts)
    map("i", "th'", "then<Space>", opts)
    map("i", "ca'", "case <CR>end<Esc><Up>2==A", opts)
    map("i", "br'", "x.report(\"\") do<Esc>oend<Esc>k^f\"a", opts)
    map("i", "fa'", "FactoryGirl.define do<CR>factory : do<CR>end<CR>end<Esc>2kf:a", opts)
  end
})

-- RSpec autocommands
local rspec_group = create_augroup("RSpec", true)
api.nvim_create_autocmd("FileType", {
  group = rspec_group,
  pattern = "*spec.rb",
  callback = function()
    local map = vim.keymap.set
    local opts = { buffer = true, noremap = true, silent = true }
    
    -- RSpec insert mode shortcuts
    map("i", "su'", "isubject do<CR>end<Esc>k2==o", opts)
    map("i", "de'", "describe \"\" do<CR>end<Esc>k2==f\"li", opts)
    map("i", "co'", "context \"\" do<CR>end<Esc>k2==f\"li", opts)
    map("i", "it''", "it \"\" do<CR>end<Esc>k2==f\"li", opts)
    map("i", "sp'", "specify \"\" do<CR>end<Esc>k2==f\"li", opts)
    map("i", "be'", "before(:each) {}<Esc>==f}i", opts)
    map("i", "bed'", "before(:each) do<CR>end<Esc>O", opts)
    map("i", "ex'", "expect().to<Esc>==f)i", opts)
    map("i", "exs'", "page.execute_script()<Esc>==f)i", opts)
    map("i", "evs'", "page.evaluate_script()<Esc>==f)i", opts)
    map("i", "exh'", "expect().to have_received()<Esc>==f)i", opts)
    map("i", "exhw'", "expect().to have_received().with()<Esc>==f)i", opts)
    map("i", "ex{'", "expect{}.to<Esc>==f}i", opts)
    map("i", "ar'", "allow().to receive()<Esc>==f)i", opts)
    map("i", "arr'", "allow().to receive().and_return()<Esc>==f)i", opts)
    map("i", "arw'", "allow().to receive().with()<Esc>==f)i", opts)
    map("i", "arwr'", "allow().to receive().with().and_return()<Esc>==f)i", opts)
    map("i", "dou'", "double(\"\")<left><left>", opts)
    map("i", "idou'", "instance_double(\"\")<left><left>", opts)
    map("i", "cdou'", "class_double(\"\")<left><left>", opts)
    map("i", "cr'", "create()<left>", opts)
    
    -- RSpec normal mode shortcuts
    map("n", "le", "ilet(:) do<CR><CR>end<CR><Esc>3k3==^f:a", opts)
    map("n", "<Leader>ar", "/expect<CR>Ncwallow<Esc>/have_received<CR>cwreceive<Esc>", opts)
    map("n", "<Leader>ex", "/allow<CR>Ncwexpect<Esc>/receive<CR>cwhave_received<Esc>", opts)
  end
})

-- JavaScript autocommands
local js_group = create_augroup("JavaScript", true)
api.nvim_create_autocmd("FileType", {
  group = js_group,
  pattern = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
  callback = function()
    local map = vim.keymap.set
    local opts = { buffer = true, noremap = true, silent = true }
    
    map("n", "<Leader>db", "idebugger;<Esc>==", opts)
    map("n", "<Leader>cl", "caWconsole.log(``);<Esc>2F`pa: ${}<Esc>P==", opts)
    map("n", "<Leader>/", ":call Comment(\"//\")<CR>", opts)
    map("i", "try'", "try {<CR>} catch(e) {<Enter>}<Up><Up><Esc>o", opts)
    map("i", "if'", "if () {<CR>}<Esc>k2==f)i", opts)
    map("i", "ei'", "else if () {<CR>}<Esc>k2==f)i", opts)
    map("i", "fu'", "function () {<CR>}<Esc>k2==f(i", opts)
    map("i", "cla'", "class  {<CR>constructor(x) {<CR>this.x = x;<CR>}<CR>};<Esc>?class<Enter>6==f{<Left>i", opts)
  end
})

-- SQL autocommands
local sql_group = create_augroup("SQL", true)
api.nvim_create_autocmd("FileType", {
  group = sql_group,
  pattern = "sql",
  callback = function()
    local map = vim.keymap.set
    local opts = { buffer = true, noremap = true, silent = true }
    
    map("n", "<Leader>q", ":call RunSqlFile('split')<CR>", opts)
    map("n", "<Leader>j", ":call RunSqlFile('tab')<CR>", opts)
    map("n", "<Leader>/", ":call Comment(\"--\")<CR>", opts)
    map("v", "<Leader>/", ":call Comment(\"--\")<CR>", opts)
    map("n", "<Leader>*", "i/*<CR>*/<Esc>O", opts)
    map("n", "<Leader>tt", ":w<CR>:call VtrSendCommand('psql -d lingolive -f sql/playground/playground.sql')<CR>", opts)
    map("n", "<Leader>daf", ":0,$d<CR>a", opts)
    map("n", "<Leader>csv", "iCopy (select * from (<CR>)) to '' with csv header;<Esc>f(", opts)
  end
})

-- Python autocommands
local python_group = create_augroup("Python", true)
api.nvim_create_autocmd("FileType", {
  group = python_group,
  pattern = "python",
  callback = function()
    local map = vim.keymap.set
    local opts = { buffer = true, noremap = true, silent = true }
    
    map("n", "<Leader>lp", "O@line_profiler.profile<Esc>", opts)
    map("n", "<Leader>db", "Oimport pdb; pdb.set_trace()<Esc>", opts)
    map("n", "<Leader>ddb", ":call Delete(\"import pdb; pdb.set_trace()\")<CR>", opts)
    map("n", "<Leader>tdb", ":call Toggle(\"import pdb; pdb.set_trace()\")<CR>", opts)
    map("n", "<Leader>ml\"", "o\"\"\"<CR><CR>\"\"\"<Up><Esc>A", opts)
    map("n", "<Leader>ml'", "o'''<CR><CR>'''<Up><Esc>A", opts)
    map("n", "<Leader>tt", ":call VtrSendCommand('specter')<CR>", opts)
    map("i", "cl'", "class ():<CR>def __init__(self):<Up><Esc>$F(i", opts)
    map("i", "def'", "def (self):<Esc>F(i", opts)
    map("i", "if'", "if :<Left>", opts)
    map("i", "tr'", "try :<CR>except Exception as e:<Esc>O", opts)
  end
})

-- Markdown autocommands
local markdown_group = create_augroup("Markdown", true)
api.nvim_create_autocmd("FileType", {
  group = markdown_group,
  pattern = "markdown",
  callback = function()
    local map = vim.keymap.set
    local opts = { buffer = true, noremap = true, silent = true }
    
    map("n", "<Leader>fap", "vap<Esc>`<ki {{{<Esc>`>a\" }}}<Esc>'<kf{", opts)
    map("n", "<Leader>tab", "v}o{<Esc>i```<Esc>`>a```", opts)
    map("i", "<Leader>``", "```<CR><CR>```<Esc><Up>", opts)
    map("n", "<Leader>3`", "<Esc>ma`>o```<Esc>`<O```<Esc>`a", opts)
    map("n", "<Leader>-", ":call AddCharStringAsLongAsHeaderString(\"-\")<CR>", opts)
    map("n", "<Leader>=", ":call AddCharStringAsLongAsHeaderString(\"=\")<CR>", opts)
    map("i", "hl'", "{% highlight  linenos %}<CR>{% endhighlight %}<Esc><Up>^2e<Right>a", opts)
    map("i", "da'", "<Esc>:read !date<Cr><Up>J", opts)
    map("i", "<Leader>mi'", "\\\\(\\)<Left><Left><Left>", opts)
    map("n", "<Leader>$", "a$$<CR><CR>$$<Up>", opts)
    map("n", "<Leader>be", "a\\begin{equation}<CR>\\begin{aligned}<CR>\\end{aligned}<CR>\\end{equation}<Esc>kO", opts)
    map("n", "<Leader>t", "a\\text{}<Left>", opts)
    map("n", "<Leader>\\", "A\\\\", opts)
    map("n", "<Leader>ba", "\\begin{align}<CR><CR>\\end{align}<Up>", opts)
    map("i", "<Leader>mf'", "\\frac{}{}<Esc>F}i", opts)
    
    -- Set markdown-specific options
    vim.opt_local.foldmethod = "marker"
    vim.opt_local.foldlevelstart = 0
  end
}) 