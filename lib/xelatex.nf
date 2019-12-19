#!/usr/bin/env nextflow

// DSL 2
nextflow.preview.dsl=2

process Xelatex {
  input:
    path tex
    path pictures
    path biblio

  output:
    path "*.pdf"

  script:
  """
  xelatex -shell-escape ${tex}
  biber ${tex.baseName}.bcf
  xelatex -shell-escape ${tex}
  xelatex -shell-escape ${tex}
  """
}

process RunXelatex {
  input:
    path(biblio)
    path(pictures)
    path(tex)

  output:
    path("*.pdf")

  script:
    notes = params.notes == '' ? "" : "\"\\PassOptionsToClass{notes}{beamer}\\input{$tex}\""
    notes = params.notesOnly == '' ? notes : "\"\\PassOptionsToClass{notes=only}{beamer}\\input{$tex}\""
    xelatexScript = notes == '' ? "xelatex -shell-escape ${tex}" : "xelatex -shell-escape ${notes}"
    biberScript = biblio.exists() ? "biber ${tex.baseName}.bcf ; ${xelatexScript}" : ""
    renameScript = params.outName == '' ? "" : "cp ${tex.baseName}.pdf ${params.outName}"

  """
  ${xelatexScript}
  ${biberScript}
  ${xelatexScript}
  ${renameScript}
  """
}
