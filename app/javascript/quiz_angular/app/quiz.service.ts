import { Injectable } from '@angular/core';
import { Quiz } from './quiz';
import { HttpClientService } from './http-client.service';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';

@Injectable()
export class QuizService {

  allQuizes: Quiz[] = [];
  quizIndex = 0;

  constructor(private httpService: HttpClientService) { }

  getQuizes(): Observable<Quiz[]> {
    return this.httpService.get().pipe(
      tap(
        quizzes => {
          console.log(quizzes);
          this.allQuizes = quizzes;
        }
      )
    )
  }

  isLastQuiz() {
    return this.quizIndex == this.allQuizes.length;
  }

  getNextQuiz() {
    return this.allQuizes[this.quizIndex++];
  }

  getShopId() {
    return this.httpService.getShopId();
  }

  endQuiz(params) {
    return this.httpService.post(params).subscribe(resp => {
      document.location.href = "/user/coupons";
    });
  }
}
