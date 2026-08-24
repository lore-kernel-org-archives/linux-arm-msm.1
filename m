Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331BC34C83C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561776; cv=none; b=kfKvFv0DTu3F3eb7lK3Q3mwIKwyKUgbJZdZMPsSgKhNtYm3z47jtYThAsRed199Li/ZL3LoEhwnttrQLqffIV2BXi3CPBJ6Q78pD5A7d3Y1zHl+mAmPSERHM55L38G0AOWsWt5jeLA1vPb0iQFtBIB6vFjUrzmif7SRpJeLTnmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561776; c=relaxed/simple;
	bh=9QoRTXvi5xZMB0EtZGs0HThpzohwXZKwlo3LdSoKQ3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwtHuNRy5iytJORK1j2OE1iGEl/yQXGWD0GBkS+ww3bZFPnkt32OLPM3YC9/QTA+n+zWdMUjA93aiCqkGUk8ktMrwhIi5+2KYccfsAUFCeEs2tYRVRAVyBTkl1f/EmoynyPDmRcXEpPBb1V6LkGacYCtz2mgEACRV4lpZIKhvYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gV4lLQh4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCVGDkvU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gV4lLQh4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCVGDkvU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O6SeOL1982510
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3cUegRrh4t97vcHkq3HjcZXrnZyd5PTScL+jJc8i9fc=; b=gV4lLQh4ZbrWe6Wo
	Q7IaEn9Zri92+FgN0lSM7Z5fsebe3phgv0oT4aKLCRjnd2qHW2TLPtrWeYWrv6AL
	RtRIEXioGOSD6z+2BSynBvlB+86UTBthgmqsM71MOUjnGmbyMVdlrvkh92KvHwLG
	2B+Vj6XnMSsLLEtM/pPH6V2QaWqm+JXuAW7g6dFEfc5wBLPbsMrz0/RqCzirqGub
	jkfSFU+dr0K98IDxJwVbhzQ1NI9xRrXg/X3VGZWkfTBF6BRj3Ht+DRBNLnwgCFKi
	TybFnK97tjlC6JmrkBQeOOjPzWx0uowtHpxU5KppQf1UgWHT4AzrDoycgz49Dyqd
	Y0IJ/g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn8m98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:56:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-756fd28d906so80741137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561773; x=1788166573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cUegRrh4t97vcHkq3HjcZXrnZyd5PTScL+jJc8i9fc=;
        b=NCVGDkvUQ0/KPU/Ot4NC31+wj608NZHXDEJZ2eL9hK5V6VICcsPJRiQXcj5BW0NN/F
         +aYQVGTswvERmKgKsOrr0RwUY3H7C8wtpKBif+EfgdFh7OTT6+6WmK8X1VHFebxfgtX1
         SkKe16yWWeDNGcuwf+BlQGi5YLSLQPvlvF7pkr7Tn/T0+3YTSon9qoJw5CQhSjejUQDF
         Ohcz0hrkDNRtzwJzd4go6icM30e7KGZ3dj6O/N6JyFK8DDGokOvp92zn0IamcNhlFdIp
         VnOynKXp7AmalitIYGNwPb9oD+YImRZ9tC7jP7ZpI7OvbTCNFWY06g0/MDke+EL6I1tl
         YTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561773; x=1788166573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cUegRrh4t97vcHkq3HjcZXrnZyd5PTScL+jJc8i9fc=;
        b=akMv2I/1qkHqwg5gGBAZIS5xW59bAiDSlp9S7jxjXFGoYlMaNC3DU/wbl4OVv4jO4t
         /9XwUKOTYsqdLmPqexcBWxnK0rWtJVfWVMGs1AT/6aZjL4TqjVAKU1JBN9NqTIVqTSL5
         J29JYjuXkKSsky0FGIXo5a29AwrLH7++sJO4ik6HyKgc3CgR3t+2HI98C7V7vD8eVOrY
         TBPI0RnPOcqFQ3AMuwpmaDmSPwd2iW1zPlN/5MrQPyMIKeb2zEQ4vzd6yAFaSDDocLI7
         Djk9vPlN3uP6/z75fg7hsE2nix7MBmI5RukGBBPAOJ+fgFYET+/Sj1QRC6kjavOHweTP
         BtVw==
