Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029267;
	b=MARwvoXng1g5bujXgk0V2pt4514d1wXRB/1K/UdgDEtDfW0ybmRcWxfzs1OMAfrZMo+I
	 fdcmtrUBqYdV3IU7wJbzCNH7N70qpsPKMgFspnh+xrRzCoe91N2/xQXPT0hpYe//PPk9r
	 pa+K+Np5fQYH7EEEKCFN9f0R/EAVhBvyj1fh1LYC3tuHKxHlukmTxHb1mO+aM8O1wmyEU
	 /GgGiQj7RaWR51mr63Xwu9W4C63qz3Shcgsu7TBdGZYeOyGWEYsbcW/r5pwBp4qo2WTmT
	 C9VbRskthOMXbZ/QZPioTYvp8E2215kRIDwGCgOsaUyJLQfmQFpIsfy2oWuuJd3xKJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oXvlMSArAdPznEGPoRfsgQqM9zglSgDnbfxhA6Z+wyk=;
	b=nUbeZmBeH1cM6rtSxmCoBqFZCGifAD6xzxJ80Leq2QE4807XHixHygC9bxmb6DEUHr0d
	 7MXJqalcCrE/5OerHT/GKi6YCsyiS3VgYb4ox+OaRjeoRwGKVTy/q09NbB1xEkAzmUoP+
	 i73UoNy+rVhtn4OFPkujy5nUbs7fmGTTfhs4cwD9YV0zW6UvSTNBCgWb2xSOf18DRPXT0
	 5TS9kjLtRQQaUEmJZkdDeIbV4iylMyJ5Sos9PIPi7aCjQdGBIlKhsf+r3PiGD0VmUeizg
	 z4A1mJrfkvim8PEbXYltC36mJheouxFtx1cxcGZuc9MCnFNdEy+Gee9JXP1aZpb1WYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kydrx5lC;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90A7606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C90A7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kydrx5lC
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-845788309b4so1497576a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793029266; x=1793634066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXvlMSArAdPznEGPoRfsgQqM9zglSgDnbfxhA6Z+wyk=;
        b=kydrx5lCCIvCkSDYdmEzz5tuOnzwKKCEvi+/GimiJ/pbp4X7dtXpkSy8g0554b7Z3F
         KssOxSNc1k65L2cdK/q63N9sp6BYHdDq52Z7aWfM7wZsEanX/yQODUNE09pOAPNfxTam
         aUCI16NSHL1lClaLj0NoihkBAywcb2hm+C1rq6+Z3Sbsft6EdgGFNwr0JejGfBsEbFYG
         k8x0MSSxYECwwLhYDP645aRZa705vFNVDuQlitov1vSoPWRDYR+JpMbJp4ZCLRiUiQIV
         y0HSKCOE1k5rmgFXrBW7PFAT8P3sx0HXxi5CbSEyueJZ/UwTGNfqdFvYslHsEtODsfZd
         Z/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029266; x=1793634066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXvlMSArAdPznEGPoRfsgQqM9zglSgDnbfxhA6Z+wyk=;
        b=LM5d+AeikV3gps82UPn4N2hBY1Y/upfcESOXjYGOwA45dnSlFktEL+ZO0Fft+aBQwz
         +kh3xbuDrdgoC5jQu32gO8PvT9P0DCH0RyJKjPRNQRPJYgDb3GNOvksRv4ojCMQEkUZh
         xwhBGNO8PEPE3Qa+8R/CXpPWe24Pf/R0Grc9WhBEOQSMvT+SvBGm1Ccm33ChfaD8UjO4
         FKBluCEXT1aK0ilZPNdPkI4FjmS108Tiq5w3BXdVgWWDla26o1Kh//ZH1zcEfPcH0/3B
         07TBzMZwGoDPIR4+51RVk/lzHC3dKOuJdpJQd23XZ2UycgMkUboNjrS5r9z+3+gdxuXU
         ivPA==
