Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE18E4028EE;
	Tue,  4 Aug 2026 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857758; cv=none; b=N6NSN2YChFLnAqJYtqi80NUuwfFyeNjhZUjdQ2EES0LXvjYvYxUXzYvLJWL3XpfYHSEvs5+xSZQr6Wz93iNXBrMGKASZAKkPp3xzoA8MKxbdCUaOSTzYshNlRimqBZTSn3JZpkgmGkK2Hi4ZaB67WnGSsyUc9F6GHFGn8miDZF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857758; c=relaxed/simple;
	bh=ozuIT6NQ6keOFHqrAgxFSBFKp2gQ9ihWI1Rd3iiHEBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckJ7jZTmGJpg4G5fjgn0JC+730Lm8WvY6uucsr7EAKz6u4VzGwTYrBvtszSwZIGB7HeyupBLarjYbfYGSuLjDwmV2xNFUOWqB2mzwSDNeqdcZcg4rvsWYWT8aWL/FI9SHXi47AAe7v5PJ8sRiD62iv5zQO1XkVB8PyocV0uY/rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYuxkgHG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYuxkgHG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F061F000E9;
	Tue,  4 Aug 2026 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785857756;
	bh=tb5nPy+2EZ3NnkzPH1/3D5atggOG12B5s/Z3eP57sg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BYuxkgHGLWe+Og0l2woUt0aHtXjZrgRxIPx1lV503W4hbN9oD6Ww+DMktzf5PrGXU
	 lfIS5xZO2/LoARy5G/I3fHUrxC/axgWE1KnSxqnbUlRMzq2rAcDAD2kBvdX5rglZWi
	 dBpyFM+TiMVL7aJkPq6HAiE5xQQSI5woeynLXRPeqoufcKLLvwevivTYMdKtkCqmmS
	 wpUi+g6ZJhnwdsQENzzVI4mGSBtvg5W90aX/5KpPJ/+RUmCEJ06a7PJ3hmS9WC7Gfm
	 e0MDGkynXjlMl4wk1C16M6DefMjrxI+EyUEaCXbmKZfpBbFuLKKSK66WzJ6Yk8XCkX
	 VpKIloyFoeTTA==
Date: Tue, 4 Aug 2026 10:35:53 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] firmware: qcom: scm: introduce qcom_scm_clk class
 for clock management
Message-ID: <anIGRcBuIKiil36J@baldur>
References: <20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com>
 <20260731-qcom-scm-code-shrink-v2-3-4ba76096915f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-qcom-scm-code-shrink-v2-3-4ba76096915f@oss.qualcomm.com>

On Fri, Jul 31, 2026 at 10:00:36AM +0200, Bartosz Golaszewski wrote:
> Define DEFINE_CLASS(qcom_scm_clk) that calls qcom_scm_clk_enable() on
> construction and automatically calls qcom_scm_clk_disable() at scope exit
> *if* the enable succeeded.
> 
> This allows us to convert all call sites to using
> CLASS(qcom_scm_clk, clk)() instead of the manual enable/check/disable
> pattern and to remove the associated goto labels.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 89 +++++++++++++++-------------------------
>  1 file changed, 34 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 10c79d2e59a14af0532c515d332f65bdfea05621..bb213f64703a7adb9ce413ec00524a7d0a1d3856 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -209,6 +209,9 @@ static void qcom_scm_clk_disable(void)
>  	clk_disable_unprepare(__scm->bus_clk);
>  }
>  
> +DEFINE_CLASS(qcom_scm_clk, int, if (!_T) qcom_scm_clk_disable(),
> +	     qcom_scm_clk_enable(), void)
> +
>  static int qcom_scm_bw_enable(void)
>  {
>  	int ret = 0;
> @@ -509,13 +512,11 @@ static int qcom_scm_disable_sdi(void)
>  	};
>  	struct qcom_scm_res res;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_clk, clk)();

No matter how many times I read this line, it doesn't tell me "clocks
will be enabled from here to the end of the scope".

I don't like it.

Regards,
Bjorn

> +	if (clk)
> +		return clk;
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  
> -	qcom_scm_clk_disable();
> -
>  	return ret ? : res.result[0];
>  }
>  
> @@ -609,22 +610,19 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
>  	};
>  	int ret;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return clk;
>  
>  	ret = qcom_scm_bw_enable();
>  	if (ret)
> -		goto disable_clk;
> +		return ret;
>  
>  	desc.args[1] = mdata_phys;
>  
>  	ret = qcom_scm_call(dev, &desc, res);
>  	qcom_scm_bw_disable();
>  
> -disable_clk:
> -	qcom_scm_clk_disable();
> -
>  	return ret;
>  }
>  
> @@ -734,20 +732,17 @@ static int __qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
>  	};
>  	struct qcom_scm_res res;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return clk;
>  
>  	ret = qcom_scm_bw_enable();
>  	if (ret)
> -		goto disable_clk;
> +		return ret;
>  
>  	ret = qcom_scm_call(dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
> -disable_clk:
> -	qcom_scm_clk_disable();
> -
>  	return ret ? : res.result[0];
>  }
>  
> @@ -819,13 +814,13 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
>  	void *tbl_ptr;
>  	int ret;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ERR_PTR(ret);
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return ERR_PTR(clk);
>  
>  	ret = qcom_scm_bw_enable();
>  	if (ret)
> -		goto disable_clk;
> +		return ERR_PTR(ret);
>  
>  	/*
>  	 * TrustZone can not accept buffer as NULL value as argument hence,
> @@ -872,9 +867,6 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
>  disable_scm_bw:
>  	qcom_scm_bw_disable();
>  
> -disable_clk:
> -	qcom_scm_clk_disable();
> -
>  	return ret ? ERR_PTR(ret) : tbl_ptr;
>  }
>  
> @@ -902,20 +894,17 @@ static int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
>  	};
>  	struct qcom_scm_res res;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return clk;
>  
>  	ret = qcom_scm_bw_enable();
>  	if (ret)
> -		goto disable_clk;
> +		return ret;
>  
>  	ret = qcom_scm_call(dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
> -disable_clk:
> -	qcom_scm_clk_disable();
> -
>  	return ret ? : res.result[0];
>  }
>  
> @@ -997,20 +986,17 @@ static int __qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
>  	};
>  	struct qcom_scm_res res;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return clk;
>  
>  	ret = qcom_scm_bw_enable();
>  	if (ret)
> -		goto disable_clk;
> +		return ret;
>  
>  	ret = qcom_scm_call(dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
> -disable_clk:
> -	qcom_scm_clk_disable();
> -
>  	return ret ? : res.result[0];
>  }
>  
> @@ -1780,18 +1766,13 @@ EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
>   */
>  bool qcom_scm_hdcp_available(void)
>  {
> -	bool avail;
> -	int ret = qcom_scm_clk_enable();
> +	CLASS(qcom_scm_clk, clk)();
>  
> -	if (ret)
> -		return ret;
> -
> -	avail = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
> -						QCOM_SCM_HDCP_INVOKE);
> -
> -	qcom_scm_clk_disable();
> +	if (clk)
> +		return false;
>  
> -	return avail;
> +	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
> +					    QCOM_SCM_HDCP_INVOKE);
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_hdcp_available);
>  
> @@ -1829,15 +1810,13 @@ int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
>  	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
>  		return -ERANGE;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return clk;
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  	*resp = res.result[0];
>  
> -	qcom_scm_clk_disable();
> -
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_hdcp_req);
> 
> -- 
> 2.47.3
> 
