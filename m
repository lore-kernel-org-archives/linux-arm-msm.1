Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C98B37C0F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194739; cv=none; b=IS9f3hFcdr3wjPzwLpU9/fCwuwkMwIVJjZOnEWl0crFcb5lsKarKJqbddka0FCJKsKBlzChRgSMHU9MfZuTeipQumnzD2l2b22WIUvqjX/modRP8HAG+Q8jzajGLOk5Jo5m5p1UTWWiuuWcdmE40E0avLmTC5ZOzy6n5R1UtsFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194739; c=relaxed/simple;
	bh=7qHM1Pph7CioC4XwayKEdcvtL/w4TcSEf05VVh0kTb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfDM7cnsl/rtmJaOr2ehHWhGcQyXwsgK/K7UUChBpLQXmwpkyYXITt/CJE5kuScqYD4Cu0i3NfwrlT8cAE/8gEdRxf9Nc06LHb2etESSpmLjrRb2qrX7sIrfdPV9Q1ClYgVxA4linZYPjADas/dhKHeCC2Xblh/aw/TD4RzVhi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKxOfY7/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnfIPRew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKxOfY7/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnfIPRew"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFpui84152567
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I1StJ6DrwSXUaQmbo7/HQBFEJbOwbWv30eZXjba0z6M=; b=OKxOfY7/41ow87Vu
	DRd7kp/AILhvqgYcARM6FOsCrqy9WaGCtFgIRZb3VvwYxaWwaEiAvQXxXOtFLlgx
	Fi31ZGwNrQrPABjRDa0S3bZWzgqXibTyvRa/2FkEUKmfHo7uU+lhQSOqURwraAcw
	0Rb7tMA8Y+/mPWDh4ybH3I5nuBauYlGboy839ZKtEpibjTGZapEB7+NaQLNGpAOh
	8rXRpsL/MLdOnervZ/B8bsyyv5XfTLxWK/6hCQSPM/zEDJKRG/sqz7u+efG8fhYY
	bAVSimuOrX7qZ5nRhiQz0Bm+RCgrQPY1wEQs/nKfYXzYUCdxty/Af/6VDDvnaKZd
	/HKoCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h921t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:45:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9349ba88188so98341085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788194736; x=1788799536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I1StJ6DrwSXUaQmbo7/HQBFEJbOwbWv30eZXjba0z6M=;
        b=jnfIPRewFCx8L02xOVfMgSU+y2PTZtAs+Y7FOPWJsTE7mCZ4N5BUASC3VAI+NzJlKR
         NAsdOzyND1DFeQtXc23gAqYXpO+XkOzmW2jik820PmHQQVkN967F3EjS94KeEZU5Y86D
         q5qomVtqH5gPdFS8UXO7aZJ8XU+t7M8s802YFF/udOFIUby1YTxWWREjEf8usmYA7Ysl
         dYfGKen0AQVXfmgRLCMEwJtjgMZm/ty0ny0vG5HUgnkT8S8dZi7uhIl0JVMkM2tDpl5s
         V6r92viEBo8KkqUDAGvYvVLAdeZj3YyoS35gSCKJ0X876gY/W0b1VoJt6ioS6heXOzFS
         7Qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194736; x=1788799536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1StJ6DrwSXUaQmbo7/HQBFEJbOwbWv30eZXjba0z6M=;
        b=jepCrnzWs/NGA9ws5zOci69aI/og5zbbe/1P0oIRRdFwRy99mwbA65ZzCzTJ7Iktys
         oW3Ky3EoKjABYo+87U+dgZzVZNwYsnkKxeEoLQyYno/MDuzp6pn9xHqPi6F62hSnlIaA
         3/9W52jcQij16eeJQuzq+3YMOhjSvl5mJLltrePjV6Xk5StMBY9HNYNjTSzOjZlOvvRZ
         JA7x/Uv0CAcEpV0rKVohwprjUpdp0MSonA6m6NP2TKyOQEUEQUvGJj3Dv046ZomVT4qd
         uqaQeHyvoqSHvo4zPwzJfUxPj6zHPa4iJij6uR7aJxLZnhLlxe+0aTOBTjGWU+2tVLRb
         7crw==
X-Gm-Message-State: AFuF++m92/1rzM3v/FX2ByoV4stG7gR/noj9rqv9k3raobMTW0cX/Jr8
	jOw7tx/i+HLXFicvHRxaqs6bHXjVQpo+lj9aZv0T7lmZFwe5DrbCVEzNvRLXB9LJRp5l1AHv/9f
	SYih5pU/7Fu/W936ERVOPnmYuBG2vK4fblL/Jovd0C8T5QpHz5SwbI3T2eEE9JMhbo4J0
