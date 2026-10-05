Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E4037F334
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187408; cv=none; b=SSHkpxgJHZUfTue+eoh/Kwt3c1uETZ486pXg5XmYTPeVjG+wwWPeplDMIcAYcGt5VcarGGTYIny0p7mlYbeHhaiqQwK4aW+xXv0orsQWT7ib+zFe2exXGMyAr8D/j5Zo29bcUetwvXyVPjgEAAJeF3XMUBvrN/ScRQBAcTC3L3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187408; c=relaxed/simple;
	bh=cDK7eaO9TIqc7eENuFf4Hja36hKlXoeZzxw2D5zgDH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4+dOtTV+tPc13gsr95JuLQRltEvJ6wrN6r2PVKxC3kQT8JjWkAE3ENHYTC7rjp3cELaYg1xC2pZTKDoWviYOhSYL3+YUj4gWHl5+rS6m0eYPGtZYBVJ48GCcaVgFh070+NAtGV3ZVfAu9pnYJRGTwbFTRUU6ejyEHB1auu2S1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QcNUl4KX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QcNUl4KX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b06bb6e40so1060677f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 01:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791187404; x=1791792204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zf8a4U/eZRmPAL9EPlXZ+IeLso4MWrV1ScfZ6D1RB+E=;
        b=QcNUl4KXWUMWOPlX2JdPbW7vrjg8HEt6moTmN+Abn/lb28UhxO7wWMx4vSPCSmLuYz
         MflAQCZ/LM8U/92fL/eUqfMMH5+riskkvsbWrXXupvUTiQ+UrCf51jHLZIaxDmCeku6Y
         /mFT0GC7CakRRASWuEtYe+PcYE2w/rnECInNg/QajKVWyjKsPVCw2JzeyjztyzDGhdhH
         tGeXeSWoOkVw/P6gVeqym6g2brjQsGOp7xc/hw+jdPogwzw++VQcNreNPxVrZalEHtSC
         MBKQNOf/b0AEEjVvDFdkDRktXkyCMG/dzCgHs9SNFOOfWJTa1akQdjG/Id5wgJn8eS3B
         ZMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791187404; x=1791792204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zf8a4U/eZRmPAL9EPlXZ+IeLso4MWrV1ScfZ6D1RB+E=;
        b=OlVb/Y0jeQIwQfc7j3Qsfob9ePJxwZ4SaSboVGd6n8hiUDbCIYEnDPWOJamDmk8P0F
         bFzIEaGOg6Ipn55IcpacLWhq2JuQBjFR9/wVgd1sVrFMxHwEgCf5+1HKVaOxmBpdAl63
         PjNu4UdofUEp+LqMkE3Tki8yzmbyOVi8/V/s1RXPmcXAFAcjEVvyGjDV/IK9MsJP/n2T
         dxRva7naYh9d60xkDLGg1trOdVVojqhjIC1xr0Eqqg3RjVJKf3E2KoD147+FjWwEk9Hk
         XvY5ZACYa3lX/Y9NpvF3WujCkZIQYU6uZQh6q/jfKNVJXeP956hXicS5xPO/ONgyhdlA
         Qozg==
X-Forwarded-Encrypted: i=1; AKwUvBzPTXrs73TlveDMO3vpbOp1JHWcg072j9bXGsbJdVsV/cpxYqPNEAEACgC3GuZipIha/pmoWJYGApSCnksH@vger.kernel.org
X-Gm-Message-State: AFq9FYK14zFRIPkBX2qpXltr9NF5Gb5wTV5O9pP/kA/5o54LQKwlUVS7
	z1GAZrHQD5nfFqpzmgwpv85Vr0hHHmd+imIIrIxb6h2JP3YT8xaEHSJ/ipncafCrV04ysqa1SQE
	O357U/94=
X-Gm-Gg: AYBFou1qC4U/U4HCr97wV0KVgwxJzEmHkEp+PShDwzaJ3gIMwerGC1r8G1k9m+Q2tMQ
	LvKx7yev00B9d7eAsxXxXe4imjV7RSuMQ7ANBxcMTI2gJpVamor2GZRrtbo1/f0szH7+GB+vlAU
	pGTkddV+ZlrjxD6iUVuGRASfB8uSqsY2hYoJd/2Ybm8RJ+w90w8TR4W9b2Xt0TPFyIzyWBsrB2o
	nRtJqpLY99bkZUjmcfMRS9KgYig/RStbnKrPEqg2I9CkxhPj6drVTw1h8r1ESo8//eEZQTVaPqm
	JSrIoyDNWxlbtotOcwVlSf1X+iGvKjoR+bX71T1aqXQxUSv8blj3rayklq/xsMnzGJGvIBDRXne
	4+xPmbLi5b2JFfzFA6QYug22b+jWVcmAdcb5IcO506mm4QseSYm97l3RFsV+ttbg5N/uvVOqWbM
	emBP/vHwXm2B4wllcUc+LO8CDwkFkm5tRB6C/AQE5MPzGSfJkGq0zfEcLTw/bg8487ftGS71bVa
	svhRp+NXQc=
