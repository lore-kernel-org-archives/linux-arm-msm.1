Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8153DA7EC
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 06:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785135003; cv=none; b=jYOSQA3P2pH+tB+WiiX7UbYU08v5SootMlBAkRtIL7npPBdtoWT+p93Jo0l81kHo04cd5XiboO5X0egkBL7tbJaQDIOy2bEfq0q8642+Mb2ZqceOVtG/afQI7t1wHKiN233lpVIK5SOrba5CILXlkeISBOg3yRo9Ce7GhOTfM5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785135003; c=relaxed/simple;
	bh=pflg/qSim36z4Ry2Kscwso0j8VmBPRHSLPucgDAp5gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHErWg8AmnmGiedya/0B03Jqr+JgpjjCsBGzTenFhwHBGnxOSmnhT7eMrC7R9X91fmPYBNGGAAGuDgCi1IBfEzrLCF70vLO2uv7BZWmhbJYWfu2fwRrluWvv7Rw+KdqBWBohgjjbxrJxThzi9Kolra7A8A6QtgRtvWJsyXAWxdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQI7mdrX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0UWC/70; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQI7mdrX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0UWC/70"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fv422175959
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 06:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zi8XrX6mHUE86jTTfiGfreaEN7/pnOHoUZnubmsjLfg=; b=EQI7mdrXTHTUccae
	jzrrWLp5iPe8hRFQAq3MV6IAUapW4Qzq5tVLdC7X7xys5PwDrbwJKvgJxur9t2/8
	TJvLL1mxb4EBhJPxqMvGwwZagWvjSKG7F/r8db+FIMeN9CxT/cx7UtqYmAE3Exs1
	f0LCsTvDsuHh3/XE+h5xAeyd2W1JS/WXRvKLMGT68P1Be5hUYRSxGyFEHfj8KPYX
	KjfLUUVChtb/VedsHx0npBDdM2xsNe1T8ttQDx3GIok0K05yAsc2V4ssPsG2nBdT
	Hsnz8E0eb4o0/3rOXpQ9Ycc3Jui81VTGdY3RVhDBs7+g9/N5ljC+qenW4dKqEGDl
	Rd9RmQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnwevqq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 06:50:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848568a6f62so4173533b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 23:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785135000; x=1785739800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zi8XrX6mHUE86jTTfiGfreaEN7/pnOHoUZnubmsjLfg=;
        b=T0UWC/70fKJRZvgMjPYMplmifTCdhidDuccKQq5djy3C8kLaocEBSh9kvLkwArmXXT
         l2b2I6wGLEtrzvaGsPu194jVkZe2zhKKxH+bXUO0kMW2FnC0EjoIzk/PNkmU1J5b0AK4
         /KNyhAXGiHT8htFtYqoMuAfa1tiO6W8HcZ/DvQqHvIKqrc4wr4L4mjxaIQAvtfaJCk+b
         KP6ptxzCIogvXaUiNaycLZSYoFUuyBUERnYugiFUSbX6a1uD4TWKjDNRDqlV4jG97Z/k
         jOQbiS4fnl3mQSih8qlLmg7PkzFBwY5rgRNOY7pob+aV84xOI7fSyI2cdGE3T91tEit7
         S3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785135000; x=1785739800;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zi8XrX6mHUE86jTTfiGfreaEN7/pnOHoUZnubmsjLfg=;
        b=mQ6dPUQuvvWtfDaZcoPx+5rG9fkh1Vei7hIxJGd0dCdOajmKL+5nvbTLZ1sdoXHYQz
         YhpKPiCGejKPKEhwhQT++dm5TNLq2qkMzwI6XvdzjWVOHzaeyeR5hdR/coMotuDkO5Bl
         1w/zFgnHKLt5IbGSSs3QZSc/LpIQXv3QJMwMQbocOfAJSRtI8v6HLuXXEfCzXntuUKLd
         y33qsg3cueaVG6FXksXUH2bNvIYD255xFE+FIQk+rN3B0kvMAGUT1Hmu0+Diqykd/Dbz
         VL3Y/pl7Aq4SAycCVTMO96nVQsnqj8XUvxkffmWIkxyCkO6BneAaJAgmDuHw6xFGc5KJ
         I+kA==
