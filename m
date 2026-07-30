Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58CF43C7A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419873; cv=none; b=FWreFqVbjSwntU4ICx5B1ePD2WvYa8182YmXnptXBG3jBH0mRIUlKGSLSslB4YeJRWYxXmy/nTt6Vxm09rDRKITb3ZtXgMJHAWwgYiA0gedCvsEsOUYhgVQ94E2VvxngCVRTo6TfeG4la7dd93R52K4o0yxq/NNNCh9fjJX0n/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419873; c=relaxed/simple;
	bh=e5VR2mAWuRHBpht12g+236ubPVgK77LV+SumkUR/TvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLxKYKT+c3fftRqVkqhDQWWmJ/rcY8ObhaJ2PAbhfyi/7C1+6HdV+jR4HoxE7yUR+UiI2U4Kze9FQW+LXUW3d8/0P2O0GY1+ZjT3ts/phPZfNscauPnKZgnvCgCQNwykcw9wjaYk1Ncu0JhCsagHurepKKTu1o6NDLaXR0fba1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTZIKINY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUkaecmu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTZIKINY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUkaecmu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDeaGG1228899
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXD32x4UKkxDB6V0sSMv60ZLLDNzi7VhRUUM6/9KUrQ=; b=iTZIKINYXBw5rW1F
	0AQNyPGsB/xxWodIgL7ZH5aZtW6UW+dQXYZlejGZoFK/y8a6YTQTG3elh0ukDGiq
	lZk6EuCJfERrCZesngkrpSNEDsYfHEuQbChd3BhRRYD02fY+Mcpzgf96WKhjhWXq
	O0sfsd7eWQgeDhSAcG/m62MXaeecBTUlV7NmUoq/JPL2cZKFGlaO00LiEny8K5zR
	/2DS7bg0HKCDVL5HbqNROHWzrMnMfCjbJw5xSBj8HSVXD63a3kPfKB2pu9mbO9JA
	oG57cz/v+K8GtfVTBWNVolg05c7yHJ/24RgaxytVSaNW1aOxTV3VGDWjkeOAD/I+
	mTp26g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7q3g28f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:57:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so4100541cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785419868; x=1786024668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXD32x4UKkxDB6V0sSMv60ZLLDNzi7VhRUUM6/9KUrQ=;
        b=WUkaecmu7EJnePhSduZQ/b8xRYoWQkTw7b8Yls+7th74EYbuvJCdrvWjJ2T+ltui8O
         18HLVtgOS1N2HzGwjrQFPIoqhTkcm7/Oe9bjTUzwpdGJaCf6ujWEzfax0zASXqLVRLaa
         cSs4W7lUm0GWOTFL2GjqjaN1GzZY4uvOywJL4Zs21h3zudnOYhqEgROZQzLNaUw0IHem
         18UhNthLgI2BGfUfaSX220tkCwt1zvyaPxwPGBkUCpSqpCORtVOC9JlKRTBx4vQQLGSD
         oi+TXvrKgYyh5y1Zff2ncfyBxf/Q1Z9QNJCBzN4H0gyrNCt/vQ6jOkqDH68bcX89G2/R
         5Npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419868; x=1786024668;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXD32x4UKkxDB6V0sSMv60ZLLDNzi7VhRUUM6/9KUrQ=;
        b=Nro7k/JBD+uEvQEcjmKJuI+R+o6kcFPKdPUzh2mPTWeN3zTbNgCQiX4sZK+Wfa2M4z
         sCDxRPuX9AL0QVZZTHYy6zrAu5muxswBTju51fzwHw39Ijt/aB/ShvSm8m/NujbzSxMm
         jKMM/WbpX1E+I6ev1u6p5Zr8gikSJY/ozX+h2lYwqqOzDvMbmb1AJNfDXW+nB+A+02QY
         Yl6CX7GVMLMpjt+Wr+xdkFQI0074Z5rrg9SHC4Q195UUWXtLiSxdFRWLHFqBGgVLcjrn
         uAruufW8stM0OJQp2Kgoxw5o2y+DwuApmg4rpPgVebsoKagbaZh0cm3gT5FNjHqOjssH
         auZg==
X-Gm-Message-State: AOJu0YwPd1yjFBecge9ZSniPRuAXn4A6D0VHwfftVJiZfaepZsNw9rck
	l5KYqsqb7/+3mCwOrtP3zP5gr/FJNXBNUFAMDfSSuxwFv54rsZH8T7YLDz75e98l+ieQWl/ZzwP
	+7PJI3NxH0jXhBB+21u0OUCE526VMHT1u/k6ze8yyavkOc17NqhsV6rDPW2hqcM1Xcgj6
