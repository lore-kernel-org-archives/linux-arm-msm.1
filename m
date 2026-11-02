Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632901;
	b=vCHFgVdx3D1dMyRDdQ82Yh+3YWBque9mD0COh2xbj0mTQBW39jnGOSfFqafIe0nyKVHS
	 RoNbCFyt3aF9/417c2feOvdhtUnK/QctnZcJW0Q0HkquTvN9tEwlXVxZJiTSjICt4i0gd
	 SNcO8ZcMKPJKeN6lkuZQMFLGo0xsZcwDd+21CqXCNmpi1Bxa3/i55e/2YRzUPUa6HW32v
	 TUWUGUFWRV6Wpp4y5l/2AVlak39fPGM3A+t6WMhKhWo1Afq5QR5Gc8eaQagHDIqxVq7Dc
	 P1Fxh0dgWZOl3rasfoJYxm2giHA6Q3KQABYl+AWtVVf4uB+AloDM4C1cTiMUEK5IsaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=oPKZdFeFL57f1TYzik5gLu6fyy7lP0pCyy5vLRZzH0Y=;
	b=WVrWGYQ4TyyvTwMOu0NuA/jFgUiag2ivS1QAswaP5H6krfHkIXhPQZKhwLXT+X+tcWnG
	 MOzipcgF+RJ3LKxLEymy+QCg18srQPlUxj1AoAJ7nmLpTJIErANjcZIZnSpcVSezdugdo
	 2ps1t5QHf7UnCt9O5C0wQ5JQZhbzo5QDWf44l734QfiXqFg+TCbwM5sFtpGFr8KOFOhXk
	 WpxemvHuAYa8n0YZNZ0w0tTON9w7JMCczjSVIrb2cj/GpEQkawaMXDbyHQq1uKbQw/wfS
	 HnZsIaHtl7r2W4kgD+YbauW2VPf3RQhbntms35qDHUUEdGv2Oq2iDzlIomPXMTFGE4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uEVFVyOG;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E5860C310D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E5860C310D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uEVFVyOG
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab35a9d9ceso6901241fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793632899; x=1794237699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oPKZdFeFL57f1TYzik5gLu6fyy7lP0pCyy5vLRZzH0Y=;
        b=uEVFVyOGIk0RY/9ot+HcRUWU+sMnWpraEVUWLacZqldj9h3U0yqpgZ8kfQ7KPPueqf
         aCOCbp1q9sXfE2ihFbP+tNydspojLemsi9rcrLRaqR9a4jKZTMsB7E1/nhUoQDghuXlv
         wJJv+wMQk+3a079G6WDqsoCPRPPQTf+bn7k+Xfj5LMRGo3yk3EPjJabwILude8er/7DA
         jJslthkiqcG4HH9l7AsQlttGor2TcJby6XW0y42sIYkkewlrLryHR3S7EFAQwNJ8iNBX
         /NuaRtuPTXDHQNJDiLUL2q5ilk0ruaESjpUoXU2c+1rzsm8Hz7dxao7XUsl7f6knc9GH
         gJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632899; x=1794237699;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPKZdFeFL57f1TYzik5gLu6fyy7lP0pCyy5vLRZzH0Y=;
        b=UdasqfnRmzXCRDatT40MPjJ3nYxkkXtQCQIU+csZxIloiT89y6NRmQle1SQKcrK3ZQ
         /os2nkeLXs833Azq06Xogs9jkJmFMUFdnW38DnTHr8f2SFtVwxjHDYVf0h6lNFQVLGHU
         6GNKIvyk9NW0m5R6EWBXNrZNSPUdOris9PrJWF9iXFUZJTlgHx0CN5gZqWTIBL6jzlZ/
         b1EeUddKy0Ak69cGLMng5KpjOdIaIvaG2JLbBEQzfY+1RJ8Wn+i9n1iJnom2CH7vdU/p
         GlF77NmvWRKnYjbgG6XcOwEp7/jKlLdC0hG7dltW37cNiv7hoCiZK/MZW6VFfmFtpPV/
         lo9A==
X-Forwarded-Encrypted: i=1; AKwUvBxHX9HdqxFkcq9MMP0zVTOj99MOS8b43pmExCV5TObg5TyjWPC+BmnbPQjNnYkDkoPdFb9Yla1rEgq0oCvy@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZD79+yNWwOL88eOm9tf4dIEYkQX7PMTDLwwc2EpbydpGEqRn1
	Uhya4oa1GTK/f12yVG1Q4kZnB4G+mdj13GPwC1gzj8vl5z+hmBfE5p5g/tRL3Ol5DZ8=
