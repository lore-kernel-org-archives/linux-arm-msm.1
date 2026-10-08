Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9C73B841F
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 05:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439023; cv=none; b=Rl/A9VPrtTdl5KYJudWMXuIDCr5A/OM/RxswFIJuvRJNnnYbYIQLcAMzz0wQxhcqjHzL/MMbgRn7JV/47mya2EGXgxejodfx9aYotrrmqW4XKBBPGcJkxRzPar5Wa0DYSDRASqjUwBPPpg12mmImreYModMvpR8r3oFaUrDGv88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439023; c=relaxed/simple;
	bh=ceY6AYpjHs1ElPPIAmrcrxWtf7KZKURR1QziCbelGPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/TAREpFYvh9RYdT51ucPIRsYzAKSxPPoXfuMnI6UydBXPWRozGc7aN+f3wbUaQ7hSs5uNZ4eqFJ2UYwEAZYteI2kYSbNoGMIXeFOs48GCyJsEu1X8I4Gw7MteRuQbgPFX5w5p6FK36jFb4puFZz3RaY0mCVEaxLvaoYI6w6dGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOlsk5b+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDO7n1GM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NOlsk5b+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDO7n1GM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BU9R2774937
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 05:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/Zgs0WMSKVyRyw7zUHqtPNt5IdRRFTMiQLOMjFu9cU=; b=NOlsk5b+qYWY9dte
	P5ZSXTdbOe975t+hPrnB4MthxaYR/6bW68yRNJLo0rfF9P5h0lqR512AigeOwJI/
	xOY5klJRK+CSyNB6s5sloWEXuYxCUQeuSZrDF756xdobjZrqDkCwe3WbL/YXmHBZ
	z+9/H2en8LP3Vs3iBP0nQ4bpqz57ttCLOanXMvobtCHvg9TTpN3aboaD6xy58d4p
	HY+D5NNibiHkZ9mLgoQRq25xirfrngjo90l8zox+AVx8nCXYPt3nS1N3kEWAO/4t
	Nf1/Trv9wt9ZdlkiRI/fVzDe/dudiNfPozCuMsOey7zw/AQKYeQlcKF89CkAGkWE
	4t+eGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe69brm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 05:57:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-535294e0f64so86237311cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 22:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439019; x=1792043819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/Zgs0WMSKVyRyw7zUHqtPNt5IdRRFTMiQLOMjFu9cU=;
        b=XDO7n1GMISgsVB7rAEPRJoCAJWzFobaBEqtN75mb2MUVB38CUmrfRuQRcmL0HfvDMH
         kizjWRtfpPIQ2mziUdq3/Cevuf/UOLDUF1iYMjnlBrGVE+n+NbJZYJ4wYVfhHjK/XGzu
         t+wVWrVjcu5xbyGIMI+hCH8pxsx9e3FiyrAwjjy4q9k7jnH8MELXjPI6uvDLUPa+LVWu
         jISfKeS5C3VX6V88DN56d/BkIn1ybgJeSdCs8msUUaS0CPoAbuM9SUI8xNd+wGLV/usa
         A+odPfGKccxqXSrW0eBUrhOGdim9qXsTSV22I6lJmAxdKNyp2b2JYRur9kXTVjPW7Syv
         n8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439019; x=1792043819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/Zgs0WMSKVyRyw7zUHqtPNt5IdRRFTMiQLOMjFu9cU=;
        b=vhLh8ip4FFVLpzV4QcxiZL5CCpI5QegVl38UErdR72NjTqaygs2QdtR2WcYTW2xS66
         n4z97mMIdAbtybjTs/Q507MPm8SXSAVcSleQ+wBA4SQTKzz9jW5PDNSGcR1/CvzsabH3
         VcRYe+fJIH8O26Y4lueMhxv7Ma9C0sHCLTcNR/f4Rm6K4dQ5ND3ia+E4D6s7jwcJCJvN
         9ljDvO94wiwP5NXzUUyJCeQWvxY5Q3fuDliH5o1Fv555jvw1v6EQ8psDwJLZuHRMnoMb
         Er0ccy269Ik3KI5B1baaxi6kYJgFtBcBPftlP9EnzXNPrpNxAAEh1E50G9yQGKFCp7x3
         xlqA==
