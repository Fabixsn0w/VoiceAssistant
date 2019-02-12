using System;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.CognitiveServices.Speech;
using System.Threading;
using System.Speech.Synthesis;
using mshtml;
using System.Globalization;
using Microsoft.Azure.CognitiveServices.Search.WebSearch;
using System.Linq;

namespace VoiceAssistant
{
    public partial class WebSearch : Form
    {
        readonly SpeechSynthesizer jarvis = new SpeechSynthesizer();

        public WebSearch()
        {
            InitializeComponent();
            jarvis.SelectVoice("Microsoft David Desktop");
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
            Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
            pictureBox1.SizeMode= PictureBoxSizeMode.StretchImage; 
        }

        //Se usa el API de Bing para la interpretacion de lo que se dice para posterior busqueda
        public static async Task RecognizeSpeechAsync(SpeechRecognizer recognizer, TextBox t, ListBox l, SpeechSynthesizer jarvis, Button btnCopy,
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
                        btnCopy.PerformClick();
                        btnStart.PerformClick();
                        break;
                    case "Read the result.":
                    case "Read the results.":
                    case "Whats the result.":
                    case "Whats the results.":
                    case "What is the result.":
                        l.Items.Clear();
                        try
                        {
                            //Clave para usar lectura en base a una busqueda web con azure, las puedes encontrar en su pagina oficial
                            WebSearchAPI client = new WebSearchAPI(new ApiKeyServiceClientCredentials("YourSubscriptionKey"));
                            var webData = client.Web.SearchAsync(query: t.Text, offset: 10, count: 20).Result;

                            if (webData?.WebPages?.Value?.Count > 0)
                            {
                                //Enlista el resultado de paginas encontradas y en base a lo que se necesita se hace el llamado
                                //En este caso llamamos el nombre de la pagina y descripcion
                                var firstWebPagesResult = webData.WebPages.Value.ToList();
                                foreach (var f in firstWebPagesResult)
                                {
                                    l.Items.Add(f.Name + ": " + f.Snippet);
                                    jarvis.SpeakAsync("Web Page Name: " + f.Name + ". Description: " + f.Snippet);
                                    Console.WriteLine("Name: " + f.Name + "\nSnippet: " + f.Snippet);
                                }

                                if (firstWebPagesResult != null)
                                {
                                    Console.WriteLine("Web Results #{0}", webData.WebPages.Value.Count);
                                    //Console.WriteLine("First web page name: {0} ", firstWebPagesResult.Name);
                                    //Console.WriteLine("First web page URL: {0} ", firstWebPagesResult.Url);
                                }
                                else
                                {
                                    Console.WriteLine("Couldn't find first web result!");
                                }
                            }
                            else
                            {
                                Console.WriteLine("Didn't see any Web data..");
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine("Encountered exception. " + ex.Message);
                        }
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
                        jarvis.SpeakAsync("See you in next time!");
                        Application.Exit();
                        break;
                    default:
                        jarvis.SpeakAsync("Searching for: " + result.Text);
                        t.Text = result.Text;
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




        //=======================================================BOTONES=======================================================

        //Copia el texto seleccionado para leerlo
        private void BtnCopy_Click(object sender, EventArgs e)
        {
            IHTMLDocument2 htmldoc = webBrowser1.Document.DomDocument as IHTMLDocument2;
            IHTMLSelectionObject currentSelection = htmldoc.selection;

            if (currentSelection != null)
            {
                if (currentSelection.createRange() is IHTMLTxtRange range)
                {
                    txtConvertedText.Text = range.text;
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

        //Regresa una pagina en el navegador
        private void BtnBack_Click(object sender, EventArgs e)
        {
            webBrowser1.GoBack();
        }

        //Avanza una pagina del navegador
        private void BtnForward_Click(object sender, EventArgs e)
        {
            webBrowser1.GoForward();
        }

        //Metodo para reconocimiento de palabras
        private async void BtnRecognition_Click(object sender, EventArgs e)
        {
            //Aqui se debe poner la clave de suscripcion y la region con la que se trabaja ej ("xxxxxxxx","westus")
            var config = SpeechConfig.FromSubscription("YourSubscriptionKey", "YourServiceRegion");
            // Se crea un reconocedor de voz.
            var recognizer = new SpeechRecognizer(config);
            await RecognizeSpeechAsync(recognizer, txtKeyword, lbConvertedList, jarvis, btnCopy, btnPause, btnSearch, btnStart, btnStop);
        }

        //Empiece Lectura
        private void BtnStart_Click(object sender, EventArgs e)
        {
            btnCopy.PerformClick();
            btnStart.Enabled = false;
            btnPause.Enabled = true;
            jarvis.SpeakAsync(txtConvertedText.Text);
        }

        //Este es el boton para busqueda en el navegador
        private void BtnSearch_Click(object sender, EventArgs e)
        {
            string url = txtKeyword.Text;
            Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
            webBrowser1.Navigate("https://www.bing.com/search?q=" + url + "&cc=en");

        }

        //Boton para pausar lectura
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

        private void BtnLocalSearch_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Close Web Search and open Local Search?", "Confirmation Message", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                LocalSearch localSearch = new LocalSearch
                {
                    Visible = true
                };
                this.Visible = false;
            }            
        }

        private void BtnClose_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }

}
