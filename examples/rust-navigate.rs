use tauri::{Manager, WebviewUrl};

#[tauri::command]
async fn navigate_to_dev_server(app: tauri::AppHandle, url: String) -> Result<(), String> {
    let parsed = url.parse().map_err(|e| format!("Invalid URL: {e}"))?;
    if let Some(window) = app.get_webview_window("main") {
        window
            .navigate(WebviewUrl::External(parsed))
            .map_err(|e| format!("Navigate failed: {e}"))?;
    }
    Ok(())
}

// Register in invoke_handler and call from the shell frontend via invoke().
