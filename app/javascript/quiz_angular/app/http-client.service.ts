import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

import { Quiz } from './quiz';

@Injectable()
export class HttpClientService {

  httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };

  private quizUrl: string = 'http://localhost:3000/quizzes';

  constructor(private http: HttpClient) {
    this.setAuthorization('my-auth-token');
  }

  public get(): Observable<Quiz[]> {
    return this.http.get<Quiz[]>(this.quizUrl + `?count=3`, this.httpOptions);
  }

  public post(parm: any): Promise<any> {
    return this.http.post(this.quizUrl, parm, this.httpOptions).toPromise();
  }

  private errorHandler(err) {
    console.log('Error occured.', err);
    return Promise.reject(err.message || err);
  }

  public setAuthorization(token: string = ''): void {
    if (!token) {
      return;
    }
    const bearerToken: string = `Bearer ${token}`;
    this.httpOptions.headers = this.httpOptions.headers.set('Authorization', bearerToken);
  }

}
