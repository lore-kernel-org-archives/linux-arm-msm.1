Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671839;
	b=Dyx1tYheBZY1HRIT1QpCr1bZ4btn5r5+Zi9hgOka8JUWQDS7GXvaNQkXYNPGFdyQeUI3
	 /rZLtIO3hAZPSIwKC8blGid83aSGEVEg97XHVZaib5jgrl/+EbnVJEf/LJDtDIx3av7Xq
	 AackLfJCh595A40YjOZ6jGLrdkw0YAI9nNnN/rDGFwqgtHm9tNDXvqD1WRP+v7maNItgV
	 hL4rOPpWQTAPoMFGpTZyYnxdPtJv3KIvHsHFVf7v96vf/4QpDQMwE0dDvN3yLa/XSIT5M
	 Q3L3lyj503gZ3oZ0Y41zZcUaUCDWKeDCsu4yTaVWYkXypCQXuZpeuIHyXrryw1gHlSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kp6RLSDQrDH/2rsp2oSnV7qIHz331N3sNpUWBPirLwM=;
	b=gOVYg/z2Q/0LXRIKaZMlE9bXYSq/P09IgOwp0A1v0OvBsckUuP3NXLTZOxCY9kbyibXB
	 IfLKsJQFOhOXIr3bZw9dVL+hUrLphhaH1oM8n9BrGYEyywzMtWbiFnvwv9Y/toUdnroC2
	 OVXYodWKSojo98kVd74NYG9bnbSnUJiZNMybqnOpcxT5tsYtN4e6Dp8KxVKGLlklmA7La
	 7BytrCY/NzMEttD1+z/1MeG8Tf/LnJcCGPW9stByD9BYDVTW2BCypj5JqOuI0I7u6d8/n
	 ppOvxBolLG2QAC8Y6+VWIA0YpyxcPRBREtGZaBo5/oCfaCZV/0u+ryxchGE5AtcYeeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/cFlrzZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8tTvese;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E031606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E031606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/cFlrzZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8tTvese
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36Vj22175838
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kp6RLSDQrDH/2rsp2oSnV7qIHz331N3sNpUWBPirLwM=; b=N/cFlrzZNj7XDye5
	syRQ8SFYvor8t6HTBHKjCkrn61vQU5KD9dGv2acaAm8m1LqvdPF3C0S0lGCQSlRi
	nAuba1z+6S0TWblPd3bP1LLmddmPlITL2Z1wZMV1Xm5gROEt5CxJMkFM8X/BXURq
	kjzAG60U89rlLavYFvI2RO+c9lT/Y0yowPulsZFiBWmgJcQS0EprQ8IHMJCNr6Hf
	99UW07KS/M2xJZG0ecE5dJJBN9bILOkDfcVprxKAGpbD79qyD6vsnACGt5KzeTMp
	NAHUKpAOhPZb17qgtFxxsGGfg3eYO9LhSm2CPE4Xt/xS42xNDvWp6hU813/h47k5
	KSglaA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhv5d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:43:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so9074771eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671836; x=1796276636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kp6RLSDQrDH/2rsp2oSnV7qIHz331N3sNpUWBPirLwM=;
        b=P8tTvese8t6uAvihyx8bOqZ0+X7/4u81OmR/S/s6HiYkC42Jb34FrOwXyZ6QECNE2Z
         bDSF6SLfNTPVCsEcAAgSudgbUcS9r1nlbrF6b7NowQw/moDkrfsvomXOth46S+CIzmsg
         HqMPKKQ04qpQ3WmQVNd8gU+3ivT/jnHf82PobmUng8lHcSb7rDnJWfchhjVq4M4QMJsZ
         ZMuqE8xK2Wntrdz6S7+241FbGic46S7HMrqlufgla/Up/Cy+/vuaIhkN4skqClMxi7uX
         S4t6j81uN7jBmLIOopClA6P386CczoDyVKoSbdGKSRwm83OHNazAR2DeFrgTYXPCr/J8
         u/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671836; x=1796276636;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kp6RLSDQrDH/2rsp2oSnV7qIHz331N3sNpUWBPirLwM=;
        b=HqnipvvsgSzPcmUNns8GfHByTWHmu2/Aq9F0ZlZYr+d6tT2hvqROCDKlT9D1BG8tfU
         VCeRPpRvSp+Sfnf+bclUPhkkQpzHj5JHm0OT5aubzw2KYpani5tThvsgp3eyIngD5TIe
         4WxM1fciUoSqwfay+C99sLUbjLC/BvrnJWf96SIXrHbV1xNJSbwmRVBAxIaNs4pY+GSj
         x5su5+7E45fgdAb915kNqlPTblSiEUWz4qLQO7P9EcrwPP6cJyUAOBZ/YQjlOX4C+iW4
         SyVLNyhoS4PL4OrkqGhkyK3kDIK1SxCgKl4o+nMBQsbNhI7r/m54c+P19kFx+RKOJQ2/
         FlnA==
