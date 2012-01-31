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
  :'vim-colors-solarized' => 'https://github.com/altercation/vim-colors-solarized.git',
  :'vim-gnupg'            => 'https://git.gitorious.org/vim-gnupg/vim-gnupg.git',
  :'vim-commentary'       => 'https://github.com/tpope/vim-commentary.git',
  :vimwiki                => 'https://github.com/vim-scripts/vimwiki.git',
  :'bufexplorer.zip'	  => 'https://github.com/vim-scripts/bufexplorer.zip.git',
  :'vim-repeat'           => 'https://github.com/tpope/vim-repeat.git',
  :octave                 => 'https://github.com/vim-scripts/octave.vim--.git',
  :'ack.vim'              => 'https://github.com/mileszs/ack.vim.git',
  :'vim-sinatra-ruby'     => 'https://github.com/hallison/vim-ruby-sinatra.git',
  :'html5.vim'            => 'https://github.com/othree/html5.vim.git',
  :'dbext.vim'            => 'https://github.com/Rambominator/dbext.vim.git',
  :tagbar                 => 'https://github.com/majutsushi/tagbar.git',
  :'rainbow-parentheses'  => 'https://github.com/kien/rainbow_parentheses.vim.git',
}

desc 'install modules'
task :install do
  dir = File.dirname(__FILE__)
  unless File.symlink?(File.join(dir, '../.vimrc'))
    puts "create symlink:  .vimrc -> .vim/vimrc"
    system("cd && ln -s .vim/vimrc .vimrc")
  end

  bpath = File.join(dir, 'bundle')
  Dir.mkdir(bpath) unless Dir.exists?(bpath)
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

task :default => 'install'
