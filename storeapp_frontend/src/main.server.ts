import { bootstrapApplication } from '@angular/platform-browser';
import { config } from './app/app.config.server';
import { HomeComponent } from './app/home/home.component';
import { OrderConfirmComponent } from './app/order-confirm/order-confirm.component';

const bootstrap = () => bootstrapApplication(OrderConfirmComponent, config);

export default bootstrap;
