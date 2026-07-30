Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C536C439343
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418987; cv=none; b=bPEosc2QEsJ0l4RGW4R47FnswPJfoPwMUjaBWgiHGW46aXPD+ENm5klvmV/VJ77U6kUeTQ1NvqvpWGgw/H10ZsB1szmFUmXWpjkonq87S8YdEpBkLQxZu44KwxJkqqbX79KK4mteuzVpR2kePuQede3S67tkxX0rVzdKhUL4Arw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418987; c=relaxed/simple;
	bh=yzhUy4o0mOiRrgJ+9DOMPc8IwPfnEtJ/dCNB3RDvKao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYVgC6okv2SUgZbEXQ1iU+M+h173zf1u5ed6uRpJ+bALtI8tnKqbROATb1bi0oEN8geF2l/fXN8oRo/a4CF30DYwbqJgAxjKBe/m6qB6KIAR45S3u1pmRA3BatXIJpBPHyCEhfjQWIaSCwhWpyt7Mk/eFMBVjQYY8cukz/9NvwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuBkjEPE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZxekst1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuBkjEPE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZxekst1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDcqXN841038
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIHC0dGoCfL4jo/TTDqxxd8bs6eGi4j6fVBGNZoeJSw=; b=WuBkjEPEQ6+jaMAP
	mb7/eJ2DfGQPN8Y84dNiQ6j+CFSIFrqWAsxwUjY42fZuux0vSgKE4CwYUBxJX4y8
	YW4Lhs5BtJG87JVyfjtLs88SO1AZ9VVRACBDSd1dLjCwmFixdKS+k5Jq8L/SkslP
	dy7pA3v31WKP9bof+R+XetAssoV7ZE4Lakkcg1MI8X0lJ3jGB5a8srg9e6F3+byW
	ZbuW12hYQtj5jkMBvX09jKqK0u8ngTBgksd9BOf1ZQrpL6/nfooMFvXsBvRTHLkC
	ktGGj8VTarBbnRPHMG+yr8jQnddWlMP8CDG+t94qhxht+gDofuOu8d9l73N7yi/E
	UvDZVw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7nq80kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:43:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51cab6f7517so2618291cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785418984; x=1786023784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIHC0dGoCfL4jo/TTDqxxd8bs6eGi4j6fVBGNZoeJSw=;
        b=QZxekst19v2l4C7SkalKfKr4feAwJ4gNrfrThPCP5FN4H4l+l5qwSAoyBoYBioeMU3
         tvQHy8RGKgsbp76C4SR8Pi86ziIXtwDZsou5peuR9pHlj/MLTOhbIi67zU/GVIkKfcSt
         +W9fhA8fpRnvMGnlVwJOkyCux2IPEB629+0+3CB6vxk7OGxPOGh/T01Osdwh4XUUYK03
         /dg2mvu5KgpnU72S8W13KVtjLkfHsE9GUUMbULS9jmulG9mnxmXYDh8A2FiIoc0nfC+6
         LjN0P/v0eNbfkXbHvoYFHOa9C0JTNLuV/Ds0FGylbz8jsZsVKTBsH7x5U0LjUgr8NC6y
         hjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418984; x=1786023784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIHC0dGoCfL4jo/TTDqxxd8bs6eGi4j6fVBGNZoeJSw=;
        b=YtJpbYcMBLw74dnqEMOYkG3CtqLGB0CEJnBWhySxr37vbwaIVX7oE7L3WVSghieI7+
         KNB4T4CBkDTANlFD64LcC0QJRUHdqzR9Wjtt1pLfPWgnaVrQjJYu95pW9SyP7gUHScF5
         myXuIwKkBpCtxCOWvFhx3gpg94gJTHLvPDBOTFJ51Jvka1F47VxrC/hkfe563/nvOh0S
         JLygjYXzw/zOjM7odTJMdSv7PBu65tg3UsitmH8fFzcougirH1MT1vJN9hVsDJfgQTgG
         YW+GwdahgOjY6Ebli5dJR3xHcwYpMh07IH/7fdRyLRu+2BXNTTQc44nALb4rNRmH9Qz3
         Om5Q==
X-Gm-Message-State: AOJu0Yy+DfXQfJn49an/qFXAq3OrO8donVYkQmPfbIMvT1AJ9En9J8SB
	kUWxrhaCRxTINH5ZkSCqgPgVr+DJyWubM1z/Nz2nnbByGQsmXdb/qslmVEgrJsaliLPRxCcFj8p
	B94mbhfqV9F7kUMgXBTBEWyOxfHjA/rGfUmMP8QwaXhbviSMpwx5uaSO5Z4CN91JOgJbPTyi125
	FG
