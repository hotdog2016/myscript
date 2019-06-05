#update .vimrc to ~/.vimrc
#
cp ~/.vimrc ./
git add .vimrc
time=$(date "+%Y-%m-%d %H:%M:%S")
git commit -am "$time" && git push vimconf master

