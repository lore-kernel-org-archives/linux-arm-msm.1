Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8193E440622
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 11:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457909; cv=none; b=rbkqIuuGZ/TfslV5jeC5w/1Rh9puld+D1aouO5rE7/6tb11+KIAv9IIhd3nC5HQhHHZURIqV7o+D205xNDdanb5b5l4OdslhkyQ2vDPDAA7A+vNlZ2zYBlmmBpCd0q8CFWgBQKF+1THm3xKtelVUBq1mpGLMejxPHRNK7u77rwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457909; c=relaxed/simple;
	bh=09yRFoZuygdD45EUDMQtl/Q4C8O2MyJRR3brstd97FU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mTGnQMJaPSIdtUcw+wPVDXvnvcJWTVU7HMeJgrolCt65hdIdymq3Tl9xMNFz6H9TMs1vfRNKWYNSiQDuHRJvgVlxF9U/UzkNUIe0Zsf8Diy1Oi84+HrrmJ383cxLJW8el62oPjLUHIAnvY9TGznCEpROUqLF7k/xJbAhrd1snOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Avsv3A2j; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Avsv3A2j"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6aa97edc48cso2586228a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 04:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791457907; x=1792062707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7xXvsj66wQM38M1X8uFAHXI+21qnaIAFX1qmFu6hhD0=;
        b=Avsv3A2jwcnmICvoP1cgtlJMBCnTQ2nXhSMeYWJs6WasoNFJU9jTiHNkIA1DzECQ4u
         sLaZFz8YPa+JgsMc8ITtwmBJHNB/77iFAitNhRM52qqdXVxf2Z2HLovVwwuJ5RKk76Q+
         NeJkB543/Q3dPz0kbSoB1GnpsoF+2FN9fc91nFT6LVj4wUE/HZM+ECFeoaout8pqzgb9
         sgf6/t0OMNQe3dmoxDO0BeKGPmp29HiolT4fx0Wr4ZjKydwZKUPT3oF1IpW51+yEteyD
         p7F0eMGhZw3vpJV1d/0mL4xsFsVxLeJ4z8ww3V8Z4ed7ViMVuBzCV7td/hakv1NkJFJG
         9Wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457907; x=1792062707;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xXvsj66wQM38M1X8uFAHXI+21qnaIAFX1qmFu6hhD0=;
        b=X3rTt/pvM0uToO9jmBaj0ALOJ1ppo58nIJwC38QLcxkwV+z9YwAV3th5fDQG/vC1b7
         tpiAVa9eNNgb+T/odjF+SoYXeSoaQHmk5gat6hDQyYt2IdB2HkJ4wtNIfG57FtkTC1xU
         5zKnU/3RX82qc3nnchJN6bILrI5DcXI191wCg6cLGSlUB92i3Oa+bPxAiv1r0o5SSlXl
         I5pdfCb4gGa89dpg+BlhaCr592elfBvqzRqJFKoS6hLawnrIR1YY4JP7B/yrY628115e
         j+jA9kn1f2pERvRiAjEApWBlm3fJ3ogYThBtYtDNAi+1lSNDsoTijuL6U2wQQv7vXU0P
         tSzg==
X-Forwarded-Encrypted: i=1; AKwUvBzLdHAeB+tAtJb8yNtZZrqz5Kh9cIuNrj7RLceSzVAPx6b2oRqHQQxadTU8iKYQ5JrwrP057kHlkgdgk+kO@vger.kernel.org
X-Gm-Message-State: AFq9FYLXHBlYn2L2WZ6ipnWe8X86sMg4Sp2z776KOFZxEE0+19nGHpIV
	ZSvuqfgpmH7pqMIb8u0+ehwRnc9YXrSur9jxIA4txA/xE4acAcGyYlVudjoWiloH5GM=
X-Gm-Gg: AYBFou0mLSqm9b1hIO+fRT4TN/2WyZdRHgxYry02HFohdGpb7BaKSyEoB7fuWWNSa2H
	xgKU0d+T2wWIpqD63cAlwb2sE/THUlgHMwJOx1QYIwGoO2qn5T9TgnxYF8iHk3Mhmkh+BMUNi/T
	ldU4Up/vrMSYcBV5qHTkYDLZr9E8Pu6ZOVk8mCjIUtjfaAOrbApKOpfqHJTKZXnnbMwTJgz1zP6
	leGFqCf72vU9l23n/GCI8GRhOo2gkIaJ5dxx9BYUesQxgS3vxcwPgArwZ+MR1FpbTKDZlQs3plJ
	3IjaEj1Q9MLykGCf/Ssy/qB6JUGKHpM3QEORNv4qDtGvb71FQu4yeGvXdyRXHPuJfJX77B0mjDI
	YfMEYUzKddpce41FvN1UYrDAEG/xeymnPpvE1TBPbGkGeRBYjuQDwwv908aJPj4w/vZWRYNG9Bi
	aYDOGVkS3F+IzFC3mZhtqUcYC57WuJzqE6vxC5B39Uh1lxIQqmiI9ixPKrwqbxpNICX47jZakC4
	y51wnXMULGO
X-Received: by 2002:a05:6402:46cc:b0:6ac:bdb6:f245 with SMTP id 4fb4d7f45d1cf-6aff47b4913mr4165062a12.24.1791457905432;
        Thu, 08 Oct 2026 04:11:45 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.203.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b00aa492d2sm1245502a12.32.2026.10.08.04.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:11:44 -0700 (PDT)
Message-ID: <5d4ac08f-b525-49ca-8715-b4c2fae1c11a@linaro.org>
Date: Thu, 8 Oct 2026 12:11:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add support for X1P42100 CAMSS
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
 <20261008-purwa_camss-v4-3-bcf11bf2c650@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261008-purwa_camss-v4-3-bcf11bf2c650@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2026 09:27, Wenmeng Liu wrote:
> +static const struct camss_subdev_resources vfe_res_x1p42100[] = {
> +	/* IFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "cpas_ahb", "cpas_fast_ahb",
> +			   "cpas_vfe0", "vfe0_fast_ahb", "vfe0" },
> +		.clock_rate = { { 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 345600000, 432000000, 594000000, 675000000,
> +				  727000000 }, },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 4,

.line_num = 3 until we merge PIX support please.
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* IFE_LITE_0 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
> +			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
> +		.clock_rate = { { 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 266666667, 400000000, 480000000 }, },
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* IFE_LITE_1 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
> +			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
> +		.clock_rate = { { 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 266666667, 400000000, 480000000 }, },
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,

VFE lite has four RDIs so this stays @ 4.

> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +};

---
bod
