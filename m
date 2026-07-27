Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E262F5A29
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161971; cv=none; b=Vf0Jgr8rCwFnoLMCcc7Kg0hiDCDj0CaCuisOVRnHq0XddIuGe8tf6vfWCAIiU9AbIPsP7BLWvCJqJOnuOTyGyKnuaoYIpvxmb/pdJ+lSSbENPMGdeDKzpWb55rD5gTu8VtcmcEA+W63unLY7DUpLchJ/Edfjgx2cIzsFqchKhVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161971; c=relaxed/simple;
	bh=alg+hzjdlC7mjiA+EgxCmbnIxIwN/YvpZqFiEafSY+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dh2pjto708ieDNCjlrFSfCtyNUcOciSQ5PWkEvWlyCpwuXWnE38eIlSKY2tp78PTIyuVLhC8hgndXcMLGyoCPimpFhfGwBWfa30DyYfZCA2pxe9XTFspC9Tc5+XT74LqAkpqky1dcaLrtCcA/L71e5swoRFY8YgwhhfkS67p15k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfSaVx45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2BcSXuC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfSaVx45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2BcSXuC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDliqP4061200
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=34xWEcGhM+zJvKc0sPckSjAd
	TLL0Zc6PlPXwpRNsxSg=; b=KfSaVx45t9JyU2CazlmUdzI44MKoWnmTzwx7lWBQ
	XmcWqBv4JqsHI5wsivoBb8AM2muQCrDZGnTw1ng7aREPyVIe8ndDPrbcvbTWsdpw
	47gTvggmI3WMLDW9EtrpZ1Axo+wNtofQ56sGb+NpbnjK6JP22FC8ny3YiJ5woIUL
	v9REGBBro7aY4sROvtXX7l6lNgM57nU8iw/FTIyiekIsfdC9WgEAZ0n3TaLDifGk
	hDlpawBE2bJbitjPZ/7q95dPka1+XnM3DNaIzctnD5AuTSTT9x1paxf2FPeCeaNS
	AzD6YJ++f7BoWhELMVbnv8RyMivsDXb807wVTqHsFOl0CQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq14dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:19:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c110a3b6aso39154521cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161969; x=1785766769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=34xWEcGhM+zJvKc0sPckSjAdTLL0Zc6PlPXwpRNsxSg=;
        b=a2BcSXuCcnEbGt6YSkFaF99xp1abaR4bPYbYXgXCMCvbTivq5+yqV4VRcJUwsL2SQh
         EIFpOlvlq7hdO9XJ7XhSW3UvR2FQIkye6eiw7HeqbYyIB44qqg1BLfDW0tz1U1lBHon9
         F0L5vekR55I94b04GHTRQW7FKnKWJoL18MFouhA3/2NgP4XBPVDEprnnLQXGQQtEhID9
         SblIuT1dQYad0nmzG/s7SKBFq2fRjJELF9mVOlAcxU9ETB7P92l4wCB2dFiECaCOSs0H
         H1vZ0BBl/JEQ53hsl808+VP8Oak4FTxnXgaykci0icm2CX3GuAEaSI0DRn2lrn2T8A91
         6YYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161969; x=1785766769;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34xWEcGhM+zJvKc0sPckSjAdTLL0Zc6PlPXwpRNsxSg=;
        b=UvzJTDyMy109bc6W6tFbIYsbVFWtSZH2fGWtAgjYCz7ZEtvCnCw11VtxC8sQ6DekPg
         eCRfLM4F95+VxbBJ7SRYp5X3ZbA3vWcZ9ZrC4ZR58bfITgYRMx/N/kkU23yV7n9NkmF8
         UJnq5jBsbuP695gRDRJQzeZ4z6+0VCteq0OQxP/b4DnlIBqPMwztM4LINCU0QxpufiGO
         HswiOoxlGNtX0QRcyUVF/O3uMwVhMbFn/hs7AmhghmaX4HPsaSEsDGTRzn4VpTKGXEf2
         MK2VlDmCxSt8ISB6EMgL57nrzezn6D25B4HndPMpXb0DNZHWoFFuZ852nKkFd+nMwj1w
         931A==
X-Forwarded-Encrypted: i=1; AHgh+Rpo53ETRjlx0mus2HM3llQdlxtwve5uY5rdhi7sPO7M8Uo45CbAKO0vFIwLeGB/4v3asWxpHmddG03fPX2L@vger.kernel.org
X-Gm-Message-State: AOJu0YzdsD3ltblJzcVcbHZjY2E5pMKXzGu5ZdeA+elzytf1HOrAj9oh
	6fcYkXwDJXaYyqo5sTyDm22pTJvldocZei80ddyIj3i6VUcfK2jOjvH7vayKvnSK1nL341Qxdj7
	5FfAz6v4SRa8T1mdgbaEHB9DFabzZ7taJIOsBjqtlABgY2qTjA3lXMWADd+rLXaou2eqHMp7Izc
	/r
X-Gm-Gg: AR+sD12ENxwUrbRSNHF1j4cAts0Z/vhJPxOYEpCMoVpKdm7lZsRF19CqBBVGaVcTed8
	sYEl5dsjod1hzUdtt+MI10cUIz1da7xWgqIlvaCAkfZOg1Ve0BnhJbXeqls6Y/wa/1iQJmjywlU
	ETo5Th8lZzvpcoqNj+xRUq2MFICdJTNx1NG30yvIkE65aU8sMLHsI8QtGT0G0Cu/YAKjuxKjOER
	Eb6KTYdODUTgvf9nVffqn3lbjn3xpetTb32NqW1rSIyE6WStYvIrAUYLAhhrui7O1lO87SkxkkE
	dAPiI699xQFuiStv6pSdxR0fvzolvUE+wHuwRK1ztoUInLr/zrHfwBpTMuk0kRqHQcy4G+Gg5oh
	MotKy9cVzYf1UrwQ=
