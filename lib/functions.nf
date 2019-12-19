#!/usr/bin/env nextflow

def ascii() {
  return """
------------------------------------------------------------------------------------
       _.-´`-._                                 _ _          _       _
   _.-´  T   X `-._                            (_) |        | |     | |
  |`-._    E   _.-´|   ___ ___  _ __ ___  _ __  _| | ___    | | __ _| |_ _____  __
  |--. `-.__.-´  . |  / __/ _ \\| '_ ` _ \\| '_ \\| | |/ _ \\___| |/ _` | __/ _ \\ \\/ /
  |   \\.---| . | | | | (_| (_) | | | | | | |_) | | |  __/___| | (_| | ||  __/>  <
  |---´\\   | | | | |  \\___\\___/|_| |_| |_| .__/|_|_|\\___|   |_|\\__,_|\\__\\___/_/\\_\\
   `-._ `--| | '_.-´                     | |
       `-._|_.-´                         |_|
------------------------------------------------------------------------------------
"""
}

def helpMessage() {
  log.info "    Usage:"
  log.info "      nextflow run MaxUlysse/compile-latex --tex <input.tex>"
  log.info "    --tex"
  log.info "      Compile the given tex file"
  log.info "    --biblio"
  log.info "      Specify the bibliography"
  log.info "      Default: biblio.bib"
  log.info "    --notes"
  log.info "      Generate notes with presentation"
  log.info "    --pictures"
  log.info "      Specify in which directory are the pictures"
  log.info "      Default: pictures/"
  log.info "    --tag"
  log.info "      Specify with tag to use for the docker container"
  log.info "    --outName"
  log.info "      Specify output name"
  log.info "    --outDir"
  log.info "      Specify output directory"
  log.info "    --help"
  log.info "      You're reading it"
}
