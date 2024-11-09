using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Kursovaya
{
    /// <summary>
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        private Тур _currentTour = new Тур();
        public AddEditPage(Тур SelectedTour)
        {
            InitializeComponent();

            if (SelectedTour != null)
            {
                _currentTour = SelectedTour;
                ComboType.SelectedIndex = 0;

            }

            DataContext = _currentTour;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            var context = TokarevKursovEntities.GetContext();

            if (string.IsNullOrWhiteSpace(_currentTour.Название))
            {
                errors.AppendLine("Укажите название тура");
            }
            else if (context.Тур.Any(tour => tour.Название == _currentTour.Название && _currentTour.Код_тура != _currentTour.Код_тура))
            {
                errors.AppendLine("Уже существует такая услуга");
            }
            if (_currentTour.Цена_за_сутки <= 0)
            {
                errors.AppendLine("Укажите цену за сутки");
            }

            if (ComboType3.SelectedItem == null)
            {
                errors.AppendLine("Укажите Вид жилья");
            }
            else
            {
                _currentTour.Вид_жилья1 = (ComboType3.SelectedItem as TextBlock)?.Text;

            }
            if (ComboType.SelectedItem == null)
            {
                errors.AppendLine("Укажите вид транспорта");
            }
            else
            {
                _currentTour.Вид_транспорта= (ComboType.SelectedItem as TextBlock)?.Text;
            }
            if (ComboType2.SelectedItem == null)
            {
                errors.AppendLine("Укажите вид питания");
            }
            else
            {
                _currentTour.Вид_питания = (ComboType2.SelectedItem as TextBlock)?.Text;
            }


            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentTour.Код_тура == 0)
            {
                int maxКод_тура = context.Тур.Max(v => v.Код_тура);
                _currentTour.Код_тура = maxКод_тура + 1;
                // Добавление новой записи
                context.Тур.Add(_currentTour);
                TokarevKursovEntities.GetContext().Тур.Add(_currentTour);
            }
            try
            {
                TokarevKursovEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена");
                Manager.MainFrame.GoBack();
            }
            catch (DbEntityValidationException ex)
            {
                StringBuilder validationErrors = new StringBuilder();

                foreach (var validationError in ex.EntityValidationErrors)
                {
                    foreach (var error in validationError.ValidationErrors)
                    {
                        validationErrors.AppendLine($"Property: {error.PropertyName} Error: {error.ErrorMessage}");
                    }
                }

                MessageBox.Show(validationErrors.ToString(), "Ошибки валидации", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
        }
            private void ChangePictureBtn_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog myOpenFileDialog = new OpenFileDialog();
            myOpenFileDialog.Filter = "Image Files|*.jpg;*.jpeg;*.png;*.bmp"; // Добавление фильтра для выбора изображений
            if (myOpenFileDialog.ShowDialog() == true)
            {
                _currentTour.Photo = myOpenFileDialog.FileName;
                LogoImage.Source = new BitmapImage(new Uri(myOpenFileDialog.FileName));
            }
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            var currentTour = (sender as Button).DataContext as Тур;



            if (MessageBox.Show("Вы точно хотите выполнить удаление?", "Внимание!",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    TokarevKursovEntities.GetContext().Тур.Remove(currentTour); // Удаляем текущий тур
                    TokarevKursovEntities.GetContext().SaveChanges(); // Сохраняем изменения в базе данных
                    MessageBox.Show("Запись успешно удалена.");
                }
                catch (DbUpdateException dbEx)
                {
                    MessageBox.Show($"Ошибка при удалении записи: {dbEx.InnerException?.Message ?? dbEx.Message}");
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка: {ex.Message}");
                }
            }

        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }


}

