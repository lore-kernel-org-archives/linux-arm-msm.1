Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7091367B8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812453; cv=pass; b=PyRZE5rlhRsL39s7oN9QlH/7y6txDosSLj5xiqxHWW8ng+B8qdYEylY4p/YIO1Muh/AnB4spOWhgc1CiZ8ZYserrN7XAS7GxSxPkGOiQp3VLGoXmu8l7s/41dInGrgkos2inoaMs1EeUIECxRcz/O18shtPnm274Q95+4iw656o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812453; c=relaxed/simple;
	bh=tr28fG4ZEXTsiIAwMe0wjF7BnaOQzBQT7Xkb6b/2La0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMyxS5pLNegz6mjIgxwKYFRZfAVXZlRDUhg+2vMlrCnweFeMx3sMbMqABA69VYrJq8WsTwLMBxMNKNi0s8Zf30Q4ZaAhSVt/ia2XxfRuE5RWckd/iWEZeb1bRGomqhun67VuBxDrWc5WDjd8I499Lx+77hE7lbCntgn8asS8Jz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRyjw5dn; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRyjw5dn"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-98c7353395fso387779241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791812450; cv=none;
        d=google.com; s=arc-20260327;
        b=qVeVWyXbEqJxN6otz59nVBfq8Liu1gBaspwURGpHHb8fzinQv2bcs2QVbfIWckQdc3
         iUz3PC0ywhri+k+Id3oGFRI/DpBxS3+h6veFjWSDnWfDjpYkq7dtlA+BJLxOWltayAkO
         FPXKy9GNMnC16hNJlp/Z7Zg2cnyblyBHrCmsuugR1bW8HOIXq/FGlICFFd1cPu3dUwE6
         MJ3IEs4EbX8T8JBdSpjvfuTtZoD2EIGRNt6JgYG5GjMdAh5QfsgoZpDzJuKmOLMufjuF
         +AdqOwgfQ5Rq5ABvnbkImqp+ynLVhH7glIw1Z+SvtklSXxCA8oVxwNg4hRMarWj70FfW
         upPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fISPJgkN0H7LYXqIa8i3iQfM2z/jXKgb3BG/d5Eps08=;
        fh=WGyjuwX+s6gWoR2X1N5ru3w5xF/zadyFJbLm9LEyeb4=;
        b=m2hUaVIWmYkdwdK5hG7iS8ChWHZF9a95PTwuziL4ACKkzh0Yrefa1gbE2+09O1WWOo
         17cVrU8cEk6aRfoCkEJLxlPUYtizOsV05f/RMSizJRFIdkEtjtMBcSXwiGf02TUz7gi9
         9vrwCE9aT4ozulifunpB2Q7vTpf98tVScCON+WzyqnSAifCtVCXlT0ucmIbjDlKWmOga
         qpDVRaWT6P6XlRAadbuvRst5oQ0SjyklCoQeBa+yINAN8tTaB+dUXnuVeAca1CMcBzcM
         S5XldYU0L0jWrP+NUmEvi2Eaor1sfrw2p2EdctvgHAnnCFGLtixm8z4Yxa85X0iFS1/w
         3h6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812450; x=1792417250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fISPJgkN0H7LYXqIa8i3iQfM2z/jXKgb3BG/d5Eps08=;
        b=pRyjw5dn/Kruk86zA3s6mVhdAv8ouj8o7tcJm6whzyn4iWhpQ3HHDSic7Xl1JDla1i
         S93Ivg8rG53EMXchKK2D4dQI+ku4SKe1rMmTJrdsN5woBsaOK1lfMUPsYZuvFzrdiBik
         znZmmtWYeAH/W0Uv9VUm0tgU7kOSG05qmowkKcBohyGzJjyxE4OWMkF9MTSDbASdNUYV
         t/G6TP1PJSahD6Dg8URPLbg+mNMjnHolUiVZQz5FQ6/cuh0lMDaztNBLN8zAc7EJdY9s
         0hPVlflfGWec5E8dbNP5LXf29vF03gaQqlokKoeNX/VuiqwOIWbGMe9raxJNqknwvteZ
         pNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812450; x=1792417250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fISPJgkN0H7LYXqIa8i3iQfM2z/jXKgb3BG/d5Eps08=;
        b=p9cr09D9pEnFS1FD9eHo6QeUYGvR/NEzubH++9GkcJmhyuBFxOR/2mCsdvOuzxSwTP
         FntaNSZ2rkou8BXyKDrn+PjxrS93bLv4alTotKJf+mekCmD7zzzV2mVGAcvD7PumTVv5
         eif/4XO+vNfTZL/lPa3bXYf85461mGd5sd2PSSfQqTZCof0wZ0df11ebiquHJtCppVqv
         X00kjMynzWSdVkuA+oC+xvNaYZ1tv6lZZbbCKbvoy9UbW8Iz8XnkPxg1LtsDtREb+xjp
         i0qVrPtsNEqTnQW3bfI8YJtBJa5r3emnLk58DzeWdQXWB744tjK3Q5mwBNGEBeod1em/
         P6xw==
