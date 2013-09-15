require 'rake'
require 'fileutils'

MODULES = {
  :'vim-pathogen'         => 'https://github.com/tpope/vim-pathogen.git',
  :'vim-fugitive'         => 'https://github.com/tpope/vim-fugitive.git',
  :'vim-surround'         => 'https://github.com/tpope/vim-surround.git',
  :'nerdtree'             => 'https://github.com/scrooloose/nerdtree.git',
  :'nerdcommenter'  	    => 'https://github.com/scrooloose/nerdcommenter.git',
  :'tagbar'               => 'https://github.com/majutsushi/tagbar.git',
  :'bufexplorer.zip'	    => 'https://github.com/vim-scripts/bufexplorer.zip.git',
  :'ack.vim'              => 'https://github.com/mileszs/ack.vim.git',
  :'supertab'             => 'https://github.com/ervandew/supertab.git',
  :'solirized'            => 'https://github.com/altercation/vim-colors-solarized.git',
  :'ctrlp'                => 'https://github.com/kien/ctrlp.vim.git',
  :'tslim'                => 'https://github.com/xaviershay/tslime.vim.git',
  :'syntastic'            => 'https://github.com/scrooloose/syntastic.git',
  :'vim-airline'          => 'https://github.com/bling/vim-airline',
  :'undotree'             => 'https://github.com/mbbill/undotree.git',
  :'jedi-vim'             => 'https://github.com/davidhalter/jedi-vim.git',
  :'vim-repeat'           => 'https://github.com/tpope/vim-repeat.git',
  :'vim-python-combined'  => 'https://github.com/mitsuhiko/vim-python-combined.git',
}

#  :'vim-flake8'       	  => 'https://github.com/nvie/vim-flake8.git',
#  :'gundo'                => 'https://github.com/sjl/gundo.vim.git',
#  :'vimwiki'              => 'https://github.com/vim-scripts/vimwiki.git',
#  :'octave'               => 'https://github.com/vim-scripts/octave.vim--.git',
#  :'calendar'             => 'https://github.com/mattn/calendar-vim.git',
#  :'vim-commentary'       => 'https://github.com/tpope/vim-commentary.git',
#  :'autoclose'            => 'https://github.com/andrewle/vim-autoclose.git',
#  :'rainbow-parentheses'  => 'https://github.com/kien/rainbow_parentheses.vim.git',
#  :'Align'                => 'https://github.com/vim-scripts/Align.git',
#  :'vim-ruby'             => 'https://github.com/vim-ruby/vim-ruby.git',
#  :'vim-gnupg'            => 'https://git.gitorious.org/vim-gnupg/vim-gnupg.git',
#  :'html5.vim'            => 'https://github.com/othree/html5.vim.git',
#  :'dbext.vim'            => 'https://github.com/Rambominator/dbext.vim.git',
#  :'SQLUtilities'         => 'https://github.com/vim-scripts/SQLUtilities.git',
#  :'gist-vim'             => 'https://github.com/mattn/gist-vim.git',
#  :'webapi-vim'           => 'https://github.com/mattn/webapi-vim.git',

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
      system("cd #{module_path} && git pull origin master:master")
    else
      system("git clone #{url} #{module_path}")
    end
    installed_modules -= [name.to_s]
  end
  installed_modules.each do |dirb|
    FileUtils.rm_rf(File.join(bpath, dirb.to_s))
    puts "rm -rf #{dirb}"
  end
end

task :default => 'install'
