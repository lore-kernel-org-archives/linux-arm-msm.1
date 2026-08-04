Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69973EA66;
	Tue,  4 Aug 2026 22:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785882651; cv=none; b=IfaG/o5aAm/4vh3Yzk+cMVK2JwWMcLNxaOHihplT2WC1g8T46IIPSLiOdnk6CBpaHT6zzGstIHjtdrdl9inrG4IWEDWLwFolJdorclk0RduVP1LkzT1gayi23FS/f/64O/2l0FNwEetPIdGrxBQH3PjZoogrqmz2jpImZD4GN6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785882651; c=relaxed/simple;
	bh=yeRfsooGbD7DHo+g/vay55X59RO3scCR1L1Q8brPE2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+L28ZPn00wb0T86SPMTEzMlSqVz0gJLnxfJLgfprMy1zJYu1lIDV8QicsrqX8ZeR8QeX7cnrhNMPr0ygmyt1MDA+iW6B0t9TtuyQxM/ndSxMDdgwq9N50vCrOrqGjLhlBemqiCmW77DE0M6A0JT9jTf8+9TKDlAe93ZFK/MYYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8zuu9VB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8zuu9VB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4671F000E9;
	Tue,  4 Aug 2026 22:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785882650;
	bh=E2074DFQwh5M+CWVkpELfYk4/TJZuTGxiDids5ho1Sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K8zuu9VBeVWIBjoekKdzE6HXBAmaptTE97GrT5sSa/lhW72tfrN0o3fYBv3OYk47Z
	 evOV7vJWY826LTwWTndHdAEA6pa9k5sy2rdWSyKcayyTu0uCxow6rl98bqV7bdiI4O
	 mgHpSGR1fmTzLmjw4kcWUqUpCwavSD0QVLGOCvfM8pXNw6sIFA5J/mnxlZWZtxe7TP
	 3ZiMao/vJ3J/uDCCuFhjrr0Ld5wEm9ofNLtlx8xeNWN+vkDc+1xOYrsCfazS9IHwN5
	 UEq8kmvuwFSQyJnvc0TbU6Iv/jt9WFg+69yNvnqYnWo3qoNeLzMC4bkZLyWsvHeOu0
	 qsEgvtGZ9fSfQ==
Date: Tue, 4 Aug 2026 17:30:47 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] firmware: qcom: scm: use __free(qcom_tzmem) to
 simplify cleanup
Message-ID: <anJn_Cf0mgVNstHj@baldur>
References: <20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com>
 <20260731-qcom-scm-code-shrink-v2-2-4ba76096915f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-qcom-scm-code-shrink-v2-2-4ba76096915f@oss.qualcomm.com>

On Fri, Jul 31, 2026 at 10:00:35AM +0200, Bartosz Golaszewski wrote:
> Use the __free(qcom_tzmem) cleanup attribute (together with no_free_ptr()
> whenever ownership is transferred) to replace open-coded
> qcom_tzmem_free() calls and their associated goto labels.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

I tried to pick patch 1 and 2, but it doesn't compile. Please have a
look.

Regards,
Bjorn

> ---
>  drivers/firmware/qcom/qcom_scm.c | 49 ++++++++++++++++------------------------
>  1 file changed, 20 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index f35f2ee39130413ab3798551b4055228008222b4..10c79d2e59a14af0532c515d332f65bdfea05621 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -634,10 +634,9 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
>  {
>  	struct qcom_scm_res res;
>  	phys_addr_t mdata_phys;
> -	void *mdata_buf;
>  	int ret;
>  
> -	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
> +	void *mdata_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
>  	if (!mdata_buf)
>  		return -ENOMEM;
>  
> @@ -646,11 +645,10 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
>  
>  	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
>  	if (ret < 0)
> -		qcom_tzmem_free(mdata_buf);
> -	else
> -		ctx->ptr = mdata_buf;
> +		return ret;
>  
> -	return ret ? : res.result[0];
> +	ctx->ptr = no_free_ptr(mdata_buf);
> +	return res.result[0];
>  }
>  
>  static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
> @@ -773,10 +771,11 @@ static void *__qcom_scm_pas_get_rsc_table(struct device *dev, u32 pas_id,
>  		.owner = ARM_SMCCC_OWNER_SIP,
>  	};
>  	struct qcom_scm_res res;
> -	void *output_rt_tzm;
>  	int ret;
>  
> -	output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
> +	void *output_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
> +								   *output_rt_size,
> +								   GFP_KERNEL);
>  	if (!output_rt_tzm)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -796,20 +795,17 @@ static void *__qcom_scm_pas_get_rsc_table(struct device *dev, u32 pas_id,
>  	 * be of unresonable size.
>  	 */
>  	ret = qcom_scm_call(dev, &desc, &res);
> -	if (!ret && res.result[2] > SZ_1G) {
> -		ret = -E2BIG;
> -		goto free_output_rt;
> -	}
> +	if (!ret && res.result[2] > SZ_1G)
> +		return ERR_PTR(-E2BIG);
>  
>  	*output_rt_size = res.result[2];
>  	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
> -		ret = -EOVERFLOW;
> +		return ERR_PTR(-EOVERFLOW);
>  
> -free_output_rt:
>  	if (ret)
> -		qcom_tzmem_free(output_rt_tzm);
> +		return ERR_PTR(ret);
>  
> -	return ret ? ERR_PTR(ret) : output_rt_tzm;
> +	return no_free_ptr(output_rt_tzm);
>  }
>  
>  static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
> @@ -820,8 +816,6 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
>  {
>  	struct resource_table empty_rsc = {};
>  	size_t size = SZ_16K;
> -	void *output_rt_tzm;
> -	void *input_rt_tzm;
>  	void *tbl_ptr;
>  	int ret;
>  
> @@ -843,7 +837,9 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
>  		input_rt_size = sizeof(empty_rsc);
>  	}
>  
> -	input_rt_tzm = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
> +	void *input_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
> +								  input_rt_size,
> +								  GFP_KERNEL);
>  	if (!input_rt_tzm) {
>  		ret = -ENOMEM;
>  		goto disable_scm_bw;
> @@ -851,9 +847,9 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
>  
>  	memcpy(input_rt_tzm, input_rt, input_rt_size);
>  
> -	output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
> -						     input_rt_tzm,
> -						     input_rt_size, &size);
> +	void *output_rt_tzm __free(qcom_tzmem) =
> +		__qcom_scm_pas_get_rsc_table(dev, ctx->pas_id, input_rt_tzm,
> +					     input_rt_size, &size);
>  	if (PTR_ERR(output_rt_tzm) == -EOVERFLOW)
>  		/* Try again with the size requested by the TZ */
>  		output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
> @@ -862,21 +858,16 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
>  							     &size);
>  	if (IS_ERR(output_rt_tzm)) {
>  		ret = PTR_ERR(output_rt_tzm);
> -		goto free_input_rt;
> +		goto disable_scm_bw;
>  	}
>  
>  	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
>  	if (!tbl_ptr) {
> -		qcom_tzmem_free(output_rt_tzm);
>  		ret = -ENOMEM;
> -		goto free_input_rt;
> +		goto disable_scm_bw;
>  	}
>  
>  	*output_rt_size = size;
> -	qcom_tzmem_free(output_rt_tzm);
> -
> -free_input_rt:
> -	qcom_tzmem_free(input_rt_tzm);
>  
>  disable_scm_bw:
>  	qcom_scm_bw_disable();
> 
> -- 
> 2.47.3
> 
