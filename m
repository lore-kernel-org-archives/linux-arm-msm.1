Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B99942A15E;
	Tue,  7 Jul 2026 07:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409021; cv=none; b=in3LiP2oBPvT6BdVwY/MHaHnNuk+osM0bMJMJ8oAPgoMuaQiMXtwFJQ56Dvp801LAFNqEiyHXp78Fb5XUQzrjcbSp6g0qVFfpFHAs6h4HS5B+9x6ADnE85vzYmPShokqR2ChbOGN6m/gfxv/LD9v1EHcTm5sixM5Cy9/gU/uvIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409021; c=relaxed/simple;
	bh=oyI/WNr9SV7QM/SDr5ee52ZGvpRMKK5eA0P6o/DaW1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErKdsEX18ulv4DzdXYoOZb0sUp0judOy51roIMObxNYFpd4UWGLJiKRiuZH1kzDQ8EV+wB/k0UNlPtkVpnAAEXaYX+yEbXvqmx9lsP6ELIu31D4EG/qWQO9FvI+05DOdcmc4JqNdHCycDH6hK9gmcKYtpcGytoyHWVOPh7p3DQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZO9SUlUV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZO9SUlUV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408971F00A3A;
	Tue,  7 Jul 2026 07:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783409007;
	bh=M7vIsXzvnm+ZS0aSjN5l0MsfSQvRk4hbYLWiRFeHBGs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZO9SUlUVsBjTStfEDnasivCovJQsJqvqG0yWim8d7uG6+PZ+vzIRQhVTJlGfTN9py
	 8kd5QxUSpZ6nvxHgFe04c3ZyCwysx2Ed3QDzsFDOroo4DKMOsAtwsZsFsV6keHZFfM
	 V0xmEz2YZemm1+OPW9o/F1/4nI1HfHas7DgWXZe6HlNS6yAwt4sN544N14jHVooM7k
	 WsFVGHKkfvmdJ3GQL/jnTplXJ5PGL4NWla7YIzbO/eUP5QrTJz3NEpUIJCWwDfy4qm
	 d0jnNHLoOrR6ppkYHV/qNSrtGvFrp5omMC/XYvxWCgjODozGdU7MMuD2PSXm86+IIU
	 weeZLIkbZcIRQ==
Message-ID: <6de7ec43-5757-43f0-b8d8-34a692a36d1b@kernel.org>
Date: Tue, 7 Jul 2026 08:23:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Jianping Li <jianping.li@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
References: <20260707061733.495-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260707061733.495-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/7/26 7:17 AM, Jianping Li wrote:
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
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 119 +++++++++++++++++++++++------------------
>  1 file changed, 66 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..1ec37e6c68a2 100644
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
> @@ -1344,15 +1346,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
> +
> +	if (!cctx->remote_heap || !cctx->remote_heap->dma_addr ||
> +	    !cctx->remote_heap->size) {
if remote heap is a mandatory for ADSP or SDSP then this should be
enforced at binding level and even at driver probe level.

> +		err = -ENOMEM;
> +		dev_err(fl->sctx->dev,
> +			"remote heap memory region is not added\n");
> +		return err;
> +	}
>  
>  	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>  	if (!args)
> @@ -1376,31 +1387,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
> @@ -1412,8 +1398,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
> +	} else {
> +		pages[0].addr = 0;
> +		pages[0].size = 0;
> +	}
> +	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	args[2].ptr = (u64)(uintptr_t) pages;
>  	args[2].length = sizeof(*pages);
> @@ -1431,27 +1433,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
> -	}
> -err_map:
> -	fastrpc_buf_free(fl->cctx->remote_heap);
> -	fl->cctx->remote_heap = NULL;
> -err_name:
> +	cctx->audio_init_mem = false;

You are ignoring my comments that I have provided in the last version.

>  	kfree(name);
>  err:
>  	kfree(args);
> @@ -2418,12 +2400,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> -	if (domain_id == SDSP_DOMAIN_ID) {
> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>  		struct resource res;
>  		u64 src_perms;
>  
>  		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
>  		if (!err) {
> +			if (domain_id == ADSP_DOMAIN_ID) {
> +				data->remote_heap =
> +					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
> +				if (!data->remote_heap) {
> +					err = -ENOMEM;
> +					goto err_free_data;
> +				}
> +
> +				data->remote_heap->dma_addr = res.start;
> +				data->remote_heap->size = resource_size(&res);
> +			}
>  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
>  			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> @@ -2431,7 +2424,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  			if (err)
>  				goto err_free_data;
>  		}
> -
>  	}
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
> @@ -2490,6 +2482,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		misc_deregister(&data->secure_fdevice->miscdev);
>  
>  err_free_data:
> +	kfree(data->remote_heap);
>  	kfree(data);
>  	return err;
>  }
> @@ -2512,6 +2505,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	struct fastrpc_buf *buf, *b;
>  	struct fastrpc_user *user;
>  	unsigned long flags;
> +	int err;
>  
>  	/* No invocations past this point */
>  	spin_lock_irqsave(&cctx->lock, flags);
> @@ -2529,8 +2523,27 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>  		list_del(&buf->node);
>  
> -	if (cctx->remote_heap)
> -		fastrpc_buf_free(cctx->remote_heap);
> +	if (cctx->remote_heap && cctx->vmcount) {
> +		u64 src_perms = 0;
> +		struct qcom_scm_vmperm dst_perms;
> +
> +		for (u32 i = 0; i < cctx->vmcount; i++)
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

