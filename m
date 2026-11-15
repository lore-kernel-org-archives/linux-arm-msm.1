Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782052;
	b=h9eK3zro54iaa71D8nDyceb/EwcUVOFXWS3MXu4xxO5sXe2KqKU9d7YoOug611fqVkFy
	 jAbh8xbRyS3tUWVwG0zI3VuG1zrYu/Nwl/2ASDrjwtfbIr0HthrJ+WN2u3gfDx+IOz+V5
	 XA8VLAdLNgNHFU7sjeHn5uZtSLNlUBlRQ217u0Hi9a9zEo9yWoJ9LlM9X+dT/LPCqssO6
	 8unvrxmQcnYqPOAykrInHHDK8aKEtHhTYMqm5DAfJFRhOd/BK7qYbofnlKcgNMneKifWK
	 rKkrujIw8SfeYCE8EzrLHsjTvG0UQFX6UiJ3sIrcOZBiYwNjXcGmST8RdiRqSkrDi7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hLJ6bSKi+ZgPvgTZTEL6AiSyPJLqudm0XPJJoELWh0Q=;
	b=Onb8clusqWNoEGgixZL5YgekyhuBtKApyJg63fDfvHnKdcQkDfQ4HdZs/c3fMuYz3ViA
	 E3ImhiJmq72k8ByQY00k9aTOrrk3e2syEOXTkJBYa2pDyDIX5SDcz5IEYjC+KGLMRcG4M
	 GFWGlpH/A0SxId3tyvJIYsSW4pPa5RATmCEwln6GQU+Ivqzyqa5PnzvPmJ1f7seayDqmg
	 RlLZZuZxu3g6bs+gV6Fo6RJN8sf7wsM1TIbaYThhWsICTR9SegsLVbvY9Yb1BUKDuSAE5
	 QKjzCHwXBqHaA1/XjRT5jcguRo5KmwaP0zU6lK8+kI5ymVqVY6pDLCVubOi5wWPP5Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CJd3QEEj;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36392606A333
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 22:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36392606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CJd3QEEj
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb61185057so9238955e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 14:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794782049; x=1795386849; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hLJ6bSKi+ZgPvgTZTEL6AiSyPJLqudm0XPJJoELWh0Q=;
        b=CJd3QEEj8pQwODGjB/Hvsm1Kz8XiytWNDpUjUiysP8iwPosQ6yW3gdLOLRH20X4Owa
         0JtLC5im59ZkIs5S3uiF2dyb1/b0W6sEAIXxh3hqmTeNyMKe7nwPlu17c/gf4iAu6cBU
         4y0sp2DgHz6LvxI92R/65FyuHGltuJnCbV89+YgAYch/er4OOAO4xTog7mzZDiYoN7/w
         sRBEaSqnhB/VU7CFPMMVnakJq0S5UBmp9QqWpa4hHjWni9z2K4sonGaN/XYvwXyXKbqW
         15MumIhxvuJhPEyRyEbNm3tCt2dmSbs/6BsQifBNlgTCuSlf+tnV/IyEeqPPeVV8jLc3
         /sOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782049; x=1795386849;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLJ6bSKi+ZgPvgTZTEL6AiSyPJLqudm0XPJJoELWh0Q=;
        b=q9rV7bqVu8uuPXudo5nhLh2Xjclv0IGKeqH5bdvKtLjtzXZF7xaPT91KGejWSPnMAN
         JC+UH2NaxLRbDqkTSXT231oljormliVbllM47HLBaP+SE+cNChDL0NTTPECZPeA237fj
         D5Pz1Mwlz3QNlvNbdvtZ1LuDsxCeAUl42SpKOr9uAiOkKfKm3YQW9+znErZYTSDvV3yw
         4AH9/yJL7GfJ/Xf34c9qai7aXsk6TG3M2VXeCjeWe3x33MyMoPUOZUZNXk+vV30ZIOBD
         Q4/PPkGSRDQQQ4Q1NP397hysqQRhJFqYA4tcvMx/zsI2QbDgdbP9I2ULJwKyOINCICiW
         skpA==
X-Forwarded-Encrypted: i=1; AL+hErHXMOodrGI9kKYGc59a/uKkZWQ832DqKNWWZTBKGxkISJ4AhLm8vKHcWuCIhqkXiGJk8vMGl8jBYHWkBIZp@vger.kernel.org
X-Gm-Message-State: APuU4Z/J3qLwe3k6ANXpMXlFzYIav9dLajMXxqdncu5zd5dTJX0wOZZ5
	AFwOEBNYh4n4JnDpdLYuRF/Z9j6CX11i57YTPCvI3+yJhR6wl3pTRcY2xmJosmQPXAM=
