Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112073CB8E5
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 09:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945661; cv=none; b=fwFxirXmHd+iZDBx2Jo4DrzWAjoTCfB53j0/Q4/cAzKiXrKSgk44/v4Dcza7LkNh5emw03VPy2uvwTYjakoSPFgirCgMUfDYb3TrDEuCPtharXtiU/ND2t0FAPHP3uB/hoPygAbVRzkrub2jeASth3+UuwOURW5C/X/w7fcsqTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945661; c=relaxed/simple;
	bh=ukcWglz3b0XxiFuNMMjBoSzp+0cQUC+nI3t9GxS1yJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nT+Yb6MA+IuLPEj3Ap/CeG6I1aEiBTXhLebAzE1UCectMxYnxlEbzPkEtPoUCuxTzxbZicwzAIcIs7CQx8eR6FW9YQqxwmDSTMFHPVmnpfQ5cZ3HqRtePfZ0DCirrvN6+jB+DbayDPcOSBKuixDxPjxvQkcVz5XIngYvCHDv/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gq9YLOcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqHS+lVq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gq9YLOcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqHS+lVq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6898h0PX639485
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 09:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukcWglz3b0XxiFuNMMjBoSzp+0cQUC+nI3t9GxS1yJc=; b=Gq9YLOcGElM9zYWo
	mKBl6U+Qv8aHzZtMkr341dg391VyqGtc7LZfSLY2/LCq8/tKUbFrDMT+Cuq7yj7F
	CpN1Y+XkwvV8FrNGU9xkGAXtc6dv9wyDSKo5DWBoto/hqQf6mPwmHtQRMk0S1Msj
	AcNMhzMwqtP0uEyozQg/v76sRVMur8pVhfWKk+NeNQpcjGFCDALmWDDfNTaB9ppG
	gsXCgLYhsICqNdhx99NT4yjH/Vl5aNxYJSHpU3xykmJdCA3SHnG1YU0zsVaOwq0u
	K0dJm7IaHJUnmn5iUICEIs6Dy15Jsv0MLAhXfKKwFp/dbHQfeaVwzYnmc4LIPt65
	2Cw1lg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqj9gbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 09:20:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso101254185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 02:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788945653; x=1789550453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukcWglz3b0XxiFuNMMjBoSzp+0cQUC+nI3t9GxS1yJc=;
        b=eqHS+lVqA66VjgRkmt6lgAjHZgeZQBzaLI+aXvdDWgM2FcKK8X/s1NLUSk8O+YMma3
         LC86HpcVClp2yYqMWFGHrkT+hbTrv8iV92QKDGymUFdq2H5h9YA30/pM3BqzI5zz5EWW
         WTVV1gIrZLlVkh96QvkIFI8T5MZONsooAbyF2GiMGIwJJGJtpNQIaCOyJcz/0Nkm1eks
         /DmQ6MrXpuZpocn0guE2BUyew7wIkp7ChIbVjLWk/reZhV5ItatnnTLze/lhAWTc3TH7
         Ywcgff9bpnVIlyWBtCttY6KowPpxv7GkBy2CRO9HHcEBYgjONJ8aw4Ib8u6e7QC0/FOS
         8rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945653; x=1789550453;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukcWglz3b0XxiFuNMMjBoSzp+0cQUC+nI3t9GxS1yJc=;
        b=cr47tRGKlAFmA5UiNpFf2/8rAKlM0Ti4bvCAFUKfPitWqKaOgY8k1pnTUQ3xz6ZwVP
         1azSUhVYQHRZ92pDvNt5FC/ejVu1Uzs8BIC+FvJBAnfHf0CbOtpDz0eYc+hsG95Doaaw
         sbomT5MVGtmoZS/zOmmKqq8MYsSVhvJLgQ6ZWxzMJSLbonupCeKoZJGXzA0AU5TKgcx/
         ITRSOY8FORPZYGJ7/8fx+qcYO+gLsmj1tERmodCYLsNOsINbljCD8OYPOG5o3zYs9M3P
         vM9KLyyQ06uXcyd2Z2UnfxXZi/WrPLEk68AMY4OtotSGHIomR0kWEJ+yP40KCQCqKRoM
         yUxA==
