using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(movieapplication.Startup))]
namespace movieapplication
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
