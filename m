Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702614;
	b=AEfk6HPBZhaWzlSJd4L1ScZKe96Fk6nfzmy30Kncql/ivMQx1OTH5y+lFJ9YeNYpJPO3
	 EW+ELV0yVJeROE/vSs+f6awsA4ASwzNbYFyWi7BSx+aHvWA6M8B3qayrd+Ls96+Rpt+zO
	 7oKnUrkdbeQxHS2mPtBFKv2oABQJELKHX7Obh1LZo7W7fjgKG1cs+3n3Evojdd1x1ZinB
	 khUOSEeCyJ+rJp8nO3IQOWB3ST70Prx95UAESHUwl8I884ahAPqs+5NAdVl5WZVWKXWVy
	 wc7VRLezkSNyyAOJ5+GNMGdn4ExeB4iE/Av0gS9ZZKNLBzSj4apRKdxQRoZJr57xnUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=81VUyM9OyNKUT0VpP18THwSLW7N2IcKNAzwm/Y2Nd04=;
	b=Ii0kS2e8MMFiO7biNzgqM1vKrx1JbZWmj/7pzowrZWI6cIZBZ9+HO85VN/GGXCIORj6h
	 ZaCUO7wybqY7dKo9xf7nYufruCqDonofg/p7iVwlbp+1HGfAhNYq8Yrh7r/ZlEhYGcnq1
	 46RM4wktSi5Bq6njcpa+uFfNaBj2KCx5M7w3Unkscfl9zh+pJDh4sNOGh3FGmbplpN+dP
	 yMVae/ZNqBY0hEwUg5OmeDpK79yz07hn3HzGDhW4NFrFbo+dSV59Xj29xQqIduwUiBUtS
	 nTFSIHkZVSFjxRcI5pnCBSxjWB0li/qABK/hR5DPMfVT41xSIEbVzDuLWmt/t5kGl4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWx0JCOG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTmTi2HT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8690606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8690606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWx0JCOG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTmTi2HT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVTRx2785132
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81VUyM9OyNKUT0VpP18THwSLW7N2IcKNAzwm/Y2Nd04=; b=GWx0JCOGicO0i4LW
	G4Tew6ke7Z38UvBMWbvtQ0nk5TvnngWUI5xdJJdAuoV7XhvJzd5cHgrU5HjfBEEL
	SO7PE+zqMDEqV3Vyh4/HDSYqte54Sigk+KSYn90RV1P+tfJfHFS5MFoBvmMILDIu
	9FPtEZawDTrbxTXHBeZceFFMA2uRSK+NkGYGNtE6S0ctoeGEhT6C9WgxLBe8heXo
	kqs4UZxrElCwFGRfjGGjEh9gAFn4msgsWzRMursE3tHNibr9hppCoV8swVgR3nRH
	lXXrJffwBvWD0SkKtlTMaDPKvbbldhMn+Eo3k536gcbrybBKUvViobR7R/swALKk
	iCczcA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfb8kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:16:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92134a35ec9so6247596d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702612; x=1796307412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81VUyM9OyNKUT0VpP18THwSLW7N2IcKNAzwm/Y2Nd04=;
        b=eTmTi2HTS+/zYBVxzOZ/wJNY1vydahLtkySrZ5RF2oHXwhAifl3QLLBhx3D+ynnc2O
         FBXELO1Rt7xqrpZDkXgxa6Exl5gXBdWxyuyX3vW+054sZfePh0LQyJhWHkUD0Uf1KZoU
         meC54OkEcULUem63G1pxMbhCePawtKxIv20I7z3Ewzzd8ReKig3MDHiFlpt78cs+rAD1
         Zfg8O0TqfNF4VkmI5sBmGVYVpFldE3LxrsVIWUE/n3B8AzWcbiRpBediw2AnO7jt5Tom
         ZOwxBwHDHfrtdoIPKygHIET0puGq71L4q+1Ph7B66EFP3eLNfvi0dqc/NOMsR8/RqYQV
         yU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702612; x=1796307412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81VUyM9OyNKUT0VpP18THwSLW7N2IcKNAzwm/Y2Nd04=;
        b=zHSHY2/qrdMAGKsPL7dMQBxDM/k8DMms4LEBopEWZvSVqx5BsibSL+aPIv/NB1W7WE
         4KmnQL1DKQm9WoFB/96drL/xcf0hLzyf83ZS+mpuh4j2weulc160P2UEOOLlCImHGVI7
         G6IoL5h1ctY+HbXHCERF51ifMcCYcz9T8B/JmaHnkMYb0uzpU6zJZtv2PtMvmSPWTR+7
         WKHSLAvmlubIhEbc6XE31oQwbICrYl9g58er/UB8BUcltuXPPoGJu6uXPYdoPsr+Drig
         66wl4f1s/Xwnwz75VJz6VH6O6X00dtB0EdCGE3uGV2Y0Wd+6sFJC60KxUr4zbJyWBye9
         g42w==
