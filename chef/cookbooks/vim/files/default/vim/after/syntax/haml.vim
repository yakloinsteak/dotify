syn region  hamlCoffeescriptFilter matchgroup=hamlFilter start="^\z(\s*\):coffee\s*$" end="^\%(\z1 \| *$\)\@!" contains=@htmlJavaScript,hamlInterpolation keepend
syn region  hamlCoffeescriptFilter matchgroup=hamlFilter start="^\z(\s*\):coffeescript\s*$" end="^\%(\z1 \| *$\)\@!" contains=@htmlJavaScript,hamlInterpolation keepend
