using System;
using System.Diagnostics;
using System.IO;
using System.Windows;
using System.Windows.Controls;

namespace CyberPostureHost {
    public partial class MainWindow : Window {
        public MainWindow() {
            try {
                InitializeComponent();
                Log("Application started.");

                btnTemp.Click += (s, e) => Trigger("Cleanup.ps1");
                btnPrivacy.Click += (s, e) => Trigger("PrivacyEraser.ps1");
                btnScan.Click += (s, e) => Trigger("Scan.ps1");
                btnExport.Click += (s, e) => Trigger("ExportScan.ps1");
                btnAddUser.Click += (s, e) => Trigger("Admin.ps1");
                btnRestore.Click += (s, e) => Trigger("RestorePoint.ps1");
                btnRefresh.Click += (s, e) => {
                    Trigger("HealthDashboard.ps1");
                    try {
                        txtHealth.Text = File.ReadAllText("Admin\\health.txt");
                        Log("Dashboard refreshed.");
                    } catch (Exception ex) {
                        Log("Dashboard read failed: " + ex.Message);
                        MessageBox.Show("Dashboard error: " + ex.Message);
                    }
                };
            } catch (Exception ex) {
                Log("Startup error: " + ex.Message);
                MessageBox.Show("Startup failed: " + ex.Message);
            }
        }

        void Trigger(string script) {
            try {
                Log("Triggering " + script);
                var psi = new ProcessStartInfo("powershell", $"-ExecutionPolicy Bypass -File \"{script}\"");
                psi.CreateNoWindow = true;
                psi.UseShellExecute = false;
                Process.Start(psi);
            } catch (Exception ex) {
                Log("Script error: " + ex.Message);
                MessageBox.Show("Script failed: " + ex.Message);
            }
        }

        void Log(string message) {
            File.AppendAllText("Admin\\event.log", DateTime.Now + " - " + message + Environment.NewLine);
        }
    }
}
