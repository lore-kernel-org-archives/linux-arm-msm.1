Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46373DAAB7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136261; cv=none; b=clNgaM1vN/OtuBWGQ/pTnRARfe9nDVNe1RDhb03Ixgi4YfSysSAHkSbF3C9FOhI4cIAp+Dv+tnnM7U+IlR1c46g4wCmXoNDPOZWLMTIkmw63mPvkfqvkPYLoKXrLhH8L2J7KYEp/utzjTsD1dLcY9emvIV89spaKd5HAY7n91j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136261; c=relaxed/simple;
	bh=zFBKrhK2pwXaG3WNgdlDnhSSB8c0jrON3i7enZymGB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqkDE9zL8F/G2UZV6+vQphUu5Ixctaz0aPW6ofTbihyPExYYL+sEViLKTkdAtJzsOy/7aNX482g1TbVVXfwfDRgVnDCvsooK2lc920aPqYj5wmHhCXO/zTNqBdBDMZI8WG7RgBuBUpQyXqXmuVjwNmz01bP1n43f3MGZXva1D34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ny/2z2x+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8qlmoZL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ny/2z2x+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8qlmoZL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fv7w2175959
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llsXN0N3BdtWqiMXZg7L9PFfjnaDu3GJ9CPFx7LxGYQ=; b=Ny/2z2x+MJTejbam
	kCCQNttTzWmqvpsp3OW17+bN3aN9crFbrwBBdhmiOq+u8/ugo+PxMhUC2ZFz5/hy
	56f5Dj4frBgSYq1LTZPeBo5nUfqf/zkyS984nxPBsGlphtbDCXkqw5NAJCTPGx3w
	mCkINWOTlFnRjE1n3xvExPQbpjznUF0czx0i+lO6hfnzS5VDNEeVxle+aNdXXhEW
	adkidbY/mpb25HQXzpxReSaVlIg4Du4B9jqldXvtjuuupTDZa7L4euWsJP0jR1Lh
	28LZ+TsXxAE9CY1aLbmKwCvXBjgT5fjAg3gmFoSdA7vrAaJypM/AVx7nkHFwRMhI
	yICr8g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnwevt9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:10:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfbf3e4a63so69790335ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 00:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785136258; x=1785741058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llsXN0N3BdtWqiMXZg7L9PFfjnaDu3GJ9CPFx7LxGYQ=;
        b=Y8qlmoZLFjKnzKDAbAqK60BNjYafsgCNQUiOsFQFdNNIvfjCJ7fPHX2+yu3eL46THG
         YZJUBnheXLkuZkSg0RZnpTXGXJy5L42nRuZYgdgrR7F+emgM4aiC1eyTNUihEYtx381s
         K/D/HkjM3P2TZRsHg1dFghjfp0u/T2Sg5qCDuJJ0ruFDkCdd/GP2+DuXZWdEYatPHUXa
         FS6a+4FQ4XwOz9iJfpX2KHImxGAFrsa0120riElkODL7Zo53n3WQzBB/Q25YwVAIVYfu
         9iriCwkHTkd07Y0N+RSKWEHQlj+/258wAcP/g2GlxpjnCFPLHPvsO6U04eJUIrmb7uJD
         Npuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785136258; x=1785741058;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=llsXN0N3BdtWqiMXZg7L9PFfjnaDu3GJ9CPFx7LxGYQ=;
        b=NfSvFxaC0psz8xzIbvB4VZPwkR8oRHXZDnjmFzOG/J2J1Ff1K6rRJ/B6XYOXnPvaTF
         ptwNS6nob4CIf6rjUzcqGU1t/tZbA30W6jDn18tiByTBcLHn50iPKbaaAB9qRN1mbYFS
         dkrnE3JkpbrbgwDA4hAinpN/a3pJu3IGr2g/kLje8l5GHV0Q9IR+bYljECN937diptdA
         RAifbPBT9RjKwYzgHQM5kWHAQhMJPDohxmJP2/BtbrROAvtOuttdt29pzDHXE9+eppPu
         pLvS5AbdNPLeVRnr09C/bwW4FY3CFhrFWJ9EFJyKqpjXjhN4/ZFbCHMGyzcCCXY4xqKG
         WaEA==
X-Gm-Message-State: AOJu0Yxo6wi1bstBp/Gp7ObIpvbRMgEKohyvlSvRI2sIKc8+pzxrThfH
	39cfW3zQBjrlPGoWCvw4FkaC7lbHgoUIMRFoVRBZyueSGseXTaT5hixcxgJxmdjiwbeJC4AbKJD
	8a8v+BVkUVr+vqnRr/DjXnuwY6J7wwyBckLvIJrcwd1fXVKvd9vL/xTkABGpxaRp6Lp9z
