Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510647;
	b=nxq2WkQYQ5jr0wuSIOuEG1/oVyZTGQnugqkFqDMjtQvxq4slvkSR0xiGdIJCUAy3rs1r
	 MI7fL1Y0Y/4h9ESHnu7poS0Ls5/bTVnuh31xqlw5NyBsrrLPNf29JsyzchzQIfWBcOPjy
	 godVN9fLXKw90z5N6Le0CGcvwmprDav8oX2YUZxcxxC92Lgiq9mCrIHvT0Vj+mqlLhYiC
	 Pw0OMv5zhya+wk881ByadSWq3QwT4csXssB8hI58qpg7/ALascxeF7B/l3CDhoPGXexrW
	 nAJnFzqNUM5ZrWRmcMUhbiVV4LQw5ZH+fpHwH3O0YeCz9ZWyco2hwLi1e322RPGKz/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ldWxVHDgUgQ18jFdtDAJ8jJd2yZcZSUNdb3f55SGTX0=;
	b=hcDzh2ipBT5JLou7G7zn6/8ghnO1kKMzsgaiEwNeAZSNIv72y6n+RSUBuGDeUtwyKq7k
	 LfyKnWtzNAvn3RMcyi+nm4NPpiJuK8kXlV2csKPt+/dOpQcy7KeX7sVTU5DSUf76Qr1sB
	 oDJhYsIZxlay2VFGrYilXmz0VHVVnsCh8/exSV7hHkKggXWpZQNndUnCAuMzK4W+HeooZ
	 GiuB3yxwF4jSYB74U/dULiwkCoaF0SLhfGvVlQUQt2JGeXzfk5Eomf8E1cQfUeGEnjX9u
	 JPUuQimC/gHP9ocSlESADBFOOGybTWsuP0Qw35NBhpOAxPpzpmDxIYSXgaTmc7hx+oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Q/M4ohUy";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4558E606A335
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 15:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4558E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q/M4ohUy
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so4042689eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510646; x=1793115446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldWxVHDgUgQ18jFdtDAJ8jJd2yZcZSUNdb3f55SGTX0=;
        b=Q/M4ohUyAJ7ROEDRnEfif5lqm8SVj4WkJkIxKL1p4bokHsZuMxcjvvMPhVRNkEPoiR
         j5yWwuiinUbY4oNVulXzeJxLzeXkFBbS4H4E5rlSdZ/O/Z6nTiJi5PNyn3Vb6ayxyQLe
         DZha0CltkU3t+XeU2wkG4TuszL7LlwU10IXic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510646; x=1793115446;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldWxVHDgUgQ18jFdtDAJ8jJd2yZcZSUNdb3f55SGTX0=;
        b=knJLCoQ2rQ/W5CJbBjKw1gkPTWtyZf3DuzsVNc2iCcc7g9ym6L3NzaYwbZ6IqoyXBp
         l4l6Xe2MX5rsWaaWNdDmIARAouKXrCgRSszviISFdh6N8+zHsqJ/Vpz+I4u+XLaUtoh1
         KopsH2CWt29b1SZFNDN7evoHuFeW/iYKP1VHeKdfR2A2O1MeMkmaPyroXGjo7S6V0wbP
         cam6CDMv+fvegqWg6vY6udT0Cia0s+dj6w1BwQsJlQCWZ72Cto/WYcE9PyYlYPfDC5WR
         cx4AMw06ZsvNJz3ANNhLlOUhyDhK7DqdtYKzB4uzbWGOpsR7HDe9vQ40C7nosFHMa52p
         VRPA==
X-Forwarded-Encrypted: i=1; AKwUvBzmC+VxybsnXSPjXp22gQIm8czDhOlPVqDRWpi8O90nxyXRfu/LBxWRKkaSPNrFLYV/RsOP0lf7Kjc12DWw@vger.kernel.org
X-Gm-Message-State: AFq9FYJP8sjweKNa51GV07Zy9AIj8RGFl+CiF1wr/p4Qx9GS6vJTtm63
	Eevl4ugZeCIxcMz7RqHfPfP59NqPNh0V8K2yI7T5Tp1m1luNPWgJUDIJoWUZ6S0LYA==