X-Gm-Message-State: AOJu0YzURcmJtR42c4cRhBJ2vZNdsfbBOOFEIRGsARzYo7ahLZGISvcz
	ZoxDKI1p8gohzI6LUChdbYk5GEABju4VDkQsV0OV3f/BakxnSQQQqMLHawt3qgKrtcza4BTxBc8
	4p+tWzsbyDt5FGaK9OAm0nsxHYAa/n6vdAdHMA8addiNq8NhmSVD1pDLLT35JGIUDgUDy
X-Gm-Gg: AR+sD12UpNmSpxGOFTU2X1CIegIka0lvyrDeLOsqyrMty2sAjr442xuUcwDd87FY6YV
	3t2CbzZueMB8CDDE1uwWllKGmrzGTyVzg5cwuuHqOrBhMMnByQbvTWwms7YRClHA8eygKiQrNY+
	7Sg0tQqg5dJThdGq3obY+Q4DOCIqRyIpY+0cgEzR7Sw+H2TPnvlAEgaOJAEEqb/8ALLSt0Kwjda
	qZDI87R/dLu8mvOALaYs+zogq4W33YB5yiSLFJ3OTeDWfLFtqwLNaYpEZWvmyol1T5FiZamlJwf
	Y0qdWBTPu0uIEXeCI+IKT/kW+XYiRZwZu/8y5xKz3heZAU4etYgX3lAFclckd5hdMCO9DbhR1wZ
	9fY3Rh9foAC3WMbkWo3UAjUexIYnxlQ==
X-Received: by 2002:a05:6a00:998:b0:848:60d5:9526 with SMTP id d2e1a72fcca58-84e595829femr5477892b3a.43.1785135000359;
        Sun, 26 Jul 2026 23:50:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:998:b0:848:60d5:9526 with SMTP id d2e1a72fcca58-84e595829femr5477868b3a.43.1785134999821;
        Sun, 26 Jul 2026 23:49:59 -0700 (PDT)
Received: from [10.204.78.209] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5328180dsm2546973b3a.23.2026.07.26.23.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 23:49:59 -0700 (PDT)
Message-ID: <d3e8023c-cc52-4617-8095-cf4bfe109391@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 12:19:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: map ADSP remote heap into remoteproc IOMMU
 domain
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com
References: <20260618-audio_fix_clean_v3-v1-1-ec1ee66fe455@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260618-audio_fix_clean_v3-v1-1-ec1ee66fe455@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2NiBTYWx0ZWRfX4l52oK7hOJ57
 0M45WwmNtT95KT+nly+LA8p+F4fUf3cxk/MJmF9ySRDuLr1KbIosxkm13yKKcZhxVJAO1dQd6ig
 tKEGj+UN7TKfGoCrsWKOPwEJBoEYg29l6bnQMzS0e/dBKaKcxMWzB2xPW1FvVRhD6CZNH2U5xlZ
 rK/7V0IDlblNRdMk9wIthTBBLOq9d1VlrVllGopU7pZjhx37Hx/Dx+Wdro7zXGlIFIAvbphjuBd
 ppseq+WVZ/5ISaZ39fZRH9xeIa8EUbweONfYtoFp5e7QP/YG4v2fFy0bB7SsLGvl8lkc5BBU379
 5b2yOa6hfAzOU9J/b5yXKq4+hrQ1gOofPJg2VN4ezUlRvpE9/+koVgNoT+WJ+r7DCXJYX3/VvMo
 2HOAv9FcxDYVjLvYUbe0WGt57l9VmTW0dJq3yhed6YKAAgXrrL4ydnDE3helmwqfP5cwn+05Chb
 Lt+S0aBH067sLiAZuKw==
X-Proofpoint-GUID: uXOuoh1uwhm3i5kdUcTaE3ZqPCw2Plha
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a66ff99 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CHuFH22S8wkCNyP616gA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: uXOuoh1uwhm3i5kdUcTaE3ZqPCw2Plha
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2NiBTYWx0ZWRfX8KRguH0BoXsS
 dN7E0D0iVh5MwMNHIEphSTSGLR0mdvsQqXixf+nO5cRDFu/AX9BgwTA0rJG4KJL8+E/5W4CqF7s
 U51nb8Ei2PMIbdSCc8tF4BfEH9wl8pM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270066

