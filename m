Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54583EDAC1
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096826; cv=none; b=IGgZEtcNDFVXZ4fvjgwOsC5X3R6q5ztb1n2EW48IxITePAj0NB+n8mltC2ZH3C7T91khAayRBBdPESLzKvd+vfh2QyHyM0i7onx0z//nfpgMjeYicaTneEfHnFaofa/bDy7hFA9qc7Ersi/Gv3nUtB0JKiO0jqxlLzTAMnW9AOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096826; c=relaxed/simple;
	bh=WtHdTNpfeybQTFFO+SsfagxgmNRuCkQfaDBWcTdtgkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ol7Yu7xKVnkqEGwnmF9px4PihspYLdSNRWh3Tn7cdeCpOwITOtcZS3JllMCthByLRU+70DvP7Psg8s3QeC7K8fPEO2QAvg/3Frzmxd8d90xduCVRU6Mdhwz2JTq/YJzVMoH7aShX2CdX3OtCdl+p/vjpB4npmQdqH2g8DtZNono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNOyOfMG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qz3zugKT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNOyOfMG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qz3zugKT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777pcZv3566437
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 10:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGKn1DILuG7ma71txyhNcdRz
	GhpuhA8J7ogopq81LCc=; b=HNOyOfMGkj3zmHl7LGswRXtRpkYeG8G5zTtFJ4cv
	Yd4Bl9PwmfLXtB4gGgFNLRHI8MMH5qv1WpXopxAfAmuFDYFDkyDEI1cQIcDYtfNr
	uPr58DiAaI6PeAslpFIhMxTj9bzZ7iE6pShq32c70VpFKwec6mbgCuyiwPisoINB
	qwmUjfeMlv6U31bqnNM+P7pvmuo0e6+FR4FtaG3cqnsyhBOMPZdMYU1PQH8w9dSj
	VDM3DlWGmx/2ezaeOHB0+a4aiyzrFQzWhe7dOI3k8Mze/h2hG1z8weKVmPePe/Ky
	K3Kx90lck+ujArddLo4Y8VNTyc4GU305+UrkazwFJLvBVA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6ju8q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 10:00:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e024d2129so5554971b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786096823; x=1786701623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGKn1DILuG7ma71txyhNcdRzGhpuhA8J7ogopq81LCc=;
        b=Qz3zugKTBY0cbKVF79ud0+VGOgjWgmTI9HxNkTm2i0d/cp8wLYI8huImMF3AiJ0zqX
         wpMGcs2/AgvSVxR95r6ic/d0ZBSAjYoy6oLBQkBen2sTQY7Nm32KUELpMxBK6kOdE6Qi
         H1T0C1Tn5uvtVhwPa7JttB1LbZEo5oNS1jf6prYHqUF5abUKuKFVkSfXSBmh6+mJKjlz
         IkmPdVtSoP7UO2LQi8CzPv9hO2o9JKEGGuv758AuBsQs10TZ1ziHMR7PbdnWxsCAPzyW
         aoKF9KxtkV0qndc1TodktW9+V0bUPoxNTGKpP2qoDkPG+2EmeoKodOSAZMctI4sOAJ81
         q0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096823; x=1786701623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGKn1DILuG7ma71txyhNcdRzGhpuhA8J7ogopq81LCc=;
        b=ErjEd2AgAKwp4nm5An/3nzPIS1/ozMmkRw5CfjYKPYdRTJOFVs2GF6EYf8AxQAll0G
         ceJw6D89PFOnDyMSmlqcHWEcyEzZYlMb4b6GzZo45UQnk25sde/ROLW+Q0D5UUo7LWzz
         zOJbnU0ZYs/W9PW6ev4L0cQjKyHwZO0wvFPgu4muTuHI+aCkwi1pJjbdNAQgVO2gSNIL
         /Tuk/cx/ogZ6WlcfXdoQA1wun3nuZQzNr0KnqoSn7yJmSlfV9tLsqwUoWt7lV0ItWYdV
         5wsrw+oMqykPnSuKkWepRE213EnwmcskHQ2kPs4uECHLDJfjkUs07uw+rSsUVXP0tSnD
         apgw==
