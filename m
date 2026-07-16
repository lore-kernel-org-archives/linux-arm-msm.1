Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376413B19D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186862; cv=none; b=RFFuSAbscKRANJZHKTQ1/1k3Ly7UMMran7m/73KEuRnUOwoH9wXTSVN1SY3Zuvqfqy6Wzv2S4QxOu2bUjFb2WzV9UdSiXcEaaz4x05FKEtuTY7+3U7M9/opUUCAc9VYmcNDBh5q03eGJqeAHU447H4DBwZ9KKF3SUf3JBwBkhqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186862; c=relaxed/simple;
	bh=AKpy4pnIDwSZQN/myaZIK15rW6VRJX80vHJ1H8+v1ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sU9vavReZK4CuQLwqvIYOM3+6DeUvvXSFe0bLVNzGfopGWcjbExrRqgkNxCRxIUBPyMyrDinqa+J3QQTgbH+wGoeEcjFphyHTiROKMY0OHhF/FHHJvuM8CThGK6d3ZMPHYqr0zx4e0Lw+0K1eL8VF+6w7ugpQVt/nBHp96XaPk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XX/m6RZe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoqfsUxd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XX/m6RZe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoqfsUxd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DpiU2011951
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bx9Xs0p7V4nn88GnuV9d3SGR
	DdrnnmJ7s4DaIuEh7P0=; b=XX/m6RZeFQsgLhOnR0lybETLbDxpJzgBK3zY05Gq
	uDQyKM4T5GDvl0gJvAmu4h9lc3cvXOWxYwRMkfClWsR7GzUcvc7FQzwMtp2BeCzM
	5laO9EXvfmemFPz//MQtzvXY0rc76ErRpE5KsUFu/g8FM4fj68EUiek/0IkwyRya
	kqzO1lw/1kcESVSDw6oxHxbBpyrOQsrg2L7UAbKNPbDs+TJae+DQgxKmy87g7yAB
	FlhvjPDufVyN8mhqhVVvKsEYSix5lqxBrV+saIC8P9jqHh75qw51lBikGIABwh6j
	Za1Add4icEEb/KR3s4kMzczxS+NyEBGh2227Dk3koPxbQQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q64gmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:27:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso7817172a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 00:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784186855; x=1784791655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bx9Xs0p7V4nn88GnuV9d3SGRDdrnnmJ7s4DaIuEh7P0=;
        b=hoqfsUxd4OjjJckNCGcpeJi0bY/gEVHbEHAvL1umvnceTtEX5AR265Lr7CvxsItSNp
         xXjs/40iKEAYw4cq/3xLRhpxz0Se1FiIbqvJGAxo0taxHNexQSQU0EfpI1e6zbp21Z/K
         dR+zsCU87eaf1B4/sknXBYwLGELVDFuMXNH8B7vnlXEp3r37EOAlLFg0hXSz8GrIT+np
         n29LUY+wSQZw7JkJg6QyVBHg+798uXuOISFR3lEg7Bdsq6bc2MRc0UQSt1paRGKFrGx/
         nY+XkfIPm0Pvc/pew3MiQdnrTJH0RPaCdisb/etCe/NfJ2zcxj/UKbvkJK1XrL+Drp1b
         +5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784186855; x=1784791655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bx9Xs0p7V4nn88GnuV9d3SGRDdrnnmJ7s4DaIuEh7P0=;
        b=hf7htFOg4Avs3khgu0f7i40nuHMdA3vk6uCDWTJpdg76gdIrI3jcQnIRhVzWbuuMcd
         qpG3DEW4oiVDneHgVl64st+HhA4R938dcVmDNsQsl2O0lluUX5kJN3UXqSPoxxULW2p2
         QODEveyD9xra9Xsl9ubfGFxX8ALFGMHJV0OavangiHmJTfJsYkicw7dxtmDj5bJNi0dd
         ch3y/jIk/6Ha3UdXBBfv3odAPKOlh9/tzEhMwalylesY4XdRfZYbpM/3FhbZiyfmujYK
         cnW0k9rEF8p0BBrJcPEu4PtfZ61uPODyFKdnYJoLUMfGxq1TWTSSCLmaxEQSLg0FoVC2
         e5zg==
X-Forwarded-Encrypted: i=1; AHgh+RqRmWMfULt8ISx8ITS7gKtLkGv2DdoZ7S9nRlM3p4xi5aZFa2VcurLUK0oNJ8zOolvS2xNqLMf/1d3+p3ST@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh8LPeJHoTxw+jFEKrjVZ/hiZ0LSv+4SP4Rqe5nA2Kp7Jxv4DO
	uBIuncC+AY28WqS/vHQBko8pXvwgLnZWc6RqMgVlYZ4A4/4zEl1ujovW55DlhlDEGe+o2XAS85q
	+TpKSCvZy2IK+WuOVX6oelT4e7AzaURdRINnTlzPeHOR1P4HaNDs/kkTuWSR0yVnbUFQi
X-Gm-Gg: AfdE7cld/4FmZQbSC4DVqlpN4qSya72egdRvlyRCZYX+DkGOsHJz+xraBcbgDApKHn+
	mbsWDkKYSAnlYsPZMsnA/p9uyt+Xc45OuMlTkLdyvsvQVV1zjfEpuZOvll7qCDCxIX7ABjWSRfr
	EDZhR/SXQoYt1zgHtiknDO6s33KNSBYJmjtTrN/UpFhDoDjJiIckkq06zmFKJkJ0oRe08H6c3yR
	xstwWDL1om/RG9QkvnXVWE5gOP77k6cseggxhsCLDVGtUY+RaIbrP5AlMCzWcW0iF4sX+iKKv+J
	HzXHgzeBX4uEpkS1p8cznW4sGcK2SBX+cOXkGyp5n8nX6/8LAkC2EakdcbOVRkP43PqCOIPPaZC
	fcrYB6LX+gRceOj/7+DNG+sIDy14=
