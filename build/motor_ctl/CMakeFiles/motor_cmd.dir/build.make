# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/src/motor_ctl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/build/motor_ctl

# Include any dependencies generated for this target.
include CMakeFiles/motor_cmd.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/motor_cmd.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/motor_cmd.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/motor_cmd.dir/flags.make

CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.o: CMakeFiles/motor_cmd.dir/flags.make
CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.o: /mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/src/motor_ctl/src/motor_cmd.cpp
CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.o: CMakeFiles/motor_cmd.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/build/motor_ctl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.o -MF CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.o.d -o CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.o -c /mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/src/motor_ctl/src/motor_cmd.cpp

CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/src/motor_ctl/src/motor_cmd.cpp > CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.i

CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/src/motor_ctl/src/motor_cmd.cpp -o CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.s

# Object files for target motor_cmd
motor_cmd_OBJECTS = \
"CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.o"

# External object files for target motor_cmd
motor_cmd_EXTERNAL_OBJECTS =

motor_cmd: CMakeFiles/motor_cmd.dir/src/motor_cmd.cpp.o
motor_cmd: CMakeFiles/motor_cmd.dir/build.make
motor_cmd: /opt/ros/jazzy/lib/librclcpp.so
motor_cmd: /opt/ros/jazzy/lib/libstd_msgs__rosidl_typesupport_fastrtps_c.so
motor_cmd: /opt/ros/jazzy/lib/libstd_msgs__rosidl_typesupport_fastrtps_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libstd_msgs__rosidl_typesupport_introspection_c.so
motor_cmd: /opt/ros/jazzy/lib/libstd_msgs__rosidl_typesupport_introspection_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libstd_msgs__rosidl_typesupport_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libstd_msgs__rosidl_generator_py.so
motor_cmd: /opt/ros/jazzy/lib/liblibstatistics_collector.so
motor_cmd: /opt/ros/jazzy/lib/librcl.so
motor_cmd: /opt/ros/jazzy/lib/librmw_implementation.so
motor_cmd: /opt/ros/jazzy/lib/libtype_description_interfaces__rosidl_typesupport_fastrtps_c.so
motor_cmd: /opt/ros/jazzy/lib/libtype_description_interfaces__rosidl_typesupport_introspection_c.so
motor_cmd: /opt/ros/jazzy/lib/libtype_description_interfaces__rosidl_typesupport_fastrtps_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libtype_description_interfaces__rosidl_typesupport_introspection_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libtype_description_interfaces__rosidl_typesupport_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libtype_description_interfaces__rosidl_generator_py.so
motor_cmd: /opt/ros/jazzy/lib/libtype_description_interfaces__rosidl_typesupport_c.so
motor_cmd: /opt/ros/jazzy/lib/libtype_description_interfaces__rosidl_generator_c.so
motor_cmd: /opt/ros/jazzy/lib/librcl_interfaces__rosidl_typesupport_fastrtps_c.so
motor_cmd: /opt/ros/jazzy/lib/librcl_interfaces__rosidl_typesupport_introspection_c.so
motor_cmd: /opt/ros/jazzy/lib/librcl_interfaces__rosidl_typesupport_fastrtps_cpp.so
motor_cmd: /opt/ros/jazzy/lib/librcl_interfaces__rosidl_typesupport_introspection_cpp.so
motor_cmd: /opt/ros/jazzy/lib/librcl_interfaces__rosidl_typesupport_cpp.so
motor_cmd: /opt/ros/jazzy/lib/librcl_interfaces__rosidl_generator_py.so
motor_cmd: /opt/ros/jazzy/lib/librcl_interfaces__rosidl_typesupport_c.so
motor_cmd: /opt/ros/jazzy/lib/librcl_interfaces__rosidl_generator_c.so
motor_cmd: /opt/ros/jazzy/lib/libservice_msgs__rosidl_typesupport_fastrtps_c.so
motor_cmd: /opt/ros/jazzy/lib/libservice_msgs__rosidl_typesupport_introspection_c.so
motor_cmd: /opt/ros/jazzy/lib/libservice_msgs__rosidl_typesupport_fastrtps_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libservice_msgs__rosidl_typesupport_introspection_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libservice_msgs__rosidl_typesupport_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libservice_msgs__rosidl_typesupport_c.so
motor_cmd: /opt/ros/jazzy/lib/libservice_msgs__rosidl_generator_c.so
motor_cmd: /opt/ros/jazzy/lib/librcl_yaml_param_parser.so
motor_cmd: /opt/ros/jazzy/lib/librosgraph_msgs__rosidl_typesupport_fastrtps_c.so
motor_cmd: /opt/ros/jazzy/lib/librosgraph_msgs__rosidl_typesupport_fastrtps_cpp.so
motor_cmd: /opt/ros/jazzy/lib/librosgraph_msgs__rosidl_typesupport_introspection_c.so
motor_cmd: /opt/ros/jazzy/lib/librosgraph_msgs__rosidl_typesupport_introspection_cpp.so
motor_cmd: /opt/ros/jazzy/lib/librosgraph_msgs__rosidl_typesupport_cpp.so
motor_cmd: /opt/ros/jazzy/lib/librosgraph_msgs__rosidl_generator_py.so
motor_cmd: /opt/ros/jazzy/lib/librosgraph_msgs__rosidl_typesupport_c.so
motor_cmd: /opt/ros/jazzy/lib/librosgraph_msgs__rosidl_generator_c.so
motor_cmd: /opt/ros/jazzy/lib/libstatistics_msgs__rosidl_typesupport_fastrtps_c.so
motor_cmd: /opt/ros/jazzy/lib/libstatistics_msgs__rosidl_typesupport_fastrtps_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libstatistics_msgs__rosidl_typesupport_introspection_c.so
motor_cmd: /opt/ros/jazzy/lib/libstatistics_msgs__rosidl_typesupport_introspection_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libstatistics_msgs__rosidl_typesupport_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libstatistics_msgs__rosidl_generator_py.so
motor_cmd: /opt/ros/jazzy/lib/libstatistics_msgs__rosidl_typesupport_c.so
motor_cmd: /opt/ros/jazzy/lib/libstatistics_msgs__rosidl_generator_c.so
motor_cmd: /opt/ros/jazzy/lib/libtracetools.so
motor_cmd: /opt/ros/jazzy/lib/librcl_logging_interface.so
motor_cmd: /opt/ros/jazzy/lib/libstd_msgs__rosidl_typesupport_c.so
motor_cmd: /opt/ros/jazzy/lib/libstd_msgs__rosidl_generator_c.so
motor_cmd: /opt/ros/jazzy/lib/libbuiltin_interfaces__rosidl_typesupport_fastrtps_c.so
motor_cmd: /opt/ros/jazzy/lib/librosidl_typesupport_fastrtps_c.so
motor_cmd: /opt/ros/jazzy/lib/libbuiltin_interfaces__rosidl_typesupport_introspection_c.so
motor_cmd: /opt/ros/jazzy/lib/libbuiltin_interfaces__rosidl_typesupport_fastrtps_cpp.so
motor_cmd: /opt/ros/jazzy/lib/librosidl_typesupport_fastrtps_cpp.so
motor_cmd: /opt/ros/jazzy/lib/librmw.so
motor_cmd: /opt/ros/jazzy/lib/librosidl_dynamic_typesupport.so
motor_cmd: /opt/ros/jazzy/lib/libfastcdr.so.2.2.5
motor_cmd: /opt/ros/jazzy/lib/libbuiltin_interfaces__rosidl_typesupport_introspection_cpp.so
motor_cmd: /opt/ros/jazzy/lib/librosidl_typesupport_introspection_cpp.so
motor_cmd: /opt/ros/jazzy/lib/librosidl_typesupport_introspection_c.so
motor_cmd: /opt/ros/jazzy/lib/libbuiltin_interfaces__rosidl_typesupport_cpp.so
motor_cmd: /opt/ros/jazzy/lib/librosidl_typesupport_cpp.so
motor_cmd: /opt/ros/jazzy/lib/libbuiltin_interfaces__rosidl_generator_py.so
motor_cmd: /opt/ros/jazzy/lib/libbuiltin_interfaces__rosidl_typesupport_c.so
motor_cmd: /opt/ros/jazzy/lib/libbuiltin_interfaces__rosidl_generator_c.so
motor_cmd: /opt/ros/jazzy/lib/librosidl_typesupport_c.so
motor_cmd: /opt/ros/jazzy/lib/librcpputils.so
motor_cmd: /opt/ros/jazzy/lib/librosidl_runtime_c.so
motor_cmd: /opt/ros/jazzy/lib/librcutils.so
motor_cmd: CMakeFiles/motor_cmd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/build/motor_ctl/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable motor_cmd"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/motor_cmd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/motor_cmd.dir/build: motor_cmd
.PHONY : CMakeFiles/motor_cmd.dir/build

CMakeFiles/motor_cmd.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/motor_cmd.dir/cmake_clean.cmake
.PHONY : CMakeFiles/motor_cmd.dir/clean

CMakeFiles/motor_cmd.dir/depend:
	cd /mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/build/motor_ctl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/src/motor_ctl /mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/src/motor_ctl /mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/build/motor_ctl /mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/build/motor_ctl /mnt/c/Users/james/OneDrive/Documents/GitHub/westinghouseCode/build/motor_ctl/CMakeFiles/motor_cmd.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/motor_cmd.dir/depend

