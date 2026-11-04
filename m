Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817895;
	b=RiVAzVmjKao5XtPQdl/0g2Dcn85cmiTGVCVQorQrVg8IuV7jkJ/6oCe36B1KBy6QwcCp
	 66GsGlqrBp8jhHdNkMlrAabAG+6A895voi/xglaPg/3Yh1b8h+RlB5kQlGLnz8jdxKPXj
	 JilYBZG6tzCUYh0zaaxVMZP4n47YEdWKMT+Q01OP1uLj31iTEE7qkCUVXhwLrkqWQ8xjH
	 vDHiybtUbeurHp5nBa2lV5ssIREwn7nKV2SP5c5hhhCBMZgUoT5jlQ7r44eY7fJ/6hpHr
	 TT0fDScX3Qs1LVCaTxqLsN+4JlyUL7fktcQGRYD4OwwfAR+rRIiA0gYIlS7R06mvveA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817895;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=iYiNfVlDefu7QyzgN/zmHCKOcgLtwtgGp2yoyp3offg=;
	b=vHn8hzPnN8BykErndFx/HnQfnFHTOiI0VEPyoNDBEc92FgNrE8j9uAndb5rVgfeReBHY
	 A/bHksn9XeCqQfc/Iq3mvQumZ+od4BZI8XOKku5mSotTcWP6DForo6NFazN0DybP2M2GJ
	 3yZjJJzy9dzEb0hJdJwkx4wlZDO4ykHu28HVQyezlX+BzLYdpCVAs9Z27N2I83Bcu9pHW
	 ublbl70xyhqaWRGfSy4PYMWtVTG2B5T9rl7ETi61TkX3YTZJVgA/7JEjosHYthhtaJQGN
	 sELAd6luOQaLHW3ARO/sF/kQ+mfV4rMSar/9WL5JZr2xnRVkLpfxU5XTuEmxnapexOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cEKYfC+6;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A63606A328
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 18:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A63606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cEKYfC+6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8E8C0C8F474;
	Wed,  4 Nov 2026 18:45:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6833C60770;
	Wed,  4 Nov 2026 18:44:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF69910329205;
	Wed,  4 Nov 2026 19:44:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793817889; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=iYiNfVlDefu7QyzgN/zmHCKOcgLtwtgGp2yoyp3offg=;
	b=cEKYfC+6BMi/JWjyBZkBqZySFl9y1Mi9ihTxUE0AKiqlu7hW0sZp7eo6q0uoF4QUNjcvYN
	ktfWX2aA9MfYmUpuVWOAUrb9VFliA3iJcqGlORdu3CwA4mpMzi6iHDpsAhAiFvwruuB8My
	3TkD1rXvTPWyeUvd2nf90mko5aSt5CQY4ovj6j3Oyth1h0NHRL8ky5jAlKGID6vgPQPGdx
	kJSSXiLu5+81KEFZP8KVigvu1uuE/Km5gjDOD5u9Jvn4STqdaKSYvoa1Lb3CWcJfZc33ap
	jOTuXtmk+ZNNMAV/iGkoNZyQWk3AlHnmnKkRJMy8kvh15oeL0bW+/oygEXJO5w==
Date: Wed, 4 Nov 2026 19:44:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Val Packett <val@packett.cool>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 4/5] rtc: Add basic support for RTC via Surface System
 Aggregator Module
Message-ID: <202611041844436d5e655d@mail.local>
References: <20261104070441.74127-1-val@packett.cool>
 <20261104070441.74127-5-val@packett.cool>
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
In-Reply-To: <20261104070441.74127-5-val@packett.cool>
X-Last-TLS-Session-Version: TLSv1.3

On 04/11/2026 04:04:35-0300, Val Packett wrote:
> +static void surface_rtc_remove(struct ssam_device *sdev)
> +{
> +	/* Device-managed allocations take care of everything... */
> +}
> +

I guess the function can simply be dropped then. Else, this looks good
to me.

> +static const struct ssam_device_id surface_rtc_match[] = {
> +	{ SSAM_SDEV(SAM, SAM, 0x00, 0x00) },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(ssam, surface_rtc_match);
> +
> +static struct ssam_device_driver surface_rtc_driver = {
> +	.probe = surface_rtc_probe,
> +	.remove = surface_rtc_remove,
> +	.match_table = surface_rtc_match,
> +	.driver = {
> +		.name = "surface_rtc",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +};
> +module_ssam_device_driver(surface_rtc_driver);
> +
> +MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
> +MODULE_DESCRIPTION("RTC driver for Surface System Aggregator Module");
> +MODULE_LICENSE("GPL");
> -- 
> 2.56.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
