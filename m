Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5D12AD35;
	Sat, 11 Jul 2026 18:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783793879; cv=none; b=qQ0XVNtn2q9qjDtFOYza6c0Cc9crUYRYoT5onYDp4uaql+2bPpi4stEcOrYELS40JdZ1mQbnS2aLux2RkWJ1LxHym9XbyZ5hXFLL32VekXyyxnm+y/kDb+jJ2UbYpcuhe7GDiB3COmsnnDhrEMgx1l7mjs/ks4TxFgfWnFG1BHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783793879; c=relaxed/simple;
	bh=fW+Vz5vhlfmPHblE7i/g8O3eT0gXAibxLfZi8YUx3rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6Bs626ewrwgm5x+Dvdd0GgKSXLIvGPjZL3Ey8cS1FULos4qb0XTrn080y2GvZ3ffgpqvhal0znIGrEr8moPt0EOB3T3Ke9nyaeQtwPkQuJPR+RRwmnztPv29moL/EUJuzWUnOhCKx/hZVzrkEzmL/DNlDK9hdcsC50GQtxkPyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSGt+0bO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSGt+0bO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16C81F000E9;
	Sat, 11 Jul 2026 18:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783793878;
	bh=rqYN0gPCAn5XIATHOsISYG+q1Yl3muW/kvu1PJh5ip8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KSGt+0bOeLEzV+Gk0ns1+Us0dCTPHuspLpCuQLb1Eu1SfOg9KNPtQe8UQiDGCVZcJ
	 gL6thZcOAxYllsQxHyT7dzjN48Sh4hSBGs+jAhHIFCX7xxWNWF0YTRprqMD9ts3BQ9
	 1gO2dPyoiIsWlzwdaoXUl5lg4GUuTtBe8RoDWH1rr1i01atQJ/5wkz3QqBV1p8XuWj
	 YNTCTJMGPSJMD1UQvocSMj9IXGL3kU1D+OxS6gGhYPTe20EVLD8toYDd2NLebKia5E
	 RoUctvcov14mvsEnGQ2P7lrVeADgV/kMeFg8pogVhHm7MIkv28nQmiY+tlj09tNm2/
	 Tv0XEr3fQb2gQ==
Date: Sat, 11 Jul 2026 13:17:55 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: geni: depopulate children on populate failure
Message-ID: <alKIj80YwTj0pydP@baldur>
References: <20260616005118.5108-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616005118.5108-1-pengpeng@iscas.ac.cn>

On Tue, Jun 16, 2026 at 08:51:18AM +0800, Pengpeng Hou wrote:
> devm_of_platform_populate() installs its devres cleanup action only after
> of_platform_populate() succeeds.

And if it fails it runs the cleanup function.

> If child population fails after creating
> some GENI children, those partial children are not automatically removed
> by devres because the action was never added.

Did you test this?

> 
> Depopulate the children explicitly when devm_of_platform_populate()
> returns an error.
> 

For now I'll consider this patch to be wrong, please fix
devm_of_platform_populate() if your analysis is correct.

Thanks,
Bjorn

> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index cd1779b6a91a..46dd7b7a8f90 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -1406,7 +1406,11 @@ static int geni_se_probe(struct platform_device *pdev)
>  
>  	dev_set_drvdata(dev, wrapper);
>  	dev_dbg(dev, "GENI SE Driver probed\n");
> -	return devm_of_platform_populate(dev);
> +	ret = devm_of_platform_populate(dev);
> +	if (ret)
> +		of_platform_depopulate(dev);
> +
> +	return ret;
>  }
>  
>  static const char * const qup_clks[] = {
> -- 
> 2.50.1 (Apple Git-155)
> 