X-Forwarded-Encrypted: i=1; AKwUvByz09rxUUWV1K2ACZGJyKrKw1pnyL5Anfqz5XM2lx7Cn9Z2iM/LxqwmsDMVluT8ruuagOfd+lbHfpHFb9tn@vger.kernel.org
X-Gm-Message-State: AFq9FYIYvw+vGURsqNQbfmPpxx7UfzYdz3TpKfxo3ye8qo23G+rxkxAB
	GGJ1BxtyRtxDomziOo+uSAMwdxpGXfCnnk7nNOc68XwSh6nVGBVMplOC
X-Gm-Gg: AYBFou2YKBOsL7tqTbasGF+hcfEx9dgdyxWOkt6FL4t8paK6LivJUeM20ZSowJtmglo
	mbn3bsKPE12hlv94ztNgIPS7JxJ+7kMTcH71bqAdfZGkkV/wYzuUtbCOotmpjUxM3WaO9DyfbR3
	XF/Mu3SAr+A7i/cykR8HlDI3BGbV4u+2TSe4/p243iTmRUpBjCcrPotwTiWYMt/AeCsHdJd+7GQ
	S4+dAuGc9OJF2m+7LMZ4Hej2lkzEZmYPrUc5sPuN/murwkMWcsjLEQleFsMjvFk9DE9CYN/Y+IY
	GpydF1Q/wxHfcLYISH++7coLRpEwfDN4XW/mMTytfmNf2/w4qdgVbnReBhOLA+tDgP3iADmVdA7
	a+v2iIxppGnsTJ4Jr+rTxyCr6AOGi4QOuyElwEmjv7lj5mQBVmxrF23gMYKitkYtWYsEOocgzYD
	/cPBrTq1gPcj/yf3qb4zRIesHiaBBxVTHMi1ySPYv/TnEECGfRl5fSf1OzDGhtqVzgJKM99xMRQ
	AFAcD9f8Z84o61dcUOaaXt3kw15sfaA0cM7ilCWqSGu1l8CuPq0jKQISxW0VK3XsWIX27t6YZHB
	3mboigr07w==
X-Received: by 2002:a05:6820:2203:b0:70b:afc3:25c6 with SMTP id 006d021491bc7-70bafc3263emr2251069eaf.83.1793029265744;
        Mon, 26 Oct 2026 08:41:05 -0700 (PDT)
Received: from jeffmr.mynetworksettings.com ([2600:1014:a112:1526:a95b:f8ab:d834:50c9])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a84315c0c9sm4746441fac.7.2026.10.26.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:41:05 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Mon, 26 Oct 2026 10:39:59 -0500
Message-ID: <20261026154001.9323-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a device tree for the HP OmniBook X 16-cp1 (board 8F46), a 16"
laptop with the 12-core Snapdragon X2 Elite (Mahua).

Tested with Ubuntu's 7.3-based linux-qcom-x1e kernel. Everything listed
in patch 2 works there, including suspend (s2idle).

Notes:
- DisplayPort at HBR2 needs "phy: qualcomm: qmp-combo: update DP PHY PLL
  programming on Glymur" v5 [1]. Without it the stream runs at half rate
  and the monitor shows no picture. With it, about 1 in 4 plug-ins still
  gives no picture; replugging fixes it.
- The GPU is disabled. It works with "drm/msm: Mahua GPU support" [2]
  applied; I'll send a follow-up to enable it once that lands.
- Audio needs a topology and UCM config for the "HP-OmniBook-X16" model,
  which are not upstream yet. The headphone jack (SDCA) is not described.
- I hit one hard lockup while plugging USB-C devices during testing and
  could not reproduce it in later plug/unplug cycles.

This series was written with the help of an AI coding assistant
(Claude): the device tree started from glymur-hp-elitebook-x-g2q.dts and
the laptop's ACPI tables. I reviewed it and tested it on the laptop.

Earlier bring-up report: [3]

Changes in v2:
- Add static data-lanes to usb_2_qmpphy so the PHY uses USB3-only mode
  (reported by Sashiko)
- Drop the Assisted-by tag, describe the tool use in the changelog
  instead (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20261024044650.9936-1-jeff.roach0@gmail.com

[1] https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
[3] https://lore.kernel.org/all/CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com/

Jeff Roach (2):
  dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
  arm64: dts: qcom: Add HP OmniBook X 16-cp1

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 855 ++++++++++++++++++
 3 files changed, 857 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
-- 
2.55.0

