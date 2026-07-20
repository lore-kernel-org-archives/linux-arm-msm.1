Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1775C3438B6;
	Mon, 20 Jul 2026 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546718; cv=none; b=LoKVCrNOhazpAQf2xDwzCh6t+X0/pcziUYNLlYNG8R8sHRapapzbcHo+IsVqNkFWD2azXDjq3skjGk/kpxbolsNIfQ5RzQM63EAdJUQaNxWAawmVbzyIhf6RZpZz0S5/3fGDYRKy71TyjsiMKg4ZGQlJXwshcqKk7sXdwmygY/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546718; c=relaxed/simple;
	bh=CJX8fznzPc9Nj5imz58fb6QIOpYCrCWvGYvGxBv5MH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=miyd9IW9g50/3mvZ8lZ7Eq+GQshP7NmF4PezHcesU+j0K8iRqJxaODtehKjtouRRQ2tJd5zPO2DZ3ktCgsBsPCmAfpU9mmdhkJFmk+d6Wq1yUOknN+SKWNn1+s0RAwi3IKHoA4DgH9V07G3sqnaTEVDQ3v1s8uYWaCxM2ZsjzrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8TuNfPi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8TuNfPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784546717; x=1816082717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CJX8fznzPc9Nj5imz58fb6QIOpYCrCWvGYvGxBv5MH0=;
  b=R8TuNfPisZiL77LahOlinwsL0ZqDgHPJJRfzmvMAs6x5ToXBbWTEw9Mc
   AbhuMXZxU8ctxho7afElwmBOoON5OJBuv7lERgeTrDpkqfsUjlTgGWYEC
   p6nABXwLK6k3ecHCqMYapdbEg6HyGv7Mc0AvY+oXcIMZu5ivlmPtH3UKY
   mn0Pf/urzen7Igp6++RRG4ZxmF2krlHQZ68+lsTdgs+H9iUtDNfHmffol
   Dj23Aqx4/JMhPjzO5OoyZTZIqBkLvAiVBdSaEcacAwjHwOyVMA62x/wjW
   BwYlr8EzUpJXrBihLp04OgUwXsH5kR09yphDKrmtRzymISKYQg/x5/1Fh
   Q==;
X-CSE-ConnectionGUID: vmR1lS4VRg6NK8HoETYRbw==
X-CSE-MsgGUID: DNzFi2dpSa6+xP7TG6epig==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="88947208"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="88947208"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:25:16 -0700
X-CSE-ConnectionGUID: p4Al4b5hTry/r7sRPCQT6Q==
X-CSE-MsgGUID: 2taNrxjPQwWJ2eB9d9FEtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="256256367"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:25:13 -0700
Date: Mon, 20 Jul 2026 14:25:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, spatakok@qti.qualcomm.com,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	ravi.hothi@oss.qualcomm.com, dakr@kernel.org
Subject: Re: [DISCUSSION] fw_devlink: incorrect ancestor fallback for
 intermediate bus topologies breaks audio dependency resolution
Message-ID: <al4Flj5ntmqCKbH4@ashevche-desk.local>
References: <20260701131733.870079-1-ajay.nandam@oss.qualcomm.com>
 <d224b1e5-99a0-4794-b043-d6335f98753c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d224b1e5-99a0-4794-b043-d6335f98753c@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 20, 2026 at 04:42:21PM +0530, Ajay Kumar Nandam wrote:
> Hi All,
> 
> Gentle Ping on this discussion.

> CC'ing Danilo Krummrich and Andy Shevchenko

I'm not sure how I can be helpful here, but it would be nice to see a small
summary (a few sentences) to understand what this is all about.


> On 7/1/2026 6:47 PM, Ajay Kumar Nandam wrote:
> > Hi Saravana Kannan,

And yes, Saravana, is the main expert in FW devlinks AFAIK.

-- 
With Best Regards,
Andy Shevchenko


