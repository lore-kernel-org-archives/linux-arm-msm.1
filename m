Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792624848;
	b=c2bWHuKlAw1ykevueMwD9yKaKeTCDbFFX8WfcRRnQ8TLaQ0flncYLrvcdxVO4SE6yi0R
	 k5W6owkJ7W72jBZF4Sz59zz8ncT8cigkC1fWPpTVh0GFnGl6mlBrDi+MIwyyHh/0Z2MqC
	 vfHg2hRS6Opv7m+1kvuvWaEuDsbgCUOFUPSUQRGv8SO4Wjk/AFIlLcFUCoIiqWXwmIlsH
	 2/Uc+K/U1lrN6qTcXu3lf0bbQ9NiOGZLh0BHn/CfjF1IumGFxlc031ddLcL/u8iSl4OYn
	 4bTsOiajSc68LfqWamptY7azF0KLuiJLyo9Vkp4T1u9qeycDR6zyE0uP5MW5QWVUhYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792624848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3/PkX2wBAHz4wgjVQm491Wme4i4LqDRLzwrJqI7Q9ZU=;
	b=PV9SVS4t6X5hp9SMx9yP+DFOZO5PWo+8TOPkLMTRnYS2HY+9oL3C62PAuoYYi5PxFm4Z
	 UfNQZ8tETIKaE5Sx36QfeZ0dNg1wfWq/u5w8p6uqcobGAfV3ZF4idSX6Gw9hxDXLMhQQM
	 mJJEj+AlXOA1CNg+4g+y9PYmaXoN7C/ZP5WxfMIwrknSw0NFVnckZTpkCFngkQ0380RO1
	 F3zKqKG7A46TIJqSnAySQ1mFKbfbUSaoFD8ENXcGCr9hzAQLLEQJlAi0W0zZffJIL1844
	 D4ujmevT/qSHA2aLPQhxu8+7ugF0C32D8TIVwLADyLnXRxToHDUrNBksGZCIPNMgPUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aoG5jBUt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fX9i7s3k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB0606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 23:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CB0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aoG5jBUt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fX9i7s3k
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeNJH207543
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 23:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3/PkX2wBAHz4wgjVQm491Wme
	4i4LqDRLzwrJqI7Q9ZU=; b=aoG5jBUtNK8kERS93tcIiM5kXorD1DsfgPMOmqxD
	pw6PESFbT7AhDZy3SiSjzaKWVkEgP8LObCyg9l8vi3XTJvkwQ1Ai0NTfrY3i1uoT
	b6ybuz7DL9SoB2KiWNFyM98Qp6wzp7lE7v2sRfgQZkq3p3/UysYffU/ipvwUp6Vb
	N2zlaov2+Vjf2YKxK3GvfeT47bCzP6dCrhYaY3FQwUckiL87nEggLfdeS/HEsLwc
	uQ7OEShk1wzsjG+kMLkumnu1lVbHk0ptrpwZfohvD/F6kS3YsWKrjI7monttrBha
	BIhX9efcZO+zNIDbdQWCQWV/vemHrDoIpNWDeLTH+8EuBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy7bf9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 23:20:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so225232985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792624846; x=1793229646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3/PkX2wBAHz4wgjVQm491Wme4i4LqDRLzwrJqI7Q9ZU=;
        b=fX9i7s3kG3g9Es1fckdmdPRGdgkvWuT8GGGsIm+YA4EgQzNRE7jkFrL5hGm3uISA++
         zD5Rwmz4b6LoAuMcA1p7oSi9OzovGfZoGpMDKDe2BPeU8bq0JsLJoBWmQZ2e7gePHFpd
         AkiRZd/8uID1uq1ZqAWybSOn10oh26XNpCR9XcicMbexvXELZq7sdD+o1UmMLpwB0t9U
         ggEDXVLaLCZoK0G76EVyExeNejX/FJ2/2qmLxJyPOvoZ095MDNT3wjuKnRT+GU/fFQpn
         NV0CoFpplkXTvDCYHbuBZ4F8QUgvemXuxGHb99PtC270xfLcND09hRXPv8FN5Mjx9aow
         KUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792624846; x=1793229646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/PkX2wBAHz4wgjVQm491Wme4i4LqDRLzwrJqI7Q9ZU=;
        b=dB9OBqDodAJdJaEv6i8I89O0tqVYeIJwhtBM0Y4+xeYQXpmLhS0Pxmgm1TEBThrZ0X
         BwMLrLKNzwYgw7bkPJwOFnJVFFqGVWXLs8/P2CNRlTqEqQloqZSQ2IZQE7QmVQ8DWeUP
         S9yLFdGIoX5pXVx8cmE8L9amsyJyLAE4769aurBcYLUsSJ/KFJizXWLbJKyGSYeC/tZP
         nC1tefet6Tr73JExk67y87BTIh377TrH6x2yloy3HY0krCexMfccV8Parh1nxDfhve/5
         ZLwHTqARY2an86xBwJLERKVdBVWe0ac7uiXIaqiLZ8MLmhEl7s0uCCC8l6+NpAZuhm+q
         21Og==
