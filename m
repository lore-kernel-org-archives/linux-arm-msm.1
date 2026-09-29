Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70F4F68DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674200; cv=pass; b=MvcmJ/u1o9OFLOETYzVk4jilsasSUgR1zlHMFsk6kPiA4076AKs7aNW8q/n9w9jG3G+Qr7ijWtu9lnKpCs0qa6demMLY1OLJKj9WEPv/ukuHhv2/E+Ry/WClqJEfw9K5AYs10ZwCxDD9lvK1Dt8lRVB4+jQnHiRR5RdHD6g+cCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674200; c=relaxed/simple;
	bh=1XWJMMt7B+cfIhVaWu7WIPENvQrwiPRvcsMo92t2ja0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JS7AmMA2YiYckZZri60W/S58JS45DX9gUWizDJ7EtJv9k8bPTE5VIIu1Ss4n/dPVMMpF5Tka/EPI/9DVDOHI/MLZdEuTJx2C/iPjCO2XOiCBOAkIphWiJN3MOKKqTsbX5t5fJRAlhzDXEzjsf3nen2D0/Qo58g2rTqUpDybDQVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvgkwEQa; arc=pass smtp.client-ip=74.125.230.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvgkwEQa"
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3a5b0adf48fso19376911fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 02:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790674196; cv=none;
        d=google.com; s=arc-20260327;
        b=KHGudgmlpT50suztZtPnwAhTjYGQqd/I79nJ15OjSHbfNM7W0F6wcSE2v64ipLdfYV
         43nVc2VWZTYWcwFESdFSb3g6ptlmW3NpEFexLsoCyn58go8Lv/trGMpQac+mhd5q30lH
         ISqWjLytTPkORNPVlKWmUZ9EdWLEy+tzECi3TKLsXAPDHDJfh/5IX8j/14gI4NYlMHIy
         qaGVA0phBadcZx1hFlSqWnGLegMfhQphqH1fPkbK2fkBX2OJmOU9ababKLjQA6h+3vg/
         bK5osR5RpFphgDeRHzsMzs0XMG7/rt6rDSLNBrXKC8HY/vn0anhCLaCaFpeEeQcYBy0R
         ax+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JhSt9RrDgclo++iTfJ1ToFjlbT6uO7QVlIXjkP8IcNI=;
        fh=B5phohF8Y9babeABW9kIWvIRe5t1bs7AD/kepmNnf2E=;
        b=gocrvjIcXsQgARGHWKR2RKHsmma7CCNRYqzRSsv3QKg21emx4+TIK9A36W9xgAS+YT
         AizDfFHmhdNvZXNaQNyY1a70fvLO5xCxg7KY03yjtR38FdxH/XNKep7AHyYOrR/Ai9jg
         Xg3VZL2O1CLnObW5PqVLayD6gJcInJScqfcsEa9kkKTBeSVduMI9z/KOwUG6JoXf9Dj+
         sTDwUszsb45RT4CSGtgk7fGpMyUdLO0StyAAmbMKZVyl+Gbej7S8gVNe6FFKwGJkvGFQ
         SSfSB3Mh4kOxSrXxNQcAoFMbs8rYfxVFS5wJ88WK8xAKhxl5c/dS8DBcdb07F/uXu1+8
         Y8iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674196; x=1791278996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JhSt9RrDgclo++iTfJ1ToFjlbT6uO7QVlIXjkP8IcNI=;
        b=KvgkwEQatv1mEwliw8NohxNcZ8H7jeUSSshdgC7Q1DvjA4qH/QW1zukNmorP9Jivak
         uYuLtHdUhPspBoeyBvHLoEAl2vdJR6QXN8LYK+fHiQc3xMce1lS273ljY0r59dtXh3ym
         MkSXgvt3dOsG3sKNyQdxII+HYBDsKipoId48G+LcT2NyFp3Y3oFJAbvaOUqRhp9S1uEV
         nxGmvqMj1X2LWTpcWj9LRjpqo+AfsiekT8UxngASqmmRWDFj2aTLlfDFKN1RpITOyuMa
         T5FRdAye+zuiNDakTU9vBvkuTyvBEkYiC9ySdGhgkoHvYePYU1LKI6EScNYe8/5XAS5s
         +DWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674196; x=1791278996;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhSt9RrDgclo++iTfJ1ToFjlbT6uO7QVlIXjkP8IcNI=;
        b=akcrhmLuhrgJR/V6uB9Kz3OG1oJhbJZBS6/YZ5NjI4mPapvIyUmUP1+RMt8ZDXM7G5
         niSl0r7HGQOCjKtNk84dgwlwjL7t6mWI8aZ4zvps8JswXwlBidCvoEATDEw1TWlEJ/Vb
         5CqH7VgOzZ7MTUNgxK9d3Lp6BzJGYjogNNmZNqMzItTswxDUO6GbwAXdCUfJ+jqeS9ku
         nJRQX0GyfYjhCnVuAmChcKhdNHhAPd8dJ8WTWbG8R62yavI9+RglCrzzRZmTkGX+8fUk
         FWQaAcOIuNXl6mKdeVnDGumNqEUyrVMfE5yDqewya/miilJ62IjAU+u+CkV/mJNlfVu1
         +ihw==
