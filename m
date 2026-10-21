Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583694;
	b=RYUrY3PCQ39eJNRUnJ34wsneUYtqGu/j3DJpS97gIvg5YG4FK3eXtikwiwXRql4ah/zC
	 uGY4yJtNczA76s7/atw6x3rHJKc9zKwRRN/zEteFQRRXOaBg/BibjzejtNiQcyHrfpGcG
	 lQQwqKh5bboVhAWchMRB5P3MCmarW8CJ3csmJL4RLgAW+QY/u9hSC/Jh2ZUfuLqVSGQ65
	 Kvc99WwIpa5aJ1CYIV7Rv/G3/AExA1l59k/NxEujyRbJVPpMfJSu1Rvg/fS7XaKunDobE
	 19qYbyS6DzM6rsdx8ag8JgAPtoANGbdWx3gJVHMTbtWGbWax2X90SRDeLeSw6u937CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KxoxQTAfdxc5nsQbvnGm0RGN1ZSXS/BoHHTwOCHcxOA=;
	b=3phr+KySijmaqveXTTH4JqQCSaClhtG1T4Yu6HBXjeF7OKJccYxPguWlZ6CcKHGtEo+Q
	 bkdgO7RDvqYK/KvZ+NZPqyorZhMVYH2pV4X8RSco66wjWFwLcXrtROSZ3B7S1RSMw2Vat
	 IWJro+97fBo5UZF1WykWTozHDWoZVQ0vlZ8FeAjtQDMi2MAEhciBv8OWyp/Bs/RH+8BHP
	 qN4T6yIbyEcCGfDSiXeLJdxVDRNy9X+m10b8herVYbDLMJMdfKqDSMrL/wOloojMbrq0R
	 SQfWKFcHSUNW5IUHPeWJGKY5jm1WSyjBPoTEZm9rcdL5iSr6n6PlsU4WHV0klKizSsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ua51GJmd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPCh+CmZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95175606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95175606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ua51GJmd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPCh+CmZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfxm91568124
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxoxQTAfdxc5nsQbvnGm0RGN1ZSXS/BoHHTwOCHcxOA=; b=Ua51GJmdnkG2tfL/
	tArK9LKhlgyybEuUKrA4cNSRpoo0HcKSNumOWjbKehdQHe7lmVPEN2BTLeXFkiT9
	hV28mELMWmFAbHY3h2f6yudeYG72/frzng1rKdnB+8uanyISpG2YgZJpgyRWUmf6
	VCiZhynaK1MfEjZ1wLnMspQnHPiEDP/y0CQl0YQw7aKfBVSHewWb8n3zc3I7NCif
	5X1JGUkaTBwZ7CPf8NOJ1Lcm1nvWXFScJx8QwsNEriQp1cjxk9kG9Mi/FFGZBRSH
	92EDI52tiM7MyzB4zCcyZRphrYk6NARv83dea0YROAomnSzB7QiLYJJZd8BLQv8w
	k9wBRA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ur6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:54:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1130556eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583692; x=1793188492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxoxQTAfdxc5nsQbvnGm0RGN1ZSXS/BoHHTwOCHcxOA=;
        b=JPCh+CmZ5Nraua0GgenannhrnbtnA9a/6qDfeCEUzMCE+jIIcGwF3HXrl9SbD3R3IA
         5vqdM/2i/S7G/eVvziB1UxEH4C2fMxC8Apw7V+HTBjL0+V4lSewPl143/tvagHou6DYa
         hwhVztQLo1m4Q1qA+HyYQgV1Ls8vZ0oBAUL62bPTR3h8U4gb+0Gwo+pQUewUvGUX+8UW
         JcvUdrtBktv+8pUWdNNJHm2F4RZM8KNReESp3+rLlY9Bx6PDlxDgU3sypS/LdvGYE6s5
         ULCFguooVI0iH0COewnjABluWyLn2Q2CYsvtvR5dX14cfcgi06Mlp4o8qE4Tqc891uTX
         4Gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583692; x=1793188492;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxoxQTAfdxc5nsQbvnGm0RGN1ZSXS/BoHHTwOCHcxOA=;
        b=w1bfqpmOuIl0TvT8jF3pQRwUUX9LsQ+MRGfqwrJiZmlY5CT7NUfR/wr0Gj0WdlWDkv
         haaMY5Av0MgOojlMFO0N9SDHJNQy4auxvokyEZIdaFFV1eg/loIu+w6U/CpNQJnF7ULj
         3iWsnxUngZm6AJIzorl1my1w3+bdj++osk65uh0YK5lJ8jMa4NTCFunmKCfJq25FERKI
         GN23EV70/XdTuZzmOKASpKulol0xBfgQunnVGwM6pL8BcGoePKvlgqJcoYGJA3vXj42K
         byYTnmX18wIxjkvP2dR5b3hbL6JOHlyZMYU3HsHxFXlJqI140MbINaD4ZEb19nbHk2Co
         OuuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEXVKnpoqenAlfFgQ3jiFLcAirjFVK+N6ZU2xmizaCORwnvLtsdOgid/8IMQbNXVF0lSYDkfOuXiE6ymEp@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4IzCwXGupIVSYatA/cWOKoru0DHQZ3Wxjx/hw+CBbUo9KFoCu
	EJdt23WF9Ypw3RZTipZ01ToM/YyDhlRFKRNV3D67KCqHeDGPz/35i5ppYWK3AP3A4vaormf+IT5
	uDxNymdW0FApPy8DDNWhsNfFMe+OC+c2v+/c7c0fq6uc+ZHMfSGGR6Oa/vaBGHwIJ4VLk
