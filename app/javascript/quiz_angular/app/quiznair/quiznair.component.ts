import { Component, OnInit } from '@angular/core';
import { Quiz } from '../quiz';
import { QuizService } from '../quiz.service';

@Component({
  selector: 'app-quiznair',
  template: `
    <div>
      <app-question [nextQuestion]="nextQuiz"></app-question>
    </div>
  `
})
export class QuestionnairComponent implements OnInit {

  nextQuiz: Quiz;
  isOnLastQuestion = false;

  constructor(private quizService: QuizService) { }

  ngOnInit() {
    this.nextQuiz = this.quizService.getNextQuiz();
    console.log("quiznair.component");
  }

  next(score: number) {
    this.isOnLastQuestion = this.quizService.isLastQuiz();
    if (this.isOnLastQuestion === false) {
      this.nextQuiz = this.quizService.getNextQuiz();
    } else {
      this.quizService.endQuiz(score);
    }
  }
}