X-Gm-Message-State: APuU4Z9ODsTXQW1J/YisT6ySv0L6XBQNKFS6iDYOWRO5CmttLeWdjIbX
	o1ceBPMaKApS3JLMz0cW+w/uifxCsM3OQrbb5aTGONF9MgCiPrMVR4jv+etfnKcsawx1owUvaus
	YN1EbxcUifXQLB9Lcoc4kNDTfw2AYk1zZNZfrm1deNswrroKPeo6VtOZtCUjV5Zt0wv3c
X-Gm-Gg: AZFdTZd5Zt+1EnLhsQK+INKCJgsYf2gquOMgknYDqj6lp48rir2ZTCLZ7j9auHtCQI9
	AfowQKEE9As1+Ygm/Rs036Esuy2D9zMpvh7fwBw64lwmIUkLXsEbasRAnFVOrHddHAFcrJzj2W5
	Ng+fofOsjmojdsfmMxYIUEnXA92eEmxmmiayonKd1e5OVt66WLkYh9VlWhyprvG8Vp/W4qynJzN
	8DxBkwFL7zxc0wxG0E9vlntVz6AK9SMNImFOOrAQ+P4veZc1o3Hfqq1+EfU9lMJ92nCNO3Dykgx
	Rn8zhFpKtL6434kvglODoVVthef94oO8nQ/uZgGpbJrEV1PrZz3tk37FIb/Bw/+JuHLjkaXT0K7
	4g1XRsYO5gtcqla+00hHZlM8ZsD8NYbPZdjCTyY4CgCk8yyo8lOxqfqlopKv/bOtV8NPI+CQmoP
	Cky+mF
X-Received: by 2002:a05:693c:2181:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-3856fd57eb1mr21370801eec.22.1795671835833;
        Wed, 25 Nov 2026 21:43:55 -0800 (PST)
X-Received: by 2002:a05:693c:2181:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-3856fd57eb1mr21370766eec.22.1795671835256;
        Wed, 25 Nov 2026 21:43:55 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm58415850eec.23.2026.11.25.21.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:43:54 -0800 (PST)
Message-ID: <40185500-441e-3706-b68f-188a55b88014@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:13:48 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/8] dt-bindings: media: qcom,hawi-iris: Add Hawi video
 codec
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
 <20261118-add_iris_for_hawi-v3-3-51786f6d4057@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-3-51786f6d4057@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07c71c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=8NJSptN1c65XPqnLaKwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: kPlmmlv5zV-5EXGlG1-GOD1qqGURXXom
