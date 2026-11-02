Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622169;
	b=xpIzhUo6EJ4cjzxJOUPPVvHQfjxeuL4Hixrq9UpBq64J9F+DI1gPGNle50s2lQhYn3Uh
	 shhh5fY/e6yZB5XfhQvhafti3owUAcmHXP5yY0zt1fJ/YyQQ+ldKgJpYo0zzmJRnC8xbA
	 hN5GhAzF8nPoMPS4mHYNa3CRppMiLfBrMXTq6Utdq3+rvTmqPUKyLl5k4mWFukHFjVAmw
	 FLVlkj5Ta1Wb0FGMxBNjG/sA7r7DVDgomsYaDMe0IaEEyfOXR3STxc2YX3c3bR3hAYMUq
	 Z2rWCH+7l/NC0SNPoBDh9ZPtH+EhJFyVwc4y/TOBN0WMCSECX4m5HXc8wpcGc3w0EJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kmQzGUYJq8GyqElmnF+m9lGa7P1/BodBcOMVYUFmNvw=;
	b=fcGPIqjx9hkiXdDiv3HLFDPaofgu9foPPYj29MRnqWQACVx1Uyn9BUT0nVLewjDo1jSh
	 gdveS7NrOYHEtiabGBmbCy9IdPi4b9/Qv1Msyas1J3im2tumAToNoxX4ws60FGbPr1dwF
	 wI38QCGeMa3wIcsnP1ZTq1bjen6ePwSFaCcRxlBHa5adq4LDz1UQBsJPIWhTl/FaIZ0es
	 jYG/5sPm/MQav8n+w0vPCqHth3SZdjFcmEraVzUscIznwN0tm3ayuyeFpJpfTgjBz6Xlz
	 6yi+GJhnceTCxfGC7CHNUzpwQOZ2PghrG8aCc9a8G1RNfnAiEYidbw0yE+EWRplTCFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="hD/qB7WJ";
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C1F606A337
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C1F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hD/qB7WJ
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so469407666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793622167; x=1794226967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmQzGUYJq8GyqElmnF+m9lGa7P1/BodBcOMVYUFmNvw=;
        b=hD/qB7WJtkPSzakBjBrg0ErLrQbefMeN50hPSmPc4DKcYcJYvddKvLdIEpAyKkA6zU
         ZnSw79AKQKyL9hZ26uuMsJRLlRUYP7+uoRG6f0DtD/D94HWijt4yN1hxkR29rhYaG0E9
         3HNwIij6hjEnZ6teA6Nyc+Ng1oQ0MwGwFAK2RlXjGxEJdXZeM0ubnC9b4rAlBiwTVyDh
         ZkocKd/uKbHmcQZnb/aB19Sd3MdfyQFLktM7R1jfsRUXyq0LLPa0d1IeM20C7BJEZMA8
         bpTRQMW9dtw9SkvGNyVFd9h2FA+D3h81o2LVSoNbGQd5pxzHE28FYlBPal1IIrFs8h0L
         IjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622167; x=1794226967;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmQzGUYJq8GyqElmnF+m9lGa7P1/BodBcOMVYUFmNvw=;
        b=QTIqEoZTxc+8/U3m5NZQXD+fMykUwWrr02oMQc2aj+5wtHDyV98sx2oz8syrWFsyTH
         W/OF0w4xS1HjDgXPkJeKnniWGlwQMjGh8gU9x5XfX10NjLTVk8k/NG9iBXwBHQLEGZGN
         4CbaK/OmmdJJ7FtPTuSlFx607hCBI2k2Cwk1u18ZQ1dxdxtREqNDS+Z6KiHazTahyQnh
         RVR1NGLUV14VOC4mGEjO/YteRxYWheGgMqn/VnbRaySkGaE5oH2NKoHKFqGAStpC4bbM
         tBmhTQk6npfab4IeG943VE5cCiY12L6jY9LJtHd23xPOyvR8EDYlyNiA2vdABFwW2cqp
         FMdw==