X-Forwarded-Encrypted: i=1; AHgh+RqWeiiDb6uWOuKAEYhhPsOBISXqYobDjh2acU59PsjXwc5mHhoY+ojV+N4r6UhqS6RamZ2M1KAEPm5sts4U@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjg6LubcVQt1j0sGk59ysiee0VmOLa5aM30uPGrHP8mdl5qZs/
	MW/4MNvYbvtLivNRdtaq59WB5Bnjl/SGevA7vKk4UsticNTYkaVnqGiy/i5QTzsIqkOgRb+CnpM
	CRjmGGWD/NNYkgfbJXA9vQ4+UOARYzAwPgJp+UqoHSOv3Vcaam1nBk1IKycB2TF/FxlqK
X-Gm-Gg: AR+sD11pArFSaf2u3lBpJN2lLD+rCZq3dTUbji4gDS556Rvc+6FaJxK+YMCnrfrHuX2
	x57ZnrW0y9HA2GRnYPyVijLroAupuJRetNlxhNWPyVJW8Jv7pjMfcqGZGKHcdOFEUOynwM9/nlM
	2ktdoMsdjuELNQPYXRcWemzI24Zc+oHfiF0qag/fuYusUz4d2Psq+JIuPfxZTJk6rDzokrPaHJN
	/3wkeS0ZOPmwG/wPgVG9wMiORwkUx9s1AcMEke4jDxGrO6bQpwJvhw3d45KF6TP6TLktvDVRwmk
	XZRhlt0d3gAAGIKEKyxGfrimEwp9HfwJ9CJ95atYOvOcD4sbUxq/JSmawSlosyF6cxMsMu4GO//
	41VpEiU8mnSdDnbt1xIFHzV8OrxA8vN//
X-Received: by 2002:a05:6a00:b42:b0:84a:29a7:f64c with SMTP id d2e1a72fcca58-84f5dca8597mr2636026b3a.0.1786096822904;
        Fri, 07 Aug 2026 03:00:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:b42:b0:84a:29a7:f64c with SMTP id d2e1a72fcca58-84f5dca8597mr2635471b3a.0.1786096819702;
        Fri, 07 Aug 2026 03:00:19 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3a0f8dsm797513b3a.12.2026.08.07.03.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:00:19 -0700 (PDT)
Date: Fri, 7 Aug 2026 15:30:13 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anUgxo3BPt74Wx7K@baldur>
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a75acb7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BsdW2ZtP-_8tOCGcOUcA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NSBTYWx0ZWRfX79kRetZ1ajSL
 eS2V5ocs01LCz+a01O4Hzn4h6QQkUq0DYZLMvqK09FI5/FHe66bXMnA17uVLbYVJ03kF7JyreAE
 MokBiuKDV6Zh7qBGHbNCGT6L+JR2WyUZWsKBO8e3QFfBoo8XlXP0LHyJYinJvL2C/ECufzKukfC
 yTgnpEVAq+i34ISjsF+djG+NHtTJIZYvpaN1HAb3kS0ZnzIWPSueO9MgXoA6duc7S8SSbWIH7/h
 KPx4g1T2SMEhuKcl30kQS5Z7JRDzXIblp2KGyXGRNi42u6lXsqsJ5xI615V4ELOxWzjXgMTCfgL
 p+yENliWgh7KXwSgRyhl3iT9NC8RSf4WeIsjmB/7H3rppKZbHc0YzWfHrurM005dlZVXA7N03da
 O6z09MU/9/6ioPYsLH6WpjX2lCjB/PcIBmbx6YGDk+/3NSK67LOoSuKx/jeo8zG745/93cbMtKC
 gm7PZPEds5m2iw4COMg==
X-Proofpoint-GUID: Gs7oVQmlv8Df46tQzkGz25REAfRyzxkd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NSBTYWx0ZWRfX1rRz1TqugRe9
 HdGZwsmvLQ+IDCfBULgGldygSTSWOU/vzBHn4ocAgXDn+lprRgKn2F2Mk0GAC2D8MQnw7Tz0zR5
 tU3Umxd0pod4/Zsg1alsvmrODmDu0kw=
X-Proofpoint-ORIG-GUID: Gs7oVQmlv8Df46tQzkGz25REAfRyzxkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070075

