Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3A0126C02
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327339; cv=none; b=UzCWjKNZDnkYKsre++57da0Z9GWZz5yNuNC9YuCi4pIJ1fLzycLHi48CB9FkX3d1ePFGP/ZtKwpBJGts9Je3Zvz47T3oi8VQb2bPL52QeV8pavUSsG7lQ2udnVHy5/IUmkjLCxBbSHVad4Bl1dWdXi3sNl+ei2Syahutz7CeiQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327339; c=relaxed/simple;
	bh=s1gO6f09FjP880JK9PFOp1s4Jhd3meLkvmePYpvEaME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElyXfWJtgNyJzeBn+UdxO9deAcFYdbzB8fkZx4JSKFgFAWxK0OebdNxkgEbtNhl/uDHDYp5qe+9PWxeSFUApAZeenwVbIl+6GPzzdo9NLjsyLBCrh1WPEdR3PLn93EX8dE88yABpHSHn9fKOEBZY4+aIqJef0dIa38UVyA836Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ntcstcyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFEWY35t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ntcstcyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFEWY35t"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBurJk1981738
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZElkTGKf83zLq2SbG+PkttDl3n41jxZHeLynZGXTAho=; b=NtcstcyblUs8obhs
	ysvKMRRidoHCETaaiqeNG1BgfTAhsrZ7tn6uONKNJ2R5iOTNYTgKyATa4JiuzdvS
	25JBLvKw21O3BtL//eNybZzx4/q50Bw5zvanJ6/qxe8ojF04mTT/V8R4iQ0IfGY/
	sw7K7ob3WaSYIZEInzq5qhpIgYcJzl0GQAn21rXnGEO0GlQ1Bijcnqu9065Z9qxW
	EZr8Hy9HHJtDjamdro3PTTyG/ZorrLNnSv45UU1gj85PXfuzEmACEv67nsYMun76
	2k6+xJmzM38uktQDtjGCqlHRPgssO3LCQliLQClRB50coXs4bMD7zMfnqYWVT8Ln
	5MSOKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3gg2a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:15:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276a49e761so1334541cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327336; x=1785932136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZElkTGKf83zLq2SbG+PkttDl3n41jxZHeLynZGXTAho=;
        b=WFEWY35tIpHmcWbHHqRD5O90T/WkliWbN8tNNXT28lthpE/q+ngWsLi2IoNdJJErbi
         ltydO4/J8+D8TRcTSYgfolBzA8s0kVmGIzZ8Nohz5sRtWUCHuHGwdmbWbLE9ZnA8uG2Q
         Q3M1s/OHP35Jrl/FxVblpGQfEkWMNIFqo+lknnZ1PDUhzaxWFkpw7DKEW0ra393ujVSv
         YfUugvdYvHqNc5kcMSDIs/uYWD2Ke6hhiq5XVrhFB1honEAryMCzXZ9qsbR0P1M4eBTL
         W7+MpmfG2payypCjFBKdqWO2LlNYEhDUs42p0axiTwX2tcMBKNtDOiVTFqTrXbDdpgmq
         oIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327336; x=1785932136;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZElkTGKf83zLq2SbG+PkttDl3n41jxZHeLynZGXTAho=;
        b=Q4l2parGWXjLaFaULLF5VpkQixUsqzt1U/4bIQU+GUpJel/ZKSxNe2UKCJN0U1GzVx
         fiPmCqcAxz4Xc+CZagFX3MQbiltkk9MLrTBMkFpFdzW1AqaY7xuRKcccFN8+zD7MLgUw
         JoY87m3S5Algre0n7Ayyb3OMhkEQeWHux94NDIONN/U7l9wlfQFYBAstTndVNSzDFc0Y
         IENkWJxb2NrpImYTmSshIAp6ahVXUEbkeb2aOkEBYTv8GXYky5f/PqtbiTQ9ZZjqz9gf
         6Cqe3mvKxXgAQwvXEyOERECCORFtPsx8x0GRN6tsITJrl62athWzQg7pNdyX9wNBV4lz
         GNjw==
