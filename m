Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A34625B099
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791769055; cv=pass; b=olScQPt9Y7x+Jbmwh4WbUBCaKZabaKHt7popkRTRnC2EomoHLwPGXUsayqzleEU5ar9qK/yhIPPNy6NEnb/SmizuQZLZYWohzCOJ1pqCoza5hh2QdFjKt8l35uNiHYEtQE0VDkbfYqtysbnOcYPiP0D6sLxhPr8pOk8xGryk4Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791769055; c=relaxed/simple;
	bh=8eamA2vofHWVcfykSPfOgSMCX6h4wsr3MsQE4r2LhZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmEYwsWtJY+ByFQDDz34CWHCFu1p6SQFbLIJoc4gT0ZSwYFW+2BctiLaZy/PUjlVIx8L9sk7N+U2Tiz9cdj5HTtCABncnoAZ89l/0bjt4tGe0VIsszXHzC7YbJN6DIkU3YLg6zAKg5azgK/5Hj58+uRsses+8NwqJxRV+ZPirXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ly9qfU7s; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ly9qfU7s"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6f5a0893610so295783eaf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 18:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791769053; cv=none;
        d=google.com; s=arc-20260327;
        b=T7mdfxg4kpNSddw/5D2ugRfn5+qUvb9aUAyWBXW2WuIjvKNGka8voeioEajo0w6BWg
         XPmUtoThZWp/qw6hzcDohuKEEPIIAOq1LedOaOgTzwe1uct2J2HkR1AwwXZXMJbf1/AT
         /07pTMDv3nFGp8HxV/d3uhLJq+U8oBp/p8qe4eTFl5oDJvOToEoOSI7TrRCeVymD363W
         uWvNkDzb2i+DU5/AHY18YNZrk8zObooa1Dc8A8d+ztYRJrac2qQZsqR30Sv8qV8JvKX0
         7o+/YSFAW25dDaL+p8w15mvjIegn881y543InV7dOjNjOx7PmAdnHRL6Z+WE9fojspzS
         4quQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fub5Jcy6LRmb/gHzIvFjGYqxVr2QVdb2MxvdUeJjFqI=;
        fh=PDbWSRiC5lJTFHeqZWXYbA8+/Nn6qW5t0OV7Dl1OvoA=;
        b=nA9UD9v5J618XbM5vOHYSC00sjHTaBBegcBND/KMme4bTvV9SNSl4hZkaZ3QTkBDmv
         fR+MSX8686tmI7lP0Q4OFm2BaqxUH7lvqYDVknL0pg9h532GDpdgtYoLT8Ggfzm81/76
         QL2nwUE1NI7EZUKhvWgh4W5cXP2E8dBzN6m8G7QAI4RN+5esvNQ4Ph9mFaFEiGK+vI9R
         yPvkDADhz+kyvM82J6xR3S5x4ik1XVdd8gIp8KTQcC001bPdcpstcIpXUeKpWR5dPehJ
         PruwaOYtfNom5SvOwtzUzASZ+Oci8h1n8F4WopUpDqJZXHIUhpYMEn8OwOGjznm89VpJ
         M93A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791769053; x=1792373853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fub5Jcy6LRmb/gHzIvFjGYqxVr2QVdb2MxvdUeJjFqI=;
        b=Ly9qfU7sUoRvavm66y22mWnyEAFmt7SU7nPQief05UrSedP+KiZI5k8f8CNqYo0PyS
         EwF/JCUEBToZb83T7utc6sVZNWE4pFgxBywW+oOOKUIYkVygCJDfMhaSHe0Un3CmU9Js
         zwwLdIKzE11r60wiPgKoc/GdAxC6swIi3VD5hPt0Fc/PvS2wWjzi+FkQksYbIcB14mDV
         UsbztjFjgpMOqatUOCulO0Wwj8WSgh0wQ46vkKvu11Db0M307cAVOyUAbX/eW5Rc6Ruc
         e6UBZuQbYY8H6EEozNy7zDyZE8BJwIjvnd8G6xhFFHh4LNW1uZO9DwxI1DCHsDOPa1wy
         pQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791769053; x=1792373853;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fub5Jcy6LRmb/gHzIvFjGYqxVr2QVdb2MxvdUeJjFqI=;
        b=Hx+NMVTr7TpvDk0qzGkyOaIO7yhpcqJ/1OqQ0UQevFD4iZXXB4jwUUdgfJ7pqMmBjc
         htd0vmCB51T0j5Q0FMuJ5TRuV864L0udcER8gYW3IUoQC7lJ5vPpMCyZ6UI27M4DVPcg
         rgGqlPvBDnuwMGwRj9KKnvMMoBT4eI4eDrxhKLNJRzxKYOjV7tZYP2t8aLLZxKfnWVya
         0/rrAOs6ww8m0yeIa5D3LMi8ndvEVfJqmNW86EJ2gF/K5ukI+JWqSOiY7M9XKO8Ko/jD
         5zpC/ToysDMyqaycdOtOESjFd/grfKrCuHzUizGge/cuS2ZY/vNd8kywPN21MiEBpkp8
         1vjg==
