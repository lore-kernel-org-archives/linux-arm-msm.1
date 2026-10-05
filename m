Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444482E5429
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 04:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791173285; cv=none; b=D4WPwLf0EcYyQ6npo05jEPQKeiyMxq12lkEmLkfjL0puNB3UQ6M/wJ2/BfjTS4f/oF6Q9XMxWHIA3rlTbsYpDxAmvwLF0CqDTQQOjMEYvzJbH2q2HmSy024RuFJVkCbQzql4Q+CJRummvQWSY+volVOG7Ig1qvP3vYgTiuZxaAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791173285; c=relaxed/simple;
	bh=LMDE8Z0gPoVrNprdeBHN/Jw/1zoG7YryqwLWnWMRDUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhQuVqxeZXksH5mM+6fcICo0dzG9VjZk9PKcuTd1KuygR5wEEDIaBds4nHj1zHpqTysdkUWemmDP72C55kt6GZ/2Om4xvTh2tAOHcsLcawlJXOzeGTbEh/0ema48PQlaHUx7yD3TKVyWxreZ6+Me9/xtNVNrp4K65lNNLAVvTEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FZCLOl72; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FZCLOl72"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b48100af4so1461996eec.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 21:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791173281; x=1791778081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoOBU3dKUoijTmAk3p1LupdivqwWNOCTytdFGuDGRd8=;
        b=FZCLOl725yvAXJfQ9eLu9am/rf6zMLVircXZ/8pNIq+jG4ik8ukMAi41yWoO2vtoDN
         Rhrnb6pt3+RhBcUkGKdk7pYhXvZRWrp4/wovL+wrbwzWmW7LEYLr9vulpPE+sAwH4woP
         4NW2BxGeyXZuhhB1tQUJS8y8EeCtpox86/GQvTA74MDuZLWm6X/brdF0kff7PvNNSaok
         ME5mU3LOqPfd8dAJY7lr1umCNgel727B4sTzxDmIa2M+MuoQRnSznCrUpYg+2PlV2opo
         fQsen6Pp+xkA/qPhMqjMO6/QCar9Gops9KQcglpmRC7ZG1fsrlfNYk5iuzF/pdmVH0nD
         jzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791173281; x=1791778081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoOBU3dKUoijTmAk3p1LupdivqwWNOCTytdFGuDGRd8=;
        b=zcnmtrwFM9GnymOyFzbrA4NpMndEvhhZh2x4wRpgJkquiAdf5/AZkYWIa+LcQ5EUGH
         Ui2ceuR0Kize5J3FoWsTPAIJaCYGb2VvZfIaz/F5QfM6dLIgaHVjxrUkS9wTFkkiXzNB
         NiPDjFho4wIcSWPm+MCRvHix+e4mkBscfCLqDngwzlgvONp7YspHIPBLUcQ+Lb9O4UVe
         fXtayvQhPWZhhHyOUlVg63jAh69T0JUwVBLXhezlt5t+ElE2f2zaCtSHIkrgPLJ7uY0G
         4gaGOXfDgC3MGSGPMeG09ACb3iEj0uXmJzG5hYhO4XjtKA59SdISgIDQzK0LMeUJSUg7
         BzdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCdiPT4mTdCAnzvp0Q2rXd8iJyahad/dY8oI5yCoIpZkh0OirkB8c9Tr4o+CdlK90pLX4JxGX/70o5PNjd@vger.kernel.org
X-Gm-Message-State: AFuF++mMjCO6K95OdvfHsqeudEBKAzM/y7mLWtTfB8iPy7vXs06JKCTA
	NSJaMxZThXV2h03e7ha/Dd2ZOS/KWhhwELHGoe27mNkBOmr6pNRh6eWb3p4Z523C8qE=
X-Gm-Gg: AYBFou30S9KJzUZWZhhqOGYV2Y4aSJW0N7pBFgjT8/HGTqZFavgV8f1TgRJE7rSDiHX
	Y2O7QnA7Vju9tmhNfD0mIWiMB2hbwkMNWjNUQHvE6etDZoFagFSIWNP3nfCulrBxsiFtKHyPORc
	QLHsE9u+AQdF9KeG7axH46S6RSO0IzZYUNtcCKUG9RBsOPZpKHSxZfD5ouuKZ9YfXtJOlH+xpHe
	VE9gh6R7M9QMDn4/f5FFmw4dQLLTAw/E1IglQEg42Z0MDSYu3lwy+o+qLa6Acgz5cGiQtuoj5t5
	dHHt60ZAMs1X2OxeoeDNbSce3M0eVz5jomc8Bo6NlHHUijCyU1VdHM9jmnufGcu13BpF1sA+zGV
	75hegMNpNeQ9/u8ayTEanD46YcaLVqR2sd3PyRUvaNmGVLqp0IbCmkIcLj52gal2tUQSBMxMjKi
	p12CN9iPc7pECq0H5NI2JnnK0xREInZC3FFEUwrNJ9k6XVyIMxjtStekfF/bfpuEaNT1/8NFbB