X-Proofpoint-ORIG-GUID: kPlmmlv5zV-5EXGlG1-GOD1qqGURXXom
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX18AZv6rkKS3n
 Bry4BsWxgeTmFOX4smhyaA9ALqgHPJr5WCF3d30S4N4GkVP45V+YcYodNtzzLgnms+LwutTqQJ/
 I/d3Wn8y3H21zcR9T4KsWlYJxQT8a04=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX5ltNr/YKbyB3
 Di2HLzdKi5TFEAtrRVlGcKdwOmIYpXtUOQoqQ83jlyT3wHAGM0U9ivjDu5ewcQzLHtF+I86Yc3y
 f3vQUhO3h9WR8l4TcslFGMSdEtYiXCtfBo3I0BWuwpsFpuIiy9VIHyDq+jeX+luAqPJ8hil5z8+
 8c2PweTS2J8jDhELoavmL5AUXCH0F1iZAdErQZZ1YJGf4YIKO2+ef6nTDy+kxViyKUavBZnJnSk
 GcTrrQHCPJHS7GH8AMK231YKBY2QcjRTCU1PL6P0rZPPKOfpS/wY5zyoohmIEgOIt37AkJpdCM6
 V3NvySydNxGui29ARW8t8Prufrjn+oynRG5gV3vm+mcnofeKSEA0VpBW60+5eeh9GzcIp4w5yPC
 D5FRIG3UH7goub8oG8WypAamf16ai0vFYKfZ371cyRGujgt/1+zDScwd5T9F83w0+zuD96HmHkV
 d2m8F7tPU40eQce5fHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021


On 11/18/2026 3:11 PM, Wangao Wang wrote:
> Add a devicetree binding for the Iris5 video encoder and decoder block
> found on the Qualcomm Hawi SoC.
>
> Compared to the Iris4 generation, this block has
> - additional power domains for internal NoC(cx & mm).
> - additional clock for internal NoC(cx_iface).
> - additional power domain and clock for apv codec.
> - different reset lines.
>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,hawi-iris.yaml  | 256 +++++++++++++++++++++
>  1 file changed, 256 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml b/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..13e346414a231af9a146076de6a3fa9e9c488624
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml
> @@ -0,0 +1,256 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,hawi-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Hawi SoC Iris video encoder and decoder
> +
> +maintainers:
> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> +
> +description:
> +  The Iris video processing unit on Qualcomm Hawi SoC is a video encode and
> +  decode accelerator.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,hawi-iris
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 13
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ifacec
> +      - const: core
> +      - const: core_freerun
> +      - const: core_ctl_freerun
> +      - const: core_debug
> +      - const: cx_iface
> +      - const: vcodec0_core
> +      - const: vcodec_vpp0
> +      - const: vcodec_vpp1
> +      - const: vcodec_vpp0_vpp1_gating
> +      - const: vcodec_apv
> +      - const: vcodec_bse
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  power-domains:
> +    maxItems: 9
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: mxc
> +      - const: mmcx
> +      - const: vpp0
> +      - const: vpp1
> +      - const: apv
> +      - const: mm-int
> +      - const: cx-int
> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: bus0
> +      - const: core
> +
> +  iommus:

Since iommus has been moved to the child nodes, it is no longer required in
the iris node.

