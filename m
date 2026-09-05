Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC4D3921C8
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 01:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571493; cv=pass; b=dxoDBj74zouf9PcBf2XSxaLeUFWCMOJvFJZrTqe1EtcYOnf+9SvOtLsWHWbXkbly+au4eYpv1zo5ecsXYyJtDyR8CIMifyuTpz1mAKVUF8hAcQMH5xq34Dh7qDhyvzSL4TU49I6vPM6OFVfonJOfcfKNkBnkNViHymP6vZsONl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571493; c=relaxed/simple;
	bh=+vdy2c9vm4YqTwvKBGcrmA/YMw3xm+oXmp2FVkweGNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CevYRDzsvzcQchZy8FMUIFXH+/FLOGbUISSQBu5CMzgbzcgcMr6u3X24vhh44u0ouj69cKX7A8UN1tA55XJGP31HY4mU2u+8SleH1HCY94AGNv43sryZeha6eCOczhF0C2OnYL3Yzs3UFpoGf7h4n/mp+41HODXL8t8KVutJBbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=demCRwIR; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="demCRwIR"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-446f87b6de1so1986568fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 18:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788571490; cv=none;
        d=google.com; s=arc-20260327;
        b=OSSQpLFhtjOluAuqfFKXV2en+Liqp3gOlu1KURhflOF3ZBNnWIyVvRQJPmTMg3346E
         LRnzpUqKeMnh/RlntuDf6aX2rK1KaRqD97z8I+edgRNV8JjVXBW5Fk0JzyKUSf/T1LSH
         nI8lKg2mKcUcED8JlWxZDAFl5AxCWASVdUOTpD8UdzE0bNmG8bIS5qR2NFYOms1OXiFj
         o54w86C190d88Kg+RW788RU0F96txCT0Rs+1TaAktf1oc3Zxjr8jSDb/gUJLXcgqurIG
         6cNmZ8VabBGXTySTZNvmnICaz/SGUITwsoMKdCT7AZMpXLozlKFSSKXFt/RKSavJu6bY
         2lmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EC+UoLptGl/DJ04FYVu43bGMcolD/XF55vuVsaKJN2o=;
        fh=1viDVWEx/zyf123Dd9kcniuL1FwLZgleJ09g4Jj52t0=;
        b=MHwEb69jz2n7k9qfziCikk9s/bTleL68aRJT6O27xmaE2OrVD2JqS03XVhKanWibBA
         FGdemNTwTZGfYBv54ZLZMB81C7qk992ooRTLPYzqPSVyJhZ2iXDLQ3aqxEfcXe9hf+QD
         sML685mWx0itkGFDLksVkJTaibLm5zGMIqet/2aOENHU73hv4vfaJog6FAG1/13BSKlR
         MFMzIb6GLr+tMKRl79mmvAhZ3fB9ByavLl2L26LFtJCLZ1NprLYDntXP5CCbl/Hjwqrb
         K1WZVM2aFiTaRtowAnYAAJ+Pq6gBEVIWP9m8P8pZ7AQFtYag01ua+/J2UN/pckb3XKbw
         ljjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788571490; x=1789176290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EC+UoLptGl/DJ04FYVu43bGMcolD/XF55vuVsaKJN2o=;
        b=demCRwIRGi9rOX0cF44e5OpuO0Tfm2gfwstvJhqmDpTHXgFQtT0x8KVctgyfa4xWAV
         NVZr/quQ1985u0pRvEBDFt5bqaMaOj9AVBKj/JwQGSRGG4eguCg0JHg4Z/Z/mqeua/ii
         HU7A1ub/Zn8amwTyd3aFWGNJewPCKEE+PHTzZeULpXvzczjTiSa7Wo5U3Ksizns7PCSr
         poJlwpKkDJtrPyp8Q/K8bEcS0mG/gCjECNdudB5MLWBu15nvu5/e/z9U8GI8ipOsYZ8P
         IblLb413Hh1bDM3kxWXCa0ftric3ix40vHq5mZHSp+X/bKqbZdD8HjQ4cJ0qweCnHWhU
         OfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788571490; x=1789176290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EC+UoLptGl/DJ04FYVu43bGMcolD/XF55vuVsaKJN2o=;
        b=TnCO6FzP9xnPtDkyBKcDAsjijZt5xBmZLRRErgHWTWCLjTLtnyJ5FUELEhDwCA5ay3
         4uHtPamE21VwSUCBEpX24uPffXjzeNF70BCpFHA85yFSyYOYkDgqXxxsIWP7nCpL4gf0
         3WHXjT0FLThVVkLjkNV1ZOj7D5PkhV0rdL7j4wsACvZt+4BG0YYgwQvlH4ldFy2kNmi4
         +VhldlixZaAFcOKerK8bMuE9frm0y0mcedF/O31F7nROLugivpAlMTZ7e53z7KiOZT/r
         RGsmYXV8XAtlMoK+9qCurVOB1ntEyLWUENqNq5syUBR3Y8GDDbKLpDMn6yQSCLfNb3pG
         EO+Q==
X-Forwarded-Encrypted: i=1; AKwUvByNbA2pp92eqZ2c4C8hHnjFhMYXzHphAl/VgqzZSNCUkDNlWIPz1z9iaqId+SxejGLVgWfV4Vu2Fkg4CH3R@vger.kernel.org
X-Gm-Message-State: AFuF++lCKRjBshMSt9/r3y8jZCnyTY6e4WCprHTKSWFs24TGi9LN0GMJ
	zgCpuSjqnTpUH1DLSIhacxOBsYjba/9QdmgoQDb/rdMXEY/ufVN2lYPZCCaXWA/nZAav97IIiNM
	Q+2yhEVyucuSDNAcsX+GtvuADMHzkGcJRJ7yZDA1s4djXGNi1sQ8Q1TZ2+44=
