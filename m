Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445185;
	b=N7KX1xe4Mw7LRqnIyYtmMxsFO64SiXK0LgDupc3A/c2kYH/pAMDwf0PO42ciEhbUuqqn
	 FAI0zzEpMePM9jXSJ+T+NSsNgWNTSStUPId7vgW3CQIzK0cen+xf/GSLNje3fDpnLb78m
	 fu0s6eWtKjbQkd53vbLXyWQEVdi9M0LD38hzhl2+V9h2Ctm8O5a6FaI5Nk/JLfCBritZk
	 WRPYzwJDTrrtkvQ5IhkCc1F3Vj65OezHMOqvmiJEKI36JU+Ri11HmidQ0RkKZwGOzJz/y
	 xyTFoomAOFDW06qMc4slw5lCu+ilaSLFgt2VuNfOyVQneWHMQZg3SX9Q0eWujnYN6XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0C3NoitA9Av8WWs86mXYCEZzLDYugsCOm1mVss1Fq+Q=;
	b=ZefUOT5HFG/ksfbTgyO37e033OHm8rLSxW7Ai67C9yftbug5qYBFIQuhucqyyJBzv0Vy
	 sX9fSDTo8Cr4sTAJXo8jfrm3/Nbm8KtD+m8asQYZFzBmuKecfjUesCmTL02KBul1R5hXd
	 C6MLBz6WKwHdLYo5woDHO7vGOBzALoa3BBPLwI34TM82rsbwkQuMGIeJZPpQ6m8Lt7zrP
	 m8Og0X9bT1o3DqJ5ogAm+BSFCJXALv06GSq9QZyAvemZ4IDGRztWpDMpHWo3ttNOmkPW5
	 iB9I19+m5MFSBBM8rEulo/jQ+e1MGE7JLJ4KYihaDbua/5PVjqTnxigdHoZ5XOHDISg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lZne0xSe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gIFjtVbz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C09606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C09606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lZne0xSe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gIFjtVbz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL1pf2086045
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C3NoitA9Av8WWs86mXYCEZzLDYugsCOm1mVss1Fq+Q=; b=lZne0xSeimoZUi6m
	xd5ezJREO/oEIjS31i3OJlvbxNM1Y+OwGwMJTUomHDsUk0i0AFPy5CFjld07b/Sv
	hm/tWtNma9bvY2AeaxlEphpitULe472t62sCogSSPbXMRiBPqev33DIPU+rkZDHs
	JagW1CjyUnHZ623Z++xwaM0t3ma1Lvy3gumtCbpo1GheRh4cvSqzjP2IGShouGxs
	dK4hKswBprzykWX5ShgiZsrRIC/xyytLYce7rC0Fn5N5w6kHxmPjmkrTqmdvMnG+
	RYLP7XBk8Fh/J8EjXXxIeDFZiRJyK4YuL0M+iYpGZsAwslmAq4LTz7Supx1icyrZ
	6AyIuQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy01vgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:46:23 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso104488e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445182; x=1796049982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0C3NoitA9Av8WWs86mXYCEZzLDYugsCOm1mVss1Fq+Q=;
        b=gIFjtVbzTUFUcTeYJeOQ9IaHpE6ozqjxQpAj5aQSAMJtLnhIf3Nvhv+ZSofu3qwTGT
         28eqwq3CSGvayQcNplS/C9azJr947aDxGWuCd2fu3PerYFOJwwWKnbF0wmOaDzAILZNP
         beaj+EGGYvsaEq5Q/8Qp8Sz+MWTKhAtIPCXnHAaChehoiNJKl970MBYq6KPgjebRBQp3
         6CXYF1tEbXNs0/WEa2thdtoVBl3wIY04Mjws6B5EnE33L8sf4KbYey8f+bcV7Ufb28go
         YLcQaIPsdl/JmpPCgLxmjxjvCfhBBTC7taoO+xYmMzW0A4kNUq1YBAIs0lWSfz4/ji7r
         CdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445182; x=1796049982;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C3NoitA9Av8WWs86mXYCEZzLDYugsCOm1mVss1Fq+Q=;
        b=J1WgM5yrx1wFOMObwAoWFAf2UsvX0RNsvAWmSUlH2f017wPqGxe+Oko6C2xPT21bZO
         X6YrM9+7RNcQp4koKms0RH/0AuDEAH/1cL2GDY+5+cRC9oxZasCb+iPXZ+M3WXNd18/d
         HvZO4tTRnHNYypxcV6h8QoARpmkZs2TGGfVWdL4AQqeatUoBJprfYgB/PHXhhDcaoeTe
         O1qoOYymSsNbwkivygfnjAfGKaabibF2UkTEwvmHLGmerT+PGjDm9VLFEsZUR495Xtjd
         xEfHSRhdqMy/xNw8xEuNtLIA7Zo/WB6Ce1SU+p924hiCW9DwM8D6YO/9LxpkPK0YGdmh
         +AcQ==
X-Gm-Message-State: APuU4Z/hjajgPONk+QeK8Lz/yEb/R5UxYo/98l8lcUMQFpiesImRJgNf
	ibZyG9k+vzv9NvZUR0lckGMVn3kVzxQSqQYbLPgU/JwDRYkDJq5XFRdbNI4criegjuy3/iM1SJU
	fOrb7smLAe4H5uiW/CbPQsqnlaq3TEAunJwt7a1XzzP6WE8Yaq6LsRTqkO3RXsV6KUMdj5MBmgZ
	OS
