Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795182;
	b=ENR54YZEXOMKayXonxnwA4rhOKhM2wLn+2lMh2GsGUxEXFwKNIv1Gxz6I9GDe8psi2ph
	 QGOrAYpu8cEH4jlo6bn9VmP0tBrfKdyp79TICUCZToMBlN8fjvZRLC5SV22ONy7r6k/Uh
	 dc5TTUWcXq1eo1CTvlgNFg4H6kPvKyiCzhD4W4kZDKD5GNHQtyGVFj7PsiPcRLLHF+WsO
	 FJP/Eb0EFaVFYfsTCdzsgaSDuNaGbY91H7ZUXg1VFBmWxyPtK8BsvxvFIyyZ66hwbeSQ1
	 doHEVk5RWHe8uLvuR5nKxaRNM54Z7XoLjlUa9ZQTTfnYP+wQXbG8qvpWfO0gZ6VfuMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=;
	b=PAvlK6kyB3uTcCdXex46ZZ1Yof/M+PSEjv96W2I/IPPr/6DtSr4fLYrm7AmDjmvMhQhe
	 lB5I8h955oJaI6nM8RJ7KlR5jxJbqEzu0BdTg3IE32KnwfqxSMb6PyHRsNcaXY8NsmHod
	 VwwcQ0cmwD8n1AYcUJ7yPVml8zx2JZrUWJMBluz9kiV/qwNpe6vEch6VcKY4/ncU8qXzN
	 /QRPAJ7fD/HRZVDQlowc6//b/5izETrFAF/Ro0ZvkKpGN086GPkyuguX6jKa1Mdyh/KX2
	 x5ZBLME/s2CJNgvWdjFHCjITbBJc6+MzKWISMvyPc8QbulTRnkOw9YSz63tboHU/T/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx+t21J6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyQRJ2iB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D3A606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 12:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D3A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx+t21J6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyQRJ2iB
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba8D22284431
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 12:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=; b=Fx+t21J6rHyUMJMb
	GZNednuJA+XbxTEdcMhD+WABGRodwzN8hXZt7g4lHDsSYSKoEglW8g24cxWZcFug
	nVcgFlz7tvADFxgvXDFICY8tiEQyZwnmoDYt8l3NIDRGearB/MJ/12xRTojwXS8R
	jDIh/wYZGnKeY5sr4BKV2/sEalWuUmjWJV2aaLo0jMtZUBOKYkaBy9ky6caOb0g3
	mtDIDX/csZvbhvSnG3ZILY8FxI/X1gsn6LhTpMZdKecop0qGxm/pAABNNzxnIfUE
	f/wg8FBCbYnzLV4tEkfw02jzmwq8l3DRA0USuwTQ5Cnf1UQmqUspE2koHjjUbvfp
	M7jCNQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284rm5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:26:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so123898a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 04:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795180; x=1794399980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=;
        b=HyQRJ2iBX2PwwVOPnUnanJC9zGDofhaa3aQZgwvVeEvbZBfFDoAop+RD4dcg3hq/2b
         ikEwSbKZsPvktv62Lw91CVKlqJ5L3va7K2M7hq4atmWGGu+Zq2SQ/Ziqf3zTMyZgboRo
         EZk/VvQozGxOwIAEBaEWf8sEBvzJw4to9X/DSCAlzyVAcmHMDUrIl5nm6KtAu9oNpjx4
         sEijJc/qBcYfTorcUfNhKjgu3vSBsqldHlQ4otb2xv37PqJ1TL2H0dmKta6/E5b6AFV1
         xRymKmKxey5qvx0i/9nyF+AJke3CnGqic5xVsSF6sN3EVyroFLVFdw8shZNS4EAfOElW
         oBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795180; x=1794399980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=;
        b=bbBWtAbZdvcVeE9qM/nVjjLrNnja/VmgMFGx6oYusyIBWExjypy0moHKVnJcnV/gZb
         lHi197ckqpHu3CEXVAoX3WWYyQ/MccF7+f2X+3bks92sjvSaKefv3j8f/oQkqNgVwiMc
         ay2bhYwKcC8d2LQLYledNcC8Iogi2fva2Q/ppYIb51nPJdhRY55xdbbMxC7mXjCrNfQq
         okDU4V8pWCnPQNC/WA3hz9GWrg0vP5Bf4AhCFHpUA+nIM4MTfofRX4oN9UbidsrU/Z+V
         L9nFu2X7Ir2fFgMgUoGkdGR3oZlLKv1KIr/zop/bk0DWN7UfggDPSD2FhBcyl4K+Ag6O
         yyWg==
X-Forwarded-Encrypted: i=1; AKwUvBwRSHFTOtw+mCt9oZPRF31JeaZP7xzxN4Fdf1mj5E7Alas3VQBY1uSFyYaQ0VbKoDjtn+mm3YS2ScyjlwG4@vger.kernel.org
X-Gm-Message-State: APuU4Z/tmHSHFhyXgVTeydTJEUmM/mk46FVzwvjB++vT94byCVoKIz9j
	eNgdt66taEwNgSHcM4fAcXLKyWfVDs8kaNA7x6hl+3xqnxH+iN+CIfUYD8ofSKEZF7nZOTjgDLV
	SGtR3o0AGl/1vFFUzjQ59n4TTXqJs8AN5F0jW7Dr0g/VGW5enGf1IerXhmH9BHpJHbf5q