X-Forwarded-Encrypted: i=1; AL+hErGJ711OOf0czXNEQSLmMhaH5Wj2tk+17sUw2dN3U4NTJxiLcNIjmZhOr5BUqEdDeMCfiFg/YU9zq/utqeNG@vger.kernel.org
X-Gm-Message-State: APuU4Z8i+WSMerlHk6IU6PY1zR6DmQX/iKRqNnNbnEoHta/+pkS7acZr
	HLJwCItxEo+DgFHJ3NZbQsLumLWCIic+to2FHwot8MDtmn2M0NyF97mIV2lRcWKD8Wmx4crqemk
	O83OOJ63Qh45Iz8FbYmTb8qeXFUZ37Hx7mZWZqkzm1oqfzyRLo5rNOXwUXLBc9Wp8brrp
X-Gm-Gg: AZFdTZcOBuAplBzP13VpzbAHvRHsAhw9f4X2ecLcPeKN+tbiYsNbggOVfFLk2fzkXHV
	wsXDqkvG0O1wqiXUpk9rw9FWBpj3kPWvqGzXmpbo78KGqGWwEWdTfUvf0f2muPzkpNTP12ae5od
	zzzdbVXO1Eb2v+ivGhy8Q/2DCYIPpcTeE5UBo55z/Brk9dSDGbipWJW+ySK+4VPbSsJ68IISeYH
	YhhAlqgUqjHUwXI+aBKqjS7QD3Yy7GzGkYA2O+A/XxpayPsYXcRWmRz5HVH6lyv+1ydjd2ttgDS
	+ttIQWNl4tuDitfj3hs2lEby36nVLDNYleu4tzl0nkUXryYeGjw5VS815tJoyvaiOPV+izI0Hsp
	XBXC+Kb6q/w476yQA/mQPwqBqUWq1PCRm/x+nPS/Ui8q9Nj5VfhMRoHF4+joVzrJFDnGlUGA=
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr3824485885a.3.1795702612016;
        Thu, 26 Nov 2026 06:16:52 -0800 (PST)
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr3824482985a.3.1795702611598;
        Thu, 26 Nov 2026 06:16:51 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm2858929a12.2.2026.11.26.06.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:16:50 -0800 (PST)
Message-ID: <5cde45d9-40c3-48b8-8074-41342d0cc11e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:16:47 +0100
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
 <20261116-shikra_qce_fix-v3-2-9ae31470ef48@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-shikra_qce_fix-v3-2-9ae31470ef48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3cc2Jys6Lg4C6Rf0gkh8z_fesEb1OYir
X-Proofpoint-GUID: 3cc2Jys6Lg4C6Rf0gkh8z_fesEb1OYir
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX0ewUKtxedhZ7
 6Od58prMczl1ZNxmcdtFho3MPGPpih2VVMzkj8+Nt/R8z77ULqK0v11oyQ+QsYOSZkPJI5xLIPv
 C9ke4syRey7h7NkSwxlmPsunk1IGLX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX8WLNnQI7a/HI
 hANQ9R7tRd88uhdQxhFFqoh9mIg/6+8TKKfv70K5dK465h9hOtPm0qpZM0mahrziYc22n/onEnS
 YvEvZXdt39ZE7Y7X/DlTr/IWFO4Muu4QAoFL8v305b1Tg8wpX1w0fd2DdAKxIGukS7p1z4CSmE5
 4zo2ciytKy5sAonC4O6FoDUGXODuG8tlv2f1Jt87eet4ioU8f/ghugLAH5YNFyzb7FiltRN6CNp
 vBk6Yg8hX+tMiLyB7+8XyDsXYLn1UUQOgIqsN804fIkw+MmGs37VXkTObN75P3+mGTlfUVxlToo
 /yxttI+YKHGkrfeBNKL9aZZS9ldODETu1OKacW2MpWrst6q/gQRYPrT82pEaYL60VJx8GhVxD9G
 E+YpzLDCa2WXvbnqGvpZXwuRiG2cpWtTwJFP9uDW20RCCsItP67ZlemPMUnisOBbSu0jCE8eZ4e
 vtMny/YUN7AsZc2YbjA==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b083f54 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=i8PxzMkZueSLsKX-AXUA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055

On 11/16/26 9:59 AM, Kuldeep Singh wrote:
> Shikra QCE requires an explicit core clock, which is missing from the
> current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
> and specify core clock to match updated binding description.
> The crypto interconnect path is already described by SCM node, which
> votes for MASTER_CRYPTO_CORE0. Drop the duplicate interconnect vote from
> the QCE node.

I understand the need for the clock, I don't quite see what we
achieve by removing the interconnect

Konrad