X-Gm-Gg: AYBFou0OCD9GdEICTqYVlGREM0wloixKZpS+mJ/MXeWcOP3BhsEOQlMwlZ+7jKIqm5x
	9KkuFkzasEQvOQ1aDTQfYybXzkCmamBmOAfFfSu76s/exERZzomYg11fbISlB9FNn/fQ+F47ZTu
	Q8YfzCoZWvmS9aXP/rOUj3c69QB4Qbl18BUtYekNgOKJBr+W6oBz3EiVoVLVSo5FUFrENI34oq9
	KoMZIK6T61UpSJT5tkxD8ClIUcqUep6kJNSNUPMqE3RhEz9uYC9Xov2iZFeGNP3VVEhOCp8Mtuv
	0xEhPh90vJTH30Q4NPp6ZNm/GwoMOyh0/8gZZ/mxrJ0ZXzC7Mf7AwtUamzgRM1xRXXgAo1dMMnk
	JdjOWhM1iWcotDnPIuaKtrDfT9aRRU85PnYgk3DW5CMkULdXmH85EgpbIOGykBuwmVNesqsyBzk
	oTpQrD967Lmk8+Ny5fSBvu89+qbfikHMGQx+c4tBrbRg8sOAdBvaNdBYZA0i/SF+ObWIgJ+AT47
	PYVOXhfqpadAOtArv0LHzvhyIud1QYS1WXeHhTxGkXuydaR5LFNscSgOI4=
X-Received: by 2002:a05:7300:d409:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-361a1f5019bmr16718087eec.23.1792510646054;
        Tue, 20 Oct 2026 08:37:26 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:25 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	David Sterba <dsterba@suse.com>,
	Gary Guo <gary@garyguo.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	Marco Elver <elver@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Rong Xu <xur@google.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
Date: Tue, 20 Oct 2026 08:35:18 -0700
Message-ID: <20261020153652.2907186-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
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


The end goal of this series is to move forward on producing a
"universal" Pixel 10 boot image that can boot on a variety of Pixel
10 devices (frankel, blazer, and mustang and eventually multiple
revisions of each). At the moment, this is impossible since the Pixel
10 bootloader:
* Picks the base devicetree based on SoC ID information.
* Picks an overlay devicetree based on Board ID information.
* Needs metadata associated with each overlay to match it up.

Since we don't have per-board overlays and don't have per-board
metadata, that means that today you need to pick exactly one revision
of one board and build a boot image just for that.

How does this series help us?
1. It uses a checked-in .its script to associate metadata with each
   board's devicetree. Other tools can parse this metadata in order to
   craft a package that the Pixel bootloader can understand.
2. It integrates a call to the new `fdtfactor` tool [1], which results
   in a "base dtb + board dtbo" that looks like what the bootloader
   needs, at least as long as all the boards have the same SoC.

What happens if everyone hates this series and it gets dropped on the
floor? Honestly, everything here could just go out of tree and it
would be "fine". IMO it's nice to have the Board ID / SoC ID
information for each devicetree stored in the same repository as the
devicetrees themselves are, but if this has to live somewhere else
then so be it.

NOTE: from reading the above, you might wonder why the sc7180-trogdor
.its script is part of this series. The answer: it's a board I was
previously deeply involved in and it is a convenient way for me to
prove out that the Chromebook use case works well. I did hack up some
changes to the ChromeOS build system to use the provided FIT image and
it worked great, but since I'm not on the ChromeOS team these days
it's not something I personally plan to follow-up with. It sounds
plausible that Chen-Yu may follow-up with it or post a similar change
for some Mediatek Chromebooks.

[1] http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org


Douglas Anderson (7):
  scripts/dtc: Add fdtget.c and fdtput.c to sync script
  scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
  scripts/dtc: Build fdtget and fdtput host tools
  arm64: boot: Support building image.fit from a specified FIT_ITS
    script
  kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
  arm64: dts: google: lga: Add lga.its FIT image script
  arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script

 Makefile                                    |   2 +-
 arch/arm64/Makefile                         |   3 +
 arch/arm64/boot/Makefile                    |   9 +-
 arch/arm64/boot/dts/google/lga.its          |  68 ++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++
 scripts/Makefile.dtbs                       |  51 +-
 scripts/Makefile.lib                        |  67 +-
 scripts/dtc/.gitignore                      |   2 +
 scripts/dtc/Makefile                        |   6 +-
 scripts/dtc/checks.c                        |   2 +-
 scripts/dtc/fdtget.c                        | 207 +++---
 scripts/dtc/fdtput.c                        | 280 ++++++--
 scripts/dtc/libfdt/fdt_ro.c                 |   2 +
 scripts/dtc/libfdt/fdt_rw.c                 |  41 +-
 scripts/dtc/libfdt/fdt_sw.c                 |   3 +-
 scripts/dtc/libfdt/libfdt.h                 |  70 +-
 scripts/dtc/livetree.c                      |   2 +-
 scripts/dtc/update-dtc-source.sh            |   4 +-
 scripts/dtc/version_gen.h                   |   2 +-
 19 files changed, 1322 insertions(+), 227 deletions(-)
 create mode 100644 arch/arm64/boot/dts/google/lga.its
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.its

-- 
2.56.0.212.g129ede20d9-goog

