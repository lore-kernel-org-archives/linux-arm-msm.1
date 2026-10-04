Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21187262E
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 20:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145757; cv=none; b=nlPtECqXSQlvKDYOB6QmEJadhvbHj5oV95cwHR3R9YEb9Wa1Nep/SVWvpMVtjaKAUf52B7++rfsnm0gDAtURkQV4XbhsoKzy+upVR0sWd1KQgPD3s3gwkRJUm9SPKbBXEH/WAROIyI9/LjUgzLfr57woIhKrrgnlCfyl6FYiEgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145757; c=relaxed/simple;
	bh=7iPBd3OJDXTlDvKx1bCe6/RoVV/o/ddPiMU3zsQLUDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grsQ6bJRYk/WtbG99Kt6YcV8ajpAugZE+Oe/JvqY187DxCfddZi+VlGQVI8D8cIhsCyg58OFnZfjc8SGJPVocgDCb4Zkr7uO5z67YGPnG1InOxUO7Nm48PRa2HqKmIk353o1q+fU1+z77hcmdUWQsDIlN2Dn9PITtIYoIOZKucA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZqGYHhj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZqGYHhj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49ff680331aso11353065e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791145754; x=1791750554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIFKjp1lGfDiZDolW1BimcdoYD6V0XYUoyt5Xe2j2X0=;
        b=aZqGYHhj/8JiaWIHldY3iqY5icpOeO5wtUX27tMZQW0j2IoR45HuUTeFHDO9cY+3L3
         zdy0FwV4KWvcXc/UtG1a6arYvn01mKdiP8DySeBePRLrsNJjdD6mJrI0JCDWT1me0TUW
         EJM1Zmfiafe5piGAfklvLSx+CAWkwponpfLfl/RfjBrJlsL3QF0RgNBFYSWSv2hRmRmw
         bKuH5aMUyoKl8gAAhURdCc27TbLhf0tsHtvixnCPL/6RPoj9j/fwtmS3dAJ6HglqoCKs
         dUDwkz41II2FXYgbh426MymXto/clmDGrQ8k1Z19QoDUHFgyp1oeYQqOURyf71FwIyAS
         fYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791145754; x=1791750554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIFKjp1lGfDiZDolW1BimcdoYD6V0XYUoyt5Xe2j2X0=;
        b=0ZEdTTORclbMCbX0COSelKiXNU8k61Fsi4hyudl7IoqUe3gRzEWCx83yRgTtkQ0KAp
         n5UI7tnuLgENlfkgHIJ8P4Fra73TCLo4/LIecuUyIEVaykdqtyHR7GH1mwKaQndFRTpW
         S7mhR0PCXCaOHVRYoUX6A+XMgk0fw7HuEBqT1fAW2xz/eb8FbEOyW6aPMNPtLtFu/7eC
         arCBHRK2CgoIN2eKAtmsBtsAGvFnmPie8JZR4ea3aaMIRhYhAhFoicTv4FWrU2D78z+X
         J5pIqEU1RmwGW4BFEc3aCHVo/x6WmbXMd6MWpnuNLJD6P5vKkZ6M8Vt5xkY6eU/o2L4b
         GBaw==
X-Forwarded-Encrypted: i=1; AKwUvBylp8UFUz2K1WwdR2G5zv5HDgfGEMG0cMX9LNhjMUpzxMVRwYoNYk3elDlu0ZyxBm8hqVOLYXz6JB0HoxYl@vger.kernel.org
X-Gm-Message-State: AFuF++kwi5OJsmhXrFkXVvsdbt50YZmKZjclFr5/4O7WqChaPpuhAZSr
	agMiQTAwm94ajdcYckT7nY1VxchtuiUxl2oCoS8gS5y+nA22T4TeGgE=