X-Forwarded-Encrypted: i=1; AKwUvBzc8Sv2JoUJsw0jRdEIArt/uzmB9ed8t4nt9/bY7vWhadmWdRv2KL4XKv8Ee74J3+sRU4CzmHUpIydOBc5O@vger.kernel.org
X-Gm-Message-State: AFq9FYJqB0VGtYZumRVZPy5i67lbQCnzvobnGtYI2MwB4qCtHdu7Qv6m
	GGRjYhgZgINIsyUBZZYjJ2hMDxO5bSNMYL8qfOayNMjAXXEGMBV3R544dmzvBcC02W2An2tWmnD
	Y2UY1AwhZFkRYzYN3a4o/uDNPgm+OacU=
X-Gm-Gg: AYBFou2E9JE+1Xmyh5BU54cA24PCRvuWmmQ1wH759B/hmayT+m2NOkPgPdcNDNNyu2W
	/m3+PWdP4fisFf6lkHeI7o4IiINfaEvzk/eh4FbUi57xZKR3CXLphygoyegvUMfjx+51KNHv2j5
	4Q7peHZPOqf7CHEc69O+SCHLpDGbnLbnzqCz9VNKLHuUbUIKmm0xU7csY5Ll+dvbGb1l2Gxdczk
	7xLdG1Esyj8uhs3Z4DWstgztjFTHPIRa5c1L7Lua8z+uL3cOzyFM1PGsRJWi5oU2pvJq+6i88mJ
	rBx3A8mL0zetfOCi6LA1E/Iyd3QD6EZQdCw55DePt3Iweh+TnfBZ
X-Received: by 2002:a05:651c:b22:b0:3a6:6831:6e28 with SMTP id
 38308e7fff4ca-3a66831753emr17447411fa.6.1790674195948; Tue, 29 Sep 2026
 02:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125523.43813-1-roman.demidov.nn@gmail.com> <CACSVV02h=c8KQoUT+18uXBoL4nkTzefu6AiTX=y6-W0rUrSSYA@mail.gmail.com>
In-Reply-To: <CACSVV02h=c8KQoUT+18uXBoL4nkTzefu6AiTX=y6-W0rUrSSYA@mail.gmail.com>
From: Roman <roman.demidov.nn@gmail.com>
Date: Tue, 29 Sep 2026 12:29:44 +0300
X-Gm-Features: AclHuK8WiNHB93l-tibJnv-74UuqCfijjfNU3TD0Xmz7yFxr3JF9kKuc8tDTO8s
Message-ID: <CA+KF4bJSyuhB4OGDU-31riOMZK+4ubtLSPpTf8qgkW3pt6nXrA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: check pm_runtime_resume_and_get() during resume
To: rob.clark@oss.qualcomm.com
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thanks. I did consider guard/cleanup here.

A plain guard(mutex)(&a6xx_gpu->gmu.lock) would remove the manual
unlock/err_unlock, but it would also keep gmu.lock held until the
function returns, i.e. across msm_devfreq_resume() and
a6xx_llc_activate(). The current code drops the lock before those calls,
and I didn't want to change that as part of this fix.

scoped_guard() can preserve the original lock scope, but the error paths
still need to unwind the PM refs and clear the OPP in the right order.
Doing that with labels inside the scoped block and a success label
outside ends up more convoluted than the current linear unwind. We'd
still have goto, just with extra nesting/state.

