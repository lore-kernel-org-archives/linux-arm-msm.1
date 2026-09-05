Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD594328B71
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 01:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788573187; cv=pass; b=fNlPrtlNBnL77aXpBSEe8Sywf1KrUTj2mZWXRq3d41KmqSqhzvKRiEpDE2g51i3wjZlB7idbBPbEfgrVEzXfuLegUwEXHELAGWKAaL3nNUCEsTjAl09rg3DxrpAsunkCXr6Fd/FZxBRpcNKSbSPcw0bgCbNnHAczZGH8+uYxTr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788573187; c=relaxed/simple;
	bh=Wpt7DuNPNgIESG4CCHysgiXD1WUySeU8KIWxMrrs66w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gu2L/7cnmqW1yeW3mTrAbg0cJge+P+vlDXtTsNJImlXwRelZuN1K6U39FtzWgkBH7+ZraaSYNGWGc2b1LWK6QshJMpdpjw22uRNz9IcZJX2FEHJzKdzAjETiyOlkJFzqYMks//Dw1ttf7s6tPgojBr9NKz1XMG3JwrCuzoooqik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u2w1n9Rd; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u2w1n9Rd"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-46ac530b9ebso1412066fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 18:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788573185; cv=none;
        d=google.com; s=arc-20260327;
        b=IBpTPAR4FcnHWPh6pNrHQsxWFquIm/16EtZU0DBoPNX0sJOp2AF7fCrQzp40ZjH3lS
         ojC0Hn3XbjNAEdhNmRFQnbNzhijdUhtZbjNubV+/cwgVQYtHMUNHhxgZtXbw649HCase
         7W5n+yA+2nsHSmCtjHb9tCOlpFZ2du++5c3Wk3kNOdnpgSVd+xe8rvi2NAXg933AjuC7
         OnCcJSYmpvQeBoPe21dOPhrojawWCtP4PYkPzj4L4Woa4nXMRkHlewxVgJsmEjcdDl8t
         B/CRdm56Fi/OtmltYppGEqQLgoR561hoC5B2ML0QntI39Ycd83P5nnZLmXmvURtoxLFj
         rFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wpt7DuNPNgIESG4CCHysgiXD1WUySeU8KIWxMrrs66w=;
        fh=j5LQvfqfaiSA0UGxTMEp2yKOPC1WhvMA7EkJv89jBbQ=;
        b=slR23OLdDt1dWYsPHcd6y4RHCKlSBhR80DHFyL+tuAKFYVsggWf9DbTv75/8PRUfo+
         VkYaYieMVsLBTmUkRv32eB5kBZaXD2Y2Nia15uYyb+wyADtFaUS4p19TiREAhCCuzW4i
         Mdi5sp3N2Ag96bvuQiOJD8l/859Y26uCmHH5/AEclyYt1ud/QMTVgAUfjxIn/2SNb27M
         UtHChjxyT4mByIkz+vgFUSH3Mfya+bAjPvbgKWQvNumiggX1ZyLSKYcu8gnSL+M1/XAG
         7EXdHOoQ0SoLxFyPFzWiKM7hqVO5M0/owdo0sFZpJ6QdeLXtWMalcC6EOyCAWlGS2hv8
         gH1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788573185; x=1789177985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wpt7DuNPNgIESG4CCHysgiXD1WUySeU8KIWxMrrs66w=;
        b=u2w1n9Rdm/fi/caIGnIJx1DRzbOe7hXOBTsRChqCiUM63Hmn2SmGx7ld53tl0Pk8iD
         msb4f0eIhRBoLiWGCC6z/CmdAy4aEnAjj2ND+soRG8eA/8ESb68wlMVTp2FVJr735X8p
         hgAv3r3adoX3U3EIxoFOOsL6T7miwgPpTW2GyiRZ7d6XghS/qHattMuFvANXCUUy7T0O
         fMFhFnt/RwAuqSiQMtMHlqdj9ItJKrXjvvyzK0ae6t5AUK0q4dAVdkhcfpLrNB2b+ee3
         cJbzEM0ZOPEIOdV6avlXpfpZZ6I2b17oxZhubFX1BuYeVr/MqP5KJDodaL7tv6gd7JFi
         A8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788573185; x=1789177985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wpt7DuNPNgIESG4CCHysgiXD1WUySeU8KIWxMrrs66w=;
        b=qJRSbQ4pQKD15WOpe40xzQdbCCBFIoa0fnRQsJ0TqeTQp/QTOfMrnwCwSrKUzr4AG3
         zZ/M6KEU44O4K4SH7341W3oBXeZ/tIYkBZ+WaVOA2R+pHnZ1sSaD/ZnORUHp1JDgMfQa
         T2EJJ8xNYwGvhQPxo1hCjixOVkoxT/+2H2IYCHyqqKHFqfr4gkVFIftT/9p5RIP4vypJ
         PJy6rbYurJJqhbJOe4il9/eMyrU88KhvB95YO/rdBnF2qnxHWyhYrX90nV3HuCpPYz06
         aPNhDxQpDh6+FydEIDPsviMZHjcKJjtdVnIFQqFVBZ/n7xzFZeJeJDLhBG0R7/Yq0Ylf
         zn7g==
