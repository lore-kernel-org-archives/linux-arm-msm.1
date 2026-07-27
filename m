Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6263655D8
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 06:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133181; cv=none; b=okBqVuGpFX3vQ5JQSl3aFKUIrK+B/yO3s+muRHUiyfdkORSg4BkZ9N3WNJ5kvAUot+57dN+Zl4yZgDjKyXo/zZXt6ieTXuBECkLHxEVFAQhtwEyRf1G/bSTHjxPpshWk+fW35/TU74UDoKbgGndPndgFbX1EbcXAyHy4xOzrEYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133181; c=relaxed/simple;
	bh=sFOfAcqsUltuCzYJ2B96Bv7JL+bG+6JAXPkrrRM8cvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNkIn8nJA9KJ28b4fs2ff7DeOhraFdbgION8lSNDhQ5h+PG3SnsZK2c3K67iZUOOCfqwqKQcyvHLWR6c/l7f0DoaXdLP/T30OAODbr4A0g4lUB64apasNvTyFYH0iVKwL8WnbNADSqEqZEOSjKdtYRhLDpFa2Fw3S9gEC6nL+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrEKHBlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrTmo2AA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrEKHBlc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrTmo2AA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1frd52417148
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 06:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ehdzVGWUZzE+UoMe7M6UqvX2cjN1lz3E+HTXhdWdQYE=; b=hrEKHBlcEA0992qm
	VJdKo3i/134xh7j6L5Evc7kZI+CZA3VQFQl8sE68ER1a8fYOm447hcmyzwW3MMFI
	q5DEq6XmFAMRuJJCYpv+i18nHpn6WSVYMSZYoe413ZG6d61qnkU5fQ6uiH3yR2CN
	uk0S3N0gcr2T6Yu7UDwYsrZZayAAS9/nO6HsARVdev9V5Omni3kbYjG6f/Snqurp
	uqHzUlT3SrG95DsrFKozGHcsgnXQ4FqnyZEML6Pphj5HDfTivRSO5xTJMNEEd0iY
	RDjB8q5X3HZVAE+0PSKoXMQ+6f+Fs7sq9ZXMkE2JhcTwygpY7TKhbYVS0s78bo9O
	oqFcfQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqycsry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 06:19:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee894b3d8so22712205ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 23:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785133177; x=1785737977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehdzVGWUZzE+UoMe7M6UqvX2cjN1lz3E+HTXhdWdQYE=;
        b=hrTmo2AA7R26b0BRj8iMw2LES7bILTf/YVMecZdf3xBYltIPb+zywD20Y1niMFYQF9
         00Of0K4iMEVq4BpwAnckK2wz36IdBd1ljV8cuo1rteArvz0gwhiGYR7A3acm3NuWwe80
         OFkM/GFbiC3BMjamCHgKy4zBmSf5xDLxzMRbblqDUIkBLjqLpOvgrgwsQpk/f/1uSosx
         ExGMD7dZXnriU9qXBbCbyuLxvrAPcpX1YYGOOvpqhdZJmuDeLzFJuG4DGGQ9DPSRB3U+
         zjfo2GSzk1Hhv6n+OVfar9FY061NmwFbyXprvb/txMv0/JzVISRUdUKQUPxw+poxa6vo
         LuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785133177; x=1785737977;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehdzVGWUZzE+UoMe7M6UqvX2cjN1lz3E+HTXhdWdQYE=;
        b=kCd8lGQMJ9rV0opuJgLvgrM3KWcHPJSw6LF/JBUJE1OorI3xZfmTZKoLFq9oqaEHGP
         Pp803tZOPIBl9VfF9aF1oc/FGixXuADimF1odDz9s4dJchCh2CrLR5p9nrNMsElXO5Xx
         8p9wuaoCzBgqVTOXkhlT7GiL7CDUWYLGMQYyhncn12ohljNr7RwsWNvuyg8pgOX42z0a
         4VvnytOdkekC3/j7/yp2NtE21pho4VQ0EUPS8ACuyHCnCF8aN4Hpmj2bgl9xHEOdjSHw
         iiMLatWP08iFwNEfCoqoDbP8/pEU0YNEO7Ldn9DjJuzG+uGW60CFUOzLGL/uEYTa6ibf
         /TWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNuFSKUyHhOA+/nlmullOWwiApDxrS8dHJ0wdpmiVyB07NiwzULqS0bGGH4wke0AT3W80IaSHpOTUmoIY6@vger.kernel.org