X-Gm-Gg: AYBFou1coJHTyaAhxlDjusO52HVovZINdpgqnjnA82n8/19kQK/yvzP923wduJCa3Lf
	8ZVDvk7d5MeT+TnEZYvsKf+FWz4Oq5IoVxRzLaqOn/nSti9k5S5pc8csaSHWIwwPvL6+baOqBDx
	KkG84M5jwBYdSx0pogFXtPFu0STvgR+DmQcp+nsRGy45r4zyI+aTZoVJlIurWuPXxQbrAyt0oQD
	4DsM4PO7w/HV4QlYmkYPtEW4BNgqz2xgokyGwihXd4vT3BdadE9/VrGArUodp7FhRGAdMBKEJNg
	U9wRlzRSDwgrfsvuuFBiJv8bG547DauvKMIJhtUAA/8tRvVY7vrwXDPHIcQlu+H2+798FZ1Evmo
	bng==
X-Received: by 2002:a05:6870:3210:b0:43a:19fb:8b99 with SMTP id
 586e51a60fabf-4755135290emr10118051fac.9.1788571489932; Fri, 04 Sep 2026
 18:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-5-f3999362a9ea@google.com>
 <3de593de-6851-4a53-8309-a6bf13e9a8f7@oss.qualcomm.com> <CABz7rdBv74pZe6jDRifTKRAKzGZB6L08n81_0gCqF0g=s+FEcw@mail.gmail.com>
 <CAD=FV=VUyQ4F-HC=cmD9Ay-JHcWJCVDc5BSWRax7a6FRJ_v0bQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VUyQ4F-HC=cmD9Ay-JHcWJCVDc5BSWRax7a6FRJ_v0bQ@mail.gmail.com>
From: Mayank Rungta <mrungta@google.com>
Date: Fri, 4 Sep 2026 18:24:38 -0700
X-Gm-Features: AcwNN1UgUWUz9WtwuFEEhnVuIouQDiYsXTySw9wJv4xfiAtNyBiJ4oOHMGl1lrs
Message-ID: <CABz7rdBHLYy4V70SvbAFNs36YtAizc_4HfBxP+LeHL5zWAhuYQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] watchdog: qcom: Register pretimeout interrupt as NMI
To: Doug Anderson <dianders@chromium.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 7:38=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Sep 3, 2026 at 1:58=E2=80=AFPM Mayank Rungta <mrungta@google.com>=
 wrote:
> >
> > Hi,
> >
> > > > When a system is completely unresponsive due to an interrupt storm =
or
> > > > deadlocked CPU cores with standard interrupts disabled, a standard
> > > > watchdog pretimeout bark interrupt will fail to execute, preventing=
 the
> > > > pretimeout governor from capturing CPU backtraces before the hardwa=
re
> > > > reset bite.
> > >
> > > [...]
> > >
> > > > -                     ret =3D devm_request_irq(dev, irq, qcom_wdt_i=
sr, 0,
> > > > -                                            "wdt_bark", &wdt->wdd)=
;
> > > > -                     if (ret)
> > > > -                             return ret;
> > > > +                     wdt->irq =3D irq;
> > > > +                     irq_flags =3D IRQF_PERCPU | IRQF_NOBALANCING =
|
> > > > +                                 IRQF_NO_AUTOEN | IRQF_NO_THREAD;
> > > > +
> > > > +                     ret =3D request_nmi(irq, qcom_wdt_isr, irq_fl=
ags,
> > > > +                                       "wdt_bark", &wdt->wdd);
> > > > +                     if (ret) {
> > > > +                             /* Fallback to normal interrupt if NM=
I not supported */
> > > > +                             ret =3D devm_request_irq(dev, irq, qc=
om_wdt_isr, 0,
> > > > +                                                    "wdt_bark", &w=
dt->wdd);
> > >
> > > GPT noticed this IRQ is requested but never enabled (NO_AUTOEN)
> >
> > For the NMI path: request_nmi() requires IRQF_NO_AUTOEN. To balance
> > this, enable_nmi(irq) is called immediately upon successful
> > registration in the probe function:
> >
> > For the IRQ fallback: devm_request_irq() passes 0 (not irq_flags). In
> > __setup_irq(), when IRQF_NO_AUTOEN is absent, the core calls
> > irq_startup(), automatically enabling the interrupt line as it has
> > always done in mainline.
> >
> > Both paths are therefore enabled upon probe.
>
> I wonder if it would make sense to either:
>
> 1. Rename the variable to 'nmi_flags'?
>
> 2. Get rid of the variable and just directly pass the flags to the reques=
t_nmi()
>
> That would avoid the confusion. While I agree that your code now is
> correct, I can understand why GPT (and humans) would get confused...
>
>
> -Doug

Agreed, renaming `irq_flags` to `nmi_flags` is a nice readability improveme=
nt.

However, since the way NMIs are requested is likely going to change
based on the ongoing discussion in patch 1, specifically regarding the
`IRQF_PERCPU` flag, I'll hold off on making changes here until we have
an agreement in place.

Thanks,
Mayank
