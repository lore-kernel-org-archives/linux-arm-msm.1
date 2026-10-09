Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB473D4127
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 04:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791520389; cv=none; b=qHaVHoOiC6rC95dPRJVAhaNwx5qPnFiL6EAwB5iKLVaK9y9U7fKbE46yC0ODjnqxn6ab/yOKYfu5oGTUN/Xsb7omzAN+9MouZzWn8HfRhG9DTph/ba77FV/6StD0dgsRNw1rRvmaKFT7fq4PN38ROFnM2UJhWddg/Dv372kp1y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791520389; c=relaxed/simple;
	bh=BRksUHupWTwAHQEfDLT4q+pk1XcrAhHwf/e+BYIOG/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWa3477ea77QJbIK/WAdAIEyI4dLIIJdl5BcV7ZW1Z9fFQfTVN34ZcMlDZsZlY1OVQW7aHo1fKEZcb0VN8s1TbmRu+K4HOvYLVUKoVfU9IV56YucAe7RQIVtmST+uHHawgFJFlBNeoQKutL5qf4ex1NJbH//QFJDUzFKcPxrZ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uWe0Q2tb; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uWe0Q2tb"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15168a20b47so2493878c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 21:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791520384; x=1792125184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Er36W4Z+TzVAMFUZ5NmRw1HzZaggY++xCA8t6qC7IVU=;
        b=uWe0Q2tbYCE83zlGEdbLVOlxhp7phrXOMROncsEM1u1yUjEcWHX/48j1Px7vOH+aeE
         FBTumHNikDFm9lJbKZaCzEckLuvwdJJAY+obzNKOrmMZQnKFm+kRoBGE7l9xLjcsXt0v
         SrDCucnZEnNA6elUuSf1IasLvGAhk4rC5yvnwMcQ27zwYCZBCkW/t/VJPlzV5PaSBoiu
         qb2ZkE9HMxJYQ1FjzSllXJZXUKvYKly9BiNcbWDy6A3BaIvbrKlla6pRx8X7uzL4f6Pl
         a4zYPCaHuu9ddVlarqCj0YSk8jFEW4osXQT6d0fImqHQReLWyJCq2Bd+6Icy9k2+g1Wh
         zoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791520384; x=1792125184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Er36W4Z+TzVAMFUZ5NmRw1HzZaggY++xCA8t6qC7IVU=;
        b=Tcvrkp/MJo3fLZmfaaCBCavoKmKmujIrwD4kVa4xoT4L3fQyx7FJTxlDlZ1Stt0H0Q
         kpqpeTnV62VjuB6yZwvzfB4pHe2bILnrBv3KMIWdHhi/0XXJTrDwrmFnAdJZltJVHTRy
         iuC9JFs6pkfR29fvJCHG+ivjhu0zIYr3Fxu+Pna0YS4A39hzyuMrj25uQbAYz2UfJCZD
         2z54stKu/gGP3OBtOTdrlnSdRgtMwEbozQhpPDT34ehu+4UT0vG9Rt9POBD2vvK7lUJU
         3EVY4hwTldPvk2zbaxM/9/hoHN3JauQwv86/wRIM+q6x0Szn5CYJONI6vNmR3yVzC1ew
         40qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkkxzxYfQrI+B3KPC8cZkRZceTA6TH2Nzbkjd4DXJWIZUm+7fPnexT68A774z0Z4omOeUj0jDEDL3Trmy+@vger.kernel.org
X-Gm-Message-State: AFuF++kpbUcH6jcV8ryBTrhufodUoYtBrNVTrL/8daRk3B1IK5EJq6C2
	1OQ3RTlNNkFtjLb1i3Ry0q+utsTyYw3noZ3Q8titxXgvlWQKQQfsmXKEG6PaBALruDxZH3N7j8J
	5aT+u
X-Gm-Gg: AYBFou10Q3gCgQx1Z38njU+WmqkTWjT3ScSD2GXZF6n3KadtYrQSml+tWlQy3j3svHt
	fFCUQx0nWD5QaKYX9b+BZh9ghSEyx1t1oMa1yBTb6tGpysVf96VuMkUIoLY9eU/zxAIayJm1lIK
	AKo8B0oKaxImVWeOATtbpZmVyG0Y1/MrE0G384/+jgvMRWtXCCltClpTmbCkJmvATxg6hFKqmV5
	U7mc4aXWtweVr0uCMhcXN7KiL2HAOpnrdVAE0oGn6SWEYLtssrHd0aeVPJq/8tPIEUJU/etzYGg
	RnyXZiBO/Vq5bsj7/H7naYTA4EjHs+YFaFR/tQAyB21fpQzU1pY6fdmOxUC5ohfJyjqUYKRmPH3
	7gY/vrrGPlcrXW2l3GlHcQIRuGF2ddURD5czL/PTfsiJPsIoX/UjlfVBpIPxHpBQGPwMj8mNh6t
	qzpTR1vesYoEws2vVQtg2lKzLKJ7Umu61835bPqAg4FVk2m/Hl9zZCirk8d/IPCIqUeWZSR+qtu
	A==
X-Received: by 2002:a05:701b:205b:10b0:148:722b:7cbc with SMTP id a92af1059eb24-16a5dbfe430mr919153c88.14.1791520383310;
        Thu, 08 Oct 2026 21:33:03 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm3128557eec.10.2026.10.08.21.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:33:02 -0700 (PDT)
Date: Fri, 9 Oct 2026 10:02:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-cpufreq-hw: fix device node refcount leak
 in phandle parsing
Message-ID: <ashueyfHcwGHziVG@vireshk-B250M-D3H>
References: <20261008172442.2725544-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008172442.2725544-1-vulab@iscas.ac.cn>

On 09-10-26, 01:24, Haotian Zhang wrote:
> of_parse_phandle_with_args() transfers a reference to the provider node
> in out_args->np, which the caller is responsible for releasing with
> of_node_put().  Neither qcom_get_related_cpus() nor
> qcom_cpufreq_hw_cpu_init() ever puts args.np: they only put cpu_np, which
> is a different node obtained from of_cpu_device_node_get().  The
> reference is therefore leaked on every successful call, and
> qcom_get_related_cpus() leaks one per present CPU.
> 
> Release args.np after the parsed index has been read in both call sites.
> 
> Fixes: 2849dd8bc72b ("cpufreq: qcom-hw: Add support for QCOM cpufreq HW driver")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 874ff3fb9d97..060a460716f7 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -322,6 +322,8 @@ static void qcom_get_related_cpus(int index, struct cpumask *m)
>  
>  		if (index == args.args[0])
>  			cpumask_set_cpu(cpu, m);
> +
> +		of_node_put(args.np);
>  	}
>  }
>  
> @@ -554,6 +556,7 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>  		return ret;
>  
>  	index = args.args[0];
> +	of_node_put(args.np);
>  	data = &qcom_cpufreq.data[index];
>  
>  	/* HW should be in enabled state to proceed */

Applied. Thanks.

-- 
viresh
