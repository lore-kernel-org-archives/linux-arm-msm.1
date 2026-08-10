Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629543AE187
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357024; cv=none; b=kRp5nKppb7jqyoutmIod4IMBRbEX5iJgsJV6uRXdCRJ9lhak2khd+AqHgZJ0rb1dd+ne9SCt4gH4NnjhOPPwLf5RGLoeT+Ux+zzdLwHS4hFb3z8fvkDFAwpr9IH0iVAykj1b1ulj9WAs6JmKJmOc/gRibhZXawZuLHQKHzrpMI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357024; c=relaxed/simple;
	bh=A5PL93j3KOVOqui10gjbMhKuEUTfJ/q9/niflbJmhts=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCP2pukebAG28q2AnrCwlO01RbHnzWhDM0ybP9AzAtgpCPdXxoiAU7G6SItR+M1UqYFwEwf0tHHp2rWbE16+G42Y6vsvI8YstUZgRXg9apAI0jcj43SuVnAGZDX6IWHbMFHB+LCNz48KDzVVG82Y1Cxv2BYBYTVL3SYcmQEa5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNk3GOY3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNk3GOY3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE931F00A3E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786357022;
	bh=pueV/Sym5tDCUShri82wnU+nRqu+IAIBKHuGXdc2uHQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XNk3GOY3gjtduVGEkgAc/Sl7wIMST9MCUR+kvUkbOBPiJmlSgon+MCZGla+OEtsdp
	 /bwW/JszhnwGxUOKGZwmyGYERjdrjOUSUaVEq/UtOCXwD/Zo3Gk8JDbUmagh0443eO
	 n7z0hUfJiprIRaL2ygK0oatVqQQKIhwU1O0FXBryS2mMr89iLAXbyiuRyDSNd+QjsZ
	 Av0N9ZC6Tnuf1cPbJTv7DJfGTXH359S2xcBEbegIbBxVZDosvY332cGvWRuDzWz+Em
	 RCrayIZwOjekGYcgRVThO6L3mENY82avaVATuvoTmdoCjmZzXtyB518vTCXbs3iGk9
	 7xL4Q0pPPHqrQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aec201b582so1694167e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 03:17:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqtAp4D1tnXrexVpHf+dX/er4nzmgB/VAAk59D2I/O2jL0ONq3tY4CccUxi3D3kpJoFaJX55VtFXFtBbe7U@vger.kernel.org
X-Gm-Message-State: AOJu0YzwhwF/Zxoz8BhZoQyJ3RKUKUTFj/Fzm0e/Ffx9kM0LG0SuCx/C
	/U7D0PQ1GBwWWiGXRbnwS8Ht3FFlbioRZW/gDTpEbfOgLs+9liwoH1eMVNcCDw9sfFBQpF2PjkK
	UnV3esyhZ11IAp/M1Gl35r/uvQJrZD+fvp9uLRBnniw==
X-Received: by 2002:a05:6512:3993:b0:5b0:1108:c583 with SMTP id
 2adb3069b0e04-5b3181ca049mr80275e87.30.1786357021596; Mon, 10 Aug 2026
 03:17:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 05:17:00 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 05:17:00 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260806112709.4018596-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806112709.4018596-1-mukesh.ojha@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 05:17:00 -0500
X-Gmail-Original-Message-ID: <CAMRc=MffWt7TrSXaQpd6Zo_BHOrDv2tMxBh9cmMvkqem3Q245w@mail.gmail.com>
X-Gm-Features: AUfX_mziT_NxAveqQ04UHSz9qG87rmgqCuzSzUYVg_6Yi54ZSvNRMivFoK5QMlY
Message-ID: <CAMRc=MffWt7TrSXaQpd6Zo_BHOrDv2tMxBh9cmMvkqem3Q245w@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: tzmem: Use DO_ONCE_SLEEPABLE() in qcom_tzmem_enable()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 13:27:09 +0200, Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> said:
> qcom_tzmem_enable() is called from qcom_scm_probe() in a sleepable process
> context. The helper it wraps, qcom_tzmem_init(), calls
> qcom_scm_shm_bridge_enable() -> qcom_scm_call(), which invokes
> might_sleep() and later acquires the qcom_scm_lock mutex via
> __scm_smc_do().
>
> DO_ONCE() takes the once_lock spinlock with IRQs disabled, so invoking
> qcom_tzmem_init() from inside DO_ONCE() runs a sleepable call chain in
> atomic context. CONFIG_DEBUG_ATOMIC_SLEEP=y catches this on boot:
>
>   BUG: sleeping function called from invalid context at drivers/firmware/qcom/qcom_scm.c:334
>   in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 49, name: kworker/u16:2
>   ...
>    __might_resched+0x148/0x24c
>    __might_sleep+0x48/0x7c
>    qcom_scm_call+0x30/0xc0
>    __qcom_scm_is_call_available+0x98/0x100
>    qcom_scm_shm_bridge_enable+0x60/0xbc
>    qcom_tzmem_enable+0xf8/0x118
>    qcom_scm_probe+0x2d0/0x680
>
>   [ BUG: Invalid wait context ]
>   ...
>   kworker/u16:2/49 is trying to lock:
>   ffffa83e8a485e38 (qcom_scm_lock){....}-{4:4}, at: __scm_smc_do+0x70/0x488
>
> Switch to DO_ONCE_SLEEPABLE(), which guards the one-shot init with a
> mutex-style path (__do_once_sleepable_start/done) that is safe to hold
> across sleeping callees. All callers of qcom_tzmem_enable() are in
> process context (driver probe), so this is safe.
>
> Fixes: 9941fe8a04f3 ("firmware: qcom: scm: Fix tzmem state on probe retry")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/lkml/5ea74dd3-7471-4c7c-9242-c2005312b1ab@samsung.com/
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index 0fd9581275f1..ebcdee3c5975 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -518,7 +518,7 @@ int qcom_tzmem_enable(struct device *dev)
>  	static int result;
>
>  	qcom_tzmem_dev = dev;
> -	DO_ONCE(qcom_tzmem_do_init, &result);
> +	DO_ONCE_SLEEPABLE(qcom_tzmem_do_init, &result);
>  	return result;
>  }
>  EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
> --
> 2.53.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
