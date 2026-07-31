Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B4335555
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 23:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539921; cv=none; b=Z+KFD4+BLCxO0B/LXDGeGoSW/Q9ImrGdE+l58/1FJ32u5OVGF0RJqesEAAgxjq7wCW8R4+LqmcChtCba+LjHE1jbdupNjt6DYnwBHX891SgPGEN527Ccuno2yjvBeR1K+SrTVNRs45DTlmpkNPgVKTQvaYvIIO3qmJ6IrXmY4dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539921; c=relaxed/simple;
	bh=piLOrm8QujBeaXbtopyNtAe+FWUs9JEGlUqoE/A+WWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkJ3/OvwSy9L3selunEeUDxt13VEv8feUjJh+v0zcQ8ojfHiRlrJG38KrdgNDrUZhXnnLmDDXJA8VT6o4ykVz648uzhEXwjCrKKfmK+cdN+AVpyoh94E2dXTU6Sz0ymCcUlPQSEKteTZ/Bhtileu28CKnSBQCrTkIb116vbIwdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UzjFtRuN; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UzjFtRuN"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e6c4a867cso106028485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785539918; x=1786144718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wMNXqyCOmkYNRv72Rrj9uzXvfgzuwGFQnDJXnRWaJkQ=;
        b=UzjFtRuNO8Vl/Vcx12le+F9hDPI+KM5lAkRrKLdeWcdeCAQStuKatwDImv5MxRcxfK
         4r8m3P1qQUmg6Hy2BP0I5w+IjYVgE3wRjDc+InNZaUxaXs8E2kU5vvG8J4W+KQ59s73j
         ESNlbw2IOlavWuzwCTP4G3QYosz8o7l+wulZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785539918; x=1786144718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMNXqyCOmkYNRv72Rrj9uzXvfgzuwGFQnDJXnRWaJkQ=;
        b=dOCvo/OrEhap9kocxqWf7hYz7otfpzKtqBm9ZAVz1yeREcFTILOInyKEMqI7mK1Ykm
         Y5nDyFNxU4L9W4IOGF2NYuwoYPuS78F8Zxm17UoPx06yH5Bx89i9+fsX81J45o4+woH3
         ehKhOf32aIuog7OMaLZyqrcO5lbhEetCeqfdnmHIsDw/wvTuCggZpV3OCqVqQpXxJIo0
         tTVaS2WACtkPlzhik5N8CivebWL2ax9e5pCh2yCdIIw+Sc0VH/puCV8aqfx63CVvHO2U
         fL2BRsyulI7Y5K2NXSsC5kYZ6umVGcsYqRFR194r9kN18v9Oe1HFs9ehwqzOIb5E1F8M
         TN2A==
X-Forwarded-Encrypted: i=1; AHgh+RrNRhEpRcMNSTNGxV8mrdGFUlpZRz9ej++TjoQj5lP2nU9FMLe5jNAR5a7k+ua9uEGnmUMIvJ6rbO6aNLHv@vger.kernel.org
X-Gm-Message-State: AOJu0YzxEcOG7tgR+mKFPx+eFqQVkaUJif/DqcLH4xYWvzB8gr8n0eRn
	11bJbmc6e2H+IqrzjyBmFiA4lK8BYytr/RRzbJp/SVBU5bTlUE16HyAC+ruIXau0bnfjJokYWLS
	LkAk=
X-Gm-Gg: AR+sD109xBEA4zmBDQRf4QSr0EBKO4DFQL18Kqv00lav24nwLJxLNc+X9C7zg7QSKHU
	3CWVLOr7PVDpZCeJdEuiNXIi8VAHWDitsADjtwQd2sWZhHch8vTcAH/JSHqx9cigdA+ulmntQA/
	wQIWT0FhCXAtm6tCHU5defCubSZrB5VBpvjdPFu7qh2GCVp8ve4xtsIyzjF4+pH0KRa1A4Gl90m
	U3fh1oZ4UFxMdKjLgn9RTnPvYQ6XBvx6Z2PSr3EydQ6qy2SjCIvs1FzENz+E4ccsBbGoH2S98Ib
	0xB0loOd9ebciKo2+f6a2VP3ULr4he2cLnnEJktzJA06d+kLXsyoCqONFEvJqBhFyUu+i2AbWPf
	iDOu4rgvuV3ybD8fUwAoreQMbmabf6wnKHAJcxVMP9lwSlXHC60B54JWpg2LnK/cl1Z5cfoNQDI
	6yn8WPsy8MKaEA3JuD2YWxUT4N+f2EWkw0vkOW25U2WGjNUA4WM/B5VfojyZ8Ztj+YUCxD5Th4B
	oL9M76mQKDVcqnnJm2KgPX0EYieYMU=
X-Received: by 2002:a05:620a:2403:20b0:92a:1b20:fe0c with SMTP id af79cd13be357-934a07a2c16mr321987485a.17.1785539918359;
        Fri, 31 Jul 2026 16:18:38 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349bc25f08sm161386185a.9.2026.07.31.16.18.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 16:18:34 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e533aacf2so80310985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro58xIKgM/onn3l2GKnKLh7LnU68DZx9untqMV0Qs1dW0P7lZbxvqCjqCZTLFVBYO7Fpb35w4Q3wrkJZAll@vger.kernel.org