X-Gm-Gg: AR+sD10509AdC2ABfXUtMp1mXtXj4VfMi5HZ3riWFR5NtlPkUqIiDwzsfIWBwJ4m9yt
	LWygsLBCSlEWeQGjsMS4grRD/Q8o6Kmug7MrRJZT6w6vtNcyDYZmwCsA2O18wwUTGukDAwlujY8
	aUEQGdgfCzQexXdCpsaBwnL+B7lbdEV0xeANcI0j/2Ec6qu1ac1HXjl8sXx8EIdz6r810VggKBl
	AgKjdaxHGZdJNnGcuItDFD0SOAhtybv31i+VR0ZBYxo4T1sjp309s2YQ+0OB+khkuAlAa4Er0Ne
	/ERT1pyCP7p9pMqp95rHZdeDmPTjQmLqS/AZysk3rlzX8r3ujICcyBT71A9a9b4hDrbi+EqqeQ2
	ZLM9L7RsqBt4nFn9x0qjCBkDm
X-Received: by 2002:a17:903:2412:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2cfde851de6mr69686145ad.23.1785136258150;
        Mon, 27 Jul 2026 00:10:58 -0700 (PDT)
X-Received: by 2002:a17:903:2412:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2cfde851de6mr69685855ad.23.1785136257729;
        Mon, 27 Jul 2026 00:10:57 -0700 (PDT)
