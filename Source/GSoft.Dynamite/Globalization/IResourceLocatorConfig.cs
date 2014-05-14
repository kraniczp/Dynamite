﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GSoft.Dynamite.Globalization
{
    /// <summary>
    /// No-implementation interface that is meant to be implemented
    /// by an app as a prerequisite for the <see cref="ResourceLocator"/> 
    /// to work.
    /// </summary>
    public interface IResourceLocatorConfig
    {
        /// <summary>
        /// Should return the keys representing all the resource files
        /// the <see cref="ResourceLocator"/> should look through to
        /// find resource labels. 
        /// For example, to reach SomeCompany.AppModule.en-US.resx and 
        /// SomeCompany.OtherModule.en-US.resx and their fr-FR.rex variants,
        /// return ["SomeCompany.AppModule", "SomeCompany.OtherModule"].
        /// </summary>
        /// <returns>The names of the resource files</returns>
        string[] ResourceFileKeys { get; }
    }
}