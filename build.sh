if [ ! -d "bld" ]
	mkdir "bld"
fi
cd bld

cmake -G"Unix Makefiles" ..

# Make 1st time can grab dependencies but not add the actual target
make

# When rebuilt, make can finally actually build the target
cmake -G"Unix Makefiles" ..
make