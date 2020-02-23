﻿using System;
using System.Runtime.InteropServices;

// ReSharper disable once CheckNamespace
namespace NcnnDotNet
{

    internal sealed partial class NativeMethods
    {

        [DllImport(NativeLibrary, CallingConvention = CallingConvention)]
        public static extern ErrorType layer_layers_Eltwise_new(out IntPtr layer);

        [DllImport(NativeLibrary, CallingConvention = CallingConvention)]
        public static extern void layer_layers_Eltwise_delete(IntPtr layer);

    }

}