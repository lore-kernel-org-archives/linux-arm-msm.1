Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294796;
	b=oIjMZckvw1cOi9cLsl2MDGTWnTOk9Ca50kX9qjqxexImtGqwR424SXROq0xWAbf624h0
	 y/kZ6J4M1fczO0ZqON3rY06fetnslUJqyYwnz4cQVKbD+CDF599MBo3NThnNuy6cLbO0W
	 2gx97n20bO5/O7ZzdrevlyoOFMc86xymRr+cYo1FnLi3hHrylU3FobPo0utph7QvQcMUj
	 RUdQx9uPoCikTM3WyaffD3tk35WMxM1159PfPYlh7mPZGifTTLNSgg67YF5cYsbHDgPYN
	 CU//5TtQDxp1x7in5OWtTY2mJarkIGELODLEQp/GijcN5nEaMktgvAXLjubycuDZMPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O7UXFVgKpvNjfKTFlHSJy5Szag8SKeYr2EcItqqOWiw=;
	b=I/UmMFCMIgEGQ4vs7ISxV6vpnJA4W/LJ0Lcih9YUh17ujjNXiB1MpZAwl3ckYbDUNlji
	 8V+TotPhS4dI6MR96bB6AP83Lmd+zqZsguLynHWWpAv+33HNH617APR3Wuu6CFgxYlyTS
	 Mz0/gd0omBC4nOf2XP3l3jLuSHVSUg4vmiT0uN/lyWk4Sa2XRilzjM7PAucfBkFXS21PH
	 IxlZs3KPWuIbux9C4aFjoR6Yj4HSFpFmz3pJ5vpnuUraTqDdwwvL+CNvcS2BU98yWxF6F
	 bgyluHLkH+iUKA/uF0KhUN62xwEBmwzEPBM8kbL5swtK/GUzZGhQ3otLNg9EiFhbxxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pccZ+g5B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNaSJ+GE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4D2606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 07:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4D2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pccZ+g5B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNaSJ+GE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A4TM679599
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 07:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O7UXFVgKpvNjfKTFlHSJy5Szag8SKeYr2EcItqqOWiw=; b=pccZ+g5B8bNi6/gv
	byGX8aXLKOZRv456TpYR+WsMYwZif4FXQvaudpLIWegAEQmWeFKJhOCC6gT4NhWu
	HJgZKatPY/GzU4RNa784o9mMe9LssI6kF47gqz2lsYynCTEQAHydRm+U1rfZ26yO
	HMD5OADYkcwCRRUiBc+mumXP06zuiedmYXsATCtUw5EyBjAw00FMg40it6BkC2ds
	VqokwfaSeCHdyevjt+LoBcFbCLnFoikjy7ZdV8taEhIhV7jpEF8ZvhUm1Vvjdsop
	4O1OvU6PLo/Ko5wEsmyDwbNupgFKbFnKfm7T1Wb5SGKO695TR+3gOynmlqP0f6wO
	PjogAw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv48xgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 07:13:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b09a466295so1461228a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 23:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794294794; x=1794899594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7UXFVgKpvNjfKTFlHSJy5Szag8SKeYr2EcItqqOWiw=;
        b=WNaSJ+GEBLSi/W/Ta5dwNZUFfJwVm+ivJbWMojLmCUlvXR7z//95a6LXyElMFEzALV
         oQZ0TDJbs9zO/vuhBoZvMpyZE6Gk5LV0T4UeecQiROhxY4iyld85gVGeC45su6ZsBc7z
         /apD3kXsZXT6njQsy4VTRjz/PTZ79J5QYALNWRS1IEZYUU3wVNhWR1KYXuPbz/rhHuRL
         Bs9CGZNGteX/6WLWMxsYDTc8n2rG15nbKDTRTlhPm2ji3IrEYwGEfADWkwuZcZ6EROO/
         WcFmSpbXWr/Ajiw2lh00Dw6c9uR9xHCSFsdGArLT4qL5rdZk4yrOgqRI+gAQkQbzkVJ4
         ASkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294794; x=1794899594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7UXFVgKpvNjfKTFlHSJy5Szag8SKeYr2EcItqqOWiw=;
        b=TA204JeKQwja9L0KyPNZ6pA85F5EckakZAjYzrfPODqaa0EOlnuVTzK1CNAo++D2vZ
         fR30ABaIGwMyUxZKBSGVeOqTdMcNFrEU6R6u7ixAfBv1D/IjAa9VBYOXc0fW9l7TXnm4
         AaVUh4pdjYL8nciqcvjVyPns0ZHdBH2E9VDSdARUr4t+QbALb3YhNKdGlCh/W1CFRAyR
         ouNSzwW2w58fwwGvvCK7Jb9OIojGcxuzEO6iUuQcssIT5kvF4dcoHQQEemsTwMd4SzNL
         ZOieM7M73hLaVqSYxxxDNfEiXBXEwK5EkM5P8gzxExk01SFC/7cDuI2cggOhu8FAuzP0
         i05A==
X-Forwarded-Encrypted: i=1; AL+hErFzk7bjsuVuuzn0pfOLhlAMx+EJ0WqneQRZpXJ/3cc0+J0PLD8xEl2aUKWN16zF6gHSbmz4piXqL34ZCr8z@vger.kernel.org
X-Gm-Message-State: APuU4Z98BJTpbkcZOzY7bLlnnLSJ+i3kQWy+YHOPDH+GU4lFHQBJA7ZR
	+2BfcsOb57D0LJTLnRZy9RjWmgToNVYOenWx5ivn6/1KYfc3CFEAi4X6XndMWgLrs6K4tI4iFvd
	wze55bM6XVvLc9WdXVnR84emq6+j+FBjegVkA7nyZbTqxiud89ubdi0PmJRgYiEqbvPU8
