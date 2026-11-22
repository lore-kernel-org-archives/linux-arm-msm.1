Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795324601;
	b=jmsjuggInVKqSy3Yb53fpkjoZxwyoO6/W9NAy8R37z1t/QVZ75+S5iL4/UMsTBpbJM8R
	 QdhbjDrpN4mNUte5xUQLYaos6M+xQq9cY8ljekqX5DCOdc4RnATUonVDnG32wRlrjvzFL
	 yv91TrT7gLb+TWn9ZUTzNDjOSYN/Y9Jn5X8LM0fqRQPpFCy3VKU3pBC9ENigbfi0crJVr
	 xrrBHeqxONZHhIZSp5KnP6+3vwzAiiTow9Ui75e85iF16/GndN+6CuJq5Q6YwR5Ghs93J
	 FVRgE5hO96Iu7uu1fWiBfp3hF9fEj05/Ktxeh2jtK2nDuJMSElSAldpOYNTuM2fE9eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324601;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wMqUtbghx+AfUwNzZIx35GF0oZl4GX6WxEfgfxHEO/A=;
	b=PfQzbYkS6ph5+QEn8ImuV5cBwCDlmqIUVI+QxvqfugSbDIhSyMF2RraaYNJoa7YUx9lV
	 ApKfQM1Y2rQtgvnwyp3oCpDbUh6qQ/rjDIWGI8/Q/Ekz7T4geUWbcSxTNOoo39PzfH4z5
	 kKDFpqb7X09OEuXWCx8tO1jlcO5x6nCkFUgTfEnr0fWfrFyaYB9nXWPi1J7wzPmZBLEom
	 wZVq3b9fXFs1DHd3jv0qTCX7DRRtLZ1sigoWCCU/3NImweQReLXj2MiHbvKt6b5oXuZRx
	 pNsCdtqRbfLtGA4ktwN/xh+NCTFUQsniNEzKrqA4OExGo/bTFbO8htgGFA24ADiab6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=afCOKP6R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD4606A32A;
	Sun, 22 Nov 2026 05:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=afCOKP6R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A171F000C0;
	Sun, 22 Nov 2026 05:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324601;
	bh=wMqUtbghx+AfUwNzZIx35GF0oZl4GX6WxEfgfxHEO/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=afCOKP6R9quPVesuVvAvKr6Ti0miKQn6DY3/Qh1fzBnYgLdWQrUlG5I1J1rdie6I1
	 moLEWWkUke5whAmi3M2lEk7JeBxgNBaaWgIHbFT+l0cYPc+oz0WRzLeAilmYLXTCee
	 qtuOk6cstNrjpP1DOuECKEEEug/STTFqQYEaoHVCpiuK5HZXgZfTbkCLJ5qfEV3fNh
	 bUTJSB7aR+Fy2YMDeie/yZCneE9Gk6J/hL5V+uFD1ZYo6tqAUeGWJ27s1GagrF5mos
	 O3my0UFj1KIs6XMqtZuWn/7xJ62smBV+irS+k6vpIyvZnNRVwJoRktblyf2miHG8Wa
	 mDJNitkNFQmLw==
Date: Sat, 21 Nov 2026 22:16:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sasha Levin <sashal@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	kernel test robot <lkp@intel.com>, Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: Hide QCOM_SCM instead of depending
 on ARCH_QCOM
Message-ID: <20261122051636.GA2630332@ax162>
References: <20260913173049.1168963-1-sashal@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913173049.1168963-1-sashal@kernel.org>

Hi Sasha and qcom folks,

