Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5B73AB5CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787025325; cv=none; b=JUJmOa/X53MMaR+y7KM0n7iHoiLeFihPQrOvhv28rc9k4JtYIQVRBb9P+Y5p57/NCSktwRSEQ9nsJoicDq07i1B41f8LCM3FVRCWuOm93tm/gc7U5cqLU24bgiExsNhvm64QbTldQTIUfoHqE+i3I5eEvQUYCNBq9bWBNd2YzyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787025325; c=relaxed/simple;
	bh=0hPSLNeB/9GXR5TypPlTysVZR7GnTQn2efYW6pNZnAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWDtVSNiBgg2aC2OLfHpRWTNae5pWbZIR5FwJzlKJjUc2aV0FTMTsMO718F7+lmBcc3hiSPtDri77FUpdlQyVT8Jh9qZposs2oxPCZpI9aJR3qzg2IbXfiOziRitw3H06ziFwCatRtXHSJwnBiPzE1lE8Zm0L5WxGunKD98dihw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjZNdmdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=doTUG8Vk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjZNdmdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="doTUG8Vk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkVhG3370139
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIDHdR8mBDufcyoMeVvzq2X8Hct6JDvye32GDsuwzKU=; b=UjZNdmdEvZ3uV/Ns
	wRy3pn5KYobDO/1Je4OlC0Lgb9OwtZ+nsO95Hrosii7ZoDe8IKN9z7IQLTGtFNjl
	CJTE4clwlBtdM2FGNikYElxOBDEu9VPkDi2TJMgP30G97nnStzuBo6OZ98iPHq73
	av8rzyDqj3MYRhr8rSjeSwIwvqd50GGeLk7VgiysFm4V+1bFs0vfwCmNgH1jSTCn
	BLwBXjLHFh9giTlHpSqJ2jNR03YOIqg8kAvnDpcD29TClve1fDNyRly2qvX1IWjr
	Si8idMOYvQax3Qk1vMTbOjuL/otabTwzpJYGUHOWABc8a/Q3zIm3gnRXJG1XAx/e
	FUDFyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xykcbva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:55:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936a796a23aso362454885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787025319; x=1787630119; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIDHdR8mBDufcyoMeVvzq2X8Hct6JDvye32GDsuwzKU=;
        b=doTUG8Vkl6fZC/fvlkouRz4is5CQiqFvrDavX9a/DzcW8U88Hont7s1/E6MYaxDTB9
         7O76sm3tWT53xCIO1ui736KcRiG4ZToMnuWA0BhgiIbv0Gj9kS9/KZbUM11DYy52LqNU
         5HHarCZsw5Bn+zFoKtWpHRqeJPza390zlEuqe19pOLwwgD+IYJle+o0BUDgDScFGyLPn
         U6HEKmIk8MGYdLkU2uQmowsnvX8XheBXxqKHiHVtv9vBpKxc8fkBQpnyQlt/VTB2Im4Y
         s2UsZpHvHbtTSOW6bVHnC2Xs4Ax9aqUUiMzlKMVkuUJwt5cdaJYxSKIS+abcANJvdBQT
         PSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787025319; x=1787630119;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fIDHdR8mBDufcyoMeVvzq2X8Hct6JDvye32GDsuwzKU=;
        b=kiK+XAYto3coxxRdhqagP9pcrbShCaiuhL8kiTFk2ER/C8PDWCSxmq6MmfG1Useyl3
         XeHiA6u3jTJ2yTESX8QnG973fh0t0OKzudtOGA3mmIny8F6LAJCzpboePOtNq90hZexX
         Te2mI+twPRqMVg8RwPeW1b0Bst+OqwCdcABj3OJ0B9ubGV5gpBO86VaiYfiFrfrvySV6
         sT2HkC/Gjx+iQGCqnjKmMuUYdrc41G18la1opNF8FVBn3Hu6IttLNVapBEF6/mMarxRU
         g1Mn/HiLt6eU5i4MD5ixMvsvTeX2s6kFoBMgnlY4cgwpAEYkGfdps2MeyZvQbAbwn+iQ
         t0bA==
