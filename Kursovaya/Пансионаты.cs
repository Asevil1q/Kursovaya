//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Kursovaya
{
    using System;
    using System.Collections.Generic;
    
    public partial class Пансионаты
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Пансионаты()
        {
            this.Путевки = new HashSet<Путевки>();
        }
    
        public int Код_пансионата { get; set; }
        public string Название { get; set; }
        public string Описание { get; set; }
        public string Страна { get; set; }
        public string Город { get; set; }
        public string Адрес { get; set; }
        public string Телефон { get; set; }
        public int Кол_во_номеров { get; set; }
        public string Бассейн { get; set; }
        public string Мед_услуги { get; set; }
        public string Спа_салон { get; set; }
        public string До_моря { get; set; }
        public int Вид_жилья { get; set; }
    
        public virtual Вид_жилья Вид_жилья1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Путевки> Путевки { get; set; }
    }
}