X-Received: by 2002:a05:622a:1dc5:b0:519:5680:1b5 with SMTP id d75a77b69052e-529a83a1c35mr88407021cf.21.1785161968422;
        Mon, 27 Jul 2026 07:19:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1dc5:b0:519:5680:1b5 with SMTP id d75a77b69052e-529a83a1c35mr88406621cf.21.1785161967897;
        Mon, 27 Jul 2026 07:19:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm48799633f8f.18.2026.07.27.07.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:19:26 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:19:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8750: Add Lenovo Legion Y700
 Gen4
Message-ID: <24pphoosegiuoyn7nvsf4jkdpb6dwafx5t3lqk5endu7chstab@i3nmri5t5pzz>
References: <20260726143048.130116-1-mitltlatltl@gmail.com>
 <20260726143048.130116-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726143048.130116-3-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX3F/voB1cFOd5
 VkeZy8d3iA0/GDt3w1gdxZ7WyuuQwTSuMMSU/Nf3TQXhT4vhw+/of6ErEHRJppdzytabpii5BYm
 Si/bYhduH6xVdWXpdgA+2EzCG+mh19k=
X-Proofpoint-ORIG-GUID: kll6S7kJvyNibsrf-KIAZe-O6aABSoRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfXy22e6mwu1NQr
 WAa67uwbcduRHiqxwK9LagJacNOc83ItgKHXjtBASSIBe60fuDO3zGIOnq6kfkyqa4RjI7TVabf
 Ht4qAxOx4vxW2nZnohNyxcsJszAeVwgBChBLQHQx1VfUCfnQKGvLrgu/EIkSuem5n0IMAiGGAFA
 4GXz6MtyPWLAJNotq7WCeJMD+Avk24C5wv2PR10M7kJXoZ4LOIV4jZGGzdyLZoQA9WMI19h0TB3
 maqpwKzfxlU8K4iJYZwDfXjyNMzZ6VP3mdt6vBNpuwGD+OxiF2DNYCPYkOzt7WecY54XVAdV7Tn
 /O0yVc6c1cGIpPi2hwmyo3fW7UKYaPut//+MXDJVlc0KuZy8p5VMridWGmtK7IE8JLLby4IvoL4
 STXzMwKbaPntBgz0S+qJluEHnAgQgVEYoVM/eRQycTxK9u1Z8dnuZBbmkDKPgsYH6PGdSdBIUyl
 owuBS4+emFKDQ9PYHXA==
X-Proofpoint-GUID: kll6S7kJvyNibsrf-KIAZe-O6aABSoRY
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a6768f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=0a5mqixUD4FKxXVXf0oA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270135

On 26-07-26 22:30:48, Pengyu Luo wrote:
> Add an initial devicetree for the Lenovo Legion Y700 Gen4, which is
> based on sm8750-qrd.
> 
> Supported features:
> - Altmode
> - Backlight
> - Battery & Charge (Full speed)
> - Buttons
> - Framebuffer (Require mdss and dispcc to be disabled)

And yet you enable mdss below, while dispcc is already enabled.

> - USB (Two ports)
> 
> Downstream supported features:
> - Display (8/10 bits) (Nowadays DPU driver is broken for dual dsi panel)
> - GPU
> - Touchscreen
> 
> Unsupported features:
> - BT & WIFI
> - Cameras & Flash
> - Microphones & Speakers (Downstream available, pending test [1])
> - Sensors (Downstream available, pending test [2])
> - Vibrators (Downstream available, pending test [1])
> 
> [1]: https://github.com/GUF296/linux/commits/codex/tb321fu-full-remediation-20260715
> [2]: https://github.com/linux-msm/hexagonrpc
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
> Changes in v2:
> - Add the dsi panel node, since the panel driver is upstreamed.
> - Use consistent name for fixed regulators. (Krzysztof)
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 1170 +++++++++++++++++
>  2 files changed, 1171 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index e05414290d8e..cb93708e0415 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -405,6 +405,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-rear-camera-card.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-lenovo-elden.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> new file mode 100644
> index 000000000000..c64a1d8c65c1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> @@ -0,0 +1,1170 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025-2026 Pengyu Luo <mitltlatltl@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8750.dtsi"
> +#include "pm8550.dtsi"
> +#define PMK8550VE_SID 8
> +#include "pm8550ve.dtsi"
> +#include "pmih0108.dtsi"
> +#include "pmk8550.dtsi"
> +#include "sm8750-pmics.dtsi"
> +

[...]

> +
> +	backlight: backlight@76 {
> +		compatible = "awinic,aw99706";
> +		reg = <0x76>;
> +
> +		enable-gpio = <&tlmm 88 GPIO_ACTIVE_HIGH>;

I wonder if this actually passes dtb_check. I think you meant
enable-gpios here.

> +
> +		pinctrl-0 = <&aw99706_bl_active>;
> +		pinctrl-names = "default";
> +
> +		default-brightness = <511>;
> +		max-brightness = <4095>;
> +
> +		awinic,dim-mode = <1>;
> +		awinic,sw-freq-hz = <750000>;
> +		awinic,sw-ilmt-microamp = <3000000>;
> +		awinic,uvlo-thres-microvolt = <2200000>;
> +		awinic,iled-max-microamp = <30000>;
> +		awinic,ramp-ctl = <3>;
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";

Commit message disagrees.

> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> +};
> +
