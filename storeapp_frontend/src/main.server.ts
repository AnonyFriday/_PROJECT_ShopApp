import { bootstrapApplication } from '@angular/platform-browser';
import { config } from './app/app.config.server';
import { OrderComponent } from './app/order/order.component';
import { LoginComponent } from './app/login/login.component';
import { RegisterComponent } from './app/register/register.component';

const bootstrap = () => bootstrapApplication(RegisterComponent, config);

export default bootstrap;
