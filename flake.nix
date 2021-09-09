{
  description = "A collection of flake templates";

  outputs = { self }: {

    templates = {
      basic = {
        path = ./basic;
        description = "Basic flake template with direnv support";
      };

    };

    defaultTemplate = self.templates.basic;
  };
}
