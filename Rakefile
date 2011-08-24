require 'rake'
require 'fileutils'

MODULES = {
  :'vim-pathogen'         => 'https://github.com/tpope/vim-pathogen.git',
  :NERD_tree              => 'https://github.com/scrooloose/nerdtree.git',
  :'vim-fugitive'         => 'https://github.com/tpope/vim-fugitive.git',
  :'vim-surround'         => 'https://github.com/tpope/vim-surround.git',
  :syntastic              => 'https://github.com/scrooloose/syntastic.git',
  :Align                  => 'https://github.com/vim-scripts/Align.git',
  :supertab               => 'https://github.com/ervandew/supertab.git',
  :'vim-ruby'             => 'https://github.com/vim-ruby/vim-ruby.git',
  :'vim-ruby-sinatra'     => 'https://github.com/hallison/vim-ruby-sinatra.git',
  :SQLUtilities           => 'https://github.com/vim-scripts/SQLUtilities.git',
  :'Command-T'            => 'https://github.com/wincent/Command-T.git',
  :'vim-colors-solarized' => 'git://github.com/altercation/vim-colors-solarized.git',
  :'vim-gnupg'            => 'git://gitorious.org/vim-gnupg/vim-gnupg.git',
  :'vim-commentary'       => 'https://github.com/tpope/vim-commentary.git',
  :vimwiki                => 'git://github.com/vim-scripts/vimwiki.git',
}

desc 'install modules'
task :install do
  bpath = File.join(File.dirname(__FILE__), 'bundle')
  installed_modules = Dir.entries(bpath) - [".",".."]
  MODULES.each do |name, url|
    module_path = File.join(bpath, name.to_s)
    if File.exists?(module_path)
      puts name
      system("cd #{module_path} && git pull origin")
    else
      system("git clone #{url} #{module_path}")
    end
    installed_modules -= [name.to_s]
  end
  installed_modules.each do |dir| 
    FileUtils.rm_rf(File.join(bpath, dir.to_s))
    puts "rm -rf #{dir}"
  end
end

# 	url = https://github.com/tpope/vim-haml.git
# 	url = https://github.com/tpope/vim-markdown.git
# 	url = https://github.com/vim-scripts/taglist.vim.git
# 	url = https://github.com/vim-scripts/bufexplorer.zip.git
# 	url = https://github.com/vim-scripts/matchit.zip.git
# 	url = https://github.com/vim-scripts/pythoncomplete.git
# 	url = https://github.com/vim-scripts/python.vim--Vasiliev.git
# 	url = https://github.com/vim-scripts/TwitVim.git
# 	url = https://github.com/tpope/vim-pastie.git
# 	url = https://github.com/mattn/gist-vim.git
# 	url = https://github.com/vim-scripts/LaTeX-Suite-aka-Vim-LaTeX.git
# [dbext]
