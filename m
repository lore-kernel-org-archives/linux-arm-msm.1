Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F37443E2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240550; cv=none; b=BRbJw0vcwx+uDZ9av59zz5gYgA2YaJ8c3SC2YlbjF2BjC6+V9fh/Wqlmnz5CoLV+lisxlQqEsZxUywl6Ft8oh+s2moqduD6HfpnZHBMtp+9IzVU90l46AN6J5S4MAlG2U37Fs7Li3AmM+W7qjRisFZuiGoO2o0Suxc6nAbbRaJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240550; c=relaxed/simple;
	bh=5jYhvH+vLfFqxu62/GQuTmcq6B5PHk2+PEpkg3Spj4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NlzIyRInhxearPdUyAq/AuhRn6LlSitcAHHyNwB1iG7ZgyzMm2LK14WERkjnI5f7HKP4Xg7v+FgQg/FiCxiFLKLUv0iB18OpRy2tE5d4pvGn+gXQM3rgC84LDAJy8TA7TMEmbOFoZHziB6SrGLg9LFzJtqUd8gaMGR8ptRRIrOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKg3HwJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cL1e9ch8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKg3HwJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cL1e9ch8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eNX8582521
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gv2nhZY/RJM160StoIjndowANebed6znMaVdSt0GpS8=; b=CKg3HwJNdM+uumF9
	2a1CoWkdje20O/rMd2WBe3qL7E/DiJU7YUtgZBhUQ1L3nu//ZEpg2qi8HPMsOlB8
	aHJVgqFqQprLVATu4a3p2+MiIEJPCtubg1VVwCINyiE0UAclQFdeBCRCc8QmYh5P
	+8gNUgEFdEVZSCKQ8TuuWWJbBEMJHvgf1yd0F+xFYS84SUHlqao1pEH4N01S+Wf+
	A74yenz+g80Ta3caPAGhoBpTp888KwJUSH/mB8/ZHmGTO4NdIB5uNTprPeKcgGRs
	FVDOeuKb5EgdxuQIZLnshRyo0phGHqx7jWNc3rCOO+NmLcTBTewxg46puRVE3fhY
	ButFDQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwm7pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:02:22 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1416f32fe11so2810975c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790240542; x=1790845342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gv2nhZY/RJM160StoIjndowANebed6znMaVdSt0GpS8=;
        b=cL1e9ch8QXbID4hgDerQ7Ym8lusMdPzcpGX3r0eiEepPSXY+deQrCMIqUT6IG1+kqA
         5z+8rfuch6dKhZAJSsDp+kpzFB2VY1tKpW1ggwySzAFLSkhvO1AtMyeucIlsIOW9Y3VO
         PCb2EBet+Jkm5POoxIcy0bOp3lA/uiCP6GS++RqVz8S9DjLgIYCvD+3pzhbXgE249rOH
         7rmbQcxe0V8IA7iIYt1M2jMzfXtjq4PHo82SsrF0GO4Sn/1coKUJAC0AAME2xYN999GI
         UFCoeeAA1RS2dov2UOkqsS0Uz5C7JWePlnutLvS1A64jWXOhGVis0ndbyVs4vWV5ndHZ
         QS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240542; x=1790845342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gv2nhZY/RJM160StoIjndowANebed6znMaVdSt0GpS8=;
        b=djp0C8nVQoz9RJyEVQGU3Hm1TngTimBZyl3tt40760VdBhMu323AqdJZpDj3iuLHGb
         K6UfMgn9nDmQsO5EHjr+vcyD4aPaSHmPDSb3/WsWGh4vsjGvEkMSzG/sgyaB3o2fO8zq
         dfUDkQTeMfUfABroSHcBVyJbyj5NtJdHT5FoRW9VOTjWw6PBw2Tle9RQbzfSTDAPF0/+
         zQWD/a3C+wrS13+beHRpRyQCfgLmQSYntKr4P38JBQDSKM2MrVrgox/POT1TzVaAi+sV
         WCD3dbuvmX5l0oyCu3SUZPQ2yJ08Y26HwGv68RWJxnVcQFS0ot/JsweXajeumSQ9z6dI
         FXgQ==
