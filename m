Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69532DF3F2
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 04:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262140; cv=none; b=XRpnFmWx3CUnoXkRSU6vdlirQuajZafev8J6Jy3YLK0Oef0hntqphn22aVCwme7IgNknXVZP3y7fBJ48yI17DyY04wVwRj16BOER1q5J5j5LvZwzcxFzSJcUBVARMQdGXR1zJWh+UeYC+RKKryYjSRH5DtscZw2PPB70fQe4mbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262140; c=relaxed/simple;
	bh=0XGucEfSTFkwRP7XDjqeT+rZM5a2fwSXqv+Mzeq/nDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ros/3XwUM7YcWoMnu3TzyaEWXWSFLcdP51HCi+ntUcr6gjiFKilpuLdiqAEG61IFgIYKGFVHCEBy1p43f0M1wJxtTPL4GpKsmlwn3lvNzhvl+xuu8eTBaa3zJJPdOy4o7kAZmi6Nimr+bbfEGqVBRCiEl+pP3/4JDFq3Ij21kQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nbMCmHLS; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbMCmHLS"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30b6dad2382so169467eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 21:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791262138; x=1791866938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Mk2WRBAwChkq4s/3x9cH1VHTem4z6ve30tIS5Pq+dE=;
        b=nbMCmHLS6fxuEH+lGuwx/OtXk3sjEdKHyvkaDLsDoS41drNR1sHQD2CLXUoe4OMcPh
         Gl/vpmj6p6AciN1JE51/CXNWP2+UOZUKGaRfteILqy3rlDufsgCLPCanfowgmgisOuqK
         vV2y1nXs2SVK9yUfEuUnvjfqjZz29oYW26MD+3WKNyKafCQgKvqhMaYblze4mj+1tgKw
         kowUu/DwRFj6+i6l7Y3jZeFzUmXTIruQP+EIB9ufsFvlaP2Zc7wqesZzAEVZMuGDuP3e
         ns9phdvcMVxN1hKUtx9ORbjC/nhl91T/GqiV0PF8+Ir0yLS32o9qXJPIgiSwlfslTiAR
         r39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262138; x=1791866938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Mk2WRBAwChkq4s/3x9cH1VHTem4z6ve30tIS5Pq+dE=;
        b=n90TubwjazTRdrzIuMO4Nfxu/uW9FuFVfFtC329m5s+9nmDUEytrHt93uzBwLKHqM1
         hR2kJtzj3732s5z+KrrLTx0nSWMWLThKr4JXECLDlBfAYgQANHWVqR+bKdjWaegXhXsN
         maz/2i3AUSMTkWXNxAqaKg5zHZFbXWUh5l1hq+jUSFi20VNVlGBpZ32DNmoJ4/Ai7ICY
         O7DT17LFIQxP9ZNSQU4s9mE19s0Yv6XDiAMGhBdHSIIyVWXQm3mS0CslkWhHsJbgw8dV
         YueKjYiLC89Qr2TueUTCKyQESLi3DvJdaRB/phYNRstjjW2jQdugkJKPu0z6xSeR7stf
         Pu4g==
X-Forwarded-Encrypted: i=1; AKwUvBw94d6z67opT1c3SdazBleLC3D81UYUIJSnQv4BcsMll2BUC6pg31NxkHiM1iEagSqFbvB9SWl1gfRkJOUg@vger.kernel.org
X-Gm-Message-State: AFuF++kGIz0BYE1xLFx+SmDHzEu1bKN0h/0D3DTYO35EHu0VfdX194Uv
	csMLrcCd9zubQVQUhjOFjWhwP+EXSA5HoOe/xxE3oj0KZcY9FZxmE/wL2iuNY46G8LE=
X-Gm-Gg: AYBFou0TlVxH7J8xkQFtX+mogSzLQMHSlhL8LBnSzm7DbBNjvLcDL1LxXG/0aZ9C4ow
	6RWj2sbdz7T1kT+NF4JxgF9HCE1VScvjRWThr/9X2UUp5UougS06NeqxOWscRaEScia/z+wtip7
	Hm5OOYrPHJH+21U1+rC6Al4pPMh6x9YB8MyExBeLYnMRdJkWaawipttbcUOaKRIUSieCs8Klwg/
	8igJnPO7wxyZ9ZpBvd5S/emAu+gPB9YIb5ZH9D8IchVlRa8bGmRuHHIqOAam9J5/IUSN8RyhtoK
	XoRNjMqTHjLSdeCZByP6R9LiYYxbzeRqdOn/6VqR6a0tW8+sONV3p9frlUJzwbVrJd8nZtmx9Xz
	khDV2wlxE762Ng4sm0P8mC5XgylGVSY9rjq2+rtk7IiO2J1BgzqWlwfcnJDc+8MfhtCv2Z7rmuq
	hoEqUUnAsIu7/0cYqhR2AxOn7I3mPQCFmRyNzpvhZfhlm0PW+45oainlL0PPaJaOdheMlgQPoN0
	xt907fLuwQ=
X-Received: by 2002:a05:7022:6ab:b0:130:7246:10aa with SMTP id a92af1059eb24-15ec6306fd2mr585485c88.12.1791262137611;
        Mon, 05 Oct 2026 21:48:57 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d819cbed6sm6887345c88.4.2026.10.05.21.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:48:56 -0700 (PDT)
Date: Tue, 6 Oct 2026 10:18:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Add Milos to cpufreq-dt-platdev blocklist
Message-ID: <asR9tbmrai1i9nTm@vireshk-B250M-D3H>
References: <20261005-milos-cpufreq-blocklist-v1-1-7af4eba81696@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-milos-cpufreq-blocklist-v1-1-7af4eba81696@pm.me>

On 05-10-26, 17:47, Alexander Koskovich wrote:
> The Qualcomm Milos platform uses the qcom-cpufreq-hw driver so add it
> to the cpufreq-dt-platdev driver's blocklist.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 371ca1fe9020..574c5bec4831 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -155,6 +155,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "nvidia,tegra234", },
>  
>  	{ .compatible = "qcom,apq8096", },
> +	{ .compatible = "qcom,milos", },
>  	{ .compatible = "qcom,msm8909", },
>  	{ .compatible = "qcom,msm8996", },
>  	{ .compatible = "qcom,msm8998", },

Applied. Thanks.

-- 
viresh