X-Gm-Gg: AYBFou2gwm0rVCx16gg4KwfgbfpydC6cbnpnKqZndNlXZ0lJUz2UVftPauQxHeDI0fE
	NzLQHTlV1cP04yTc16lXHym1mBlkLijItKroRg9ryXg4bArLKLdT0e/A+DVQ+SD5Bff7S/MtQ0w
	1Cd4+P1CthZX+rNe8aWRlAW3/lBpuqq4SqMs0Ct2+7sCHRUXg+eo4C8MB18hvrtfiGyrXZ3Z1ZE
	B2PGVo3YxEwuiX4yR/oRmFEn7MrASsicv/AO+VVqSPlcZKtG3ReUkMNqkyzStjHIpzjNeB1Q5m6
	uWp/HX5mBQuA6s00gF9SRDq9D3RTgtsQIDCadDl66xgwBWbfojhOEEA8KzvWfxwhJ077C/xObgg
	LMYXQfACOjIngh5i62/zEH7WsGPQY3kuA+2T0EbkszzRoLs/spP0EPW1u89Q2ZxZ3FkRRYZQeXL
	DiVVRi1Q==
X-Received: by 2002:a17:90b:53ce:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ae89835706mr12958246a91.50.1793795179565;
        Wed, 04 Nov 2026 04:26:19 -0800 (PST)
X-Received: by 2002:a17:90b:53ce:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ae89835706mr12958197a91.50.1793795178953;
        Wed, 04 Nov 2026 04:26:18 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3924074a91.1.2026.11.04.04.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:26:17 -0800 (PST)
Message-ID: <f51b9be2-acbe-4d4f-9f81-bf5b289eab0c@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:56:07 +0530
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
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
 <b7bc5c82-6812-4df6-9820-122a4c957036@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <b7bc5c82-6812-4df6-9820-122a4c957036@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb246c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6zRx56OMOPonLltcXX4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: kYiCy-07xEoJ--HG6iMCWARlFCM7Cdxt
X-Proofpoint-GUID: kYiCy-07xEoJ--HG6iMCWARlFCM7Cdxt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX+OYwIkLAG+Gc
 Dyv89M+RdixaAu00RqtLM5wds3WhNNd6Id4hO0PFYPAoEvQ1u6/7dT9GIX4UZ0nT0Jbmgge/4p0
 9MzNySPA3SSqGJYcvYwbHpM3xjadak5//ykNmXh4kefNWU3JiqZPKXI+iI3fDjRnTTn0fCdGP70
 zaC+fQsRi+pzHt2KLER8Jdf83FHu0w42j+gB5yCasS2XaxYYxw7WZVL+6YkGo/p900zUvz5AAbq
 ExGmNcww1XA7cLoOtxb8FX19j/M90eWdJz6lct/aYzrJKjG+T4mKStxxtFgrBnzTdxnd6oCs3iu
 grPV6W27C3UekFfrhMTbPF35+O3lAajhcNvC4RKdRW4H13V/FSW0i59DuAyYm+vWPFAsv1Bx/2z
 dTdKY4vLF2zL3inwmqp7+b3/N34LnFpksnS7qnUjYiKNl0H62F21Aa9mm1IRnU39LGCQ4lTk2xI
 qj7l+qPVn0SMy76PJog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX1H1Fx3olGG9Q
 pjPck8DITv8i4u919NDpqTJnzTHmaeYbSEST6heHJUxzwvEivhOWCcDUI/n8h3pAbTSbenY9P4E
 IunHtHz8ZMv8Vi7/yOXN6FPA4npJuRU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040049

Hi Konrad,


On 10/12/2026 4:59 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
>> hardware monitor. The driver exposes battery voltage and current
>> monitoring through hwmon interface.
> 
> [...]
> 
>> +static int bcl_in_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
>> +{
> 
> [...]
> 
>> +static int bcl_curr_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
> 
> these two and bcl_in/curr_thresh_read can be unified, then some
> helpers can be collapsed inline as they become single-use

ACK

> 
> [...]
> 
>> +static unsigned int bcl_get_version_major(const struct bcl_device *bcl)
>> +{
>> +	u32 raw_val = 0;
>> +
>> +	regmap_field_read(bcl->fields[F_V_MAJOR], &raw_val);
>> +
>> +	return raw_val;
>> +}
> 
> This is single-use and trivial, inline it into the call site

ACK

> 
>> +
>> +static unsigned int bcl_get_version_minor(const struct bcl_device *bcl)
>> +{
>> +	u32 raw_val = 0;
>> +
>> +	regmap_field_read(bcl->fields[F_V_MINOR], &raw_val);
>> +
>> +	return raw_val;
>> +}
> 
> Likewise

ACK

> 
> [...]
> 
>> +static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>> +			   u32 attr, int channel, long val)
> 
> Do we expect userland to program these, or are the default limits
> sensible?

There are some usecases where userspace needs to modify these settings
like in different ambient condition.


> 
> [...]
> 
>> +	/*
>> +	 * Map register value to battery configuration.
>> +	 * As per hardware documentation:
>> +	 * 0 -> 2S, 1 -> 3S, 2 -> 4S (unsupported)
> 
> Would it be hard to support?

As per hardware description, upto 3S is enabled, will remove 4S part 
from documentation.

> 
> [...]
> 
>> +	/* Check if battery detection is supported */
>> +	if (desc->battery_config_field.reg == 0) {
> 
> This is slightly sketchy, but SPMI peripherals always have some ID
> registers at address zero, so okay..
> 
> [...]
> 
>> +static const struct of_device_id bcl_match[] = {
>> +	{
>> +		.compatible = "qcom,pm7250b-bcl",
>> +		.data = &pm7250b_data,
>> +	}, {
>> +		.compatible = "qcom,pm7550-bcl",
>> +		.data = &pm8550_data,
> 
> Are they exactly identical? If so, please use a fallback compatible

ACK

Thanks,
Manaf

> 
> Konrad

