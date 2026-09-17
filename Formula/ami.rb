class Ami < Formula
  desc "Installer that fetches packages from Arch Linux's pacman repos and the AUR"
  homepage "https://github.com/Masterminde45/ami"
  url "https://github.com/Masterminde45/ami/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "92f2efb6b8f2876284dacf148197db62338f193b61aebda875c5b1cc47c69aee"
  license "GPL-3.0-or-later"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "python@3.12"

  def install
    system "python3.12", "-m", "venv", libexec/"venv"
    system libexec/"venv/bin/pip", "install", "--quiet", "requests"
    ENV.prepend_path "PATH", libexec/"venv/bin"

    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end

  def caveats
    <<~EOS
      ami drives pacman, makepkg, and the AUR directly, so its install/
      search/clean commands only work on a system that actually has those
      Arch Linux tools. This formula packages the ami CLI itself; it does
      not add pacman/AUR support to a non-Arch host.
    EOS
  end

  test do
    output = shell_output("#{bin}/ami")
    assert_match "Archlinux Multi Installer", output
  end
end
