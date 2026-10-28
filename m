Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179374;
	b=yuFJgUphjsh4rBiz1w6rKcQHknm+qumHxluzm2S+HYSwrp0xGc2+vHm8e2DHYwiylfnL
	 n6FQ1EHQ5W5tzNUm3KdK1ySxFDgZs8BhntHlCpEyyRgMQ8Tdzx3X1gUgrayNHtrxpPIbs
	 0Ry6FVUxzx/1+xfonGiETduYwYdUuv+czsXrkR6HgDdAGYJpUWlFS0yFSnf37QildK7GY
	 1yJR7KFTsylByu3YppXJcCwX6eU8KSCm9cml5bFgKHvoFwFpLfsx2QxgTOvS/shKGc2n3
	 KJOVGlc2bsnAYiUuUylvr580TYHtLD7GFrpjaySjoG0Ohu7tU37mfx2G5+tr3yFHJGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179374;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Obd6DBT8X0xh3lgiYCV38ulNGq3OGCe1QiMxMC6hx3I=;
	b=bMC/vvY5EIqiY387g+nb9ZTUzMYn3+r6OPunN1dDvPflf86hETGHKQOpcgoIIiEKCYxq
	 gmcgvTuc9volSxfAkFCoGdui+IL7d1FYBfh38hnbA2L9LbPBHkI4GSOzfPBsSgojfuM9C
	 SHJOclJVrmiTczvMZ7MLJSGrwpFbsSUjut4UBPD/DvN5DAl7ro8wcbyjJ7EYTMkCcANEI
	 V5VSN3B1me46w5aVPI7xCBUgDM2knRu8IWE1KD+FR1tDB2HI/Ye2DaXA30EYOnKXZkWlK
	 BDfR3COwghoPkdfvgb9F8K73d1KksNU25wJMQHJlRJVC+1687x5pTXLrQ0hgsIqXz0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aQIBYwy/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BF8606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aQIBYwy/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62291F031E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793179373;
	bh=Obd6DBT8X0xh3lgiYCV38ulNGq3OGCe1QiMxMC6hx3I=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aQIBYwy/m9UrJS4YAHUhYXzzc7JVpTAKhtcJ9R9jNbXz9LZRAm+3AlgXt9jfxd7Gd
	 L5aSNBr0EUWE3OavMSrTNK0kRIrwww4bUc/OD1VgUUceUz4Bfn/N/emb0uc1yMs1Pe
	 Cwr2WYrxCSHGoPdhFStgkvxsIuSfZcSCPUOtkgW4jZkCpIrCacIDNlOYBh1GoSHFUr
	 LGF3TJ69TjL2jxF+/OCpvmPBhcaDQxGQ5csUNSMUgMhzYCr+kg4l2HIJ93kb411UXT
	 Hdf/cuRKKnDtxoBJ+6m1GQKfVbjnqb/D4Y/RbQ6ci9E6fV8GUfaa8q8MiYIB57TpKQ
	 rno1OHKrDA6RA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a49a022221so4310361fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 02:22:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByRht6R4iRtj43JU+iezEVZhKT7aiYij3IYikB26x9Z81nxdFQ5Zif+gIN2LxUkBTloRrXE8V9celH6ljmc@vger.kernel.org
X-Gm-Message-State: AFq9FYJlVDiKhiCB5CAzeNWQVaPgDID82S4aPSFa+2cCrl7UARV34aJ1
	FSDhv0S/xTpPORaK+jweV2+dX5EukyiEFxyrEjV9kuqxACnFByvvTmGcZwv/GNnKlN611UUoSmC
	dmXWI/EVS+ZFneLGb8TJQ/1H91BhhMWbIUxrvwLeh7g==
X-Received: by 2002:a05:651c:554:b0:3a6:6f81:1027 with SMTP id
 38308e7fff4ca-3ac9cf92016mr3387891fa.24.1793179372646; Wed, 28 Oct 2026
 02:22:52 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:22:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:22:51 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <auGdrYC_mZeJft0q@QCOM-aGQu4IUr3Y>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
 <20261017043605.1503563-4-shengchao.guo@oss.qualcomm.com> <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
 <auGdrYC_mZeJft0q@QCOM-aGQu4IUr3Y>
Date: Wed, 28 Oct 2026 02:22:51 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf1k4ZKi9L+UVshuQnbomJAPV+jPR1jgH8Q2QWnMbqOVw@mail.gmail.com>
X-Gm-Features: AclHuK_dZXUibCWs0t-BhTAf_ntpzeX3ptAFBulw6eXjtSP7RPvDwHaWd5jEueY
Message-ID: <CAMRc=Mf1k4ZKi9L+UVshuQnbomJAPV+jPR1jgH8Q2QWnMbqOVw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] gpio: shared-proxy: Drive the default value when
 no votes are cast
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 08:01:01 +0100, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On Tue, Oct 20, 2026 at 09:17:00AM -0400, Bartosz Golaszewski wrote:
>> On Sat, 17 Oct 2026 06:36:04 +0200, Shawn Guo
>> <shengchao.guo@oss.qualcomm.com> said:
>> > A consumer that requests a shared line with GPIOD_ASIS never calls
>> > direction_output(), so def_val keeps its initial value of 0. If the
>> > line was left high, for instance by the bootloader, a later
>> > gpiod_set_value(0) from that consumer matches def_val and the proxy
>> > treats it as withdrawing a vote it never cast. It returns success
>> > without writing the hardware, and the line stays high.
>> >
>> > The consumer has no way to tell. Its request to drive the line low is
>> > silently ignored until it first votes for high and then withdraws
>> > that vote.
>> >
>> > When the requested value is the default and no votes are
>> > outstanding, write it to the hardware instead of returning early.
>> > For lines configured via direction_output() this is a redundant
>> > write of the value the line already has. With votes outstanding the
>> > request remains a no-op, as the line must stay at the voted value.
>> >
>>
>> Wouldn't this only matter for a line requested as-is? We could avoid the
>> redundant write if we only did it for such lines instead of for all
>> unconditionally.
>
> It also matters for a line configured via direction_output(), after
> patch 2. When a proxy releases the line and restoring the default value
> fails, gpio_shared_proxy_free() still drops its vote. The line is then
> at the non-default value with votecnt == 0, so "no votes outstanding"
> no longer implies "line is at the default" either way. The unconditional
> write lets any remaining user that sets the default bring the line back.
> Gating it on as-is lines would leave it stuck there.
>
> The proxy also has no direct notion of as-is; it would need a flag in
> gpio_shared_desc tracking whether def_val has ever been written to the
> hardware, set and cleared in the init paths of direction_output() and
> direction_input().
>
> The write itself is cheap and rare: it only happens when a proxy that
> hasn't voted sets the default while no votes are outstanding.
>
> If you still prefer the gating, I can do that in v5 and keep the
> free-failure case recoverable some other way. Otherwise I'll add the
> reasoning above to the commit message.
>

No, that's alright, let's keep the write.

Bart
