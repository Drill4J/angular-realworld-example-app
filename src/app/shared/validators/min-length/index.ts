import { AbstractControl, ValidatorFn } from "@angular/forms";

export function minLength(minLength: number): ValidatorFn {
  return (control: AbstractControl): {[key: string]: any} | null => {
    if (control.value.length < minLength) {
      return { minLength };
    }
    return null;
  };
}
