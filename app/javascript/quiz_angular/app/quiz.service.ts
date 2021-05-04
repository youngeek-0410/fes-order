import { Injectable } from '@angular/core';
import { Quiz } from './quiz';
import { HttpClientService } from './http-client.service';

@Injectable()
export class QuizService {

  allQuizes: Quiz[] = [];
  quizIndex = 0;

  private parms = {
    name: "割引券",
    discount: 10,
    shop_id: 1
  };

  constructor(private httpService: HttpClientService) {
    this.getQuizes();
   }

  getQuizes(): void { 
    this.httpService.get().subscribe(
      quizzes => {
        this.allQuizes = quizzes;
        console.log(this.allQuizes);
      });
  }

  isLastQuiz() {
    console.log("isLastQuiz");
    return this.quizIndex == this.allQuizes.length;
  }

  getNextQuiz() {
    console.log("getNextQuiz");
    return this.allQuizes[this.quizIndex++];
  }

  endQuiz(score: number) {
    console.log("endQuiz");
    this.parms.discount = score;
    this.httpService.post(this.parms);
  }

}
