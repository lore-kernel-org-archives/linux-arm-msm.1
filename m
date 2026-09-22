Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ED74F30C1
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082218; cv=none; b=r6d1fBoqeGagKUycwiu0li6z8MZgq5jDCoLr04kubkCx6k0JY2qlIQcW2+clNGjbdlGTVxxbYMnyJ/Mmwxm5L1phC3NGwKHcWKNzfBd6OO7qPTRDsYXhNdnATP9lWgbcQW5oDmOQG8puE/4vRXBm5mwQcesqZCCrMypHTmLYY6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082218; c=relaxed/simple;
	bh=bxddnFMM40rZJyomJz2B+9UVeiJC1/Kposg8e7UdqeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KI6ejC1KgTXhNF4xHU1h04NShfA3joa4aXEwaJNk0f/f9wq9haoB2/td2yUk/NK2bVpOLwO7zDTHYa1euR4cC8DpxwZiMuBzaBSDjkMsSzFAn4MbfDkAB1fOxrbqPuPnSS7OhLwTaakJLQGDBtIi0TLVSrmFKi9gcrR5V2B8efM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajAwFPjs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDUTDep5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajAwFPjs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDUTDep5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPX4A3487073
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8/QTObLMZagqKCMz1L71lAYH
	9ufZSbJaeEUf+dsnNk0=; b=ajAwFPjsQRe4rAVQcqrY6nP4OItBpLYKICHCIbfm
	QLhshKjxnxKRRnuJgjQZEEEbYZ97koOLodlsL1Iiz8wXbdY7xwfuR+w8xmedu+qZ
	h2vINZK7Jed0op0dBHIvDEoCmNw6Rbjd/WE53WkzPqNbHc2Bq3fIV3/eHTkFUGBt
	LKMYbZQ61hzxibu494ftwJCE3hxMFFcprdHwM1X18LXfPDxN1+WD6NuscQdjLzSV
	IpYUc17QjgIVy3IClqhlNC48+jHHzLvPbIIn0Zj4DDSZW9YOCTJhIsrYg5LdWSD7
	eQYtvCeO6JXyQI4eHmCKp81yiiDUD+Z80/o1aKdVCuTVhg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0k1ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:03:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82f879767so5921798e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790082215; x=1790687015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/QTObLMZagqKCMz1L71lAYH9ufZSbJaeEUf+dsnNk0=;
        b=EDUTDep5EwK5igK4NsQRjjB6L+m2LKGiiuQvhtBI3uKAjPEiDeSDCYLY0bCkln4pVe
         DOn9VZvj/+IL2ZtOcDpAx+9a9gvyv/qv9pCMaTDeJy079D0tMmf/dWooZgwxqvbWHsXm
         EStViEPnOopYs60vXuQc8/gsjJGKdOPAfQD7dtp9lyLliccacWJnX00S4RHT4g0N8XIv
         Ro+5zbx0PVh2RvhrDBu739h+rroLNa5ConP+xzTwBig0Igogh7HY+Keth9sriSxmV30O
         YWSiXMsWjWaGu67yOcTzWZ1l2OXxY0D6TaeL86q9hsKj68ZjyaxcluVsopishpSuo/+7
         nYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082215; x=1790687015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/QTObLMZagqKCMz1L71lAYH9ufZSbJaeEUf+dsnNk0=;
        b=FjgghFdVcOOAEro2Uy7lNKjLLYX7afqZnpobUfmtuHNAPDGx6OZuLVUfTAgeoyjilf
         dSU0KHWnUzCA4Lh2iLUe3ozr4p1DVbVSW+rV+oPjg+r1pXNMEL+pkemBBcVo6/IW07XZ
         bhA2UE4xHiz0tooKpnnW9Lzyip/XDiziCVgy0+iBfCGyqIwGLhrRn45MQ8V26AhDYCQ+
         1cOmUTLodm7op5WX4YOIbr/NO5DxqgkrMGO6o2GK2XjTRJO4XOP+lvfX2EkzIrt4x1wK
         K8fLqSv5nvIjmH34S25eYuqjcBW2jvLXUTCc7yqMFu6shQ4yYt7F3dxm/QCUohW25XU8
         UZVw==
X-Forwarded-Encrypted: i=1; AKwUvBwBtLUg/lEpx/mhptTV0W03qm9C5+vBqV/9M10CdjQNjcqBQzMzD4dc5m9CEmk/F5+sWPc6O020JsZtOoaz@vger.kernel.org
X-Gm-Message-State: AFuF++lR4sLUcc7t+sfbkxce9uw7nEZSw7HD9q99oezANgtT2nouafSt
	UnaXFeKFSyv+MI7jEVWykCLJw9FA1018d4aPqyn9VP3gxaNseklEWdl2HN4IrNPQ8k/Szc70H5/
	gKowF4/9SXwipSS13xO7B87aVjLe4vrE0Qnuhzb1w0WpsrqKtByjDkw5AG1WkHfol+MAP
