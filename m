Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C71397930
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 14:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532693; cv=none; b=n54N4xqe3bVqtV2Vl2UppfQF/1PNpwLQc2r/qhI7PLzYO/x0p/jTlDpKHG3/4WO58z7WC0qTAdWy7bdD38FJ8AI+9s1WalVVZ68Wy+r3l/s64aOLE4P/Jew5wtbirlrR7KIyWxKGKW2bCgbmwci0rN2CYK+JMZcuG9aNmG49cSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532693; c=relaxed/simple;
	bh=JH7KvzgDb3hj1YazwEjzQhCEGqKDsL5tuzoEKmOZ7Kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bc6Ajj0D0vxBOsCHM8ECcSBnWN6RMkal9NKc8lXQVT97K9hsoht9kBgBCckJPkjYGxIFYnEU8gDKWVYlaqpnrwcLfDdS1y6TaaXEYAuEDSiHEPAzWsrYRQtp6U62dOj+SLlB5JY10Rsc/NGBxbpPJDV9CjNCNRpTn0EPNPJa8Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oF4Qok5p; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oF4Qok5p"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso1669983a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788532690; x=1789137490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=17oI+rSj+VUBq1gOiNZqYe2TLy7jpSRVJ40pUTx77t8=;
        b=oF4Qok5pjgnBOfFC0D38//kmSrl5iV8MHKBhnx/eiP5vKb2QcEFdtJN4M7+mK7el66
         36O7HGC3UAV6IsmfNepVlnbhoyiDBS7Rr+4HaP75Fa1QsoJRC0C7YYPHQcFKet25Hxzg
         gkMjD5c3hEZZQtj1dMxoGsMpLcIbjkZgdlSjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532690; x=1789137490;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17oI+rSj+VUBq1gOiNZqYe2TLy7jpSRVJ40pUTx77t8=;
        b=LlYbyfK0ARCutHnAKgxhcqwm3xhIvwtGrVvoovNLZVDVtHRQO3hkxT3CjuD4o8fYhx
         tBxlNMOTg6rEyNl7AnUHOQCL9uVrpJ6SazvuXk0mEbEPlQ1vdJZuzEwasg2eaN/U3lSZ
         PfFaJiPZqSbvdywz2B9MOaOuvezsULlxcIywMflqpTO7oyi4onyh+/NgRNZBQOYoGLuz
         dLN0yF3yG5lhwbRKdRiNc+yFVNl4PShJWgeEelrNT1KLMsGx3oiIaXHY4YNGWDFw5aw8
         K43hRQgVbt8/ofIR8jk1vaZNoOMhnzeWHE1ZxbCikToQT+LlpEM9Ra0jf+nSr6i+/rwz
         lBtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTANa0Vjh0CU9E9OHNLe+VQIxfrZ25mtWdX5RpnSc6Kdf842Pi27Nq1nX1mpCh+4THt9GyXlayLV+NQayq@vger.kernel.org
X-Gm-Message-State: AFuF++kg5OG/1JYW7cDiQ/fmh/McrPuzmiUGa7ZeNwzSvJ/GIiTWplSo
	eGWajve0YEMvbyNI9GK2gUuA7OXCmuN3Eq0PHIa1WyjpCUzrmjNE3A6/wBsLPMLU/9KcMsAdI7e
	czAo=
X-Gm-Gg: AYBFou1SAuab1wF0Ay/EaVg86oQB2ZCOIVsmhzK/pocHM5ZSVCMdI2qLdlbB9a6P8L3
	0zax1X3KYdmT75mrgJg6MwgatcDaho3cOkLplHW8iJRvAn6EpGwVx85ycbSZlP5Dq1NVyOPIFGg
	zj6GTN8m6W2foX76r39jHd3VycP720BtT3SaAbG+2w5t3Z408Ww960LndTFB3WHS1WH2WNw+Jxh
	4PkjPPRuZddbShobZdBJAaRxmWC9+KFLtA/Gvldyh8AL2jie+QNg8cmn7JqxnWEnWp5cXyG0M2t
	jH+9whBRYRpmhfKuxop/3hJzBJVRiAFU3nwX6psPSBzq9FhxRAQwly/1QiFydcBQ1YU+7jYgNXV
	2tHczVTRCkNrX9MolHEZDYVPQ1HxXlbdZ8tWfh1/S4efIfhD0aPOIv4eO9Zhi5hkNXZJkBSoYbw
	Q0stySigRLXhVGr3/hQoPKx75BrBDqJSkN+KqMgS5GKo29LI79RA/i8vIjWfb5vwQzR7Knaeu3V
	fiqMbCQIf73tQB3kjBqaERm/IE=
