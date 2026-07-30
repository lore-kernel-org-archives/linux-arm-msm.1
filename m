Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DA2397925
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427282; cv=none; b=tRKJNGyVAti49sVcuy2hUrraGQpaBZd0uNgkhLyU7a+W2mLR3QIFUzQr3+njAUF48IgITfaeDPINFPDDPa9PCQabLMo+jW/KrVg1klemqyyT4URqGu6oz+IVUlyOl4pEKGyk/w+DH5xXBFfMamk58TveihM4tdg6M7iKbMOMm5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427282; c=relaxed/simple;
	bh=giKwvRI8qxVC7rCJ6Z/KGynqwYL6qShpon0w/eDXYXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmxyqnnsyV+k4P+0zje/m+h/P+pkUC1hbVvvJKTVj3xYgi7mNvoZ5iDDl8GuI0WfSnbB90WKNZcfKXtM57GY62teUkrKN/lmPfmu6OuuRvVOYBFC0XSntfDlH9tCz6j3uuT32eRtM/XOMk5SLO6Tg2aeFCFpOEavwIIKf6VNgxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYjTGfFn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPEID6TE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYjTGfFn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPEID6TE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQov12401496
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M9+P1xkDs6ffjkHeEwyvoyg1
	dXyOKoXHj7QXs/dq5IY=; b=MYjTGfFnI56GXXWfdYn6ACvVBgRmBx8Wxef2qfK5
	V6v/JU+wapIWKFUQeBDbRk5WdgGLrUgQ57fL+hkOgqc2xBJjtNQGXDYSEzHgdcCc
	+a71hQqIjvEArClFD4QzqQVUH87+j4Au/yVHcKNFLw7NmrZoZmFFixWEBXj8ZwHN
	BBCFaLwqj4jRuX5Qj7NjuQjurrX/k/+P1Ds2OcWf9W3iTNHLgJ1meCWCbriH0vWY
	AyWz06bIb0evP2YY4lQSdvlcVsClcn9I+F86kyQ675PtUOMrpSwOhj5AJQcYGK4m
	+gS7YhVXeJnAvOty/mnqn7Kg4y0j6yIxaLO2iTlY0HkONg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8168n3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:01:20 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73760a7cd83so1396137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427280; x=1786032080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M9+P1xkDs6ffjkHeEwyvoyg1dXyOKoXHj7QXs/dq5IY=;
        b=gPEID6TE7VAZNl+h+TLrGTtskOYGgQmMGR4rj7Dj526bKLIjvKu0hZ59+NAqE50Gve
         JEh2UXi7uJnfPyOwOzQLut1PX8qba83T9g0sS/Dne500jPsikguwm/mw88P73Hhyvnw4
         /J9qTC3+YfmVcFcQKQebj1JtwUeML4CisPU0lpo9+vGxuNqkwwb6Im3CRvyKHR8J2vbu
         9fXW4RicWq8qJm2xrKrexbRyNaEqn+akKkfTqyPP7rdo4P2rGJB0mNLcmNulbL5grYUZ
         BNjhmGYl02MZ5uQjPW5d4D1Qdo4vi5E07afk2TVYwSK+EjnlNG2k2FQc+Db6lPecZvJh
         zahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427280; x=1786032080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9+P1xkDs6ffjkHeEwyvoyg1dXyOKoXHj7QXs/dq5IY=;
        b=TdW1X2J3AUM+CFWWhE0Dq0nJbLFFb2JyXc4FFaM1rQaa5jyfXNm2Jz06/icg5B/WxP
         UXu4BAxu2JuvBj8RavC2ygSJRXpcR5RMMI0tWTbO5mt7uBx7Bi552xzs7yMWgtZ7PKBl
         PG2QMI1iqEoH1/tJ/YUgwEYo+/ceeNrPUWV6xGz4Ou5flO+qhK4NxkrZCEbYbs2dwGwe
         3pQmRPcL731uR5amVO2JIDjIFBsFklPhWW3toWgz5doT7lOqHNcPvymi68+pDBoPJ7gB
         bsL3UTz3HEH2waKhjTog2IWg/omnzk1UTah9MZ5lq6pSCMzBZxVcv1j7jBUYjECknU1E
         ydrw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8gkKoAVEAk+a7WilqBHHKP/0D/j493OpQZetsk6v1i1DoW5ZCXnzx2HVaL4YoEDdaCaQ1nW3k8oUX/KP4@vger.kernel.org
X-Gm-Message-State: AOJu0YxdmZ/lgF6yGaXFE5nI5xqdie+SsLCy45NI0VYVGCJd/eq/Q76e
	x4w+FYkIvBewswQO35FqnnLc9oxd5VTcPqfJFwO4mL8T2oHrk70Y0AhmSwsG8GRrAwHkGOvQX4g
	4Le/dhOEJQJdfA4ki4IvkPmWfu54nAaMmtkZlmTJBQfaxBuA9QMJPMkUHgMW4oYf7Jp1d