> +    maxItems: 4
> +
> +  dma-coherent: true
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - dma-coherent
> +  - interconnects
> +  - interconnect-names
> +  - power-domain-names
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
> +    #include <dt-bindings/clock/qcom,hawi-videocc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    video-codec@2000000 {
> +        compatible = "qcom,hawi-iris";
> +        reg = <0x02000000 0xf0000>;
> +
> +        interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +                 <&gcc GCC_VIDEO_AXI0C_CLK>,
> +                 <&videocc VIDEO_CC_MVS0C_CLK>,
> +                 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +                 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK>,
> +                 <&videocc VIDEO_CC_MVS0C_DEBUG_CLK>,
> +                 <&videocc VIDEO_CC_CX_AXI0_CLK>,
> +                 <&videocc VIDEO_CC_MVS0_CLK>,
> +                 <&videocc VIDEO_CC_MVS0_VPP0_CLK>,
> +                 <&videocc VIDEO_CC_MVS0_VPP1_CLK>,
> +                 <&videocc VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK>,
> +                 <&videocc VIDEO_CC_MVS0A_CLK>,
> +                 <&videocc VIDEO_CC_MVS0B_CLK>;
> +        clock-names = "iface",
> +                      "ifacec",
> +                      "core",
> +                      "core_freerun",
> +                      "core_ctl_freerun",
> +                      "core_debug",
> +                      "cx_iface",
> +                      "vcodec0_core",
> +                      "vcodec_vpp0",
> +                      "vcodec_vpp1",
> +                      "vcodec_vpp0_vpp1_gating",
> +                      "vcodec_apv",
> +                      "vcodec_bse";
> +
> +        dma-coherent;
> +
> +        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                          &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                        <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
> +                          &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +        interconnect-names = "cpu-cfg",
> +                              "video-mem";
> +
> +        memory-region = <&video_mem>;
> +
> +        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +                        <&videocc VIDEO_CC_MVS0_GDSC>,
> +                        <&rpmhpd RPMHPD_MXC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +                        <&videocc VIDEO_CC_MVS0_VPP0_GDSC>,
> +                        <&videocc VIDEO_CC_MVS0_VPP1_GDSC>,
> +                        <&videocc VIDEO_CC_MVS0A_GDSC>,
> +                        <&videocc VIDEO_CC_MM_INT_GDSC>,
> +                        <&videocc VIDEO_CC_AXI0_CX_INT_GDSC>;
> +        power-domain-names = "venus",
> +                              "vcodec0",
> +                              "mxc",
> +                              "mmcx",
> +                              "vpp0",
> +                              "vpp1",
> +                              "apv",
> +                              "mm-int",
> +                              "cx-int";
> +
> +        resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
> +                 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES>;
> +        reset-names = "bus0",
> +                      "core";
> +
> +        operating-points-v2 = <&iris_opp_table>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        dma-ranges = <0x0 0x0 0xffc00000>;
> +
> +        non-pixel {
> +            iommus = <&apps_smmu 0x1540 0x0000>,
> +                     <&apps_smmu 0x1620 0x0000>,
> +                     <&apps_smmu 0x1544 0x0000>;
> +            iommu-ranges = <0x32000000 0xcdc00000>;
> +        };
> +
> +        pixel {
> +            iommus = <&apps_smmu 0x1543 0x0000>;
> +        };
> +
> +        iris_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-150000000 {
> +                opp-hz = /bits/ 64 <150000000 150000000 150000000 225000000>;
> +                required-opps = <&rpmhpd_opp_low_svs_d2>,
> +                                <&rpmhpd_opp_low_svs_d2>;
> +            };
> +
> +            opp-285000000 {
> +                opp-hz = /bits/ 64 <285000000 240000000 240000000 360000000>;
> +                required-opps = <&rpmhpd_opp_low_svs>,
> +                                <&rpmhpd_opp_low_svs_d0>;
> +            };
> +
> +            opp-338000000 {
> +                opp-hz = /bits/ 64 <338000000 338000000 338000000 507000000>;
> +                required-opps = <&rpmhpd_opp_low_svs>,
> +                                <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-420000000 {
> +                opp-hz = /bits/ 64 <420000000 420000000 420000000 630000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-444000000 {
> +                opp-hz = /bits/ 64 <444000000 444000000 444000000 666000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-560000000 {
> +                opp-hz = /bits/ 64 <560000000 533000000 533000000 800000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-630000000 {
> +                opp-hz = /bits/ 64 <630000000 630000000 630000000 1104000000>;
> +                required-opps = <&rpmhpd_opp_nom>,
> +                                <&rpmhpd_opp_turbo>;
> +            };
> +
> +            opp-800000000 {
> +                opp-hz = /bits/ 64 <800000000 710000000 710000000 1260000000>;
> +                required-opps = <&rpmhpd_opp_turbo>,
> +                                <&rpmhpd_opp_turbo_l1>;
> +            };
> +
> +            opp-1000000000 {
> +                opp-hz = /bits/ 64 <1000000000 710000000 850000000 1260000000>;
> +                required-opps = <&rpmhpd_opp_turbo>,
> +                                <&rpmhpd_opp_turbo_l3>;
> +            };
> +        };
> +    };
>
