Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531342;
	b=njWWiMOq2ecyQhY4GESPoViefyGc3oro2gkGpdeZwq2QE3AaFXTNPu9hXa28CNZe6cdD
	 ZMGllb/RsZgrgqZV+El4pxuYuufwaqP3SI9lF8A9/V7gqdhHUFt7kts2Bailk0SNt8OVK
	 DBU7h07mHzynGjUiRQ9S7Ip0sARaogRR6WRf40g9PGp1/SkW2YdmTvNsEOhco1UPsu/93
	 6TSL3zNd6B3JRfg+sTp+o1zepNsz0OvQxndoix5l5vHYs5K2HKTT5x9TwhU9VtrozTaql
	 rsr8IW5a1vqYVB8let0IWXLiEkciswuzFl7C+T8iQeLtdmXN2ut5Viz+wF65PNPTuQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jcVy99/4546IpPlUV+chsxZxg6fKFHtjcBIv8IBgnDA=;
	b=Z0zuxcM5qMgI3hV0lkt7xX9AQYcdG6iV3YaBwEkKHb5NFsAeXB1BKFYj8cI+RDSe3XTr
	 rzoUxAoKytcf+2pPTJA/fwcoFDBtif475FLZtmpZOrCO/nw/IMEFI7j6V1olB7edBcdla
	 isXMAMPPetgmkUCXHHty5GxUVKlTE8pE/sfptOfK6VP/3fciovpPVKOZGlIuAJgld/r5C
	 VFRjnF/TU8/Q3WA+eN3b8iFkLDUU/ceGiHoj7IdNAH0eCoxgf/aGzdjkw0CyEZJDP/a4Y
	 FxUdVK0xULpJ6D/7pimbHYh50mY5Dtb/GVurexSmDP/LE3e/VyUnRr17kCOdZNb6W9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lbX7Xkre;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F70606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F70606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lbX7Xkre
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48fd2e38825so224583f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794531340; x=1795136140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcVy99/4546IpPlUV+chsxZxg6fKFHtjcBIv8IBgnDA=;
        b=lbX7XkreAKRNKOu5bAAr78H5T54rlJTQ+uR1EUX5bsk5/uqD3MSuwb5tv4C5IgnNeB
         /xFLviFjffv29Y4A6i4p9ESY3p//U32kUVrP6/heuTyMixYJ+MTCgu7Xc+gRySu5Iity
         +vYENv1ugwa8Map53en9lcSuS7np9EDqY4nA3rVGk4qxz5H/P5miXu22NmtXXHrLoqm+
         fWQwyl9ni4L6I8m1pxTTqBFC3p2JqByRwHUEIFNy8KUfRJrD55J/wN7a0ZWJ5SX+HWxA
         AcSij5PmZOQdzDGw/IV4F27lA7imS+nAbkzEIBaCqJRoHgzTGIjPHpUxDWDzNfFNRWxo
         zABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531340; x=1795136140;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcVy99/4546IpPlUV+chsxZxg6fKFHtjcBIv8IBgnDA=;
        b=xa6Gz+d8LQAKtkrVu8vet3ncy4tEWit3cLO/rtM0PtawADbY86LZodXT23Qhj//8Wy
         w0vhg+tu8xr0CyNWp0lD4Mzj8C/2IByPscGpb+9DB1VSg0DTvupQuKWhZ94Xgn+qL92c
         7HVHZPRpCg/bNor/i59P+4pQyI+PizILuJVT0JMuw4H+edvTS9w4XPXGaXrbiBP6P1Ds
         fZzd84BPZR1Qrm4fGCcNecZ7+1Wsr5YEQaDNOanIgjlU47qeO6aCv5T9l2Z1/19hsPi5
         6N4AG1QblxKY5N6TVp3xZVGKEd6aSGKsXdtjH6zj1ivKtapGE2xIRskM4NPN9zBldoY1
         2LVw==
X-Forwarded-Encrypted: i=1; AL+hErHtyFuTE4WuoDWSc1iWmVELgor/lVE9L2FHQ3eCG3pw3hrLGZYVAFsxKgCqMf5+F66QVH0deD+9b/h+awgf@vger.kernel.org
X-Gm-Message-State: APuU4Z/W5VkSe09fHtHDcFbJypCYcu85QF7ESllIvPTe1EfWH6TVPMy1
	1ZDdYD5HoNlhK8oZjsKothh98NaWMi4f3JFvQoBGFQv1rRoQDCzrSQ4XFlvykNuStuQ=
