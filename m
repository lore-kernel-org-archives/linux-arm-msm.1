Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8AD446074
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634524; cv=none; b=CCi/+mJcyFCafmWYdNJzvbcCez26Dzop36o+FRCdJV2JJfEdmQIwuOq8yJATab8CWigbmpWfH4b//tHU1Mb25YADYPgPeyQyYdBk2hnowVyspn2NddjRWpSSX2sIRHRzv55PERR5xIOlL1nCimitrypwnoGt3gDZ+Is4A2OgQ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634524; c=relaxed/simple;
	bh=KDaJqLXNcCVyqguB7u6yZb8TXNUYjurXSZy0CIDUH2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uBppT8pPBqfk/eQbLrDbxOytKCYMoms1qTh6mD0KUJVG0ud4ehyqID7NPdRZilvf+Z30PrJUcZk4rPM7BUkqa6K7miHpdNOtIg2MVMFwXPJ9eihPRFn8pLMmKsKb1tFokxr4+1l35qcS6x+zowIrogO6RiitzmcIvxuH2VKhLps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U33FJM/j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdXuHhu0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U33FJM/j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdXuHhu0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H7x983396358
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZjQDioJHJpaRJll5O5OcVoNVSPLQ8ff8oyq/g5k0SXc=; b=U33FJM/jPVwxzlKh
	dN/VZ7rR7FwaTuIESZ30pMuQkxN2KkVdjxUyhDWCXs6HnM6F5CujAZEueRJUwvOr
	keswmPgMrOJJTPsRIvslVQ2GrDV3iRvi9qANKcgfspKm0DjQq92Pn8V1Bmio2CGC
	YTZ0EKotJLR6sfPVEhqJ5FSS3UetBq6WeL7i0S5JeTKJEjPr6pLba190l+rSnv2K
	AOToNyB8HITveSDYhqaUjEMWtb9qeMsnWjIrDBqGCL+e2t2bSmR7bnEkOYZ4ubNe
	ixpm8BpMSS3ASQTE9hG1VMBvYiKEXUStfeX3bHz/fGCyJwe7kq9Enpj0pYxx+o4A
	xe5+qQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0r5b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:41:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a312222dso12771985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789634503; x=1790239303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjQDioJHJpaRJll5O5OcVoNVSPLQ8ff8oyq/g5k0SXc=;
        b=LdXuHhu0dzJcyQr9l7UncFAEZHQU45DFp4Lcqc8vYGwDY1RyTFBP0m+XuJ6zb5YC9O
         cGFd3hyU/slDPICBGFj//O+6pWKr0Uonnbl1xbjaFHknPMzfK/78Z62tOigCuqvFTriQ
         faJvmUuAICKlHgdsEYeZlv+huYZ8wPjG1JVBcMjEcb95h4swY9YZyFfOxIX80EIoICmw
         B432FgYBSwR9J9TvbJUxccer1XdTiBkKbhoWj6A+sjwg+YvJR3VErwUUkfi5QqIJoP6y
         RHEgaeZUMnda3JPklxgpv7Q9KcyV3xgKilpHmqrdb1UJ6+op9EHzCm459pIf91ANbYNU
         0fJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634503; x=1790239303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjQDioJHJpaRJll5O5OcVoNVSPLQ8ff8oyq/g5k0SXc=;
        b=FWTyWVZuNrmGqqinvigHgHIQnASYXWByqFQQlai1yC2hicO4L2SjCt8S0hxxiDHYA4
         tWF6Q7jPqWi6EJdg2DBomXMyfntmE1gBE6AY5qAXWb+XIyGAEKh1N8NZ/Ybzzhc51cz2
         aJPxAk4bRfmSoJksReWoTnbmYf9HmnKMidQ999YOD4qFlQzzQOKW0xYBmQxHdvIsKWE/
         fVLmawYggl89nIZUwYBJJ5yLX9/uq3GL+wzyEnNmmbkEq9+LPZSLeuh3b2ydL3k+9orL
         Ayj4hSr7E3qhH48yciSz15URLziL8+ZTL1ZI0vTindo8CEPGfQwnsBjlcysKNhtC6Ru9
         BSYA==
X-Forwarded-Encrypted: i=1; AKwUvBxJBTi9V6a2gZnHeYsPxyK3BB4FQE54oDRy15yfcFg4cve6GchC1e1sBN9NOKsmtsyD+go7A8r+PTU4wsyj@vger.kernel.org
X-Gm-Message-State: AFuF++m83/gQojaMGm2ishTOvu71C6+XOfEOqHTM8J3vTIRbP9AKudA9
	ZzKFvmwDBpXtrqMp5WuS+WQlxqop7GQy8OljCL5f944JR73+zMRjE44DVddPPMlvY+MISV6EpaJ
	U1/q0UJXeprCYbSO8jht+HSAIjtfSURBR76mTWb2RZpfva1TdJ/nuK/KIeBeMQXiPOFsI
