// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'NotesDBWorker.dart';
import 'NotesList.dart';
import 'NotesEntry.dart';
import 'NotesModel.dart' show NotesModel, notesModel;

class Notes extends StatelessWidget {
  Notes() {
    notesModel.loadData("notes", NotesDBWorker.db);
  }

  @override
  Widget build(BuildContext inContext) {
    return ScopedModel<NotesModel>(
        model: notesModel,
        child: ScopedModelDescendant<NotesModel>(builder:
            (BuildContext inContext, Widget inChild, NotesModel inModel) {
          return IndexedStack(
            index: notesModel.stackIndex,
            children: [NotesList(), NotesEntry()],
          );
        }));
  }
}
