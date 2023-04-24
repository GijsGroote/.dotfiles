-- Startup screen
return {
    'goolord/alpha-nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons'
    },

    config = function() 
      require('alpha').setup(
        require('config.alpha-dashboard').config
      )
    end
  }
