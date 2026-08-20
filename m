Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4929D281
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 05:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787202612; cv=none; b=AwJ3pXJsFeEoBV+Qr9nkSu0dN7hrxHPrX0q2NBHshfJIv1g5dcqZUjbMtGRW6wCdmJ0jzl+JClmow/1IyuMUArstxDMppgZPnHvjMQQfOa2N4k8scKJOWeLZdZms/KiayvfkGy4BPFCt6H/IpCDIk7wo/CHbucdQJFOAulL81PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787202612; c=relaxed/simple;
	bh=SbN1yOS7VSzTzibY2hkBjdf+vfrTnA8yxjQHsPsNbt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLwO9uAu0dvwa2gp/BMyPTGCF0NMmqgomAPuxmajR6YeN+cD+mZZtUJkMIHKXn8OxzUeBIVZAvH+eBZubDg8brK+AL3Kj/VKh63TEsdp/+LHa7ElVD2qn3+qFfTd5IBGRqZ0Ts9w5aIritfQH7jcHPYxRzjLO5eJMPgJLeL+xXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I36y2lmD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FDBvx0Qg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I36y2lmD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FDBvx0Qg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL8aG8232432
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 05:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Twp0uvpZUxUbJ4bTcMQP8irSNSBu5D5rLKGD0/bMYo=; b=I36y2lmDIuF5k0jC
	rPCRcQhCqUB0/qWyl0tfNTC7y2KGG2t0EN5eM2DEGIvaxbkgZQRwmViV1aFAZR17
	6R9Sjluh2tH+2wX8VviL15NwtX1QNdjcBaiHxMdOl895s5yYKgI0CpaDaRJo3rVx
	2g6UOgDNRdQY737qqLAHYjAwFLOB4QPaU/ASglb5RWYcm+3CsA7qj2KmthZHZRpB
	YT2JrCASgljZxptARXM795cxABrGg3vDlsid6pxW9DJvKRK1jb4mfXolHyY+DDMY
	7DZaAMxCDoUdLUKT45UeZqdEReYU8u6N/e6Ihg1oW6z2zNoTP/tps9OltInbug4q
	8QUiyQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esau76s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 05:10:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so3092917a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 22:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787202607; x=1787807407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Twp0uvpZUxUbJ4bTcMQP8irSNSBu5D5rLKGD0/bMYo=;
        b=FDBvx0QguMb4Pok8c+7bFEQnew0hkEdET4mZJ30/LN74PtdiJP5Q0a5++TITI3XAUr
         CY+t/l5NxVeWLKg7k0UZAbolEXhUINg9KOV9lGsfZpiUONcqDQwTD+jqafz8/5gxKma7
         K/M4T6SxVV12secC5inPcK1OzqqxNXxLpyhFKK7RS5cIoD2vSq3VTjGM8NCLqOB7THfb
         4xY6Sa5sKVRaOFQ5nUUtBbRSaVvnM3IE+NeqLdpibQeaHOfDQ6Ny3TGmFLamhOBYlKRl
         y/IJKX/B2GgC5QzEQdldPHiSFN1s5joeL6r4/g0Efk/btVmvTAPdUCuAKXkYB4z6XKPg
         AKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787202607; x=1787807407;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Twp0uvpZUxUbJ4bTcMQP8irSNSBu5D5rLKGD0/bMYo=;
        b=llEPHwqWr9SsLX5Bs4xwpc9886DCPhSKNwFzONOdFTSHIwnG9oNyFYN8g6fgLdoC28
         tSkGntkyeZq3MBn4J4CUJdMvlbAXz40OevNXFtnrLJtrBt4Jtu3jfSF6PEd1Jac3J0BX
         hxzPJRmgCdMExPin1svovtYtj74Iq1DruqulzltIM1vVkGqjRPH70Xa/kixflB32tv0i
         CiiyYxHgPHRONT9NX03yzHErRfiOQrETLqIeIh5A6o0ES58zsWkRr4g1FvPQx1fRJx0Y
         dgVKHeRyBoV425ez6EYybUzTR1dU9nTOifq3gavk3ywNCbOlTzqEZrI75oIy0YGJcdir
         GB7w==