X-Forwarded-Encrypted: i=1; AHgh+RqiwQU0XPtA5ZrFyy5q+kmnPgOUn1pHgbXRH8i0Gg4SckIzvyfrXumJEuQdn7jY1byanyvxKdoUFEAqENJt@vger.kernel.org
X-Gm-Message-State: AOJu0YyKYE0utBac1DqmyKVSO20wGti8L88oP9S1CBuBKcd/pSTVHZgT
	jBTMl89i7yCq02e7Z9rNkBCO0cWXFRxsYl+HSJjMZEI9yf8WklNVy6IUCWDQ+G0yEjAJOZFcPZ3
	inuKwoGdexSgc1Y2sR3khBRWxeAY+K3rshbBW+XNLHhcVxE7WVQDpB6LN3SwfoOp3gtL0
X-Gm-Gg: AR+sD12ahlCL2cOfQAxVgpapBfQRF24MiwwmAXXfBLXNyRaHxRngJvh0ttUe6Q9OJGp
	66SAZLGfRaNdARfF2RYvwXsMXSdQrwt9L/4Oeq/2uneWcSy6R1+hKmxW++L0sjYfMQR9YAlJYTs
	TL47cUn9MBqsbzXSPJT1tUToSQJBcEYkkyJgh3EetBk6iKpRgkrEOpF6PcBBsmMpdo1ksWBJypT
	9GysPt+nlquzNez9bmES2IsqaIsXY6FOfQxiN4xnam2uC2SWAI6wSZM+YZV2apoYyli3rgcrfw+
	HX0at1vIdP5L6SqIvHU+tiDGUR8N7PMZNLNjVXJFPUKWh5ayV0/yOVpXEDg2by2tFFvltFewlgr
	xKPjnl5Fz/KP/AzBycufbWllm81rGFbPVKj5hO8tJzP035t5VXzQ3xwaYoSL/KPBVhhXPahzLXZ
	CaPlhrx6ZJ0eQP
X-Received: by 2002:a05:620a:668e:b0:936:befe:42a4 with SMTP id af79cd13be357-936d23a10c5mr2130460785a.42.1787025319435;
        Mon, 17 Aug 2026 20:55:19 -0700 (PDT)
X-Received: by 2002:a05:620a:668e:b0:936:befe:42a4 with SMTP id af79cd13be357-936d23a10c5mr2130458785a.42.1787025319011;
        Mon, 17 Aug 2026 20:55:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cf95803sm853242e87.1.2026.08.17.20.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:55:16 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:55:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 11/15] accel/qda: Add PRIME DMA-BUF import support
Message-ID: <l7gt2mr3rrnzmkc46ntqw5e5sirdimavv5do4wmdf6jktryp7g@772ovv3qlgcv>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-11-69a02e9090d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817-qda-v2-v2-11-69a02e9090d4@oss.qualcomm.com>
X-Proofpoint-GUID: 1b4Q8Cyiea5zOiLv4lMqnom1rciwZfb7
X-Proofpoint-ORIG-GUID: 1b4Q8Cyiea5zOiLv4lMqnom1rciwZfb7
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a83d7a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ocRE28ydX6du2WY3eHAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNiBTYWx0ZWRfX0RqDGqm52WwS
 5DHtjxAEaS/ogyAtzxa3M9fE7vvK8EQI2LD9s+TSV9sfO/lY1SeyyG/zsNeyHmPwixwmMHIQGl/
 7v/SQEYZurASaarR8WsvUqU4VHAW4Tx3okoZmBR1OqMTDu5P/lJxspmZJdssTiVIxTD8ZTmK3LB
 6L0txHts9Yd0oNJRNHWtglr0hPMOZFGTndxD7Mt/YPvHjd7UGFsV4rw0ofZ/waDeAHC27ajiF2l
 iQnt1yOKrH3DCHjnEZcdnBH0BckxgyVlzmbh+WS2wviOL3XKlGP/CPXMz96NClnc0R65/5SmxrS
 Tw1rR1tUxy9ieAVKiNFb5pksMQs5Riz/3m/+WPWhqrQZuuDKVSuqHAF2uub//xvjkYyQVmKrNmm
 K3xJz1Kq0tfhJbrKBRUCGjEAkS/lHlRO3CWsOrfs5zPe+F0/G64BPpO5W0G5C0Woih9S53UiFG5
 RTN1n+tIIDLIU++EZeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNiBTYWx0ZWRfX3j2oJ6s6TLL+
 RtNFc+kROeQs3EsdwCV6xbehG4kZ0hMBitploGShIhUDh73U2qt3iGc3noKdcgCm5RDykTUwDW7
 L21S38plLqX2I8OiByVTMpRCGA9X3xs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180026

