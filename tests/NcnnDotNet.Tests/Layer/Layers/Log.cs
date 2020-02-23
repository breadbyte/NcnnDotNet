using Xunit;

// ReSharper disable once CheckNamespace
namespace NcnnDotNet.Tests.Layers
{

    public class Log
    {

        [Fact]
        public void CreateAndDispose()
        {
            var layer = new NcnnDotNet.Layers.Log();
            layer.Dispose();
            Assert.True(layer.IsDisposed);
        }

    }

}