X-Gm-Message-State: AOJu0YxKuNjbyt65qPp0v3hhP4HfeCh50o3+/e092RbwBIl511iWmdgB
	Nwgn4UiGUYkOA+cP0aSTcSq22JPEZBkWxcS+9k1hV4q12dALOQ3jFSRJvCF7aAc8kRUw1O13Eyx
	hqmA+YoFrQ0PSR8rvHdk8gc8WIbF78fGdorFPx40LR4FabeKo7+r78ZGrUohAy3dRKvoZ
X-Gm-Gg: AR+sD119rxHJrxfn4TWp6yFCyqSHqoJuwdkhmeJ8bN+m7p03PX7FrLNHINBDKv5SLgm
	uTOGFZ3exZgPdDVrANQInaVJ5H7+3nxcwFW9GadZ7SQXIgJ5B4zQhG0ZGrP+Z+j3t4TbZqgsG2h
	/4HA24MXMRo/xQPsUVoB1HcKB4lvmvtfPcFDanIl+cKCYWYXrMOCg/8jkeZCcje0zw796PYN3Fe
	vGZkwNML07NwhAW4YzVi//rVhG+Ym32I/uNiqpAuFRY5Pg1J7w4WEBCr+zFgS8w1jjaPeZbsyyC
	6dpaHhfScHBqlwfD0EyTx3RId2BXZRMRgakh6ihqsw2JFayF8eIRwouor4B3VkO2kuMyPY87+JV
	BxHAqpSu96e/ts9JoMqAxZ4lhsH9H0A==
X-Received: by 2002:a17:903:2284:b0:2c9:ff83:41fa with SMTP id d9443c01a7336-2cfde85fb71mr70196115ad.24.1785133176451;
        Sun, 26 Jul 2026 23:19:36 -0700 (PDT)
X-Received: by 2002:a17:903:2284:b0:2c9:ff83:41fa with SMTP id d9443c01a7336-2cfde85fb71mr70196005ad.24.1785133176002;
        Sun, 26 Jul 2026 23:19:36 -0700 (PDT)
Received: from [10.204.78.209] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7d9464sm29059665ad.58.2026.07.26.23.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 23:19:35 -0700 (PDT)
Message-ID: <1bfd9503-ebcb-4613-943a-f6b31676f8e5@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 11:49:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
References: <20260716095847.479-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260716095847.479-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4fr2EhYAA3Zb6Y9IKlMRjILynRp2VtmJ
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a66f879 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DYcdDKNzWsWSpgcxVykA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 4fr2EhYAA3Zb6Y9IKlMRjILynRp2VtmJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2MCBTYWx0ZWRfXztY6XYtdt98D
 /qRgfLE6EKtjqiBmHm0KV7oJ25bEZR1knThtDdoqv9YYq1vDhZYOlHRCRoNZov7babEzUq39h2t
 qWmogL0uvs159P9V0Aj8u4IitcjwadqgdRkEq61iWItxvH9NUwyzGUVpo1WI/aHfGgls45MXTKE
 sUGnGQtiQ2skrLUMHDLjNR1kKOI0BupbyfbShB9c2WvWsrca97XhQigOZZJFOI9IJIm/h50vvzp
 kjt9NcDhrg7dWDgUDcaJXKTX4awKt5KBrYHEOXpWHbo4VhkLYTWH9p3JOuiVgZKhkw1JC+Mivjs
 n0TtnKxR9wTT3xBTyCjysrFvqw6oMWIgdsreVG1BnTqrNUCGvBmitKbisU44iRSZKB/xHRExOIF
 Mp0XWZa+BJ9VvZXU+nkh9FjB2FK6cqDVQIK5EI9FVdJIWQoU7F9mF+L4g0WIy/yDA6nC8Si1nGA
 LgIGbZJYyj72PhBmmNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2MCBTYWx0ZWRfXyblAMeu3PCnx
 GSj0KFZ5hxlxwroooPSOSLqj+Y22qkiJcPInnAE+t3F/NJK6IDmVouxQ6X5UM7SJplx0SdAO8V7
 NjtOyJGCeLhkq/mvqq/xrmPlOHzt5vY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270060

