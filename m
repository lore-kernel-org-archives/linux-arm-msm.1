Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A260243F089
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 19:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364464; cv=none; b=u9SDhTuT6UHjmdjEOoLwZqjvy+0fnt0lL8bpoF3llSKSZzJfTLnazG7QlJ0aqJP9VfdHDT2yprie1t9InfMCxko05zEQBj2GMyQcYzFqjtUBrzgvncWMfMlS9sBtHDF3FHBrwdS6PEJgYbzRN2NZ+OAgHDqBwQjbn5VbqMoZrA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364464; c=relaxed/simple;
	bh=6SU9XvusmasAr35BYeFHgnzOH+gX4OvUuLSAZmMQ2ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVNsSCL6j/VC73Wzt/CwnbfHTtFCGb+ycjLLMyn3RTZYOcmq9OjcHRE8VrTM0HqdFfrZ2QpnZhtOo2uk8H3mHeymHoNcsKHuqFqkfvgcAWOSd5tZvb7tUOZFNEw3BXR3QwZl84oWQlJkOjBa1zaARwW0A6gHsrjxRdTT5CKWrk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xv6dVm3M; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xv6dVm3M"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso1402383eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364462; x=1790969262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWDSKWZuEkPlk2u1p84ALBilVUhoSm1EjrDy3t/LqSE=;
        b=Xv6dVm3M9sree4WnoqgszAszL6cjx9VZVK8h2qE8l4YBo7bfBOi17WM0NCuy9lB+N9
         Ew+rC11bB1Mj8hPezFuX9HLdQt5N7uTCybS7eFTsrJiwdJVvHjsglG9/rO2itkuEaGRv
         in351Yt4wQEb354KFefOAJRlSg7ROYWoD4guWvS4I9lRs8338YxyWLyRkhaJdQcaP5k6
         cusGF1n32FDdSsq168qLJpcp6z89Ka/U5ctkVkaQ0LTUKMyWmBALqmIy6ViXQsE5pWmn
         DypVsistOIlds4DJiiw9wgYGcnMxgBm6IWxNTFOrE0J0MX3HsY2EYJucubpm+WrMIs2t
         Ri3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364462; x=1790969262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWDSKWZuEkPlk2u1p84ALBilVUhoSm1EjrDy3t/LqSE=;
        b=q40JnHbQROJkgNNB9RN0U6PYcBfMNbh2wIRm1kDqlEcqcjHRNju4JrCf9g520mDgCw
         eiiL/VQ5seG09E44SEUI1MAAAxk9e4bHCNYlUjVx4VBRMF6PCnsS1OXEggIKVPU7FY8X
         SeHHS2NeNn5T1FEQ5OqO1g1K1I2NzAsja2WJ3m06Hd/SEKWM+7XiO8+sfWlPtA9peE37
         5BjoYioQkSFS/ES1TNZXBOBRggIGBeEVTtsecm96l07JBHIZj29q8PsAn57fpCAkguLA
         MoAL7C1ljj2klbEuYOrzHOCi7fNX1bwvMOdpWDwCf1Uzcl5TTixQEdI3nLyfTzh1VeNm
         LbhQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/PJngN31sUUB0AcWx381gxYQhUB3rrLmi3HStorByCgxw+M3QNXggrrIiMhNpX3Aws/dp1x6E0yy/gPIZ@vger.kernel.org
X-Gm-Message-State: AFuF++mPdus7CkA+wGS/5Wyvgs61jPF3svj50qUm/9b54LHCGPjyBkfl
	1DMQx+K0VaJ3ulAvxkzfnrbxAeJwbZLEgR/D9YFPlwg0GZMdh9biFcT/
X-Gm-Gg: AYBFou021BK+xm7WKYz7nvAuOccNBSswwGMXr1nvBAqbPbrx0++bHextd7ahHqJF0nS
	PTlD5yKDXT/vRx34z8zh2Okj80py6c/Im6PYoUFVY5dyKhyspL3sYuhtZqhgu9VhBKfdp1Gaj7U
	470MwJJg3SnIrq3wpaWbl0G2Sxb5PwKNXyxPOX0uQfuqtQp3FMqP6dbTD+r7s/BY3Y2SbUP0kEq
	Sq2oHI5f/eHJwHA+SYkk19uaWs5JnneGgWEL0LQPaKA90nZMhRWWtPsDA/MQAB6Fb9vDenEAU5M
	qkgOS8p4Utbg2CstDKjVLiFiTFiVhE6KD+XKMMw2T7NtVc2zsQq7/k7TgnpQf9sfYLMtaTZFHNJ
	iZGcs37L8IwR+1thW+/Ub2tCAfWNFltaj8cEcatFq4czDD/xuCL4IpO00EkPtc5EoHcCacNFPLw
	NSntjMEkWDtrw2g+FDdvAYFGrnjiq7DiVAizan/994hqeLhAwyfNnKzSKGjKsnzFXTC8POTr8Zz
	xiMgVm8Qg1afVYo1eaaxQyIcclcQbXb7koNlmk=
