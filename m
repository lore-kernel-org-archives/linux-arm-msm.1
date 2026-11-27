Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795756301;
	b=4gE5hipjy1Y7TzbY2rRtX4Ofn4HLX6cC9gB/UvbR5K9nQTD7R8M+brVPgMVPhKfNch72
	 UteXvYLyNMNucUJmup9woiz3rcg6x0xR/jwzucSCMZEuQnF79KkSjOeujnwbdy2sbxIoa
	 zYuJB9P6yTaOkFUuijkvie8kQo5tlNZEPoSa31R0yvxwPO3fv3X2RtWw9DrvXiMPA/JwQ
	 S2LFAN1T0GiPJ2xsM3x8b3ayVwW8LwvI7YEN9+jF/HjNxqayaDIhRcN/qJ9GkILAc5B6N
	 imUQtDb2Y2wjtZkV9GYAyY2cftlLxR2r/VYR0Nwl+YbcIcqSoZYtKoXoIelkFlqFDJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qmFinXlRdGL9t34+mLPwrAd0judk0sTSkDIqNRwhWAw=;
	b=D+Yb7ODjxhC0G85XCrGXjq4aUoR/ON+LRROjznSG9EIVyoUw1pqQWGd68jML7uiZuT+K
	 tsK0O7CEqoLTnMkxAi7yxvJ/CeCG+ATy5uactqUoivOiFZfS+A4T4HCDqOlTWFbNJBEN+
	 CpvXhCn4pw6i8NznlG+3Cw2I2C82m4JAf3kcoGciAlX8DiUwwRPkjiplV14I4psefRTz8
	 HT4EH62HTxRCELejTKkE9bUuR0dScHWXVhw6I7Ztb5NvSlFfqI4xKUwXpv9h/Y18P9e+0
	 2NHUHat5LYTs6h0NwXGDL1r1uVcwe8gO7fO8lkX6sJ/DrsUMgtZaVGhGsiJeiCHx/1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOD8TyNc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54F606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE54F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOD8TyNc
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3acec6677so11730068c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:11:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795756300; cv=none;
        d=google.com; s=arc-20260327;
        b=aJEHZCyt9pUFpy58dJDOU6t65r7oMkcbdyrdK8ne3FLp35fJsIl7gdWXJQYwbCeXZT
         Cc0/jRfX6iJCZru9gHtwgPzv4EifuV+Lyc82KhJzYN0OWgcTQPswfCEQAT4CdJQ1t4J8
         FZ7DcbVExI4tobMljmkuW9c8SqjeTp/n7q8rJ61mUbErO3IVwFVbWz6ixbtom+Yn97BB
         GBFcc+n8tiECQKl3HhV+MkoN3Nf17SFKpj8Y+FKBFIjScIsJOkjHxjNMC0zk9YAkagA+
         6Jsg8H84b1fWe2di9XVnHkfm9noO4rCkS47SuhsRP88k1ECdG5BfVt3iRsQZ0g0QfQyG
         2fkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qmFinXlRdGL9t34+mLPwrAd0judk0sTSkDIqNRwhWAw=;
        fh=TS/TltHMubhWf9khPIxhV4aYZe/ZL2rxsBemGANbpG4=;
        b=ZLNMFOkTWlfn0rWXsBQMipPh+yae9KWCgZh2vBau9aYDtBJuofjru6vGe8kPD6lZJl
         U64HihYU1LU7onwMvmBiba6PtMLqymyUehQFHAv70OglWCQg7a8UyIaBG7WJkp1V75of
         8d/RR3NkRgezBKdPGrQKPKes68ybieeVh6QG+g9s5mQNeQ/n0zbDhKVpe77wmoVwGI2E
         GS8E3EVJNrLqpg9k7z78mmRNNE9nSCq7gdg3Sf7uXyRoBQeRjTQtX/SeF8YbHBMIRysI
         705/WbqM8ZGjem1XwIQSMyHSN4BnDz40OLjVKVG2AhJCXhDqh/VBkC7B9VD06P8+BlZU
         l8NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795756300; x=1796361100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qmFinXlRdGL9t34+mLPwrAd0judk0sTSkDIqNRwhWAw=;
        b=BOD8TyNcZN983BLpvCaoE7KEH9OSMQWvE1uxjOE58sGkTnhvkRSxqNCtzUeb4JCLbD
         DGWln2zxPhYbh9HiZoMmRJPYhBT654feOs5WV5DJa9KMzGQHCJF3AEOkm/ipYrX/p3b0
         iz3UANNhR0Du2gasf2+qwYrLkFCaXMr7QQVE41fGAD3hXVBZhOAsB/CUBT7u7VOD2+Kq
         +76pAtBadMloSJ7GizpXubPlsePq/yh39zP/FnfK/0qIZDXVjLEwTOn0LGynDXEC4G27
         G+RwHnnh5qz9a9Vs/j2HkCMN4PBmqWZx8bJ5Xlg2mGi8XVVz+QAoxC/u6zbebUnXGc2k
         2G6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756300; x=1796361100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmFinXlRdGL9t34+mLPwrAd0judk0sTSkDIqNRwhWAw=;
        b=ypTlKfuFkkbEfEID3aVAzVXUGa3oxLuUec0YcIslhsgBVLZssodOxDvFP0RHia9fHy
         S/xS79tQyjyVgL/BLyPeIV0dA2Rftea3UAmy42SPE0cKNyyoyeMqNZQDgqbNRAY1A2xR
         IwhtR+4nsoCBBOJ/Oo79LxpWAinDSZ34rJn+Ogum/axAf9VGXIw66Fwgi0p8+YuoWZpy
         7JRZ1NrhHJU1jVpqMjnxrwGvOPKSjRGpF8ZMAaD7pQenuvU1NvJ3gAMHz8BsWK2SCvvv
         osK0dx4sSq0p0q3OG/ibTPR2eO83SKYg36N/iZTmXVXJazNhnqjotQZ2DAJ9RPYTglKw
         qp7w==
