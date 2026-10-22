Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666831;
	b=SK/jekB4YtLD93GIuqsmC7V4oyQonf5nM34qWWrLDEHbWD0gUEUIoszQ96/0qIl513oi
	 UF2rwv3kEMinxGVhQbpJURCDGykQ+H6z0RnSB5a9RO5MvIglL4r60Z2xE/H/Sio0C2RSj
	 gV8ZbLmzoZ1mXO4kcpX/djk27ITkDWVlwWtKPujkhfBCPv+ywTcyFFuUoAZ2H5WZ617jy
	 lZ1fCK4VSRg/Zhefn3/L1979k+0SOQQEFwz4SVgiYZmDXBLMKN1NoyAgZTEj+tiw9RGHE
	 +nZGI0TmOQ32a63xsbAfvPYaU9W86inLsnaRZ5ZiC8QYvHCPHW5sz9oOl52Q05SX26A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3HGmCF0ASxOLS2y7H3kM1+aMPDTdYvwreTI3xARkJWM=;
	b=MSi22U1ww9GapJDoITVqt5uiNDXZaG8zMpV+KZh5y8SuGNhi1hYG51QmnMQDMxBwYJKF
	 VaI6TJytdlPq3TbsN43u0n9J5uVjD6+ZRdFTbEUFkqT4P7oSOn5QsK7AYZ35TfGnjfSat
	 nn5o01KUEZMrvdi/3GZ6xPInfbldrB6H7Gd6ZOoic8Umghid1ebgRA75DrpSlkXdygXCq
	 QCi3IYc2EQrLJLF+dZpZurQVfLc+sIkBA3gRkBGBfbgYbPoYsZoolj2O+PMWM0mroXsi8
	 bKaWbmXBNDV43CdpDYbdlyV0s91s6vO5JjFPCvAoIVNwdZaPNI03HDuyKvqF+xZwITg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1YdeBXv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0h3InPk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E31A606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E31A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1YdeBXv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0h3InPk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0AmG2918766
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3HGmCF0ASxOLS2y7H3kM1+aMPDTdYvwreTI3xARkJWM=; b=I1YdeBXv3GuA32iK
	GOcW83tArQvzILS3tGxCosSMkhqqGq20UjT6lRKZKZ7VYR9outJwfKR94/w6GwMk
	WNeZlmaR2M8acxdbHgRZ0IFon6PiU6tfj7JQjkIgxUf7x5zQqhk4TdPhGYd1D8gn
	2TbpfxV6Yu2hSgmU+fe3nKvShe2tz0x9bv52c1q3V9xQedkcfxv/gnI6ZeFTJX2l
	Zut4tvalxDrJ0Iw3aiRM4QLe0uZBQ1LqVGv7iU+3hfzyI7DZRsrZzK9JpePny4z0
	dOuKqMKcfymkNxtmkNCqhyOmbmBF3+C0iUQE6UN3TLObTpVIAJdH7IFhkZ3Pks2B
	Sz+wuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aactw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:00:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so42117985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792666829; x=1793271629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HGmCF0ASxOLS2y7H3kM1+aMPDTdYvwreTI3xARkJWM=;
        b=b0h3InPkw4/DOE4UWdcq+2zqboowWSn6b9by4K854xHocUML7iH6nD7kFB9jqck51R
         1yJj6p+XgYNyBbQ+UVQpmO7I+Rdwg19rrLc4X4mcWLK1EvzL1giVjDOuTajKuHVhnECA
         EvF7LrSwCbX148KRLOUYuAJfgFHflTpGyEF8TJcXPtrTDE2ZL2JiJO/zwu/KwzIZAj7R
         SZFwVDNSKsTGPMHos0toUx+dIRcr+ngiTqdBGVMpjmmkNsQ3dvA/SE2yppDEE0cfcK7Y
         BNMFtpeeqhWVyn5Q5zycSm1ENnpLHgOflTKcAu8S2T1wXdx2SEnjwAW1DetBuOb3T2mv
         gRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666829; x=1793271629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3HGmCF0ASxOLS2y7H3kM1+aMPDTdYvwreTI3xARkJWM=;
        b=gZI5nI1iJJHBhW3rkCuZHe0XdZrsrfr6IAV4S15CRcYoQuf7x2vqqg8y4wwWZoiLkT
         UbPNQA8Frq8zdaacCI6gbFyQbT6cce89jx//i6F2cktQKLRIeXis7cuz0Ep3Aobjqh3C
         +UdsQm3/2/HH+lfO/MzCdMAndjtDkE04ONqUxPGVvNBh3qLYZETTI61jlPTY43H8Kpeu
         oeJZFxi0S8fHh51gczEFGILJ/A5ScsvIaJDK9jEd/+9NQgSOnyMASXjMrT28ZXA94KPl
         TDURUMt+QLUXbl3OCCFcUCDGdIuW36kDgb8mqdAo1Sf10ugLibVr2nEgIkqgB703giRk
         oSRw==
X-Gm-Message-State: AFq9FYIJteB6mjqPgxDz64fxA6gudykQ9ej+5tZ8jBq2+BemKha3wbrO
	MIHnTeZyI7jkDUk68g/b0QsOkLGF7loVAKrft20icaiJ4FJ7xY1rtF4DC0d+KVJgPa107EALftk
	mr9nvMxPzcpOOcz1if+rcqZwamtz0W4EXpfIrxA+Zq5IbvubxLDgNC1QFXomik2KAKohu