X-Received: by 2002:a17:90b:4a4a:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38e1ae31638mr7365598a91.16.1784186854612;
        Thu, 16 Jul 2026 00:27:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4a:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38e1ae31638mr7365580a91.16.1784186853996;
        Thu, 16 Jul 2026 00:27:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6f0fcdsm8559669eec.30.2026.07.16.00.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:27:33 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:57:26 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Weimin Xiong <xiongwm2026@163.com>
Cc: robin.clark@oss.qualcomm.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] iommu/msm: unwind probe state on registration failure
Message-ID: <20260716072726.njo62a2xbaum43u5@hu-mojha-hyd.qualcomm.com>
References: <20260716013229.91014-1-xiongwm2026@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716013229.91014-1-xiongwm2026@163.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA3NCBTYWx0ZWRfXzwfaEB3E5qj0
 cORmQmWX4+hOWchYewPIspgh80TfLR3xb/+9Dzc/V/fS0mvSHdVQllKkdcmJrBm2c3tOJP+cYjy
 nRyC5Tvs7tEHzD7D4aKdg1OD2ADba8Y=
X-Proofpoint-ORIG-GUID: tlnx2tdiZClW2csHXBEHN74-wUyxpBOP
X-Proofpoint-GUID: tlnx2tdiZClW2csHXBEHN74-wUyxpBOP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA3NCBTYWx0ZWRfX2P6HuIKR88y4
 pkwv6SjOM136BDrA2Nu1FE9Fa4eroYwhW+7Bvpb9YjqP9s1D08btMGhFu+bnb4KxMOW457wFQKZ
 JND3zGiMMJx4+fkCiwAa9rse8ZWIlkI6WPgc7ESPYRIua5JAOX0IaQpJ6bahLdogfZAwKilRY0J
 l7WM2HMhQ+M7ZFSSNesKMDf/SDGwf8JjEFlG3tYV1s+QzwGshruAmAkUOxr8AB/gENiEg4LYfMr
 jVIaZFqxVfMstgxAVobnqlro3LvwQDSCTLbrFIMwIs1f9nhzoGjkhkNoghkOSY1oA4mFNwoZ4Ec
 Ij8sIw/sXwXg5CxaOQiuSF+JFO1V02C9megUZNR3XvSoRkTj7uuvCP8HX1lQpj/pDiAWf3P3exz
 iP1ZaHeN5HvLhN1SPjmGiEo7SsfbPq4BK50RYy3fWYa5LJThRXkyvwJ+2KIE8GUzbQtkju1tKEZ
 9Fz0vwMILNihhKvCIWw==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a5887e7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=a8LOBI3GJTFK-6nigkEA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160074

On Thu, Jul 16, 2026 at 09:32:29AM +0800, Weimin Xiong wrote:
> msm_iommu_probe() adds its devm-managed IOMMU object to
> qcom_iommu_devices before adding the IOMMU sysfs device and registering
> it with the IOMMU core.
> 
> If iommu_device_sysfs_add() fails, probe returns with the object still on
> qcom_iommu_devices. The driver core then releases the devm allocation,
> leaving a dangling list entry that later list walks may dereference.
> 
> If iommu_device_register() fails, the same dangling list entry remains
> and the sysfs device is left registered as well.
> 
> Unwind the sysfs device and global list entry in reverse setup order on
> the corresponding failure paths.
> 
> Fixes: 42df43b36163 ("iommu/msm: Make use of iommu_device_register interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Weimin Xiong <xiongwm2026@163.com>
> ---
> Changes in v2:
> - Resend the former patch 4/4 independently; patches 1-3 from v1 are
>   dropped.
> - Explain the dangling list entry and stale sysfs device consequences.
> - Add Fixes and stable tags.
> - No code changes.
> 
> v1: https://lore.kernel.org/r/20260714060930.220277-5-xiongwm2026@163.com
> 
>  drivers/iommu/msm_iommu.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 0ad5ff431..d0d926be7 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -784,19 +784,25 @@ static int msm_iommu_probe(struct platform_device *pdev)
>  				     "msm-smmu.%pa", &ioaddr);
>  	if (ret) {
>  		pr_err("Could not add msm-smmu at %pa to sysfs\n", &ioaddr);
> -		return ret;
> +		goto err_remove_list;
>  	}
>  
>  	ret = iommu_device_register(&iommu->iommu, &msm_iommu_ops, &pdev->dev);
>  	if (ret) {
>  		pr_err("Could not register msm-smmu at %pa\n", &ioaddr);
> -		return ret;
> +		goto err_remove_sysfs;
>  	}
>  
>  	pr_info("device mapped at %p, irq %d with %d ctx banks\n",
>  		iommu->base, iommu->irq, iommu->ncb);
>  
>  	return ret;
> +
> +err_remove_sysfs:
> +	iommu_device_sysfs_remove(&iommu->iommu);
> +err_remove_list:
> +	list_del(&iommu->dev_node);

IMO, this can be avoided if we move the list addition to the end.

-- 
-Mukesh Ojha