X-Gm-Gg: AR+sD110ImOCBO6+F5YQhTs62nhwA75rzVbm+iQzqjPsjUvaoePSKeLZKXxVBXvTo0u
	Enl7GB3FX/kqbuA31n2GrWO3LciRvVEG7A9xpR1z45xXBh5CLS6hgul3YiA3nXxCrtsFfrhKVK7
	lzxOBKONP0YHFTVnYItkHlzWtFry50gfvafoB2mb1L3aFcK1Woql9+t550oQeUtaoKTZwtwzgCX
	UqAGzu6Tz1FrWB3Uq33lahBZ5p9As/C7Q1v2Ii0Jf8Fx4hBg+exn+xO8LR86wnQ4OtLxlk39KLL
	19RFvqMwHDHpoyUdQWw8GYjyULbteVcrY0i30RzsFYE8snil5Ifx6csWrCjQCQnineUkUOEXub0
	U5Pqk9Uz8n2wlqJlxNjxw5Q==
X-Received: by 2002:a05:620a:224a:10b0:939:3fce:1a60 with SMTP id af79cd13be357-9393fce1addmr285338485a.0.1788194736054;
        Mon, 31 Aug 2026 09:45:36 -0700 (PDT)
X-Received: by 2002:a05:620a:224a:10b0:939:3fce:1a60 with SMTP id af79cd13be357-9393fce1addmr285333785a.0.1788194735549;
        Mon, 31 Aug 2026 09:45:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e31462sm432886366b.60.2026.08.31.09.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:45:34 -0700 (PDT)
Message-ID: <65f0a137-851f-46a1-a915-bbb2ecfd7f93@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:45:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 09/12] drm/msm/hdmi: Add HDMI for Eliza
 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-9-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-9-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a95afb0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Rd23p8nNYRV-PgpY908A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0rWJZAhU1FhbIouJeVyB8vQY4W8Fd5c1
X-Proofpoint-GUID: 0rWJZAhU1FhbIouJeVyB8vQY4W8Fd5c1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0NCBTYWx0ZWRfX1j9J111zgN9z
 4PPGeNP+q+eKbKRyvHoB1Zt5V3GvJ8+2GVX0dJ608D0RSo0EjQ/KIIUpCQ3yDHEK3MUkGwEobB5
 qDDXXl/QaPrvxvlux/qyHcUmZTjbrkg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0NCBTYWx0ZWRfX0AZpoS9QGfrN
 TkgCU7kLHZgLtySu2MWhCUJ7CurfWk55ZPOo5Da+VHWNro3ZAvFLlckTuWFRKBC/F4PapUNqtcf
 e0gPA3yBQRlPjoCOT08S+DWWHijWYKvkWdWkWlzP2T3y4Cv7oHVDaNYaWYa+5EKQCA7ZCLw8IOb
 RrmmVmdTaL8nneROSLbt9Xn3fd2CDzL0MXxa4++3wo96hOW7QpJLceO9b4thU3kFjvlsC6xY3GR
 SvodVwdOjsuwkU+3V7GF1KJsOg1rIfY0xobEhKAmCMyxGKzn5t9Crj1y47Buv1/ZeWvI5JNiwCx
 dUZlgJvPYBnrYhXppzcP/Kifx0anCTSDOxIXqEaCnDbenkrTWeaRm9KnuHkykVCjw2QGYbbSenY
 20J52pGJhY7vns5to5DdfZAZPD86YqHgrEBYDfmTudt+TjfhjKdyxpC3oOzkzT2DlLWk2oTjDyK
 gncMGqVERAbi1te51yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310144

On 8/28/26 4:05 PM, Krzysztof Kozlowski wrote:
> Qualcomm Eliza SoC with DPU v12.4 comes with HDMI on INTF_11 with
> additional INTR registers.  The device clocks look different comparing
> to last variant of HDMI from MSM8998.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> +	hdmi->pixel_src_clk = devm_clk_get_optional(dev, "pixel_src");
> +	if (IS_ERR(hdmi->pixel_src_clk)) {
> +		ret = dev_err_probe(dev, PTR_ERR(hdmi->pixel_src_clk),
> +				    "failed to get pixel src clock\n");
> +		goto err_put_bridge;
> +	}

Why do we need to toggle the source clock directly? Is the clock
driver broken?

Konrad