X-Received: by 2002:a5d:5f51:0:b0:48b:f92:1f67 with SMTP id ffacd0b85a97d-48c47fd0cf8mr11000087f8f.21.1791187402499;
        Mon, 05 Oct 2026 01:03:22 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:ec49:36a8:7075:6d05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622ab326sm1821127f8f.35.2026.10.05.01.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:03:22 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:03:15 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Alex Robinson <alex@ironrobin.net>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Steev Klimaszewski <threeway@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] platform: arm64: Add Lenovo ThinkPad X13s EC
 driver
Message-ID: <asNZw4mFy_xOmCVD@linaro.org>
References: <20261002154231.31376-1-alex@ironrobin.net>
 <20261002154231.31376-3-alex@ironrobin.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002154231.31376-3-alex@ironrobin.net>

On Fri, Oct 02, 2026 at 03:43:07PM +0000, Alex Robinson wrote:
> Add support for the ThinkPad X13s embedded controller to expose keyboard
> backlight control and firmware-driven brightness changes when booting
> with Device Tree. Its backlight, event and power-management interfaces
> differ from the T14s EC and require separate handling.
> 
> Preserve brightness across lid and system-sleep transitions using the
> sequences described by the X13s ACPI firmware. Keep temporary suspend
> blanking from overwriting the EC's saved lid-restore brightness.
> 
> Report firmware-driven brightness changes such as Fn+Space, but do not
> report lid-open restoration as a new brightness change, avoiding a
> spurious keyboard-backlight on-screen display.
> 
> Leave EC wakeup disabled by default because the shared interrupt can
> wake the system on lid closure and no selective event mask is known.
> 
> This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.
> 
> Assisted-by: LLM
> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> 

I'm mostly just curious, is the input/hotkey functionality in the T14s
EC driver not relevant for the X13s or did you omit it because you don't
need it and/or to keep the initial driver more simple? It seems to be
present in the X13s ACPI similar to the T14s.

> [...]
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-x13s.c b/drivers/platform/arm64/lenovo-thinkpad-x13s.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f1ae4c8e67159ebe04ec7aa6521b0ac9ad07a97c
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-thinkpad-x13s.c
> @@ -0,0 +1,408 @@
> [...]
> +static int x13s_power_gpio(struct x13s_ec *ec, int value)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	ret = gpiod_set_value_cansleep(ec->power_state, value);
> +	if (ret) {
> +		dev_err(&ec->client->dev, "Failed to set power-state GPIO to %d: %d\n",
> +			value, ret);
> +	}
> +	return ret;
> +}
> +
> +static void x13s_exit_low_power(struct x13s_ec *ec)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&ec->lock);
> +	x13s_power_gpio(ec, 1);
> +	/* DSDT: GPIO176 high, Sleep(10), then register 0x80 <- 0xaa. */
> +	fsleep(10000);
> +	ret = x13s_write(ec, X13S_EC_REG_POWER_STATE, X13S_EC_POWER_STATE_EXIT);
> +	if (ret)
> +		dev_err(&ec->client->dev, "Failed to exit low power: %d\n", ret);

AFAICT the ACPI implementation has a retry loop here with 3 retries,
similar to t14s_ec_write_sequence() in the T14s EC driver
(\_SB.I2C9.ECWS). Did you omit that on purpose?

> +}
> +
> +static int x13s_suspend(struct device *dev)
> +{
> +	struct x13s_ec *ec = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* The IRQ handler takes lock, so disable it before taking the mutex. */
> +	disable_irq(ec->client->irq);
> +
> +	/* Capture hardware brightness after completing queued LED updates. */
> +	flush_work(&ec->led.set_brightness_work);
> +	ret = led_update_brightness(&ec->led);
> +	if (ret)
> +		dev_err(dev, "Failed to save backlight brightness: %d\n", ret);
> +
> +	mutex_lock(&ec->lock);
> +	ec->preserve_saved_brightness = true;
> +	mutex_unlock(&ec->lock);
> +
> +	/* This flushes brightness work, which also takes lock. */
> +	led_classdev_suspend(&ec->led);
> +
> +	guard(mutex)(&ec->lock);
> +	/* DSDT: register 0x80 <- 0x55, then GPIO176 low. */
> +	ret = x13s_write(ec, X13S_EC_REG_POWER_STATE, X13S_EC_POWER_STATE_ENTER);

Same here.

Thanks,
Stephan