X-Gm-Gg: AYBFou3FzjYBGDYKtXI0taYmqUpyj3ptr1gEy7X2EFBI8LkzKv31jJqg6qhsF1f9zLS
	bKiMxeWTZbZ33XmfT1avK1i2TVWd1M0j5B844XGCVBmChy9gmXbyHpQWAlh+9Vnp5155ENAWZhD
	EssEOdkeKO+qPoAGbrsThdFOYWUlFjaXNr46R1TZ5plDJQQqfAqv9rSKcPosPkzaEM2+RPr2flz
	vsz0gvzzQKdDIWKbrBuT89UZMjsWl8m/BdMtzHy5NVr5PR+2mw1Wix14ud5kTR5KmlLi9gCAydQ
	S+HG46bSsanvVS6ItDHyVGU7xvZDJKWaN68hQN4aYk25y2WwuVAriPX8aDUb2M/A2hsunGhPWp4
	VpsvYWfC3C6MfR1Bm8dYz/g==
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr1077438385a.3.1792666829356;
        Thu, 22 Oct 2026 04:00:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr1077433485a.3.1792666828987;
        Thu, 22 Oct 2026 04:00:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5ba26csm90719666b.62.2026.10.22.04.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 04:00:28 -0700 (PDT)
Message-ID: <d54b50ee-f0c1-421a-9d1d-5dbcf84d556d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:00:19 +0200
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
Subject: Re: [PATCH v5 10/11] phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY
 init and configure sequences
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-10-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-10-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9ecce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=igDMAPUHuX2-SMk_MF0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cFFGiygaKusXbqq-PAs4oHbkOlgMhyF5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfX2LgfTFlKbifK
 LhPu/5GfIB8ad4Ez2/6zduQ21rP664bg+3VC+BZ2+AF4gsRK+VNOXxxU22ZByi5b+fQUd5jcwnH
 X5S//K7AkBzop7HbMWfnb0+tTe4rfV0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfXyfDL5bAGvKJU
 qygRyY9BIviovdDE78VQQ+mz4n0PJgH9tWarqMFNxviRBgCAq1N+yZI7ZYMYxwh9v4DcdbUyygg
 egt7vP7MdcCjI3DR+B4IYoNqNpLKvi5Ffa/Cpn5KW2DSF6f0CIgr0Q5R+e0kaBdQMqnEmzRy4DV
 q57FKGg9e4RDl+s2mscXTn6TqVxccB6RaQ1VRONBGDeXeywno1CNurhXmInomlVcHSR+PjcQKOw
 Gxv/4oQOWSMH7FK00oln9eT75TWGCYogkl04VsYyCoQg9tp9iz6W2hRpD5U3pACx9lBwBc0I+oY
 j0ni+UrcaCZsL2BOhE9cgfkrhOu1LJp6KDXTgTvY/sCYBxXxrC6RuZw2ZZ+TvFPYq0Cb8cVi+Yn
 Q2YMqA6TZDDMFr/xSd7sktZ41hrXhsGufKQUTC0W6bAnGG4uc0HpmJZTiHQ6B99W1dk+Ozf1yx7
 JTzzfOI1wTo/Oq0QGiA==
X-Proofpoint-GUID: cFFGiygaKusXbqq-PAs4oHbkOlgMhyF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220043

On 10/1/26 11:34 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Update qmp_v8_dp_aux_init():
> - Add CLK_FWD_CONFIG_1 initialization (0x3f) before power-down control
> - Replace PSR_PWRDN with LANE_0_1_PWRDN and LANE_2_3_PWRDN in PD_CTL
>   to correctly power down the data lanes
> - Correct BIAS_EN_CLKBUFLR_EN value from 0x1c to 0x17
> 
> Update qmp_v4_configure_dp_tx():
> - Correct default TX_EMP_POST1_LVL value from 0x20 to 0x2b
> 
> Update qmp_v8_configure_dp_phy():
> - Correct 2-lane and 4-lane driver enable values to 0x30 (was 0x10/0x34)
> - Add CLKBUF_ENABLE (0x87) programming for both TX lanes before driver
>   enable writes
> - Add TSYNC_OVRD sequence (0x03 -> 0x23 -> 0x22 -> 0x3e) and
>   LALB_RESET_TSYNC_EN_CTRL (0x0a) programming for proper TSYNC handling
> - Fix QPHY_DP_PHY_STATUS poll to check BIT(0) instead of BIT(1)
> - Replace post-lock TX_DRV_LVL/TX_EMP writes with two COM_CMN_STATUS
>   polls (BIT(0) and BIT(1)) to properly verify PLL lock completion

If I didn't have the LLM at my disposal this would be really really
hard to review

[...]

> +	writel(0x87, qmp->dp_tx + QSERDES_V8_LALB_CLKBUF_ENABLE);
> +	writel(0x87, qmp->dp_tx2 + QSERDES_V8_LALB_CLKBUF_ENABLE);

The HPG asks to first write 0x8f to first

[...]

> +	ret = readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000);

The programming guide doesn't ask to check this bit and the way I read
the description of this bit within the register, bit0 already asserts
this being true

The rest is OK

Konrad
