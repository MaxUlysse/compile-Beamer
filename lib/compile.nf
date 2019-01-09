#!/usr/bin/env nextflow

processDef RunXelatex {
  tag {tex}

  publishDir params.outDir, mode: 'link'

  input:
    file biblio
    file pictures
    file tex

  output:
    file("*.pdf")

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
