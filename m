Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5338D3587A2
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120529; cv=none; b=C97tJfROzK+16m8l0sC0iwn6Xh3POV5ELSrRgGyrLw/+V11SEndo90Cn9LLJr2oqc9aqRn+DqgaRAS0YbnhRaCwiodTBxqkSp8PsP/U5vcE3jSMoOkGDzxuqS2PqbT4ummkUIO9JfDWX/cY2nFZ32/qzCOXEfI860P4fs+R/22E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120529; c=relaxed/simple;
	bh=ICHWJpAlkm6n6QwJfFmZ5UtiesPfPoqH/DXRRLMS9Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oH9NwU5VxF2QnzdJJORyaU0m+P5/69PwaIwkXXXad2ZW3eDJ8EUoR5asY04HJw5XN/MNI3/3jc5FMkzr2JWh+BJ95PGw/iL0sbD0/Wrn8USLf8BdAoCAiA3DQI6Al7aVXQxJvPsvlMsVqredTqLGPE2bIPoylut1VLYbgpQG8gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFQxgu5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WumRGhqD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFQxgu5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WumRGhqD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNZN6A3492964
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9EZlze25ChU5gV3GfJ6FNyucDYA2Rt1XM4XFJ5+ogA=; b=eFQxgu5eKHJPVOjQ
	OTdVTDcoYpY1iQE9eG6RGkXq9ygwUTYcfnhaqGDFt7APCKm5J6vf87x1q6FolvRn
	mdB1X2PpojBuV/san0MtGjqTwD9rkUX3WQFeIZZGkDVsPEqT2A4K9/EANyYLIxOi
	RHdLVx/yHUApYhR5F/JSguWpLf1o+avcsQTvjVb0Hp5EMrB4k2V6UhZ2xjIliJUA
	M6beGFAMg3JGzxD0qQsYgyMd3hc8eBnodK/n12SAER+odaU/grxZuc4uSoG4KyBF
	SpRBbHvxh8uCBPEX5Tbpd1gIxjP9gumVjBq4X6AMJejjynKGd0k5yj+6dPQqKVsH
	/itPgA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wt88j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:15:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso10575949eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 20:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120526; x=1792725326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9EZlze25ChU5gV3GfJ6FNyucDYA2Rt1XM4XFJ5+ogA=;
        b=WumRGhqDP6ZHhNocUrEjb8xWQyHSMYuzB9WE0SoqggRcUhLZ2AakVg0lbph2YWFbH8
         S4byJ/ap615JC+c14EWsYWagrgtMZ4D9mw3zTxXQn+ac/ROkwnircP+3jIzvSmG+hhTK
         YNqn0cL6kko7BJK8gRe9kHCWUSrbRuGB2R6lcnEaYhEIZ/s4rORGB6Vl9oj7NU7oieoO
         eybJVSFR2ls8jgvilCwLl5tXBQkfKKwBAGQkHNkiZ/rZWUR+bxHbzLOMdJTmZhg3sZTN
         BA4zilJy28lv1P5DOpaVgkW/hMKjvUgAWQ9070W48TEmSVnY0nAByhddWnfPQf49Go8/
         5m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120526; x=1792725326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9EZlze25ChU5gV3GfJ6FNyucDYA2Rt1XM4XFJ5+ogA=;
        b=D8SFUkQLYQJbGTs1ineZ/P8r+HKUl1Y0uywMFXhPNTwJ/hDFq+VW+RwDkZ60jnUFqF
         nPQgbwLBOXuLJ1K3t5nQnxIXoDTnOBLSxc2RignrvleXkCi6rWGaPwjz0LaZuKRar0um
         y/CqYm+j6/uB4nLhlXZy9B8nvdw4aC0hn6Q7YKbggmZP2lEvzhwloJRU8Uh/n6JnabxR
         zLzrXZuN8RxLKBfyHPRktLtO88yx7/T3ohNOPF8XephTGj0WNd2qIjHG1PqtIVjfk639
         NEN1D+P0CGTqO6ACD1OoGRhvka/ZtVtcgkjDdI5DyYZs2a0ZN/4vujsmlo+EiqTXyB28
         E7og==
X-Forwarded-Encrypted: i=1; AKwUvBw9lxn/94LZLF/hzFY+xse1m4j05/sGYAkb1qTG5a7shdqhAEO2tJB7TdssLkC+HLWg7+wss9lqR29Qdz33@vger.kernel.org
X-Gm-Message-State: AFq9FYJrNlPHqnItFShpNMX45+cXklzeORXG+zCwHe9wZr33f7B6qct1
	/eATV6KfVoQRE+z86k14X0M5opwGICZockVFql9iusX1dTrPpHjq32x18bOS8BbsauSuoy9+Z9G
	OzzLYpAW+mq5BpmQLP3UhA+8qj5WR2AQ6DdFZH5By6DyC79lRFEai2YZJTHQ/aZPaP3F2+oJ4dC
	gE
X-Gm-Gg: AYBFou0+sUJrqwRmYdLc+3wRIeZ/Xw1D7hDWUwhfPRH+ejaYLxFRqBJZLvqmbwJQYMV
	otfjMjEcjUz1DCYkn3fesszWJknhPb3Ko4dTXgoxbnAfYV3h3YojvaSFE4X8DlWiP/fD37JEICa
	ttLgG8++SAyhOKWL2mGqSZ+4WkCp12K4bGUs08w+Ggn5eofZturYLR1tiOrmTHSY8x8CoRrhrNH
	a0/fmrsXT5cIyD7fNaUkgNxbHwc+q5seRvwyc30iBknZks0sNxMXQlQhXA9SCouE4TY/vzKaO+k
	6rHgemzSNrGkkURP8MFg606vbuzirXvwTmnrKV6pEra9KfzzL4BythWOC0ChFwseIyeBNkXEFT2
	NhwP204HWj8/EYhOSAD0AxqqeSSvYxg==
