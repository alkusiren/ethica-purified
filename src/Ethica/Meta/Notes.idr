||| Notes/scholia as data; never imported by proof modules.
||| This module contains only metadata and commentary, never used in proofs.
module Ethica.Meta.Notes

%default total

||| Note identifier
public export
NoteId : Type
NoteId = String

||| Note content (metadata only)
public export
record Note where
  constructor MkNote
  id      : NoteId
  content : String

%name Note note, note1, note2

||| Example notes registry (placeholder)
public export
notes : List Note
notes = []

