Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D37C433041
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989527; cv=pass; b=oIdtxmhQGOkYM34OHTv1/XzlcPYX83IcwQ/5PPJleApAjEk2IS/CUgGSig7yObHR77U8GsK2/8o18qKnxFpIx3GwSLDVqciYPVweVizKZTmC45ngFmn8KhBIvGZSkVCyqzNvJV3ZI5qsGimZ0USB5LYs+FKeuMNSeTkFhZDHYf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989527; c=relaxed/simple;
	bh=UiU20cy2YdW0ZLpH/v4KpY+lU5CRR3LTrFWqHV5tSfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAtlt2i8LgJrPTdN6CGBtN4ey8QbLAde2JNNTHUQH4Vjb/JnWpL2wMCGh7E0hbB1knDgkahvxv2Vx4WbOFmY4HaWiK33SYASj1RjNNTy+yeMIzt4+ymuw5E7WaSKRfYX9g+KIB1xl7+aE5lhSQ5BYodHFE+CJsNRh9d0Cwsp68k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+UKQ/xV; arc=pass smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+UKQ/xV"
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7904a74fe40so104236137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 04:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789989523; cv=none;
        d=google.com; s=arc-20260327;
        b=QuIBFzP1cQmcSi6GzAHfzegLcADkgVJtjVEpjioWvheagjMsmPeoqdPoKGlvaEPsE+
         B1YKPbNWAsSf80J/f4NjbsfrJyMquAcP01YZEeNDo8AQskJhFD1yuWaWpgkHRG3tMhue
         rVCivKcgftodtuNanOPiW+agb4XHNdhgUurcZhQwIVWQeGKDco4ii/vGRrJTB77YSesw
         oiDzSeIkNnF8hF+jprasHhMnmd5rUyOPis01Q3gDAUzZf7F46Stl0OmGfp+zZmBLlFxP
         pf0Ftrh0PAgKJUXvv2VhRUWiiOi7WWjx8o0/z45kOQy6d/2xo3Ukt1H+3QhsrAcVCtwi
         ZD3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=typTlZLGLU0ycb4Q1T8ES1fBQnZmU7G5zzKl77tNR6w=;
        fh=k7kRDcYKWROokaMQUdhADEgvndWud/RcVG/C88XUoao=;
        b=d6WtjIygCGLVhU5+/dLoOKSEN6xAPTNRwrjzZ7rfH/BYx8LI1Ymej16uVrzR7Aa0AH
         K6UJhxAjyg9G65bnW16/hpOPIoL0pltMcHAt1QzXX2Kwh9fgIwzSc5QXAq/TkeiCkidf
         cJ7MYkEf7iALQOX5/xT0NlSkq+8rWmWlRx4bfUM5di14AmIUzf/cetNPIJ6OPSDAHlNv
         jyUN+VNAoLZQjMiw58tvr3natGAY9d4+BReIW1BDMpRmxT04DOHd+IuTNlLcdK7Qr7I/
         WTK9LJIV6BidV6698R8MweB1f0Gu2ox2Y3psLggpwRcr5QOQo6tSH8/m2TriaCZVlema
         uVuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989523; x=1790594323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=typTlZLGLU0ycb4Q1T8ES1fBQnZmU7G5zzKl77tNR6w=;
        b=C+UKQ/xVwnK5kj0/f67rZdxhFz6nrbXVmkVPybh0Ie0LfvBQ20w2wkp4n4J6HpSldE
         NTeD5LErsyFet2bTX+ufz3gKopvmkkNn1foQjqJfVY30sEAoJhqTNNtrenNb74BVk9O0
         gryyXr+qV14EACci82f123b2HMJbGQ1fnAXfE7w1aA4RcSlpq6RVqwrKCoR3wiPCeIKk
         XEd2Ltv9ueorhmbmeOA/Xst/CS7yo+IPFPcWg+ZlKD9evniG9LY/Dnhbc1VE9E32sGOX
         ZLUclRgeFRVBaaZw9x7Y0+QXpazPzSL4KuL56a+48eENCrG0L5x7wW86Bxv6KBYEtPME
         o1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989523; x=1790594323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=typTlZLGLU0ycb4Q1T8ES1fBQnZmU7G5zzKl77tNR6w=;
        b=l34970vt41FN8EG5iWyxbEt7j9hkBRyuYdLTtEUJZL0d+AUcJ4kUXctP14F5UuvIQp
         zj4H5YWW58IBcSryZRiMSQXr+qbMRlUvp4dI+4x5w8/OvY5iAO2bSvNPifcIINOCuejZ
         glMuwf6LXmKyAAKnUxgzxCv5kTix5jNoAgnOIfl7qjed1aoBxthFZ/0Yo/CJmJ54OksI
         3gLS49QrYDg7s+vV/6vY4orKEls/dIGlDqk89BXU6qU8CXq0XhbmlOTFfqHkJGBoLqP1
         5++l0XGAchev76X8XEIDApXjYMqLrCOhze3yl4CevZdjyaH6gN6YB4D4gkdE7qCtxba4
         OuCg==
