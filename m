Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585549;
	b=4Mkw9G+4wZwVawUfav+Yz7VQaX7G/AXIJjPLSbQaIgcP5uGnSpHPP6lnGNRSc8t9mkXX
	 BSadn8IguY+HDLj4wiWXT321+duYZhPUeRkk5zs6vDGYr6BqRLJZSbZlrEI8vvSz1755v
	 p7NS8HIDPNtO/ToTOUuS00X2305uvV3SFpsrK70GFOJKUWgwexUVa2liUhlofZ0i39Ose
	 bciJ+H7nsU7+Mjkli1LZrDHiTFrKLlpvQ8NVf627PGY/HG7MZ9dEnr28GE8pHvK5SE0Qh
	 5roFZ3wHnG5mH39cNAsRxLhXRt3DXOk+/YkaH194iB1tkOfixRyAmbh8z5+NkM/cX0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=tw5g1r1nRIeROllP7HVmms/FbIqd5DbEqN/vD2LQLR4=;
	b=rRMC1FoL3CmFsbsl6atAM8BoECqvx4v1/+0epicXDC+5c1nqvbpOXN2M4OLOeY4Yd4mI
	 lQoSV/06wEfS17fzYZyXgYqlhbIZISKlCr+0m2daAyWhMGHzSVRnsBDxGAM3b5KpICubG
	 yMwK1La9QT5K0x2/zkDlDvOYRpHqqaErfyw2B+ZxZNCfTBVxPSPnO03ZinrBca/q/zkhg
	 lAIKHdiHwA7w0UMNzE7zmO02cCCZJr0c+57eQrvjzUsevWLJefLIV2I6QNeW0sTuQ//X1
	 opAt/FOFTZwAa3bQ8w+WShPoaeE1f2X551V5VpejALkY7AHmBUbVpS8E5WQWbSbN0kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h0QJuRcR;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31BE606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31BE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h0QJuRcR
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso6419005e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585547; x=1793190347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tw5g1r1nRIeROllP7HVmms/FbIqd5DbEqN/vD2LQLR4=;
        b=h0QJuRcR1wIpBgBWmFyNpzP/7+EphSWfN88IpwgTjOS8HoKxKWlLkOdE79LO99kEAm
         Tf8nYbzJO5wUgFTFa+McC8WDh9L5aVbr39Z/Oo6wUVT2da0sM6gMX+RM9GNLEL/VYDMZ
         J5GfkZYm+GWvRtlqSGewn2/QsNJq/ww5CnTMP6GMHWA+tJ+L/kbLcGkke2BKglRs554P
         +z5ILgZT1SUnyrsWpsKhKIFPKK6dH85WzjCebGgWEfZxK3WpWi6+Te9Aionl5bTDlOCj
         uA0ofWyktva1x19hA1kuJg3N6DCpI3XBLJT63NdeERg8dS1lSbbEdxP0OgyCfmeqjCVV
         tTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585547; x=1793190347;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tw5g1r1nRIeROllP7HVmms/FbIqd5DbEqN/vD2LQLR4=;
        b=NaKYdA/cUhZMkjOAeZ5eep1uRiXmhiujxd47LMRYQtzMki+ZWzLnrH4V3DvC5R+8cJ
         1hKctvDXTo+eSDWiRIfynjOKf5npwz+SM8KIgW1UGobJDICQk5j8bSXf8EGKhio4+zzO
         RMmDVdzH+0VLuQsytfYW7huVwmy3qo4xGl7yOGHoutcXbAnI4uN+wrSKiiKpjow0E5R5
         rdCTX21ZxLWC1Kym8x2RMENWRxFDrDuDjCriCgITONgo8fWHaqkhm+JR/3VZTsCpLpnn
         GVOGL3Ukue7UWxPEOaW4X9QQwC0kFVpeHZFPc54lY1X5sxHx0Lz0uPGge4OHKfi0Rd5Q
         Hskw==
