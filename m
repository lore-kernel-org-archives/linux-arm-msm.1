Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCCC521239
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861788; cv=none; b=mBNe+BxDrp9Ze5NGIovSfdB+qM4WkyyUH28Wcqqc9Jppi9C35ywzbD3i2ciDxP2fEigUMcPg2R9CcEX8PjhtXoJNC/10+FCG5FmvisCCGzLHI7bUjihq2BMrSPz98EJWMwe15z0KhVkIWkIpxSe8HrLG6Xa9l2jM1eCOnsfLUL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861788; c=relaxed/simple;
	bh=/kV5KNm2NElzdWgEhP89vL19qXoDN0J/hFsVmtiPlUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DsK7L9D/nSr6+ryt3JK9lj9ZUrEInfgiKhU3Di4Sw3deXaNABk55ql+TgdK10WIQJqLyTZBBColfIZywTs0WTkDFhbsMdAPXFOC9YFQkLbQSysrKLQjFRO7HLKC2FDBl+mHagWZphLLApRNf0RUdyKutrXca8wVWfYB8l7sOLUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0LKdyBt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLAPM18l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0LKdyBt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLAPM18l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LdYF1477247
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 10:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOQVO/1XCZAqqNfckMSLuNgVzsnrZj/QnZdzmzANmCc=; b=O0LKdyBt6YXfEY/Q
	uNsJdxLaKQHdIgfGxVVLVtiQZUTndy30TDefw1cbWEoBDJ/efbvqFEdu/tHuVC36
	Ur7Bt6LXYG8RbuHRU0oC/IrPhBSrzG7TAxl/k75g2bgnMxRMh+BkLW6eaHl1fjXt
	0ob/a+VDtfKjEPegoYnbKPSTd2DMO+i7V6PauFpkkPmTlx+Qmz2DTgGSchiC6jvX
	BnSmf+UF0lrwRugB5T7EyZE9yt1+9IIEma7oi9kATqJcXI8oOkV7O96MloQsf9Fp
	gTD6TWdQEqc7SyxojTfaSqI8NyMSEuAp74HRvQ8dPxNAph1rCrAWEWqRnEeDTiGe
	lcubNQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjhdkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 10:03:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db050d469fso27419295ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 03:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788861785; x=1789466585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOQVO/1XCZAqqNfckMSLuNgVzsnrZj/QnZdzmzANmCc=;
        b=KLAPM18lBIvgF8iN/k1OCkjeEQTkvGnfEEA8btPa3Q0R9spyGWuBMG5Epu7h/Swru8
         P5NYHO+7Tf7lDFkfVn9XFKy7wdwCgCZVMWTO3LKjg/byWSN72dlJ+9Qo8dacKpH07Wd+
         Ok81BNujPVrhHBeEgDOsMz0x4raTiOK4hhaTJ6+NHgyR8gQZTPvO8NtS+M5FORw3QIMd
         C8pEYE+EFkMhWfoB3sba2jU6PnbN4PBy28A36pTGZZSa7xNGu4ELbgU/ngEzXbaUpRAH
         RiYAOD1aHfYxJhbdmrqVG+CjbRrs92cBcOgs6lXq70x4v/H/ZjCKnEEtVHXscftnG6dU
         XQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861785; x=1789466585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOQVO/1XCZAqqNfckMSLuNgVzsnrZj/QnZdzmzANmCc=;
        b=L/7psJE2pgXOfN1C7jy6IUd9F/NVAmEB4bXo4EraFonUZhh+G7ZO0ZweEwsWcXZqP0
         xVv3BnDVw2VWyBcpPRkQ8SuFu4f+HHQ+l9aI8ktYIHMcmv5GUNEqk8jrUmNfXLNQbPj8
         4bylxgsVF+veLm+BjUeFbF2AqS8o65keQPsEnIkcWCrFnawe1SX9PIdyRW5QYK5q73oo
         t781lOKOh0xCz3U/bF4R6zaF+L9nVXG/Y/s+DuCa8HNgkNTrWt20RLxJXK0oLW3/O+tj
         2XtRP9TODbiqigbV2ZP7/1TBXiy8Zcfh8eRG949CYUwFePlG7f1/Ive6dSFMXQ7+xQBo
         4hFw==
X-Gm-Message-State: AFuF++nab3X7Fe3DCbl2kW8f0qi1wdhDpiDNtjvdN4FzfiYntwrXMajP
	s2ttqlmNOFftJmVpAdiKP2vLF9iTMLEM+bWKwRU3cF7Qkum93EHhecw0eJt0z5xwX6HwYcm5tv3
	Ugh15M7ElR4C3ZIbEqUizF3BVftsxMOCrR2/twO2RL6dai1l8h0Dp1Per0Yg/00moTTnS