On Mon, Aug 17, 2026 at 10:17:46AM +0530, Ekansh Gupta wrote:
> Allow user-space to import DMA-BUF file descriptors from other
> subsystems (GPU, camera, video) into the QDA driver via the standard
> DRM PRIME interface.
> 
> qda_prime.c
>   Implements qda_gem_prime_import(), which is set as the driver's
>   .gem_prime_import callback. On import it:
>   1. Short-circuits self-import: if the dma_buf was exported by this
>      device and is not itself an import, the existing GEM object is
>      returned with an incremented reference count.
>   2. Attaches to the dma_buf and maps it with DMA_BIDIRECTIONAL via
>      dma_buf_map_attachment_unlocked(), obtaining an sg_table whose
>      DMA addresses are IOMMU virtual addresses in the CB device's
>      address space.
>   3. Calls qda_memory_manager_alloc() to record the mapping and encode
>      the SID in the upper bits of the DMA address, matching the
>      convention used for natively allocated buffers.
> 
>   qda_prime_fd_to_handle() wraps drm_gem_prime_fd_to_handle() under
>   qdev->import_lock, storing the calling file_priv in

Why do you need a separate lock?

>   qdev->current_import_file_priv so that qda_gem_prime_import() can
>   retrieve it (the .gem_prime_import callback does not receive
>   file_priv directly, but the context bank to attach to is per-process).
> 
> qda_gem.c
>   qda_gem_free_object() is extended to handle the imported-buffer
>   teardown path: unmap the sg_table, detach from the dma_buf, and
>   release the dma_buf reference.
>   qda_gem_mmap_obj() rejects mmap requests on imported objects, which
>   must be mapped through the exporter instead.
> 
> qda_memory_manager.c
>   The DSP is given a single base address per buffer, so only buffers
>   that are mapped as one contiguous range can be described to it.

Is there no IOMMU in front of the DSP? Can we remap the buffer to a
linear are inside the DSP map?

>   qda_memory_manager_map_imported() therefore walks the imported
>   buffer's scatterlist and rejects any buffer whose entries are not
>   contiguous; contiguous imports (for example from the CMA DMA-buf
>   heap) are accepted. Whether an exporter or IOMMU coalesces a buffer
>   into a single range is not guaranteed, so this is verified rather
>   than assumed.
>   qda_memory_manager_free() skips the DMA free path for imported
>   buffers since the memory is owned by the exporter.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Do not assume the exporter or IOMMU maps an imported buffer as a
>   single contiguous range; walk the scatterlist and cleanly reject
>   non-contiguous imports instead (Christian König)
> - Document that only contiguous imports (e.g. CMA DMA-buf heap) are
>   supported
> - Return -EBUSY rather than -ENODEV when no context bank is available
> ---
>  drivers/accel/qda/Makefile             |   1 +
>  }
>  
> +static int qda_memory_manager_map_imported(struct qda_gem_obj *gem_obj,
> +					   struct qda_iommu_device *iommu_dev)
> +{
> +	dma_addr_t dma_addr, expected_addr = 0;
> +	struct scatterlist *sg, *s;
> +	int i;
> +
> +	sg = gem_obj->sgt->sgl;
> +
> +	/*
> +	 * Verify that the imported DMA-BUF is contiguous. While some platforms

Which "some platforms"?

> +	 * or IOMMUs might map buffers as a single range, we must not silently
> +	 * assume this is always the case. We loop through the scatterlist
> +	 * entries and reject any that are non-contiguous.
> +	 */

-- 
With best wishes
Dmitry