X-Received: by 2002:a05:620a:284e:b0:92e:db1f:185c with SMTP id
 af79cd13be357-934a0aaee08mr439271285a.43.1785539913417; Fri, 31 Jul 2026
 16:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-qcom-wdt-nmi-series-v1-0-3aa86d162914@google.com>
 <20260730-qcom-wdt-nmi-series-v1-2-3aa86d162914@google.com>
 <CAD=FV=V+nrmtK6FJ2G+LGnvxkLEWMR+2A253-gQ2smxf9LoEWg@mail.gmail.com> <eddc90dc-3223-4356-9e9b-350af904b144@roeck-us.net>
In-Reply-To: <eddc90dc-3223-4356-9e9b-350af904b144@roeck-us.net>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Jul 2026 16:18:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XuCHdOv8kct63JzmbgjxJMxL7fc75KtAQL0hbJc7_v0w@mail.gmail.com>
X-Gm-Features: AUfX_mysgNutKcBTutK1mEbZpcf0AlDHDz_V7ZfULfi6icv580614osxqcrqNlM
Message-ID: <CAD=FV=XuCHdOv8kct63JzmbgjxJMxL7fc75KtAQL0hbJc7_v0w@mail.gmail.com>
Subject: Re: [PATCH 2/3] genirq: Export NMI APIs
To: Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@kernel.org>
Cc: mrungta@google.com, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 30, 2026 at 3:55=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 7/30/26 14:49, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Jul 30, 2026 at 2:33=E2=80=AFPM Mayank Rungta via B4 Relay
> > <devnull+mrungta.google.com@kernel.org> wrote:
> >>
> >> From: Mayank Rungta <mrungta@google.com>
> >>
> >> Currently, request_nmi(), free_nmi(), enable_nmi() and disable_nmi_nos=
ync()
> >> are restricted to built-in kernel code because they are not exported t=
o
> >> loadable modules.
> >>
> >> Export these APIs to allow loadable modules to register and manage NMI=
s.
> >> This allows watchdog drivers configured as loadable modules to registe=
r
> >> their bark interrupt as an NMI.
> >>
> >> Signed-off-by: Mayank Rungta <mrungta@google.com>
> >> ---
> >>   kernel/irq/manage.c | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> >> index 2fbff2618a1e..fb0b8da32f4c 100644
> >> --- a/kernel/irq/manage.c
> >> +++ b/kernel/irq/manage.c
> >> @@ -766,6 +766,7 @@ void disable_nmi_nosync(unsigned int irq)
> >>   {
> >>          disable_irq_nosync(irq);
> >>   }
> >> +EXPORT_SYMBOL_GPL(disable_nmi_nosync);
> >>
> >>   void __enable_irq(struct irq_desc *desc)
> >>   {
> >> @@ -833,6 +834,7 @@ void enable_nmi(unsigned int irq)
> >>   {
> >>          enable_irq(irq);
> >>   }
> >> +EXPORT_SYMBOL_GPL(enable_nmi);
> >>
> >>   static int set_irq_wake_real(unsigned int irq, unsigned int on)
> >>   {
> >> @@ -2080,6 +2082,7 @@ const void *free_nmi(unsigned int irq, void *dev=
_id)
> >>
> >>          return __cleanup_nmi(irq, desc);
> >>   }
> >> +EXPORT_SYMBOL_GPL(free_nmi);
> >>
> >>   /**
> >>    * request_threaded_irq - allocate an interrupt line
> >> @@ -2342,6 +2345,7 @@ int request_nmi(unsigned int irq, irq_handler_t =
handler,
> >>
> >>          return retval;
> >>   }
> >> +EXPORT_SYMBOL_GPL(request_nmi);
> >
> > This seems reasonable to me. One thought I had was that we could
> > possibly get by with fewer exported symbols by changing
> > disable_nmi_nosync() and enable_nmi() to "static inline" functions in
> > the header file. That being said, what Mayank has here feels slightly
> > better to me.
> >
>
> I don't claim to understand the NMI APIs used, but Sashiko's feedback
> seems real to me. Someone who knows that code will need to confirm that
> there are no unexpected pitfalls.

Since Sashiko doesn't reply-to all, here's a link to its feedback:

https://lore.kernel.org/all/20260730214758.DBD5E1F000E9@smtp.kernel.org/

Indeed, it does look like legitimate feedback. While the problems are
pre-existing, it is true that exporting as a module could widen the
exposure because the code backing the NMI handler could now be
unloaded.

I did a little bit of AI analysis of the problem myself. As far as I
can tell, it would be relatively safe to implement a synchronous
"disable_nmi" by just calling "disable_irq", much like is done for
other NMI functions. The caveat here is that it would only be safe on
IRQ controllers that provided irq_get_irqchip_state(). This is because
on NMI we don't set IRQD_IRQ_INPROGRESS and thus
__synchronize_hardirq() will fall back to calling
__irq_get_irqchip_state(). If any controllers supported NMI but
_didn't_ support irq_get_irqchip_state(), we'd silently skip waiting
for NMI completion. Maybe we could simply make it illegal for a
controller to support NMI without irq_get_irqchip_state()?

I guess maybe we need Thomas Gleixner to weigh in on this? Thomas:
should this issue block Mayank's patch? Would you expect him to
propose fixes as part of his series, or is this something you'd prefer
to post patches for yourself?



-Doug
