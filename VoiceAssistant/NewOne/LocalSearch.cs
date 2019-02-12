using Microsoft.CognitiveServices.Speech;
using MySql.Data.MySqlClient;
using System;
using System.Globalization;
using System.Speech.Synthesis;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace VoiceAssistant
{
    public partial class LocalSearch : Form
    {
        readonly SpeechSynthesizer jarvis = new SpeechSynthesizer();
        public LocalSearch()
        {
            InitializeComponent();
            jarvis.SelectVoice("Microsoft David Desktop");
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
            Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
        }

        

        public static async Task RecognizeSpeechAsync(SpeechRecognizer recognizer, TextBox t,TextBox txtResults, Label lblQuery, SpeechSynthesizer jarvis, Button btnCopy,
            Button btnPause, Button btnSearch, Button btnStart, Button btnStop)
        {
            
            Console.WriteLine("Say something...");

            // Realiza el reconocimiento. RecognizeOnceAsync() devuelve cuando se reconoce la primera emisión
            var result = await recognizer.RecognizeOnceAsync();

            // Chequea los resultados.
            if (result.Reason == ResultReason.RecognizedSpeech)
            {
                Console.WriteLine($"RECOGNIZED: Text={result.Text}");
                string s = result.Text;
                switch (s)
                {

                    case "Hello.":
                        jarvis.SpeakAsync("Hello Sir!");
                        break;
                    case "Start reading.":
                        btnStart.PerformClick();
                        break;
                    case "Read the result.":
                    case "Read the results.":
                    case "Whats the result.":
                    case "Whats the results.":
                    case "What is the result.":
                        jarvis.SpeakAsync(txtResults.Text);
                        break;
                    case "Search.":
                        btnSearch.PerformClick();
                        break;
                    case "Pause.":

                        btnPause.PerformClick();
                        break;
                    case "Resume.":

                        btnPause.PerformClick();
                        break;
                    case "Stop.":

                        btnStop.PerformClick();
                        break;
                    case "What is the date?":
                        jarvis.Speak("Today is " + DateTime.Now.ToString("yyyy-MM-dd"));
                        break;
                    case "How are you?":
                        jarvis.Speak("I'm fine Sir");
                        break;
                    case "Close.":
                        jarvis.Speak("See you in next time!");
                        Application.Exit();
                        break;
                    case "Search for parking lots.":
                        lblQuery.Text = result.Text;
                        lblQuery.Show();
                        t.Text = "SELECT * FROM parkinglots";
                        btnSearch.PerformClick();
                        break;
                    case "Search for parks.":
                        lblQuery.Text = result.Text;
                        lblQuery.Show();
                        t.Text = "SELECT * FROM parks";
                        btnSearch.PerformClick();
                        break;
                    case "Search parks with parking lots.":
                    case "Search parks with parking.":
                        lblQuery.Text = result.Text;
                        lblQuery.Show();
                        t.Text = "SELECT * FROM parks WHERE parking=\"yes\"";
                        btnSearch.PerformClick();
                        break;

                    case "Search parks with playgrounds.":
                    case "Search for parks with playgrounds.":
                        lblQuery.Text = result.Text;
                        lblQuery.Show();
                        t.Text = "SELECT * FROM parks WHERE playground=\"yes\"";
                        btnSearch.PerformClick();
                        break;
                    case "Search parks with disability access.":
                    case "Search for parks with disability access.":
                        lblQuery.Text = result.Text;
                        lblQuery.Show();
                        t.Text = "SELECT * FROM parks WHERE disabilityaccess=\"yes\"";
                        btnSearch.PerformClick();
                        break;
                    case "Search parks with cycle track.":
                    case "Search for parks with cycle track.":
                        lblQuery.Text = result.Text;
                        lblQuery.Show();
                        t.Text = "SELECT * FROM parks WHERE cycletrack=\"yes\"";
                        btnSearch.PerformClick();
                        break;
                        
                }

            }
            else if (result.Reason == ResultReason.NoMatch)
            {
                Console.WriteLine($"NOMATCH: Speech could not be recognized.");
            }
            else if (result.Reason == ResultReason.Canceled)
            {
                var cancellation = CancellationDetails.FromResult(result);
                Console.WriteLine($"CANCELED: Reason={cancellation.Reason}");

                if (cancellation.Reason == CancellationReason.Error)
                {
                    Console.WriteLine($"CANCELED: ErrorCode={cancellation.ErrorCode}");
                    Console.WriteLine($"CANCELED: ErrorDetails={cancellation.ErrorDetails}");
                    Console.WriteLine($"CANCELED: Did you update the subscription info?");
                }
            }

        }



        private void RunQuery()
        {
            txtResults.Text = "";
            txtResults.ScrollBars = ScrollBars.Vertical;
            txtResults.ReadOnly = true;
            string query = txtQuery.Text;
            if (txtQuery.Text == "")
            {
                jarvis.Speak("Please insert a Query!");
                MessageBox.Show("Please insert a Query!");
                return;
            }

            string SqlConnectionString = "datasource=127.0.0.1;" +
                "port=3306;" +
                "username=root;" +
                "password=;" +
                "database=testdb";
            MySqlConnection databaseConnection = new MySqlConnection(SqlConnectionString);
            MySqlCommand commandDataBase = new MySqlCommand(query, databaseConnection)
            {
                CommandTimeout = 60
            };
            if (query.Contains("parkinglots"))
            {
                try
                {
                    int i = 1;
                    databaseConnection.Open();
                    MySqlDataReader reader = commandDataBase.ExecuteReader();
                    if (reader.HasRows)
                    {
                        jarvis.Speak("Getting results, please wait.");
                        while (reader.Read())
                        {
                            var sb = String.Format(
                                "{0,80}){1,-30}" +
                                "\r\n {2,-10} {3,-10} {4,-1} {5,-10}" +
                                "\r\n {6,-10} {7,-10} {8,10} {9,-10}" +
                                "\r\n {10,-10} {11,-10} {12,-5} {13,-6} {14,-3} {15,-6}" +
                                "\r\n\r\n",
                                i,reader.GetString(1),
                                "Address: ",reader.GetString(2), "&", reader.GetString(3),
                                "Capability: ",reader.GetString(4), "Cost: $", reader.GetString(5),
                                "Schedule: ",reader.GetString(9), "from ", reader.GetString(7), "to ", reader.GetString(8)
                                );
                            string s= i+") " + reader.GetString(1)+
                                " Address: " + reader.GetString(2) + " & " + reader.GetString(3) +
                                " Capability: " + reader.GetString(4) + ", Cost: $" + reader.GetString(5) +
                                " Schedule: " + reader.GetString(9) + " from " + reader.GetString(7) + " to " + reader.GetString(8);
                            i++;
                            _ = listBox1.Items.Add(s);
                            txtResults.Text += sb;

                        }
                    }
                    else
                    {
                        MessageBox.Show("Query Successfully Executed!");
                    }
                }
                catch (Exception e)
                {
                    MessageBox.Show("Error during process: " + e.ToString());
                }
            }else if (query.Contains("parks"))
            {
                try
                {
                    int i = 1;
                    databaseConnection.Open();
                    MySqlDataReader reader = commandDataBase.ExecuteReader();
                    if (reader.HasRows)
                    {
                        jarvis.Speak("Getting results, please wait.");
                        while (reader.Read())
                        {
                            var sb = String.Format("{0,80}) {1,-10} " +
                                "\r\n{2,20} {3,-25} {4,21} {5,-10} {6,20} {7,-10}" +
                                "\r\n{8,20} {9,-10} {10,55} {11,-10} {12,20} {13,-10}" +
                                "\r\n{14,27} {15,-10} {16,39} {17,-10} {18,26} {19,-10}" +
                                "{20,7}{21,-10}" + 
                                "\r\n\r\n\r\n", 
                                i, reader.GetString(1), 
                                "*Address:", reader.GetString(2), "*Telephone:", reader.GetString(3), "*Website:", reader.GetString(4),
                                "*Parking:", reader.GetString(5), "*Disability Access:", reader.GetString(6), "*Playground:", reader.GetString(7),
                                "*Adult Exercise:", reader.GetString(8), "*Rose garden:", reader.GetString(9), "*Cycletrack:", reader.GetString(10),
                                "*Fishery:", reader.GetString(11)
                                );
                            string s = i + ")" + reader.GetString(1) + " Address: " + reader.GetString(2) + " Telephone: " + reader.GetString(3) +
                                " Website: " + reader.GetString(4) + " Parking: " + reader.GetString(5) + " Disability Access:" + reader.GetString(6) +
                                " Playground: " + reader.GetString(7) + " Adult Exercise: " + reader.GetString(8) + " Rose garden: " + reader.GetString(9) +
                                " Cycletrack: " + reader.GetString(10) + " Fishery: " + reader.GetString(11);
                            i++;
                            txtResults.Text += sb;
                            _ = listBox1.Items.Add(s);
                        }
                    }
                    else
                    {
                        MessageBox.Show("Query Successfully Executed!");
                    }
                }
                catch (Exception e)
                {
                    MessageBox.Show("Error during process: " + e.ToString());
                }
            }
            

        }




        private async void BtnRecognition_Click(object sender, EventArgs e)
        {
            //Aqui se debe poner la clave de suscripcion y la region con la que se trabaja ej ("xxxxxxxx","westus")
            var config = SpeechConfig.FromSubscription("YourSubscriptionKey", "YourServiceRegion");

            var recognizer = new SpeechRecognizer(config);
            await RecognizeSpeechAsync(recognizer, txtQuery,txtResults, lblQuery, jarvis, btnCopy, btnPause, btnSearch, btnStart, btnStop);
        }


        private void BtnSearch_Click(object sender, EventArgs e)
        {
            RunQuery();
        }

        //Empiece Lectura
        private void BtnStart_Click(object sender, EventArgs e)
        {
            btnCopy.PerformClick();
            btnStart.Enabled = false;
            btnPause.Enabled = true;
        }

        //Boton para pausar o resumir lectura
        private void BtnPause_Click(object sender, EventArgs e)
        {
            if (jarvis.State == SynthesizerState.Speaking)
            {
                jarvis.Pause();
                btnPause.Text = "Reanudar";
            }
            else
            {
                if (jarvis.State == SynthesizerState.Paused)
                {
                    jarvis.Resume();
                    btnPause.Text = "Pausa";
                }
            }
        }

        //Detiene la lectura por completo
        private void BtnStop_Click(object sender, EventArgs e)
        {
            if (jarvis.State == SynthesizerState.Paused)
                jarvis.Resume();
            jarvis.SpeakAsyncCancelAll();
            btnStop.Text = "Stop";
            btnStart.Enabled = true;

        }

        //Copia el texto seleccionado para leerlo
        private void BtnCopy_Click(object sender, EventArgs e)
        {
            string text = txtResults.SelectedText;
            jarvis.SpeakAsync(text);

        }

        private void BtnWebSearch_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Close Local Search and open Web Search?", "Confirmation Message", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                WebSearch localSearch = new WebSearch
                {
                    Visible = true
                };
                this.Visible = false;
            }
        }

        private void BtnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }

}
