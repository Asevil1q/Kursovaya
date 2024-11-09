using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
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
    /// Логика взаимодействия для TourPage.xaml
    /// </summary>
    public partial class TourPage : Page
    {
        public TourPage()
        {
            InitializeComponent();
            var currentTour = TokarevKursovEntities.GetContext().Тур.ToList();
            ProductListView.ItemsSource = currentTour;
            TransportComboBox.SelectedIndex = 0;
            UpdateProductPage();
            int ProductMaxCount = 0;
            foreach (Тур product in currentTour)
            {
                ProductMaxCount++;
            }
            ProductMaxCountTextBlock.Text = ProductMaxCount.ToString();
        }
        private void UpdateProductPage()
        {
            var currentProducts = TokarevKursovEntities.GetContext().Тур.ToList();

            //поиск 
            currentProducts = currentProducts.Where(p => p.Название.ToLower().Contains(SearchTextBox.Text.ToLower())).ToList();

            //сортировка 
            if (RadioButtonUp.IsChecked.Value)
            {
                currentProducts = currentProducts.OrderBy(p => p.Цена_за_сутки).ToList();
            }
            if (RadioButtonDown.IsChecked.Value)
            {
                currentProducts = currentProducts.OrderByDescending(p => p.Цена_за_сутки).ToList();
            }
            switch (TransportComboBox.SelectedIndex)
            {
                case 0: // Все
                        // Не применяем фильтрацию, оставляем все продукты
                    break;
                case 1: // Автобус
                    currentProducts = currentProducts.Where(p => p.Вид_транспорта == "Автобус").ToList();
                    break;
                case 2: // Самолет
                    currentProducts = currentProducts.Where(p => p.Вид_транспорта == "Самолет").ToList();
                    break;
                case 3: // Поезд
                    currentProducts = currentProducts.Where(p => p.Вид_транспорта == "Поезд").ToList();
                    break;
                case 4: // Автомобиль
                    currentProducts = currentProducts.Where(p => p.Вид_транспорта == "Автомобиль").ToList();
                    break;
                case 5: // Яхта
                    currentProducts = currentProducts.Where(p => p.Вид_транспорта == "Яхта").ToList();
                    break;
                case 6: // Вертолет
                    currentProducts = currentProducts.Where(p => p.Вид_транспорта == "Вертолет").ToList();
                    break;
                default:
                    // Если ничего не выбрано, можно оставить currentProducts без изменений
                    break;
            }

            ProductListView.ItemsSource = currentProducts;

            int ProductCount = 0;
            foreach (Тур product in currentProducts)
            {
                ProductCount++;
            }
            ProductCountTextBlock.Text = ProductCount.ToString();

        }

        private void TransportComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateProductPage();
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateProductPage();
        }

        private void RadioButtonDown_Checked(object sender, RoutedEventArgs e)
        {
            UpdateProductPage();

        }

        private void RadioButtonUp_Checked(object sender, RoutedEventArgs e)
        {
            UpdateProductPage();

        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditPage(null));
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var currentService = (sender as Button).DataContext as Тур;
            var currentClientServices = TokarevKursovEntities.GetContext().Путевки.ToList();
            currentClientServices = currentClientServices.Where(p => p.Клиент == currentService.Код_тура).ToList();
            if (currentClientServices.Count != 0)
                MessageBox.Show("Невозможно выполнить удаление, так как существует запись клиента на этот тур");
            else
            {
                if (MessageBox.Show("Вы точно хотите выполнить удаление?", "Внимание!",
                        MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    try
                    {
                        TokarevKursovEntities.GetContext().Тур.Remove(currentService);
                       TokarevKursovEntities.GetContext().SaveChanges();
                        ProductListView.ItemsSource = TokarevKursovEntities.GetContext().Тур.ToList();
                        UpdateProductPage();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message.ToString());
                    }
                }
            }
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditPage((sender as Button).DataContext as Тур));
            UpdateProductPage();

        }
    }
}
