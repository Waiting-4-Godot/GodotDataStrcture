#!/usr/bin/env python

import os
import sys

env = SConscript("godot-cpp/SConstruct")
env.Append(CPPPATH = "src/")
# env.Append(CPPPATH = "src/node")
# env.Append(CPPPATH = "src/list/linkedList")
src = Glob("src/*.cpp")

if env['platform'] == 'linux':
	pass
elif env['platform'] == 'windows':
	libpath = "build/lib/dataStructure{}{}".format(env["suffix"], env["SHLIBSUFFIX"])
	sharedlib = env.SharedLibrary(libpath, src)
	Default(sharedlib)

elif env['platform'] == 'android':
	pass