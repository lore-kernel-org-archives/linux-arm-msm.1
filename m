Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103306;
	b=B7UahMSfj7HE/lc1BwlxECk5i5p1Um4oICifRIKNrzIjDGa6Es7M8fAcSfGBfXsVvfLP
	 keGw4YL09ISe+qg8WTIWZvYPWKuDnYih7f2tbn9oSasrhQIJRiFE/7/ecSwJPhGP+cObf
	 mbQBgqDix+rijUYLkLmz2GmuFAsK/82V3+9M/MpuFpfZpESq4OMO3qIU3FjyE9k8Kg9Hm
	 JXA+SrYL0XvkGO7YW5srwh0RnouUA+9MgxV+rhjb7w/+k/EdCdRSxy6CXLd8aQd4KhM7z
	 0iZbKC4CrYO2C2V6w7/Va5e/RwP1hg+ifxFyFHwCz7qfaFuzY39qhC51z6E8Sp5qcjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=;
	b=iTADnxO7cyI/kPb54jV4ahHNa+OQ6y2rIwgMhJ4WOEx6OAnGD4h7kY8o+3zeHoJ25cM9
	 7X1rKSL0Psr3vD4LaeigONka+sjmDOraZiq/MvzhgP8b02GSBMNRaOiRsA2dYcmggPDWp
	 DfF3ylzOfZ+/GsJhdMSOOO8OtBqyypxkX4uEoOKmzje+6faWewu15OQr8/5KOFy0DQ7GI
	 wAlrnkrRaglsNo926NqGeUE/PRgFpnAwezUzZ85pUAt2DKjKBRRpWFX5JZri6RLRBSvhD
	 5tOFm0yYQ2rz3MELdpzd/p75rLam8s1oJTR7JgnaU3yKIHDTA11eCJPNWX8W39ZAzng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwgWJcIC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=earvUgEV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6037460A5BEB
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6037460A5BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwgWJcIC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=earvUgEV
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeJ321427422
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=; b=iwgWJcICdcc6gV3A
	qe0suHdChWmHmOKJsdg1kL1rZzjhWhOVWIGk9E6CtdYtKM35tb5ZgwZhL8sLnpID
	RfEnkAUttShz5+WVJ11jDGTgVP2LyGM+FxxxhKTnLK5g3PONLtzL/sAOu4izbKHc
	NGwAiq3tEy4lG8Ch5K+vxfaCTQVLl5fNwFGZx9IysMNinK/hI+tGYo8w5Q/wLzYK
	FTKLGf0FAdxr9F96r7F0bk06GOZCpBbt7isN0TP8Pl+cGykH89kf1l7isyFZACk6
	uiLWCcX/Nk0SR2isRw1YEqls9hn+Yovvd6v91ga3xC28qtnEYLthtExGZj8TL+hn
	7s+MrQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbgue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:15:04 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988b6210181so35275241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103304; x=1793708104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=;
        b=earvUgEV45W4sQyW6cT4D9W69MCVM/ofR9SAHYeIs2efFlqa3RnqT5PWx9vib5PNJO
         xZESJ2A4LjAU6QBI6ySuBmFBygHQI0Is2hOWX6i5o7PmpFc9p4Hr6MIH3d02O6OA8qk9
         giW/yTZgMtmm7dSx6F7HnrCpxKtE0HuANkTA4KdxaWk0DP1+RmFgyp/XqHOI2zny4sME
         rA+aTEn1K5HfBnMZWdi32A593DaTEvsYnMB78ybv1bg9wSx1mvhOHPFGkhOuxfewYslr
         /X1hxTrm0/AEivOaUIt0hV/REJ2D3qbpnLgsK9329ssXMabckKV+HeDnMU6ZT7brrexP
         dgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103304; x=1793708104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=;
        b=sZfC0pm3xbdLDDhOdVklagw6WxeaN9cXJWNAJOTgVzjE6LwsCT6vOu35VKCMrb2rBz
         kB7MDQV0QVk1TxN8zosKTN/dyH+Q0IDKhPbLJwCtbAe/TBKZjnHEcAvXTcDMZNX0mCRS
         c+TRYRqKqkunHbAcxtPpRGiD+Q1cSo5+iCgBZiOVTOET9DMUjm8FSxz+plkJcGcQId+Z
         ubiN5ffDUJrw2h6o0K9Rwe1u2K/DVIQifBbTGt2he17tWPmKeRM7xl5bn79uBFMx7pfG
         6WtRG5x3QmkIPsiYQ7FA4rFZN4YmQIIJiQdDQbqT0y9K/SyMYHMjZIoHMhJ21jWNlNwg
         +hFQ==
X-Gm-Message-State: AFq9FYIOJ4UDfD2aWeOEAL0OgudXFBpccdw0I2iHKobtn+uBy4DkoIZv
	V5QbYnd/PzjcOMG0jOWOUHCEVQyPou7+eVoA2drZkPZPWD7QeNYlGY2DGWv4jdx/xf2cST6yvGg
	er12sco7wXsiZS2FdmpSdopHrrFFTrhFgzcmu8CZi7ghXGGph0L0euHXcUqFhl3/YWUpa
