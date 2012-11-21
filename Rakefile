require 'rake'
require 'fileutils'

MODULES = {
  :'vim-pathogen'         => 'https://github.com/tpope/vim-pathogen.git',
  :'vim-fugitive'         => 'https://github.com/tpope/vim-fugitive.git',
  :'vim-surround'         => 'https://github.com/tpope/vim-surround.git',
  :'nerdtree'             => 'https://github.com/scrooloose/nerdtree.git',
  :'nerdcommenter'  	  => 'https://github.com/scrooloose/nerdcommenter.git',
  :'tagbar'               => 'https://github.com/majutsushi/tagbar.git',
  :'bufexplorer.zip'	  => 'https://github.com/vim-scripts/bufexplorer.zip.git',
  :'ack.vim'              => 'https://github.com/mileszs/ack.vim.git',
  :'octave'               => 'https://github.com/vim-scripts/octave.vim--.git',
  :'supertab'             => 'https://github.com/ervandew/supertab.git',
  :'gundo'                => 'https://github.com/sjl/gundo.vim.git',
  :'vimwiki'              => 'https://github.com/vim-scripts/vimwiki.git',
  :'calendar'             => 'https://github.com/mattn/calendar-vim.git',
  :'solirized'            => 'https://github.com/altercation/vim-colors-solarized.git',
  :'pydoc'                => 'https://github.com/vim-scripts/pydoc.vim.git',
  :'pyflakes'             => 'https://github.com/kevinw/pyflakes-vim.git',
  :'ctrlp'                => 'https://github.com/kien/ctrlp.vim.git',
  :'tslim'                => 'https://github.com/xaviershay/tslime.vim.git',
}

#  :'Command-T'            => 'https://github.com/wincent/Command-T.git',
#  :'vim-commentary'       => 'https://github.com/tpope/vim-commentary.git',
#  :'autoclose'            => 'https://github.com/andrewle/vim-autoclose.git',
  # :'syntastic'            => 'https://github.com/scrooloose/syntastic.git',
  # :'rainbow-parentheses'  => 'https://github.com/kien/rainbow_parentheses.vim.git',
  # :'Align'                => 'https://github.com/vim-scripts/Align.git',
  # :'vim-ruby'             => 'https://github.com/vim-ruby/vim-ruby.git',
  # :'vim-colors-solarized' => 'https://github.com/altercation/vim-colors-solarized.git',
  # :'vim-gnupg'            => 'https://git.gitorious.org/vim-gnupg/vim-gnupg.git',
  # :'vim-repeat'           => 'https://github.com/tpope/vim-repeat.git',
  # :'html5.vim'            => 'https://github.com/othree/html5.vim.git',
  # :'dbext.vim'            => 'https://github.com/Rambominator/dbext.vim.git',
  # :'SQLUtilities'         => 'https://github.com/vim-scripts/SQLUtilities.git',
  # :'gist-vim'             => 'https://github.com/mattn/gist-vim.git',
  # :'webapi-vim'           => 'https://github.com/mattn/webapi-vim.git',

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