X-Gm-Gg: AZFdTZd5kCgR0+9OzAURRQ40UF1ulb06BsSBnY7R7YCXvaOUpq3ZuKkuSI8dsRUXGKn
	NM7yLbCnNsAMwGkd7qGWVYoP8QtgPOC+pWJ7/jVwTIleLgJRuU+M57/a8dlC1Ek+btt4QMjF033
	dmAc3ByWM+Pbd5pJU7dHbq0ngkiromwguLPjW/7uzsJh9XLI/84bL1rIO1NbgGDTBWTveb9xnd/
	Um1R1Hw/hNh5k7zw0Kta9ogBsgCssQ7kzwTkzVjqmrzQLKkle4CnJY7yO1ppTZNbP3De+ogkvJs
	ZnpqXONTnpQlfVi94mSYWOPPF2gIbgG3HyF6Fcl1n+aT51wRqyz/8fEff2KE5jYDEfdlTLyBuRj
	NBzh+nVFxEue1XlEtklclxKNdYRtdJfSgh756Y2Cp1ye5bzcrR1R4eKw/7cyyzr1zAtBEU14=
X-Received: by 2002:ac5:cd3b:0:b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee8af4a71fmr5946739e0c.4.1795445182270;
        Mon, 23 Nov 2026 06:46:22 -0800 (PST)
X-Received: by 2002:ac5:cd3b:0:b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee8af4a71fmr5946678e0c.4.1795445181553;
        Mon, 23 Nov 2026 06:46:21 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed51asm407622466b.76.2026.11.23.06.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:46:20 -0800 (PST)
Message-ID: <a97c0257-0651-46d7-96fe-35984782f331@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:46:19 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] interconnect: qcom: Consistently enable MSM8916,
 MSM8939 and SDX65
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261123-b4-qcom-kconfig-unify-interconnect-v2-0-99b282e87d40@oss.qualcomm.com>
 <20261123-b4-qcom-kconfig-unify-interconnect-v2-1-99b282e87d40@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-interconnect-v2-1-99b282e87d40@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfXyDWR8qZmhybw
 pjfKRzg9mnNxTIbI3vLCLNDoPhrjUkN6PJWCqyOfxw7rC7BxIBv0YwhCZIUKDoUv3RwN0DiFPQR
 FueNGVH1vOHXrUGifDDqpi4u+aHIJWX2N9ArYpk3GuW5HEz9EKs/Nq4VETtK5SUnWd05aBh8Ot6
 OEfQ1KLUfKLWisqNIj9N8mSaJbS/qcUvkbcgZYoT1wGt9dGyR7hIRBCHqt1uGE0iey19EqKk/Yz
 0iCwWTUfeDwuW6793KG+INbrtbmCpFMPfAx8iFSApqVe+SEewJEeRX/xdUSsl/Lhz9nhkqDFHYc
 JWANFkiEd1w0ScQJKxymvYmxQSMzN/yfcOyavJwb6eZl3u2k6RwcqCq5N87OE/9eMN99rmuKnRu
 0SkraYRyidcMd3GkMqM68gKtw87NIdCUzDQbhGhWrWtLetDZ9PCdsKCs0gQwpfO1yONlT7639nz
 oETFO93n8W/9mGuLOIw==
X-Proofpoint-ORIG-GUID: xYiRHMBdmHYnjefSI1vwmTXbI9-VWG1Y
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0451bf cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LjraZ-jLxIig9cHSdckA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: xYiRHMBdmHYnjefSI1vwmTXbI9-VWG1Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX7K0W1ssFrcUZ
 XMZyiuQ/8cruH1LmQdGTX+WpGR0LBWclyAFXnHtGX/EIF3N9LyKUXk9TVr1HfsP9dGIIRCxVadw
 v688cvGkE8baScjQo9tyt6ogtuLVdkI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230058

On 11/23/26 8:56 AM, Krzysztof Kozlowski wrote:
> Critical drivers for MSM8916, MSM8939 and SDX65, like clock and pin
> controllers, are already enabled by default (MSM8916 for both ARM and
> ARM64), so should be the interconnect drivers as well.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
> index 7f3a977e8f10..110789a2d232 100644
> --- a/drivers/interconnect/qcom/Kconfig
> +++ b/drivers/interconnect/qcom/Kconfig
> @@ -92,7 +92,7 @@ config INTERCONNECT_QCOM_MSM8916
>  	depends on INTERCONNECT_QCOM
>  	depends on QCOM_SMD_RPM
>  	select INTERCONNECT_QCOM_SMD_RPM
> -	default ARCH_QCOM if ARM64
> +	default ARCH_QCOM
>  	help
>  	  This is a driver for the Qualcomm Network-on-Chip on msm8916-based
>  	  platforms.
> @@ -111,6 +111,7 @@ config INTERCONNECT_QCOM_MSM8939
>  	depends on INTERCONNECT_QCOM
>  	depends on QCOM_SMD_RPM
>  	select INTERCONNECT_QCOM_SMD_RPM
> +	default ARCH_QCOM if ARM64

This could also run both 32 and 64b kernels, but hopefully there are
no devices with the fw as broken as certain 8916s

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  	help
>  	  This is a driver for the Qualcomm Network-on-Chip on msm8939-based
>  	  platforms.
> @@ -367,6 +368,7 @@ config INTERCONNECT_QCOM_SDX65
>  	depends on ARM || COMPILE_TEST
>  	select INTERCONNECT_QCOM_RPMH
>  	select INTERCONNECT_QCOM_BCM_VOTER
> +	default ARCH_QCOM
>  	help
>  	  This is a driver for the Qualcomm Network-on-Chip on sdx65-based
>  	  platforms.
> 
