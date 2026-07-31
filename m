Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1741B3C1D56
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 23:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542110; cv=pass; b=YMBCOcudcVIU29NGGi270ea8TfIFn9TdVCdIR3Q8/4VD52ynZGN5Z3p5Hs9NP8qWjypHOA1Bu5HxnnCIv1MPOrqxHv9vSQFQ7E+y+1mvso/IhWhMJD5aMse7W3lDHq7INbb/WllWbiDf6ztBP6ND/knv1nbCiuShUJEZJdaCAHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542110; c=relaxed/simple;
	bh=C9VlLtKmH50xsWwtRRP5IuHzCSCmAklFtjY3laGwjFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIRSe0xSxTOQH5oFEfkBe9jZXM7iTtZ8sP/bSorHwNzzA5TEDrgov+Q3xpg9+j4WcztquAd8tcnRQelN7HKHt/DwOmy4IGqtysg4VBPxMu6x0RR9cqWO0I8WR/iRcWhzXPTCY4B53QP+i2dJF92Ai2v145SmlLe4Rc76hoAhh0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TDhbcvN7; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TDhbcvN7"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-446f87b6de1so1028515fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 16:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785542108; cv=none;
        d=google.com; s=arc-20260327;
        b=WhqFQgITvFplbgg5iNg0uhRpR+nHkRJ2qgWog1KD67TiDzr8i36J51CNAbl14fNs5d
         G5EkjpAV+gBOKhYUz3w26/2ctX/90K7omUrXVJnJLSyMxxqyYpbPsJskJBcW3CPy6NBt
         FAasgUniEuMBil+5P9aFN/Di5vwqKGhO+BblSQDF3so282kza8LWbukFlevwh0rJF5zZ
         1faUStPlPX0Flb3sdOs0v0exihx7thMGo7Oczb5S3u4e4hsvj1kE9phlFzWkD8EIa77B
         veL6BZ/tlk1GGURGtgz6nOTn/LW0rpxmgWvmngPmuIsNujV8W3FZbJFe2YPkWFkDIuvf
         ka6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HXfQAMpxkfrzDAULgv3rbxEWuE5UqJmUxJ1EP+tc8ro=;
        fh=0Xu2ZAxsYj85Nw1A51yplbtgrgfrnRt94HBGQ97uAwY=;
        b=ZZoR6lC+q+8zrSZbxBqCOSvTVbFZHRHyI/cFsM43+qHK/dAZZAJACPvKhD2bBsZVXe
         wlf0WG9TbldIEUQ42/IqvDzWQ/VtCGGEbfGbbV22QcA2Yec+oUJW+7rR32NqRYrBOJ4M
         Bha5sxRqMPbY242iU3A0ut/MH3JzpLCTAX0nhrQcag+iOWyLRJnuqlcZfMI3XWBtx+/l
         mpNxPIoiE+92lGH72Vo5Rfk8x5iiyvwfnyAMTIGEsO/AclMiMT0C31HOkB7+hmYPxhCp
         g6xR6LGBjBA3ElzasPg3vX5AuXNe/XpR7Ux8J9C6XG3AEmv2ByJdnCNBCe0fD3/AjixO
         4DsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785542108; x=1786146908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HXfQAMpxkfrzDAULgv3rbxEWuE5UqJmUxJ1EP+tc8ro=;
        b=TDhbcvN7k8JUpjVxh8InGD1gMmKbxjRN0+SXqi86FjKcFIB2MG56e+geOujWk1f5Mt
         c6sEmfO6Jjse7L7XijEl/Ra0o9iKR5zd+JtCo5474iZxsBoxeeGVoiKzlAGoSdwdpWVa
         Uakr82lfrUPuzkzQbuz4ajT6Rt4q4KVeUdg63y5JplOFdE88aW7moGIZJEsHD/X4Bwj4
         pY6lziO1gMjXFUxRMECwfQoBUcLS5mmcTZlCY+S9x0whju+DmO/5ysogPNIlJaUxWCGw
         x/g4044u9dLGpQk9iUmOwsl4HRQvbIAJ6swzXMsOz5AYh7fs6AgVNHNfKfWPPChEF6qH
         znOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785542108; x=1786146908;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HXfQAMpxkfrzDAULgv3rbxEWuE5UqJmUxJ1EP+tc8ro=;
        b=F3PrxzVLH4tKwvquYEzXi+rqjo3vjuhBB+TPCTp3iF/Kx+GoimVPSp7pfrFOAzjNq7
         Wej6cRSuWYRwxipsnx1+SQRArjaT5tbSEfBo+ALADw6sTP8YaClgIMu73QXwQ60JciEu
         knT7MAecANoQUFYw+HbRtgYtojl04oGHSwMoCoccj7CcQz0Zvoflti5PHcYQY4m+sUU+
         /dWytGAyA+cHkIzdYnTk+ukCaWvfGAz4PUGABVIwuNrilpTmtn9boblSwVjUnvGgRHYY
         2CsLnWhRXFF1fDU6cQeu2kQ7aitqPD3V3NKIEUF/97oynhyJOrFtpjZMm2Uo4dIZsSLS
         QokQ==
