sudo dnf install glibc.i686
tar xvf emerald-0.99-linux.tar.gz
rm emerald-0.99-linux.tar.gz
mv emerald-0.99-linux ~/emerald
mkdir ~/emerald/bin32
mv ./.profile ~
mv ./ec  ~/emerald/bin32
mv ./emc ~/emerald/bin32
mv ./emx ~/emerald/bin32
mv ./bind_public.so ~/emerald/bin32
rm ./install-emerald.sh
