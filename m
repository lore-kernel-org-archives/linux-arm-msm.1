Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702724;
	b=KWTBfXs5xFtiTKEjOBJFghj6Cr1lfkFTXi2dpDOxpc/Do35CQSAJ0C0rX9fvZXfbJ2TQ
	 rpGakI39Ck3sb39E278t00dlp6acpKu0IbZR3njCKonxNaPzrxAusnC1XAT2unnZd56b9
	 QfeGXr/vQu/EOnSODmXwZ0EteV85Z3xVGn7D9jM0Bh/rubP2QgvcuZ4+GR9apiGa+/T6o
	 oQdlYpfJSfY4owfnMqve2kEI/waqdU+G6PFaD66LjQ7VJizw8mp3yZ9pXmh88Ue8p2YBa
	 OpQcYMSMyTBEUiQO0iJrBVaXi+1IhFyh+B07xwuFgXI+7OITsvzwsg2RqSRPSw690mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ORxa+4DrubomnpEFvgyCRsCft1wmp5DXp98YT3uKLs=;
	b=TYafsMmi4IPTaMTtkKH0WuktRLdZ1QsIZS7SCev2EJ616ZxlknkuW80U+6BoViP2upQ3
	 HH8w2EYGQepNDx06yG2T58lkR0b0kIIsd0T0tOQDJ0sdJ10OEs+kCCJxRCpkqHJ4j6tG4
	 +te/x3RWF5utoQHeglpQ2tWU5l6ZwRsOqOOvnBxDyj5iXKv2/7U7rnriMQrschCtpD7TA
	 3pcGMN4F+GvCM1vq3mAHILkZw/X8ejzp1odJFUrEE3FKJyxyYqAxYpE/rrz57rxZWamIl
	 9nA1rjLTUAbthiswWs25U6S6jQ1SZOTxXsnBdf/Dj5cRa3DMvMsLh8dyJBPZBpWvygQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DlcA9+xv;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A49D606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 00:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A49D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DlcA9+xv
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d473cfff6so325024266b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 16:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702722; x=1795307522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ORxa+4DrubomnpEFvgyCRsCft1wmp5DXp98YT3uKLs=;
        b=DlcA9+xv6ovQ7U0XnP+svbUjFjhy51cSsHATRyAaPicXbRqayB+mIxzC5TpzMRQLk3
         LDt5Ce3qRNLH8PwS7YhfnLJTO3sZ5Jw0SIlH+98arhzVSvxqqfGBH5JYZFwoL62y15su
         wSgCV634hpJfX8qy5Sb+HU/i8rQ5zkT+wDnjFhLakA+1o2GAbK6M37u3xkX7TGJCtZ/p
         /7FfFneDcaHDSw8ccfL0X3aXh4yn7de6KDDMUFRs915zjJgwJLIwM0iiQKphMMH1y0I2
         UwFWMlH9SmtKMcd+Wmt5YwkcdjMUUlhOlT2Z/geKLUE4DmiJdkinMK5Zw5D6J0D4iRwD
         4kOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702722; x=1795307522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ORxa+4DrubomnpEFvgyCRsCft1wmp5DXp98YT3uKLs=;
        b=WJsgGOFqBR2cQCZoc/ZDx1LU11ViquWw5n8ex5M6hb1Xn/5oh7y4fulWqiGx8jwD7r
         rcVFJnhTbEn//AoXBYSF5pT7OM1VKLJLnA4nENjT4F8rlRjIDeMJVABOSUv4FrmDzOSd
         LPjMMtnBimir7mlcfUL3Pg3u1hgJp10qzBcsdzFra3+mjFDSdjrFEuvloTRrmfiMAmY6
         YwBYylFvOVhOhOCAclN0onREcNyydELGixplfZTzd3ja2+In8+N9EddsBuAF4PIA5iao
         WrinWupCyIYuPNj1K/WD9bX42Z8swcJ7TkwgjxWDCkyCCSOdsoiugxyiM73Sge62Dd5E
         2VLw==