X-Gm-Gg: AR+sD10kNe/ObeFmlrj10j5BFA+MSRhkLEco5eph2SfxUs9fe5loaZ73xmFGlGCHutX
	NFyzuDc4IgGzxlI+IUY1U5B6iv3RDnw3lNDPNY+4H2cF/gVUzdduSHXmPkcB885z3oLr5Z9wqqw
	T6rrnpPy+f2fWmB89hkHoi2GFhC06aBG22PnqLA0RmQLbdTzjugK7pvI1hWL2pw4Z1NnhnkXFvy
	aaEBX5ICs0r+h8BsvcrCqlslWyd6luomN+e8eAX9JHvOFyIetvflc2Bhw6luJbZecb7n7cLjEs0
	lVInpw33FwRaJzwaQtjJjBOVTTF8mQsckMVlRBHEhmU/tS9sSfiuaNLwM+z8BNWPtosHZ5NDoJ3
	LibqqytFgl8hZhGG86ng9+Stm2i1tM+VTd+BGnHR/w5rewD3DfGCXj8twKZINCyF5lz8w3t5p9M
	J+XE9bLC5OQecs/g==
X-Received: by 2002:a05:6102:290b:b0:756:32ba:1a87 with SMTP id ada2fe7eead31-7574dcc38e7mr1247117137.1.1785427279259;
        Thu, 30 Jul 2026 09:01:19 -0700 (PDT)
X-Received: by 2002:a05:6102:290b:b0:756:32ba:1a87 with SMTP id ada2fe7eead31-7574dcc38e7mr1246612137.1.1785427275568;
        Thu, 30 Jul 2026 09:01:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm450733e87.45.2026.07.30.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:01:13 -0700 (PDT)
Date: Thu, 30 Jul 2026 19:01:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX3ZILYzbbuczv
 QkwS7tl9nA6ZIatJDVLIvkndZ2FmJld4nTsoI6ljBp3U43b+l7WZ/hcvveIR/Yn6wF6JKVikB9G
 SbJFjPcC+EqYbm7oPXt/Ghwvdgpt4TR6bX60IbLKKLpdWZ/aEZP6iWmJ0FTfR9GT4SeICtLYlps
 tqsf7TWC0E4XDoMisPgz00UHXHUhjAvvgJw6Ruon1y8qSegXOBhnSNGgvII0z90J4vdiSF8MXsd
 B6Yztc2mwCI97gx8w7cPCSXw8rkbgoCHx3Efei2Ln1AzUjVqWE4ZyTvPtabQB8n28UiiD14XsI5
 tH/Qx4o4LlzcIH7Dy+16u7KI9OY7tfKTq4YZ4/2EbmT11mv7lNYHzULaY9TWzR0imAJcSn/7kp9
 GDa8o0feNfGZtSyUI1Nt7phOvUmGo4CTGHXzF9OxhzGpmWc9CmLpXPkGIugeeLunkTIM6PxF7LU
 0O3UMEEVhW73BGKfvvQ==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b7550 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=9uBV4kYI648O5uXVwFYA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: bN2EmqV2nWqjqQL1B2JSVV5SNgokqaNt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX04KnYG34Cfhl
 lHhFvs0l/uvyZgH5UvyaAu4ESnGQhZWzliMou/7ma5xRsK0aG2bYx5mU0/0AXP5KUzf04GVhaLy
 Y97XpY86A+3YNEGgrBF9n8kmwECRSz4=
X-Proofpoint-GUID: bN2EmqV2nWqjqQL1B2JSVV5SNgokqaNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120

On Thu, Jul 30, 2026 at 06:05:24PM +0300, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SM8250 device tree so the
> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f11da2ca4181..d42b29419320 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8250.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
> @@ -4486,6 +4487,77 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		jpeg-encoder@ac53000 {
> +			compatible = "qcom,sm8250-jpeg-enc";
> +			status = "disabled";
> +
> +			reg = <0x0 0x0ac53000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,

Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
please drop separate mmcx vote here and let it come through the
titan_top (it might require camcc driver and node modifications).

> +					<&rpmhpd RPMHPD_MX>;
> +			power-domain-names = "titan_top", "mmcx", "mx";
> +
> +			clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_JPEG_CLK>;
> +
> +			clock-names = "sf_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "cnoc_axi",
> +				      "jpeg";
> +
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "sf-mnoc";
> +
> +			iommus = <&apps_smmu 0x2040 0x400>;
> +
> +			operating-points-v2 = <&jpeg_opp_table>;
> +
> +			jpeg_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <100000000>;
> +					required-opps = <&rpmhpd_opp_min_svs>;

This looks a bit strange. Are you sure that PLL levels match the MMCX /
internal clock levels? I think you need to vote on both domains.

> +				};
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <200000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-400000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <400000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-480000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <480000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-600000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <600000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +			};
> +		};
> +
>  		camss: camss@ac6a000 {
>  			compatible = "qcom,sm8250-camss";
>  			status = "disabled";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
