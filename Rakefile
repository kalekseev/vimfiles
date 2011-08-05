require 'rake'

MODULES = {
  :'vim-pathogen' => 'https://github.com/tpope/vim-pathogen.git',
  :NERD_tree => 'https://github.com/scrooloose/nerdtree.git',
  :'vim-fugitive' => 'https://github.com/tpope/vim-fugitive.git',
  :'vim-surround' => 'https://github.com/tpope/vim-surround.git',
  :syntastic => 'https://github.com/scrooloose/syntastic.git',
  :Align => 'https://github.com/vim-scripts/Align.git',
  :supertab => 'https://github.com/ervandew/supertab.git',
  :'vim-ruby' => 'https://github.com/vim-ruby/vim-ruby.git',
  :'vim-ruby-sinatra' => 'https://github.com/hallison/vim-ruby-sinatra.git',
  :SQLUtilities => 'https://github.com/vim-scripts/SQLUtilities.git',
  :tComment => 'https://github.com/vim-scripts/tComment.git',
  :'Command-T' => 'https://github.com/wincent/Command-T.git',
  :'vim-colors-solarized' => 'git://github.com/altercation/vim-colors-solarized.git',
}

desc 'install modules'
task :install do
  vimpath = File.dirname(__FILE__)
  MODULES.each do |name,url|
    module_path = File.join(vimpath,'bundle',name.to_s)
    if File.exists?(module_path)
      puts name
      system("cd #{module_path} && git pull origin")
    else
      system("git clone #{url} #{module_path}")
    end
  end
end

# [submodule "bundle/haml"]
# 	path = bundle/haml
# 	url = https://github.com/tpope/vim-haml.git
# [submodule "bundle/markdown"]
# 	path = bundle/markdown
# 	url = https://github.com/tpope/vim-markdown.git
# [submodule "bundle/taglist"]
# 	path = bundle/taglist
# 	url = https://github.com/vim-scripts/taglist.vim.git
# [submodule "bundle/bufexplorer"]
# 	path = bundle/bufexplorer
# 	url = https://github.com/vim-scripts/bufexplorer.zip.git
# [submodule "bundle/matchit"]
# 	path = bundle/matchit
# 	url = https://github.com/vim-scripts/matchit.zip.git
# [submodule "bundle/pythoncomplete"]
# 	path = bundle/pythoncomplete
# 	url = https://github.com/vim-scripts/pythoncomplete.git
# [submodule "bundle/python_highlighting"]
# 	path = bundle/python_highlighting
# 	url = https://github.com/vim-scripts/python.vim--Vasiliev.git
# [submodule "bundle/TwitVim"]
# 	path = bundle/TwitVim
# 	url = https://github.com/vim-scripts/TwitVim.git
# [submodule "bundle/pastie"]
# 	path = bundle/pastie
# 	url = https://github.com/tpope/vim-pastie.git
# [submodule "bundle/gist"]
# 	path = bundle/gist
# 	url = https://github.com/mattn/gist-vim.git
# [submodule "bundle/vim-latext"]
# 	path = bundle/vim-latext
# 	url = https://github.com/vim-scripts/LaTeX-Suite-aka-Vim-LaTeX.git
# [dbext]
