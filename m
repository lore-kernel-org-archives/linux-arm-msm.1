Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C9E346E58
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 04:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755969; cv=none; b=t1B4+TExuSaGjEpNyvw8aVHjNtZURQmIVdSe7lWvfWFNh1NAlrNWem7XBM38txUlJumBB9n37tFzsvA2l0fbBEo3kkoAwYGlqFze9wX3JqjzX/2+8Dm1AZpY5N1L1k8cMKd0eVjGgIQVNlQ2TWhlydafcfKijLzfisE7QfyspBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755969; c=relaxed/simple;
	bh=SHkFjsUEK8BRAqvmfnv5vItChhZEKbXF3e++QGo0kBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vk8sbWk0JNZ/echlPDiLXt+H1AaDArOJ6Ls1D0/j3DgrNi86crHOVNLwBiZkkGb/zFVKG9CQ9EEFj2ujroqpx2FZ6/Lr6UZZ/IhyjwD27CBgeV8cfwGlAP9PGHqa4ehyQHrrBu6nAt5MM3QL1SZWhfmBRhrjG9I+ChhIqqyWAGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PIANc05N; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIANc05N"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d91ded8174so23586645ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788755967; x=1789360767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=;
        b=PIANc05N512QUTF5TjEtlbM4w7en9fL8O6BhtCA83roQ0jfUKukb//ho+6RXKySd9G
         FUTw3G0FVSbMNUtMYku3cZHHlvlWyfjjJU1OVIXHzVBQnjMwT2JBWDeHUDO1DzVMkcrq
         AxN6vpFP78ujLulq5uM1dTmRzi+LtC7nNUXT18TUw3Ahk1SOaot5RiQPSLJ/2M8AjXDY
         c4jOM5KGpPU8aUg5vTo0VaGJqfiJ5RwIZVKupuv/lHnbq48TMS7H+gvkXalZhIqrdyU4
         pndd0TNeuW9n0qkAm6pPJvKjOv5aq07RoZ4kaYjA9B1Lf1FeGycUCndnf8+V8OGsGPYn
         uAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755967; x=1789360767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=;
        b=H+i6x8KLXtW6CsH8gwFNLEXYo8tZ+8bWlOS+W7ZcbPRixFnQLMDnr4Ni/IZHZuTfUx
         M3B5XRNKcLYVq1fa/PsIs6iJ17U0j1a8VeoNoq1isg2xy3DKNXqA0mlIUD+pqjwLbHNc
         5YJml3gL+uC5LH3GAbmiY/pCjjCOCIdef1v9nGN9qI4nhTb9+9RY6cxaMdQ5+uYuDyyA
         rYahCwSJrjKWBmJEqayWULkJD47U/Gjq8n9ch9rSAY1CNAxtSIzK8co4e1T3+1hl77I1
         VquuCnOYTkOztNzeowbCjouEn1saWFw2/K+UYPeGO8bDJH+WbH5qaJvU4pBHwfui/YGM
         YJHA==
X-Forwarded-Encrypted: i=1; AKwUvBzdwoKVULDh8OF3NlBkdbWx/N9JjdDQtaYzURUZxh7LIMv09pG7KIim5l1ldA52lrNg++cZWRDv6i3YiiVt@vger.kernel.org
X-Gm-Message-State: AFuF++n6sCvK3Teo8rWQZL2Y5j61aYRP/BqPTF8/Uuvy1R3x3GGMOkPV
	+sXd7Y/Swap8XGvFgsUH9Fz+YgEXi3rcWJgKHKcljDP22p5PDOefFm3Qow0vfaHj7GA=
X-Gm-Gg: AYBFou08strrihDimkM5ccLnQRtBOAM187xDCj43i3AiCPSx1na80ldR3WbjIMEUfQ8
	5Of1lfULAWAEiPHMxYN6BlYS38G0mU3S1KO/XOGtYCECh51NgL/hPUoOdF7vfD1/lBCNfk3CoVe
	L5p7EiPABpP/E8LBX8PUA2lcwO/ZShtFt6aigSSsJPJxuwx634dFYpqBdX0ZtO38KJlg6UGsIoo
	51lKQ/IfTdlF26k78vAvC53axgDx3ERzTlez48PyFHlSvrck17LLKBRWOXhYnkQYAJPQOFQ5bn8
	3W8sGRB/yPnyJ559l9k2evfcxkabi5ljZd3inQ820wr7XvT+D+dV8txF1Jt8hEAatwB7yMGXbYC
	daDMkt/2s6rGtmOFb+b3JDp/rQMPbL9nkvMT8bIFrBt7xgBEPWz3O1W+D51sJZLA9sHbOE+i+Ez
	x6mOTi08vRDjA80vGeI1mdUKqfQ3rUJmkmvxNwBm/Sly4DqaQb+nLQ30rhvymfB8s=
X-Received: by 2002:a17:903:37c8:b0:2d9:50:a91b with SMTP id d9443c01a7336-2db12667eeemr299920485ad.16.1788755966732;
        Sun, 06 Sep 2026 21:39:26 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm26643998eec.2.2026.09.06.21.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:09:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com, talel@amazon.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	mmayer@broadcom.com, sumitg@nvidia.com, krzk@kernel.org,
	peter.griffin@linaro.org, myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sven@kernel.org,
	j@jannau.net, marcan@marcan.st, casey.connolly@linaro.org,
	sre@kernel.org, wens@kernel.org, t.schramm@manjaro.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] cpufreq: Use %pe to print error pointers symbolically
Message-ID: <ap4_-12ta7ThxEjc@vireshk-B250M-D3H>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
 <20260906061755.5103-4-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906061755.5103-4-sumeet4linux@gmail.com>

On 06-09-26, 11:47, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
> name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
> falls back gracefully and prints the raw integer value. This makes messages
> more readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
>  4 files changed, 8 insertions(+), 9 deletions(-)

Applied. Thanks.

-- 
viresh
