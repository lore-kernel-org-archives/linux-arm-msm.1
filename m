Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514FB46EF61
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 18:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200258; cv=none; b=GBa4JVhaeNJDXF1uWhlxQN7WLAybifAweTAybvxj4BBjqgUPLepp89k+0/6v/dbVdiRzThXycYbsFgP2BsUv3b2YB5L21KrbUodLKiGEQgeBaeIFNg1SBQQRYB68JX2FvcM/z2JeP9f6752GBpj+9dFgPGYmaxSsrEWe+xIuocc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200258; c=relaxed/simple;
	bh=PEP7TQkxkQfuISukWgXVA7v768GBhFcwG9ByxxIj2Tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvX8uPrprwgxxQdk5Tzo1wYHRQv+z47Veb3dn7vRgEHSX4Ir8VIDanl3aun1nWY6qADwtSga59vg8zp3k0yVhEjhVCwPxH85/2ZmEv5Ng5UowEWapZ2KP5CQbXDTMKRxke7gWzzZ6revqhszyX7Nn349bpumuV8S1JrpDSzpKAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JAk9BczK; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JAk9BczK"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15e592da74so461607166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788200254; x=1788805054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yxans2cK+wuOhbWrIk6+cKJw70uQ8kduizE4DCZb2gc=;
        b=JAk9BczKg9kJ4jNcJvquBHJGsxV0TUwaoXRR4+OwAe0t3fOa0s78m42P3dLCyCf7VY
         d89S68aMHazMkMBslixly9VukvuQ+CC4+83pV8J4CEf4dAwE9JpIO1KUlUJVdE6/lXQ2
         7g7z07ZsXEeuQQFnEdyTNSZ2hCQ/Bu7TPVvTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200254; x=1788805054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yxans2cK+wuOhbWrIk6+cKJw70uQ8kduizE4DCZb2gc=;
        b=HWxA/OLtG988OfY0G+FEPrr1O3bOVnfA8GGVRZk8H4TAXPefkAvcjvRBNqSk+QY3ja
         ey8awrIuAsAsTqd/CrfwBQQw0ZuhFbEkZ6AiWUc72xYDF521MQUDFSutnkb5vSJKQxTR
         xQ3pCmnkGrRqY/5dcYqVca3vx79jhfmIpTmd+r/4YmSBcwnkhuVqww9Pafr9fyiMCzau
         sy19H/4Iz0TbjJIDUsu2q0bAt++mVBQcbBSSo03+C+MKNdRW0Ar9AjGtPrtKFxy1M+TF
         8MVMKVqgGTVtaFRiHSy2lOn+II7f8ecdHLqjaeopKjc0IqiSPTdCfMC0GlPTfMH6BjsM
         yxeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBrPdfGERBzl5Px6qqpJpnSw/r1qfg1RqvNQS9WXYu3rm+E67SPhV7L1gZJIiXXRLuLwdMOkYYTKLRITbf@vger.kernel.org
X-Gm-Message-State: AFuF++nW6mv6ZLgAuI+GES3vasONylg+SO71Gy/rA9ebBpM/dP1RkIX+
	FsV1fpvY2Wrk2qz0vVAAqfoNnRTSAT+Ru3ldyoj/FW27GATCYc4rAiovsvow31fH6OyZ1YRwQvL
	GDoaWuKtE