X-Forwarded-Encrypted: i=1; AKwUvBxV0G2yW/OFEJ+yL2cMU76/a7uRVCH81RF4549IhluWtiM56JdyGMbH9l+4a5rmYmWq/iZFa5MNVNHLsEGJ@vger.kernel.org
X-Gm-Message-State: AFq9FYIP4aZqNsCWlySSmtl8Ql65HorLAkYbnxvQpNGdMFX94avS4tws
	24z7KtTv0rJ5pBY2Dga/GKmQSpXGMq9FwNaCiBktN4pkVX7gvBXEVuZi/ShIRqrwhQqmeUx9MH0
	Hl8sQ
X-Gm-Gg: AYBFou00dXkhE/5LW+0eLyYilB70Q1cWKZ9zLi+3u3JvVjvoNm4EOOzNZpWsALRHnFw
	JyPT+JxVYIgZVtWoJ2fC3AOM+ZnkjlfLuzsTYIUbHUPZXhCECNJYU5p/ZPKzDxwm+UHENgz4Opa
	q/934lLochG7YOze1XInnSRhBEoJcEnD/7ItrfgWEheqQA0iub/dxlV9wfC0dYxswVU76tnUnnW
	JRaha3h3iuGGRsE7WrMHi6F7iTgrAo1wNBO7bOTrnWOYOnE/qtFueqrciVih+HtCm/1YhhzPm0h
	+/QBwxdW9ByBTWaa0U/gXqOFAoTfJy9xXYxQHMElGDCZZBLFISfoAcwygPay5GzZsWXgl2zyAx6
	letai73goie810lbbDtqbmiiZWy57Ddgmr5jFjM9ito7YqmJbHmEaYslFt/H6Vc0SZAUrdC0ojN
	9cAVlvzAiRsR7Otz/JbG1VJrsa3BI39J5gvRbDmtuGrlsszV+QtFqpV/uCfWO8Y+f/cvsKZXVDP
	7MBdG8UiTBCSIllcpo/RgdJyl3m+RBJlYXUvmUCQWdrjLVLmQHrRHoNMt7brlUzzNPc783Kszrd
	uO3PinS342lfr6egss0fPDmfK8eTn285/A7+pg==
X-Received: by 2002:a17:906:9f92:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c4ca7ab09dbmr821664466b.39.1793622167110;
        Mon, 02 Nov 2026 04:22:47 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc19167sm384387266b.10.2026.11.02.04.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:22:46 -0800 (PST)
Message-ID: <cb4fbc79-d72b-48d4-962c-479e4ebc7e51@linaro.org>
Date: Mon, 2 Nov 2026 12:22:45 +0000
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
Subject: Re: [PATCH 5/6] media: qcom: camss: Add SM8650 TPG support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-6-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261031112203.545319-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/10/2026 11:22, Vladimir Zapolskiy wrote:
> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks
> of hardware version 2.2.0, add their resources.
> 
> CAMSS TPG on SM8650 needs the non-real time CAMNOC AXI clock to be enabled,
> otherwise VFE receives the frame start event, but no data is written.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 53 +++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index cf4687a20dba..9eeb7e4a7315 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3423,6 +3423,57 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources tpg_res_sm8650[] = {
> +	/* TPG0 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +		.reg = { "tpg0" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG1 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +		.reg = { "tpg1" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG2 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +		.reg = { "tpg2" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +};
> +
>   static const struct camss_subdev_resources csid_res_sm8650[] = {
>   	/* CSID0 */
>   	{
> @@ -5786,12 +5837,14 @@ static const struct camss_resources sm8650_resources = {
>   	.version = CAMSS_8650,
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_sm8650,
> +	.tpg_res = tpg_res_sm8650,
>   	.csid_res = csid_res_sm8650,
>   	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>   	.vfe_res = vfe_res_sm8650,
>   	.icc_res = icc_res_sm8650,
>   	.icc_path_num = ARRAY_SIZE(icc_res_sm8650),
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8650),
> +	.tpg_num = ARRAY_SIZE(tpg_res_sm8650),
>   	.csid_num = ARRAY_SIZE(csid_res_sm8650),
>   	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
>   };

What happens if we apply patches 1-5 but not patch #6 i.e. if we have an 
old DTB ?

---
bod
