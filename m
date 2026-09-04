Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC04F30CB
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535601; cv=none; b=NKp8Y7jpJCNNNS1qJfh+E1/mk3RMSM//g+eyJCvXeP1fHqqghtocAHwIOHFRoF7jzRNW/vkwojwvhM+b7qmJbFZKlpQ35VJEshqqYx9+F+YmVWUvgjA/AOzznjjSj2axlJi28UBTUGSQEwLICcOaOL09pd9Fhnopx+opC3Og6gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535601; c=relaxed/simple;
	bh=qNnNX/36mqoUdlV2+0R6ltbvZcLwzDeDWBL5FNc5Cio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qh+h5efAxbRI23gwMKibs/IEgTmnY0Eu1MQw8nQQ7LuoBXg31aYmpIpUZxd3SspQ2XVHW12WShQmYanBIRfJbyt/crBK9hQBLV/2aJIe97ce0mDDAlX/kY1Xmtk0NRkhEWPtmBsLFSfuEZaESW3gWqllNcbDDeF+J05h4u7O9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lUnilH8f; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lUnilH8f"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a7f5655823so187806a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788535598; x=1789140398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kxdc8UCOdo2zUrsNltwRqDpZNcgqltscYU0aNpNuXNI=;
        b=lUnilH8fqeWbVr7AFMcLyIhPLXGkTAPlq9XwM4lf/866veiBRfmZX4jmhzoYnlCN6+
         ljnCACraQE+5WnA3O3xVRRp0caU3ZuS4TABQrCACMtQ/l4RzXncxe8qY1MAZ6I/Yfufl
         F5v1xXLKbOswllszSYfXfjIpIPv/hrUssOfcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535598; x=1789140398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kxdc8UCOdo2zUrsNltwRqDpZNcgqltscYU0aNpNuXNI=;
        b=AvNQSgepFdgXv0FDQdqyElr5WTXU1TDHUidFLrqGxbgdraPdYcEUCaj7e9t3JO7cJN
         WXh7IvW+O4+yuKYtoC5o70v6Txq3PDdlQW7FeqSxwQgrXHswb2UXGPtNFu9UQARAqvlg
         /h3gDWT1DV/PpLsmBitnnf8W+sYSvqlt6pa20xfiyAx9AsJUcvsPHCsBYlTTLS6ewx9Z
         cz5K0J/vYadm1aELHVfVambWsPi+IicBY6uvKBkAMTYbGyDqIIDwlplP+xSmK7247Fww
         +5zA0ZlTI3xZizEUU4nyiMRx+KMI5ZgAASmt2U116XvCbjcRRLq2lMh3SL++dHD7MdQs
         HwUw==
X-Forwarded-Encrypted: i=1; AKwUvBwrABB0Kbu5CzCsfSSFH1Jxp2mo8irByiQXoaEWs5nyqrLrYriM1440/DULl+Z3Y4CAVNbmmyHF8707880s@vger.kernel.org
X-Gm-Message-State: AFuF++nNsHp9X/AYIq7rG9yBfwlAuSToGxt1H592jrzX/feh/LnMlOBH
	kAckpdT2xtt1uqc8pfGuJ/nT0g2aoYNGmMhyH6YWYilASS5fzeQHqYr12Ua8yunFdMjecj648iQ
	qfK0=
