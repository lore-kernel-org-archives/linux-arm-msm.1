Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A1851121D
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 20:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469122; cv=pass; b=eH9zQGfcHirO/y+q97j6NVv4ZGPhZlaaQnzhWn3oGKOaF8MFANlvXkEIwuiD2F22vpT16gDThJVIFGu4NjFUPe70emuiLt9D1up0BbiqQNj2G+ScU2oRtwxlI4U5NwuxHl0rAv0mCy/i/IMKVrnTgknGxyIxDTEkLwNzLaIWLPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469122; c=relaxed/simple;
	bh=IzJt2StCxj6QlvTFqzNu7kT6yZRtUyvQ+pq8S6TGhxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nS74jTILBr5FSVfpdhvhZ7inVU7hWEDfSq+tNZjBcQj36LGTJxMVBmi6X4zEewSdFRh+ey0C3jwpG/vMNblnlhChMxjFI26E/TxvEDdHXJ1/MIb5mDOZcUgzJ+4TE1yf9d/PwEYift/Vz1tb2U1RLVsa8WhQgDHMHeJRVQxm/4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QEzjo7Q0; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QEzjo7Q0"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b132a5009eso207704eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 13:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788469103; cv=none;
        d=google.com; s=arc-20260327;
        b=fmlJeY5SaS4faLRQ4CIYbAngmVas4B0m2T7wnR3IcwvreUNO4m9J8JvKN1/ocdNU4d
         tbCC2VYKxsnHWvVqT3bICnxZLebQiU3uWabO7xAKxbjIHztKXNHMgBfGFp6t/0ofJmm8
         ydh580ABf0LaQwJ8RXZm0FlUvjaT2V1FS0YJU0V5G2Wco3/eDNf5gTHUYK7FUy/RUKU6
         atyK6EmDOC5/Z00AVe6HBEdr3NlgP+3235//eIAgr66oGEELGGzQNr5fpbvkJHUrtMq9
         93zXMKS+E8bgsVTGyNONmNiIA3pJJocnCB+XCRn2DAdOQGJaRs3bWbJ0h+rNbodGksJK
         8fdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Kbk7DKrDKm1y0joI7y1zmZ6F6FvHdjLhRqiyG6EvJgI=;
        fh=A8Xdu0jOzh5zOUmQdWaYZkaZhj70kAPP0gpMH+3qrd0=;
        b=LuCTM5KoCf0Zf5sh7ETizWt//oIE8P9JcEB6DZWR7DBO67T97vA7pb6GXYJM/E04rS
         0+K+xnKcnFfnlPo0QS+jmlEXlEZlzN/cpotoy610xEeyeNt5M7Vgde1qD7tmIpHI43P0
         XmRZ20OuNpMuHVHHfN+w2rscpOaByrFyDjHdioDWrfitkvVEFSxKGklpcUaTG+imWz2t
         XOpSSDKyIni3podsshS5SyfwJsURAjN5yndD5F+2kWJBKNbuGKbgIL3MHLqeMmfggAy3
         1FxKQ7FFCkAniuJ0Jn0wDl4DhAT3+v1TSWH3h2WoeaPQRzM2xvambbVm8jo17YrkAwah
         +WOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788469103; x=1789073903; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kbk7DKrDKm1y0joI7y1zmZ6F6FvHdjLhRqiyG6EvJgI=;
        b=QEzjo7Q0AhP7JYdhrIHgLrTvkel/W7Q0FBtz6OzDPQmwAPESyHY30UdT1y2jgVAlie
         onwxoJk35kL66Vd0Y8kMDhomV3FzC9Tg2WinCImkIlznjnv6LicaqJulA1B1nlfdZDsM
         3W+bGK8DFZdx3LayCmhHGUA3G88l+rC6SYuG4sVRb57rE8jFR8H4IiOvLDbzliJs499Q
         eHp8LOqjaeQl3WLGpZI6waJQlkecu4mI33BtLTdXs1zLALXD1TGXGvlQhEIKRk2sdIAb
         aOA+7tkePxRuQEmeiex1iCaLwgmrhfq8zel2qtFpf7WCk5al1yEFyBpi8IKnkxkWqHlF
         EGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469103; x=1789073903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kbk7DKrDKm1y0joI7y1zmZ6F6FvHdjLhRqiyG6EvJgI=;
        b=LS7mvoHDfN3gAfxDai0jWy2xZAZCP2nRAq1wthMfyTUZoXUXFG/T8q3tSummC5Asrc
         g/FaQEAKxPTAIqsbIQj7hkj1Mr00YJx1htZfTiEIAjxm9tGJOhVM7eGaO6QJDf5XxR/Z
         Ij/wzTOnDpzq8/9meHxa67wDbG2+Y1q++3t1/ty4lg/BZ2ivUywY3zGSvCC/jR/Z0Bip
         oPXNjqxxNl+WNsOSgE5R+vOTdTwZ+a8UclyMlOv+L/lLs70zWa90j2lKGwHDJwL7dEhE
         qKdaH5Ni1+9ro33ZRCqLLnNqOcVAd00RuE+9HTpPN9VQ/VTe0MM7PuCXJc373EWbfpYU
         O1CQ==