X-Received: by 2002:a05:693c:88d5:10b0:35e:5ca:e0df with SMTP id 5a478bee46e88-35e05cae713mr9104435eec.35.1792120526168;
        Thu, 15 Oct 2026 20:15:26 -0700 (PDT)
X-Received: by 2002:a05:693c:88d5:10b0:35e:5ca:e0df with SMTP id 5a478bee46e88-35e05cae713mr9104323eec.35.1792120524210;
        Thu, 15 Oct 2026 20:15:24 -0700 (PDT)
Received: from [192.168.50.84] ([76.176.60.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm2228750eec.23.2026.10.15.20.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 20:15:23 -0700 (PDT)
Message-ID: <46432502-b2a1-4e7e-b3d9-447a3e239fd5@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 20:15:21 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TDL-wfeDUTgS4K-zAt8u4D_h-8n2HTLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXxz3jBlLH/UjJ
 1FbQT23fZGFkuLvXdaKbKIn6JDYZRmr5xvOZ6izpGnuKP+EUDrUtuYVCdDX8LRcTlz1925r826i
 1Bcs0fN8cgx9QMS7elh9CeDxPORlhpdYVxta8G/7niHPjR0io6z8Go3VrIVAAoSigFRePgPU/Fy
 GkHMo5nee/j5ypGNkWVJ4d7KzCq3P8OJcuNme8tidUQPKiB11E24EmsMIAzmtEqPEW8NDvWFdsE
 FyFYlUfpYtX2ODYmUcEdD9XBD/mzgbZLvxDjRUWJLs3LXn2KQL0URLPyp31bed7475uJnvQuK4l
 TQGwM5+NfZ/SFwEQTnz38CbUObWZQ/CZNemxGzhR6DviXE36gRfVn9y4gOLwP+aUqqFvvzUkpJu
 ddLVcxWChBsp16owhY3g/KavnY8di91AzLjawcurmfQPxdG6DGcsW2aQv+Xdxb4anZwi+DRsOuP
 A7JVZB4XjlC1x8XrqhQ==
X-Proofpoint-GUID: TDL-wfeDUTgS4K-zAt8u4D_h-8n2HTLk
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad196cf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=0ISbvMpsx/t7i6H15JfNAA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=viPkIkau9hFIgBHGpf8A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX5ZHyR8B/1QIL
 axbEhnChkax7VJSvk9wPtQkHH3d/vogjmoJwANNnT0dg3ITDoLUXzaGwPkaKrb80W1ou9/KuZow
 a9LCc3Ne74/PQxbdSlSC0vsGgk+v/Og=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160012



On 10/14/2026 7:37 PM, Shawn Guo wrote:
> Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> firmware to configure platform resources such as clocks, interconnects
> and TLMM.
> Device drivers request these resources through the SCMI power, reset and
> performance protocols.  Assign each device driver a dedicated SCMI
> channel and Tx/Rx doorbells to support parallel resource requests and
> aggregation in the SCMI platform server.  Operate the SCMI server stack
> in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> communication.
> 
> Group resource operations to improve abstraction and reduce the number of
> SCMI requests.  Follow the SCMI-based resource management approach
> demonstrated by Qualcomm at Linaro Connect 2024 [1].
> 
> [1] https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi | 3232 +++++++++++++++++++
>  1 file changed, 3232 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> new file mode 100644
> index 000000000000..4c155cbc7975
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> @@ -0,0 +1,3232 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "lemans.dtsi"
> +
> +/delete-node/ &xbl_boot_mem;
> +/delete-node/ &pil_adsp_mem;
> +/delete-node/ &q6_adsp_dtb_mem;
> +/delete-node/ &q6_gdsp0_dtb_mem;
> +/delete-node/ &pil_gdsp0_mem;
> +/delete-node/ &pil_gdsp1_mem;
> +/delete-node/ &q6_gdsp1_dtb_mem;
> +/delete-node/ &q6_cdsp0_dtb_mem;
> +/delete-node/ &pil_cdsp0_mem;
> +/delete-node/ &pil_gpu_mem;
> +/delete-node/ &q6_cdsp1_dtb_mem;
> +/delete-node/ &pil_cdsp1_mem;
> +/delete-node/ &pil_cvp_mem;
> +/delete-node/ &pil_video_mem;
> +/delete-node/ &scmi_mem;
> +/delete-node/ &firmware_reserved_mem;
> +
> +/ {
> +	clocks {
> +		bi_tcxo_div2: bi-tcxo-div2-clk {
> +			compatible = "fixed-factor-clock";
> +			clocks = <&xo_board_clk>;
> +			clock-mult = <1>;
> +			clock-div = <2>;
> +			#clock-cells = <0>;
> +		};
> +
> +		gpll0_board_clk: gpll0-board-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		xo_board_clk: xo-board-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +	};
> +};
> +
> +&adreno_smmu {
> +	power-domains = <&scmi15_pd 0>;
> +};
> +
> +&cpufreq_hw {
> +	clocks = <&bi_tcxo_div2>, <&gpll0_board_clk>;
> +	clock-names = "xo", "alternate";
> +};
> +
> +&firmware {
> +	scm {
> +		memory-region = <&tz_ffi_mem>;
> +	};
> +
> +	scmi0: scmi-0 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem0>;
> +

As bootloader updates the irq, we can add a comment here.

> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi0_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi0_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi0_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi1: scmi-1 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem1>;
> +
> +		interrupts = <GIC_SPI 964 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;

Thanks,
Deepti