X-Gm-Message-State: AFq9FYKWbVo4oFno7BLN6bzMLoPis86hpKhuYPIsiUYUEYGb0tacMkt9
	xWgDbTHsSQ3Xv7MdpZzaqDBcsvP3TvgDjCpT+xBGJliAOl7G0veKbEsh
X-Gm-Gg: AYBFou2hQB/5bpcVjsGRnntMVMczlGsEjxaQz52Z9G+IbYIKVAZ9eYey7tpZeTyQ4Ay
	l3odQT24fOs7Ko/lindW8ixae2QS/OonuIAlmflqXaAglZ/A3nwgM3zG5ZrVc76XG8mW1nxC02/
	6Fn7syXjzVlBNCj3cfr4NOGexvMC16MPU41mOzKxLN08O/2osNZebnijTJYEiz1XS8NnDjig6ue
	6bzVjPWyJ4rESBbSUjEJ4YBpVBw8w02twlB6BtWycxsFUraj2e7CL0wvfiwNaBRteTIPQxErVDk
	UpxJpBmnuhL4MgGbIh0OTNkxrx2n89XovpLrD5LOzXJZKNcK6G6+03crSVyIgRDRY/y5N2h6+CJ
	NKMuyYvNPv/zAeKcw/mH1XqlKir33nmzVjDjPVb58jMvXZayU96MaKzSOL7ORh4g05ORPd7Pnee
	8wexafakEjMjQ1Cv937unJNdOl+33SO+9Nu0s4SZa4Gz1SEC4/VhIucFKpScTwyamVC5YyTLj1x
	fMIlrHIw/peAZGCTbKEFClZ/ctNqGNBIflJxBQ+SQyOKAqtmFM2g6kbRilaz63u215ug4YnPSnd
	xFEd8DNn2pUeR59q
X-Received: by 2002:a05:600c:34ca:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a1fdd39e68mr40596705e9.28.1792585546664;
        Wed, 21 Oct 2026 05:25:46 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1fb698ce0sm80474875e9.2.2026.10.21.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:25:46 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] phy: qcom: qmp-combo: check qmp_combo_com_init() in the typec callbacks
Date: Wed, 21 Oct 2026 14:25:37 +0200
Message-ID: <179258553740.5769.1577871699525688695@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <90e14985-be2c-41cb-be74-60ca1829322e@oss.qualcomm.com>
References: <90e14985-be2c-41cb-be74-60ca1829322e@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Static, as the v3 cover letter says ("found by inspection. It needs the
bringup to fail"). qmp_combo_com_init() can only fail in
regulator_bulk_enable(), the reset assert/deassert or the clock enables,
and none of those has ever failed on this machine across several hundred
boots with the dock plugged, unplugged and flipped. What I did hit is
patch 1, the "already disabled" warnings from the altmode worker once
runtime PM is allowed from userspace. That log is in 1/2.

To see what Sashiko's scenario actually does I made the forced bringup
fail once by fault injection (return -EIO after the reset assert, i.e.
the com_init() error path runs: regulators off, PHY in reset) and flipped
the dock cable. On next-20261020 with 1/2 applied and the bringup path
otherwise stock: dwc3's phy_power_on() immediately reports "phy
initialization timed-out", and from then on USB3 and DP on that port are
dead while USB2 keeps working. Unplugging the dock runs phy_power_off()
on the unpowered PHY. The writes are swallowed, no SEA on this SoC, but
nothing recovers either: a replug in the same orientation never
re-initialises the PHY because the driver still counts it as up. So no
panic, a silently dead port until the next orientation change.

2/2 doesn't fix that, it only stops the register writes in the callback
itself. I have a v4 that drops 2/2 and instead stops the Type-C
callbacks from releasing and re-acquiring the regulators and clocks on
every orientation or mode change. They only reset and reprogram the
common block, so a failed reconfiguration can no longer leave the PHY
counted as up with its power off. With the same injection on that code
the callback returns the error, the PHY stays powered, and the next
Type-C event brings USB3 and DP back.

Konrad, do you want v4 with that change, or .. ?

Oleg
