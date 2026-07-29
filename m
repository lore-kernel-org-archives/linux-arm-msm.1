Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815DD125A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 00:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283759; cv=none; b=IjXDZAve0V09AfpOGhXm7xAQkFRGZx6B0rsWhjiaOgUG55MInYM2Dxg9YZEeqA0ohpjrJwN/SOfvTnc3iB4SvtJSzp4Y4SjqVUyEbFoZT6St17OzYUNLvI6KXiXpuMQ67DDlemk8hUDt3evIkGrNy6VKPUkaY1EgWF0yyDzfLVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283759; c=relaxed/simple;
	bh=BEjFDduASlObm5y3hWPdBHeCpPiuG//XcoSPSTNcZy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OU58+1APxylG5/QGEO8ZfYHOD5er6iI/z4Ixjjc0MDaYaskLoS0YScgcaf3UjOWQ4+M1zsqx+WH6B8okoZQRiWEdGWV4Y0PZLBtt1yZ36dtabJBLr8VpvE+MYm/tdvlaeheQH0lL2u9ZnUvD5q9eOsmlpxeoNJmR5kH63YMJSsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=aOADID9T; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="aOADID9T"
Message-ID: <ddaf5e13-07a1-4bf8-83d5-05f9d1b9b8c5@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1785283741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Keg61Crc0/4tKadRwxfd7VPGdss9RDyj1OOvz1NsF4k=;
	b=aOADID9T8D0QjY4R9QF/XHEO2O5RDzP0k8PmbzZ5o+cJemAmCTE0Aa5LxJ8waBHCkjwIrw
	vA5NzVhWpPD7C4cqODn4LWtpaSYUKlH9+Cw0+O8heuYxVLDWACQBgn9GXp0YSNSkN7FMi6
	OrJreOHo8SvYZQUJ79nkqMombGlwqirkQpXccFDNnMc15Q6vdxtApYXSdI32j/og0waF1D
	8UmzNvTk9w9PboXG0QCoL/4I0iNqybplqA/fYOO5T0KXZ6aY6NZnbcv5YExZj/BkPf+Di5
	O/nfgmDaRtth81HSwKjcciFyL5UmDl4NKwoQDqKj++395AgzVhhmIKoyfijV1g==
Date: Tue, 28 Jul 2026 21:08:53 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: use a freezable workqueue
To: Daniel J Blueman <daniel@quora.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20260728012549.14502-1-daniel@quora.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260728012549.14502-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 7/27/26 10:25 PM, Daniel J Blueman wrote:
> On suspend wake, the DisplayPort altmode setup often executes
> before devices have compeleted resuming; this triggers a legitimate
> warning:
>    i2c i2c-2: Transfer while suspended
>    WARNING: drivers/i2c/i2c-core.h:57 at __i2c_transfer+0xc0/0x9a8
>    Workqueue: events pmic_glink_altmode_worker
>    Call trace:
>     __i2c_transfer
>     i2c_transfer
>     regmap_i2c_read
>     ...
>     ps883x_sw_set
>     typec_switch_set
>     pmic_glink_altmode_worker
>
> The setup doesn't succeed, leaving the DP-alt monitor non-working.
>
> Fix this by queuing the work on the freezable workqueue instead,
> deferring the setup until devices have resumed.
>
> Observed and validated on a Lenovo Yoga Slim 7x X1E80100 when waking
> from suspend with a USB-C DisplayPort monitor.
>
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
>   drivers/soc/qcom/pmic_glink_altmode.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 619bad2c27ee..939a444ebe6e 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -450,7 +450,7 @@ static void pmic_glink_altmode_sc8180xp_notify(struct pmic_glink_altmode *altmod
>   	alt_port->mode = mode;
>   	alt_port->hpd_state = hpd_state;
>   	alt_port->hpd_irq = hpd_irq;
> -	schedule_work(&alt_port->work);
> +	queue_work(system_freezable_wq, &alt_port->work);
>   }
>   
>   #define SC8280XP_DPAM_MASK	0x3f
> @@ -501,7 +501,7 @@ static void pmic_glink_altmode_sc8280xp_notify(struct pmic_glink_altmode *altmod
>   		alt_port->tbt_data = *tbt;
>   	}
>   
> -	schedule_work(&alt_port->work);
> +	queue_work(system_freezable_wq, &alt_port->work);
>   }
>   
>   static void pmic_glink_altmode_callback(const void *data, size_t len, void *priv)


BTW exactly this has been proposed previously:

https://lore.kernel.org/all/20250110-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v1-1-e32fd6bf322e@linaro.org/

It was concluded that this is a stop-gap solution until the 
notifications are fixed to not be sent at all while suspended… and of 
course neither the "real fix" nor this has landed :(

~val

