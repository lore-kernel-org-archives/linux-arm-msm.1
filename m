Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FAE4C10EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661306; cv=none; b=j0WH4h2WJzfHvpyKgRDYUnmpRsUc4Itl/wQVd6Tp+KwVHhj0FZIa3G1QtIxy37Wt5gfJ2WChBMoxMKQ8gU2zof+6l+DnOgAIBOpsSyUdaqF8vJCpmsNX8RR1d8lTAXZfE56IsxVDfLcO2ECXmTMnWh6K7xYZzDmfeSD3Z86OgPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661306; c=relaxed/simple;
	bh=JC7H+pm58E1n6/Bw2bKd0g05pNgc7ySxorvePFWsxGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4ty+eg7xc9fnwRnkEGWC4f6SB3guMpxMmxXyPMcMJiFSnYAtU5TYrwjEXMAgW6C5BkI0Ru2XPLCAjWzy/SedIJ0L3DomZL93qHCXq9p5rl/8td41IIbYiol3q4NvpQmjGNy0bNz4kUHBC1H05QcZyKf2gI3XRJF5bvBKWRG+j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwMISGum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IlaIrm8/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwMISGum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IlaIrm8/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDk0WV1954829
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 16:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	de63mvokSx0mtHbiaRS5gUbMbE5xdFNiC2Y2uI3lIvQ=; b=PwMISGumlDQw7ola
	XatjSPFVjAFjgAnxCCRdSt0X/+CBgsmAzIpKQ+EJejBJIC+7zdQDlkGMR7Pt3sxn
	nfhlztJSxKjgOlcm0SLduaUZO9d3ZE/4qibCJISJruOY4MPqq1XQJDddfC7YxCGn
	c6kLBaCg1rVGUudqE1OfE/X/k4Rq1/Nyhbnumt6PJVOdWONV24e4e42GAYOsUJsw
	UcXFwe2WMST0lVIno6xN5od651yVP0esrujxqrvjzSz3asQ6krSmYvJ0XJzqEm+R
	mWUb1WYa1dp3Cf0666LGl6jTwb7zOuby7DVWbiMhhH6vGFdv7M93WzAXxr542DZi
	m4uHyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grgu5gwt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 16:08:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso124203685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789661302; x=1790266102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=de63mvokSx0mtHbiaRS5gUbMbE5xdFNiC2Y2uI3lIvQ=;
        b=IlaIrm8/Hts7zsMsiApLZusis0PDub0roee6SeqG6vG1CMLkt+t4n4yeT2UNVFNHwN
         rJli6QwVL9cT+hom9mlsPwhTG2O+qKpNXZhrqvQXCjY7s0IxUGnOtUOZU0lncHfTZE+j
         d5ogtVQNYDk5rR3IfhTIfFy5O97E1DJOEZGH9uzapTMJLiPNywDJiW6YzHKqQXZZXjdm
         Kn7AaftWeN4IeSKKffqH92qltpO24FzrRbeHJ/jcGY7ttxJkyAtzUwiDYnFA24GX7eEI
         YHLQ1bsbmCgAY3E8SqTyweArHFpHJdZ8mqiTTCwCzSf2j2kAHfoDhJYTl2uHlFcy4AbS
         pGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789661302; x=1790266102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=de63mvokSx0mtHbiaRS5gUbMbE5xdFNiC2Y2uI3lIvQ=;
        b=ipkk/BlwuVsBBGNx3SD/EcuTK0lYkVUdG7YVtiy9PTfARmiQHqnkoBpHKQYs+Sbcha
         70ADeZtiz5hDbcdkzdKsL3R77IsvAEWKfThr2CYksBKpSOBQ2ycPvlft7Gfyxoveo7W9
         BQJ4/+/k1qRsASVEOf/RD04HVrP9TXcLbUpArf+7sPixcEijskyTDr92j4R7LRODt1yw
         bS8OKS+UajqFR4yA7RH6K/7SEP7Aq6sryG9s1vHK2V6fA4ktyuWfFqztr95UIhZSCoRl
         /V4sz/wDwfQVG1CDJJgLZbDZh8sXHHxrJS6BCtKx7LvL2CPoqm7efAkErXd64VrCA+bH
         mCwA==
X-Gm-Message-State: AFuF++mR+woNnTByKP9wtap+Jxu0+z1zsOHn0uBkzYe1ahW6kopXILhX
	5RnSkM83vdwUzwQnRPOY0eIaRC3vwQZLufFqywKyUwv/njic3+SPtS9TktYT7EuI0u/TqT1NHq7
	zzdnqJtPdyMkWb7fIy5KZH8DjsXzhIsyBhuKO6Axg69z6na+5ClCjKB5pjqeRlvH2KpMs
