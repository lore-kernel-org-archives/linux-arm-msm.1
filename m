Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531345;
	b=3WO8cZUpH410hjHwmBSUDLNtCkYvEWyFFZvkWcgd0KQGHTbSpQHhtU1GahO1bSLU4iel
	 OAtEIZQ3l/57Owh+7HE7qha8bEq/72dCBppPaTNFeh5RQT5QrXJC3riIUt00fGjIjvQHQ
	 Y11aZULGn0YTJPWlhgrUni5SR6/0SBwHbcgDGEjfofNfOK6YmCXGY+zH8+XfzG6/Oh2zn
	 JB3CFMUbTYm4vznhc5KijYLqATYtJOhJPRUErvaQvsYKRefzz+7ej5wXkiArqHDcWD8iM
	 354LgvPpBsy+F9mTgyw9mxcJaCAyc6o/gXbZTzEeUzOOp+zYCLgYFaFawXS/yGvlbIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0tUZ/r90AwSeslzGso6dCb5vC4FbswESQba0fvf+Foo=;
	b=d3ehjlyShvx6GIw6d7VNwyd/dntLvubuuGeP+PIE0Ulp7mT0zXRKh+E4c0UQ7MHOrqJp
	 XcZBA6UmsSB5DQ/aaxqxHDJCMJCYdVCBhcmIOJbgdy9rOkDEkO/oq7FGuYJqZcfh/jpks
	 ni67u3uhFZqoTbUsGjEgP2yeXXcgypGXuX+BXM+Z7tWsNYVrwKsmgHElhohjx6Qbg98Wb
	 9lCwHTZIkNpUkc/T0HtmrVxMN72BqiVWiwiulrFm9mSqJ+arhMOEW5HfyTqBnCVVnB9cd
	 wtvrFee6ns5zgeaxYw0jX0LJUs6chl2zwPEFwZGylb44QBLJx4sj4K7LZkh7eTAVgcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lPKSbQ+v;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D597606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D597606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lPKSbQ+v
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490f38e9688so258044f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794531344; x=1795136144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tUZ/r90AwSeslzGso6dCb5vC4FbswESQba0fvf+Foo=;
        b=lPKSbQ+v6cn0qckNZ2HObZqsWk1yflt0gbSiGlrodWsODQWWsX8iNNAe/NiVO7iZ7K
         pxsKAgVOAe01/xg1mq2bEoXzeKmqT3eiHSQW0hUIspOlUMg5aOoNqKoBSQopIKlrxgA4
         5upzWRZcqdU74/2IGFFH+DYcZ7RXy45EEvY/nIwEVwWM8pzaNyptVAlRvgc0xagJ5uTS
         KB3XF3mEz8jm04ufGZclHmxIaSvhwbmRdNlox3Hi3gZ9m/lwj+w5XtEyuEsjsZkMuPTd
         ByppVfwoDb5r6hyYUseRFotpWidghcACbYAHKRmQ0y6P252Rn4VeYz6tjgxivGAZq9Fy
         npbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531344; x=1795136144;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tUZ/r90AwSeslzGso6dCb5vC4FbswESQba0fvf+Foo=;
        b=vLyqdYvKBhmJL2rlbM4IAa7FLUEnPaPWvFbzY5GDdtMN38Rzzl84MB7WfY9MFhZxE/
         s8Gap8MQQeojDWf2he9+thrvO4dIcZZP6qiwb5YWAw97PKID1GCLvyD0WGCh96qVPkyh
         KhcY645CaWLtb1PhqvTGXsyqvMQWHGlppRPofE7op4mkvyB/LJc0M80u8lBIOJQFNJ2k
         +FTIQDHr2SsZmooFdNWWaHlFsnu7dW+sGuGT95nuEvXxFcrXQyHBbFKDzDLrtL9zIJHO
         xGRyuGechJPU0MnSzVhfciYDrRrBPKYW/F8qHdFfcUWU0tqqgl7k3te9N9/PJ8p0qXcD
         rJhw==