X-Gm-Gg: AYBFou09QGr5bMxlPeBsxeiae5ci/ky6IINa6xV/64jlFgJAxEsS60eHSwHHnlGbw7Y
	yWxtkax3CAVX+esf8MDuN3BH5i4ger6w/CciiQcODwglnOdU7NwTzCLNMuLxGPcpsppy1Kb09M7
	P558+GBuxQEXL3EpZKbVpfsxOSGwP61TyMg5UAZG3nI4hHo6q6SvFp0WqAqzBZdsGV2V7wiX9D0
	36J4Km3OQVaG1OhzC9HL+xknlzVPQCbnrn+jEOTclKYAcRo1+HMOdgd/5OMIBjcnOygu4aLOP5j
	xcBNJWVpFCIKIcWDfcH4gcRvrOfuYxT+wwiFPoQJr8653EI520m3x9WcrvfvGjzI46TLxFl2dQ5
	xyKeXrsiV1SDXiFrE6Wjf5g==
X-Received: by 2002:a05:6123:5cf:20b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec23954451mr3371769e0c.0.1793103303841;
        Tue, 27 Oct 2026 05:15:03 -0700 (PDT)
X-Received: by 2002:a05:6123:5cf:20b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec23954451mr3371755e0c.0.1793103303398;
        Tue, 27 Oct 2026 05:15:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89dbsm432825166b.18.2026.10.27.05.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:15:02 -0700 (PDT)
Message-ID: <c0c38ce1-7491-47b8-af5a-d3968d755085@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:14:59 +0100
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
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfX4vSStijKGw2a
 U8gaOa31vQUdo7vjxIle7xi7nUHjxdNqA2ugWJ3us3C/WCot5ov4seV+05sTfiYpAvNVxEJDYue
 KDeStPWwF5H9nPh0eD63om3AUJlBRVo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfX28HY6VT7cC4V
 s+7qECQ6FO6WBmPDmCnuwCMob+kFGRX6Tu2RC74S7WoGDUDvoGqM3in1ggrNRDvwheob5vDJl7/
 ZgFaoSPq4mxJWawZJlfhT6usGzNgMR4emedYa5d8gt+rubv6l+yTm7n0JODm/VAktSy5YdDLWI8
 pcNR6Y4JzcLI2GzNYU8/a5Xsm5rtujfrRaJZCnwRJ/eIUKqAUwRjke9cBA+RZLmHAXhKBahrCUr
 cdLBTIa7IFLv0pV6r+1xpcp7v/GLHC+y0R4K01ihaHDzFvlv3wdZ1polT8VgJCPBAKMZwkMp+1r
 UDor5B8J1s8k2Prlm9Binfkp8sVyTVmm6mQf5RY80nI1zpIoBi+cTwKnQu5KHv75KjL/W2vp0iI
 mDlQpz1KDMJCOwl0RhWsc5GLJdnTl1v+Yo2oXuwVj/UJGRowc4VtGA4lNp6HvZ2bpkfCR0URjjg
 eUppwS1GkTcqosL8RLw==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae095c9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=2zQhOlC99_H9tdcWL1cA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: B9em91qhQ8POGMQY6vzsMi906xYoRaSE
X-Proofpoint-GUID: B9em91qhQ8POGMQY6vzsMi906xYoRaSE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270048

On 10/27/26 5:35 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.

[...]

> +#define CX_GMU_CBCR_SLEEP_MASK		0xf
> +#define CX_GMU_CBCR_SLEEP_SHIFT		4
> +#define CX_GMU_CBCR_WAKE_MASK		0xf
> +#define CX_GMU_CBCR_WAKE_SHIFT		8

#define CX_GMU_CBCR_SLEEP_MASK		GENMASK(7, 4)
#define CX_GMU_CBCR_WAKE_MASK		GENMASK(11, 8)

[...]

> +static void gpu_cc_sm7250_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	unsigned int value, mask;
> +
> +	/*
> +	 * Configure gpu_cc_cx_gmu_clk with recommended
> +	 * wakeup/sleep settings
> +	 */
> +	mask = CX_GMU_CBCR_WAKE_MASK << CX_GMU_CBCR_WAKE_SHIFT;
> +	mask |= CX_GMU_CBCR_SLEEP_MASK << CX_GMU_CBCR_SLEEP_SHIFT;
> +	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
> +	regmap_update_bits(regmap, 0x1098, mask, value);

and then here:

mask = CX_GMU_CBCR_WAKE_MASK | CX_GMU_CBCR_SLEEP_MASK;
value = FIELD_PREP(CX_GMU_CBCR_WAKE_MASK, 0xf) |
	FIELD_PREP(CX_GMU_CBCR_SLEEP_MASK, 0xf);
regmap_update_bits(regmap, 0x1098, mask, value);


you'll also want .use_rpm in the desc struct

Konrad