X-Gm-Gg: AYBFou2uGyoFavSf6e3CQth4nYnkn6gx9vkem9O72ql4McjlvGsuGC0jQPCsJ+2HVOM
	uJYIpxNHU87ETHaHjBe1ZFfnanWbwu3alcQxt66KYiuYcM+iOseI+dKbcVd3pTiGjSlyvk1jJ/i
	cbaA68H8mtVegKdkbSwmgfggJhFEOxPulnSYX9ROZrcxHuW5uHsSxa2YgOeANkxIvtJi1ThvC4v
	MeOkdSKuYerdTn1J3laz9EghGiY2mHw7mso61eaCrdBk6rlI3li3SZqY+2gfptF+3I56Liuwaf8
	ACIVvVD+F2byXn/VIHlsiJB82Jdc8bJIhtCAhNagYgFWUMLpD7FbSfFjPT1N3cBtaO+scZkybmG
	KfK+oD02ytfO813F/vWjhKA==
X-Received: by 2002:a05:620a:a189:20b0:93b:beb1:5790 with SMTP id af79cd13be357-93bbeb16790mr525452785a.5.1789634503277;
        Thu, 17 Sep 2026 01:41:43 -0700 (PDT)
X-Received: by 2002:a05:620a:a189:20b0:93b:beb1:5790 with SMTP id af79cd13be357-93bbeb16790mr525451385a.5.1789634502896;
        Thu, 17 Sep 2026 01:41:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0898bdsm260029866b.5.2026.09.17.01.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:41:42 -0700 (PDT)
Message-ID: <6c61d38e-e874-4278-b188-166cbfdad067@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:41:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: nord: fix GPIO interrupt target width
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, linusw@kernel.org,
        andersson@kernel.org, brgl@kernel.org
Cc: pankaj.patil@oss.qualcomm.com, maulik.shah@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5XkNG15Kyu5dFqL68UeMUwV7jEF42BRS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDExNyBTYWx0ZWRfX+z+WB+EozpDX
 XdnXcrJxC2jmRSaLtqtioYMoKp123+MCxjRdnLNgrdHwURVfeKvE3AoafYG97iTqEZ+6Crm/7ba
 JU9nil7ACPX+hOUTjnnyActliV+gcqY=
X-Proofpoint-GUID: 5XkNG15Kyu5dFqL68UeMUwV7jEF42BRS
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aaba7c7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NCczGnymYEpDLu10qSUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDExNyBTYWx0ZWRfX9E3QCMw56pZF
 Xwf8NxAZzsHxaEMnNN0UA2X3rjwnb6+DDiHxAE3FaBL2F1nnP6a+mzkUtZua7alKzFHa/GmE7T6
 DIQ/+0OrZbaxAFRFbdx4uRdBXl0ZcE4SxdBgsWfDBHsozbZitC590JsNi5u7g5NCiG0fcNPEXsQ
 UJC0fKfrm1bXOynV4RT2lHkb/cPoaZjYyeQ4NlCQk+PKfdRqZlVim8v5LAFMLI+c5NkePXxnr9T
 G3h3HWMS5kT5TWPDLQ3ej8/bpuaiHRBaVrTDDmnc95bnu1FQBEB/4fZwhRICGo0zysFrs+vcZYf
 4gPwHRCXEn79Wlm1eQRP+UN1akXbO5RpSup8DMNSdEn8cQ7h76xFvt99o+JukEcKFKVGnFD66Sw
 dGpSGoV+15sanUIt6XcTg0D+wWitgGSg/cMwyiw9IYvnyLghkShA90WWqH/z4STjNxSgJKJV1qo
 h/OojatBc1Lemt/hJZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170117

On 9/16/26 10:57 AM, Zhangfei Gao wrote:
> The TARGET_PROC field in the Nord GPIO_INTR_CFG registers occupies bits
> 11:8. Describe it as four bits wide so the common Qualcomm pinctrl code
> clears the complete field before routing an interrupt to the application
> processor.
> 
> Without intr_target_width, the common code uses its three-bit default
> mask. Since GPIO_INTR_CFG resets with TARGET_PROC set to 0xf (NONE), bit
> 11 remains set when the driver programs HMSS target 3. The resulting
> target is 0xb (HPASS_DSP_1), observed as an interrupt configuration value
> of 0xb1b instead of 0x31b.
> 
> The GPIO interrupt status is consequently latched, but the HMSS TLMM
> summary interrupt at GIC SPI 208 is never asserted. This affects all Nord
> GPIO interrupts using the TLMM summary path, including the Ethernet PHY
> interrupts on GPIO55 and GPIO141.
> 
> Fixes: c24dd0826f06 ("pinctrl: qcom: add the TLMM driver for the Nord platforms")
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