X-Gm-Gg: AYBFou3p5p/ocYNwn3LlKgudnqZqLGEcVmobo5gQFBOyzGLw4eeNgTZGddugezVLfsC
	gMhe1KySmRH/YQguw/8++p9/rYkjFGVGUhHUVqFqLm8P8PNiRMPrC2jF1kxDCUkjHmFCSaeZ6ns
	nLctF5mvdGCC557Hr/4M1PU3zk/6I2o2IZWBPvGI6AFjkU+AHkgaAe5byJozlNsEdp6SEWA11wX
	7Na7cXEze4K/omaDWaMqXktIGwV95+EsOl8zh5HcOh8KSX3qtpOZI0/mKQooJz/0RnVGdMWpdv1
	HAooy+A42fxU+McbQ3WhItYHow3LEiPcUH6OmBACJoNjn2cluQ2g27HAS6RmieHY4ohKJjgIft0
	15u0gLseL3ffWBrb4xrNhj5WKf/zPLpy4fx+DWo8NISuYWbS00WLEyALp1CGMGcdg7YbRDqhZYi
	SQEGFiz4tKCqOL5NmMiaOIlVvn5yenLSlvzaT45adLS8JwrbzMHBKNxLhhwQlF24L9WSW1+SPLl
	4elNk5+nRjNEjD31YcawAkgONY=
X-Received: by 2002:a17:907:6ea3:b0:c25:d03:6794 with SMTP id a640c23a62f3a-c260c9e7502mr284163166b.16.1788535598120;
        Fri, 04 Sep 2026 08:26:38 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036469sm131230266b.1.2026.09.04.08.26.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:26:36 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4858303de5dso1422126f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:26:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByuUbHzxBLdryadZX4qfHYe/KcT7Yb9UOHmYIfcFA0Mw+fhWUKHQSPMXmdMLIzPTl2f9UnN6bsnp2K3iCcb@vger.kernel.org
X-Received: by 2002:a05:6000:471a:b0:484:3311:3176 with SMTP id
 ffacd0b85a97d-485872899a7mr10104340f8f.23.1788535593276; Fri, 04 Sep 2026
 08:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-1-f3999362a9ea@google.com>
 <87fqzp8jex.ffs@fw13> <87wlt13zj1.wl-maz@kernel.org> <87v78l6oha.ffs@fw13>
In-Reply-To: <87v78l6oha.ffs@fw13>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Sep 2026 08:26:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wdqn7UiuRy1VY-qH+JYChLTEQgmj2q6Q=FBjCZ+5eo1A@mail.gmail.com>
X-Gm-Features: AcwNN1UDO0a-WZIN6LFn5huqxNCHPkaPn__17lQp2Fu-mhl0U14skIaSjsZ2sL0
Message-ID: <CAD=FV=Wdqn7UiuRy1VY-qH+JYChLTEQgmj2q6Q=FBjCZ+5eo1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] genirq: Synchronize in-flight handlers during NMI teardown
To: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Mayank Rungta <mrungta@google.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 4, 2026 at 8:11=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> wr=
ote:
>
> The driver change is here:
>
>    [1] https://lore.kernel.org/all/20260902-qcom-wdt-nmi-series-v3-5-f399=
9362a9ea@google.com/
>
> >  @@ -311,10 +321,25 @@ static int qcom_wdt_probe(struct platform_device=
 *pdev)
> >                if (irq < 0 && irq !=3D -ENXIO)
> >                        return irq;
> >                if (irq > 0) {
> >  -                    ret =3D devm_request_irq(dev, irq, qcom_wdt_isr, =
0,
> >  -                                           "wdt_bark", &wdt->wdd);
> >  -                    if (ret)
> >  -                            return ret;
> >  +                    wdt->irq =3D irq;
> >  +                    irq_flags =3D IRQF_PERCPU | IRQF_NOBALANCING |
> >  +                                IRQF_NO_AUTOEN | IRQF_NO_THREAD;
> >  +
> >  +                    ret =3D request_nmi(irq, qcom_wdt_isr, irq_flags,
> >  +                                      "wdt_bark", &wdt->wdd);
>
> Of course this is a regular global interrupt otherwise it couldn't be
> requested normally. So this sets IRQF_PERCPU (it has to otherwise
> request_nmi() would fail), but that looks like a hack to me.

At least on GIC, promoting a regular global interrupt to NMI (or
pseudo-NMI) level is possible, and Mayank's use case here seems
legitimate. Any suggestions you have for making this look less like a
hack are appreciated! :-)

-Doug