On 18-06-2026 15:21, Anandu Krishnan E wrote:
> On KVM-based targets the kernel runs at EL2 without a separate
> hypervisor to manage inter-VM memory access control.  In this
> configuration the remoteproc is assigned its own IOMMU domain, and
> any memory carveout the DSP must access requires an explicit mapping
> into that domain before the DSP can reach it.
> 
> The existing code calls qcom_scm_assign_mem() to transfer ownership
> of the ADSP remote heap carveout from HLOS to the DSP VM.  This SCM
> call is only meaningful when a separate hypervisor (e.g. Gunyah) is
> present to enforce inter-VM memory access control.  On KVM-based
> targets no such hypervisor exists, so the carveout must instead be
> mapped into the remoteproc's IOMMU domain via an identity mapping
> (IOVA == PA) using iommu_map().  Without this mapping the DSP
> triggers an SMMU translation fault when accessing the remote heap
> during audio PD static process creation.
> 
> Detect whether the remoteproc has an IOMMU by checking for the
> "iommus" property on the remoteproc DT node and store the result in
> a new has_iommu flag in fastrpc_channel_ctx.  When the flag is set,
> map the carveout into the remoteproc's IOMMU domain instead of
> calling qcom_scm_assign_mem().  Introduce fastrpc_remote_heap_map()
> and fastrpc_remote_heap_unmap() helpers to encapsulate the IOMMU
> domain lookup and map/unmap operations.
> 
> This change relies on the remote heap handling introduced in:
> https://lore.kernel.org/r/20260609025938.457-1-jianping.li@oss.qualcomm.com
> 
> Link: https://lore.kernel.org/r/20260609025938.457-1-jianping.li@oss.qualcomm.com
> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> ---
> This patch depends on:
> 
>   [PATCH v8 0/4] misc: fastrpc: Add missing bug fixes
>   https://lore.kernel.org/r/20260609025938.457-1-jianping.li@oss.qualcomm.com
> 
> Please apply after that series.
> ---
>  drivers/misc/fastrpc.c | 141 +++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 114 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a5af901c1cb8..9ce7af2091f1 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -21,6 +21,7 @@
>  #include <linux/slab.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <uapi/misc/fastrpc.h>
> +#include <linux/iommu.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/bits.h>
>  
> @@ -285,6 +286,8 @@ struct fastrpc_channel_ctx {
>  	struct list_head invoke_interrupted_mmaps;
>  	bool secure;
>  	bool unsigned_support;
> +	/* set when remoteproc has an IOMMU; use iommu_map instead of hyp_assign */
> +	bool has_iommu;
maybe something like use_iommu_map will be more meaningful here?>  	u64
dma_mask;
>  	const struct fastrpc_soc_data *soc_data;
>  };
> @@ -2343,10 +2346,65 @@ static const struct fastrpc_soc_data default_soc_data = {
>  	.dma_addr_bits_default = 32,
>  };
>  
> +static int fastrpc_remote_heap_map(struct device *rdev,
> +				   struct device_node *rproc_node,
> +				   struct fastrpc_buf *heap)
> +{
> +	struct platform_device *rproc_pdev;
> +	struct iommu_domain *domain;
> +	int ret;
> +
> +	rproc_pdev = of_find_device_by_node(rproc_node);
> +	if (!rproc_pdev) {
> +		dev_err(rdev, "failed to find remoteproc platform device\n");
> +		return -ENODEV;
> +	}
> +
> +	domain = iommu_get_domain_for_dev(&rproc_pdev->dev);
> +	if (!domain) {
> +		put_device(&rproc_pdev->dev);
> +		dev_err(rdev, "no IOMMU domain for remoteproc\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = iommu_map(domain, heap->dma_addr, heap->dma_addr, heap->size,
> +			IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
> +	if (ret)
> +		dev_err(rdev, "failed to map remote heap phys=0x%llx size=0x%llx err=%d\n",
> +			heap->dma_addr, heap->size, ret);
> +
> +	put_device(&rproc_pdev->dev);
> +	return ret;
> +}
> +
> +static void fastrpc_remote_heap_unmap(struct rpmsg_device *rpdev,
> +				      struct fastrpc_buf *heap)
> +{
> +	struct device_node *rproc_node;
> +	struct platform_device *rproc_pdev;
> +	struct iommu_domain *domain;
> +
> +	rproc_node = of_get_parent(of_get_parent(rpdev->dev.of_node));
> +	if (!rproc_node)
> +		return;
> +
> +	rproc_pdev = of_find_device_by_node(rproc_node);
> +	of_node_put(rproc_node);
> +	if (!rproc_pdev)
> +		return;
> +
> +	domain = iommu_get_domain_for_dev(&rproc_pdev->dev);
> +	if (domain)
> +		iommu_unmap(domain, heap->dma_addr, heap->size);
> +
> +	put_device(&rproc_pdev->dev);
> +}
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
>  	struct fastrpc_channel_ctx *data;
> +	struct device_node *rproc_node;
>  	int i, err, domain_id = -1, vmcount;
>  	const char *domain;
>  	bool secure_dsp;
> @@ -2390,9 +2448,12 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> +	rproc_node = of_get_parent(of_get_parent(rdev->of_node));
> +	if (rproc_node)
> +		data->has_iommu = of_property_present(rproc_node, "iommus");
> +
>  	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>  		struct resource res;
> -		u64 src_perms;
>  
>  		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
>  		if (!err) {
> @@ -2401,21 +2462,41 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
>  				if (!data->remote_heap) {
>  					err = -ENOMEM;
> -					goto err_free_data;
> +					goto err_put_node;
>  				}
>  
>  				data->remote_heap->dma_addr = res.start;
>  				data->remote_heap->size = resource_size(&res);
> +
> +				if (data->has_iommu) {
> +					err = fastrpc_remote_heap_map(rdev,
> +								      rproc_node,
> +								      data->remote_heap);
> +					if (err) {
> +						kfree(data->remote_heap);
> +						data->remote_heap = NULL;
> +						goto err_put_node;
> +					}
> +				}
>  			}
> -			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> -				    data->vmperms, data->vmcount);
> -			if (err)
> -				goto err_free_data;
> +			if (!data->has_iommu) {
> +				u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
> +
> +				err = qcom_scm_assign_mem(res.start,
> +							  resource_size(&res),
> +							  &src_perms,
> +							  data->vmperms,
> +							  data->vmcount);
> +				if (err)
> +					goto err_put_node;
> +			}
>  		}
>  	}
>  
> +	of_node_put(rproc_node);
> +	rproc_node = NULL;
> +
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>  	data->secure = secure_dsp;
>  	data->soc_data = soc_data;
> @@ -2471,6 +2552,9 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	if (data->secure_fdevice)
>  		misc_deregister(&data->secure_fdevice->miscdev);
>  
> +err_put_node:
> +	of_node_put(rproc_node);
> +
>  err_free_data:
>  	kfree(data->remote_heap);
>  	kfree(data);
> @@ -2513,28 +2597,31 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>  		list_del(&buf->node);
>  
> -	if (cctx->remote_heap && cctx->vmcount) {
> -		u64 src_perms = 0;
> -		struct qcom_scm_vmperm dst_perms;
> -
> -		for (u32 i = 0; i < cctx->vmcount; i++)
> -			src_perms |= BIT(cctx->vmperms[i].vmid);
> -
> -		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> -		dst_perms.perm = QCOM_SCM_PERM_RWX;
> -
> -		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
> -					  cctx->remote_heap->size, &src_perms,
> -					  &dst_perms, 1);
> -		if (err)
> -			dev_err(&rpdev->dev,
> -				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
> -				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
> +	if (cctx->remote_heap) {
> +		if (cctx->has_iommu) {
> +			fastrpc_remote_heap_unmap(rpdev, cctx->remote_heap);
> +			kfree(cctx->remote_heap);
> +			cctx->remote_heap = NULL;
> +		} else if (cctx->vmcount) {
> +			u64 src_perms = 0;
> +			struct qcom_scm_vmperm dst_perms;
> +
> +			for (u32 i = 0; i < cctx->vmcount; i++)
> +				src_perms |= BIT(cctx->vmperms[i].vmid);
> +
> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
> +
> +			err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
> +						  cctx->remote_heap->size,
> +						  &src_perms, &dst_perms, 1);
> +			if (!err) {
> +				kfree(cctx->remote_heap);
> +				cctx->remote_heap = NULL;
why is this needed under error check? Won't it lead to memory leak?> +			}
> +		}
>  	}
>  
> -	kfree(cctx->remote_heap);
> -	cctx->remote_heap = NULL;
> -
>  	of_platform_depopulate(&rpdev->dev);
>  
>  	fastrpc_channel_ctx_put(cctx);
> 
> ---
> base-commit: f1256704b88067430e255e5c85d6b727e1bbb2ea
> change-id: 20260618-audio_fix_clean_v3-9df607546095
> 
> Best regards,
> --  
> Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> 

