with import <nixpkgs> {};

stdenv.mkDerivation rec {

    pname = "xmake";
    version = "2.5.4";

    src = fetchTarball "https://github.com/xmake-io/xmake/releases/download/v2.5.4/xmake-v2.5.4.tar.gz";

    configurePhase = ''
        export DESTDIR=$out
    '';

    postInstall = ''
        mv $out/usr/* $out/
        rmdir $out/usr
    '';

    meta = {
        description = "A cross-platform build utility based on Lua";
        longDescription = ''
            xmake is a lightweight cross-platform build utility based on Lua. It uses xmake.lua to maintain project builds. 
            Compared with makefile/CMakeLists.txt, the configuration syntax is more concise and intuitive. 
            It is very friendly to novices and can quickly get started in a short time. Let users focus more on actual project development.

            It can compile the project directly like Make/Ninja, or generate project files like CMake/Meson, 
            and it also has a built-in package management system to help users solve the integrated use of C/C++ dependent libraries.
        '';
        homepage = "https://xmake.io";
        changelog = "https://xmake.io/#/about/changelog";
    };

}