X-Forwarded-Encrypted: i=1; AL+hErFiGYS9psYR0bhDmBl5sojjwyQDAfQ0MbRL19YCJgLh4Kie3hVer0S3s4Noy3O7QN55JodQndDsfh33mUHn@vger.kernel.org
X-Gm-Message-State: APuU4Z8GpLdhApLacQ3y6C4g4CpkA1JXY8j/LUeEh1YDPI7iUYU/gCtB
	WOAUZaQTwifGaS5M8HLR9rK/XBx6g3nGWyMiY0xQ+FTK9lidIrVQPdg=
X-Gm-Gg: AYBFou1ICrOCmP6MLQqmvMlfKCRbIcKYSpqtBSNiL6FD/SEyI6DehSmBGhgTiYolxEw
	z1TRHNdVU8mrkuFzYgFEu/YQZ3hSwjnEMRNXlYCBaB/Hmrhw+ZwBj897nJeCG7+QwrJZVX4t6zg
	qo19B2Yu12Sxj/iEBCFUd3Y2wVm7iwaPUyDQD8FkCC4Air7xpdtcGwjiPx1wRXVwCqWnE5RSs/D
	G8MFNfewgae4x+vEd37mka2pfTb5VgHmRMH5YvC3cgCMP+W+uWvXDaoxVLTtQrxEKUB2DB6ScpB
	i+ol1SOAOLTRu1dRHa4tXkxh+7NYJy6csJi6qAx8JPnFSc2/p7/e+qT9fbZvnxyN3yenJJINY54
	Zzdp9W1A0Mt8rZz3Jyb5fMM0E5xUi53fESQJAyVLCaGRlDGEk3CAaby9IWwT/ZiQTM7Pw+iMaUE
	J0fouijr41Dms7HRUA4wNF8jMCNjrxGpG4vuKlmosGUDSgU17Mc4XVjxGzcamRQOG/E2X7h01JE
	fqJogML0ZUVBs1KRFr3SPTllamUPDkerRa82eDykt86KaMohoq8XVEuh49OL3rWR6fAJZEgtW+P
	4FGICkVeM7mfb708Nrx/QVg6seKaTcP6ufl5uTfIjgooOPolmVKbOo+ZgEwRDbz31LumrouxgKd
	+u98ur2LlRRRcqdahlDLspuzwBHdrbNmfFZ4=
X-Received: by 2002:a17:907:a714:b0:c42:5363:38dc with SMTP id a640c23a62f3a-c509637e20cmr507032166b.25.1794702721723;
        Sat, 14 Nov 2026 16:32:01 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm260695166b.1.2026.11.14.16.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:32:01 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: sm6125: Add cpufreq-hw and CPU idle states
Date: Sun, 15 Nov 2026 01:31:55 +0100
Message-ID: <20261115003158.391171-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
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

SM6125 has no CPU frequency scaling and no CPU idle states in mainline:
the CPUs stay at the bootloader clock and only ever enter WFI.

The blocks are the same as on SM6115. Register addresses and idle
latencies come from the downstream "trinket" device tree of a Xiaomi
Mi A3 (laurel-sprout), where the CPU low power levels match the SM6115
values exactly.

Tested on the Mi A3 on next-20261113: cpufreq 300 MHz - 1.80/2.02 GHz
with schedutil, WFI plus per-CPU power collapse in cpuidle with rising
usage counters.

This is meant to go together with Roman Linev's SM6125 TSENS series [1],
which adds #cooling-cells to the CPUs and per-CPU cooling maps that stay
inert until a cpufreq driver registers cooling devices. That is why
#cooling-cells is not added here. On my phone the same TSENS
description (derived independently) runs together with this series and
the cpufreq cooling devices bind.

Not done yet: cluster idle states (PSCI OSI parameters need checking) and
an energy model.

[1] https://lore.kernel.org/r/a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me/

Majid Hajiheidari (3):
  dt-bindings: cpufreq: cpufreq-qcom-hw: Add SM6125 compatible
  arm64: dts: qcom: sm6125: Add cpufreq-hw node
  arm64: dts: qcom: sm6125: Add CPU idle states

 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |  2 +
 arch/arm64/boot/dts/qcom/sm6125.dtsi          | 61 +++++++++++++++++++
 2 files changed, 63 insertions(+)


base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.56.1