X-Received: by 2002:a05:701b:2810:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-14f58de5451mr12982932c88.3.1791173281135;
        Sun, 04 Oct 2026 21:08:01 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm18805270c88.15.2026.10.04.21.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:08:00 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:37:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com,
	talel@amazon.com, hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org, mmayer@broadcom.com, sumitg@nvidia.com,
	peter.griffin@linaro.org, myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sven@kernel.org,
	j@jannau.net, marcan@marcan.st, casey.connolly@linaro.org,
	sre@kernel.org, wens@kernel.org, t.schramm@manjaro.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] cpufreq: Use %pe to print error pointers
 symbolically
Message-ID: <asMinVwyd7gcvRlo@vireshk-B250M-D3H>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
 <20260912191156.185448-4-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912191156.185448-4-sumeet4linux@gmail.com>

On 13-09-26, 00:41, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
> name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
> falls back gracefully and prints the raw integer value. This makes messages
> more readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
>  4 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/cpufreq/bmips-cpufreq.c b/drivers/cpufreq/bmips-cpufreq.c
> index a8e35bc75fb2..389fff5e6f65 100644
> --- a/drivers/cpufreq/bmips-cpufreq.c
> +++ b/drivers/cpufreq/bmips-cpufreq.c
> @@ -132,8 +132,8 @@ static int bmips_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	freq_table = bmips_cpufreq_get_freq_table(policy);
>  	if (IS_ERR(freq_table)) {
> -		pr_err("%s: couldn't determine frequency table (%ld).\n",
> -			BMIPS_CPUFREQ_NAME, PTR_ERR(freq_table));
> +		pr_err("%s: couldn't determine frequency table (%pe).\n",
> +			BMIPS_CPUFREQ_NAME, freq_table);
>  		return PTR_ERR(freq_table);
>  	}
>  
> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> index 80893844353c..f767898ebfb5 100644
> --- a/drivers/cpufreq/cppc_cpufreq.c
> +++ b/drivers/cpufreq/cppc_cpufreq.c
> @@ -230,8 +230,8 @@ static void cppc_fie_kworker_init(void)
>  
>  	kworker_fie = kthread_run_worker(0, "cppc_fie");
>  	if (IS_ERR(kworker_fie)) {
> -		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
> -			PTR_ERR(kworker_fie));
> +		pr_warn("%s: failed to create kworker_fie: %pe\n", __func__,
> +			kworker_fie);
>  		fie_disabled = FIE_DISABLED;
>  		kworker_fie = NULL;
>  		return;
> diff --git a/drivers/cpufreq/qoriq-cpufreq.c b/drivers/cpufreq/qoriq-cpufreq.c
> index 42edb41ad459..0652e5df0278 100644
> --- a/drivers/cpufreq/qoriq-cpufreq.c
> +++ b/drivers/cpufreq/qoriq-cpufreq.c
> @@ -57,8 +57,8 @@ static u32 get_bus_freq(void)
>  	/* get platform freq by its clock name */
>  	pltclk = clk_get(NULL, "cg-pll0-div1");
>  	if (IS_ERR(pltclk)) {
> -		pr_err("%s: can't get bus frequency %ld\n",
> -		       __func__, PTR_ERR(pltclk));
> +		pr_err("%s: can't get bus frequency %pe\n",
> +		       __func__, pltclk);
>  		return PTR_ERR(pltclk);
>  	}
>  
> diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
> index 9cef71528076..9a01592425ee 100644
> --- a/drivers/cpufreq/s3c64xx-cpufreq.c
> +++ b/drivers/cpufreq/s3c64xx-cpufreq.c
> @@ -152,15 +152,14 @@ static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
>  
>  	policy->clk = clk_get(NULL, "armclk");
>  	if (IS_ERR(policy->clk)) {
> -		pr_err("Unable to obtain ARMCLK: %ld\n",
> -		       PTR_ERR(policy->clk));
> +		pr_err("Unable to obtain ARMCLK: %pe\n", policy->clk);
>  		return PTR_ERR(policy->clk);
>  	}
>  
>  #ifdef CONFIG_REGULATOR
>  	vddarm = regulator_get(NULL, "vddarm");
>  	if (IS_ERR(vddarm)) {
> -		pr_err("Failed to obtain VDDARM: %ld\n", PTR_ERR(vddarm));
> +		pr_err("Failed to obtain VDDARM: %pe\n", vddarm);
>  		pr_err("Only frequency scaling available\n");
>  		vddarm = NULL;
>  	} else {

Applied. Thanks.

-- 
viresh
