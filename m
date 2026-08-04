Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542E23876CC
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 12:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844826; cv=none; b=r9ek6ahqR8cXDMz8ZBS+nYcYjeGSa7l+TUKuLP4wsLebLCZ4TU2wKCwPSe2PAFLY728qaEVDGrxngH9rgdhO5OTenomqQ1zJdo88Y827lthW2NOJW5z2cFJExPHjEpv+imz2eO8M/3fzw/EuNmVf7ioyN8enoBZZWK3+t1cTudE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844826; c=relaxed/simple;
	bh=Y1IZ3brM08v8p2grI16N93TT6dsj1XYGzO1ReHQpQ7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9UKWfx3mKl/Qwi5CW4ksI5G7LtS9+LAvoEZ3XpzTjEh/HqF3NCY55KKX4Lq6UAVSnY4bwu6taQ/l1xAUfpIsIoK7asO+0td748tSL6Sxe9BgUsaBKvFjBjtZLh7lyHOPMEA5cGubCP3I1eBRlgF1o7R5L3Bx8d99DEhRJxfnec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gv5zBkMt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gv5zBkMt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954d29264cso16298485e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 05:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785844822; x=1786449622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1IZ3brM08v8p2grI16N93TT6dsj1XYGzO1ReHQpQ7Y=;
        b=Gv5zBkMtWsJ+Ox/3Q1ahdPkZ/HfY1+8GG04v/zs3yXO5Jvjhrn35cxKRMXilsgY1DK
         +c8JiqzfRHkewyQZqOBcwfbuRTdXLLffqRlS85Hem5QjQmWUnar0VjYwOZhKBpyU6GDf
         vyPuiEGAlirsDT9rsPrZkjn+Aqf+L0PvgBOYwDEMjsYw4uJJ/ErdtlTnA7VbCSTXYfOF
         vc8ls+xD8FO+FBA0ULQ24wOHICZh0NH3PF/cH+8P48Wvj4jxy9rFGFmTBU9MMyRuHOg4
         q0cHAlaKjR0fMsi+jQh27Vla2i0ucbfbj/NJG4tBGZEasQox0ItSNuIqt/4nAoNznFng
         KN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785844822; x=1786449622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y1IZ3brM08v8p2grI16N93TT6dsj1XYGzO1ReHQpQ7Y=;
        b=e/bQpK93ZgNwXbYnKc59T+9s1AdvR0n8buC3/76K4b98NKkj5nwKzWM3gVqP8nEUGC
         zGixy03kHe4mHTCTFhe5PenhN5+04qvNFXsKKz/MT6GknEzWdjDmXKQrOzjee4hl2IE1
         zYbfmn85di7IPY5pTz4Li9ZRK7xuUvp4ni8JldErMwAfATp11rovelRgiV2obS29RFLL
         PAKUR3CixbQGiP5MVsnhnK1yIIFZgnpcJSpIw/nv9dvjqfz7KUVLuvBdlHM0hEI6NBzw
         5Ka0DTEYI5kX96kjQtLwFN8kTW2Y0VktasuMVyHx9yn5lNHBBZuBMkUmpv1AnJHRSySs
         r0Ow==
X-Forwarded-Encrypted: i=1; AHgh+RqBHri6l9p75yqE0g8vizGIEHHrfmFV59RKRIapZjokOL5kf05S2LE9KH8hoeDBYzsw53NM4/vmTyq0bBNl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgt+EbUSsFHqVj49ChHvEg+kRZJZsD8B+4R1AlRzwMq1Br4XWE
	o0sxCWJJAq2wDJit6jVSpzZRACap9sOKxCo7OGnm1rTkRNv9nGddVv97thREi/MP
X-Gm-Gg: AR+sD12KL4ORQ9yDFcZ7a+6ULjU7aQCVayyLHvg1feofARaGNyrlNYicO3+psogEtZW
	ZKBsB23MN95OgSDzNw/oTxisOoe5OkryWTE1yXPjv9BeirOXLrPO4M1p8blWBqqu7IycnKJkG3K
	zHQVoMwVN8fenyFVWLWwmgU8UvweeM6On2ohRsPAFkFR9lFq4kGwB/u3jDkoeKCCz2bu52Qf5jm
	Ezvsro02YjqcAH8OQxxg1F9Hunbs1q+q4tyMDn94SrOnxfXvLkRa/qoBdp3TqzfDdwRyXAgwu3L
	bLPpRxfUmYD0VQtIQEwhDRBZ/kV74XDa/BEW/UhcNAmPuoeY9kwQtQacpVMHH7zUYRJg7yGtvkb
	8B8D0pjTRVDwhgVLchP0j5DPI3ppabtgkNpZ3+W0akVz2VrJYO9ZKwWf+zUsx0eXan4GzeBxF9O
	0+KI1HtENAznTWXp1RUXTk+wOrUgmGAB5M6u8j1T7m6aHBDyUV2K4PoJT4F+5Q1hs++496eRZHf
	4r/JSl8gHmPC+w8L5rtAE4fdTodiGxO2sW2RAA=
X-Received: by 2002:a05:600c:3226:b0:495:3f99:849c with SMTP id 5b1f17b1804b1-4980c6753a3mr190119675e9.15.1785844822328;
        Tue, 04 Aug 2026 05:00:22 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (public-gprs192228.centertel.pl. [46.134.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fe2f4fsm96081735e9.10.2026.08.04.05.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:00:21 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Jie Luo <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Tue,  4 Aug 2026 13:58:17 +0200
Message-ID: <20260804115817.16886-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8af46926-fecc-4396-973e-2290ae285998@oss.qualcomm.com>
References: <8af46926-fecc-4396-973e-2290ae285998@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 8/4/2026 Jie Luo wrote:
> The CMN PLL output clocks do not depend on the AHB or SYS clocks. They
> continue to operate correctly at the fixed rates even when the AHB
> and SYS clocks are disabled. Therefore, once the CMN PLL module is
> loaded, its output clocks are expected to operate at the correct
> frequencies.
>
> The downstream consumer is used to keep the AHB and SYS clocks enabled,
> allowing the CMN PLL registers to be accessed.

Agreed on both points, and they match what I measured: with the bus
clocks gated the PLL outputs keep running (ethernet and wifi stay
clocked), only register access dies.

But I think these two points together are exactly the argument for the
patch. The register accesses do not stop when there is no consumer: the
CCF invokes the driver's ops regardless. clk_cmn_pll_recalc_rate() does
two regmap_read()s and runs on any clk_get_rate() of the PLL and on
every debugfs clk_summary read - the latter user-triggerable at an
arbitrary time. clk_cmn_pll_set_rate() likewise accesses registers
whenever a rate is set. On IPQ5018, where no DT consumer exists at all,
every one of those calls after probe touches the block with AHB/SYS
gated, and that is the measured hang - the boards died during boot with
no userspace involved, so an in-kernel path hits it too.

And note the consumer mechanism only guarantees access "while the
consumer is active": on the SoCs that do have a DT consumer, a
runtime-suspended consumer plus a clk_summary read is the same
access-with-gated-clocks situation, just harder to hit. So having the
provider hold the reference for as long as it can be asked to service
clk ops - i.e. while bound - seems like the robust shape regardless of
platform.

I have just posted v2 which does exactly that, in a cleaner form:
devm_pm_runtime_get_noresume() in probe, so the reference is dropped
automatically on unbind and the existing put in the error path stays
untouched.

Thanks,
Stanislaw
