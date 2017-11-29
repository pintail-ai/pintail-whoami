import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Pintail.ai Docker Example';

  container_id = 'NONE'
  
   // Inject HttpClient into your component or service.
   constructor(private http: HttpClient) {}
  
   ngOnInit(): void {
     // Make the HTTP request:
     this.http.get('/api/',{responseType: 'text'}).subscribe(data => {
       // Read the result field from the JSON response.
       this.container_id = data;
     });
   }

}
