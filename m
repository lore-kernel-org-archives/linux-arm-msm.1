Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195766;
	b=l4sIZB+2dgUdRKzLrlQbmCxloHlbxUdxTUiAXj64Tsy/4LKUYay/cDC/j9jRUY9Jv9+O
	 9PMRErUgg3teMGYQvdLBDTl43Q9hsI/Nw4ni0zd93TyHUVWAqDq3pIP1eHwMK0GVqXWrD
	 XshP9q4qZWgDeMH0EZLu5OvAsD6eyujUmnOd6eQ2+h+BzpECHX8idxAOy90zLoQqP2Uui
	 py+OboBLFREoKqlDsOZwzzfGDECc3MhcNCP6dNOyiBeBtKqTQpUzsGe/uHhk0Q/cI8RE9
	 0gO8NtDChlhdH/uP0zWVWq9z0vXbCNf4Tfim1I2CtQjdNPxv0ch/ikgLnm12dwBYDjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
	b=oZ02OEsXP1BRZPynfhG9u+aA0g7tQLd7cCgJX8dLbYZeWberqHQuI1c3X7GPiWdP9vv0
	 38xZdgy1DD2q269Dqj9B8oVfPCuk4pvv88sTOy34MClWSiAjlEvnW4RK7Jhau4iVhFmRR
	 UErwwFI+kqeXd+TIG+L7VoPbAuNjwLlJcTCgHwD1NLJ5GwzhgrVZvDrcU/4ZAREQHZe/f
	 D8T4X07D+c/dc5WFfPz72+hcXgCIc4pPYjXOE4ipyeXIAtJm8mgoosXAjFQovglHlvac+
	 SxFXiVRGzgtcZ+1v8+PEheEZrb5pX5hK7IDY45S6k349IhQha+ub8a6I+JtDAhbc1oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l3GVRdg1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A98606A33C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 17:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43A98606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l3GVRdg1
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55be673e029so305901cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195764; cv=none;
        d=google.com; s=arc-20260327;
        b=EtBa0TS9UTUYKYDtlrRxs/bGRGmWuV3OsZcJzhESR6dMinARB8WnRtsxvNz3g6K0y6
         j+ztY0ZAh3aEAbhAESDVdMTDGLVSIx3EP+twx7LSNiPipUbk9m1kU2aBc4Xu4f/GmMwd
         xBWgwZKPav9Shq+ePewSgcx5PXr1wSMBOU4SgQ3eW4y6qbdYL8ex0ivxqSru3PSeJzOY
         GMKVHZIODx1hyWseKjsxRKi7jWKzhHMur4k/VZhgzfjUoVHp/tqpd38C43iQUz5b6zVC
         /ZslU7PH4h9mCvtLCxyEL2mASJm1U3O1m1F1Hjpi3aGQmKincBq6506e/ELupVm83PjF
         qgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
        fh=FLKe7OdIHPOho3jnvC/oJ6IzK74KXUSK5oe0criN4P0=;
        b=P6r72Fm2rmE1xilsiSGzBy1uHmO2Hf/gJWJaJi1+yo2lZ1upm3XHSR8aONx0Nmqv7y
         gDueA57WVj1XHVHV4R0Fmsz2siMwkJ9GINlphy2tjmVIwDm9tVUkmnFouq72U0JG56h2
         c92xsc9u0Pw2Z57W+fTBpFW/78LTTDpDd6Pg8Y+UcVcAjNQi++dOTNNfKq/IJJGiuiGI
         XpikEY/jBWCBr7dS4GkomGKh/7ujPjW/68jjMFd/DsU6bta5467CX69one3tRj9oyqqC
         dd/5rBR6PCp5OMXipZigemWeNv6NyasF9IrBWjIIc+l7XT3nQ9nVEH48uPmXJHRkEMfu
         xO2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795195764; x=1795800564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
        b=l3GVRdg16VPWScqmn5BZxtA7/L9oF1UcOodEIO2q1vp3rCSTc9dU02fuwKYSR/rige
         DnYKmcxXgxVWLKX+001F0giqPxrt5e5dCabvgUobgNQmOSyr9QGV3Ct6uQO4lu65aa6z
         W4P+jzNvyOI2jPBcQlJPRUxRp6No/dhs7hAVMNBmJJ6Wsuu9jnWrKoBS9FwsPoIOlIHW
         b9LZcYpzyNJm0zaAS3lY4tHQ9FHHtKn/unaGKbT47l267GkfhDrrVN4xJfj4fA9+49sP
         EkEKZJ5K0IJaQyVu8V1KKnkNaScUr4PKmNW6brE1mg3tM/SG6aPBfaVsFZTrXPcKQsU7
         /8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195764; x=1795800564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
        b=l59dC84vRKHvWI9gxAm3zI+4ioHpW9E8jfRwwwiScczlEjmlRwaLyY8pcqXbWtRjJh
         PHvbrNd32OzHGRo3/18soR6mU3OQ9KJZPcg+dY+RenhGFIKQ9PhL4hsgbOsBjTpBbES0
         Xx/e320KO+QigWacBfo/cScsxstK484mmV3Zo/YWU3fIh54SYTdDFNDwo+zyGcOIxwcU
         J2bC38Is2Pjex08abkcbifY1HB6ar1HlB4kTpz4yJXsVTHceRPIT18Sioh8F+qBfw0OL
         37mmOUdGXpiX11G6k/Vqqyu+RmKSSgeLeNeqGLqnHJ6hFAN0oabbfk61FGLQ24ey1GIX
         2rhA==