X-Forwarded-Encrypted: i=1; AKwUvBz0jb8Y+tHQAlYV+cHPk93CXs0YgVE2mIIGeixxIAbuCws9srbXLSGF/Vln1C0hdXLLfIwvyZps9KU60+zL@vger.kernel.org
X-Gm-Message-State: AFq9FYIZqYMvrW1l+lfxe6hv3IUHgL+rnHAbR6GYhJF03uaEE6mfjOl3
	CnP9SWqRlIe81dveRDIKn3DfuPCYoc0HGuc5uXPfU4mKTeWzMe8GfuaoFVsYdH4qOdS5rmWo++A
	QprCXdOw5aIzqA2zaomLU8zZpQeu0UYHw08wqg3LB/UnPMMn4Z7oIo1QdZ/Rk0vKZL0oG
X-Gm-Gg: AYBFou3Qc57Uo1X2bDLqVQ9ttDl5GVR9yC+5DZKCPG2a+aNIsAHDp2MSVkB1IHgRJdF
	CJrwTjfdMgdokIhxabtcEtHXPvmNWQ4SPrnR+/KrPaawWvlPSOVIOPcepitKcQ7EQbHFWcJcP2Y
	XJIXgML2n+z0rAyTE907U6Ek7jVb1qREzyIEac68tDGku4cXs0nvLewPPhHNxcRb6FxxCzcdoRb
	URbbPxMTSo0LW5B2LzOrtwmrxyw8hl/4MV26OcDJjhHTlEW6X3PRcgFzlZa3Ms9XDBgHVPtnO0E
	goSjgNpnw7xdVzbwMGcqok8I0RMvtL1l0InG+dVb+Oc1mj5FzosjIw5S1QZZqz6Q0aikMGQs2dY
	TByE/q0E3F+8B8218sm6wzPtlJTUZ7RNGfGCobaAXKmNLKLmDr7Sy2zxixg1oJdWEPxsMTl8o93
	gqcUYBlSpH+Kdq
X-Received: by 2002:a05:620a:19a5:b0:93f:2d52:613a with SMTP id af79cd13be357-93f57fa0c36mr725660785a.29.1792624846349;
        Wed, 21 Oct 2026 16:20:46 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93f:2d52:613a with SMTP id af79cd13be357-93f57fa0c36mr725657585a.29.1792624845701;
        Wed, 21 Oct 2026 16:20:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa45b4a93sm404364e87.20.2026.10.21.16.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:20:43 -0700 (PDT)
Date: Thu, 22 Oct 2026 02:20:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Linghui Wu <linghui.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and
 Bluetooth overlay
Message-ID: <3v7ya2xot7tjklzw2docgzt3vq2d2lwqxnaiux3ehjqg424rne@ealrgump25o6>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
 <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