X-Gm-Gg: AYBFou1tqcacJf7M4C+wxIGEeidTCkR7wajKd2/JfajjICHpw3rWNI83tIwJ227yz4f
	2K1JlCHL2vdAl+Jnxoi+TAStEt+zOdRiJELX1ljue69YmndCrJGu6/U0XukGSyeq75ncbIjl5FC
	7BWCdzCy4eYFx37LEgoeN2BhIlnBd9xC8C8KBZVgk7WDvs6fXCAspIg5xlbfbSgL9zKNBqM9VtS
	Mayo2Fmu3OsA0cyY0Nv4/EvnOg8oDHgQmsy0wYF/JKcMXhMEz2Ao/VPZezCrHy4iO5DDYOO+YGX
	TW9jt5Wv0qeLBwWnx6/avMwovqt4YKSwS6lGUKPbbnlMkZ1CCZDcuptzEdGJPlhpn4cZykaORo3
	rf7HzPS3OXb5cq9qV3W9TZwaNyFIHPXPEroolggJLmz3brK0Vm13tNFfCJy0ZrdoqAUkLPi3/3/
	w5dnYpLmO4jbhV
X-Received: by 2002:a05:6122:1b8c:b0:5c9:a60b:e5b8 with SMTP id 71dfb90a1353d-5c9b599c8c3mr8828570e0c.17.1790082215169;
        Tue, 22 Sep 2026 06:03:35 -0700 (PDT)
X-Received: by 2002:a05:6122:1b8c:b0:5c9:a60b:e5b8 with SMTP id 71dfb90a1353d-5c9b599c8c3mr8828507e0c.17.1790082214701;
        Tue, 22 Sep 2026 06:03:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46dfd50sm470532e87.45.2026.09.22.06.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:03:33 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:03:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/9] media: iris: Replace enum-indexed clock and
 power domain tables with per-block structures
Message-ID: <zwqr6biua7ft6fkcgloqucthevvtp4viupyhrloc35lkqo7azh@4o722xibsjmk>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-3-e0c8bc914742@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-glymur-v11-3-e0c8bc914742@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NGghvsL08sn-iKkoo0gYM8Cp43gSfGNO
X-Proofpoint-GUID: NGghvsL08sn-iKkoo0gYM8Cp43gSfGNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfX3XmUUemEFuKy
 XeKjkgyb5pEMHBtWLzIQtn3iq9wDWTkMYEa+0tW3T+n/+n5UzbWBzlKOentqWF7LrtxuEQWqzHv
 OQUcuRwRng17VukwedmAzjEVr6ugBktJvBcZgwZksuawssmVwi+C8hqF6YmYbp6CvjJVNxcAnUP
 VJgLcDMd+0ZQD5kQBxj157BGpVuiQb2EZ9y/krgS1QJQ2yUlbD/uOK/mrEcBbSADvXdoD98BYR1
 2AzzjKjdRPI0R3zszGlezAg25rZW/xDtHFSh8XUGSoVntnIAoB1PN3aTLZt+jcSI/3dzMSVHV+k
 NLLSsrJ//ZfeKdjlaVN0LoCl7U2eC1TxrwCtke7QKFxXhTQ/0mvN0/mgyJGtYi5oW7jrAT/WK3G
 KytNwQvA1AslYt7x6XvPENYxVTWsXwbL34V2aMC8zGpFewJKnMJZ1QPcUBwQ2UY8qMMUayn8/1Z
 hkRNA2KPnN6R1012j/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfX3XccrU3ZK0Eh
 0pWOl+X68FswAdRE6ciKN3eWy6Qc4LAINsN8/GaxAAcrpK8t7pChI0S3EZj/JJ1XRL3GqHqPets
 HpQCTOKZC7m0iVdvNmBMyPFg9A8Mdqk=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab27ca8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=cQsnMm6kD37X6GfbhGIA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220189

On Thu, Sep 17, 2026 at 10:30:22AM +0530, Vishnu Reddy wrote:
> As new platforms are added, the platform_clk_type and
> platform_pm_domain_type enums keep growing. Every new clock or
> power domain requires a new enum entry, and every enable/disable
> path has to loop through the clock table to find the right clock
> by enum value, adding overhead and boilerplate on each path.
> The enum index space is also shared across all hardware blocks.
> On the Glymur platform, the VPP0 index for VPU4x and the VCODEC1
> index clash, making it error-prone to extend support without
> breaking existing platforms.
> Replace the flat tables and enum-based lookups with
> iris_power_domain, which bundles a power domain device and its
> associated clocks together per hardware block. Platform data
> describes each block via iris_power_domain_data, and the enable
> and disable helpers operate directly on an iris_power_domain
> instance, removing the need for any index lookup at runtime.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h       |  23 +++-
>  .../platform/qcom/iris/iris_platform_common.h      |  41 ++----
>  .../platform/qcom/iris/iris_platform_sc7280.h      |  28 ++++-
>  .../platform/qcom/iris/iris_platform_sm8250.h      |  26 +++-
>  .../platform/qcom/iris/iris_platform_sm8550.h      |  26 +++-
>  .../platform/qcom/iris/iris_platform_sm8750.h      |  29 +++--
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  20 +--
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  32 ++---
>  .../platform/qcom/iris/iris_platform_x1p42100.h    |  27 +++-
>  drivers/media/platform/qcom/iris/iris_probe.c      | 137 +++++++++++++++++++--
>  drivers/media/platform/qcom/iris/iris_resources.c  |  81 ++++++------
>  drivers/media/platform/qcom/iris/iris_resources.h  |   8 +-
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  37 +-----
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 137 +++------------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c |  98 ++-------------
>  15 files changed, 347 insertions(+), 403 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