X-Forwarded-Encrypted: i=1; AKwUvByeT9b/T0saCifwDub0LaZtQSlfcvOvf4lGIQwVMY7/lyf7zgk7Ud5Fsz4GiLrKKRsjyYiqSUBeS7Tzlg1i@vger.kernel.org
X-Gm-Message-State: AFuF++mtA0UBLWbbYG8G0wAzZuOrbrOHtbMTJ3frQxG1EM6+CPYCvREv
	o8F7J+nFcSGjUSuaXQrd6kzDBn212Hi4mbgdCrLvz6iQpR2gwvaexVURFumUb5Rzr13C67ed2n6
	ezbOCUNE6sn9yJZ0jJvrcUub6fqE9MAYeQJAnkrrarssHb/0Ok/MinzDvbSnY/7wZ5fWp
X-Gm-Gg: AYBFou1KwVAQRJH4Yk8cspRncszvmlHrWOvUs+emIyc5lDwXfpu/xDVeqNx2Lvnt/pk
	vtJK7rLJwtE90+47mSi136Qq3qykCi8RS+md6vli4STDRsHYTFGSHuqHFe2P9iAdO1Me2JV3Oc1
	wxVm1NHNnvveXe0QPNZsSzMcnGZFqvJhsiMarn84d+HMPU4D6SHIK9EOEDrAlRnBTbMPTl56pPI
	2AvIyrarz8JQN1beHxthXKJBtceRkPT9C6nl7yEwtFYbF0v+BZypQeuxKXc0YQxqM8Qc9JwpRoq
	Ee+EyZN3FXBEXzux8atbeszqakeqqlu4DaA+8hlJNfzc65RYBxmATv+q6Q1hS3HyukpLaGLfmQ/
	j4Pc5p86iTX7dGKCeIVN/FBOClg==
X-Received: by 2002:a05:7022:3c86:b0:143:31ea:ebc2 with SMTP id a92af1059eb24-14503fc189bmr1394104c88.6.1790240541565;
        Thu, 24 Sep 2026 02:02:21 -0700 (PDT)
X-Received: by 2002:a05:7022:3c86:b0:143:31ea:ebc2 with SMTP id a92af1059eb24-14503fc189bmr1394073c88.6.1790240540943;
        Thu, 24 Sep 2026 02:02:20 -0700 (PDT)
