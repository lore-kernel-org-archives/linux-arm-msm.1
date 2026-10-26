Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003775;
	b=fjQr63OLrIWUFzFNqDPwl76OHrNAPP5fb/pDkP2FDmPWlPRNgZDRlj+HqYCbRURDLfmE
	 eHoXpMkW2jLd5WRUwOOyfX/Xds7FW6Urem3qN1reqxhzNX+AqDGXHC1um+9Km/v3OjFDm
	 ZBlywt4+f5Mq/KMGlXlTueidvdyI09gNlRCK5UozOycyO6sizZVIUWwvfgX0VqL68sDVD
	 PyX4p93Mr/mmBJ+OYTycbmHlXAnxPa145rJ7nXJmx71CQ6DeiMWbhu9zLo35OfCWw1vQT
	 8zZZvDLLPTRjiXD28Djq8I7IetuPKYiihDVVYjOXB+QRpS86bAPaDm/35PaxqRqwqkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2IBldTT+B4MiEIGdaWBBVnElcnO8vPC3++c1Vr7JCyA=;
	b=VTfHjcbSdAKrI5MWnh1oft70WtptK/y+SJ5hUiWqR84GTtXus1m40JmE+mXJofrBTChR
	 e5ZRNnl1rhq2Dlelrni3IAvZqj960vUgS3X0UC3G6gQICm4Dn/z4JWpUz47iFOkve1D8i
	 T51T3/gTV62TRJbatgB3b0nQFvDMANMzce3HprdPMExtWJIP/mSD0CtEvXIIQg70ezb06
	 LcCprJY/nIByBobuuTowiRys3Bj4hs/h/1q+6loaJt4LeuiCzuQHTuX9VckDYlz5Oa7m9
	 3HqlMTovJq27VsxEZ1S4Cw6rj1pDESv6EQ/en7U9bqPRz9C5C5LXQbHgV+Re4XRRKWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ux2TlE8z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QL5vGX3h;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F393606A332
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F393606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ux2TlE8z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QL5vGX3h
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4asqL3303637
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2IBldTT+B4MiEIGdaWBBVnEl
	cnO8vPC3++c1Vr7JCyA=; b=Ux2TlE8z+gn9CQPUQH7iMDWV3wRVIQWe9SWb4WE9
	dBSsI1tDytWIT/7OBt7qKcvynQ02TKQlx1duqUiZ6dlzQ+S4XWG2OMZHmTWXiPxD
	c4VZKpbS3sVZh5bl/DjDWpmmqyAxzOxgVCpLe029L+2lOS/Lh46/pM5MK9JKEACO
	91/lmaYzR64nc6iWTbcO1Pz2WwtcDR0FPZyDX6AoiGYGSzv+uTFE4Xuv3xFNwxeL
	+h/z8/2emxUseYxs0sm7ZXBnbhIAyaeKQ0a+Rxru6btArCce4ejB9Ge36aeU5VaE
	ZNRW5muNra1IE76qEhY/ye203+B/veS0m5aRqDyNuymRSA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsdk6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:36:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso4260900a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 01:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793003774; x=1793608574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2IBldTT+B4MiEIGdaWBBVnElcnO8vPC3++c1Vr7JCyA=;
        b=QL5vGX3hZ/MuMoSd9PwzfCMn7g0Mk8rWfsLNIvyB9itnhwRqlMgb5JxZDPm5Viv4WU
         TISe8BGjnu1dVYdeshGGAHtSXbbSVXdqSKKPGr/PbX0PEF6AWPIaBDTan1dLqwmiLTvn
         d7/ivRZ638FmPPDz+MefZCesVYl2VT6DfsAZrX22uhT8v0qZl7oPhzNnpT94MSGQqRl9
         s2qNQJGc2MTp3ejxBmtpY01IyDHTTYT+p/p06FMCK4/g1rDkTxjjuPSxJEComdLXtzOw
         yPFyFOGBWGi2GgB2U3bXN16F+PoaVJes6Y2j2EseJxHFkUP4tzrYSkRz21dGwnY+F7a1
         H54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003774; x=1793608574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IBldTT+B4MiEIGdaWBBVnElcnO8vPC3++c1Vr7JCyA=;
        b=0s1rdVTgA7cXa0+vMQDh8sqNECOq75wMLPAOlqfdUYoDSTXvCtDVLTQ/9MO4CyfdVz
         2xPNMO+NuwNYicFmVZq8eJDjig4gjbNI/ERf+ZydIyYXUAJQ0INqo/FerLPgHHOgkm9C
         +G9rbLtG2c0K9CK+G3PhTRidwD9PZ26QX+uRhPVOX8R6pOW+YtJY2byK3yiyEyyllDaH
         MYFdAGUf9TFabDV+5d3JziALo88d+UrwqItCekE35Vjr1Z+FpFm51J4TD9hroK6fizQ/
         H3RwFF8BdBAaIdYXpn+w6/iT+UbQ+xg7Nxxe3x3RLJYb+pfLSPwmc6pySmselyD1fHIQ
         1srw==
X-Forwarded-Encrypted: i=1; AKwUvBw5X0cYO44SzyFVjN6BnspgW4CpeV7htGXM8Si0jYaqcCBwfgV4dbCx1IpfwN1fcNRujfder84hAgX+oiW+@vger.kernel.org
X-Gm-Message-State: AFq9FYKEiQzBlD8xZuNE8q2Og/xZwqGkkneQV9dWO8fBJigpv9PjljsE
	SpTaib477Or4+7+SSeF0L4bT4Z6tJZeDHywyqzgxBX0g7iZZC7M9fjlSVCNs0c6P+nrix02YHXi
	QLERul7vLwQk0sddMYrfqGGIoR3lldW+I/RkKnUIT1aLR0E3T00OlMMFktMHkOPqlAgIO
