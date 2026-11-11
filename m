Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398015;
	b=sXYXVVtM8B4phGcqUxTyE8S7LdOceYq/lWEf8z3LKariEtEhwGxRkbjDIODPV6Opf3Z9
	 cpYXCG0JcY+FjI9VR7hURcNQSRY2HaOTltg1fScmvOHp/HZPm56vipqvwAIrd9HvkBdVO
	 ahGkSwmHLuDWBDkN/M6j8T8cT/tXmtTBkbgOtfZIUp7fenFBrx1L52xa7WpMifXFyWhgL
	 L2m5XzmiCSh1uS1eukmDlRXDj8HiJghqwgPf78aZo25Rz2iaPe/1428wEJASKuZi79kHw
	 Hhfqqphxy9t6cTA0ASrYs1P1DJePLvtDJVGGug0MC3G4qyT22YnUefwgpAi0+WyfYfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=7ESMF4tavevVKRGfk/x6V4l0oVv6vrtry4vVctn7dUU=;
	b=SyprI5zcEPAuzneD42cTxNs7Ituft4s5y9aVfPylXYj0rQVUJT7VM7wG0ls2Vf0fJTkb
	 F+j8I3Noa6O8IsDCmttpLsO3cR0jB1Cz72Qa8vTPC0XcnWR0y14ZDe9PB0VZtW+d6mzpZ
	 UsEYj0z8aweAUBYBir6ISx8xbC8R8ERmZgP0umeTD5P8BOE8lUksEXa9T98Q8j1oyBofd
	 qjxMtF1tcMl5ijIYWu1fkTtT8YQEqdFYx0LDU1Cg8+mAMicYh5s2NhoUiL1ine2fjT4lW
	 aT0s+9f2b0GnBdUq86x5/DZyNEkJjU4QJqV3iUU2173+swEcusbmcubCwvd3lTCw7dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SeJrQFY4;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94A7606A893
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 11:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94A7606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SeJrQFY4
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4b9f7cace4bso28824045e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398013; x=1795002813; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ESMF4tavevVKRGfk/x6V4l0oVv6vrtry4vVctn7dUU=;
        b=SeJrQFY4iZCoFZhY+p3jOVKIkuDKO2iVtU+hAqaiilg3p2vBERtE5o3tDy2viWSMrG
         tN98pGiayEHQglbp5yBJq+Xub1hbh4yagwTmfqLZR9L6Asu6GHtWuZ/DRARql49B0n59
         SKKiqw1liEoOvYxk/JBTYoSbvt8RfNXJPqVCXgL6NwXn958/j0Y10QmbwRXHKGVOExb6
         NYCfO4E1j2jpwcZtVaAnheyR/k14yg7Wj+Hc2WJwMg+rwWw7uqC6gNsiGpx3LtAhRYeM
         pY8UxHIhTYoxSSnacspXXIP1ESjYKcOPXzs1ysoVG++8i9jDYrbxooNdZoPagWT3hekW
         xCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398013; x=1795002813;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ESMF4tavevVKRGfk/x6V4l0oVv6vrtry4vVctn7dUU=;
        b=u9VsZQcK6b+X9nncQ9opIBL/2yGqFgij0VTwcIE4vI5i1r03LgSPfeJXPQLqQcfhsw
         /6U86PxUk8afuAHxAKTd+u0gtsp470dni7c0eIuCgVIhEbyovFECkbY7GfaGgbLXMBK5
         +LLUkvoSUX9yxl2de66w5hnylXHHInvM5CLB/vKRfJXt291uGxiMtqqLsaZwDjWIFxUF
         jS+Zj4/Zl0138BGKZ7wnrXFAJ9r+pZgmAhMBWtftwZbYSFPnUv6Dmc0WUKZhPQPgmFYh
         5OyjA/JM9O2K/SKg3ZCjZ72SVxPD9ehXgNlCqbWh+vKUcyyW1cQpfzP/jGJgPS1f4Sc+
         lgyw==
X-Forwarded-Encrypted: i=1; AL+hErGaA4Xo3R/LUwBqa1ya2N66WbWJdZVa9Bt9UVpj5ea/X2PIoTGO2MfBeW+lQ20PGwXNTuP0xBKDkP2vInrE@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pla4p3erc/RIAd1TGrV4AAJhR+CyM3Qq1lVaqjAHEgiQTXT1y
	xYgQkRK626au6zSaNgpZiRc/I5/j3md/LoVTGKFZk1W6Hh68pXeN57UubtnRr8KS88CDvjBgNg=
	=
X-Received: from wroy8.prod.google.com ([2002:adf:f148:0:b0:499:de0a:f0c0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:82f1:b0:4a2:cbe:beac
 with SMTP id 5b1f17b1804b1-4ba093c85ebmr42901915e9.23.1794398013137; Wed, 11
 Nov 2026 03:53:33 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:09 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733; i=ardb@kernel.org;
 h=from:subject; bh=rQf0Hc3083LXfxqXRhocE5se1KpHJ52vNrZ3THAhMXs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuNrlo8efh6UHTRCunye0v70su92BLfZakfd+Rd8f6
 YFFn3k6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETk5zL80z18uGz2w11nbyrX
 24jmMqz2fzz9zUHpmZ8eWpuWbOyafpvhf4j1tYLk9KbjDRtqGoz4VjdrKyxVy1xQKce22rTYhCm CCwA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-14-ardb+git@google.com>
Subject: [PATCH 5/7] arm64: dts: qcom: c630: Wait for the touchpad at resume
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

When the SoC reaches deep sleep (AOSS sleep and CX collapse) in suspend
to idle, the touchpad is often reset, presumably because it loses power,
and it may still be starting up when it is powered on again at resume.
If it doesn't acknowledge the power on command, i2c-hid tries once more
0.5 ms later, and then fails the resume:

  [  712.566907] i2c_hid_of 3-0015: failed to change power setting.
  [  712.567528] i2c_hid_of 3-0015: PM: dpm_run_callback(): i2c_hid_core_pm_resume [i2c_hid] returns -6

hid-multitouch then never puts the touchpad back into touchpad mode, so
it stays in the mouse mode it starts up in, without two-finger
scrolling, until the next suspend and resume.

This happened after about one in eight suspends. With a debug patch that
keeps trying, the touchpad answered the next attempt, about 6 ms later,
each time it had missed the first two.

So give the touchpad a post power on delay of 20 ms, which i2c-hid-of
waits for at probe, and at every resume before powering the touchpad on,
as the touchpad isn't a wakeup source.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 3e4df4335be8..accd80005195 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -496,6 +496,8 @@ tsel: hid@15 {
 		hid-descr-addr = <0x1>;
 
 		interrupts-extended = <&tlmm 37 IRQ_TYPE_LEVEL_HIGH>;
+
+		post-power-on-delay-ms = <20>;
 	};
 
 	tsc2: hid@2c {
-- 
2.56.0.611.g1030f0b940-goog

