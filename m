Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72333CE4B2
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 15:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786287955; cv=none; b=TNFEKOC0RzcdIomNbmr54ShcVY+6PF+ZmPVduiIowg0uhXztMPTe+x4bgyYujcaGhqADRxU4DayZfUXXGO3TfE2esn2J4OSRBjlPjpb0zftCtV47o9ghHxIs8Y359O7iBAg9J0VrFb4pUxdrfPvKRWsYwvCZvEOwZIkl43Ims8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786287955; c=relaxed/simple;
	bh=N5EHcxRiFGQHcoZiSsmbsKQuX0XPu4+xUIXYTfGij6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nC1pBVJ2xBoPDIjl/nGmgDUoWegh8FWkhB5M9MxW3UIO5DnFrUp+s+YfI6IK+XjnDBzbwq6/XCOQVY/CmLI/DFtFc4kb3ApPN5nuIHla9km8XvdcycYkR3WeyT/HPwbeT6HPhKngdLU2iCemAG06eThGIOPsmeATwGRi1mdCZ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTZnLmhj; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTZnLmhj"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1020119a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 08:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287951; x=1786892751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0xMkbVk8Vq9ADk/FsQY03JHzIZEPQoL7wUy/e23YhPc=;
        b=ZTZnLmhjHnJC41sh6cCP/VpheJz2FuqcrOUJSeYxmisz6j8YJoiCpxtGheyzHebrTl
         6mpQVPCkpsKTi7nnQQsyIEpxBHefvbmPyPqScwMgWvk14Lu2d/99fGeA1U2kHuokBmk6
         QMA+ogORdNFTNOeq/5901H3/dcn7Q94Td4NLC7TdykALSLeVW+wJkJC/5LsY6vT/dMb9
         uGWh3ouxJzd7EhP692vaOc/3m6AYKr6oJEWuwgWtdUhqE1B6jNLAdPZsqPd9cjctPlrK
         ZJq9nT9k6xUsqaCSTPPAR8qV7ilpluD5Mb/OSDIMS5ZszWyamgwgdrihwVmFUc7zFnpd
         FuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287951; x=1786892751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xMkbVk8Vq9ADk/FsQY03JHzIZEPQoL7wUy/e23YhPc=;
        b=ZIcDf3upwX46y36/xwfeitbnCJa9V7XtBnhOXEoPCLJ+HAulnTMXwUG/pT5wHbc1NM
         aTRS5zVJtbyxNHa6PunwOoFx8GenFYbn0GlRAfqGn/TxV5tmHEUVirrz2o94+PsG2/Ji
         Ah0Ux7bjW7+X+TWWBzvMJj9D6t/EKlZpl+2DcEr5ApqKQBSpSoMe4tW0SiKdrJDjnXez
         4TbfQA01sDP644VVJzVKEGB/dfMkQPMnIWvciKcPRDPPnLR6br5Q1A7p5HoMYIK338pL
         zSwt5LQclpln3fErjJueehlvNau1vSMdoG0yiReKnOMGs7+3HQWkAlqZLZ/8LOOQbb3W
         vTGg==
X-Forwarded-Encrypted: i=1; AHgh+RpTxOC3e0d8YfcLBzQ5sjJRQGYZZOIdsn539kuU4cAkMmfgjHTuDxIpkzYmIB98ejvWLHr8bpq98jYOlxHX@vger.kernel.org
X-Gm-Message-State: AOJu0YyASYj/mCf75eItNSdKm2zJnbxrKWZ0yiGif4AnVrCHR4m5jkkX
	i3gZeJJg9w1FZHEnzO9B0g/HzevUVp/C4/AsjftfWJHprzwB4WwuRoPz
X-Gm-Gg: AR+sD11cJoQooRfVdsA10YazqsOdawqrwjViI7Bazpj/S857BAzQxUxJuSJVQ06Dscs
	RWtT/rhS+xl/8g5qzSTrnfQnBpFZfNTBYKFeqRrGmeZqfqY6kFe7zXIwdB6cSupoTcjD7iV5OY1
	6iSzuBFxQSKCHQxTm59f3cJi+LJL+MzvPQvJcnRkDZnK8sZ1mn4m9CzQEesA/TItBNmVYQ+U7Ly
	SKsR72WgwL5OPgmuD28qtPNn0a0XinjC4ej1udKTTpK2Boj3wbyaTHmyCz57p34wa38aW5cJaH0
	jyCyy6qiWKD+IAe6KXdAhoD7O4e0yJ2XsMALxvJGeP311jG6nAtC8wMFDDffAXC9q+nCzgsdWsx
	BKlUi+jNvDtqjYOjH3SyzIV4DfjYituaD/5TE/M+7txm8d83dUvVeFmyVOIYiCK3G0xJTZlEeK+
	cLda7e8K+rSmDtaEuCDB+ZuE4HMRpmDND1QYx6vgTNrjuHIEiy8cFNmqldykMCPMvpIGQiCPuL+
	w==
X-Received: by 2002:a05:6a20:9f09:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3cbc04eb981mr20974725637.36.1786287951463;
        Sun, 09 Aug 2026 08:05:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm54797483eec.18.2026.08.09.08.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:05:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 9 Aug 2026 08:05:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ
 lookup
Message-ID: <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-4-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807081652.38692-4-phucduc.bui@gmail.com>

On Fri, Aug 07, 2026 at 03:16:52PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
> probe without the IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index c9e79851504c..48454ac86074 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -429,6 +429,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	if (wdt->cfg->irq_mask) {
>  		int irq = platform_get_irq_optional(pdev, 0);
>  
> +		if (irq < 0 && irq != -ENXIO)
> +			return irq;
>  		if (irq > 0) {

This if () is no longer needed.

Thanks,
Guenter

>  			ret = devm_request_irq(dev, irq, aspeed_wdt_irq,
>  					       IRQF_SHARED, dev_name(dev),