X-Gm-Gg: AR+sD11OOr3dFXh27QEYs37e1AlVl/sFHj91V7tIpbZJRVbJelkOkRcH/TQyojwc/uq
	ErdvxVGpLfhXTu7CXDrQaZyKopvFSAXnTnjSAizGq37iPYIscWlWqQy85n3MYsNvt9We6vnf05I
	JmBcSsuygyDg08ghx26KDDHeUsoI0rSQ8cK4FG/ocmIIbVBKzDlIHRAGAl1iac3XT3A7lzkiKa1
	BBDu83tu2sVWmmty1yFuRfv3o74dzEnFmo8A4PYwD95FbeDrl8bnchfv6mDr5srxK75dIJZ3G9M
	PEJlYcoOIoaWke/eqnj4ylid34bWil+FPH8uMwWrjCqFIKlV/AlPVe/h4CxWzvUYyyMkOYDDS5w
	Uuk1uO3GnyrZY+XOBSN/Rk3mAbvsztKJfTO3M9Kb4Qds8N37XNgPFfV+fgHYr4NX8wSTZUYDPc7
	SeVWTAEWOVrb6+PRvShcdjie55Y2lPra62rAoGPjfc4/fMwkxT1BaNtDnbOLm4C3oSYsnGeCVee
	sE1kz4LYKgmASBwZM+mtQdDtj0=
X-Received: by 2002:a17:907:6d25:b0:c20:2d38:e518 with SMTP id a640c23a62f3a-c2556c61d72mr1795950866b.2.1788200254445;
        Mon, 31 Aug 2026 11:17:34 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee28677sm485165466b.21.2026.08.31.11.17.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:17:33 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so45034815e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:17:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqATYLZ9EZNu0QGu5BJNVk+kGIYWoy1oEwM/1Nbri/cP3nsd0xBOesqc3xd81UO8SMkBqB8Cck40g3N5Jnf@vger.kernel.org
X-Received: by 2002:a05:600c:a03:b0:499:a8bd:1930 with SMTP id
 5b1f17b1804b1-49b91c20ba0mr403578475e9.5.1788200252252; Mon, 31 Aug 2026
 11:17:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com> <20260828-qcom-wdt-nmi-series-v2-5-363979fe6b6b@google.com>
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-5-363979fe6b6b@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 11:17:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkprU5wLANHrRYmHLmX4UVg-1UW6VRzswv-imF2GeEpQ@mail.gmail.com>
X-Gm-Features: AcwNN1WgqYHz9yO5Zn6x_Khshnq2JOY9-1BnUBhOPILjjyGKtsa4_xEbIIkQ6bw
Message-ID: <CAD=FV=UkprU5wLANHrRYmHLmX4UVg-1UW6VRzswv-imF2GeEpQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] watchdog: qcom: Register pretimeout interrupt as NMI
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 28, 2026 at 6:00=E2=80=AFPM Mayank Rungta <mrungta@google.com> =
wrote:
>
> When a system is completely unresponsive due to an interrupt storm or
> deadlocked CPU cores with standard interrupts disabled, a standard
> watchdog pretimeout bark interrupt will fail to execute, preventing the
> pretimeout governor from capturing CPU backtraces before the hardware
> reset bite.
>
> Attempt to request the Qualcomm watchdog pretimeout bark interrupt as an
> NMI (or pseudo-NMI) using request_nmi(). If NMI registration is not
> supported on the platform (e.g. pseudo-NMIs are disabled), gracefully
> fall back to a standard interrupt via devm_request_irq().
>
> When NMI is used, register a devres cleanup action to free the NMI upon
> driver unbind, and use enable_nmi() and disable_nmi() during start and
> stop.
>
> Assisted-by: Antigravity:gemini
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  drivers/watchdog/qcom-wdt.c | 52 +++++++++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 48 insertions(+), 4 deletions(-)

Sashiko had some feedback here [1]. I think the right resolution is to
not try to enable/disable the NMI when the watchdog is
enabled/disabled, just like we do for normal IRQs.

For NMIs:
* We're forced to start out in "disabled" state (NOAUTOEN).
* We're forced to disable before we free or we get a WARN_ON.

None of those are really problems, though. After we request the NMI,
there's no problem enabling it right away, is there? Then, if we do
that, we can make qcom_wdt_free_nmi() unconditionally call
disable_nmi() before calling free_nmi(). Now everything is nice and
symmetric and simpler.

[1] https://lore.kernel.org/all/20260829011545.3873A1F000E9@smtp.kernel.org=
/


-Doug