X-Forwarded-Encrypted: i=1; AHgh+RocR5XR7bifoyPJ6oUevrFpFiW3A1lEdDBEKYtF4eryzNEvZ5ip2m36lFPJbNqKvuIemRo5OY4evGujGwYn@vger.kernel.org
X-Gm-Message-State: AOJu0YxUqHad+CgZ/UQ7cdbZmMUlmzwd3ojqxvtnqnKMdRZSzk0lQWXS
	BoLX5brObTepqlUH3Xjt8a910o8VnRJsV92bdW/GCI5WdxizYFLVDtZtvBOEFhCF314soG5T2D9
	O9RnbazOkb6X/Gtn6qKDdRmKX3MOT/m7fkqJTyQqJ
X-Gm-Gg: AR+sD114ZE+aOAxvNlCc3uJN5MFdbLZBQFf65+UZoXFnWTEjWqtAYnjEJBroZ6ujnal
	eX/Hx3CGVMjLHP0aPnOQMghn3RKMa2w/PCTCsRl8GjoO2QOSla31mQDlJ7taf0rRM53nSOr/vr8
	MquzSh+K2RN+OJrjKJg75K8WicyIx+dCQBtftvOo2OlDCSI5ce1s+/ub0hkBDT8gvD0QqFuF8wK
	k6Bh0hg/JO4524lZJjIEFWGUE/Z7U7bC06FZcRlvs5W9WciODpJ1/x60NXhpnTQomjbmAVUtcNO
	tFbDfRmhBdtXVAfRrabGJeQC2KZLqkKztXqBuIj0E9+/EptChMGR5eyczqvqHufmcDpGEGHtmHq
	+
X-Received: by 2002:a05:6808:5296:b0:497:e0bc:afe2 with SMTP id
 5614622812f47-4af5dfec982mr3921572b6e.4.1785542107445; Fri, 31 Jul 2026
 16:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-qcom-wdt-nmi-series-v1-0-3aa86d162914@google.com>
 <20260730-qcom-wdt-nmi-series-v1-3-3aa86d162914@google.com>
 <36a7bd8e-7e00-4df0-abd4-e22b86e91ca4@oss.qualcomm.com> <f98f6f9c-9cfc-4fb6-8a1a-776b480bbad3@roeck-us.net>
In-Reply-To: <f98f6f9c-9cfc-4fb6-8a1a-776b480bbad3@roeck-us.net>
From: Mayank Rungta <mrungta@google.com>
Date: Fri, 31 Jul 2026 16:54:56 -0700
X-Gm-Features: AUfX_mzL_k9dmpX1ZOF80L0TrrvY4HKPp3atSt-zCeEnaDgw0LGyEmIOq5UxHsI
Message-ID: <CABz7rdDtevcOrS=3cmE8Ac7PYWaPmu=Y+NoJp07pc3ZQr3Pc+g@mail.gmail.com>
Subject: Re: [PATCH 3/3] watchdog: qcom: Register pretimeout interrupt as NMI
To: Guenter Roeck <linux@roeck-us.net>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Thomas Gleixner <tglx@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>, Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 7:12=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 7/31/26 04:56, Konrad Dybcio wrote:
> > On 7/30/26 11:32 PM, Mayank Rungta via B4 Relay wrote:
> >> From: Mayank Rungta <mrungta@google.com>
> >>
> >> When a system is completely unresponsive due to an interrupt storm or
> >> deadlocked CPU cores with standard interrupts disabled, a standard wat=
chdog
> >> pretimeout bark interrupt will fail to execute, preventing the pretime=
out
> >> governor from capturing CPU backtraces before the hardware reset bite.
> >
> > [...]
> >
> >>   drivers/watchdog/qcom-wdt.c | 55 +++++++++++++++++++++++++++++++++++=
++++++----
> >>   1 file changed, 51 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> >> index 49bd04841f0c..19d8e91cff40 100644
> >> --- a/drivers/watchdog/qcom-wdt.c
> >> +++ b/drivers/watchdog/qcom-wdt.c
> >> @@ -51,6 +51,9 @@ struct qcom_wdt {
> >>      unsigned long           rate;
> >>      void __iomem            *base;
> >>      const u32               *layout;
> >> +    int                     irq;
> >> +    bool                    is_nmi;
> >> +    bool                    irq_enabled;
> >
> > Do we need to track this? I think we can rely on the framework
> > NOPing out multiple ops->start requests
> >
> Good point. Agreed.
>
> Guenter
>

Thanks for the review!

It seems you are correct. I initially added irq_enabled to guard
against duplicate starts during bootloader handoff when
qcom_wdt_is_running is true (since qcom_wdt_start() is then called
directly outside watchdog_dev). However, after inspecting
watchdog_dev.c, watchdog_start() routes bootloader handoff
(WDOG_HW_RUNNING) to .ping instead of calling ops->start() again.

I will remove `bool irq_enabled` from struct qcom_wdt in v2 since the
framework ensures enable_nmi() and disable_nmi_nosync() are always 1:1
balanced.

Thanks,
Mayank