X-Gm-Gg: AYBFou33oUs4O4vfLd3KA8SRIjlMxLi983x2Y7Vfhv3o6binU5eyR85Q4p6ZT7v/jSp
	8wt/FattL7llcqJQoB1lOjv9g0FNosZRqZqklwuowraDq5Qhq5OMg5k3y9c2z0wZzpp3xZxu4fW
	WyYgnJF2VLuouXuFAbURpJlUxu6JfJk6pkAg7dnavb1iPrLj6M5bS/UJlxk19FPz/CLuk455C6f
	2ekIp+kA3Y0T/+SV8KcdSJXzR8PNKrmnG1kpSjK8d/Qif+XekfdcFAaMEr+TH1UMPlnWC4nfp1o
	hihAnQ2PznbrWCTKWRp8jpqq7fZa6T1L7Ug357q3QNbDQNcXhc3oH2sGHXY/hixcANXF/eunssQ
	Gy2/By9gxKMb0jMA2+UmcRNS9y9o=
X-Received: by 2002:a05:620a:2a08:b0:939:ff11:5328 with SMTP id af79cd13be357-93bb791aa13mr1214287385a.24.1789661302429;
        Thu, 17 Sep 2026 09:08:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:939:ff11:5328 with SMTP id af79cd13be357-93bb791aa13mr1214277985a.24.1789661301792;
        Thu, 17 Sep 2026 09:08:21 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bf2797csm15865882f8f.16.2026.09.17.09.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 09:08:21 -0700 (PDT)
Message-ID: <a9ad0ebd-2b6f-45fe-9ea9-c24ad7a30bae@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:08:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
References: <20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com>
 <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyOCBTYWx0ZWRfX5/d93OZT9rSs
 6YHfUfKXycF6JCCr+aOc709UelVaN+Hxvl41MqCmuieQ10zVSd0c9tsNQEci83ypMW/0gS1zWkj
 qWa7mNVc+JNNPVECTImAp2J5t+Ve6gA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyOCBTYWx0ZWRfX0LZRFlzLvNmB
 tcC1v2lxwu9myQee5XQZtyn7vj8G0PXE50TzrYETk0L7xTP628B0qO0OLNjv6uTooANFRj0xTmu
 PJMDCES6iUnnIhgEttg6LdJS0FLMAXr8jp3J+Az52AlNRlfMQlqYt/WNiD5Aw0ujP82nA2lr3vX
 BKSpeb4bwEeWGsaik1lgkxpZ0/ZIp8NuxBUaRxt+Wz5pnn60QxrCxmVVwzk8Zc+vmPFy7AuGLAF
 CZvdLowjvFK44QVt3PfA5VoTtiHmtwxeFIz74/juzU7IO98suO1M0B/YecuTnclsf145gniBgD1
 hsSgJRSjiPkAz6B+/1ak7DK65PhRNxlVDxKIGPI1os+N3MxfYEZtDXIK0+lb4RZ7BMFhTBZq6AC
 kJeEONB9rVErhGu2dcJDhNa8Vqh8m+Ltb5Rs8pej8wlKgPKbTv0NFr9jfmNnmXs0JeubprPHGFv
 wEDJBvFvhJ4CBsohltQ==
X-Proofpoint-GUID: oW404Y-h8O1HdvkmWG2F4Wdz6Z5qIXcS
X-Authority-Analysis: v=2.4 cv=GvbXaU1C c=1 sm=1 tr=0 ts=6aac1077 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Kn2qpGTL2itX_U7O_l0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: oW404Y-h8O1HdvkmWG2F4Wdz6Z5qIXcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170228

On 9/17/26 2:57 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> 
> The HeartBeat Pulse, also known as RateGen Pulse, synchronizes the
> start of DMAs and Codec Interfaces for the audio usecases and can
> serve as a periodic wakeup source for the DSP.
> 
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the
> other clocks during runtime PM resume and suspend.
> 
> Attach the DT vote clocks to runtime PM and resume the device before
> programming the rate generator registers, so register accesses happen
> only after the LPASS votes are active.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

Lgtm,


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

