import { Component, OnInit, Input } from '@angular/core';
import { Quiz } from '../quiz';
import { QuestionnairComponent } from './quiznair.component';

@Component({
  selector: 'app-question',
  template: `
    <p>
      現在の得点は「{{score}}点」です！
    </p>

    <div>Question No.{{nextQuestion?.id}}</div>
    <div>Question: {{nextQuestion?.description}}</div>
    <div>
      <button (click)="check(1)">{{nextQuestion?.content1}}</button>
      <button (click)="check(2)">{{nextQuestion?.content2}}</button>
      <button (click)="check(3)">{{nextQuestion?.content3}}</button>
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