X-Forwarded-Encrypted: i=1; AHgh+RqcWA0yj/B23mEGmxj2J2h39fIave3mHIOd0kwSXO2/8N8SFkWaGJLtlJTrAvwjDPUiZpqDu61adfKQxCnP@vger.kernel.org
X-Gm-Message-State: AFuF++kDmSGxQDKcIsGSC7FXou5sm8rk731YPbmix4VqhJHE2YT6xA2h
	yaHjfw9jKZtlo5ivV6u6YrygYvUhXyorlwVb9scWakRDttlyhA97NYM+gfvtQSR/Ya60am0oNcd
	uw3hSRRieurDeoCUJL/45XGfMrAyKIok9y1GVH55u9jdT7femaEG33FJWlnGqTAMAiyQT
X-Gm-Gg: AR+sD13XTwPSG3+gK+q/0ffokuPFyT9eKPi6sfTj4XMmFibmLyY+3Viazj29evZsBaP
	AY1vETc6+L4JBy+DCAnKT5ot+Tp68kat87SfDPt3tTq7chCDnOp4Wa3FI1Rg3ivgkeGxMssu7fV
	x/XELgCmbzsMeWPjnXiYEnctg31S+BrKNB18TgTUYpxdRQS5OyvMfwWo2i2woqnBaNTEyNyS24U
	t5oq0cVXSFqNHrbkHlbAJHXk0jxCK6Pae9Oc3/RbGlXt7vayoldWZ59TT/4sXOxYwqnBuAEF/qX
	YRjcQDPC6WvdmdPIhqqc/VPeZhas5Rn2/dqzcqLjFw0yNH7VuOFl4f6/QkZZYceQDgah77lBGVa
	x+3Ip+Wz5tTyiDjVcQqm6aEJc
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3278088137.1.1787561772882;
        Mon, 24 Aug 2026 01:56:12 -0700 (PDT)
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3278073137.1.1787561772378;
        Mon, 24 Aug 2026 01:56:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1ae4efsm6945619a12.21.2026.08.24.01.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:56:11 -0700 (PDT)
Message-ID: <57c9495a-45de-43d0-8ab3-4dc8f42712c5@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:56:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: Add SM7250 devicetree file
To: Sreeshankar K <sreeshankar0910@gmail.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org,
        ulfh@kernel.org
Cc: bmasney@redhat.com, radu@rendec.net, abel.vesa@oss.qualcomm.com,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
 <20260821154030.2514-14-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821154030.2514-14-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX062IzcwIMF1g
 235eI1R3Z2Vh+Yp9Yii1G4MDNiWD/rE+mKkPhnZmKrPbvFS9tHVznqL3eA4I+miHGoeL4nr/FQD
 4mAGMxnLwTWnEtZ7dza+tNx0evPK0YQ=
X-Proofpoint-GUID: MLidN1l68BDwREDVJd4QBIJlN0t2VggS
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c072d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=7WNnuz4HuO7MmHYjhCwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfXyFSdCrMccBV6
 k5GpmjHBf6Ow1o5bWYu25VEKecwr9c0aEa+HE+x0sd/F8RSxeJ6AAkvqPY9mkGu9v6xBgfngAMH
 dZf8OJ4LdW8fdMQmJ6ss0xBDpuue2dQKi1pevTOsJfVhreKe2WRANKfmpS99LIvB18+E5sWGi0h
 e+xMxticJ+wpy2yiK5DbqJwFdkcU2aC9mK8t9bVPeeaAAp1ILZOZb3CO2XaCuB2ulgoBtHYWZWS
 hUCmxXRgJiWZ5PPRuWoXUK3hZlPn1FLdiOT1d2MbGJpHi5nb3Aazen4Cmlhw0Y6fkL15xD/XkS4
 q0sGEGQdNi+zD+8CVN6D1SCtiGn7x96m1BGUVLwX4z6mdXZKCmxIE4A1CjELklfhhgRByiIRvgi
 XtJTFAldQW4HfgG/3FDIlc2M0nGLT8LSxX7PRW81uvF10etKmn0wqvI3ydjtvKceBOOqua7fP1x
 ngrLk88wdOJsJ/96WWQ==