X-Forwarded-Encrypted: i=1; AL+hErHGHH2JVdHeSEES2WNFngjWpsyvEcO0Duc3Eg0WwfnKoYZ0oay6RG7HfWgPylCXPow8lrLypzHQmimYIWmD@vger.kernel.org
X-Gm-Message-State: APuU4Z8o2oTpSRkxLBdMDBOkquiwNo2Ormnb1T1xgl7w75Q7e1oV9C3Z
	7hMBcE0uWn7pJ4+qJV2uD3kUzubWhsgHitZHY32p9uvhFR0yGaRSKvLEwFgu8cMMvkuvskddIAl
	DCAbbUndHA99XiCnwkr6P65COgfqUmO6HDgJ68D/x
X-Gm-Gg: AYBFou3x6qJcPJOxtEqjPkTmq1b59oU5o4WluvxjzQzpuqhC316nmr7pkKPqkLGYSnh
	T1ceyh+/mxn0Pu5U0awhirIOaWeCXbCcuz9f63yF95ieWQfSSmGZqRTyIEgUZ2OvfJvCu9zNd2Z
	iAtgH06yRGjf+M11msdn/2baTJiv2Nm+tiMf4aYO1DsqTE9Xq8X+AYBePEoXkVughZ/2Sxvcjgy
	4vwfvsWiu7xJdRIc8CSyAHKHJg8IhrLRis3G17ofziyP5hUxOcrLI4XVzMAk5UHaSQDRz9Aiqnb
	Fr2LsTS7NcHbHNROgeOFG+IAmmpibQzoUPeBWUHkZwBpcgFnKAsUN7cbpeBe5ts6qIcgkf2h8pv
	9Vef3Tqa8ZX9LnN+Swc84wXDtu6CVQJewyy0h
X-Received: by 2002:a05:622a:2b07:b0:536:6ea4:e6a0 with SMTP id
 d75a77b69052e-55d7a35af5emr20936351cf.11.1795195763344; Fri, 20 Nov 2026
 09:29:23 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119170853.1529676-1-irogers@google.com> <awBiQ0S1hYnm-ngo@black.igk.intel.com>
In-Reply-To: <awBiQ0S1hYnm-ngo@black.igk.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:29:11 -0800
X-Gm-Features: Aa3M54qjIXZFwfoIO-dZiEsJTXyVaZW2PPM6ShZu-HH-RmWEeaNIOyio_jR0G5c
Message-ID: <CAP-5=fVhPeWOCmQRB3ZAkv9jS4cOgsHr_yekiLon9ZhF6Mmsdw@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: Avoid reading uninitialized
 state on error paths
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:08=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Thu, Nov 19, 2026 at 09:08:53AM -0800, Ian Rogers wrote:
> > In qcom_pmic_typec_port_set_cc(), error paths from regmap_read() and th=
e
> > default switch branch jump to 'done:', which logs 'currsrc', 'mode', an=
d
> > 'misc' via dev_dbg() and passes uninitialized 'currsrc' into
> > rp_sel_to_name(), indexing rp_sel_name[] out-of-bounds when dynamic deb=
ug
> > is enabled. Similarly, early error paths in qcom_pmic_typec_port_get_cc=
()
> > jump to 'done:' before 'misc', 'attached', '*cc1', and '*cc2' are
> > initialized.
> >
> > Return early on error paths in both functions instead of jumping to the
> > post-success dev_dbg() trace.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wconditional-uninitialized enabled; fix and changelog drafted with an =
AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wconditional-uninitialized; not tested on Qualcomm PMIC Type-C hardwar=
e.
> >
> > Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver=
")
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> No stable here either?