X-Forwarded-Encrypted: i=1; AHgh+RpnezUd/9s9rWtIWo5yVhS9g7OmWAynX1OKxYiZeP1YUMFSfm2fd5U1iO9YPj4QjZHpb69gCwg6rKiHQdO0@vger.kernel.org
X-Gm-Message-State: AFuF++m/7eSnSDufWxRDqFSCaMRXI2/vwklgQ3mYySbrcMp3wXLWow63
	GZv9HwFnFsLGESr47aeCFa8D+MfyQTzfhExv0nQjzMCGwuKm3l9nV5m02kfuu3WncdvUHKJuVDS
	3n1Ps661YTt0Rs4WAZW+pw3Nw8zZAzgUn0F6vbpfU+QSPDW6/hzZMiQWjL1lRKBc5NNjz
X-Gm-Gg: AR+sD13d1KBNLaw7HMDwBjJF8ezXwDlxkVNl4llSC21LN+BmzJjaii93rMI1DNU4UWX
	2EodtZNLfK/Ykpbf2Rkn/imP3ggXiOmAWGTg46o/ObdJvlNeIspibbCpIh0bXUNU02U0wkGj6Eg
	gs3aGmf560FlaaEuIuo7xEqW0zlEavpfI5Iuln2bx8b/qrxG0hy+SyXJNGtcJ+IOwemVQGsnCaW
	/2G+pNHLjI9ior8D0W6I+H2L5FBL4Q3DnU6zgsX9uac3J7uY+pdC2M+iBilcilf1SUyWxD2Kq93
	XrlUrS/31LVDc95bmfAvbgVlnemV5xAx3L8PTL/IuxoYEbHq28GCl9tw6zE5qMv0q65xqYIoc6Z
	nSpzvGeRElfo5qMBrS2DzVOEM/bpNjw==
X-Received: by 2002:a17:90b:4e8f:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39580a50d67mr19982981a91.2.1787202606934;
        Wed, 19 Aug 2026 22:10:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8f:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39580a50d67mr19982866a91.2.1787202606283;
        Wed, 19 Aug 2026 22:10:06 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae1416dsm16084143c88.11.2026.08.19.22.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 22:10:05 -0700 (PDT)
Message-ID: <57185025-de92-43c4-a300-fa2682993d15@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:40:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
References: <20260814101955.234238-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260814101955.234238-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAzNSBTYWx0ZWRfX4a6s8Ptl1dOJ
 hxqzRS3wtWu+3F9BFE7/q2Cn4U4yUT7vb7fazTKZ1ForBU+cl8ALUKNgzbCfwl4ev/mk9VZwXc0
 2zyj6QlMCvFH5L/k2AzrmhNpHcRZzs0=
X-Authority-Analysis: v=2.4 cv=fKcJG5ae c=1 sm=1 tr=0 ts=6a868c30 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NDI3vt_X-jx7FteyWnUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: QlVNU93YBdZWV7ulEKS3cg_JNtpUediF
X-Proofpoint-GUID: QlVNU93YBdZWV7ulEKS3cg_JNtpUediF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAzNSBTYWx0ZWRfX7W9HMM7FLQfZ
 h0a3iYP/WpFjAU35Q/V5P+j88BWGkzc8STFGQG2OV+N3OJovFehzjY6T5XDLmBnNBwyGBqoVybL
 Na5ra7xTaS64log5VfFdvtq1t3urxD6yHvsKbTJkNNcpPDruCkO8bjQtoU2aqSuHFW6BxRt87Uk
 j3xvzYzYVlozTJZwNyyxJlUr/0FKFwAfD68uTUAzOU2T0leSshx1P5rYd2OGfXgSteuqcp7VbsU
 Jyb1MFWz0RZHt2Wj9F5Fn15Xb3/7qkWqbECVOOC9zHyE+sXs5ht6PoHHrS4m4LOI/TwhZ91wKcM
 miGycUTXXp7g7XlJLV96QUE1untYzf/3x7E3Ly+2SY41ycT+scIW75JCax6tioKBWxunLN6noNW
 rWn9i2JeSvxWgLoFVZ2+Qb5MU9AXCUEF3WS/1cNk6CB3VYlKh4Eukx2gZ3WImLD9sRZoRniCuFM
 SUMQSbrlF+JSvI1e22Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200035