X-Received: by 2002:a17:907:9405:b0:c25:5344:43cd with SMTP id a640c23a62f3a-c260c7aaa69mr280462066b.7.1788532690170;
        Fri, 04 Sep 2026 07:38:10 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261f673000sm40618866b.24.2026.09.04.07.38.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:38:09 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4858303de5dso1347541f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 07:38:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4tU39BTL4XfEI5CJLKv/cKGHxvkgw8tLE0pGeHGFD9ERX1FwOZR0Xxu9NWo+uFknGSmwTjSE+nCAqeyal@vger.kernel.org
X-Received: by 2002:a05:6000:4a0b:b0:485:8c16:a32e with SMTP id
 ffacd0b85a97d-4858c16a585mr3711212f8f.35.1788532686831; Fri, 04 Sep 2026
 07:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-5-f3999362a9ea@google.com>
 <3de593de-6851-4a53-8309-a6bf13e9a8f7@oss.qualcomm.com> <CABz7rdBv74pZe6jDRifTKRAKzGZB6L08n81_0gCqF0g=s+FEcw@mail.gmail.com>
In-Reply-To: <CABz7rdBv74pZe6jDRifTKRAKzGZB6L08n81_0gCqF0g=s+FEcw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Sep 2026 07:37:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUyQ4F-HC=cmD9Ay-JHcWJCVDc5BSWRax7a6FRJ_v0bQ@mail.gmail.com>
X-Gm-Features: AcwNN1Wo5IR-SJM2QYyqYIK33CmEpWmvlDIs54NEnTFP7obdj1kaNXFucZN0GAE
Message-ID: <CAD=FV=VUyQ4F-HC=cmD9Ay-JHcWJCVDc5BSWRax7a6FRJ_v0bQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] watchdog: qcom: Register pretimeout interrupt as NMI
To: Mayank Rungta <mrungta@google.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 3, 2026 at 1:58=E2=80=AFPM Mayank Rungta <mrungta@google.com> w=
rote:
>
> Hi,
>
> > > When a system is completely unresponsive due to an interrupt storm or
> > > deadlocked CPU cores with standard interrupts disabled, a standard
> > > watchdog pretimeout bark interrupt will fail to execute, preventing t=
he
> > > pretimeout governor from capturing CPU backtraces before the hardware
> > > reset bite.
> >
> > [...]
> >
> > > -                     ret =3D devm_request_irq(dev, irq, qcom_wdt_isr=
, 0,
> > > -                                            "wdt_bark", &wdt->wdd);
> > > -                     if (ret)
> > > -                             return ret;
> > > +                     wdt->irq =3D irq;
> > > +                     irq_flags =3D IRQF_PERCPU | IRQF_NOBALANCING |
> > > +                                 IRQF_NO_AUTOEN | IRQF_NO_THREAD;
> > > +
> > > +                     ret =3D request_nmi(irq, qcom_wdt_isr, irq_flag=
s,
> > > +                                       "wdt_bark", &wdt->wdd);
> > > +                     if (ret) {
> > > +                             /* Fallback to normal interrupt if NMI =
not supported */
> > > +                             ret =3D devm_request_irq(dev, irq, qcom=
_wdt_isr, 0,
> > > +                                                    "wdt_bark", &wdt=
->wdd);
> >
> > GPT noticed this IRQ is requested but never enabled (NO_AUTOEN)
>
> For the NMI path: request_nmi() requires IRQF_NO_AUTOEN. To balance
> this, enable_nmi(irq) is called immediately upon successful
> registration in the probe function:
>
> For the IRQ fallback: devm_request_irq() passes 0 (not irq_flags). In
> __setup_irq(), when IRQF_NO_AUTOEN is absent, the core calls
> irq_startup(), automatically enabling the interrupt line as it has
> always done in mainline.
>
> Both paths are therefore enabled upon probe.

I wonder if it would make sense to either:

1. Rename the variable to 'nmi_flags'?

2. Get rid of the variable and just directly pass the flags to the request_=
nmi()

That would avoid the confusion. While I agree that your code now is
correct, I can understand why GPT (and humans) would get confused...


-Doug