X-Forwarded-Encrypted: i=1; AL+hErH2ZVbDT83UIEDuBTfwk/R/mhMj8yKUFg4B+OP2WLkHK4PrRab2mZKef0JdlHYaeZpEFDrIPxNUoPxhKhPw@vger.kernel.org
X-Gm-Message-State: APuU4Z+ULk/oX8TQ6T/HhOGKWf6lm8jOpTFUJVSWZ8sE8CGE9/vG1l6q
	iqzZuPmotoGSSrOQSBWvuXVOpIo9aJiAjUR9gYJYdHOzkEmS7LJUNiQnOh/eBtAGTjwn/u/MlMa
	BZkwLVr4mzdsOFOga+TZhwJFrwuJgbyU=
X-Gm-Gg: AZFdTZet+2F6hr4vFIwMk483ayZ6ZxbJFzpJq2FjVs71DaTYZ3OWKXPPfPHhlB0+mhW
	PSL9UwH/KqZO9MgnpT/fwSLvompqPZqacrl0l9N0G8Aofv24bDBU1kXVZ/20gIdmSKLwUDd6w8P
	hpl38NDgspiehnopGYCLzuU5VOnbDv7RO2IlU8FiykqSMqJ04Xk34Vr8EUwCurAHBJDSVbDSUYm
	nVbxfbvUXzCR6/69yj3WcHGLVk2dBpbP8cFq3XaCZrHAVqim8H/j583omVGS9hUuMATsSEr1H1L
	XqT0ZSQ+IaQljPQYYSpg71XVFJespE4LNujahpnpTA+t++Fun6wS2/q2iV+/RDCd9ncuNSENtsj
	i8yMmzInLr+F76Wc7rSCBM6oZHUJo8F404HuidRh3uyVBPJL019lFobwS8NmJMDjhoH2q
X-Received: by 2002:a05:7022:299:20b0:1b5:7c7b:c1f3 with SMTP id
 a92af1059eb24-1b57c7bc2a9mr11684307c88.15.1795756299924; Thu, 26 Nov 2026
 21:11:39 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADy1qsZaucfiZPbMkLaXE=_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com>
 <awjwkhoHNOPcHz0o@hu-petche-lv.qualcomm.com>
In-Reply-To: <awjwkhoHNOPcHz0o@hu-petche-lv.qualcomm.com>
From: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
Date: Fri, 27 Nov 2026 00:11:28 -0500
X-Gm-Features: Aa3M54oUYQNaKcIPjhELzJMo12Yt9TjJU4-cZ7AYDd5pB9PvGwmXBVlBMZtq_nQ
Message-ID: <CADy1qsbhYnvSoV_M6o2vWk_0-EjVxtw9oYJTDWazeSS2ZPTabg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types
 on unbind
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thanks for the review.

> - Change the name from "dp_hs_irq_type" to "dp_hs_phy_irq_type"

Done in v3, for both fields.

> - Add to Cc for stable tree.

Added.

> - It is not needed any more.

I deleted the Assisted-by lines as advised.

> try to send with patch text.

Sorry about the attachment. v3 was just sent inline with git send-email.

Felipe

On Thu, Nov 26, 2026 at 9:53=E2=80=AFPM Peter Chen <peter.chen@oss.qualcomm=
.com> wrote:
>
> On 26-11-26 14:41:24, Felipe Infante de Castro wrote:
>
> Good caught.
>
> > Assisted-by: OpenAI Codex
> > Assisted-by: Claude Fable 5.2
>
> - It is not needed any more.
>
> - Add to Cc for stable tree.
>
>
> >       int                     dm_hs_phy_irq;
> >       int                     ss_phy_irq;
> > +     unsigned int            dp_hs_irq_type;
> > +     unsigned int            dm_hs_irq_type;
>
> - Change the name from "dp_hs_irq_type" to "dp_hs_phy_irq_type" to align =
which
> existed code.
>
> Others are okay for me.
>
> I not sure if Greg could get the patch with attachment, try to send with =
patch
> text.
>
> --
>
> Thanks,
> Peter Chen