X-Forwarded-Encrypted: i=1; AHgh+RpM0tNX3HIAe/oQTAoIquTGMZ2TNUfJdLbCA79lyWJxMdhIWPRpcEP+r7AH/1PGWSNGtJz2F78EWqSnnx2v@vger.kernel.org
X-Gm-Message-State: AOJu0YwrOjtMBh4rc6vFj+Max9MJLjSU/RQJpzTzChQN/ovLWjjLXqUU
	6iDZRqoKupF8kboKjxYxlk5R4JW5BVlIeopMx/mRNcKQ+/5D/QBEW43xh9CgJWpveo3hKILwU9K
	3wb8DMcqbxzhJeaKmJ5Q7EFUY7xOl1ihcrXPdB/i0xQ4125+9W7xxY0QMs1HEEhejpp/R
X-Gm-Gg: AR+sD10SkzsL3oSIwO1iEzdXlE+k3oGyNm2eYg27JfPf/q2w7H68L3499nsfKSMulz9
	4/ZWTbe/dB/U6f0qxJ7WbpiePL7XEEgZX6xF4ZEkr+2AniHQe0P9MT4gMgfwyacNd4ZfxRnEx5H
	GzPV/yZ2r2QbdbgVEp+K535EwKJzu5EAz0HTCxtnlXvMLbwRDcMf+6WvgLKICq2C5NI5YmQsHYF
	VQtI1doGvsM7e0/+t4PtDS5WtRuKdqQj3/DuPjr1HYmD98m6F2fY8cuPW1Q0Jk6O8YMHnmRxciY
	4ihHbFs8EXmAzkYgD/tprWh9KjcNyhOyykaFJn5dgcbOnKIlom/UBD2AFNbfJ52DvgkK4h3T7Um
	362Z9Xs501fTB4p+CBlaqAUoK
X-Received: by 2002:a05:622a:82:b0:51a:8079:795e with SMTP id d75a77b69052e-529d70f64dbmr56395411cf.4.1785327331951;
        Wed, 29 Jul 2026 05:15:31 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51a:8079:795e with SMTP id d75a77b69052e-529d70f64dbmr56389371cf.4.1785327328171;
        Wed, 29 Jul 2026 05:15:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83f4e079sm104234966b.30.2026.07.29.05.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:15:27 -0700 (PDT)
Message-ID: <207866a8-bb1d-412f-9cef-3a597762a949@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
 <20260718-eliza-gpu-v2-6-64379dbebd7a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-6-64379dbebd7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfXw69Aijx6G7oN
 KAWYByadWl1KIcqFRwtUAD+8iqYEFAvhFxzOy6L/Oeue+pSI15BSeu6cnenZY/Klcufb0nqTlcM
 IIRryAv41PA+cmCTmmx9+oWkkRQKmWSTRFq7b7Nhq9a2VfF9zr4YP1mGHBhcYXDhgo5M/ypI1T9
 BzmDFC65gFfVc4iVIVgP0cRq2Ux0fs3YbapJYd4Sswf+pU04k0WLYUGTcFqRfnbKJghyhq7jXcl
 3Q/5oBAOSEJF+o4GGPxDyq+CYtg3zgAVuw8QcP6qBIzU5esAb0yop2t2wQBbMtAP6FnFVfTZtyL
 cqCCJ/2yPmcQU0308Bmmsqz9F/zPQz03ykmQRbw2xcMrCi80679RTJ25igMHc2Zo/3l6RysJ5oZ
 7H/1EAsTLcJqKZAJNT/RDmTTId3uTqndquIamoRc2rsHzwsIWXnqwIviaWBp1pYCir9bLjAW3lz
 0lbWBFSxydIhSf7/D0w==
X-Proofpoint-ORIG-GUID: I97k0bCzQ7scIpgUCIZgDtMMLZ_FMCws
X-Authority-Analysis: v=2.4 cv=EOw2FVZC c=1 sm=1 tr=0 ts=6a69eee8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: I97k0bCzQ7scIpgUCIZgDtMMLZ_FMCws
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX5TKhuFoBOlgh
 2cDHnKemvttM5CcA6f4YTUFtZdMSA4LJlBphSgit4vujUHllOJgN3rBgnS8Cg5vGBb2O3j6qUIe
 4olFWuIMs9jjfsd5gI4z0PFOeIXknaw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290101

On 7/17/26 10:41 PM, Akhil P Oommen wrote:
> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Add the nodes to describe the GPU SMMU.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