Received: from [10.217.217.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7bf6bsm11632619eec.8.2026.09.24.02.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 02:02:20 -0700 (PDT)
Message-ID: <039ff147-713c-49b1-9d66-1901f4eeae56@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:32:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX9zzRBlMk6piQ
 /ZKiDjLt7P2XIsMGt1/BZwO+whT6viU72X8tnRzteaOhHHb0Ts2pCpnYrXYbyMNwbJBp5XW1FK+
 dazqI5ZD4vwy5lAEBNLBI8Dt4nyhVgAwiaeHZBmD+d8VEoKsB1b2QGYyPGFSfg8skEEwslqCSPc
 m7Puch92Ye9peGzKoJeN6A3+nKUXJF9T/e4hYEiHeVMBuQbGNX0fOveXzAwaUJj0tYT9TwYnSjS
 OVLFqWQYKWyZQH4r1yswfIdOwjE1IZ+8iijzuqISkfo4yKGGmMTEevbRQT4LUdw4vCQSv1hKb7c
 cRB1bLlYgz7byzpe3GCSWv/JUJ66l49V80HDGt9kt25LoJHx1UyZxDmT73ZWlQT35ltI5p9f9VM
 MbwVpDud9fVo88MIHV7r6weyOXMsvpIdAIoxLK0Q1nT8yf3TRfDDzfCTK2FhbDMh9j4zoi/tTJT
 T+22rU1scvT3PtfmZLw==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4e71e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bxHXvwVPidUU7III3fYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfXxkr54b+UCdOP
 KfZxMqLzfMTNuSqTXHsBMJ5KzS/qu0CP3RdfTbXLsEZs7d16/JREl7/MZYrbO93VOcqo4ArlLdV
 7FILd/MUe5X18Y2h2rOpfe5xYFcR7eU=
X-Proofpoint-ORIG-GUID: 6Xm8FIHmzrqHpGzM21v2qI8X-CE5_OGA
X-Proofpoint-GUID: 6Xm8FIHmzrqHpGzM21v2qI8X-CE5_OGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240037



On 9/23/2026 12:14 AM, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          | 11 +++++
>  drivers/clk/qcom/Makefile         |  1 +
>  drivers/clk/qcom/lpasscc-glymur.c | 70 +++++++++++++++++++++++++++++++
>  3 files changed, 82 insertions(+)
>  create mode 100644 drivers/clk/qcom/lpasscc-glymur.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index b3ffe1dced01..1e571c237fc1 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1253,6 +1253,17 @@ config SC_LPASSCC_8280XP
>  	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
>  	  controller to reset the LPASS subsystem.
>  
> +config SC_LPASSCC_GLYMUR
> +	tristate "GLYMUR Low Power Audio Subsystem (LPASS) Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	default m if ARCH_QCOM
> +	help
> +	  Support for the LPASS clock controller on Glymur devices.
> +	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
> +	  controller to reset the LPASS subsystem.  Required for the LPASS
> +	  audio macros and the SoundWire compute-mode controller to leave
> +	  reset on Glymur.
> +
>  config SC_LPASS_CORECC_7180
>  	tristate "SC7180 LPASS Core Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index a6c676f68b79..c8348218b6b8 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -149,6 +149,7 @@ obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
>  obj-$(CONFIG_SC_LPASSCC_8280XP) += lpasscc-sc8280xp.o
>  obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
>  obj-$(CONFIG_SC_LPASS_CORECC_7280) += lpasscorecc-sc7280.o lpassaudiocc-sc7280.o
> +obj-$(CONFIG_SC_LPASSCC_GLYMUR) += lpasscc-glymur.o
>  obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
>  obj-$(CONFIG_SC_VIDEOCC_7280) += videocc-sc7280.o
>  obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
> diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
> new file mode 100644
> index 000000000000..97fc099983b6
> --- /dev/null
> +++ b/drivers/clk/qcom/lpasscc-glymur.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>

Please remove.

> +#include <linux/module.h>
> +#include <linux/of.h>

please remove.

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
> +
> +#include "common.h"
> +#include "reset.h"
> +
> +static const struct qcom_reset_map lpass_audiocc_glymur_resets[] = {
> +	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xA0, 1 },
> +	[LPASS_AUDIO_SWR_WSA1_CGCR] = { 0xB0, 1 },
> +	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xD8, 1 },
> +	[LPASS_AUDIO_SWR_WSA3_CGCR] = { 0x300C, 1 },
> +	[LPASS_AUDIO_SWR_WSA4_CGCR] = { 0x301C, 1 },

lower case please.

> +};
> +
> +static const struct regmap_config lpass_audiocc_glymur_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.name = "lpass-audio-csr",
> +	.max_register = 0x1000,
> +};
> +
> +static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
> +	.config = &lpass_audiocc_glymur_regmap_config,
> +	.resets = lpass_audiocc_glymur_resets,
> +	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
> +};
> +
> +static const struct of_device_id lpasscc_glymur_match_table[] = {
> +	{
> +		.compatible = "qcom,glymur-lpassaudiocc",
> +		.data = &lpass_audiocc_glymur_reset_desc,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lpasscc_glymur_match_table);
> +
> +static int lpasscc_glymur_probe(struct platform_device *pdev)
> +{
> +	const struct qcom_cc_desc *desc = of_device_get_match_data(&pdev->dev);
> +
> +	return qcom_cc_probe_by_index(pdev, 0, desc);
> +}
> +
> +static struct platform_driver lpasscc_glymur_driver = {
> +	.probe = lpasscc_glymur_probe,
> +	.driver = {
> +		.name = "lpasscc-glymur",
> +		.of_match_table = lpasscc_glymur_match_table,
> +	},
> +};
> +
> +module_platform_driver(lpasscc_glymur_driver);
> +
> +MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("QTI LPASSCC Glymur Driver");
> +MODULE_LICENSE("GPL");

-- 
Thanks,
Taniya Das