X-Gm-Message-State: AFuF++nsVYS2dO+9fBGdKuti6AjsMPk9fIzk4ZNnQn+Ej9ZbWGqXgW6S
	wFexEE7ttUfHhWXSDqimOGyLf7SIoGtOjt3ds/iEk9sPJ73xHJSatuJ/pcxK7jpF0GEoVNddTBE
	J0ylanyIL9RkKF5M7xvD3A2HnQd6oq3k+zHRN
X-Gm-Gg: AYBFou2A/zZkziCurbUhV7WAtGhx6TBthhgVnp2qjkGQQx7aYQnV4aBcv1RA5r9pNLN
	pqkkO8lQ+7AgmyuEKnyx/fjzmQr/IYudcROrwRD4sgOW8abjZlDWuOqaT2c08qgbnQwcfQu+nIP
	Lpq/KvRg64J1BCVtvIXOTAc+prIKQy0fWQthVqBMvgbe7mXvcesDlvGSNFRTs2clurCDgL1KL6V
	cf0mWKq/tiisSJBS+hn9DUP+TMpFey/dsHMvx9gTIMXeQ1llLIARxmFQliaZWxedJIakJ8ChHFa
	UgC2fPVT3indLGwd2cZBEf0h8OArvZyUekB3Za7zY9dfll35hpr+O+yXcg==
X-Received: by 2002:a05:6102:8485:20b0:7a6:81f4:ed45 with SMTP id
 ada2fe7eead31-7a681f52721mr1746808137.2.1789989523325; Mon, 21 Sep 2026
 04:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
In-Reply-To: <20260710194638.1502-1-saileshnandanavanam@gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Mon, 21 Sep 2026 16:48:32 +0530
X-Gm-Features: AcwNN1WXDzMOYUpzBsDst8BavH57bPBz6X3QLpTNZ3TRbxpATk86bD8mnynpp8Y
Message-ID: <CAF+TLO0+snqqrrU_h-psciUmX3e4447opf9o0vEhuT8CTrDn9A@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in
 regulator error cleanup
To: andersson@kernel.org, mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bjorn, Mathieu,

Gentle ping on this patch. It has Dmitry's Reviewed-by from Aug 18,
and Konrad's question in the thread was resolved.

I noticed Anup Vishwakarma posted a patch on Sep 16 for the same
off-by-one in q6v5_regulator_enable(). Mine was posted earlier
(Jul 10), but I'm fine with either being taken. Please let me know
if anything else is needed from my side.

Thanks,
Sailesh


On Sat, Jul 11, 2026 at 1:17=E2=80=AFAM Sailesh Nandanavanam
<saileshnandanavanam@gmail.com> wrote:
>
> In q6v5_regulator_enable(), when any operation fails for regulator at
> index 'i', the error cleanup path unconditionally calls
> regulator_disable() starting from index 'i'. However, regulator 'i'
> was never successfully enabled at this point, resulting in an
> unbalanced disable.
>
> There are three distinct failure points:
> - regulator_set_voltage() failure: voltage was never set, load was
> never set, regulator was never enabled.
> - regulator_set_load() failure: voltage was set, but regulator was
> never enabled.
> - regulator_enable() failure: voltage and load were set, but
> regulator was never enabled.
>
> Fix this by introducing three separate error labels to handle each
> failure point correctly. For the failing regulator at index 'i',
> only reset the resources that were actually configured, without
> calling regulator_disable(). Then roll back all previously enabled
> regulators using 'i--' in the for loop initializer to skip the
> never-enabled regulator.
>
> Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy and a=
ctive regulators.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom=
_q6v5_mss.c
> index ae78f5c7c1b6..9a17aa065f50 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -311,7 +311,7 @@ static int q6v5_regulator_enable(struct q6v5 *qproc,
>                                 dev_err(qproc->dev,
>                                         "Failed to request voltage for %d=
.\n",
>                                                 i);
> -                               goto err;
> +                               goto err_set_voltage;
>                         }
>                 }
>
> @@ -321,20 +321,26 @@ static int q6v5_regulator_enable(struct q6v5 *qproc=
,
>                         if (ret < 0) {
>                                 dev_err(qproc->dev,
>                                         "Failed to set regulator mode\n")=
;
> -                               goto err;
> +                               goto err_set_load;
>                         }
>                 }
>
>                 ret =3D regulator_enable(regs[i].reg);
>                 if (ret) {
>                         dev_err(qproc->dev, "Regulator enable failed\n");
> -                       goto err;
> +                       goto err_enable;
>                 }
>         }
>
>         return 0;
> -err:
> -       for (; i >=3D 0; i--) {
> +err_enable:
> +       if (regs[i].uA > 0)
> +               regulator_set_load(regs[i].reg, 0);
> +err_set_load:
> +       if (regs[i].uV > 0)
> +               regulator_set_voltage(regs[i].reg, 0, INT_MAX);
> +err_set_voltage:
> +       for (i--; i >=3D 0; i--) {
>                 if (regs[i].uV > 0)
>                         regulator_set_voltage(regs[i].reg, 0, INT_MAX);
>
> --
> 2.34.1
>