On 14-08-2026 15:49, Jianping Li wrote:
> Allocating and freeing Audio PD memory from userspace is unsafe because
> the kernel cannot reliably determine when the DSP has finished using the
> memory. Userspace may free buffers while they are still in use by the DSP,
> and remote free requests cannot be safely trusted.
> 
> Additionally, the current implementation allows userspace to repeatedly
> grow the Audio PD heap, but does not support shrinking it. This can lead
> to unbounded memory usage over time, effectively causing a memory leak.
> 
> Fix this by allocating the entire Audio PD reserved-memory region during
> rpmsg probe and tying its lifetime to the rpmsg channel. This removes
> userspace-controlled alloc/free and ensures that memory is reclaimed only
> when the DSP process is torn down.
> 
> The reserved-memory region is now mandatory for the Audio PD domain.
> Rather than failing rpmsg probe when it is missing, validate it in
> fastrpc_init_create_static_process() and reject only the static-process
> creation. This keeps the fastrpc device probing for all other domains
> even on a misconfigured device tree.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
> Patch [v11]: https://lore.kernel.org/all/20260731093210.473-1-jianping.li@oss.qualcomm.com/
> 
> Changes in v12:
>  - Do not fail rpmsg probe when the reserved-memory region is missing,
>    validate the region in fastrpc_init_create_static_process() instead,
>    so probe keeps working for all domains.
>  - Add fastrpc_domain_has_reserved_heap() / fastrpc_domain_uses_static_heap()
>    helpers to replace the open-coded ADSP/SDSP domain checks.
> 
> Changes in v11:
>  - Replace the remote_heap fastrpc_buf pointer with dedicated
>    remote_heap_addr and remote_heap_size fields in
>    fastrpc_channel_ctx to avoid leaving a partially
>    initialized fastrpc_buf.
> 
>  - Drop ADSP_MMAP_REMOTE_HEAP_ADDR support from
>    fastrpc_req_mmap() since the user process should no longer
>    grow or shrink the Audio PD remote heap.
> 
> Changes in v10:
>  - Move Audio PD remote heap validation into
>    fastrpc_rpmsg_probe().
> 
>  - Treat Audio PD remote heap as a mandatory
>    resource and fail probe if the reserved
>    memory region is missing.
> 
> Changes in v9:
>  - Make sure fastrpc_init_create_static_process()
>    only sets audio_init_mem to false when the sent
>    address is actually invalid.
> ---
>  drivers/misc/fastrpc.c | 150 +++++++++++++++++++++--------------------
>  1 file changed, 76 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 90fd669636ec..3f14a4673698 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -70,8 +70,6 @@
>  #define ADSP_MMAP_HEAP_ADDR  4
>  /* MAP static DMA buffer on DSP User PD */
>  #define ADSP_MMAP_DMA_BUFFER  6
> -/* Add memory to static PD pool protection thru hypervisor */
> -#define ADSP_MMAP_REMOTE_HEAP_ADDR  8
>  /* Add memory to userPD pool, for user heap */
>  #define ADSP_MMAP_ADD_PAGES 0x1000
>  /* Add memory to userPD pool, for LLC heap */
> @@ -314,10 +312,14 @@ struct fastrpc_channel_ctx {
>  	struct kref refcount;
>  	/* Flag if dsp attributes are cached */
>  	bool valid_attributes;
> +	/* Flag if audio PD init mem was allocated */
> +	bool audio_init_mem;
> +	/* Audio PD reserved remote heap region */
> +	phys_addr_t remote_heap_addr;
> +	u64 remote_heap_size;
>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>  	struct fastrpc_device *secure_fdevice;
>  	struct fastrpc_device *fdevice;
> -	struct fastrpc_buf *remote_heap;
>  	struct list_head invoke_interrupted_mmaps;
>  	bool secure;
>  	bool unsigned_support;
> @@ -1454,15 +1456,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	struct fastrpc_init_create_static init;
>  	struct fastrpc_invoke_args *args;
>  	struct fastrpc_phy_page pages[1];
> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>  	char *name;
>  	int err;
> -	bool scm_done = false;
>  	struct {
>  		int client_id;
>  		u32 namelen;
>  		u32 pageslen;
>  	} inbuf;
>  	u32 sc;
> +	unsigned long flags;
> +	bool sent_heap = false;
> +
> +	if (!cctx->remote_heap_addr || !cctx->remote_heap_size) {
> +		err = -ENOMEM;
> +		dev_err(fl->sctx->dev,
> +			"remote heap memory region is not added\n");
> +		return err;
> +	}
>  
>  	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>  	if (!args)
> @@ -1486,31 +1497,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	inbuf.client_id = fl->client_id;
>  	inbuf.namelen = init.namelen;
>  	inbuf.pageslen = 0;
> -	if (!fl->cctx->remote_heap) {
> -		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
> -						&fl->cctx->remote_heap);
> -		if (err)
> -			goto err_name;
> -
> -		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
> -		if (fl->cctx->vmcount) {
> -			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
> -
> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
> -							(u64)fl->cctx->remote_heap->size,
> -							&src_perms,
> -							fl->cctx->vmperms, fl->cctx->vmcount);
> -			if (err) {
> -				dev_err(fl->sctx->dev,
> -					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
> -					&fl->cctx->remote_heap->dma_addr,
> -					fl->cctx->remote_heap->size, err);
> -				goto err_map;
> -			}
> -			scm_done = true;
> -			inbuf.pageslen = 1;
> -		}
> -	}
>  
>  	fl->pd = USER_PD;
>  
> @@ -1522,8 +1508,25 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[1].length = inbuf.namelen;
>  	args[1].fd = -1;
>  
> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
> -	pages[0].size = fl->cctx->remote_heap->size;
> +	/*
> +	 * Audio PD is a static PD and retains the remote heap
> +	 * information across daemon restarts. Therefore only
> +	 * the first attach should provide heap information to
> +	 * DSP. Subsequent attaches reuse the previously
> +	 * initialized memory pool.
> +	 */
> +	spin_lock_irqsave(&cctx->lock, flags);
> +	if (!cctx->audio_init_mem) {
> +		pages[0].addr = cctx->remote_heap_addr;
> +		pages[0].size = cctx->remote_heap_size;
> +		cctx->audio_init_mem = true;
> +		inbuf.pageslen = 1;
> +		sent_heap = true;
> +	} else {
> +		pages[0].addr = 0;
> +		pages[0].size = 0;
> +	}
> +	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	args[2].ptr = (u64)(uintptr_t) pages;
>  	args[2].length = sizeof(*pages);
> @@ -1541,27 +1544,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  
>  	return 0;
>  err_invoke:
> -	if (fl->cctx->vmcount && scm_done) {
> -		u64 src_perms = 0;
> -		struct qcom_scm_vmperm dst_perms;
> -		u32 i;
> -
> -		for (i = 0; i < fl->cctx->vmcount; i++)
> -			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
> -
> -		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> -		dst_perms.perm = QCOM_SCM_PERM_RWX;
> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
> -						(u64)fl->cctx->remote_heap->size,
> -						&src_perms, &dst_perms, 1);
> -		if (err)
> -			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
> -				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
> +	if (sent_heap) {
> +		spin_lock_irqsave(&cctx->lock, flags);
> +		cctx->audio_init_mem = false;
> +		spin_unlock_irqrestore(&cctx->lock, flags);
>  	}
> -err_map:
> -	fastrpc_buf_free(fl->cctx->remote_heap);
> -	fl->cctx->remote_heap = NULL;
> -err_name:
>  	kfree(name);
>  err:
>  	kfree(args);
> @@ -2090,7 +2077,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
>  
> -	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
> +	if (req.flags != ADSP_MMAP_ADD_PAGES) {
>  		dev_err(dev, "flag not supported 0x%x\n", req.flags);
>  
>  		return -EINVAL;
> @@ -2101,10 +2088,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  		return -EINVAL;
>  	}
>  
> -	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
> -		err = fastrpc_remote_heap_alloc(fl, dev, req.size, &buf);
> -	else
> -		err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
> +	err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
>  
>  	if (err) {
>  		dev_err(dev, "failed to allocate buffer\n");
> @@ -2143,20 +2127,6 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	/* let the client know the address to use */
>  	req.vaddrout = rsp_msg.vaddr;
>  
> -	/* Add memory to static PD pool, protection thru hypervisor */
> -	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
> -		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
> -
> -		err = qcom_scm_assign_mem(buf->dma_addr, (u64)buf->size,
> -			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
> -		if (err) {
> -			dev_err(fl->sctx->dev,
> -				"Failed to assign memory dma_addr %pad size 0x%llx err %d",
> -				&buf->dma_addr, buf->size, err);
> -			goto err_assign;
> -		}
> -	}
> -
>  	spin_lock(&fl->lock);
>  	list_add_tail(&buf->node, &fl->mmaps);
>  	spin_unlock(&fl->lock);
> @@ -2537,6 +2507,16 @@ static const struct of_device_id fastrpc_poll_supported_machines[] __maybe_unuse
>  	{},
>  };
>  
> +static bool fastrpc_domain_has_reserved_heap(u32 domain_id)
> +{
> +	return domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID;
> +}
> +
> +static bool fastrpc_domain_uses_static_heap(u32 domain_id)
> +{
> +	return domain_id == ADSP_DOMAIN_ID;
> +}
any reason to have functions for one time used checks?> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2584,20 +2564,25 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> -	if (domain_id == SDSP_DOMAIN_ID) {
> +	if (fastrpc_domain_has_reserved_heap(domain_id)) {
>  		struct resource res;
>  		u64 src_perms;
>  
>  		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
>  		if (!err) {
> +			if (fastrpc_domain_uses_static_heap(domain_id)) {
> +				data->remote_heap_addr = res.start;
> +				data->remote_heap_size = resource_size(&res);
> +			}
>  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
>  			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>  				    data->vmperms, data->vmcount);
better to check vmcount before calling this>  			if (err)
>  				goto err_free_data;
> +		} else {
> +			err = 0;
>  		}
> -
>  	}
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
> @@ -2681,6 +2666,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	struct fastrpc_buf *buf, *b;
>  	struct fastrpc_user *user;
>  	unsigned long flags;
> +	int err, i;
>  
>  	/* No invocations past this point */
>  	spin_lock_irqsave(&cctx->lock, flags);
> @@ -2698,8 +2684,24 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>  		list_del(&buf->node);
>  
> -	if (cctx->remote_heap)
> -		fastrpc_buf_free(cctx->remote_heap);
> +	if (cctx->remote_heap_size && cctx->vmcount) {
> +		u64 src_perms = 0;
> +		struct qcom_scm_vmperm dst_perms;
> +
> +		for (i = 0; i < cctx->vmcount; i++)
> +			src_perms |= BIT(cctx->vmperms[i].vmid);
> +
> +		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +		dst_perms.perm = QCOM_SCM_PERM_RWX;
> +
> +		err = qcom_scm_assign_mem(cctx->remote_heap_addr,
> +					  cctx->remote_heap_size, &src_perms,
> +					  &dst_perms, 1);
> +		if (err)
> +			dev_err(&rpdev->dev,
> +				"Failed to assign memory back to HLOS: addr %pa size %#llx err %d\n",
> +				&cctx->remote_heap_addr, cctx->remote_heap_size, err);
> +	}
>  
>  	of_platform_depopulate(&rpdev->dev);
>  