On Sun, Sep 13, 2026 at 01:30:49PM -0400, Sasha Levin wrote:
> imx_v6_v7_defconfig fails to link:
> 
>   arm-linux-gnueabihf-ld: drivers/firmware/qcom/qcom_scm.o: in function
>   `qcom_scm_pas_init_image':
>   qcom_scm.c:(.text+0xecc): undefined reference to `qcom_tzmem_alloc'
>   qcom_scm.c:(.text+0x2b0): undefined reference to `qcom_tzmem_free'
>   qcom_scm.c:(.text+0x1514): undefined reference to `qcom_tzmem_to_phys'
> 
> QCOM_SCM gained a "depends on ARCH_QCOM || COMPILE_TEST", but it is
> selected from 20 places in the tree and several of those are reachable
> without ARCH_QCOM. DRM_MSM is one of them, via SOC_IMX5, which is how
> imx_v6_v7_defconfig ends up here:
> 
>   WARNING: unmet direct dependencies detected for QCOM_SCM
>     Depends on [n]: ARCH_QCOM [=n] || COMPILE_TEST [=n]
>     Selected by [y]:
>     - DRM_MSM [=y] && ... && (ARCH_QCOM [=n] || SOC_IMX5 [=y] ||
>       COMPILE_TEST [=n]) && ...
> 
> kconfig still honours the select and sets QCOM_SCM=y, but it does not
> propagate the selects of a symbol whose own dependencies are unmet, so
> QCOM_TZMEM is left unset, qcom_tzmem.c is not built, and the
> unconditional qcom_tzmem_*() calls in qcom_scm.c and qcom_scm-smc.c
> have nothing to bind to.
> 
> The point of the dependency was only to stop asking the user about
> Qualcomm firmware interfaces when configuring a non-Qualcomm kernel.
> Express that as a prompt condition, which is what the same commit
> already did for QCOM_PAS: the symbol stays invisible, but it no longer
> carries a dependency that silently drops its selects.
> 
> Found by KernelCI builds of the linus-next tree.
> 
> Fixes: 8fecd3194de3 ("firmware: QCOM interfaces should depend on ARCH_QCOM")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609120634.g0HMAp3g-lkp@intel.com/
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/firmware/qcom/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> index 691db0ded8e8c..b50e1309ced5f 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -26,8 +26,7 @@ config QCOM_PAS_TEE
>  	  by the firmware TEE implementation as the backend.
>  
>  config QCOM_SCM
> -	tristate "Qualcomm PAS SCM interface driver"
> -	depends on ARCH_QCOM || COMPILE_TEST
> +	tristate "Qualcomm PAS SCM interface driver" if ARCH_QCOM || COMPILE_TEST
>  	select QCOM_PAS
>  	select QCOM_TZMEM
>  	default y if ARCH_QCOM

This now allows

  # CONFIG_ARCH_QCOM is not set
  CONFIG_QCOM_SCM=m
  CONFIG_QCOM_TZMEM=m
  # CONFIG_QCOM_TZMEM_MODE_GENERIC is not set
  CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y

which breaks the build (or install if depmod is postponed until then)
for me. I ran into this slimming down platform support from my aarch64
Fedora kernel, as I don't have any Qualcomm platforms.

  $ cat allno.config
  CONFIG_ATH12K=m
  CONFIG_ATH12K_AHB=y
  CONFIG_CFG80211=m
  CONFIG_MAC80211=m
  CONFIG_MODULES=y
  CONFIG_NET=y
  CONFIG_NETDEVICES=y
  CONFIG_PCI=y
  CONFIG_QCOM_TZMEM_MODE_GENERIC=n
  CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
  CONFIG_REMOTEPROC=y
  CONFIG_WLAN=y
  CONFIG_WLAN_VENDOR_ATH=y

  $ make -skj"$(nproc)" \
         ARCH=arm64 \
         CROSS_COMPILE=aarch64-linux-gnu- \
         KCONFIG_ALLCONFIG=1 \
         INSTALL_MOD_PATH=$PWD/rootfs \
         clean allnoconfig all modules_install
  depmod: ERROR: Cycle detected: qcom_scm -> qcom_tzmem -> qcom_scm
  depmod: ERROR: Found 2 modules in dependency cycles!

One way around this is turning CONFIG_QCOM_SCM into a bool but that
would end up building more code into the kernel image that may or may
not run. The proper solution is probably doing what Geert suggested and
only selecting these symbols with ARCH_QCOM but I did not explore this.

-- 
Cheers,
Nathan