On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > Move the eDP panel configuration and related power, backlight, and pinctrl
> > nodes into a separate overlay. Keep the base DTB suitable for headless
> > variants and provide a composite DTB for headed variants.
> 
> To quote:
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
> """
> Describe your problem. Whether your patch is a one-line bug fix or 5000
> lines of a new feature, there must be an underlying problem that
> motivated you to do this work. Convince the reviewer that there is a
> problem worth fixing and that it makes sense for them to read past the
> first paragraph.
> """
> 
> In fact, I'm not even able to guess what the problem you're fixing here.
> 
> Regards,
> Bjorn
>

The problem is that the base device trees currently describe the eDP
display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
are also available in headless variants without an eDP panel.

With current base DTBs, headless variants are not stable where eDP panel is not
physically connected with board and userspace is trying to use it.

This series fixes the inaccurate hardware description by keeping the
base DTBs limited to hardware common to both variants and moving the
eDP-specific nodes into separate overlays. The base DTB can therefore
be used for headless variants, while the overlay is selected for
headed variants.
 
> > 
> > Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile               |   3 +
> >  arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 126 ++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
> >  3 files changed, 129 insertions(+), 107 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 1c86e7e98f55..bb0da34983c8 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -20,6 +20,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> >  
> > +hamoa-iot-evk-edp-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-edp.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-edp.dtb
> > +
> >  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> >  
> >  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
> > new file mode 100644
> > index 000000000000..759d05342627
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
> > @@ -0,0 +1,126 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +&{/} {
> > +	backlight: backlight {
> > +		compatible = "pwm-backlight";
> > +		pwms = <&pmk8550_pwm 0 5000000>;
> > +		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> > +		power-supply = <&vreg_edp_bl>;
> > +
> > +		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	vreg_edp_3p3: regulator-edp-3p3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_EDP_3P3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&edp_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +
> > +	vreg_edp_bl: regulator-edp-bl {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VBL9";
> > +		regulator-min-microvolt = <3600000>;
> > +		regulator-max-microvolt = <3600000>;
> > +
> > +		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&edp_bl_reg_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-boot-on;
> > +	};
> > +};
> > +
> > +&mdss_dp3 {
> > +	/delete-property/ #sound-dai-cells;
> > +
> > +	pinctrl-0 = <&edp0_hpd_default>;
> > +	pinctrl-names = "default";
> > +
> > +	status = "okay";
> > +
> > +	aux-bus {
> > +		panel {
> > +			compatible = "edp-panel";
> > +
> > +			backlight = <&backlight>;
> > +			power-supply = <&vreg_edp_3p3>;
> > +
> > +			port {
> > +				edp_panel_in: endpoint {
> > +					remote-endpoint = <&mdss_dp3_out>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&mdss_dp3_out {
> > +	data-lanes = <0 1 2 3>;
> > +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > +
> > +	remote-endpoint = <&edp_panel_in>;
> > +};
> > +
> > +&mdss_dp3_phy {
> > +	vdda-phy-supply = <&vreg_l3j_0p8>;
> > +	vdda-pll-supply = <&vreg_l2j_1p2>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&pmc8380_3_gpios {
> > +	edp_bl_en: edp-bl-en-state {
> > +		pins = "gpio4";
> > +		function = "normal";
> > +		power-source = <1>;
> > +		input-disable;
> > +		output-enable;
> > +	};
> > +
> > +	edp_bl_reg_en: edp-bl-reg-en-state {
> > +		pins = "gpio10";
> > +		function = "normal";
> > +	};
> > +};
> > +
> > +&pmk8550_gpios {
> > +	edp_bl_pwm: edp-bl-pwm-state {
> > +		pins = "gpio5";
> > +		function = "func3";
> > +	};
> > +};
> > +
> > +&pmk8550_pwm {
> > +	status = "okay";
> > +};
> > +
> > +&tlmm {
> > +	edp_reg_en: edp-reg-en-state {
> > +		pins = "gpio70";
> > +		function = "gpio";
> > +		drive-strength = <16>;
> > +		bias-disable;
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > index 9fa86bb6438e..78cefd5391b1 100644
> > --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > @@ -19,16 +19,6 @@ aliases {
> >  		serial1 = &uart14;
> >  	};
> >  
> > -	backlight: backlight {
> > -		compatible = "pwm-backlight";
> > -		pwms = <&pmk8550_pwm 0 5000000>;
> > -		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> > -		power-supply = <&vreg_edp_bl>;
> > -
> > -		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
> > -		pinctrl-names = "default";
> > -	};
> > -
> >  	clocks {
> >  		mcp2518fd_osc: clock-40000000 {
> >  			compatible = "fixed-clock";
> > @@ -213,38 +203,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
> >  		};
> >  	};
> >  
> > -	vreg_edp_3p3: regulator-edp-3p3 {
> > -		compatible = "regulator-fixed";
> > -
> > -		regulator-name = "VREG_EDP_3P3";
> > -		regulator-min-microvolt = <3300000>;
> > -		regulator-max-microvolt = <3300000>;
> > -
> > -		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> > -		enable-active-high;
> > -
> > -		pinctrl-0 = <&edp_reg_en>;
> > -		pinctrl-names = "default";
> > -
> > -		regulator-boot-on;
> > -	};
> > -
> > -	vreg_edp_bl: regulator-edp-bl {
> > -		compatible = "regulator-fixed";
> > -
> > -		regulator-name = "VBL9";
> > -		regulator-min-microvolt = <3600000>;
> > -		regulator-max-microvolt = <3600000>;
> > -
> > -		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> > -		enable-active-high;
> > -
> > -		pinctrl-0 = <&edp_bl_reg_en>;
> > -		pinctrl-names = "default";
> > -
> > -		regulator-boot-on;
> > -	};
> > -
> >  	vreg_nvme: regulator-nvme {
> >  		compatible = "regulator-fixed";
> >  
> > @@ -974,44 +932,6 @@ &mdss_dp2_out {
> >  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> >  };
> >  
> > -&mdss_dp3 {
> > -	/delete-property/ #sound-dai-cells;
> > -
> > -	pinctrl-0 = <&edp0_hpd_default>;
> > -	pinctrl-names = "default";
> > -
> > -	status = "okay";
> > -
> > -	aux-bus {
> > -		panel {
> > -			compatible = "edp-panel";
> > -
> > -			backlight = <&backlight>;
> > -			power-supply = <&vreg_edp_3p3>;
> > -
> > -			port {
> > -				edp_panel_in: endpoint {
> > -					remote-endpoint = <&mdss_dp3_out>;
> > -				};
> > -			};
> > -		};
> > -	};
> > -};
> > -
> > -&mdss_dp3_out {
> > -	data-lanes = <0 1 2 3>;
> > -	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > -
> > -	remote-endpoint = <&edp_panel_in>;
> > -};
> > -
> > -&mdss_dp3_phy {
> > -	vdda-phy-supply = <&vreg_l3j_0p8>;
> > -	vdda-pll-supply = <&vreg_l2j_1p2>;
> > -
> > -	status = "okay";
> > -};
> > -
> >  &pcie3_port0 {
> >  	vpcie12v-supply = <&vreg_pcie_12v>;
> >  	vpcie3v3-supply = <&vreg_pcie_3v3>;
> > @@ -1140,19 +1060,6 @@ led@2 {
> >  };
> >  
> >  &pmc8380_3_gpios {
> > -	edp_bl_en: edp-bl-en-state {
> > -		pins = "gpio4";
> > -		function = "normal";
> > -		power-source = <1>;
> > -		input-disable;
> > -		output-enable;
> > -	};
> > -
> > -	edp_bl_reg_en: edp-bl-reg-en-state {
> > -		pins = "gpio10";
> > -		function = "normal";
> > -	};
> > -
> >  	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
> >  		pins = "gpio8";
> >  		function = "normal";
> > @@ -1181,13 +1088,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
> >  	};
> >  };
> >  
> > -&pmk8550_gpios {
> > -	edp_bl_pwm: edp-bl-pwm-state {
> > -		pins = "gpio5";
> > -		function = "func3";
> > -	};
> > -};
> > -
> >  &pmk8550_pwm {
> >  	status = "okay";
> >  };
> > @@ -1357,13 +1257,6 @@ ec_int_n_default: ec-int-n-state {
> >  		bias-disable;
> >  	};
> >  
> > -	edp_reg_en: edp-reg-en-state {
> > -		pins = "gpio70";
> > -		function = "gpio";
> > -		drive-strength = <16>;
> > -		bias-disable;
> > -	};
> > -
> >  	eusb3_reset_n: eusb3-reset-n-state {
> >  		pins = "gpio6";
> >  		function = "gpio";
> > 
> > -- 
> > 2.54.0
> > 