X-Forwarded-Encrypted: i=1; AKwUvBxrtLqFiEKOKv/hUUuEz1oYK9BpDlm24w699E3wzJtSaLgaHTxQizsKGiSHuDImndIiASVYdqqbD9TXUF+e@vger.kernel.org
X-Gm-Message-State: AFuF++loxjd/XbF6XHFCsSe01843HyOSO37SVvcClkL5HBZvyYjEiNge
	6msAm0sVeZ6jkKUaOY6MBZRqW7lTTJoEBjrlNPlgfGJkszE+ChZXRZA6iYqKn8sRyT+OAoeDPYZ
	67EHEPzI7iXaRT5wev/dWkqlgEWJ6vQgmuKc9K2rj
X-Gm-Gg: AYBFou3C88ZBKHcIX9XetZHwxyQKANPvSUb7dKX59W5T5lXTksIoahEmobNhb1KgECK
	FDPlGxSbl328N2vWrrkQuBDQmOoxt2n4yXgu72zBC2JKudx5mmXu8dBnx1GcEPZKz2Je3/yC8xt
	Dg4/kl2XJdh7O3x5k1FLfTRjnV09APdAgOix230YlwMtS4jkbIP/zxdn2kLIS1aR4MZbOa+s1+9
	3Up4ekEYAopk+kZd6MzGwFAT+0vI4iGf9YPZMaiBvCOZnQlKB5BGpxACvfpGJpo6Rr7uaFuXIRI
	ZG3nE1nRq2xmNErdAwr1Xa8sW9JgeEwEyRQ8TCb9xg3bj9IUhNdGHplay1Lvt5pOZ98ap9KsWnG
	Huw==
X-Received: by 2002:a05:6871:552:b0:470:e97e:8f89 with SMTP id
 586e51a60fabf-470e98e3742mr5556974fac.25.1788573184127; Fri, 04 Sep 2026
 18:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-3-f3999362a9ea@google.com>
 <87ecf98ivn.ffs@fw13> <CAD=FV=VMExH-K68aDfNsFBnQRSaYSNwbHo7hLhpzhpWN+r+Fsw@mail.gmail.com>
 <87y0dh6oqe.ffs@fw13>
In-Reply-To: <87y0dh6oqe.ffs@fw13>
From: Mayank Rungta <mrungta@google.com>
Date: Fri, 4 Sep 2026 18:52:53 -0700
X-Gm-Features: AcwNN1VPx2heUjeMS3C93bR1ek6ti7FrnovSxIJqv1HXxVhsBQVkdAztmW7cHPQ
Message-ID: <CABz7rdABFgW-cQ3qJC_=Q2uJZvc-JxJmUhokBztF82RUdJk7vA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] genirq: Export NMI APIs
To: Thomas Gleixner <tglx@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:05=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> wr=
ote:
>
> On Fri, Sep 04 2026 at 07:07, Doug Anderson wrote:
> > On Fri, Sep 4, 2026 at 2:29=E2=80=AFAM Thomas Gleixner <tglx@kernel.org=
> wrote:
> >> On Wed, Sep 02 2026 at 18:54, Mayank Rungta wrote:
> >> > Currently, request_nmi(), free_nmi(), enable_nmi(), disable_nmi_nosy=
nc(),
> >> > and disable_nmi() are restricted to built-in kernel code because the=
y are
> >> > not exported.
> >> >
> >> > Export these symbols with EXPORT_SYMBOL_GPL so loadable kernel modul=
es can
> >> > register and manage NMIs.
> >>
> >> I'm not really fond of that.
> >
> > Is this to be taken a NAK on the whole idea, then?
> >
> > The last patch in the series [1] wants to promote a HW watchdog bark
> > interrupt to NMI. This seems like a pretty useful thing to do and an
> > appropriate use of NMI, but the HW watchdog driver is a kernel module.
> > Do you have another suggestion for solving that?
>
> I understand the intent and why it might be a good idea, but letting
> random modules convert interrupts into NMIs is a scary thought.
>
> We can export it in a restricted way though to limit the exposure and
> force people to go through a thorough review of these use cases.
>
> That could be a subsystem restricted export or an explicit restriction
> via EXPORT..FOR_MODULES().
>

That makes sense. Do you have a preference between
`EXPORT_SYMBOL_NS_GPL(..., WATCHDOG)` and
`EXPORT_SYMBOL_FOR_MODULES(..., "qcom_wdt")`? Happy to go with
whichever you prefer for v4 (which I'll hold off on sending until we
reach an agreement on the NMI teardown discussion in patch 1).

> >> Funny enough there is already a driver which claims it can be built as
> >> module which uses these interfaces. Oh well...
> >>
> >> > Assisted-by: Antigravity:gemini
> >>
> >> I'm impressed that AI is required to add four EXPORT_SYMBOL_GPL()
> >> instances.
> >
> > Hmm, I guess it's hard to figure out the guidance here. I think Mayank
> > is only adding this tag to try match what's documented in
> > `coding-assistants.rst`. If you've got an AI helping you with a
> > series, it's pretty much touching all the patches. I guess you're
> > suggesting that, even if AI touched it, trivial patches should remove
> > the tag?
>
> I really have no strong opinion about it. But it just amused me and I
> couldn't help my self from commenting.
>

Actually, I was able to add the first 4 exports by myself, it was the
5th one I really needed help with! :)

Jokes aside, since the whole series went through AI review and
different maintainers have different expectations around AI
attribution right now, I conservatively added the tag across all
patches. I'll drop `Assisted-by:` from trivial patches like this in
the next revision.

Thanks,
Mayank