X-Forwarded-Encrypted: i=1; AKwUvBxX5HkW6E/Wi5NDI1KMgEQTqwYUYLMPGpXCFLsh+JxSgu2QEWkptGRfGL6n60Bbf5G9SSlZNIxYtHYDBzbb@vger.kernel.org
X-Gm-Message-State: AFq9FYK7KBrwffY60ZDC3klWzVoFicy2H2oAKnhE1AKIitoDQFTJCtvF
	UU7aRslFhdEmZryHCEMsk8Kcc+fxpUYcZniBLt5dijsDAMVjIq4U9BqYB2MmnHE+/9rBGSpy5jO
	hC6gbn1+xAvUxatrlKgbJkHJQKFwOi4pb82oQ2f4=
X-Gm-Gg: AYBFou1Br10KXWR48ear55yMq2E2UmXRPpUdGFnjFlB8O9y3jwWc/AXLwW9FVfF6UT7
	9NDKxicUoGqO59VidUibUVBfKor2mPN1CAtIYFxoy2upjr7Z3QQXZr/f6sQhJdayIvWLhQ2Qs04
	/q+kHiiYcnvEw67X8izo8N90XWvmUA0wxP0zMMJgXHzv/UpjZ174KVCD1Ccg8lnklkwIxrBJVzm
	i1T2KIHySNy11pzxfPQPF+n9FWYdBtjyexVc5WNcjtr8t00NPYnrjJ6j+NApYshRPcglA78Jptz
	HRYuQVSDCS/7g+ReEf1YyJ53H9ilU6yJ4hTkAcdH9RMCqC8ihMu65aIJwM/ps0yJtVzTghwf2EL
	a5NbSBeQr
X-Received: by 2002:a05:6102:f10:b0:7c1:918d:d188 with SMTP id
 ada2fe7eead31-7cb373e9685mr2247621137.35.1791812450478; Mon, 12 Oct 2026
 06:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007182238.1154851-2-peter.hunt@opengear.com>
 <CAFEp6-2QsKyZfEdSotVPhxVNOyRzncUphqLY5cRwHXGJiEbzuA@mail.gmail.com>
 <20261009001714.1078580-1-peter.hunt@opengear.com> <20261010171531.1659006-1-peter.hunt@opengear.com>
 <CAFEp6-0vuU2sy3pfgyprMMiLOaKCoZMQN=nHQ+dQR1ku9dbwkw@mail.gmail.com>
In-Reply-To: <CAFEp6-0vuU2sy3pfgyprMMiLOaKCoZMQN=nHQ+dQR1ku9dbwkw@mail.gmail.com>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Mon, 12 Oct 2026 15:40:39 +0200
X-Gm-Features: AclHuK99dZi0qD-kjTJ8chj2shsT6zJyFcPaX8IvEYin0Vx-u0gytz2jHkZuBVk
Message-ID: <CAGRyCJFnszYkYbB8fJneue_DgJY_9yOwK2_T1aB-b+RuK7mqjA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 1/2] net: wwan: core: propagate modem control
 signals to port drivers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Peter Hunt <peter.hunt@opengear.com>, ryazanov.s.a@gmail.com, 
	johannes@sipsolutions.net, mani@kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter and Loic,

Il giorno lun 12 ott 2026 alle ore 14:15 Loic Poulain
<loic.poulain@oss.qualcomm.com> ha scritto:
>
> Hi Peter,
>
> On Sat, Oct 10, 2026 at 7:16=E2=80=AFPM Peter Hunt <peter.hunt@opengear.c=
om> wrote:
> >
> > Hi Loic,
> >
> > A follow-up to my reply, as I overstated one point and would rather ask
> > than argue on both. (Adding Daniele, as the first question touches his
> > recent QCDM ioctl work.)
> >
> > On the AT-only check: I said QCDM has no DTR semantics, but I don't
> > actually know that. I've only verified DTR/RTS on the AT (DUN) port of =
a
> > Sierra EM9291. I don't know whether the DIAG channel behind QCDM ports
> > honours DTR on these modems, or whether libqcdm relies on it now that
> > QCDM ports have the TIOCM ioctls. So I see two options:
> >
> >   a) Keep it AT-only in all four places (open, close, removal, ioctl).
> >   b) Call ->dtr_rts for any port with the TIOCM ioctls (AT and QCDM)
> >      whenever the driver implements it, again in all four places, and
> >      leave it to the driver to ignore ports where it doesn't apply.
> >
> > Which would you prefer? If you or Daniele know that QCDM/DIAG ports
> > care about DTR, that would settle it for b).
>
> I think we can go with option a) for now. The documentation I have
> only references virtual RS-232 control signals for DUN, and we can
> always revisit this later if additional use cases arise.
>

Agree, I don't think control signals are used for diag.

Regards,
Daniele

> >
> > On the locking: I agree the data_lock/ops_lock split is awkward, and
> > it's this series that made the two locks interact. Most of the races
> > found in earlier versions came from it. My only concern is the blocking
> > write case I mentioned, so the options as I see them are:
> >
> >   a) Use only ops_lock, with the whole ioctl handler under a guard and
> >      mutex_lock_interruptible() so a waiting ioctl can be interrupted,
> >      accepting the wait behind a blocking write on rpmsg ports.
> >   b) Keep data_lock for the termios/TIOCM state and take ops_lock,
> >      interruptibly, only around the ->dtr_rts call. v9 already limits
> >      that to when DTR or RTS actually changes.
> >
> > I'm happy to do either in v9, which do you prefer?
>
> I would also lean toward option a). We may want more fine-grained
> locking in the future, particularly given the blocking write path, but
> I think the current approach is acceptable for now.
>
> Regards,
> Loic