> ---
>  drivers/clk/qcom/Kconfig        |  14 ++++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/lpass-va-csr.c | 140 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 155 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 6ef083f5d9e2..32172f2dfe3c 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -2116,6 +2116,20 @@ config CLK_GFM_LPASS_SM8250
>  	  Support for the Glitch Free Mux (GFM) Low power audio
>            subsystem (LPASS) clocks found on SM8250 SoCs.
>  
> +config QCOM_CLK_LPASS_HEARTBEAT_PULSE
> +	tristate "Qualcomm LPASS VA CSR heartbeat pulse clock provider"
> +	depends on COMMON_CLK
> +	depends on ARM64 || COMPILE_TEST
> +	select REGMAP_MMIO
> +	default m if ARCH_QCOM
> +	help
> +	  Qualcomm LPASS VA CSR block contains the rate generator hardware
> +	  that produces the HeartBeat Pulse (also known as RateGen Pulse).
> +	  This driver models the rate generator as a clock provider so
> +	  that consumers can enable or disable it via the common clock
> +	  framework, and it can be used to synchronize the start of DMAs
> +	  and Codec Interfaces or as a periodic wakeup source for the DSP.
> +
>  config SM_VIDEOCC_8450
>  	tristate "SM8450 Video Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index a6c676f68b79..66c8501c21a3 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
>  obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
>  obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
>  obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
> +obj-$(CONFIG_QCOM_CLK_LPASS_HEARTBEAT_PULSE) += lpass-va-csr.o
>  obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
> diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-csr.c
> new file mode 100644
> index 000000000000..3c87c3319f15
> --- /dev/null
> +++ b/drivers/clk/qcom/lpass-va-csr.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of_clk.h>
> +#include <linux/pm_clock.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include "clk-branch.h"
> +#include "clk-regmap.h"
> +
> +#define LPASS_RATE_GEN_CTRL		0xd000
> +#define LPASS_RATE_GEN_COUNTER_0	0xd004
> +#define LPASS_RATE_GEN_DELAY		0xd010
> +
> +#define LPASS_RATE_GEN_MAX_REG		LPASS_RATE_GEN_DELAY
> +
> +#define LPASS_RG_CTRL_EN		BIT(0)
> +
> +struct lpass_va_csr_data {
> +	u32 counter_0;
> +	u32 delay;
> +};
> +
> +static const struct lpass_va_csr_data hawi_csr_data = {
> +	.counter_0 = 0x960,
> +	.delay = 0x16,
> +};
> +
> +static const struct regmap_config lpass_rate_gen_regmap_config = {
> +	.name = "lpass_rate_gen",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = LPASS_RATE_GEN_MAX_REG,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
> +struct lpass_va_csr {
> +	struct clk_regmap hb;
> +};
> +
> +static int lpass_va_csr_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct lpass_va_csr_data *data = of_device_get_match_data(dev);
> +	struct lpass_va_csr *csr;
> +	struct clk_init_data init = {
> +		.name = "lpass_heartbeat_pulse",
> +		.ops = &clk_branch_simple_ops,
> +	};
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int ret;
> +
> +	csr = devm_kzalloc(dev, sizeof(*csr), GFP_KERNEL);
> +	if (!csr)
> +		return -ENOMEM;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base,
> +				       &lpass_rate_gen_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to init regmap\n");
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
> +
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_pm_clk_add_clks(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get vote clocks\n");
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(regmap, LPASS_RATE_GEN_COUNTER_0, data->counter_0);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
> +	ret = regmap_write(regmap, LPASS_RATE_GEN_DELAY, data->delay);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
> +	csr->hb.regmap = regmap;
> +	csr->hb.enable_reg = LPASS_RATE_GEN_CTRL;
> +	csr->hb.enable_mask = LPASS_RG_CTRL_EN;
> +	csr->hb.hw.init = &init;
> +
> +	ret = devm_clk_register_regmap(dev, &csr->hb);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb.hw);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +
> +err_pm_runtime_put:
> +	pm_runtime_put(dev);
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id lpass_va_csr_dt_match[] = {
> +	{ .compatible = "qcom,hawi-lpass-va-csr", .data = &hawi_csr_data },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, lpass_va_csr_dt_match);
> +
> +static struct platform_driver lpass_va_csr_driver = {
> +	.driver = {
> +		.name = "qcom-lpass-va-csr",
> +		.of_match_table = lpass_va_csr_dt_match,
> +	},
> +	.probe = lpass_va_csr_probe,
> +};
> +
> +module_platform_driver(lpass_va_csr_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm LPASS VA CSR heartbeat pulse clock provider");
> +MODULE_LICENSE("GPL");
> 

