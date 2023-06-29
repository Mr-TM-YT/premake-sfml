workspace ("sfml-premake")
    configurations {"Debug", "Release"}

project ("sfml-premake")
    kind "ConsoleApp"
    language "C++"

    targetdir "bin/%{cfg.buildcfg}"
    objdir "obj/%{cfg.buildcfg}"

    files
    {
        "src/**.cpp",
    }

    filter "configurations:*"
        defines {"SFML_STATIC"}
        includedirs {"extlibs/SFML/include", "include"}
        libdirs {"extlibs/SFML/lib"}

        links
		{
			"opengl32",
			"freetype",
			"winmm",
			"gdi32",
			"flac",
			"vorbisenc",
			"vorbisfile",
			"vorbis",
			"ogg",
			"ws2_32"
		}
    filter "configurations:Debug"
        defines {"DEBUG", "ASSETS_PATH assets"}
        symbols "On"

        links
		{	
			"sfml-graphics-s-d",
			"sfml-window-s-d",
			"sfml-system-s-d",
			"sfml-audio-s-d",
			"sfml-network-s-d"
		}
    filter "configurations:Release"
        defines {"NDEBUG"}
        optimize "On"

        links
		{	
			"sfml-graphics-s",
			"sfml-window-s",
			"sfml-system-s",
			"sfml-audio-s",
			"sfml-network-s"
		}