Agreed, 'Cc: stable@vger.kernel.org' makes sense here too (especially
for the rp_sel_name[] out-of-bounds read under dynamic debug). I'm
happy to send a v2 adding Cc: stable@vger.kernel.org, unless you
prefer to add it when applying.

Thanks,
Ian

> Thanks,
>
> > ---
> >  .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 25 +++++++++----------
> >  1 file changed, 12 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drive=
rs/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > index b2ad31e85b5e..a1595b8b53e7 100644
> > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > @@ -372,14 +372,12 @@ static int qcom_pmic_typec_port_get_cc(struct tcp=
c_dev *tcpc,
> >       ret =3D regmap_read(pmic_typec_port->regmap,
> >                         pmic_typec_port->base + TYPEC_MISC_STATUS_REG, =
&misc);
> >       if (ret)
> > -             goto done;
> > +             return ret;
> >
> >       attached =3D !!(misc & CC_ATTACHED);
> >
> > -     if (pmic_typec_port->debouncing_cc) {
> > -             ret =3D -EBUSY;
> > -             goto done;
> > -     }
> > +     if (pmic_typec_port->debouncing_cc)
> > +             return -EBUSY;
> >
> >       *cc1 =3D TYPEC_CC_OPEN;
> >       *cc2 =3D TYPEC_CC_OPEN;
> > @@ -392,7 +390,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_=
dev *tcpc,
> >                                 pmic_typec_port->base + TYPEC_SRC_STATU=
S_REG,
> >                                 &val);
> >               if (ret)
> > -                     goto done;
> > +                     return ret;
> >               switch (val & DETECTED_SRC_TYPE_MASK) {
> >               case AUDIO_ACCESS_RA_RA:
> >                       val =3D TYPEC_CC_RA;
> > @@ -417,7 +415,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_=
dev *tcpc,
> >                                 pmic_typec_port->base + TYPEC_SNK_STATU=
S_REG,
> >                                 &val);
> >               if (ret)
> > -                     goto done;
> > +                     return ret;
> >               switch (val & DETECTED_SNK_TYPE_MASK) {
> >               case SNK_RP_STD:
> >                       val =3D TYPEC_CC_RP_DEF;
> > @@ -472,7 +470,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_=
dev *tcpc,
> >                         pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
> >                         &misc);
> >       if (ret)
> > -             goto done;
> > +             goto err_unlock;
> >
> >       mode =3D EN_SRC_ONLY;
> >
> > @@ -496,7 +494,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_=
dev *tcpc,
> >       default:
> >               dev_warn(dev, "unexpected set_cc %d\n", cc);
> >               ret =3D -EINVAL;
> > -             goto done;
> > +             goto err_unlock;
> >       }
> >
> >       if (mode =3D=3D EN_SRC_ONLY) {
> > @@ -504,14 +502,11 @@ static int qcom_pmic_typec_port_set_cc(struct tcp=
c_dev *tcpc,
> >                                  pmic_typec_port->base + TYPEC_CURRSRC_=
CFG_REG,
> >                                  currsrc);
> >               if (ret)
> > -                     goto done;
> > +                     goto err_unlock;
> >       }
> >
> >       pmic_typec_port->cc =3D cc;
> >       qcom_pmic_set_cc_debounce(pmic_typec_port);
> > -     ret =3D 0;
> > -
> > -done:
> >       spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
> >
> >       dev_dbg(dev, "set_cc: currsrc=3D%x %s mode %s debounce %d attache=
d %d cc=3D%s\n",
> > @@ -520,6 +515,10 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc=
_dev *tcpc,
> >               pmic_typec_port->debouncing_cc, !!(misc & CC_ATTACHED),
> >               misc_to_cc(misc));
> >
> > +     return 0;
> > +
> > +err_unlock:
> > +     spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
> >       return ret;
> >  }
> >
> > --
> > 2.56.1.708.g77570a6a1d-goog
>
> --
> heikki