X-Forwarded-Encrypted: i=1; AL+hErE/QmFfVlQ3Ug9zfWdcMfrO4cdVbg2uwQWW6wm8AT6ES7TaTUymxDub3Ze57eHeXePnRUqSQcVjqmfaQyVX@vger.kernel.org
X-Gm-Message-State: APuU4Z+6Ydjs4HRy3JBGVnovdcPtliAAndiCyiOWWUG15095QkLNhKsP
	QPRSj9vPC58YT6EOLpX2Jfid40VTkwP519x0qtTsYuaCKD0HSJTc8OLhU1RNBp6n9Q6OX5HttR6
	figk8
X-Gm-Gg: AYBFou3IQWYI0q92Xd0Rau/jLSGKezCpsk0ZB0fqOJ56kN8y4TpBINvdOBrW3vhNwTa
	cDC47aV1aRdh9X+/Rr8c7j91hPr341NJFZTIvVEqqB8S+gGcLbmVA8ToRlzLpv8/L9pHjq/qDqS
	YQKrCO0CONSnOg+jOo7kH1qZ1ZD0sI1fu35VlSFnBNVrs2bCjJPYtcXCgPLdn5nYD+M5dKLii8A
	K6axtjkpgkzPqwGo5L9Pa22CxJgDgO/ewJriBo2cw43bzoNymEmA05+Q1dWYmayxyqSXGpKYHIh
	M8Ivmy2aGa9WiWJvPk7Gd/9wdZq7wzKpA48QsjiIpQ4CFvplidIZuuThLPjn13T8m/HZ2CEaNxU
	yvEjqawYazyqfwhyMVNHMNZg/jOcdR7yslkLe5UfbOQM8YfgHTCyH5gt93XDiIDvhx7LrZXoj9C
	hP3aq0Qo+QpklHuR7QpwYbHqwJvS0CdNy1I5mHNbH/fTIRo02Rf1j4xdBR7u5st5VUEIP+VhR+H
	UjxOi+Bu8caFPOEx1pVzr4NvsgpNHUzt/6T2lVxY2f5WCQ3ScDCu3IXgOqhVite7QWdb0wgvGDA
	8eOD1fVRRd9R1RkXgmFuHxyNJkLBw8qK7YbaXXSAFHQ=
X-Received: by 2002:a05:6000:47ca:b0:488:8347:a110 with SMTP id ffacd0b85a97d-49c6f5e9818mr1560854f8f.7.1794531343598;
        Thu, 12 Nov 2026 16:55:43 -0800 (PST)
Received: from [192.168.0.167] ([109.78.26.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm2106178f8f.59.2026.11.12.16.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 16:55:42 -0800 (PST)
Message-ID: <39881cfa-6f44-41fb-aade-041d9cdf2f9e@linaro.org>
Date: Fri, 13 Nov 2026 00:55:39 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Revert "media: qcom: iris: use disable_irq()
 during power-off"
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hungyu Lin <dennylin0707@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
 <20261111-fix-disable-irq-safely-v2-1-8e13f68c2ef9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261111-fix-disable-irq-safely-v2-1-8e13f68c2ef9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2026 09:05, Vishnu Reddy wrote:
> iris_vpu_power_off() is always called with core->lock held.

This statement is not true : int iris_hfi_pm_suspend(struct iris_core *core)

And TBH as I look at the code I wonder if it should have a lockdep 
assert if that lock is a requirement...

  The threaded
> IRQ handler also requires core->lock to proceed. If the handler is woken
> and queued around the same time power-off is entered, it cannot acquire
> core->lock because it is held by the power-off caller. disable_irq() waits
> for the handler to complete, resulting in a deadlock.
> 
> Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 243bd845349f..1e183fc4e58c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
>   	iris_unset_icc_bw(core);
>   
>   	if (!iris_vpu_watchdog(core, core->intr_status))
> -		disable_irq(core->irq);
> +		disable_irq_nosync(core->irq);
>   }
>   
>   int iris_vpu_power_on_controller(struct iris_core *core)
> 

Looking at the next patch I'm fully recoiling.