X-Gm-Gg: AYBFou376yBlXkUNAIV1BVAKE9WU0Sw37869/oB/h1oHnHDbUvzYjfwlUfEW1hMEDw4
	YWkntVCrfcaEwWRGn+f86yDgd2MPZWaK7LWBZQ4m97acIJO3/jUFGqXHBoVGyJ1IPkMhM1RLjh6
	AVp6KAf/3H/FfysxdNP/mxp5QyY/Jj57GX/Ip22I9FafHfK0bUwjGcjIxP0eKWwELzm0gpJc6jz
	FGLdWFIvnUsJqNNPhkZOVU8vfd70K141+Yek/4ONgrN18aoOYEDS0vE8kZvwNR75ErPO5Sj9+da
	FQIwAKwyIZSE4imO7J8wxW5iPoGPYbvCBF6+l9gmM550osRrz83IFJPcXEmbntiB6eN1loRIzrt
	M3CTlTjhJBpyUsimDSkh/hfEqz1tApSgnOgPQMXSCj6ap9A5rH4zQfGrOz7NZSwx2JcA13iVv8M
	t0Zb2vZce6kRUL7gI0AYJlmr8WeNlUnkQlWEHtaaWS68hPZBND+lWbLlPk8/9kpcsDaAYsU3V7e
	GrI1SfIC9F74FuM1wPLsYPhg50e+H1BZvVLqLLtOODrf8ofanifiJN9UdiSgRRX9Lf9uimXizRU
	TILDKlV3mYOhpOA5QjBH3r6UqRB5+o+tcEBCZXy2CA==
X-Received: by 2002:a05:6000:29d3:b0:48e:6a23:4a09 with SMTP id ffacd0b85a97d-49c731641bamr1485962f8f.54.1794531340462;
        Thu, 12 Nov 2026 16:55:40 -0800 (PST)
Received: from [192.168.0.167] ([109.78.26.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm2106178f8f.59.2026.11.12.16.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 16:55:39 -0800 (PST)
Message-ID: <c5444a64-ad14-403e-8453-0bb0a16dcfa8@linaro.org>
Date: Fri, 13 Nov 2026 00:55:37 +0000
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
Subject: Re: [PATCH v2 2/3] media: qcom: iris: Wait for threaded IRQ
 completion during power-off
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
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Joonhoe Kim <26rote@gmail.com>, Birk Skyum <birk.skyum@pm.me>
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
 <20261111-fix-disable-irq-safely-v2-2-8e13f68c2ef9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261111-fix-disable-irq-safely-v2-2-8e13f68c2ef9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/11/2026 09:05, Vishnu Reddy wrote:
> +void iris_acquire_core_lock(struct iris_core *core)
> +{
> +	mutex_lock(&core->lock);
> +
> +	while (READ_ONCE(core->irq_disabling)) {
> +		mutex_unlock(&core->lock);
> +		wait_event(core->irq_disable_waitqueue, !READ_ONCE(core->irq_disabling));
> +		mutex_lock(&core->lock);
> +	}
> +}
> +

> +static void iris_vpu_disable_irq(struct iris_core *core)
> +{
> +	WRITE_ONCE(core->irq_disabling, true);
> +	mutex_unlock(&core->lock);
> +	disable_irq(core->irq);
> +	mutex_lock(&core->lock);
> +	WRITE_ONCE(core->irq_disabling, false);
> +	wake_up_all(&core->irq_disable_waitqueue);
> +}
> +

Ouch, this is some mad amount of jumping through hoops.

As General Pierre François Joseph Bosquet said of the Charge of the 
Light Brigade in the Crimean war "C’est magnifique, mais ce n’est pas la 
guerre" - It is magnificent, but it is not war.

Why do we have to hold core->lock over iris_vpu_power_off() at all ?

- What is the data-structure or
- Logical state (the state variable I suspect)
- Or guarantee of atomicity

We are providing holding that lock ?

These are pretty much rhetorical questions - the above locking scheme 
can't be right. It implies we are doing something wrong and not really 
fixing that wrong thing.

Holding the lock across power_off() seems to be that wrong thing.

disable_irq_nosync() seems to be a correct fix - so if our locking is so 
muddled we have to go to the above - there better be a fully reasoned 
and unavoidable reason why.

Perhaps I'm being overly reductive here but - why not "just" refactor 
the code so that the power-off comes after the piece held in the lock ?

i.e. push that into a worker and then do a synchronous wait on the worker ?

The chatbot told me I was wrong about the worker because "it would 
deadlock" and I can't be bothered burning the tokens to tell it "I 
didn't mean hold the lock in the worker"

It did make the point that it thinks the only thing being protected by 
the lock is

intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
...
writel(CLEAR_XTENSA2HOST_INTR, core->reg_base + CPU_CS_A2HSOFTINTCLR);

Which venus does like this:

static irqreturn_t venus_isr(struct venus_core *core)       /* 
hfi_venus.c */
{
	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
	...
	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
	return IRQ_WAKE_THREAD;
}

i.e. power off in the IRQ.

Perhaps even simpler - just do the power-off directly outside of the 
locked section... once the IRQ is quiescent ?

Either way I don't think we have a good reason to hold this lock and can 
certainly find a way not to hold it - assuming the only thing we care 
about is kicking that register - do it in the IRQ why not else do a 
worker with a rendezvous or even more straight forward.

void iris_core_deinit(struct iris_core *core)
{
	bool power_off = false;
	int ret;

	ret = pm_runtime_resume_and_get(core->dev);

	mutex_lock(&core->lock);
	if (core->state != IRIS_CORE_DEINIT) {
		iris_fw_unload(core);
		power_off = !ret;
		iris_hfi_queues_deinit(core);
		core->state = IRIS_CORE_DEINIT;
	}
	mutex_unlock(&core->lock);

	if (power_off)
		iris_vpu_power_off(core); <- this ?

	if (!ret)
		pm_runtime_put_sync(core->dev);
}

---
bod
