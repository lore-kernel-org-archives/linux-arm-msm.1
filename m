Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7689D396B6F
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Aug 2026 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785663776; cv=pass; b=c9TTjA0B9fxwOnBb2NsiwGqV5J7z4TCROMognpoWbaQBl9iEhLX1OLID/706N8uTYTbb1pUTElPuwfGL7W92V0K0o/bBTHlfzdtcdz+r9/UVDCQ4Eob1pdcBsXk5IyQGG113buMsii7w4/RTL/k32wSt5z0ayaV/UE+XtVQFApo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785663776; c=relaxed/simple;
	bh=dJOBLOQUqN6A2keWqFB+qT5VTZMw6IdkXrYBZAaa2+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YtoDbsF0mUBg1N48rThjV3ZFqcxHeH3zXPHk+hNZkdayZCc9nJEtnR6TY8HcS9tbm3AOCOknXixmhHoHIv/L3pSI7j/+onP50WJkeL7fZv7TRW4RDQkyRPNjfdpMjhC5D1xrWrACS/OGF14EPHbRhMrFhjBwEVpu54rqJdkOTvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IejQJV7R; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IejQJV7R"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-739906c1b32so66572137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 02:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785663772; cv=none;
        d=google.com; s=arc-20260327;
        b=X+o+POHsjraiRZC4hrSvvGSJL9yZWQvnPOb7PfnM4GJqElPww0+a/EhpbRmRepCMji
         H0Lzk7hAEXsPv6CM/1xrrlHtPKIF7Mfyk2wsAWa7qyGh8oYr3mmxEoOFAmc/wSLpQ5FX
         prNOX+Y8GiP+IyJc2c7OLEB6rBQlk2fSKsT9c1yAjnyFBevLBZE0H83CEgqvJWtUhyh7
         Ltlyt4df2veJsxhpW2KeUZEjoj/yZrhxBbZ2SK+ajLl9mu/+jmA/OARoMeInaCC8S0kG
         Pqh60hDSMjQjnLulkSeLk9GhCpy1GPNCRP2lIbMJezDQAhTFb+DUB/HqPEfCkOf3ItS4
         cr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pri826G5hCYV5/lZ6dHjcACUrXFqOhWQRiRJJshfs9c=;
        fh=H4JDzx39xXg9obANcMP1Duc7BIY9fT9Vje+k23UKXYI=;
        b=enBizCpovUJfQyQM1W7bDfbULpYLh26RSJPw2eWNxuQkYxz9zgGQvveVHgD0GjByyY
         yAkJ4nYgdEfrV1y6cu5dPg3lyzaz44YimdTvhMdO//vkf9C+musyXMEMWilheg4NVbAe
         ickOAKPxmx1mgFq82iS89oyQdkaSSey3Vr9JcGMhKVQ2vudoiqT4HWdC0vxoFYJw+aHK
         VCbTfzBn/BIG8MHoIXKuf4R3Syh6i4DhsLOTA3bpebRr32b+W0Pr+mmlSfoMenS0JsPq
         Ti3b5nyqIQAFt9COARDp/YYg3Zfw5jt2dr/i7ZJGCL2rvrUZMcYX7bKg6mNJkZ8ee/QC
         W/gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785663772; x=1786268572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pri826G5hCYV5/lZ6dHjcACUrXFqOhWQRiRJJshfs9c=;
        b=IejQJV7Rj0U83T9r4pxml+OeFbWRiUJJMSxtZgIzGbfu4dqK1j4nHrgStYziTiEKMq
         BCcTmEzxdXFQhuN8mp0bpOQyWAOahx+esD+ekEmMkdf3FfAR+ABG8QBFVyUfG8+IFHAe
         rTDVhgbyQZrzMoQ1Odrn7KQGcQnKT9ksZunlHxcOs/R3h7KtgBPrqbfmrRC+Q8yiINQ6
         CZDkJM8+XVFr+tl4zUZ8fBJ8L8BgaNvNlelCrXoJSZdXfwhe0kgbh0KlbG1eVmx1PHRv
         KrodULNRQpn6O8/h1sZctKpi7+b7/dCUUjuXQ0/ZPxYZRH+dnGqgrgujW2P3r4Z5yW7w
         l/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785663772; x=1786268572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pri826G5hCYV5/lZ6dHjcACUrXFqOhWQRiRJJshfs9c=;
        b=qYitCqtZezqRIcKG9vaIAXebVeqLuH0HilIwBBlwchmF9/kowvox/OpMoX8rctWFmm
         qMHADCRhy79P3BQuGiJ3iPO4Tx5nrSLc8Inji565CH73GfvDQFinYfUYnEm4stfveDrc
         nTpwnDFzRlqjKnOMdrAL0eR59+ikLa7lBnB9CBtIrDgbGkKzzLpweSPSZE0HsD0uXvvm
         4A81UVCGieFkJtBZ+wpF2P8zD1C9emdGxardGc+QFJCaUdGThJ7dIxf4N6nn1Tau23nV
         agy+AAvBbXXuHlnu1G5hOGJDLGGiBTwFVBy2yO6nxxxFTTZV6316sybK6agPiGc9alVl
         JQbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrT7oS/lWmivLHqMHPTvf+8zJZOTEPAr6wCnNbYWFxFr9yhZr80WK3irCysqPlxKkd9vfaW4gS6Wt2h02B5@vger.kernel.org
