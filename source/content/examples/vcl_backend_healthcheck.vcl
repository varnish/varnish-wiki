
  backend server1 {
      .host = "server1.example.com";
      .probe = {
          .url = "/";
          .timeout = 1s;
          .interval = 5s;
          .window = 5;
          .threshold = 3;
      }
  }

  backend server2 {
      .host = "server2.example.com";
      .probe = {
          .url = "/";
          .timeout = 1s;
          .interval = 5s;
          .window = 5;
          .threshold = 3;
      }
  }