X-Gm-Gg: AYBFou3cPtiLvOuxsrucE0cJiE3xK9LuHbNuLiKY7Fbo0kweLtamu+hvnvf3BJNV2hu
	pfarm6JYC0o6IFnG8DyNOOBQ1iyAzdDZg6uqc1LvFfnOyZlGgSFYFrwugAA6hB0pTYyEBtd/89/
	AxjVt1IAYrO3RHzPpLquSq2WmLT+TfirRBkRMhca3qD/ivqB1fjQsz7NalZYbOwAmsnmws0B+87
	E1+QEGmCey3wcRYPhsSZxz83GTsAAkYXFTq1gtFvytgOFv+McSIJ/TVuPBvVxxCwbAUztFbWKGh
	LWAMnyawnQU3xX9LrKOxsWknJJkizvNkEsqslxM2GKU9yy3eeb62IHWczszuBhZw7T+f7bmpJVD
	jKmq4faA2WrE9CwQychku0OfdSRqGDtdHI5Nb69/HxUhGKNSZtGk7I6SrQFW+lJbvtic7acPdpu
	05jtB7IoUiAHn2D2PW+oRTvIb+/Un9EYtDj6TREDxzm6mwJYHXKrWoyq4BGAo8071gAVbdsHFjk
	OuDanrK7TT3rMYBQFJBMuiet0M4tm8FkQRtkCLtEp8bGeSRBFG553UTH61Z+z8q2uzyjq2FmHLT
	xKAxCcqpf/eBVunXCxBcOpXU+LiUMtZ5kwBO9TWkWhQU9fub+l8sZ7VX8rmMdF96VKAn0Dzq4xy
	lkqz1qw==
X-Received: by 2002:a05:6512:4041:b0:5bf:ce24:38c8 with SMTP id 2adb3069b0e04-5bfd95add38mr3190968e87.4.1793632898656;
        Mon, 02 Nov 2026 07:21:38 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072c0ccsm1724070e87.30.2026.11.02.07.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:21:38 -0800 (PST)
Message-ID: <7523d9ae-85ff-4e4e-ba52-dbe04c943534@linaro.org>
Date: Mon, 2 Nov 2026 17:21:37 +0200
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <cb4fbc79-d72b-48d4-962c-479e4ebc7e51@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <cb4fbc79-d72b-48d4-962c-479e4ebc7e51@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 14:22, Bryan O'Donoghue wrote:
> On 31/10/2026 11:22, Vladimir Zapolskiy wrote:
>> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks
>> of hardware version 2.2.0, add their resources.
>>
>> CAMSS TPG on SM8650 needs the non-real time CAMNOC AXI clock to be enabled,
>> otherwise VFE receives the frame start event, but no data is written.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>    drivers/media/platform/qcom/camss/camss.c | 53 +++++++++++++++++++++++
>>    1 file changed, 53 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index cf4687a20dba..9eeb7e4a7315 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -3423,6 +3423,57 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
>>    	},
>>    };
>>    
>> +static const struct camss_subdev_resources tpg_res_sm8650[] = {
>> +	/* TPG0 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
>> +		.clock_rate = {
>> +			{ 0 },
>> +			{ 400000000 },
>> +			{ 0 },
>> +		},
>> +		.reg = { "tpg0" },
>> +		.tpg = {
>> +			.lane_cnt = 4,
>> +			.formats = &tpg_formats_gen1,
>> +			.hw_ops = &tpg_ops_gen1
>> +		}
>> +	},
>> +	/* TPG1 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
>> +		.clock_rate = {
>> +			{ 0 },
>> +			{ 400000000 },
>> +			{ 0 },
>> +		},
>> +		.reg = { "tpg1" },
>> +		.tpg = {
>> +			.lane_cnt = 4,
>> +			.formats = &tpg_formats_gen1,
>> +			.hw_ops = &tpg_ops_gen1
>> +		}
>> +	},
>> +	/* TPG2 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
>> +		.clock_rate = {
>> +			{ 0 },
>> +			{ 400000000 },
>> +			{ 0 },
>> +		},
>> +		.reg = { "tpg2" },
>> +		.tpg = {
>> +			.lane_cnt = 4,
>> +			.formats = &tpg_formats_gen1,
>> +			.hw_ops = &tpg_ops_gen1
>> +		}
>> +	},
>> +};
>> +
>>    static const struct camss_subdev_resources csid_res_sm8650[] = {
>>    	/* CSID0 */
>>    	{
>> @@ -5786,12 +5837,14 @@ static const struct camss_resources sm8650_resources = {
>>    	.version = CAMSS_8650,
>>    	.pd_name = "top",
>>    	.csiphy_res = csiphy_res_sm8650,
>> +	.tpg_res = tpg_res_sm8650,
>>    	.csid_res = csid_res_sm8650,
>>    	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>>    	.vfe_res = vfe_res_sm8650,
>>    	.icc_res = icc_res_sm8650,
>>    	.icc_path_num = ARRAY_SIZE(icc_res_sm8650),
>>    	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8650),
>> +	.tpg_num = ARRAY_SIZE(tpg_res_sm8650),
>>    	.csid_num = ARRAY_SIZE(csid_res_sm8650),
>>    	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
>>    };
> 
> What happens if we apply patches 1-5 but not patch #6 i.e. if we have an
> old DTB ?

It's expected that nothing terrible will happen in runtime, and TPG registration
is skipped, since patch 2 from the series is on the list of the applied changes.

-- 
Best wishes,
Vladimir
