Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC15B4BEE47
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 22:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164710; cv=pass; b=epHoBmpK972fRR4S7ifgPlkgqiUyTm9BSrAPNnhmxi7jDERresHBJzwG/4rRq9wEOY32W164BJ/kWYV+ro7meIAqRTahBBi+a1HW+Oei8rngMPDRs+vjvsRb9tojgacLeMObpzMDFDtyMS0jFI7qPN3uNWuYYzMcNguPyYCwKG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164710; c=relaxed/simple;
	bh=64DI/R3Fb3DmgLTAgL4BfcJDwxaJEMQAyDpP0IBKAGs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cizFV/V5RkVNOpcaQ0k+ntZFzO4vFjuzm1eQz0DjkHFdbKZrEOAIufFRVY1rXjdGAS97w1GNALDftPLY5xoNZcjjBHNDl6/LfFxNz6mupLMehBjBoMeEOfK9JwbVVcWAKe5HqH9+2D9icmjbvVJx1bpQr6fh8UHf5zdGykytLGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=est.una.ac.cr; spf=pass smtp.mailfrom=est.una.ac.cr; dkim=pass (1024-bit key) header.d=est.una.ac.cr header.i=@est.una.ac.cr header.b=NZWQy7B7; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=est.una.ac.cr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.una.ac.cr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=est.una.ac.cr header.i=@est.una.ac.cr header.b="NZWQy7B7"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2946dc8dbfso213887266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789164706; cv=none;
        d=google.com; s=arc-20260327;
        b=cX/Y+bppGvOVs+nfeXoqJejh6yi/AQp8tfnzFSkQ4YZbhy1giJa/YCx6nuOk00jzvV
         AEZKbBwOGa36q0ida959kqd3KB8gtErcxgm4RB+cOVCvhxYUItUIdLPabvlBRw1x0L7p
         ucUTTQvydvPGf0eLKE7mmH99gsmttSXoVO1sYil3Mu/Ywj/rIjlEIq6sTmUU3FkMEzGw
         quedBXUWD9MVKJpF1bSqPvF8NkgISGGi/jtqx2Vr+yoBR6ZT4COrQLsL/5jJl93TY6BT
         wVBUgoBfwnxdPP15n80AW6mDRCawVgEDjQhXQghU8k80kVcUftKBwajdDD15Dzjg3me2
         /RSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jmcmRooIJWZcfOxhhMxU11ULm5mq/IM7NKssWyEliKc=;
        fh=q10J0ztacb8j/NjsAMr8dQn1b3jSfaVaXlOkkKv7mVY=;
        b=UhVebZa4PF+6kEzioB8CHyGaCfm5/KiySIdKDfRnmj8KBlYrWSZX2E+BR/7q6VHOjO
         eS5AwvHoYgnZ/P1rykiNW3+cipYXIAoxrOlE7p1o7tjDLztA08GrUdpVgcOu0qBi/NDU
         52a3xdFXBqLWCOmkCRKJt4nm5vHgWGyYDEGgd9hCUmvYnNxN1mC7IP3oGlBQnBplAHOa
         75F6oiqohv0QrlJHFdHKTkCwLkzHzZy9GWtHKNwoDhRk0pDUocjeNUi0UcaC2pDMcJDY
         ZJP4w5FHqDzNCwrgevvOIatyKO8h6CpVnZiYuAgMx1QVYoy754vCAXxlEyntTJ7yZDLd
         LDgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=est.una.ac.cr; s=google; t=1789164706; x=1789769506; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmcmRooIJWZcfOxhhMxU11ULm5mq/IM7NKssWyEliKc=;
        b=NZWQy7B7P93Z9mSBPSH+yYNv5GOfYfJz9elcgc+dYbOUuy7ltpPx4xu3paNzLSfmNl
         gyS4D6gAGTcJuEwH35o2mGdoLJWESStdgahUVzNC5tZNFTR2nFjXthHK1QpyQ+DvrC1T
         c48CAYfJ7SjRNMn1OObgwrpELo8FjPI0hTmqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164706; x=1789769506;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jmcmRooIJWZcfOxhhMxU11ULm5mq/IM7NKssWyEliKc=;
        b=HbPUFZ3UOpxvlyTU3nP+3DkZC1Y+5WaWeu2qZPXfkS6VepEXfLJbRizdQSljvok7Kh
         pPae5ubKHQoQjg59JIiE6ULRsOXl5nZbv+tO3TCn9SmTPbfEbJW99w7G2HI1YIlXaAlq
         JdvEHUn9EAUD0WFhlYZumgN2ZPISraX29Z2SC+/JpgvdeCr3WujcvqNAxJnnJvUOcXg/
         Se6zMWPrTDhaJFCXSRArKvgqzg5lis8opQoO2JgEm8HMByWQWJf2YYAdfA4H6T2mpjPp
         ebXuvFcvR3HeN9ozZP3bXi0f5dSXaWPXJWy9LjYfOk0vr/OmRtWOO65ky/3CUzDLA+ZV
         kg+w==
