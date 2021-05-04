import { Component, OnInit, NgZone } from '@angular/core';
import { Quiz } from '../quiz';
import { QuizService } from '../quiz.service';

@Component({
  selector: 'app-quiznair',
  template: `
    <div *ngIf="isOnLastQuestion">
      <div class="us-center" style="paddin-top: 250px">
        <i class="ticket alternate icon massive blue"></i>
        <p class="us-mb-20">{{quizNum}}問中{{lastScore}}問正解です！</p>
        <div>
          <a (click)="createCoupon()" class="ui button blue" style="font-weight: 100; font-size: 20px"> クーポンを受け取る </a>
        </div>
      </div>
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
  quizNum = 0;

  params = {
    discount: 10,
    shop_id: 0
  };

  constructor( private quizService: QuizService ) { }

  async ngOnInit() {
    await this.quizService.getQuizes().toPromise();
    this.nextQuiz = this.quizService.getNextQuiz();
  }

  createCoupon() {
    this.quizService.endQuiz(this.params);
  }

  next(score: number) {
    this.isOnLastQuestion = this.quizService.isLastQuiz();
    if (this.isOnLastQuestion === false) {
      this.nextQuiz = this.quizService.getNextQuiz();
    } else {
      this.isOnLastQuestion = true;
      this.lastScore = score;
      this.quizNum = this.quizService.quizIndex;
      this.params.discount = Math.ceil(50*(this.lastScore/this.quizNum)/10)*10;
      this.params.shop_id = this.quizService.getShopId();
      console.log(this.params.discount);
    }
  }
}
