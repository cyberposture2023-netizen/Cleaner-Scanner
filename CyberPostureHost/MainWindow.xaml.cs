using System.Diagnostics;
using System.Windows;
using System.Windows.Controls;

namespace CyberPostureHost {
    public partial class MainWindow : Window {
        public MainWindow() {
            InitializeComponent();

            btnTemp.Click += (s, e) => RunScript("Cleaner\\Logic\\Cleanup.ps1");
            btnPrivacy.Click += (s, e) => RunScript("Cleaner\\Logic\\PrivacyEraser.ps1");
            btnScan.Click += (s, e) => RunScript("Scanner\\Logic\\Scan.ps1");
            btnExport.Click += (s, e) => RunScript("Scanner\\Logic\\ExportScan.ps1");
            btnAddUser.Click += (s, e) => RunScript("Admin\\Logic\\Admin.ps1");
            btnRestore.Click += (s, e) => RunScript("Admin\\Logic\\RestorePoint.ps1");
            btnRefresh.Click += (s, e) => {
                RunScript("Admin\\Logic\\HealthDashboard.ps1");
                txtHealth.Text = System.IO.File.ReadAllText("Admin\\health.txt");
            };
        }

        void RunScript(string path) {
            var psi = new ProcessStartInfo("powershell", $"-ExecutionPolicy Bypass -File \"{path}\"");
            psi.CreateNoWindow = true;
            psi.UseShellExecute = false;
            Process.Start(psi);
        }
    }
}