X-Gm-Gg: AYBFou0fX5/gEpLr/w5OisSnwLPbnpsfZmOMOLXmUIdrzqdLuuHlQBZ7av6vBO6Drq/
	eXE6rr6JryTcXp1DTedgieZ+zMD2GKlZWOMZ/Po/hkJFTKDrJj6oqg0QlfDnykM6DQv+N3wM9RI
	lTL50WmvjyNQg4fUnq+hO6pJDZogj7Uh9qdXUui9Lv6+ueXQUOJBf+SnjbhDGEwUzp0DU95mUbr
	SgGxMYcVdu4miEXTxkwt9zJDX2dKoczT9I6IPAqZULdPURSSyqS78+YDBogCz7p9UQPKXy+omKC
	51oktFqp+3WSSgbHxypIFYAWZMxio/whFvUOipNJ9UUf01OFpX77CF50vsOu9aNhHJDB4E1nvYE
	ZdoH2o7pZKQRByjWe13tPpzb0s79dVN37aSf6jk2rN75zIoBTiU/H3o1qlI3YvBKFl8I4NmG+Gd
	e+v3uAUDK8RzLQf8cbTF4jmgfqpHEtzmnFgd53RVkFwmv52lbq/CD76p1cmCOOFiuvOIahqms0B
	jGA+c9Ji8hB0m/7Pviidh4WR0fmcHJDyCBOW6sWtp/+qkdSfA5VO+JH6yq9Ypvz91wchFaKW3VT
	VOugzHTptWBmKBVuCJyKSy+QmS0TrHTVvcDneqXCZeiMTTTi
X-Received: by 2002:a05:600c:3e0d:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb6f413bfbmr46240405e9.15.1794782049461;
        Sun, 15 Nov 2026 14:34:09 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55acdfebsm222898225e9.7.2026.11.15.14.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:34:08 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 0/3] clk: Restore the clocks of a provider after a
 hibernation
From: Jerome Brunet <jbrunet@baylibre.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
References: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 23:33:56 +0100
Message-Id: <179478203647.13037.1560944178171749849.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3673; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Ig1JMbXRCmJfdJcT1sGueTmWJmoPRP4AdJybNvm12MY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm/jCPjSy54XHH/JcHw7lbPogWvLvcvvvPHcV4z5/k4g
 23ccZ+mdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAiOxIY/keyTtq72s/setcz
 ngy5rDnH4sWbDvWxb7S9uny2/2GP1Q2MDE/Lj7BLzb3MN1Oyfb9IzkeXggVrTYRME/cLcl+U+V/
 GzAIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> When a hibernation image is restored, the clock hardware has been through
> a power cycle and a boot kernel, while the clock framework in the image
> still holds the rates, parents and enable state the consumers asked for
> before the image was created. The consumers ask for the same rates again
> when they resume, the framework sees no change, and the clocks the boot
> kernel did not touch keep whatever the boot firmware left in them.
> 
> Whether the kernel that loads the image probed a given controller at
> all depends on whether its driver is built in or available from the
> initramfs. On the Qualcomm Glymur CRD, the display clock controller
> driver is a module that it does not probe, so after the restore the DPU
> runs at the 333MHz the firmware configured the PLL for instead of the
> 717MHz the framework believes it runs at, underflows, and the panel
> shows a solid blue screen.
> 
> The first patch adds clk_restore_context_dev(), which re-applies the
> cached state of the clocks registered by a provider device, parents
> first, as an alternative to the global clk_restore_context() that
> depends on every clock implementing the restore_context operation. The
> second one adds a hibernation restore callback to the Qualcomm clock
> controller common code, which redoes the probe time configuration and
> restores the clocks, and the third one uses it for the Glymur display
> clock controller.
> 
> Sent as RFC, as the same applies to every clock controller and I would
> like to know whether this is the right level to handle it at before
> wiring up the rest. In particular:
> 
> - Instead of programming the cached state into the hardware, the
>   framework could read the parents and rates back from the hardware
>   after the restore, so that the consumers asking for the same rates
>   again go through the normal clk_set_rate() path. Would that be
>   preferred?

I would much prefer this approach. IMO, we should not try to restore
the cached values. There is no way to be sure we would get it right:
the HW may require a specific sequence to reach the final state,
intermediate values, timings, who knows what else! I'd rather not go
down that path.

Consumers know (or should know) what they need, so they should release
their clocks when suspending and request what they need again when
resuming.

On the provider side, it should just resync with the HW from its
.restore callback: re-read the parents and rates, a bit like
CLK_GET_RATE_NOCACHE does, as well as the accuracy, phase and duty
cycle, and re-enable the CLK_IS_CRITICAL clocks.

CCF should provide a helper for this. It is likely going to redo a fair
share of what __clk_core_init() does. The prototype could be fairly
simple, something like clk_resume_hw_sync(struct device *dev), to
resync the clocks registered by that device.

> 
> - Programming the cached rate of a clock that is not enabled may not
>   work on every clock type, for example on an RCG whose source is off.

What I'm suggesting should not have such problem I think

> 
> - The Qualcomm callback finds its state through devres, which only
>   covers drivers that call qcom_cc_really_probe() once per device.
> 
> Clocks left enabled by the firmware but not by the framework stay
> enabled, and the phase and duty cycle are not restored.

CCF has no sync_state support (yet!), so the unused clocks of providers
built as modules are never disabled, even on a normal boot. You would
not be creating a new problem here.

Anything cached needs to be resynced though, including the phase and
duty cycle, everything else.

-- 
Jerome

