Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5BE3B7B7F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227915; cv=none; b=e3REhT4qj7R6N6DRab9wxsUwfY6r42ZpPGZq+tZBvT5D2HU9YurjBga0ZPQhkD1ffEYXHAkE6pisyxHXc9UvClOSzeyRFgYPoMGqMAXsr0iVCyC0pn7Aro3BGoyQPHS2IjBCNas1CDIbbL7WYmReHlDpU8LaU8h9NKp7lL2Xwwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227915; c=relaxed/simple;
	bh=MsE7kWv93Ru2CI/UP8lj5CPPu0bIHQsm0Bgg+ICPJzU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDMaH+o1fyGwYkICzX85AXWvwPeytswTg/r3i8qhcurkMaZMogNceGPziEMTFBKdSQp7wFZIBUcmyHVflOnCejkqrP3EExEie2qvJH3kVDsPvvj0K0MfxUyFbmS2WpgiTTPalQrzL6ozbtKWEJX2xJLIyk4Uvnu7MefbYJlEZWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOH94iVm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOH94iVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F1B1F00A3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785227913;
	bh=jZ5KLdFG0Kj7A/1hGVR5FcdyB7fl+ixHwnKCoNYMBoQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bOH94iVmiXTGTMKPJ2FmfAM9t0SowgeInt9/I6ZSV92z7SqJo14ivGOKf37iTZFWo
	 NAkptJHSNt/XHYRfEPjnYAJOLpAjHWAoLQuOmIwAaycDxXV43XBkeir4r6xl3IN+Dp
	 KYhslTnUBHsK2n4Vzsr9ljTg6ksadpPvnjg6ozS86BnmjaN+g9cCJlWVcSPf1Y3ZUQ
	 ZaG+1jgZczVhC++dwkEd85tBsVsTRuESVyZzb2aXUJ7+hLSzQXeSxZQrQBqYhoVBYD
	 pgCnWcx7RFPw6bgse9Bd48EO/hc7nSK5lHsiSROr1oiz4S0QRfoMwp041/nzH9tGMF
	 mY19TKoAMJZuQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so887877e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 01:38:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoewECBOHRkwfKceKCJSMuSB4E4BL17LWCQzlvYIjS3wfJj7sGXkYYaJYrdBYfdkcRjK3QfuDpDsyfhdXnZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwN9NrJuXTpAAaVxi/ss5Lsq9vhn13CtTP3dcN4/rYv/qj7lmzO
	BCJ55vZPboCJLhrS61y7Yps7gC/aVtUyYbDTgy5s+llXOe98lXVH71Q0ZmxrCB2+V0hx/7aVN4r
	a7cI5e1UGy06qH3WtYFF0raMDfQi31qzkkq652H/uoQ==
X-Received: by 2002:a05:6512:2353:b0:5b2:aaa2:1d92 with SMTP id
 2adb3069b0e04-5b2d025d23fmr274035e87.25.1785227912591; Tue, 28 Jul 2026
 01:38:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jul 2026 01:38:30 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jul 2026 01:38:30 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <b4d1a1d4b56f548e157a4d9d8bed785f507dc157.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com> <b4d1a1d4b56f548e157a4d9d8bed785f507dc157.1785183549.git.allen.lkml@gmail.com>
Date: Tue, 28 Jul 2026 01:38:30 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdDEQ2JcQtJ0AwHq0atv9SJ1Y47W6Djzs_JGVoYkk8zFQ@mail.gmail.com>
X-Gm-Features: AUfX_mweuV2NQV2gdk5hEPPVqRK6kr4uxF3tef-qVA898oqyarmW2SDHO7pBrzw
Message-ID: <CAMRc=MdDEQ2JcQtJ0AwHq0atv9SJ1Y47W6Djzs_JGVoYkk8zFQ@mail.gmail.com>
Subject: Re: [PATCH v2 60/64] dmaengine: bam-dma: use dma_chan_kill_bh
To: Allen Pais <allen.lkml@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-msm@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jul 2026 22:39:22 +0200, Allen Pais <allen.lkml@gmail.com> said:
> virt-dma now dispatches completion callbacks through per-channel BH
> work instead of its tasklet. Cancel that work during teardown before
> channel storage is released.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/dma/qcom/bam_dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 1bb26af0405f..74bc2fe445b3 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1387,7 +1387,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>  	dma_async_device_unregister(&bdev->common);
>  err_bam_channel_exit:
>  	for (i = 0; i < bdev->num_channels; i++)
> -		tasklet_kill(&bdev->channels[i].vc.task);
> +		dma_chan_kill_bh(&bdev->channels[i].vc.chan);
>  err_tasklet_kill:
>  	tasklet_kill(&bdev->task);
>  err_disable_clk:
> @@ -1413,7 +1413,7 @@ static void bam_dma_remove(struct platform_device *pdev)
>
>  	for (i = 0; i < bdev->num_channels; i++) {
>  		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
> -		tasklet_kill(&bdev->channels[i].vc.task);
> +		dma_chan_kill_bh(&bdev->channels[i].vc.chan);
>
>  		if (!bdev->channels[i].fifo_virt)
>  			continue;
> --
> 2.43.0
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