X-Gm-Gg: AYBFou32AMjvNfQ/sLH62arz3ozc8gCzfivnPv7yuTehsWMDIRq2437u61jQlCKadG7
	Hz+dgk+kaVHovKGJZM6vdnaAXESLRLCna7DBVA8kjNqLxBNf/ZvYqGd5h2T5lyL/040RoJWmXV3
	hBTnmlyWCTS5CRnQvOHmIawFR5I/MoCppUMzkFZTXFzyDnNRUNQ3WggWlNLUC0zGnk/V/e0usIl
	EmOKHoWut9XEo5QSJ0pAawkPN+3VJDhy0jf9HQsNzD6NkpPI97ApdxWoocqWUsmSlTvVr8CTeuH
	Puf7eUaJ81vEHozT6qZzvhKHwfCUkPIZ3oCpEtolR9XQYps9QKnWfqpt4itO/sIvEh7lHwDec9a
	YzelHU9i910IdzxH/pfPOCv5y5XiJ+GWwRuN5iKS93Q==
X-Received: by 2002:a17:90a:e7d1:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ade9b2ed8bmr5784763a91.6.1793003773971;
        Mon, 26 Oct 2026 01:36:13 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d1:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ade9b2ed8bmr5784737a91.6.1793003773334;
        Mon, 26 Oct 2026 01:36:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm5344362a91.2.2026.10.26.01.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:36:12 -0700 (PDT)
Date: Mon, 26 Oct 2026 16:36:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans: make the emac compatible
 specific to the embedded variant
Message-ID: <at8Q9umfE2AP24lI@QCOM-aGQu4IUr3Y>
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
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
In-Reply-To: <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: k_nQ5D2ylwoSKzMWelaufBtNbfVnuS09
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNCBTYWx0ZWRfX7JsW2LrxYfrD
 akMb8f9GlQeOeaNyEOodOtrZdHK6++F8wYQVHM3MNFq7kFTrfPDeyHOJ8SlzHc9QCL4mdWQ/2od
 5iHwGYLR7q63KMgEipDGsgW/UM3GVx3zKhyWBSnbwQdTpwLYV+oJVN0gJL2RgCWY6+f2CU/6sS6
 ihTQhUa3YQQCQk9P38vxU8MOGe0x3nQxpaaMOXEPp4jGvea5W/lDvfoHvsVV1+XkAav1+sU336B
 ihKtskn7t7gkztTf0XU4G+8bSqpzIVkQX966v7iNVsnqc3Zmfyb6qkNr+X/G2hdEddwaGAI4JIR
 T3DuLD3bTzScYLbhD8BaLAjl381nkWKgF7uyANBFVR3Ph5v12XWxBN1QJNlM0O7yL5Qh/1fnIOl
 G7+YOHCoaGT2lAoTNwG2XqOVd6yLynBoEOgjvCm/YCv9rhnlebDR+XFGzYVp6ugzhB4vQalPX6g
 J3EOc6COJxm8id+PTug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNCBTYWx0ZWRfX5uq0WueVWUxZ
 tSc7Tfbnz+RyE0BDmMIy3b1FY0QqAHoygZ/Wv3+Ki+vWxbEVjBCPoP/oqyviDOato/biumQ86DO
 brryWjTFdBUjwcdsHUzoXuBZpUW+OpI=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adf10fe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OYXKdzKcgdxe2yQkhO4A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: k_nQ5D2ylwoSKzMWelaufBtNbfVnuS09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260034

On Fri, Oct 23, 2026 at 11:02:23AM +0200, Bartosz Golaszewski wrote:
> The embedded and gearvm variants of the ethernet MAC use different
> compatibles so move the one for sa8775p into lemans-embedded.dtsi and
> make place for the gearvm variant to be placed in lemans-gearvm.dtsi.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Do we run into any problem if lemans-gearvm.dtsi simply overwrites
the compatible without this patch?

Shawn

> ---
>  arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/lemans.dtsi          | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> index 3733c0b7bace10cad656144b31d02bd8b4dbf3ed..630c40d21ecdab40ec59135cc667e4eccfd23554 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
> @@ -458,6 +458,7 @@ &cpufreq_hw {
>  };
>  
>  &ethernet1 {
> +	compatible = "qcom,sa8775p-ethqos";
>  	clocks = <&gcc GCC_EMAC1_AXI_CLK>,
>  		 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
>  		 <&gcc GCC_EMAC1_PTP_CLK>,
> @@ -481,6 +482,7 @@ &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
>  };
>  
>  &ethernet0 {
> +	compatible = "qcom,sa8775p-ethqos";
>  	clocks = <&gcc GCC_EMAC0_AXI_CLK>,
>  		 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
>  		 <&gcc GCC_EMAC0_PTP_CLK>,
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index da740a0876d4adcff0bb9458564c868a6f406b0d..77e4f57778fd54e414c86a32f5b068239bee6d24 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4386,7 +4386,6 @@ port@1 {
>  		};
>  
>  		ethernet1: ethernet@23000000 {
> -			compatible = "qcom,sa8775p-ethqos";
>  			reg = <0x0 0x23000000 0x0 0x10000>,
>  			      <0x0 0x23016000 0x0 0x100>;
>  			reg-names = "stmmaceth", "rgmii";
> @@ -4407,7 +4406,6 @@ ethernet1: ethernet@23000000 {
>  		};
>  
>  		ethernet0: ethernet@23040000 {
> -			compatible = "qcom,sa8775p-ethqos";
>  			reg = <0x0 0x23040000 0x0 0x10000>,
>  			      <0x0 0x23056000 0x0 0x100>;
>  			reg-names = "stmmaceth", "rgmii";
> 
> -- 
> 2.47.3
> 