X-Gm-Message-State: AOJu0YzXJlPJK1QkDJOKz32oh9BdRxdFoKvb9rlUk2Zy1W2LG/A2jSGN
	ORa6NlSZ5A8VUyclt4ZEdnuhABDjPZ0Dn0iI5zOCEV6taWzI31a2A6+4eVw9Pr7O0leSyoCUxw1
	1EnPX349fs8UDCcSR3V1w0Q3hel7azLI=
X-Gm-Gg: AR+sD128BpHgkc2ll2iIk6H4cRlFX70WrZjXi+tgqcYc7oY7dF44pQ+/jSO4Ayhcse1
	Vxvn/TOduGFkY5I4fTmO9b6hQWWeYhF7XDGty8zAVYXutNHQXvJY0uDfv8mN9yv7VsFzbgUoUeh
	JbOz8bjR/xWlwnJUQTvZQx725u2h+WxAYrMxLwBH3VJ896Ij+qlbYCKXOTnOkvKo1vJzBmTXIHQ
	Pgm8derj+6L1aegsIdbHTMS2OXf33p/ob1mD5BPylQ1lZXd2UGXT+d/vtpnFWiz7ykgK2tH5J9W
	sjEIS1AzNTRaz0Adq6jJAJayIQ8zhBXKEjdlYe7mstnMx/4=
X-Received: by 2002:a05:6102:f8c:b0:74c:551:54d2 with SMTP id
 ada2fe7eead31-75b2507b572mr1757974137.4.1785663772295; Sun, 02 Aug 2026
 02:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
 <bc13f78b-287c-4832-b2f1-a68e7b35b57d@oss.qualcomm.com> <CAF+TLO0F9jQ0+pPei7iFDqcC-gKd44gc5SXa-o_dBKzNsHKU=g@mail.gmail.com>
In-Reply-To: <CAF+TLO0F9jQ0+pPei7iFDqcC-gKd44gc5SXa-o_dBKzNsHKU=g@mail.gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Sun, 2 Aug 2026 15:12:57 +0530
X-Gm-Features: AUfX_myUV3Xx5wjT5xpW_9kPbTIvUToAVZXKQdsgk1k18pyiY3j3cgrBd5FxHu8
Message-ID: <CAF+TLO0S-Sp9PWKhvGeRfnxMaV7ZH=Ncr-p4NAu1pvE8odLTjA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in
 regulator error cleanup
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	quic_akdwived@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

Just following up on this - wanted to check if you had a chance to
look at my question above. Happy to send a v2 as soon as I know
whether the concern is about correctness or the label structure.

Thanks,
Sailesh Nandanavanam

On Sat, Jul 18, 2026 at 1:27=E2=80=AFAM Sailesh Nandanavanam
<saileshnandanavanam@gmail.com> wrote:
>
> On 7/17/26 3:01 PM, Konrad Dybcio wrote:
> > The first two labels only unwind a single regulator
>
> Thanks for taking a look. Could you clarify whether this is a
> correctness concern (e.g. the fallthrough from err_enable/err_set_load
> into err_set_voltage not doing what you'd expect), or more a
> structural/style preference (e.g. avoiding three chained labels in
> favor of a different approach)? Happy to send a v2 once I understand
> what you'd like changed.
>
> Thanks,
> Sailesh
>
>
> On Fri, Jul 17, 2026 at 3:01=E2=80=AFPM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 7/10/26 9:46 PM, Sailesh Nandanavanam wrote:
> > > In q6v5_regulator_enable(), when any operation fails for regulator at
> > > index 'i', the error cleanup path unconditionally calls
> > > regulator_disable() starting from index 'i'. However, regulator 'i'
> > > was never successfully enabled at this point, resulting in an
> > > unbalanced disable.
> > >
> > > There are three distinct failure points:
> > > - regulator_set_voltage() failure: voltage was never set, load was
> > > never set, regulator was never enabled.
> > > - regulator_set_load() failure: voltage was set, but regulator was
> > > never enabled.
> > > - regulator_enable() failure: voltage and load were set, but
> > > regulator was never enabled.
> > >
> > > Fix this by introducing three separate error labels to handle each
> > > failure point correctly. For the failing regulator at index 'i',
> > > only reset the resources that were actually configured, without
> > > calling regulator_disable(). Then roll back all previously enabled
> > > regulators using 'i--' in the for loop initializer to skip the
> > > never-enabled regulator.
> > >
> > > Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy a=
nd active regulators.")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> > > ---
> >
> > [...]
> >
> > > -err:
> > > -     for (; i >=3D 0; i--) {
> > > +err_enable:
> > > +     if (regs[i].uA > 0)
> > > +             regulator_set_load(regs[i].reg, 0);
> > > +err_set_load:
> > > +     if (regs[i].uV > 0)
> > > +             regulator_set_voltage(regs[i].reg, 0, INT_MAX);
> >
> > The first two labels only unwind a single regulator
> >
> > Konrad