X-Forwarded-Encrypted: i=1; AKwUvBzbQVjYrX27NYajsveCeiy+dm0fXwbwaQFndc+wkw/q7LqNQT0eIWiIA5UqQofsFMSQyD6Vymy28crRj5JB@vger.kernel.org
X-Gm-Message-State: AFuF++lUKvwwHXfHc7FJtRWBRRhS+pj43/G1aLObp6J48CQXas581oXB
	EcyzJEjt22QpGfgwWfP7ThAPPdIlHO7XysG8wZlwqXKQHuUmrdR2KBwAAWS2oD5NnuYJjx3mejP
	5SNolN5IXMZFeFwcNkojAaEPmGgD71GH6LMmOcDZPKKSd2Lg6sIBhM6wmoF++J+uSi0Af
X-Gm-Gg: AYBFou2C09WG7FSg8gNsWyQTOnnNwfuUWulXWO0goZ0Fmqz/gnnIniPjDyAIRyuL3Rm
	RuLDokLYn4+MKmMeiDEQhIeap1rI16RX4JGiVTlCk7fqTmrHqjqvgpfZ1XbnNWhBbAG55ZVQ+nW
	0jxCuX7LV8ILFiOg0642aymv/W59wEZYS1pk78DAX7kaM4UuWO0sH0kgZ5IH+CUhqic0EFZY4RS
	aIy9UnxBWSzeVXtWrOk9AddZyviDOne+pKoV3//jSwJ8qbmd74eYqaeplwMKW0XNxWagQaZJXsv
	Ryxm0kWomXbqj/DP1nIF+2x5QNGk35U7ljWVpxbBTtoxACHjBCpplwPOm1mmuJ1iQYeC6+BzCQE
	HiY9eBKrL4cC4LdSXov890jRPcLVjBJMegLCfRAw=
X-Received: by 2002:a05:620a:4411:b0:93e:9809:8383 with SMTP id af79cd13be357-93e9b8781eamr916572185a.67.1791439019189;
        Wed, 07 Oct 2026 22:56:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4411:b0:93e:9809:8383 with SMTP id af79cd13be357-93e9b8781eamr916569985a.67.1791439018764;
        Wed, 07 Oct 2026 22:56:58 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71bd7983sm9461851f8f.6.2026.10.07.22.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 22:56:58 -0700 (PDT)
Message-ID: <6a2df7c7-274f-4620-8a56-31551536c49a@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:56:55 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/74] media: qcom: camss: vfe: Add planes identifier to
 struct wm
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-28-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-28-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BqPa10fiKaKCGFSyZ7usKeNP9dFP506L
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac730ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=X4GJfOngNdAlU1NO0XIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BqPa10fiKaKCGFSyZ7usKeNP9dFP506L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfXzZVUniPYcUR/
 K4TAWdxCjQHUAYf+cliDBWAWPiurqq6j8DqxcbP868ekC+SdF2J792A9BHT/geHYhNUEccBxAZI
 bNIXsRdXrvqM7czNd0oDjIwTJDPz43jxAlq1dfMo0vuDsPJw085oCTGHxPUnJegIYCoAN2RreQs
 Adhnt0zUFfiDAOGDjzfGfNgxlUMJ4/a+lUCaTenCIrschK8oY1zok226l7V3E5dIXpZwfRGKUCG
 8nLsl2DV/goamwfV7wiEzhKZS4Ig/kQ3XYBGd9zzqi40nxKvGCOdrQW/+cV+wHFLvNpHRDLBYwE
 H9swfH0DVJTn2SM553ssHQhH64Unxd50l6jWp11PCWfmOMDBrdkLcXfHk9qpuVm3btd2BlwUiDP
 oZia/weqoXQztt+EjuahS7hDQNKxAA7al75Y9kE7e2Z8ZnqvjWmAgAR6D8qei1Z3Cyd8tGuMbM6
 J8GEcbII/wfjjMQ132g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX9GhRx8Ni1UVm
 H/btlXXTQ8jvjcAzOY+dCFlgjB9ak5KBbmc8stQ72jsg3V/aIToY7TlN5zZFA8nqx1S4MRJGlkl
 nOM8JY72/K9Bdp3TGg8d4irzvMxhZsM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080023

Hi Bryan,

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> Define the number of planes a given IFE write master will write as a
> data-field in the WM structure.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index bf8dccf4c901e..8bc07fe7798e1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -101,6 +101,7 @@ enum vfe_v3_comp_group {
>  
>  struct vfe_wm {
>  	u8 bus_client;
> +	u8 plane;

Can we change this to num_planes, plane is somehow not well descriptive for number of planes.

~Gjorgji