X-Proofpoint-ORIG-GUID: MLidN1l68BDwREDVJd4QBIJlN0t2VggS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240077

On 8/21/26 5:40 PM, Sreeshankar K wrote:
> Add base devicetree file for SM7250 SoC.
> This file adds the basic nodes like cpu, psci and other required
> configuration for booting up to the serial console.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---

[...]


> +		cluster_pd: power-domain-cpu-cluster0 {
> +			#power-domain-cells = <0>;
> +			domain-idle-states = <&cluster_sleep_pc
> +					      &cluster_sleep_cx
> +					      &cluster_sleep_aoss>;

nit:

<&foo>,
<&bar>,
...

(compiles to the same bytecode)

[...]

> +	soc: soc@0 {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0 0 0 0 0x10 0>;
> +		dma-ranges = <0 0 0 0 0x10 0>;
> +		compatible = "simple-bus";

compatible should come first

> +
> +		gcc: clock-controller@100000 {
> +			compatible = "qcom,sm7250-gcc";
> +			reg = <0x0 0x00100000 0x0 0x1f0000>;
> +			clock-names = "bi_tcxo",
> +				      "bi_tcxo_ao",
> +				      "sleep_clk";
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		qupv3_id_1: geniqup@9c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x0 0x009c0000 0x0 0x6000>;
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";

I think this wrapper can be enabled globally


> +
> +			uart2: serial@988000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0 0x00988000 0 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		intc: interrupt-controller@17a00000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
> +			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			interrupts = <GIC_PPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,sm7250-pdc", "qcom,pdc";
> +			reg = <0 0xb220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
> +			qcom,pdc-ranges = <0 480 42>, <42 612 28>,
> +					  <70 63 1>, <71 640 15>, <86 522 52>;

1 a line, please

> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&intc>;
> +			interrupt-controller;
> +		};
> +
> +		spmi_bus: spmi@c440000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0x0 0x0c440000 0x0 0x0001100>,
> +			      <0x0 0x0c600000 0x0 0x2000000>,
> +			      <0x0 0x0e600000 0x0 0x0100000>,
> +			      <0x0 0x0e700000 0x0 0x00a0000>,
> +			      <0x0 0x0c40a000 0x0 0x0026000>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";

and here

[...]

> +		apps_rsc: rsc@18200000 {
> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0x0 0x18200000 0x0 0x10000>,
> +			      <0x0 0x18210000 0x0 0x10000>,
> +			      <0x0 0x18220000 0x0 0x10000>;
> +			reg-names = "drv-0", "drv-1", "drv-2";

and here

[...]


> +		cpufreq_hw: cpufreq@18323000 {
> +			compatible = "qcom,sm7250-cpufreq-hw", "qcom,cpufreq-hw";
> +			reg = <0 0x18323000 0 0x1000>,
> +			      <0 0x18325800 0 0x1000>,
> +			      <0 0x18327800 0 0x1000>;
> +			reg-names = "freq-domain0", "freq-domain1",
> +				    "freq-domain2";

and here

> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
> +			clock-names = "xo", "alternate";
> +			#freq-domain-cells = <1>;
> +			#clock-cells = <1>;
> +		};
> +
> +		tcsr_mutex: hwlock@1f40000 {
> +			compatible = "qcom,tcsr-mutex";
> +			reg = <0x0 0x01f40000 0x0 0x40000>;
> +			#hwlock-cells = <1>;
> +		};
> +
> +		timer@17c20000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			compatible = "arm,armv7-timer-mem";

Compatible should come as the first property

> +			reg = <0x0 0x17c20000 0x0 0x1000>;
> +			clock-frequency = <19200000>;

This line should not be necessary

Konrad