I also considered PM_RUNTIME_ACQUIRE(). The auto-cleanup for
pm_runtime_put() is nice, but it doesn't remove the goto-based unwind
for the clk_bulk_prepare_enable() failures. If the GPU clock enable or
GMU clock enable fails, we still need to unwind the previously enabled
clocks, clear the OPP, and drop the mutex. So we'd still need a goto.

That said, if you'd prefer I switch the two pm_runtime_resume_and_get()
calls to PM_RUNTIME_ACQUIRE() and keep the explicit clock/OPP unwind, I
can send a v2. Or I can respin with guard(mutex) if holding the lock
across those calls is acceptable.

BR,
Roman

=D1=81=D0=B1, 12 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 04:5=
5, Rob Clark <rob.clark@oss.qualcomm.com>:
>
> On Fri, Sep 4, 2026 at 5:58=E2=80=AFAM Roman Demidov <roman.demidov.nn@gm=
ail.com> wrote:
> >
> > The return values of pm_runtime_resume_and_get() calls in a6xx_pm_resum=
e()
> > are not checked, which can lead to hardware access on suspended devices
> > and PM reference underflows.
> >
> > Fix this by checking the return value of each pm_runtime_resume_and_get=
()
> > call and properly unwinding the previously acquired resources on failur=
e.
> >
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >
> > Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> > Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 +++++++++++++++------------
> >  1 file changed, 21 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index f9de9329dee3..0cf205ea744b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -2175,44 +2175,48 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
> >         opp =3D dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
> >         if (IS_ERR(opp)) {
> >                 ret =3D PTR_ERR(opp);
> > -               goto err_set_opp;
> > +               goto err_unlock;
> >         }
> >         dev_pm_opp_put(opp);
> >
> >         /* Set the core clock and bus bw, having VDD scaling in mind */
> >         dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> >
> > -       pm_runtime_resume_and_get(gmu->dev);
> > -       pm_runtime_resume_and_get(gmu->gxpd);
> > +       ret =3D pm_runtime_resume_and_get(gmu->dev);
> > +       if (ret < 0)
> > +               goto err_opp_clear;
> > +       ret =3D pm_runtime_resume_and_get(gmu->gxpd);
> > +       if (ret < 0)
> > +               goto err_put_dev;
> >
> >         ret =3D clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
> >         if (ret)
> > -               goto err_bulk_clk;
> > +               goto err_put_gxpd;
> >
> >         ret =3D clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
> >         if (ret) {
> >                 clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clk=
s);
> > -               goto err_bulk_clk;
> > +               goto err_put_gxpd;
> >         }
> >
> >         if (adreno_is_a619_holi(adreno_gpu))
> >                 a6xx_sptprac_enable(gmu);
> >
> > -       /* If anything goes south, tear the GPU down piece by piece.. *=
/
> > -       if (ret) {
> > -err_bulk_clk:
> > -               pm_runtime_put(gmu->gxpd);
> > -               pm_runtime_put(gmu->dev);
> > -               dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
> > -       }
> > -err_set_opp:
> >         mutex_unlock(&a6xx_gpu->gmu.lock);
> > +       msm_devfreq_resume(gpu);
> > +       a6xx_llc_activate(a6xx_gpu);
> >
> > -       if (!ret) {
> > -               msm_devfreq_resume(gpu);
> > -               a6xx_llc_activate(a6xx_gpu);
> > -       }
> > +       return 0;
> >
> > +       /* If anything goes south, tear the GPU down piece by piece.. *=
/
> > +err_put_gxpd:
> > +       pm_runtime_put(gmu->gxpd);
> > +err_put_dev:
> > +       pm_runtime_put(gmu->dev);
> > +err_opp_clear:
> > +       dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
> > +err_unlock:
> > +       mutex_unlock(&a6xx_gpu->gmu.lock);
>
> this does at least look a bit less terrifying than what came before...
> but maybe
>
>    guard(mutex)(&a6xx_gpu->gmu.lock);
>
> to simplify the locking part of this.  And I think at least some of
> the runpm stuff could also be handled w/ guard/cleanup stuff?
>
> BR,
> -R
>
> >         return ret;
> >  }
> >
> > --
> > 2.53.0
> >