X-Gm-Gg: AYBFou1PXQh9PeR56JROXIg/5r1t6RVmdoGKedio1akkvcBk6AgwfL/B9Ut6muAzuAT
	ySVrZ6YvtFmu0i2QP0ZbZBf1DifdnYdKTkIixbqyyXNpDT6Eq5SaTfbS/BhMz0NPciaVgM73+Lk
	f4zzeH3VSnt20jyOB8cjf2/JwIETup24c3QpuW9+Wg1d1FB/LEtAVJkQXK2VjkOaCcHfMAIHmSs
	s0e3k397LDwpDpv4kZsz/96LvO9MUuUciNKhJImHWMapfbk/oqc40Q7BJ40DJLNVG3ntXCRSEQH
	Jct4GZxBJ7+aWj+wsvcLClTMuh8vGZoWbmr2k/jSgiXHhts2+LkIDqBjJy+AyDDGhA/Lsw4Y1Cz
	4BM31n6/wY4PrimkKZBPN9aqtDvGWIBlFTA==
X-Received: by 2002:a05:701b:2202:b0:164:3237:4485 with SMTP id a92af1059eb24-1909a332a70mr2205201c88.0.1792583692016;
        Wed, 21 Oct 2026 04:54:52 -0700 (PDT)
X-Received: by 2002:a05:701b:2202:b0:164:3237:4485 with SMTP id a92af1059eb24-1909a332a70mr2205157c88.0.1792583691125;
        Wed, 21 Oct 2026 04:54:51 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d87ab1bsm6181635c88.21.2026.10.21.04.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:54:50 -0700 (PDT)
Message-ID: <67404f33-9452-4a53-8ed6-8fee4eea2611@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:24:44 +0530
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
Subject: Re: [PATCH 2/4] soc: qcom: llcc: add LCP/SRP DDR DRAM ECC register
 offsets
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-2-aba3cfcfbac9@oss.qualcomm.com>
 <20261017-spiffy-shapeless-caiman-d658a6@quoll>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <20261017-spiffy-shapeless-caiman-d658a6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BW462xxuOHpr9r3k3vcXUBApXzUL4Qwn
X-Proofpoint-GUID: BW462xxuOHpr9r3k3vcXUBApXzUL4Qwn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfXzia+lZ6AvzJD
 OqLEUqcr45XSFxaFPEhkCidBEIYbfkq1/km0A5r59LXjAy1E8bRqFxfORQpVpCLQ73PNiw27fEK
 +wQwH6XjkN1+2dC9RL7aiuM4QcBUF2o=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8a80c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VlAtpL-8CsKfw-zIKP4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfXygut6Hk3sGVR
 b6GYqJ0Bf97viZqxq0RVEeGWxKJG8xIZLej18xJzJrRKawrXH064Q0VdzRCKz2Ug3MLbv1DI1pd
 5TlDCFZpWlcj2ILaHHMHvLEvzy9XvE2D/oK+YOnSd+IvWRkE3GfZOhRdPsGaMik2dD9fvBsyT1y
 nLWVIdIwSjcJi2AFzeQUVYPZ0C+tcjSx09kCDakB2mOgKTPt8NZYhknJUrduh2gwo1HN7H8M+Ao
 fL31xxf43L1ir5TABVh9AU/1pqwiiJ7gPeXeNvoJMBxKE63B9qb3pLx5IDsH2NSwerVF4ctS8cP
 q17xX6xAIUF3WodICK+Ffr/i3jXA1CLYZx3F4OVvqjWCgSAJ/UK6/cwJWoY9gn1Wdb8LazvQ2z/
 Jjuh4X3Kz+Zkc/02lyOzlsm0Fp82jPwTDp44pZwmcV9e0exdofi3bBFQyJPnwHKOyIYxBawvkMd
 g9ZI+yqTdCeeH4hUGKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210047



