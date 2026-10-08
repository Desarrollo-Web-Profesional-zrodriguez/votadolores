# Vota Dolores Hidalgo — Plebiscito Vecinal con TDD

Desarrollo Móvil Integral — Proyecto complementario de práctica TDD (Test-Driven Development).

---

## 7. Checklist de este proyecto TDD

A continuación se presenta la tabla de verificación de requisitos y buenas prácticas con sus respectivos espacios para integrar las capturas de pantalla como evidencia de la actividad:

<table style="width: 100%; border-collapse: collapse; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; margin: 20px 0; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);">
  <thead>
    <tr style="background-color: #1a237e; color: #ffffff; text-align: left;">
      <th style="padding: 14px 18px; width: 45%; border: 1px solid #1a237e; font-size: 15px;">✓ Verificación</th>
      <th style="padding: 14px 18px; width: 55%; border: 1px solid #1a237e; font-size: 15px; text-align: center;">📸 Evidencia (Captura de Pantalla)</th>
    </tr>
  </thead>
  <tbody>
    <!-- FILA 1 -->
    <tr style="background-color: #ffffff; border-bottom: 1px solid #e2e8f0;">
      <td style="padding: 16px 18px; border: 1px solid #cbd5e1; vertical-align: top;">
        <div style="display: flex; align-items: flex-start; gap: 8px;">
          <input type="checkbox" checked readonly style="margin-top: 3px;" />
          <div>
            <strong>Cada regla de negocio</strong> (voto único, opción válida, fecha de cierre, empates) tiene su propia prueba.
          </div>
        </div>
      </td>
      <td style="padding: 16px 18px; border: 1px solid #cbd5e1; text-align: center; vertical-align: middle;">
        <!-- ESPACIO PARA TU IMAGEN 1: Pega tu imagen aquí abajo -->
        <p style="color: #64748b; font-size: 13px; margin: 0 0 8px 0;"><em>Captura de las pruebas en <code>test/servicio_votacion_test.dart</code></em></p>
        <img src="assets/evidencia_1_reglas.png" alt="Evidencia 1: Reglas de negocio probadas" width="450" style="max-width: 100%; border-radius: 8px; border: 1px dashed #94a3b8; display: block; margin: 0 auto;" />
      </td>
    </tr>

    <!-- FILA 2 -->
    <tr style="background-color: #f8fafc; border-bottom: 1px solid #e2e8f0;">
      <td style="padding: 16px 18px; border: 1px solid #cbd5e1; vertical-align: top;">
        <div style="display: flex; align-items: flex-start; gap: 8px;">
          <input type="checkbox" checked readonly style="margin-top: 3px;" />
          <div>
            <strong><code>ResultadoVoto</code> se usa para casos esperados;</strong> no se abusa de excepciones para control de flujo normal.
          </div>
        </div>
      </td>
      <td style="padding: 16px 18px; border: 1px solid #cbd5e1; text-align: center; vertical-align: middle;">
        <!-- ESPACIO PARA TU IMAGEN 2: Pega tu imagen aquí abajo -->
        <p style="color: #64748b; font-size: 13px; margin: 0 0 8px 0;"><em>Captura de <code>lib/logica/resultado_voto.dart</code> y <code>servicio_votacion.dart</code></em></p>
        <img src="assets/evidencia_2_resultado_voto.png" alt="Evidencia 2: Enum ResultadoVoto" width="450" style="max-width: 100%; border-radius: 8px; border: 1px dashed #94a3b8; display: block; margin: 0 auto;" />
      </td>
    </tr>

    <!-- FILA 3 -->
    <tr style="background-color: #ffffff; border-bottom: 1px solid #e2e8f0;">
      <td style="padding: 16px 18px; border: 1px solid #cbd5e1; vertical-align: top;">
        <div style="display: flex; align-items: flex-start; gap: 8px;">
          <input type="checkbox" checked readonly style="margin-top: 3px;" />
          <div>
            <strong><code>obtenerResultados()</code> no puede dividir entre cero</strong> cuando no hay votos.
          </div>
        </div>
      </td>
      <td style="padding: 16px 18px; border: 1px solid #cbd5e1; text-align: center; vertical-align: middle;">
        <!-- ESPACIO PARA TU IMAGEN 3: Pega tu imagen aquí abajo -->
        <p style="color: #64748b; font-size: 13px; margin: 0 0 8px 0;"><em>Captura del método <code>obtenerResultados()</code> y su test correspondiente</em></p>
        <img src="assets/evidencia_3_division_cero.png" alt="Evidencia 3: Prevención de división por cero" width="450" style="max-width: 100%; border-radius: 8px; border: 1px dashed #94a3b8; display: block; margin: 0 auto;" />
      </td>
    </tr>

    <!-- FILA 4 -->
    <tr style="background-color: #f8fafc; border-bottom: 1px solid #e2e8f0;">
      <td style="padding: 16px 18px; border: 1px solid #cbd5e1; vertical-align: top;">
        <div style="display: flex; align-items: flex-start; gap: 8px;">
          <input type="checkbox" checked readonly style="margin-top: 3px;" />
          <div>
            <strong>La interfaz (<code>VotacionScreen</code>) no duplica ninguna regla</strong> ya cubierta por <code>ServicioVotacion</code>.
          </div>
        </div>
      </td>
      <td style="padding: 16px 18px; border: 1px solid #cbd5e1; text-align: center; vertical-align: middle;">
        <!-- ESPACIO PARA TU IMAGEN 4: Pega tu imagen aquí abajo -->
        <p style="color: #64748b; font-size: 13px; margin: 0 0 8px 0;"><em>Captura de <code>lib/presentation/votacion_screen.dart</code> llamando a <code>_servicio.registrarVoto()</code></em></p>
        <img src="assets/evidencia_4_ui_desacoplada.png" alt="Evidencia 4: UI delega a ServicioVotacion" width="450" style="max-width: 100%; border-radius: 8px; border: 1px dashed #94a3b8; display: block; margin: 0 auto;" />
      </td>
    </tr>

    <!-- FILA 5 -->
    <tr style="background-color: #ffffff; border-bottom: 1px solid #e2e8f0;">
      <td style="padding: 16px 18px; border: 1px solid #cbd5e1; vertical-align: top;">
        <div style="display: flex; align-items: flex-start; gap: 8px;">
          <input type="checkbox" checked readonly style="margin-top: 3px;" />
          <div>
            <strong>Existe una prueba de integración</strong> que simula un plebiscito completo, incluyendo un intento de voto duplicado.
          </div>
        </div>
      </td>
      <td style="padding: 16px 18px; border: 1px solid #cbd5e1; text-align: center; vertical-align: middle;">
        <!-- ESPACIO PARA TU IMAGEN 5: Pega tu imagen aquí abajo -->
        <p style="color: #64748b; font-size: 13px; margin: 0 0 8px 0;"><em>Captura de la prueba de integración y la terminal con <code>flutter test</code> en verde</em></p>
        <img src="assets/evidencia_5_integracion.png" alt="Evidencia 5: Test de integración y terminal en verde" width="450" style="max-width: 100%; border-radius: 8px; border: 1px dashed #94a3b8; display: block; margin: 0 auto;" />
      </td>
    </tr>
  </tbody>
</table>

---

## 🚀 Ejecución del Proyecto

### Ejecutar todas las pruebas (TDD):
```bash
flutter test
```

### Ejecutar la aplicación:
```bash
flutter run
```