X-Gm-Gg: AYBFou13HkSN3yovmkN8c0Cqe+s8Y4ZCJwVcjMlJdWjkHQazycBTXDvWDrR3rySAz5h
	XJlfvUSx1JcrbTRF8Pm9nQGnmDAuMlFQEHujZ7htOS7ZVMl1kzU0tDcSU1uqG5GHXLNBImjQFAp
	qlCNNcGi0AsO91tL6zuaWYGmDk1aNwnpEOQHQRfzDvbCCbn4EDnfYYnn6ZSsWHybCkke6oBQxEG
	GtzLKudlMPLaOYX8XCkcaIepv/ahaSD7pf0NucgR6s0ltsjent8I36bd/s9RznsNXyNqGvIO015
	AtfWv5ZSDi/6kfzjmFnVJ7Yt2++dMOUnULcrZtW5a7/wbonb8Q6MSVNkKz0rAuJw4K18Rs/awRK
	/Qy/L+4wUY/BHurN65zXBcHubpT6hZe4BCoIZ4kVA6FR8Qy4Yr0WOaISoKPNEEDdW35ITobi/0+
	hQWd5ZOp5OPE+FWvCN4Aaw582niF38BQJ0TvzhGq5jzw24C7BvJyODueOYPThxp3ic3MjKtSeGn
	xg42dttKig8qk3dkTXU3+Jag6k9B0cXNVGhSMDh1AV67a7VAkJI6PmgNXJftTc43w==
X-Received: by 2002:a05:600c:6096:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-4a1681073e2mr86527135e9.34.1791145753848;
        Sun, 04 Oct 2026 13:29:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a030326132sm232315185e9.0.2026.10.04.13.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 13:29:13 -0700 (PDT)
Message-ID: <b46b2f7e-f5fa-4556-9da3-aa4e4ab0e7a0@gmail.com>
Date: Sun, 4 Oct 2026 22:29:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] drm/msm: lock the resident BOs of a VM_BIND submit
 last
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Alice Ryhl <aliceryhl@google.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Liviu Dudau <liviu.dudau@arm.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20261001220632.3190896-1-matthew.brost@intel.com>
 <20261001220632.3190896-7-matthew.brost@intel.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <20261001220632.3190896-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/2/26 12:06 AM, Matthew Brost wrote:
> A VM_BIND submit locks the resv of every BO mapped in the VM, then
> validates the evicted ones, which means getting their pages and mapping
> them again. That is slow, and external objects can be shared with other
> processes, so all of it happens while holding resv locks other processes
> may be waiting on, for BOs which needed no work at all.
>
> Use the two pass locking gpuvm now provides. The early pass locks only
> the evicted external objects and validates them, along with the evicted
> private ones, which the VM resv held from the start covers. The late
> pass locks the external objects which were resident, and still validates
> in case one of them was evicted meanwhile. When nothing is evicted,
> drm_gpuvm_exec_pass_needs_split() says so and the submit keeps using a
> single pass.
>
> Both passes run in the same drm_exec transaction, nothing is unlocked in
> between, and they take disjoint sets of objects, so reserving one fence
> slot in each still reserves it exactly once per object.
>
> This moves validation from after drm_sched_job_arm() and fence
> attachment into the locking loop, ahead of everything else, which is
> also where a failure is easiest to unwind. The order does not matter to
> the shrinker: it skips any BO mapped in a VM whose resv it cannot
> trylock, and the submit holds the VM resv throughout, so a BO mapped in
> this VM cannot be evicted while it is locked, whether or not a fence is
> attached to it yet. The same means the early pass can never evict a BO
> the late pass is about to lock, the property Xe gets from
> xe_vm_set_validating().
>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> Cc: Antonino Maniscalco <antomani103@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Assisted-by: LLM
> ---
> v3:
>   - Follow the drm_gpuvm_exec_pass_ function renames (Danilo)
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 84 ++++++++++++++++++++++------
>   1 file changed, 66 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 1215b388cb40..4e454345567a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -266,6 +266,71 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
>   	return ret;
>   }
>   
> +/*
> + * Lock and validate every BO mapped in a VM_BIND VM.  Unlike the legacy path,
> + * where submit_pin_objects() only validates the BOs userspace attached to the
> + * submit, userspace does not tell us which BOs a VM_BIND submit uses, so the
> + * entire VM has to be validated.
> + *
> + * When something is evicted, the locks are taken in two passes.  The early
> + * pass locks only the external objects which need validating, i.e. the
> + * evicted ones, and validates them along with the evicted private objects,
> + * which the VM resv held from the start already covers.  The late pass then
> + * locks the external objects which were resident.  Validation means getting
> + * pages and mapping them, which is slow, and an external object can be shared
> + * with another process, so there is no point in stalling that process on the
> + * resv of a resident BO for the duration of it.  The late pass still
> + * validates, in case one of those BOs got evicted meanwhile.
> + *
> + * Both passes run in the same drm_exec transaction, nothing is unlocked in
> + * between, and they take disjoint sets of objects, so reserving one fence
> + * slot in each reserves it exactly once per object.
> + *
> + * The shrinker cannot evict a BO the early pass is about to validate, nor one
> + * it has validated already: it only evicts a BO after trylocking the resv of
> + * every VM the BO is mapped in, and the VM resv is held throughout.
> + */
> +static int submit_prepare_vm_objects(struct msm_gem_submit *submit)
> +{
> +	struct drm_gpuvm *vm = submit->vm;
> +	struct drm_exec *exec = &submit->exec;
> +	int ret;
> +
> +	ret = drm_gpuvm_prepare_vm(vm, exec, 1);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * With nothing evicted there is no validation to keep the resident
> +	 * objects unlocked for, so do not pay for the second walk.
> +	 */
> +	if (!drm_gpuvm_exec_pass_needs_split(vm)) {
> +		ret = drm_gpuvm_prepare_objects(vm, exec, 1);
> +		if (ret)
> +			return ret;
> +
> +		return drm_gpuvm_validate(vm, exec);
> +	}
> +
> +	ret = drm_gpuvm_exec_pass_prepare_objects(vm, exec, 1,
> +						  DRM_GPUVM_EXEC_PASS_EARLY);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_gpuvm_exec_pass_validate(vm, exec,
> +					   DRM_GPUVM_EXEC_PASS_EARLY);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_gpuvm_exec_pass_prepare_objects(vm, exec, 1,
> +						  DRM_GPUVM_EXEC_PASS_LATE);
> +	if (ret)
> +		return ret;
> +
> +	return drm_gpuvm_exec_pass_validate(vm, exec,
> +					    DRM_GPUVM_EXEC_PASS_LATE);
> +}
> +
>   static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
>   {
>   	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_DUPLICATES;
> @@ -276,12 +341,7 @@ static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
>   	submit->has_exec = true;
>   
>   	drm_exec_until_all_locked (&submit->exec) {
> -		ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> -		drm_exec_retry_on_contention(exec);
> -		if (ret)
> -			break;
> -
> -		ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
> +		ret = submit_prepare_vm_objects(submit);
>   		drm_exec_retry_on_contention(exec);
>   		if (ret)
>   			break;
> @@ -790,18 +850,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   
>   	submit_attach_object_fences(submit);
>   
> -	if (msm_context_is_vmbind(ctx)) {
> -		/*
> -		 * If we are not using VM_BIND, submit_pin_vmas() will validate
> -		 * just the BOs attached to the submit.  In that case we don't
> -		 * need to validate the _entire_ vm, because userspace tracked
> -		 * what BOs are associated with the submit.
> -		 */
> -		ret = drm_gpuvm_validate(submit->vm, &submit->exec);
> -		if (ret)
> -			goto out;
> -	}
> -
>   	/* The scheduler owns a ref now: */
>   	msm_gem_submit_get(submit);
>   

This and the two other msm patches are:

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