X-Received: by 2002:a05:7300:ae23:b0:342:890a:40a8 with SMTP id 5a478bee46e88-342890a4389mr792661eec.30.1790364461569;
        Fri, 25 Sep 2026 12:27:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341460f5166sm7801383eec.29.2026.09.25.12.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:27:40 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:27:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v7 1/4] Input: stmfts - wait for controller ready after
 reset
Message-ID: <arbJrK9zfoO1dGzy@google.com>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
 <20260907-stmfts5-v7-1-4a53381cd038@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-stmfts5-v7-1-4a53381cd038@ixit.cz>

Hi David,

On Mon, Sep 07, 2026 at 12:50:19PM +0200, David Heidelberg via B4 Relay wrote:
>  
> -static void stmfts_reset(struct stmfts_data *sdata)
> +static int stmfts_reset(struct stmfts_data *sdata)
>  {
>  	gpiod_set_value_cansleep(sdata->reset_gpio, 1);
>  	msleep(20);
>  
> +	reinit_completion(&sdata->cmd_done);
>  	gpiod_set_value_cansleep(sdata->reset_gpio, 0);
> -	msleep(50);
> +	enable_irq(sdata->client->irq);
> +
> +	if (!wait_for_completion_timeout(&sdata->cmd_done,
> +					 msecs_to_jiffies(STMFTS_RESET_TIMEOUT_MS)))
> +		return -ETIMEDOUT;
> +
> +	return 0;
>  }
>  
>  static int stmfts_configure(struct stmfts_data *sdata)
>  {
>  	int err;
>  
>  	err = stmfts_command(sdata, STMFTS_SYSTEM_RESET);
>  	if (err)
> @@ -593,42 +602,47 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  		return err;
>  
>  	/*
>  	 * The datasheet does not specify the power on time, but considering
>  	 * that the reset time is < 10ms, I sleep 20ms to be sure
>  	 */
>  	msleep(20);
>  
> -	if (sdata->reset_gpio)
> -		stmfts_reset(sdata);
> +	if (sdata->reset_gpio) {
> +		err = stmfts_reset(sdata);
> +		if (err) {
> +			dev_err(&sdata->client->dev,
> +				"controller not ready after reset: %d\n", err);
> +			goto err_disable_irq;
> +		}
> +	} else {
> +		enable_irq(sdata->client->irq);
> +		msleep(50);
> +	}
>  
>  	err = stmfts_read_system_info(sdata);
>  	if (err)
> -		goto err_disable_regulators;
> -
> -	enable_irq(sdata->client->irq);
> -
> -	msleep(50);
> +		goto err_disable_irq;


I think the logic is becoming quite convoluted here, and factored out
stmfts_reset() does not help. How about we make it look like this:

static int stmfts_power_on(struct stmfts_data *sdata)
{
	int err;

	if (sdata->reset_gpio) {
		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
		/* a short delay before powering up */
		usleep_range(1000, 1500);
	}

	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
				    sdata->supplies);
	if (err)
		return err;

	if (sdata->reset_gpio) {
		reinit_completion(&sdata->cmd_done);

		/*
		 * The datasheet does not specify the power on time, but
		 * considering that the reset time is < 10ms, sleep for 20ms
		 * to be sure before releasing reset line.
		 */
		msleep(20);
		gpiod_set_value_cansleep(sdata->reset_gpio, 0);

		enable_irq(sdata->client->irq);

		if (!wait_for_completion_timeout(&sdata->cmd_done,
						 msecs_to_jiffies(STMFTS_RESET_TIMEOUT_MS))) {
			dev_err(&sdata->client->dev, "controller not ready after reset");
			err = -ETIMEDOUT;
			goto err_disable_irq;
		}
	} else {
		/*
		 * We do not know the real controller state (was it powered
		 * off or reset). Let's hope that this is enough time to
		 * initialize.
		 */
		msleep(70);

		enable_irq(sdata->client->irq);
	}

	err = sdata->ops->configure(sdata);
	if (err)
		goto err_disable_irq;

	/*
	 * At this point no one is using the touchscreen
	 * and I don't really care about the return value
	 */
	(void)i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);

	return 0;

err_disable_irq:
	disable_irq(sdata->client->irq);

	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies), sdata->supplies);
	return err;
}


Thanks.

-- 
Dmitry
