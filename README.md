# Vota Dolores Hidalgo — Plebiscito Vecinal con TDD

Desarrollo Móvil Integral — Proyecto complementario de práctica TDD (Test-Driven Development).

---

## 7. Checklist de este proyecto TDD

| ✓ Verificación | 📸 Evidencia|
| :--- | :---: |
| - [x] **Cada regla de negocio** (voto único, opción válida, fecha de cierre, empates) tiene su propia prueba. | <img src="assets/evidencia_1_reglas.png" width="450" alt="Evidencia 1"> |
| - [x] **`ResultadoVoto` se usa para casos esperados;** no se abusa de excepciones para control de flujo normal. | <img src="assets/evidencia_2_resultado_voto.png" width="450" alt="Evidencia 2">|
| - [x] **`obtenerResultados()` no puede dividir entre cero** cuando no hay votos. | <img src="assets/evidencia_3_division_cero.png" width="450" alt="Evidencia 3"> |
| - [x] **La interfaz (`VotacionScreen`) no duplica ninguna regla** ya cubierta por `ServicioVotacion`. | <img src="assets/evidencia_4_ui_desacoplada.png" width="450" alt="Evidencia 4"> |
| - [x] **Existe una prueba de integración** que simula un plebiscito completo, incluyendo un intento de voto duplicado. | <img src="assets/evidencia_5_integracion.png" width="450" alt="Evidencia 5"> |

---

![alt text](image.png)

![alt text](image-1.png)

## 🚀 Ejecución del Proyecto

### Ejecutar todas las pruebas (TDD):
```bash
flutter test
```

### Ejecutar la aplicación:
```bash
flutter run
```