Received: from [10.206.98.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b8d6sm29863575ad.3.2026.07.27.00.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 00:10:57 -0700 (PDT)
Message-ID: <ebf3d2e2-b747-4075-80da-b60ce2ba4da8@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 12:40:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: map ADSP remote heap into remoteproc IOMMU
 domain
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com
References: <20260618-audio_fix_clean_v3-v1-1-ec1ee66fe455@oss.qualcomm.com>
 <d3e8023c-cc52-4617-8095-cf4bfe109391@oss.qualcomm.com>
Content-Language: en-US
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
In-Reply-To: <d3e8023c-cc52-4617-8095-cf4bfe109391@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfX+MOrHovnb82S
 5X2NgCBS/3pOJjwzcwas6tvAnmAn14I8tijKPAM0QlGTXjPuVRcTwatohNJFeiHO3WQz2nxcMoW
 8QCAUMVAMg0Dnvop3/8xdeFoh99cJ6IGV9kvGxtaqo0gTH1ihWlfEZr3QsAmu0O7UKcNlyyVViU
 Akah8ChhAnXKs8qZRcemQqgbTdJ3unoZMQmYNAGwJdK/tq9xXdsPjv5dhAeQ6PdCcWYuZ0bvw7R
 SYzQ/gF6pCqDzVc6syzNqZMUCzuZEPX68uE4jLKMRo7wW1tc03litFEOms9zaL8+kU5QhxK6LUt
 LoBWHZfb0Hy54c7UXYrL1OzqKxlR1kX7c9+UqvNAyKOkaUDgIGeNTMerRToBu6brukp37cPq0xG
 m52CJ14gG7W1y0En+7dbiDJTYb1aZ98d3gcIdOdG6Z28E2rJ+qpItPPD0idEPgKPdeowBlA1xW2
 HmGbBC1GQ9mkVgt2qtQ==
X-Proofpoint-GUID: ef455OwHUBZZGV1QtaT1KHTcg3hxEeCm
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a670482 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PhU69RS8PR5OjDqLnIAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ef455OwHUBZZGV1QtaT1KHTcg3hxEeCm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfX6plHljxA9+So
 7Mbc38fqB97/aCEuc4OBDlxbebykr9Vwmwz9xL34RM2LDGq3kjPBBrJUlCv+dUTs9vlVxTH6CQU
 +sAmIdL+FIMgRRpYA6sd4UuYNp1JESY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270069



On 27-07-2026 12:19 pm, Ekansh Gupta wrote:
> On 18-06-2026 15:21, Anandu Krishnan E wrote:
>> On KVM-based targets the kernel runs at EL2 without a separate
>> hypervisor to manage inter-VM memory access control.  In this
>> configuration the remoteproc is assigned its own IOMMU domain, and
>> any memory carveout the DSP must access requires an explicit mapping
>> into that domain before the DSP can reach it.
>>
>> The existing code calls qcom_scm_assign_mem() to transfer ownership
>> of the ADSP remote heap carveout from HLOS to the DSP VM.  This SCM
>> call is only meaningful when a separate hypervisor (e.g. Gunyah) is
>> present to enforce inter-VM memory access control.  On KVM-based
>> targets no such hypervisor exists, so the carveout must instead be
>> mapped into the remoteproc's IOMMU domain via an identity mapping
>> (IOVA == PA) using iommu_map().  Without this mapping the DSP
>> triggers an SMMU translation fault when accessing the remote heap
>> during audio PD static process creation.
>>
>> Detect whether the remoteproc has an IOMMU by checking for the
>> "iommus" property on the remoteproc DT node and store the result in
>> a new has_iommu flag in fastrpc_channel_ctx.  When the flag is set,
>> map the carveout into the remoteproc's IOMMU domain instead of
>> calling qcom_scm_assign_mem().  Introduce fastrpc_remote_heap_map()
>> and fastrpc_remote_heap_unmap() helpers to encapsulate the IOMMU
>> domain lookup and map/unmap operations.
>>
>> This change relies on the remote heap handling introduced in:
>> https://lore.kernel.org/r/20260609025938.457-1-jianping.li@oss.qualcomm.com
>>
>> Link: https://lore.kernel.org/r/20260609025938.457-1-jianping.li@oss.qualcomm.com
>> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
>> ---
>> This patch depends on:
>>
>>   [PATCH v8 0/4] misc: fastrpc: Add missing bug fixes
>>   https://lore.kernel.org/r/20260609025938.457-1-jianping.li@oss.qualcomm.com
>>
>> Please apply after that series.
>> ---
>>  drivers/misc/fastrpc.c | 141 +++++++++++++++++++++++++++++++++++++++----------
>>  1 file changed, 114 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index a5af901c1cb8..9ce7af2091f1 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -21,6 +21,7 @@
>>  #include <linux/slab.h>
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  #include <uapi/misc/fastrpc.h>
>> +#include <linux/iommu.h>
>>  #include <linux/of_reserved_mem.h>
>>  #include <linux/bits.h>
>>  
>> @@ -285,6 +286,8 @@ struct fastrpc_channel_ctx {
>>  	struct list_head invoke_interrupted_mmaps;
>>  	bool secure;
>>  	bool unsigned_support;
>> +	/* set when remoteproc has an IOMMU; use iommu_map instead of hyp_assign */
>> +	bool has_iommu;
> maybe something like use_iommu_map will be more meaningful here?>  	u64
> dma_mask;
sure will update 
>>  	const struct fastrpc_soc_data *soc_data;
>>  };
>> @@ -2343,10 +2346,65 @@ static const struct fastrpc_soc_data default_soc_data = {
>>  	.dma_addr_bits_default = 32,
>>  };
>>  
>> +static int fastrpc_remote_heap_map(struct device *rdev,
>> +				   struct device_node *rproc_node,
>> +				   struct fastrpc_buf *heap)
>> +{
>> +	struct platform_device *rproc_pdev;
>> +	struct iommu_domain *domain;
>> +	int ret;
>> +
>> +	rproc_pdev = of_find_device_by_node(rproc_node);
>> +	if (!rproc_pdev) {
>> +		dev_err(rdev, "failed to find remoteproc platform device\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	domain = iommu_get_domain_for_dev(&rproc_pdev->dev);
>> +	if (!domain) {
>> +		put_device(&rproc_pdev->dev);
>> +		dev_err(rdev, "no IOMMU domain for remoteproc\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = iommu_map(domain, heap->dma_addr, heap->dma_addr, heap->size,
>> +			IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
>> +	if (ret)
>> +		dev_err(rdev, "failed to map remote heap phys=0x%llx size=0x%llx err=%d\n",
>> +			heap->dma_addr, heap->size, ret);
>> +
>> +	put_device(&rproc_pdev->dev);
>> +	return ret;
>> +}
>> +
>> +static void fastrpc_remote_heap_unmap(struct rpmsg_device *rpdev,
>> +				      struct fastrpc_buf *heap)
>> +{
>> +	struct device_node *rproc_node;
>> +	struct platform_device *rproc_pdev;
>> +	struct iommu_domain *domain;
>> +
>> +	rproc_node = of_get_parent(of_get_parent(rpdev->dev.of_node));
>> +	if (!rproc_node)
>> +		return;
>> +
>> +	rproc_pdev = of_find_device_by_node(rproc_node);
>> +	of_node_put(rproc_node);
>> +	if (!rproc_pdev)
>> +		return;
>> +
>> +	domain = iommu_get_domain_for_dev(&rproc_pdev->dev);
>> +	if (domain)
>> +		iommu_unmap(domain, heap->dma_addr, heap->size);
>> +
>> +	put_device(&rproc_pdev->dev);
>> +}
>> +
>>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  {
>>  	struct device *rdev = &rpdev->dev;
>>  	struct fastrpc_channel_ctx *data;
>> +	struct device_node *rproc_node;
>>  	int i, err, domain_id = -1, vmcount;
>>  	const char *domain;
>>  	bool secure_dsp;
>> @@ -2390,9 +2448,12 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  		}
>>  	}
>>  
>> +	rproc_node = of_get_parent(of_get_parent(rdev->of_node));
>> +	if (rproc_node)
>> +		data->has_iommu = of_property_present(rproc_node, "iommus");
>> +
>>  	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>>  		struct resource res;
>> -		u64 src_perms;
>>  
>>  		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
>>  		if (!err) {
>> @@ -2401,21 +2462,41 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
>>  				if (!data->remote_heap) {
>>  					err = -ENOMEM;
>> -					goto err_free_data;
>> +					goto err_put_node;
>>  				}
>>  
>>  				data->remote_heap->dma_addr = res.start;
>>  				data->remote_heap->size = resource_size(&res);
>> +
>> +				if (data->has_iommu) {
>> +					err = fastrpc_remote_heap_map(rdev,
>> +								      rproc_node,
>> +								      data->remote_heap);
>> +					if (err) {
>> +						kfree(data->remote_heap);
>> +						data->remote_heap = NULL;
>> +						goto err_put_node;
>> +					}
>> +				}
>>  			}
>> -			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>>  
>> -			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>> -				    data->vmperms, data->vmcount);
>> -			if (err)
>> -				goto err_free_data;
>> +			if (!data->has_iommu) {
>> +				u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>> +
>> +				err = qcom_scm_assign_mem(res.start,
>> +							  resource_size(&res),
>> +							  &src_perms,
>> +							  data->vmperms,
>> +							  data->vmcount);
>> +				if (err)
>> +					goto err_put_node;
>> +			}
>>  		}
>>  	}
>>  
>> +	of_node_put(rproc_node);
>> +	rproc_node = NULL;
>> +
>>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>>  	data->secure = secure_dsp;
>>  	data->soc_data = soc_data;
>> @@ -2471,6 +2552,9 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	if (data->secure_fdevice)
>>  		misc_deregister(&data->secure_fdevice->miscdev);
>>  
>> +err_put_node:
>> +	of_node_put(rproc_node);
>> +
>>  err_free_data:
>>  	kfree(data->remote_heap);
>>  	kfree(data);
>> @@ -2513,28 +2597,31 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>  	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>>  		list_del(&buf->node);
>>  
>> -	if (cctx->remote_heap && cctx->vmcount) {
>> -		u64 src_perms = 0;
>> -		struct qcom_scm_vmperm dst_perms;
>> -
>> -		for (u32 i = 0; i < cctx->vmcount; i++)
>> -			src_perms |= BIT(cctx->vmperms[i].vmid);
>> -
>> -		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> -		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> -
>> -		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
>> -					  cctx->remote_heap->size, &src_perms,
>> -					  &dst_perms, 1);
>> -		if (err)
>> -			dev_err(&rpdev->dev,
>> -				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
>> -				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
>> +	if (cctx->remote_heap) {
>> +		if (cctx->has_iommu) {
>> +			fastrpc_remote_heap_unmap(rpdev, cctx->remote_heap);
>> +			kfree(cctx->remote_heap);
>> +			cctx->remote_heap = NULL;
>> +		} else if (cctx->vmcount) {
>> +			u64 src_perms = 0;
>> +			struct qcom_scm_vmperm dst_perms;
>> +
>> +			for (u32 i = 0; i < cctx->vmcount; i++)
>> +				src_perms |= BIT(cctx->vmperms[i].vmid);
>> +
>> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
>> +
>> +			err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
>> +						  cctx->remote_heap->size,
>> +						  &src_perms, &dst_perms, 1);
>> +			if (!err) {
>> +				kfree(cctx->remote_heap);
>> +				cctx->remote_heap = NULL;
> why is this needed under error check? Won't it lead to memory leak? > +			}
> yes , will udpate and share new version
>> +		}
>>  	}
>>  
>> -	kfree(cctx->remote_heap);
>> -	cctx->remote_heap = NULL;
>> -
>>  	of_platform_depopulate(&rpdev->dev);
>>  
>>  	fastrpc_channel_ctx_put(cctx);
>>
>> ---
>> base-commit: f1256704b88067430e255e5c85d6b727e1bbb2ea
>> change-id: 20260618-audio_fix_clean_v3-9df607546095
>>
>> Best regards,
>> --  
>> Anandu Krishnan E <anandu.e@oss.qualcomm.com>
>>