X-Forwarded-Encrypted: i=1; AKwUvBylFG3FoT8aNtcHDCaFXUceLpv3z5bUcZZqXh06dhupuN/KiUm8KvhuGt5hemDoG4iU2hqPtdE968uX8h3O@vger.kernel.org
X-Gm-Message-State: AFuF++mgJQov3MXZ5PeC1MbyJrfkCJUJfXBoTnp9sIJsPbtxxyipNWkU
	1DeRQtyewjBIwE8j4NqehgIRxoRVL9YxMcgfbwD9Ycip6fUDp6zYMiAOMrwkEzemPQmbX3lJ9Tf
	tNDxIvKwgV4pkAYeNs7aRkaNADX8zNbCUgWCLt052
X-Gm-Gg: AYBFou2iPt6XnT2UVYvw4U6cMsqzc6Wm9Srw4veoS2zGKg9X4RSC0RZtw8Y50wVL5sx
	K1fY+I/5Rupv1u29WflB/GMyeodk6GmTcFM0cA6HgB6fx/1YJFbrR59i0ArRDm644TGPuXTE760
	wysr5yAQFW4XtykXbjYheLk/y+tcXpbNzPZmx2DhCO/cH03iZuJZuk9AQUUj33bQE6mP0J/5mfM
	SxLiME/EDNaFMS/3yLx9V20uhiKZ0tfHOXBBhrU6KmVs9gUql6zDUku0hZpJXC54klyT8xS+dGc
	wpHkG5C2U8CfX7ahnqBZgyVxNkOEXBykQB1DTAN8BTf1iQoj6HjSsd+meFh/TeGGi0/296cr9LQ
	=
X-Received: by 2002:a05:6820:179b:b0:6b3:5475:4930 with SMTP id
 006d021491bc7-6b6fc9d05e0mr1462817eaf.21.1788469102528; Thu, 03 Sep 2026
 13:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-5-f3999362a9ea@google.com> <3de593de-6851-4a53-8309-a6bf13e9a8f7@oss.qualcomm.com>
In-Reply-To: <3de593de-6851-4a53-8309-a6bf13e9a8f7@oss.qualcomm.com>
From: Mayank Rungta <mrungta@google.com>
Date: Thu, 3 Sep 2026 13:58:10 -0700
X-Gm-Features: AcwNN1Wh4m9a6562DkcKps1tteFgxiKlf9013OvI175-psCFacunCQ9tfiMPwL4
Message-ID: <CABz7rdBv74pZe6jDRifTKRAKzGZB6L08n81_0gCqF0g=s+FEcw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] watchdog: qcom: Register pretimeout interrupt as NMI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>, Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

> > When a system is completely unresponsive due to an interrupt storm or
> > deadlocked CPU cores with standard interrupts disabled, a standard
> > watchdog pretimeout bark interrupt will fail to execute, preventing the
> > pretimeout governor from capturing CPU backtraces before the hardware
> > reset bite.
>
> [...]
>
> > -                     ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
> > -                                            "wdt_bark", &wdt->wdd);
> > -                     if (ret)
> > -                             return ret;
> > +                     wdt->irq = irq;
> > +                     irq_flags = IRQF_PERCPU | IRQF_NOBALANCING |
> > +                                 IRQF_NO_AUTOEN | IRQF_NO_THREAD;
> > +
> > +                     ret = request_nmi(irq, qcom_wdt_isr, irq_flags,
> > +                                       "wdt_bark", &wdt->wdd);
> > +                     if (ret) {
> > +                             /* Fallback to normal interrupt if NMI not supported */
> > +                             ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
> > +                                                    "wdt_bark", &wdt->wdd);
>
> GPT noticed this IRQ is requested but never enabled (NO_AUTOEN)

For the NMI path: request_nmi() requires IRQF_NO_AUTOEN. To balance
this, enable_nmi(irq) is called immediately upon successful
registration in the probe function:

For the IRQ fallback: devm_request_irq() passes 0 (not irq_flags). In
__setup_irq(), when IRQF_NO_AUTOEN is absent, the core calls
irq_startup(), automatically enabling the interrupt line as it has
always done in mainline.

Both paths are therefore enabled upon probe.

Thanks,
Mayank