X-Gm-Gg: AYBFou2HPASAYbQhu2WCNsBdMh13xx+G4FaPnQHrkSaq+qw9Of6XI1Be6sbBSLbQkJC
	cKXt1WfW8w7KDMwsrx+QnIIlE9ZdtJxAwp8z94onaYRdC8BLm5CObP5UYv7ShjDViF3AfNln77A
	E4BEalKBiURydCgJ+bayhuoD+d3uz19XueSQ11dBPMCIejiEFjq9ez/RbyUO5esuIU8g4FBxw0n
	fZVWlguyO0Ci2p3o7F+WlVDHZHZwdQv8YTXn/AULFW3XtALx2uVdvAr5AFA3EW9trfDnzez2pKS
	mMm6MZog16Vb39P0FEsscQu6CLuvPeMJyUAGh5CrML4Yhd8DZmEmdz4BEN4Fcf3DBj3Sm8Bf5xw
	SoYk+HT8a5giBBrgeLzriMOwfhIxIYtLSWYYxu/5hmUuG816vEmkCwb7T9bFx6Oka+GYbIJLUSS
	YmW4NgAGqHUchLP+vT2A==
X-Received: by 2002:a17:90b:4b04:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-39b07f33963mr37751461a91.2.1788861785222;
        Tue, 08 Sep 2026 03:03:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4b04:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-39b07f33963mr37751405a91.2.1788861784714;
        Tue, 08 Sep 2026 03:03:04 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm5896478eec.14.2026.09.08.03.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 03:03:04 -0700 (PDT)
Message-ID: <4f518cb0-ed7b-4c2c-9a79-8d1549b26428@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:33:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEwNiBTYWx0ZWRfXzKp6Zo9/zCDP
 ZTVJmnaNLDKGPOUdeLoSDnNaxM0UfsnChAW/Nf/C5z1vVqXXmKzYljT4OcDWYUp9/Gh/dsrm88Y
 zNoFIq9hKcqEyzZsu4/zTSv9mR3nbpg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEwNiBTYWx0ZWRfX1XKZdKrSDEeZ
 AISh6UiQoz0PJN6z7EKarq5YapCwUGjmOLEqTt1GvGQ1QeacySnNI2pHxLM/nUWwd94AGbj6j4/
 ehfi0xgonKxEY8Gtl2QjX24v5xysbtMoehmqQUEo/vq3QxtM0M4A1vKWwlc6hESh7ywCpmQLyp1
 FYvSUjeP8v9roUw+m1vUktaQ58NynYvYmbtQ9Qk1JEAMz+Q+v3q6ZHHFOV2SW1m/oMQ8EZ+Xt0J
 e6s6bYLiwf8xj2RRLJsP4p/qm/PpdkOyrA1pYgKBjpST2fSlZ9cupQ+3H/4ue9Fe3YCtAEvGcfm
 1vUSmscqc9uH6u/ioHWf6ykoDyuWg2WdwreMOYcmAIK/IZs7Yt4fnYnZr6wwELMkkY0I4f8x3XU
 dPk0Xi9MvPap3JVUuIsV/OUxduP78fh4RhDAbAq76Rtz17a61iu9m20H8oJ7DlAsFxQEiiLyp0f
 PhbpSF/8fL03xdanleg==
X-Proofpoint-ORIG-GUID: -4K6HCBq4uiFiuAiTItTO7xg5z8977WT
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fdd59 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DCVHxXmDXcIwS6LAp3oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: -4K6HCBq4uiFiuAiTItTO7xg5z8977WT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080106

On 9/8/2026 1:43 PM, Navya Malempati wrote:
> Add SMEM items for four NSP subsystems stats which are present in Nord
> SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
> id. Add new entries for NSP1/2/3.

For other targets as well is the same applicable? NSP and CDSP are interchangeable?

> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_stats.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> index 06923408bfce..91f2d1293124 100644
> --- a/drivers/soc/qcom/qcom_stats.c
> +++ b/drivers/soc/qcom/qcom_stats.c
> @@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
>  	{ "modem", 605, 1 },
>  	{ "wpss", 605, 13 },
>  	{ "adsp", 606, 2 },
> -	{ "cdsp", 607, 5 },
> +	{ "cdsp_nsp", 607, 5 },
>  	{ "cdsp1", 607, 12 },

Is cdsp1 not the same as nsp1?
Adding cdsp_nsp_1 is very SOC specific

> +	{ "cdsp_nsp_1", 607, 69 },
> +	{ "cdsp_nsp_2", 607, 133 },
> +	{ "cdsp_nsp_3", 607, 197 },
>  	{ "gpdsp0", 607, 17 },
>  	{ "gpdsp1", 607, 18 },
>  	{ "soccp", 607, 19 },
> 
> ---
> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
> change-id: 20260907-nord_stats-ea163d025d43
> 
> Best regards,
> --  
> Navya Malempati <navya.malempati@oss.qualcomm.com>
> 
> 