X-Forwarded-Encrypted: i=1; AKwUvBz0TOtPAONBDX8FebgYKdqfrQVgc0BNiLp+dkPvd5FTLhn7f5vW3bzqz4JiOKyuWt0wVtNEEPrIHFJBhyB5@vger.kernel.org
X-Gm-Message-State: AFuF++mA+NJ2wSwVTzGgrLJ58IAgY9QRBbHXwtV9S/AIs5sXF9/naRm3
	mpzxTfQeL6PzxE3VlnJJF5ziAnVPPbY8Lks1jqj+DW5Uf7CS6p6nz0rF5qpWxw/80ARuMggmRdL
	FT8dKvYG2aYSfQRNS1+21tcxbRkuPONtK0tEfrK9b8grr0OVBAbRhvTR+HsFFF8Z9qDh7
X-Gm-Gg: AYBFou0VnWArWOqNZxiEuk8bq87k6iMwZ1nAHqupLmlEUElbXZna4EnUiibpvYotWTR
	r4B0jHCfX40ybEewqDbqoVcFzN72dqJyt378hFrMc3TRbG2CEsCEZTzmMiWw32qkRB+OO0N5y5v
	jJKduBrJwrm2vf2B5uN+lIl52/79RzkJvHkjjFa6jPKiAX3M8h8tHmZUOt49V3TozC1dwbUWGMb
	iUscFdENE9/qCaLMeJFYnY6h5Knl5tdd/KQF4yz3TSrex2DWrUcRoE3MlTgunD7YVwCt1NLpFpK
	6uV3OKIEeJ1vrPzxDO+/KIBQJIy1ssYz3UDM8L0cE8ZXwNdZgoUGkVKSzHIk8B8MRZrc5qUSlRj
	cjCgiVxJ0pA66pXUkRbqzIw==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr2428457785a.2.1788945653307;
        Wed, 09 Sep 2026 02:20:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr2428454285a.2.1788945652851;
        Wed, 09 Sep 2026 02:20:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d53c37csm720711166b.32.2026.09.09.02.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:20:51 -0700 (PDT)
Message-ID: <42e0869d-cb28-4144-b5b7-f62bd26b7d08@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:20:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix CLK_GLYMUR_GPUCC default
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, andersson@kernel.org
Cc: pankaj.patil@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5778ae29-9c86-418e-85f4-1bf48d674a31@oss.qualcomm.com>
 <20260908145605.1134841-1-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908145605.1134841-1-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tk0DBNcA0AE_dfN_WMzEGp38xcyvIIUe
X-Proofpoint-GUID: tk0DBNcA0AE_dfN_WMzEGp38xcyvIIUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMyBTYWx0ZWRfX35Lw7g+5Xva0
 7/1Cm7iMaqyQvf7DitJjdq4ZpIpR6fYwHVfBXpxjCBlpgHDuxf9aDCj6YG/t0cR37ijvXV9cQ7S
 LJiY4Il+iNB2lD04lUobSYncoHkju3ABvhhoDZ05yMZHony5b8VKU36oiLyWV8Js39ZS9bAFjlx
 wsJsUQY/j8ldA9EAIyZoUX5iC+Iwic6S1ft9/GsvtwBA8WOVQy7uXDk3j5SJ1Iucx4eM0CEwSYR
 IQacuBYjhKAvTfBxjTswR6zGel1mmVGnYI0rFOa+ucKrUhtlsA1oNPHBY5P+xkW3E05q4FZoaJo
 3GTFmFDGHQqqjjIop3nQ3pe4ZxRoyygpILt0PRvLg3KctIjvaHRNtf/871dhF1r44PMB408U0Z/
 q2cg0+zm2X1NBF6tZPEuZkqcwadvtQIDgJVbd7loeE40Vcu8HDIBfrFm+SDB/nx0rCSTSe615jW
 wNqjKpi19EV1MUxt1tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMyBTYWx0ZWRfX1t5o3N8sM84N
 MJQHYlwth4AMj22OFReX0teaO0dwUGzWFPQ/xByPuUzL/jUVE9WNL2QNcTytzJw+rejtkrdxWJA
 XtvHAYO++EMxL2EYElXyISEhSgDF6eI=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa124f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=rlEOdTZNFpIyHtoTmy0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090103

On 9/8/26 4:56 PM, Sivansh Gupta wrote:
> Hey, this patch has not received an ack, please let me know if
> anything is needed from my side.

You already received two, which is more than plenty for a
trivial 2-liner!

Konrad