X-Gm-Gg: AYBFou1j9svGZHw7wv4/m75A2Ap7Xe/JHdVRTGKBYChXMY+5hiyCWHAbA/kEjq+Hdrq
	SWFCx4tkbwKjUeF5W1g+qO+V6RXXq0gOUwhMWZQdQRu5qmXhqIpyxP5X9bfqsYG3hx99oB3kt0b
	ejmqtuCK7713+sVohhwiVSLMclaxh1M0tdVTKjC5elbgNWqz6x1vik9+AA8cHUI6Z2pB84BnhzU
	+MrgN1SNv+Ev/U5jw5HykrKKeEPp79qtxnJTV/p3G93L/zmGu1F4+zJU+ZpEYI/VRtmpRWhX13a
	HTONHKL2VxZj1Dl5tAmBpMEk23W8jZP8kXW3iMF/S43iO+dnc11MOXJNAHN+u6hUblrYsnxctqr
	HttIUpf3kI5H8PWU/B57pQUdZ6S1LJuHY/e++paFgV3umPX1BFStB10IVvRCkLliCJhbIb5EnzA
	==
X-Received: by 2002:a17:90b:1c8e:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b166cd3dfamr1883543a91.44.1794294793473;
        Mon, 09 Nov 2026 23:13:13 -0800 (PST)
X-Received: by 2002:a17:90b:1c8e:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b166cd3dfamr1883528a91.44.1794294792977;
        Mon, 09 Nov 2026 23:13:12 -0800 (PST)
Received: from [10.64.68.239] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d1f42sm2761077a91.7.2026.11.09.23.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:13:12 -0800 (PST)
Message-ID: <b75ff010-305a-492a-bd16-b27fb8a4e064@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:13:07 +0800
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
Subject: Re: [PATCH 1/3] iommu/qcom: Invalidate the TLB in flush_iotlb_all
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyOCBTYWx0ZWRfX9NACs5kJCBYp
 XhMUrF9Htxp4KfcheHXsishyU8mcP8a0EyNF9uUvWT2WaxBzMWYtGA7vKArqCB81FqbM7AZsSdH
 vaw3xZ8L1VNuitykVMspXe5XaXi1cUo=
X-Proofpoint-ORIG-GUID: GZUd4z3zw_BHDwimMHiQE440sYHkCTqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyOCBTYWx0ZWRfX4rfCjd5dePW6
 WX9Osc/PPgE/d/Q3dHtE0DrOp+kCwQs9Gl43EEIahwZfBNDwCQalYt/1d3u3NGlTtdTv/hqJN7J
 EOokA7hDmMW59TXd8ffeEAkmKKF0qjSWV5ZQRuVu153IxVU2PoYLn2MHZTMLQYPsspoNJUQkFeb
 D3EOH8hQdyvmJbOiKd3sszI4UJDv1se20Fw16fOr4YgVHpWlaDBdFgKP0BIbqz6ZZOp7TsCKd28
 LUEDxvkGmjK/fPS2ulEUN+iu+wqZbM1C7+gt7MegIpTty/2/yqVuZe58eDAjqVszE9yd/d9Y965
 uqbskN6Mo7LKnePgHfEqDosbzlY2Gqo8ULo8BYiL7PytBiHVM41y8Ueh8H14JOnooNvEfeaj3u8
 U/ibDKNdzLS/S11v46gqLpTH4pHmRqRuScMh9hakH9f3KPhjgCfh1FXrte3Sw78SI8WngLlh5l6
 yTZT6lc0QF2vLRCpsfA==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2c40a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ih06bLOFWD0XbLq0AFAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: GZUd4z3zw_BHDwimMHiQE440sYHkCTqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100028



On 10/31/2026 6:04 AM, Dmitry Baryshkov wrote:
> qcom_iommu_flush_iotlb_all() only waits for a TLB sync and never
> invalidates anything. iommu_unmap() users do not notice, since
> io-pgtable invalidates each page through the gather, but drm/msm unmaps
> with a NULL gather and relies on flush_iotlb_all. On db410c the GPU then
> hangs on stale TLB entries as soon as another process reuses the IOVAs.
> 
> Invalidate the whole context, as arm-smmu does, and keep iotlb_sync a
> plain sync.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 21d18ce67b98..54130c32056a 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -479,14 +479,22 @@ static void qcom_iommu_flush_iotlb_all(struct iommu_domain *domain)
>   		return;
>   
>   	pm_runtime_get_sync(qcom_domain->iommu->dev);
> -	qcom_iommu_tlb_sync(pgtable->cookie);
> +	qcom_iommu_tlb_inv_context(pgtable->cookie);
>   	pm_runtime_put_sync(qcom_domain->iommu->dev);
>   }
>   
>   static void qcom_iommu_iotlb_sync(struct iommu_domain *domain,
>   				  struct iommu_iotlb_gather *gather)
>   {
> -	qcom_iommu_flush_iotlb_all(domain);
> +	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
> +	struct io_pgtable *pgtable = container_of(qcom_domain->pgtbl_ops,
> +						  struct io_pgtable, ops);
> +	if (!qcom_domain->pgtbl_ops)
> +		return;
> +
> +	pm_runtime_get_sync(qcom_domain->iommu->dev);
> +	qcom_iommu_tlb_sync(pgtable->cookie);
Optional cleanup: pgtable->cookie is already qcom_domain. Could both 
callbacks pass it directly to the TLB helpers and drop the pgtable 
variable and container_of() lookup?

> +	pm_runtime_put_sync(qcom_domain->iommu->dev);
>   }
>   
>   static phys_addr_t qcom_iommu_iova_to_phys(struct iommu_domain *domain,
> 

-- 
Best Regards,
Yijie

