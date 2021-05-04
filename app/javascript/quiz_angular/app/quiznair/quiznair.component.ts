import { Component, OnInit, NgZone } from '@angular/core';
import { Quiz } from '../quiz';
import { QuizService } from '../quiz.service';

@Component({
  selector: 'app-quiznair',
  template: `
    <div *ngIf="isOnLastQuestion">
      <p> あなたの最終スコアは「{{lastScore}}」点でした！ </p>
      <a href="http://localhost:3000/user/coupons">クーポンを受け取る</a>
    </div>
    <div *ngIf="!isOnLastQuestion">
      <app-question [nextQuestion]="nextQuiz"></app-question>
    </div>
  `
})
export class QuestionnairComponent implements OnInit {

  nextQuiz: Quiz;
  isOnLastQuestion = false;
  lastScore = 0;

  parms = {
    name: "割引券",
    discount: 10,
    shop_id: 1
  };

  constructor(
    private quizService: QuizService) { }

  async ngOnInit() {
    await this.quizService.getQuizes().toPromise();
    this.nextQuiz = this.quizService.getNextQuiz();
    console.log("quiznair.component");
  }

  next(score: number) {
    this.isOnLastQuestion = this.quizService.isLastQuiz();
    if (this.isOnLastQuestion === false) {
      this.nextQuiz = this.quizService.getNextQuiz();
    } else {
      this.isOnLastQuestion = true;
      this.parms.discount = score*10;
      this.lastScore = score;
    }
  }
}