X-Forwarded-Encrypted: i=1; AKwUvBzDyWizPmNRsYAblg1DSFvafSV0eYPCzwA1AVrH+4ZQPOm1dNqe5OQrlIpWjmNN5vorHYyrK1AcHsqmPLfB@vger.kernel.org
X-Gm-Message-State: AFq9FYKd5LeoSFx5SrzWEnzGogAARPno3SzyjQ+rXb2tKq6riqlF3B4/
	5ji/7NpKEzI6yrtWFMl/ps06taAQO8r3AiFIpQ5hFrXgecRH3uYnWDfPSVUXqv1e3xzopcyS94K
	Ad24UudcX1daBu16L7r0te2E4STgR53N5r8psFCA=
X-Gm-Gg: AYBFou32YKNnRNiG7ouPGTj40hI+5smiK+xijaQQpk/9JAbEaqSzP728ycFzsfeowkp
	N6vcDuNdBGd4/tiz1ncYTUiAqZEqa+tO9JXoQ4Af+aQFgGErQpuHHnZnu7xagHi04Hv2V3NoyaK
	5dqf3wQrG+nmxY136GFa/ltZ9Z8EfvVTmilfnr/2UrByaFt05gGnJyuHeqxqUVCPYw9EMJ+VuHF
	9kL7USLQbucgPnek6sOeF/jjDtuPjnsoisuGtNOStfpymBBr9q92uPFRgAt1gDi7Dwg+7fh5wUM
	MqR7FnFNJbZQWmwom+jtBa3J0yd+XROPrUew4pef4iw0Wt/Afi8BEHQ=
X-Received: by 2002:a05:6820:f007:b0:6c3:2d16:34a4 with SMTP id
 006d021491bc7-6ef08c786c1mr5975765eaf.6.1791769053431; Sun, 11 Oct 2026
 18:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-b4-ipcc_wake_disable_upstream-v1-1-d1b363b5a735@oss.qualcomm.com>
In-Reply-To: <20260916-b4-ipcc_wake_disable_upstream-v1-1-d1b363b5a735@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:37:21 -0500
X-Gm-Features: AclHuK87oJ93OBvwpS0PpodKPWCyuarfSIg_g9uznpYXDgKKFP6Fg0H6hEIxn_E
Message-ID: <CABb+yY27XKXgMo8k7J0=tPX+LnCxpJSwos_h=rCkk43KV5fqxA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: qcom-ipcc: remove stray disable_irq_wake() call
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Huang Yiwei <quic_hyiwei@quicinc.com>, 
	Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 2:31=E2=80=AFAM Anup Vishwakarma
<anup.vishwakarma@oss.qualcomm.com> wrote:
>
> Commit afaf2ba5b430 ("mailbox: qcom-ipcc: Support interrupt wake up
> from suspend") replaced enable_irq_wake() with IRQF_NO_SUSPEND on the
> IRQ request, but left the paired disable_irq_wake() in remove()
> behind.
>
> disable_irq_wake() decrements the IRQ's wake_depth. With no matching
> enable_irq_wake() left to increment it, wake_depth stays at 0 and
> irq_set_irq_wake() reports:
>
>   WARN(1, "Unbalanced IRQ %d wake disable\n", irq)
>
> on every unbind. Since there is no enable_irq_wake() to pair it with,
> remove the stray disable_irq_wake() call; IRQF_NO_SUSPEND already
> provides the intended wake behaviour.
>
> Fixes: afaf2ba5b430 ("mailbox: qcom-ipcc: Support interrupt wake up from =
suspend")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-ipcc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index 185b63f724d4..759577055671 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -348,7 +348,6 @@ static void qcom_ipcc_remove(struct platform_device *=
pdev)
>  {
>         struct qcom_ipcc *ipcc =3D platform_get_drvdata(pdev);
>
> -       disable_irq_wake(ipcc->irq);
>         irq_domain_remove(ipcc->irq_domain);
>  }
>
>
> ---
> base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
> change-id: 20260916-b4-ipcc_wake_disable_upstream-28bcbd84cef4
>
> Best regards,
> --
> Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
>
Applied to mailbox/for-next

Thanks
Jassi