X-Gm-Gg: AR+sD10616ClseMhBxDr13wDlRwA2qBg1ZiADHoGH1BCHQrsl5cXpuGcUc0132BFOSy
	ghe7fKx9bxBqr4uEhRZ2JoI1rGqZbTd2UyGFXGayUgFZ7W7NkfNg2mXUdATcqTYERoTwYtnHjlG
	zMlIlvZhGmCQveXfwgwDVDrp4vNlyWs5XMWTb5DROhSmx0QS5X5UwF59MP82+7NX8AJVGfr7rOJ
	0N6jr9wpupl1jXQDe5apzsD6zYqD5OQGHPBFHgGTYX7MAG+27/HlAXDRErcQrxA+/DfgkIrLbZN
	sszKFcXKDJDK/3pwOpaRM1WqyyWNT4d+2XArHp+5WU1Hb9/33h9cA6XStn1rGlRafEEkBjGwCUv
	+eyy7+CvORcclIb7HhaiQ1j8M
X-Received: by 2002:a05:622a:a98b:20b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52b42b7f23dmr3221621cf.2.1785418983759;
        Thu, 30 Jul 2026 06:43:03 -0700 (PDT)
X-Received: by 2002:a05:622a:a98b:20b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52b42b7f23dmr3221211cf.2.1785418983387;
        Thu, 30 Jul 2026 06:43:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8b6dbdesm66080166b.36.2026.07.30.06.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:43:02 -0700 (PDT)
Message-ID: <8e55ef12-6c4a-42b4-923b-238b3739ea51@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 15:42:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm: detach the ARM DMA mapping before attaching
 our own domain
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
 <20260730-fix-qcom-smmu-v1-3-b12fa067804e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v1-3-b12fa067804e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HIvz0Itv c=1 sm=1 tr=0 ts=6a6b54e8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=mSMHI8jCXtBZcuwA1AYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: k_jKeb8aQyHWKkokmOo2EsqDrwcQiYZV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMyBTYWx0ZWRfX70tndZcVG0O2
 XudFwKmU/3ybU5z0ozTR7DqSwzsYXpJ6D2iTtzgx1/Oc2I+NTqaE1ebW0MVWT6txezahFIEXX6Z
 nciJxfPZiYmeFIWOYheYV3oWFWa1bw4=
X-Proofpoint-ORIG-GUID: k_jKeb8aQyHWKkokmOo2EsqDrwcQiYZV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMyBTYWx0ZWRfX4dKBp6SagnCY
 eauMaJixt9hKF7OUWUVarRL71b1zK7tIZkrT3gYxDvDpum/AkT/+1QgdUN35a9gav7yvBNMWy8H
 tHf2PyTzCma/5ocK5KvYuXbdIEvCAUJCc7JghK3Vhk2TRs1Fvei7NWeVJO0bGM+5/qyqimVvH/B
 cdHww9Mohk8bGw60XWzuUjIXLgWDb+3loantiRzKAZfaM+NIV+2Ks+hZXTMMEUxdDKD5HTqVEj4
 QDXuZRBlmMH/fWtTZdvEiQCN1JwlON6dST9y+Picd5cSncSxs4KYlSr3ytzZX2spfvhkygYalBi
 8wnxchM2WFRK/kHZGDvxcBDSw+WuMvd2zphSTYk8ET0d/2yXsChZI/O8tvIC5lhrcRCsq5yA/AZ
 Vwv9MB4L5KVNovnv6bAYfYD2x495/LKhdV62Nv35NSAE0jqHOzF99f0PfI/af9SF80mv03Nj4qm
 av0073TYMB9I8/YmuEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300103

On 7/30/26 3:29 PM, Dmitry Baryshkov wrote:
> On ARM32 with CONFIG_ARM_DMA_USE_IOMMU, arch_setup_dma_ops() creates a
> dma_iommu_mapping for every IOMMU-backed device and attaches its domain
> to the device's IOMMU group. That domain is neither the group's default
> nor its blocking domain, so when msm_iommu_new() later attaches the
> domain the driver manages itself, __iommu_attach_group() refuses it:

[...]

> +#if defined(CONFIG_ARM_DMA_USE_IOMMU)
> +#include <asm/dma-iommu.h>
> +#else
> +#define arm_iommu_detach_device(...)	({ })
> +#define arm_iommu_release_mapping(...)	({ })
> +#define to_dma_iommu_mapping(dev)	NULL
> +#endif

I see this is prior art, but should we support this config being off?

Konrad