X-Proofpoint-GUID: sG88eznmCqS2SbKEuy4OaTU9Xp03bbGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5MyBTYWx0ZWRfX/lLaB/sHU0Fj
 Pykxm5wMURsSpn13NnQ5tJW/FeVhDT2LZckTKh8YVpa5EBVllU1b4GAP/GnPezWvNKXm0KmizoG
 ax+QH62mfSSz2tzQdSBWa9QSISi5nCJfBdoukDfq9OwH3JgaQnhAxin1V8b9SpVQCUukMWxT52z
 4pEBcTj1RRSUZvbspSB3p3J2mmikPCD4PjQ51BZFhT4CmrVx+gy/r8aquuInf1UYs8T8tBFnKC8
 MyP/F/BQ0YVblVlZ/z8REc6p4o3jRezdlTfDuC+G75i1etD7vkgF/muYqMMoE1xmxzoVASTo5DV
 DC9Rv0vlQkn5LGkPX27EMyqbBTUIlXcYO55oQPdQzTmjAwwk2gVbzISDKp6OasPDQlI50hSbhtj
 S5h5z05b5uUdfL2yCkqUFMRvRcZBaMT853LkDytpDeirAqs1oHkScVbHjrcEgf1hNd5mhPx9sZU
 5hO22BQDanzM/dgmrdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5MyBTYWx0ZWRfX0mrcxK/tzmHm
 ZEFBVBot9uGFAlA9S42azslMMIngfV7aA1a7wiwh/c1enP4eQWAq6idDdPulVxHYpMZSGPJem/T
 WGqHVO6AVpL64bhJMsNU9jck14HPZVE=
X-Proofpoint-ORIG-GUID: sG88eznmCqS2SbKEuy4OaTU9Xp03bbGw
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad948cf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Wc9Em7cJ86xyjQT5_ZUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210093

On Tue, Oct 20, 2026 at 10:09:25AM +0800, Linghui Wu wrote:
> Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Qualcomm
> Shikra IQS EVK.
> 
> The M.2 variant uses the external module connected through the Key-E
> connector instead of the onboard WCN3988 devices. Disable the onboard
> Wi-Fi and Bluetooth nodes when the overlay is selected so the device tree
> matches the hardware variant and does not probe the unavailable onboard
> connectivity path.

You already got a question on GitHub and ignored it there. Why are you
disaling onboard WiFi/BT? What makes it unavailable?

> 
> Describe the PCIe and UART connections through the M.2 connector, the
> 3.3 V supply, the W_DISABLE signals and the PCIe reset signal.
> 
> The Wi-Fi PCIe path was tested on a Shikra IQS EVK with a QCC2072
> module. The overlay was applied, the link trained at Gen2 x1 and the
> endpoint enumerated. Bluetooth UART and HCI runtime validation is
> pending.

Please don't send unvalidated patches.

> 
> Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop regulator-boot-on and startup-delay-us from the 3.3 V regulator.
> 
> Changes in v3:
> - Drop the unused reg override from the disabled TC9563 node.
> 
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 105 +++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..799faa32e2d9 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -339,6 +339,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtbo

How does the Makefile handle eother dtbos?

>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> new file mode 100644
> index 000000000000..9496c6558eef
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	m2_keye_3p3: regulator-m2-keye-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_3P3_KEYE";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&qps_gpio_expander 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	wifi-bt-connector {
> +		compatible = "pcie-m2-e-connector";
> +
> +		vpcie3v3-supply = <&m2_keye_3p3>;
> +		w-disable1-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios = <&tlmm 60 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				m2_e_pcie_ep: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&pcie_port0_ep>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				m2_e_uart_ep: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&uart8_ep>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&{/wcn3988-pmu} {

Add a label to the PMU and update it by label rather than by the path.
If the path changes, this node, I think, will happily create a new one.
Using label will generate an error.

> +	status = "disabled";
> +};
> +
> +&i2c3 {
> +	qps_gpio_expander: gpio@3c {
> +		compatible = "nxp,pca9534";
> +		reg = <0x3c>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +};
> +
> +&pcie {
> +	iommu-map = <0x0 &apps_smmu 0x0800 0x0 0x1>,
> +		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
> +	vddpe-3v3-supply = <&m2_keye_3p3>;
> +};
> +
> +&pcie_port0 {
> +	compatible = "pciclass,0604";
> +	reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
> +
> +	port {
> +		pcie_port0_ep: endpoint {
> +			remote-endpoint = <&m2_e_pcie_ep>;
> +		};
> +	};
> +};
> +
> +&tc9563 {
> +	status = "disabled";
> +};
> +
> +&uart8 {
> +	bluetooth {
> +		status = "disabled";
> +	};
> +
> +	port {
> +		uart8_ep: endpoint {
> +			remote-endpoint = <&m2_e_uart_ep>;
> +		};
> +	};

How does the UART switch from the onboard WiFi/BT card to the M.2 slot?
Is ther an automatic switch?

> +};
> +
> +&wifi {
> +	status = "disabled";
> +};
> -- 
> 2.43.0

-- 
With best wishes
Dmitry