X-Gm-Message-State: AFuF++l11NgUcXFR3KyQQhaz0Iipx+yQYYuSrpP5uql+OE5HOXgSObFq
	FqXslAwRU2Hp13z6OvMAUyZPRkp27Ko/6RlH3kMBAIidM4n4iLpWK6c2nRM85rc8kajcNTSRANB
	HdKCvn994uKZ9vcaDcfXi/IOK9PymZhlNfYHuXdvKflRPHp7UWzWq/qRv8y/A
X-Gm-Gg: AYBFou3Y97dikhK/BMOdklAGMG7WApQm5gE3dRVsWBUIsegaNq50MMtc4k7ZYASKJyZ
	69WDMEwLxzsv9esF4TawmNCvfjiryUsFjIzQObhHpJliVCpkM64iqpNbS+Nv4LsDuzTF2wRsN9s
	wrY9d668Yud80u9lnepXSZKQODv0Hq+TmNvJ/PfXiZh7dSaFBXx8199RaRzJjVG6krxG+9EATUm
	pysqqLHRZSjJMwE1P2fBDmb++irBc0YOiTG6x7gPws/GQXIRFpaJ5aWI38Ad/86ASrgydkM0Tf+
	49WRhzpZsEA+vhGZff88YTFKJKsErKemAgunjryeIeLc6gBsXLlD0SLkRPvTQDZCYwCTi7VCyb4
	mqXj7U4iSzJ0=
X-Received: by 2002:a17:907:1c10:b0:c29:286e:2e3e with SMTP id
 a640c23a62f3a-c29666d5f9dmr280604466b.38.1789164706055; Fri, 11 Sep 2026
 15:11:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Avalon Vargas Centeno <avalon.vargas.centeno@est.una.ac.cr>
Date: Fri, 11 Sep 2026 16:11:34 -0600
X-Gm-Features: AcwNN1UKz1EzNqNrYibLG4EW7is5QWZ2Va82YNgb4e5YpYrggY_-TnFTnLexsys
Message-ID: <CAGXpr54Bn9Wf24asY2RcXgBNLy1A16=U1mtFx7mKeNK4CCOCYQ@mail.gmail.com>
Subject: [RFC] Dell Inspiron 7441 AUO0BA4 panel backlight: PWM configuration
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, val@packett.cool, 
	bryan.odonoghue@linaro.org
Content-Type: text/plain; charset="UTF-8"

Hello,

On my Dell Inspiron 14 Plus 7441 (BIOS 2.16.0, aarch64 Linux 7.2.4,
NixOS), the AUO B140QAX01.H / AUO0BA4 panel originally exposed an unusable
dp_aux_backlight with max_brightness 0. GNOME could not adjust brightness.

Panel DPCD bytes at 0x700-0x72f:

  05 9b 91 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 02 00 0a 04 0a 00 1b 00 0d 2f 03 ff ff 03

The capability bits indicate PWM brightness setting rather than AUX
brightness setting. Inspection of the local panel-edp and DP helper code
suggests that this capability combination can leave the AUX backlight
maximum at zero. This is a code-path inference, not a separately verified
generic DRM driver bug.

A privileged GPIO snapshot showed PMK8550 GPIO5 already routed to func3
by firmware, with no Linux PWM provider registered. VREG_EDP_3P3 was enabled.

A local DT overlay enables pmk8550_pwm, configures PMK8550 GPIO5 func3,
adds a pwm-backlight using channel 0 and vreg_edp_3p3, and connects it to
the existing eDP panel. The existing panel enable GPIO is preserved.
The chosen period is 4266537 ns, borrowed from the upstream ThinkPad T14s
LCD setup; it is not a measured Dell firmware period. The brightness curve
is linear with 101 values and default index 80.

Validation status: the overlay compiled and applied, and its connection
was checked in the compiled DTB. Physical brightness adjustment and
suspend/resume have been tested successfully on this laptop. But I have not
measured the PWM waveform or tested other panel variants.

I can provide the small overlay and further test results. I would also
appreciate advice on the correct Dell PWM period and whether the
zero-range AUX backlight
behavior should be handled separately in the display helpers. Thanks
