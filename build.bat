IF NOT EXIST bld (
	mkdir bld
)
cd bld

cmake -G"Visual Studio 12 2013 Win64" ..

cd ..

start bld\SFMLTest.sln