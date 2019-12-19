#!/usr/bin/env nextflow

// DSL 2
nextflow.preview.dsl=2

/*
================================================================================
=                     C  O  M  P  I  L  E  -  L  A  T  E  X                    =
================================================================================
@Author
  Maxime Garcia [@MaxUlysse]
--------------------------------------------------------------------------------
@Homepage
  https://github.com/MaxUlysse/compile-latex
--------------------------------------------------------------------------------
*/

include './lib/functions'

log.info ascii()

if (params.help) exit 0, helpMessage()
if (!params.tex) exit 1, 'No tex file, see --help for more information'

include './lib/xelatex' params(params)

workflow {
  main:
    Xelatex(file(params.tex), file(params.pictures), file(params.biblio))
  publish:
    Xelatex.out to:
      {params.outName ? "${params.outDir}/${params.outName}" : params.outDir },
      mode: 'link'
}
