
class Dummy{

  static List<String> _myList = [
    "https://i.pinimg.com/originals/2a/0c/e8/2a0ce8571dbe94be9370cd4b94d57c0a.jpg",
    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/thriller-fantasy-book-cover-castle-mountain-design-template-890a4e62a2009241b05e70a59186240d_screen.jpg?ts=1637015300",
    "https://i.pinimg.com/originals/f0/97/8b/f0978be18c51ec31350254107672d9fd.png",
    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/027c420a-b15a-4a15-b933-cbfd99256e4b/de5hfm3-d07aaa15-0028-4208-808a-918e02ad1b44.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzAyN2M0MjBhLWIxNWEtNGExNS1iOTMzLWNiZmQ5OTI1NmU0YlwvZGU1aGZtMy1kMDdhYWExNS0wMDI4LTQyMDgtODA4YS05MThlMDJhZDFiNDQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.WWmya6NnhUomfXHowkwEC48Jy39GOuMyfw-k_bI3aaE",
    "https://i.pinimg.com/736x/c7/13/20/c713207913a7c706becef1d58ad027bf.jpg",
    "https://images2.minutemediacdn.com/image/fetch/c_fill,g_auto,f_auto,h_2850,w_1876/https%3A%2F%2Fwinteriscoming.net%2Ffiles%2F2022%2F08%2FFirstBinding_hi_comp_GO-1.jpg",
  ];

  static String chooseRand(){
    var randomItem = (_myList..shuffle()).first;
    return randomItem;
  }

 
}