On 17-10-2026 22:04, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 09:26:17PM +0530, Faiyaz Mohammed wrote:
>> Add LCP/SRP ECC register offsets to struct llcc_edac_reg_offset and
>> create llcc_lcp_srp_edac_reg_offset for QCM2390, leaving the shared
>> llcc_v2_1_edac_reg_offset table unchanged. Switch shikra_cfg to the
>> new table so other platforms with the same block can reuse it.
>>
>> Add lcp_irq to struct llcc_drv_data and retrieve the optional second
>> interrupt in qcom_llcc_probe(), propagating non-absence errors so the
>> driver defers correctly.
>>
>> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/llcc-qcom.c       | 45 ++++++++++++++++++++++++++++++++++++--
>>  include/linux/soc/qcom/llcc-qcom.h | 13 +++++++++++
>>  2 files changed, 56 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>> index d7a42a8040a1..39e0da14b36d 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -4509,6 +4509,41 @@ static const struct llcc_edac_reg_offset llcc_v2_1_edac_reg_offset = {
>>  	.drp_ecc_db_err_syn0 = 0x52120,
>>  };
>>  
>> +static const struct llcc_edac_reg_offset llcc_lcp_srp_edac_reg_offset = {
>> +	.trp_ecc_error_status0 = 0x20344,
>> +	.trp_ecc_error_status1 = 0x20348,
>> +	.trp_ecc_sb_err_syn0 = 0x2034c,
>> +	.trp_ecc_db_err_syn0 = 0x20370,
>> +	.trp_ecc_error_cntr_clear = 0x20440,
>> +	.trp_interrupt_0_status = 0x20480,
>> +	.trp_interrupt_0_clear = 0x20484,
>> +	.trp_interrupt_0_enable = 0x20488,
>> +
>> +	/* LLCC Common registers */
>> +	.cmn_status0 = 0x3400c,
>> +	.cmn_interrupt_0_enable = 0x3401c,
>> +	.cmn_interrupt_1_enable = 0x3402c,
>> +	.cmn_interrupt_2_enable = 0x3403c,
>> +
>> +	/* LLCC DRP registers */
>> +	.drp_ecc_error_cfg = 0x50000,
>> +	.drp_ecc_error_cntr_clear = 0x50004,
>> +	.drp_interrupt_status = 0x50020,
>> +	.drp_interrupt_clear = 0x50028,
>> +	.drp_interrupt_enable = 0x5002c,
>> +	.drp_ecc_error_status0 = 0x520f4,
>> +	.drp_ecc_error_status1 = 0x520f8,
>> +	.drp_ecc_sb_err_syn0 = 0x520fc,
>> +	.drp_ecc_db_err_syn0 = 0x52120,
>> +
>> +	/* LCP/SRP DDR DRAM ECC registers */
>> +	.lcp_srp_ecc_error_cntr_clear = 0x59004,
>> +	.lcp_srp_ecc_error_status1 = 0x59010,
>> +	.lcp_srp_interrupt_status = 0x59070,
>> +	.lcp_srp_interrupt_clear = 0x59074,
>> +	.lcp_srp_interrupt_enable = 0x59078,
>> +};
>> +
>>  static const struct llcc_edac_reg_offset llcc_v6_edac_reg_offset = {
>>  	.trp_ecc_error_status0 = 0x47448,
>>  	.trp_ecc_error_status1 = 0x47450,
>> @@ -4767,7 +4802,7 @@ static const struct qcom_llcc_config shikra_cfg[] = {
>>  		.sct_data	= shikra_data,
>>  		.size		= ARRAY_SIZE(shikra_data),
>>  		.reg_offset	= llcc_v2_1_reg_offset,
>> -		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
>> +		.edac_reg_offset = &llcc_lcp_srp_edac_reg_offset,
>>  		.irq_configured = true,
>>  	},
>>  };
>> @@ -5798,7 +5833,13 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>  	if (drv_data->ecc_irq < 0 && drv_data->ecc_irq != -ENXIO)
>>  		return dev_err_probe(&pdev->dev, drv_data->ecc_irq,
>>  				     "failed to get IRQ resource\n");
>> -
>> +	if (cfg->edac_reg_offset && cfg->edac_reg_offset->lcp_srp_interrupt_enable) {
>> +		drv_data->lcp_irq = platform_get_irq_optional(pdev, 1);
> 
> Why do you exactly require interrupt-names?
> 
Good question. The driver was using platform_get_irq_optional(pdev, 1)
by index, which made interrupt-names a documentation-only annotation
with no driver enforcement — not a good reason to require it.

Switched lcp_irq retrieval to platform_get_irq_byname_optional(pdev,
"lcp"). Platforms without interrupt-names naturally return -ENODATA,
which the driver treats as absent — no explicit register-offset guard
needed. The ecc_irq stays index-based (platform_get_irq_optional(pdev,
0)) for backward compatibility with all legacy platforms that have no
interrupt-names property.

Will repost as v2.

> Best regards,
> Krzysztof

Thanks & regards,
Mohammed Faiyaz
