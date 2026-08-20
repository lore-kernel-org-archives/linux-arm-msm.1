Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08CB415B68
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 11:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787227127; cv=none; b=aHEGLBHkUF3mY/yBUXvJR4xAJiC9jojp5KU8W/y0VA779c87m9gw4G6plEy8Wuh8Fey60fku68n+80/5sNMRzUJQ7Tw3R/hW6obyLWIFZ0KvuKnqBn5uus/XNCmdsOf8p5kH/k7igEb3YTiPZv4hyHqJx0DJOssi07VfcvW0E9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787227127; c=relaxed/simple;
	bh=9SpD8W/pBMFw78YhGv8/2Fcjic1NtDIzErLrJ9qd19c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GH2yWFMTAXm2ZptIZm+PNZx/5/gVarXc9qkvj3CLNivQ4oSfiajlMZMIbHrH75lvqIJBOa9q2OhjxTteSiOrGnVdPIy2Sby0Gw+Omw4dmtGDUoUwA7R8U5I8N7ex3KucQjoJiOC85VHZ7Y9CaZEss1jsjc39Su77T5KiOOznhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbYmy/UD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbYmy/UD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787227125; x=1818763125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9SpD8W/pBMFw78YhGv8/2Fcjic1NtDIzErLrJ9qd19c=;
  b=mbYmy/UDlGgP8qaUShRutvc1PSCo9XExE7GTgVPfgyQW6hcnHfI2Wvj1
   sMKFlPCRZSoP459Y2YUMkqPBs6sRJVcxB0VlaZO5SxVXMHj1toDyoYRoJ
   oqw6qgF2pbDbP0F3hCX10kDEX5BCW4QY6/38KLX+8lwYM7nIn+p+Z8T1E
   /s06kb0L0T/HMMxPSV+4uL2mKxW35NCIa3aPQqu5M6aiuqcrfQmd64a+4
   Er20Ymm+NVQYBFPE1zA/0jyvDqGjqQVc2sM8Xv0liYQI+0BI5IaSi1+sH
   onPQm4VypGBrs1ttXUvM+vs6auvVTlt/0XONDeiLF/R9BDMQ5HLboWSjU
   w==;
X-CSE-ConnectionGUID: e87r6qV7Swi/O6Da4B62rA==
X-CSE-MsgGUID: UPU2jUsDSzCLUQ6eO3F8bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98092545"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="98092545"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 04:58:45 -0700
X-CSE-ConnectionGUID: 8yM+MwNlSvucnS86XmMcjg==
X-CSE-MsgGUID: xNJg0xCcSzO8GbN7GDN4Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="261743126"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Aug 2026 04:58:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx1Pq-00000000iuX-42o8;
	Thu, 20 Aug 2026 11:58:38 +0000
Date: Thu, 20 Aug 2026 19:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
	jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
	troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: oe-kbuild-all@lists.linux.dev, ogabbay@kernel.org, lizhi.hou@amd.com,
	karol.wachowski@linux.intel.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Troy Hanson <thanson@qti.qualcomm.com>
Subject: Re: [PATCH] accel/qaic: Add support for AI200 virtual functions
Message-ID: <202608201947.WZ2pipww-lkp@intel.com>
References: <20260814164125.3652876-1-youssef.abdulrahman@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814164125.3652876-1-youssef.abdulrahman@oss.qualcomm.com>

Hi Youssef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.2 next-20260819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youssef-Samir/accel-qaic-Add-support-for-AI200-virtual-functions/20260814-184125
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260814164125.3652876-1-youssef.abdulrahman%40oss.qualcomm.com
patch subject: [PATCH] accel/qaic: Add support for AI200 virtual functions
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260820/202608201947.WZ2pipww-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201947.WZ2pipww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201947.WZ2pipww-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/qaic/qaic_drv.c:81:40: warning: 'aic200vf_config' defined but not used [-Wunused-const-variable=]
      81 | static const struct qaic_device_config aic200vf_config = {
         |                                        ^~~~~~~~~~~~~~~


vim +/aic200vf_config +81 drivers/accel/qaic/qaic_drv.c

    80	
  > 81	static const struct qaic_device_config aic200vf_config = {
    82		.family = FAMILY_AIC200_VF,
    83		.bar_mask = BIT(0) | BIT(1) | BIT(2) | BIT(4),
    84		.mhi_bar_idx = 1,
    85		.dbc_bar_idx = 2,
    86	};
    87	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
