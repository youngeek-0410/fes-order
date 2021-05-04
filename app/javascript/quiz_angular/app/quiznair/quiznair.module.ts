import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { QuestionnairComponent } from './quiznair.component';
import { QuestionComponent } from './quiz.component';

@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [QuestionnairComponent, QuestionComponent],
  exports: [QuestionnairComponent]
})
export class QuestionnairModule { }
