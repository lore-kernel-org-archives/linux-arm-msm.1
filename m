Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8B33F44C5
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530870; cv=none; b=kQHyzZ095FUKf04coXbK6TsaqW6sxT+9oW4WP9sjDC+L6vPplNt1Pa3+fKQtg48ZMmQvFXqYCqL64dlezwjv1Uno0YKPz1srgZdUcyWZS1+k9zT2Bg7hQs94E8cr2AtZHR1iqBllmx6Laf6BiIA3Ej7JoVEzYE1AHLSXzF8N+ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530870; c=relaxed/simple;
	bh=UR+ZEsUUsBBDR6H3J4SrQikXuAGz4zSkD4hPrqvWIrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9+g1uR+dZ1UquRyARcymhs6X2QbGWh4TuCqv2QFuXECtdHtNcINbzL2r9nTb8j/mbHU22XlWLXb1fNOisMmIB0gombWovzUTfY0eZyfEx3TryeRTfdDA7x/UKvVIjYveVYkzj/NY9odsPYQvrGy6PV5HHb5Sny1xuSH0kj5M/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mda2Leqx; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mda2Leqx"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b4af4be667so1034251e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 07:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788530866; x=1789135666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UR+ZEsUUsBBDR6H3J4SrQikXuAGz4zSkD4hPrqvWIrE=;
        b=Mda2Leqx1xayI3nEyVKfmDtKJxrEnmSlRru2wdvZbWZpBZgmvXwciUBykcAH+YGyVu
         1mM/IStHY/BDENLX+OCeUjFnot643DqdzqLmcQ76UGw+UrQ88hJkFZBLHS3R8Cqjsyyj
         WmlHPOhVlaY/AC0nL59kVEw71Tf3zz2VG8pj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530866; x=1789135666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UR+ZEsUUsBBDR6H3J4SrQikXuAGz4zSkD4hPrqvWIrE=;
        b=Ydc5tdwu7a6goPX9oMAa4X5XRevTOHJ7EQjtwf56XqGZ+OHc36yBi/Beu7XLnK304N
         VDjoVavhdizFUQHMj/WBAANs3O0hV303nobj66OecL6vDX9qzzui21dUdyGsLt5iJXG3
         yp0E/Okibyf3kMYrHfHpsHgZE/tmPB2Z6FSZeXRktIqe7OktKhKuspr53u6au+Jtm1W+
         XbO0tHx7ZPaI3xx7a43p+xfzdXyuLUL/aC8WAGPefw3B11mKqXKIcKgdbMjQgc4ZgwQv
         TOC/W7dDL358ne+JHXU8+qeIBBJOViTlwM1hwZkPwJxCnUvyhq55UnKv1Dh/MJJ6CPEP
         CJrA==
X-Forwarded-Encrypted: i=1; AKwUvBxQeGFkDUj0CtHAWkvbGttIOFklElmtj3+bOKA3zHNTHabvX4i+bWxPOLOt2QLK/qzEU8dbfHoZ4KUd4jFc@vger.kernel.org
X-Gm-Message-State: AFuF++mKdXkZ9IG9PCW3D2EzP3Ky3xt2h9ix+H4Bp54uPSYXeezP07s3
	xqQtuup8yFihg/j+qg64eIRLL2iZbYuWC0renOBePUtmB5e7cTLknltakSMluq/D6sU4jMqDKO4
	VGOY=
