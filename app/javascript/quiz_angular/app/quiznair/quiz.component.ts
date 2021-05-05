import { Component, OnInit, Input } from '@angular/core';
import { Quiz } from '../quiz';
import { QuestionnairComponent } from './quiznair.component';

@Component({
  selector: 'app-question',
  template: `
    <div class="ui icon message" style="margin-bottom: 40px">
      <i class="question icon"></i>
      <div class="content">{{nextQuestion?.description}}</div>
    </div>
    <div>
      <div class="us-mt-15">
        <button class="ui button blue us-w-100 us-h-45-px" (click)="check(1)">{{nextQuestion?.content1}}</button>
      </div>
      <div class="us-mt-15">
        <button class="ui button green us-w-100 us-h-45-px" (click)="check(2)">{{nextQuestion?.content2}}</button>
      </div>
      <div class="us-mt-15">
        <button class="ui button pink us-w-100 us-h-45-px" (click)="check(3)">{{nextQuestion?.content3}}</button>
      </div>
    </div>
  `
})
export class QuestionComponent implements OnInit {

  @Input() nextQuestion: Quiz;

  score: number = 0;

  constructor(private quiznairComponent: QuestionnairComponent) { }

  ngOnInit() {
  }

  check(selected: number): void {
    if (selected === this.nextQuestion.answer) {
      this.score++;
    }
    this.quiznairComponent.next(this.score);
  }

}
