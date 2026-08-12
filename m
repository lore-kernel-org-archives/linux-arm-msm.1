Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360293C5837
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523729; cv=none; b=JF1D8M6OPms3B8dfdmSxjLq6/EF3h9KkXn/u18XWFB0FkFD6N+/4vkdlJh1OXyFjuaKiduxFjQAyNZeW2IN5lcNXcQAHnhQk4s/AKK3KEaUDstc/hfnqRcjP90l/7wcxfH73nZg5C8gzg8cB3ErHH9K5fnlSslYkGT66AepMgog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523729; c=relaxed/simple;
	bh=sfM0Q9yvam7vJKzIzBC5V31XobNOFN6MyervKypnVnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGr8pqF04M1EM/mXRpBsvx9pFfdND/VwOCYVh91BCbvJI9kevmfHG2mp/z3HcucfyuEjysgwraT/fDCax1Tt9y0V+f6StDSfKp09RN8fTPUgAUsWA07hg//CyJy7dcps+4gtEZC1JCtvmX3Y2H9wEXpJPcbxEzYcjUc1jS6No/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com; spf=pass smtp.mailfrom=ferrisoft.com; dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b=aZGu/s1h; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b="aZGu/s1h"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c20363107f4so65476066b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 01:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferrisoft-com.20251104.gappssmtp.com; s=20251104; t=1786523726; x=1787128526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SRz8d2LTz7ANuvcE3cpzl7cgImiMYk6eSb5mmpK68cA=;
        b=aZGu/s1hZDUpURDOYrx2jRYTvrAilWJD+djzQ/NeeX0LdESO9tLlORJmk/qee++11S
         kH7D9UkrCfm6x+dplwLRucIWr0gCIST3ijto8ZlCEmZXxQm6sZfArYTv6rSlgtbuZbNv
         GIcpqMG7kFsAurCLQ4a5To0/eyPHeR8ufecDZozs6/rp+NhXoll7nHwSfWUBYe8DMen1
         5F0zp//EDIcSoyL41uBwgJLsxmLVM8EMajLO4Nwv1ndDFZP9s5kAXYKL1/uPT5JiRdrI
         h2VIcbZU5LcH1olkoIhp/qVFEfaQG8DqDSltjWTgxt5WxMzjAGGsNnfjbfpOABI8fM54
         qfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523726; x=1787128526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRz8d2LTz7ANuvcE3cpzl7cgImiMYk6eSb5mmpK68cA=;
        b=cPnA+tGco884EQ/3/AVc9S6hz/bsKVrl2sy0JHvpOMZyK0NNGjqalOPXnOLQ+nLJxu
         fTvCIL0rdBzDYm9hXTtsJIK7l3PWoVhvWtwIgB9mx00M5tQjV6jw69dFgFoykZ5FkwYu
         H1unm73ge6FreYhXSxYVIfbkFoi/2DnzbHhxL9lS0lRzIdcuUXuqG+rhrQaPmP4wzc0g
         BK8+f9BLmYUCOZKzAOrDP2Ed7oxWyG2g4OoQuq5oVP/fFBfgUVT4u8YhRGVJ+Z1iprWj
         BmpwObvrmDWXOooj0VW3l0zWIGhSZ3rPJBMMpKNvnza8uAn4IU0J3V20RVAkmd8uJy12
         Nv/w==
X-Forwarded-Encrypted: i=1; AHgh+RpnoAAs6vwW9mSCdb0b4/8rPb46cgczc91qcKPNaEZTOo72428jaVX2yALJ6yTzenskX5sBmSSlkdSUNjAH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx90/UBiaA2VgXr0hw0e/qgQc9zyK5KByAv0n9XD/KPGZlekGHw
	H56bRb+749jPDxznCfjhHKJmrPntjHcQWcwDogyKEfCMdxVsbusVEfs9sGAEfug7zIol