X-Gm-Gg: AR+sD12u6bu5qkLTa8dUnMeFFTtyXNc25t+MX8Rb7s/QwvGXqj/mihzDQwn0FUc4iDZ
	OWWGKglASf30UDUNMLWAv8A7MbyCjhwnr6vpW59AM1yMt8GJz22Isbg6b8LJ7dpPRRvihji++l6
	NogG0ZLcwW+HwSbMMup6ix/zyIFg4lkes+jmnjTqE1ckJTN7oglvJO/43PXyEJTSGxEtFZdEKOs
	XtzCTYPEcKZ4TDXoeFFX0zq2biZsFlyljyy40EgaE+1HS4TRofbdPjm/bCZfoupNOzIA2nP+W/d
	CFYrbTgRHiKWTjqOltprJZGsJBfLuzOQLhOSfFSHKQQUHcisrb6Yd0qR/exZ60CVloSuTeDH+2i
	eARxqcsx1TsV32egrjCHKL2e1
X-Received: by 2002:a05:622a:1207:b0:517:5e32:f3ac with SMTP id d75a77b69052e-52b4299d6d8mr5430671cf.0.1785419868315;
        Thu, 30 Jul 2026 06:57:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1207:b0:517:5e32:f3ac with SMTP id d75a77b69052e-52b4299d6d8mr5429911cf.0.1785419867788;
        Thu, 30 Jul 2026 06:57:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3831ddsm670344a12.17.2026.07.30.06.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:57:46 -0700 (PDT)
Message-ID: <c77db81f-9fb8-4803-8efb-078b8cf70fab@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 15:57:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] iommu/msm: track a context master per device and
 IOMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Joerg Roedel <jroedel@suse.de>, Russell King <linux@armlinux.org.uk>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
 <20260730-fix-qcom-smmu-v1-1-b12fa067804e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v1-1-b12fa067804e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNiBTYWx0ZWRfX+3ssQPADw6UK
 jQ15N409viDH/0sneLcAX1AOxj8FCdF4w1pfm9OofwFbeaElEL1eTzbhJ05OSINbEO1DnN7ugBA
 2/198jAh9g3loiYMN8/DHGe0+ynRsT7oFNpl7piWX3bfIfZo/L8Afcnt3K4BUK/pIOn1xWZB4Gt
 EpF0bb08eo81861j+H9Fz4Vhr2/XI6bQ6w1adFjncuqZ4lUH5sATx01M9D85vbrdXefFYBRIQhJ
 Oc5bg1Dp7cMphVxlsAlP9RhIWV7TTENbWLkSG7VZ2DfLyLCy6OnuE24C6KIa7E8tG7oKQY5MDQq
 t4uVKreyEcWncWC4jFuxCTTlyYiSjKahGORwbv3f18ATayk4DJaUr7DSl1FXU00cL26J2LUXwDT
 L0CkA7VPLELNK82Z+vSXlzgLMPKgeRSc1MqiA/TX5AZPvF6eCeqbl9pFUZjluMCif/ZKXgDsISA
 +i7Y2gjQABmFNmkyNDA==
X-Proofpoint-GUID: 4RIgWkMRLMkWCAGbs2EvOwb0-WfCHs8n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNiBTYWx0ZWRfXyms1oiNmjfTv
 wNeL5/vRmSPQqxxz4IWHmbem1iFpgNG2YVD8JnZg3Q+DkD+Ned6iGfJRdKRuernuU4BaE7911fL
 BzUBiauc6Idry13XgV5qdqfhjRTyVWA=
X-Proofpoint-ORIG-GUID: 4RIgWkMRLMkWCAGbs2EvOwb0-WfCHs8n
X-Authority-Analysis: v=2.4 cv=WuQb99fv c=1 sm=1 tr=0 ts=6a6b585c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=dmEO2URhNf-i2iSvwFAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300106

On 7/30/26 3:29 PM, Dmitry Baryshkov wrote:
> insert_iommu_master() decided whether to allocate a struct
> msm_iommu_ctx_dev by testing whether the IOMMU's ctx_list was empty,
> caching the result in dev_iommu_priv, then unconditionally dereferenced
> the master:

[...]

> -			dev_warn(dev, "Stream ID 0x%x repeated; ignoring\n",
> -				 sid);
> +			dev_dbg(dev, "Stream ID 0x%x repeated; ignoring\n",
> +				sid);

Is this intentionally part of the patch?

Konrad