On 16-07-2026 15:28, Jianping Li wrote:
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
> Add explicit validation for remote_heap presence and size before sending
> the memory to DSP, and fail early if the reserved-memory region is
> missing or incomplete.
Can you also drop ADSP_MMAP_REMOTE_HEAP_ADDR support from
fastrpc_req_mmap as we don't intend user process to grow/shrink audio
PD's remote heap.>
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> 
> Patch [v9]: https://lore.kernel.org/all/20260707061733.495-1-jianping.li@oss.qualcomm.com/
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
>  drivers/misc/fastrpc.c | 121 +++++++++++++++++++++++------------------
>  1 file changed, 69 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..03f633028c00 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
>  	struct kref refcount;
>  	/* Flag if dsp attributes are cached */
>  	bool valid_attributes;
> +	/* Flag if audio PD init mem was allocated */
> +	bool audio_init_mem;
>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>  	struct fastrpc_device *secure_fdevice;
>  	struct fastrpc_device *fdevice;
> @@ -1344,15 +1346,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
>  
>  	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>  	if (!args)
> @@ -1376,31 +1380,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
> @@ -1412,8 +1391,25 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
> +		pages[0].addr = cctx->remote_heap->dma_addr;
> +		pages[0].size = cctx->remote_heap->size;
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
> @@ -1431,27 +1427,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
> @@ -2418,12 +2398,29 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> -	if (domain_id == SDSP_DOMAIN_ID) {
> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>  		struct resource res;
>  		u64 src_perms;
>  
>  		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
> +
> +		if (err && domain_id == ADSP_DOMAIN_ID) {
> +			dev_err(rdev, "missing mandatory remote heap memory-region\n");
> +			goto err_free_data;
> +		}
> +
>  		if (!err) {
> +			if (domain_id == ADSP_DOMAIN_ID) {
> +				data->remote_heap =
> +					kzalloc_obj(*data->remote_heap);
> +				if (!data->remote_heap) {
> +					err = -ENOMEM;
> +					goto err_free_data;
> +				}
> +
> +				data->remote_heap->dma_addr = res.start;
> +				data->remote_heap->size = resource_size(&res);
other struct fastrpc_buf members are not initialized here. Either
initialize all or better just add remote_heap_addr and remote_heap_size
to fastrpc_channel_ctx structure.> +			}
>  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
>  			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> @@ -2431,7 +2428,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  			if (err)
>  				goto err_free_data;
>  		}
> -
>  	}
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
> @@ -2490,6 +2486,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		misc_deregister(&data->secure_fdevice->miscdev);
>  
>  err_free_data:
> +	kfree(data->remote_heap);
>  	kfree(data);
>  	return err;
>  }
> @@ -2512,6 +2509,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	struct fastrpc_buf *buf, *b;
>  	struct fastrpc_user *user;
>  	unsigned long flags;
> +	int err, i;
>  
>  	/* No invocations past this point */
>  	spin_lock_irqsave(&cctx->lock, flags);
> @@ -2529,8 +2527,27 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>  		list_del(&buf->node);
>  
> -	if (cctx->remote_heap)
> -		fastrpc_buf_free(cctx->remote_heap);
> +	if (cctx->remote_heap && cctx->vmcount) {
> +		u64 src_perms = 0;
> +		struct qcom_scm_vmperm dst_perms;
> +
> +		for (i = 0; i < cctx->vmcount; i++)
> +			src_perms |= BIT(cctx->vmperms[i].vmid);
> +
> +		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +		dst_perms.perm = QCOM_SCM_PERM_RWX;
> +
> +		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
> +					  cctx->remote_heap->size, &src_perms,
> +					  &dst_perms, 1);
> +		if (err)
> +			dev_err(&rpdev->dev,
> +				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
> +				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
> +	}
> +
> +	kfree(cctx->remote_heap);
> +	cctx->remote_heap = NULL;
>  
>  	of_platform_depopulate(&rpdev->dev);
>  