X-Gm-Gg: AR+sD13t6GowLvvTnQiYUosp2H9DyWroFZjhA1b7jk4mA0gtLCOPio2dfHILVdH9A4K
	TMHh1zfHWWKaj5AUSQePflw7rPB5wnz7dpuOOyZiR1rUA4k1aAiQbgX8istM3N/vvE8Z5PercRJ
	rqMkElOa6D4O39+YdarL0i6Jbw5lz330Y4NbiKS8NYm9ytj48JYxhlBGKzuigHh71tYWUz6av4B
	/OjSXQ1tNV15aHAG4E4gNClh/KtmHgSlg5K6whXWrIMLjlArFxgJWTRLRT+En4lkGdv/sf0bB9j
	bTbhBpuEuWnhsvrrjmayO6rhcb3xR+4YDeUe1LjPDGKVFAVcexc5GhWAGSWw5cmJQrdSDSeIGeA
	Q3Anp96yvEnpIZbydj7CCQFFkS1YSkR3Dz6o6P+gh6cJZDhiAjg1ywX73mUEGia7Z7SPPOzrtUs
	fPjGgH5fy53JRjZ6K/uRMw/9V6KHuYsv8yQehZMui6H2LNew1EAAqZOlBye+5rNLTnpyaJQnlVf
	Uw1nkd04ot8aV+C
X-Received: by 2002:a17:907:9616:b0:c15:f65a:43a8 with SMTP id a640c23a62f3a-c20f2e63327mr160127766b.12.1786523726105;
        Wed, 12 Aug 2026 01:35:26 -0700 (PDT)
Received: from zenbook (45-11-61-69.ip4.greenlan.pl. [45.11.61.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20f0749337sm64174966b.7.2026.08.12.01.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:35:25 -0700 (PDT)
From: Greg Ociepka <greg@ferrisoft.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: glymur/UX3607OA: usb_1 SS root port fails link training with hubs, trains Gen2x1 devices fine
Date: Wed, 12 Aug 2026 10:35:24 +0200
Message-ID: <20260812083524.775042-1-greg@ferrisoft.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On the Asus Zenbook A16 (UX3607OA, X2 Elite Extreme), the SuperSpeed
root port of usb_1 (a800000) cannot bring up a link to any hub, while
the same port trains a directly attached Gen2x1 device at 10 Gbps
without a single error. The same hub works fine on usb_0 (a600000).
Under Windows the port drives the same hub normally.

Kernel: next-20260730 plus your A16 series and the three later glymur
fixes cherry-picked (e78c5e9d79e3, 5ac32106d3c2, 1b0b6ddd0299), plus
the USB vote patch I just sent separately ("arm64: dts: qcom: glymur:
Add missing USB clock, power and bandwidth votes").

Reproducer (~20 s): plug a USB-C adapter containing a SS hub into each
Type-C port in turn. Ours enumerates as Terminus 1a40:0101 (USB2 hub) +
VIA 2109:0817/2817 + Billboard 25a4:9321; a VL817-based dock shows the
same behaviour. No monitor attached, so all four SS lanes are available
to USB3 on both ports.

  usb_0: SS hub + downstream devices at 5 Gbps, clean
  usb_1: HS half of the hub enumerates fine, SS root port fails

Interestingly the failure signature depends on the CX performance
state. Before the vote patch (CX aggregating to SVS), the SS port never
reaches U0:

  usb usb6-port1: Cannot enable. Maybe the USB cable is bad?  (x8)

With the vote patch applied (CX at NOM while the controller is active),
link training gets further - the port reaches U0 and the failure moves
to the first control transfer:

  usb 4-1: Device not responding to setup address.  (x2)
  usb 4-1: device not accepting address 2, error -71
  usb usb4-port1: Cannot enable. Maybe the USB cable is bad?

A directly attached SanDisk Extreme SSD trains SuperSpeed Plus Gen 2x1
on this same port and transfers normally in both configurations, which
is what makes this odd - a marginal link would be expected to fail the
faster mode first.

Ruled out by measurement on this machine:

  - master clock rates: all three gcc_usb30_*_master_clk at 200 MHz
  - TCSR_USB4_1_CLKREF_EN: enabled, hw gate on, 19.2 MHz
  - swapped vdda-phy/vdda-pll (the glymur-crd issue Mani fixed): this
    board has them correct (0.91-0.94 V phy, 1.2 V pll)
  - DP altmode interference: no altmode entered, Billboard shows up on
    both ports, DP-1/DP-2 disconnected throughout
  - USB_QUIRK_NO_LPM on the VL817 SS half: the quirk never gets a
    chance to apply since the SS device never enumerates

The one asymmetry we know of is the QMP PHY reference clock source:
usb_0_qmpphy takes RPMH_CXO_CLK directly while usb_1_qmpphy takes
TCSR_USB4_1_CLKREF_EN (per 12c97d1c15f9 that matches the HW design).
Is there anything else that differs between these two ports on the SiP
package that would be worth poking at? Happy to test patches or gather
more data - the machine reproduces this on demand.

Thanks,
Greg
