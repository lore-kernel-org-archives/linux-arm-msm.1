Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502224;
	b=A2YTC4czh18A0XmtLjhpdvP8CO3f2F1CD+iu2/4b0j6/SqPVwGMrHocu5skN5pAVIIyg
	 nZcreAjH/4SVQGQ9S14LYNmNgJbatNzGkPUQNq02y8nQwPXppk6uqq9TVdswB5dvgTQxu
	 uxc71P/iLNXTARCUcvsKa3EZnmfjvoNUJM+rErEjBXzOOTSMeAXhlBgw+ZUSKlSVIg13s
	 /SIN6DxWPRO+yF/rEUjZ2B/cid53J10n317kVovjzIP3xWQ98kqQcUmpsY1qE4EpiVBax
	 4Aokx6aKLr3cq73wqopeJP/+LN7kNTE8Epvl27W66luJHRrM5pRvFXeukRNtJ6Pl4EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502224;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=sDfwnfFMb7H/U0LG01YBStUGulHQM26pPCTaRK+6r7Q=;
	b=EJIfdukZm3jOTCnCa/XVUpHINh1HwNd8tmmVDVJlsItSmrj2dpspMv7xPfv4bcf9t3K9
	 vcmli4GoSEhzM8fb/iv9Zy1IPerIaXjxTE+x1TXLMW3NMJXhRvtkhjoBWe5vfUeT8mrAj
	 9uyDnwnGB7plGDH6ClQtcQ8spDLu08OOhDt57U/wyyDIWQatwqSvv3OZgut6Ss65iKMEp
	 rRbkoqoy88+XVEea5TNutCj3ZLacnsOxr/iej21nbXeqjnWffTOBKQzwW+9CcbsdSRhG2
	 Tyj/3pQpI4ZmNOLLFS5FW6aFwgBISQWqxPnWlrA519/fvjJmWEJ21PfYsK3qs7PJKTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FfsesGt7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E928606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FfsesGt7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E2D1F000C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502223;
	bh=sDfwnfFMb7H/U0LG01YBStUGulHQM26pPCTaRK+6r7Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=FfsesGt74++87e1PYiuiZqu6olz8+eXc/5ca3xBoiBV0HrNseGvgF+mEMgjbyaUwm
	 /3urQVvJYdqeuAfGj52OJdl74yrRsYI2HqpWv5b2JVx/U/YbCoe5s4ESTKFdUrU8WE
	 Z/ydMSAjjTC5INk9Uwh8pzP4ZevG8nJ+ZnR6u3YnrLwLUKqSu9j2aH0TqFehZTwwuL
	 bVbjp61s2IYymQYrsOo233TB7XGRD92ee3QbUc17zgIIhq03TCkaW9vyOPDKfPMKQL
	 8OBCWqCxuJ3GQuyvUGQr5U6bpL4pLPktM0SX8htUkdJazwOMwBVcaWYeFRJNZ6kUkb
	 Cd+EupBy6yN9g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso2735077e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:17:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzW+QNSUazZus5CjFrr4rXQC5oYofdhaVDV50rLGIEN7MxMOTxohij8Z/ehABDqn8H3jfXwLQDHScuu7kpb@vger.kernel.org
X-Gm-Message-State: AFq9FYIHRn/n8jRSQ84jbN6SGgTwf7VN/3WSpWjt4S/ADPjJF/AVMd//
	uDrF5XYvHc1lXQ40ClkkP5qH3AKSAtTlq4RAViwkiEY2yELgXo387EbjVazSiGm1w3vhdaiKnlq
	iXcwM16ReMlS4eaOdtDccX7W3GADAXqZkmsgFAa/AFA==
X-Received: by 2002:a05:6512:60c:b0:5be:516e:5728 with SMTP id
 2adb3069b0e04-5be516e574emr2125370e87.32.1792502221841; Tue, 20 Oct 2026
 06:17:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:17:00 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:17:00 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261017043605.1503563-4-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com> <20261017043605.1503563-4-shengchao.guo@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:17:00 -0400
X-Gmail-Original-Message-ID: <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
X-Gm-Features: AclHuK_k9lO_i1S3i6iGAOndmTvxczShpEE6soiPBepKsGh7JYvDFptjfrC8dpU
Message-ID: <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] gpio: shared-proxy: Drive the default value when
 no votes are cast
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Oct 2026 06:36:04 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> A consumer that requests a shared line with GPIOD_ASIS never calls
> direction_output(), so def_val keeps its initial value of 0. If the
> line was left high, for instance by the bootloader, a later
> gpiod_set_value(0) from that consumer matches def_val and the proxy
> treats it as withdrawing a vote it never cast. It returns success
> without writing the hardware, and the line stays high.
>
> The consumer has no way to tell. Its request to drive the line low is
> silently ignored until it first votes for high and then withdraws
> that vote.
>
> When the requested value is the default and no votes are
> outstanding, write it to the hardware instead of returning early.
> For lines configured via direction_output() this is a redundant
> write of the value the line already has. With votes outstanding the
> request remains a no-op, as the line must stay at the voted value.
>

Wouldn't this only matter for a line requested as-is? We could avoid the
redundant write if we only did it for such lines instead of for all
unconditionally.

Bart

> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/gpio/gpio-shared-proxy.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> index 24241c981df1..456a3c3dbf71 100644
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c
> @@ -81,9 +81,16 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
>  	}
>
>  	/* Desired value is the default. */
> -	if (!proxy->voted_change)
> -		/* We didn't vote for change previously, nothing to do. */
> +	if (!proxy->voted_change) {
> +		/*
> +		 * With no votes outstanding the line should be at the
> +		 * default, but a GPIOD_ASIS line may have been left at the
> +		 * opposite value. Drive it there.
> +		 */
> +		if (!shared_desc->votecnt)
> +			ret = gpiod_set_value_cansleep(desc, shared_desc->def_val);
>  		goto out;
> +	}
>
>  	/* We previously voted for change. */
>  	if (shared_desc->votecnt == 1) {
> --
> 2.43.0
>
>