X-Gm-Gg: AYBFou3xyv56RKCrKYb4unhfidxAlu0N7iVNWiV+83127iwurUSNx+quUA6bFsM+u79
	DAIomZY+WwomNS4pIwaGCE7QUGabO4YGrpzGHCw1B1xych6y7fKbZTwPlK6P6Su1VPaFK153JiB
	M2mIULelk2S1dAkpeXKoxsjjPAoDfkh2W3HJTDxhhp/AgO0HcJaR8IJ2ae1YA2rmgu9ipMNNfvj
	NznDpDQC9HUultL89f7ZZ+xCM/+ZV7O0szNnJe3XgvLaHwuumc0qmGLRCZrroD84uGha58jXAtQ
	PIXX478LCRJv1LxX/Cu4K9bFtEwbYP1AifQXYVak5Pv7PNsb1+xP3yfRIAQokx8rgc+YczcWlF9
	Bm0Y4ZqZ4gcsgP5UFuR0OQlkidGwga61Nu1+Zn1GLzF2SsZCSuHKZ04U7TlF+rLHpZJDAN/yBmh
	GBwVJdE9y4Joso85hpe61epphKwGqz5FLSNUhjLPVNIaSxzFXxbMOo7PlR/GIp9EZ/GaVgHnKml
	rYc0rwIsnCLDjIYyhgi/yF9OzM=
X-Received: by 2002:a05:6512:130b:b0:5b6:183c:5c90 with SMTP id 2adb3069b0e04-5b6183c5d6amr810546e87.46.1788530865991;
        Fri, 04 Sep 2026 07:07:45 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fe8besm537118e87.50.2026.09.04.07.07.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:07:44 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48584dc164fso995004f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 07:07:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5sUyO9DvVS6NH9XQDnbGNq8/PXdT8a2y+/E4ZNG5vffba0qFZNZ8zxNeh2JpyTlXViR1WFy/3RNTCM14y@vger.kernel.org
X-Received: by 2002:a05:6000:25e7:b0:485:8920:cada with SMTP id
 ffacd0b85a97d-4858920cb46mr5715992f8f.18.1788530863620; Fri, 04 Sep 2026
 07:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-3-f3999362a9ea@google.com> <87ecf98ivn.ffs@fw13>
In-Reply-To: <87ecf98ivn.ffs@fw13>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Sep 2026 07:07:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VMExH-K68aDfNsFBnQRSaYSNwbHo7hLhpzhpWN+r+Fsw@mail.gmail.com>
X-Gm-Features: AcwNN1XtHwZHgy5raT8AjWbFs0kW9c54GiCuQWnPlGop-re52BRNMJq1xExF-CI
Message-ID: <CAD=FV=VMExH-K68aDfNsFBnQRSaYSNwbHo7hLhpzhpWN+r+Fsw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] genirq: Export NMI APIs
To: Thomas Gleixner <tglx@kernel.org>
Cc: Mayank Rungta <mrungta@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 4, 2026 at 2:29=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> wr=
ote:
>
> On Wed, Sep 02 2026 at 18:54, Mayank Rungta wrote:
> > Currently, request_nmi(), free_nmi(), enable_nmi(), disable_nmi_nosync(=
),
> > and disable_nmi() are restricted to built-in kernel code because they a=
re
> > not exported.
> >
> > Export these symbols with EXPORT_SYMBOL_GPL so loadable kernel modules =
can
> > register and manage NMIs.
>
> I'm not really fond of that.

Is this to be taken a NAK on the whole idea, then?

The last patch in the series [1] wants to promote a HW watchdog bark
interrupt to NMI. This seems like a pretty useful thing to do and an
appropriate use of NMI, but the HW watchdog driver is a kernel module.
Do you have another suggestion for solving that?

[1] https://lore.kernel.org/all/20260902-qcom-wdt-nmi-series-v3-5-f3999362a=
9ea@google.com/


> Funny enough there is already a driver which claims it can be built as
> module which uses these interfaces. Oh well...
>
> > Assisted-by: Antigravity:gemini
>
> I'm impressed that AI is required to add four EXPORT_SYMBOL_GPL()
> instances.

Hmm, I guess it's hard to figure out the guidance here. I think Mayank
is only adding this tag to try match what's documented in
`coding-assistants.rst`. If you've got an AI helping you with a
series, it's pretty much touching all the patches. I guess you're
suggesting that, even if AI touched it, trivial patches should remove
the tag?
