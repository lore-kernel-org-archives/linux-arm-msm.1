Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1543546F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791769042; cv=pass; b=RAAa9Hids51DuCmfNX9aaRp4VeQgDaDe+6rofCTE2yRunuYf3oFKmX8YUTuegyWowdq3rhNPCTDWXAqWq5Ya+PK57Vy9rjhVbTQaSwOfP1fe7CU2Ntf025w66RNIlqkVv5KqooQjOZHREQ1P6wQky3GztybKaKUy95gL8qQ0dW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791769042; c=relaxed/simple;
	bh=27zRREs/iQU8BuW+sKyAEHMiA0sOD1XRpDayIfbbcFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDviInEFU+PgHRPBnORhTAWhB2ZZ8FAx8vXXNwb4IReMemE60zhElC+QWrEs1G2RqAsNllqT7x3D7IhS2FyW3nOAUa67K9e6TYfOlicPaDn8wWNij+CENs6aQorxDHlgLpXUsW74qJI02UU+anoI4EPMYFX8GnunX/OmZhubfng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K536Q5Oa; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K536Q5Oa"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so2093380a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 18:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791769039; cv=none;
        d=google.com; s=arc-20260327;
        b=PCD9Vuc7pn8FT7fQQhlEIsA47EUsKHs0mUF1tp5vuLZRHU61HedRAoemSkbFTlwfDD
         mckEIk03UvCVVPkUOuH9ha6s5R23lMlrHjLNdAE/bH5h4EdNjprzqd+ytkfw7QzCThmA
         5UolHQKU9V/P/sCqgA6fws0/OIOwWBRjoctd7KM+rIXPteg3OMy+5n7sqaqCncL25/cP
         5LU7ShFxhboUJxSptbr125Flo8na05SowP82EpAzVd6c+1J55UdEvY8BLvIHhyX3maBK
         XMQY5CMhNfkoPxXEOKhkFWYYBpXuIyYQ8n5ogXLTqURX71pUesER7G6PEhapt/MJpJ9/
         405A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fSK8TRXz9YiXYBWIiPTeq3ah11Ec5owqYypiu04/NJw=;
        fh=G1QCi9RpG31mcLrQl7uJ0W+fCZg9UZHg1FLT+sgH19g=;
        b=lnCrvZQQtN97g+Wd0Qx+x+iUv2kZxNojS+vzZLvRderOJrxqRWaZC+bmNnKggaX4fS
         Z9MN+QAOuS31+jtrcf+dD4kaYBRfWjRt0uizVuA32B+/vU6a73Rz57Q0XaeAZpRzTey8
         pwMPkwB6TeWkkTmMkUfkgiQIHVb5qDFKTNYZbLNRjnFNm8fYAjmaqS2rEHeTGp/CmxRt
         oWz1b0dMg14GODHZuh38KYjVOQELBqh17sbs3AswRsKIc0Gr8ba904s8qao55OhMBzGb
         PdfwP57sdChwrBCbxXAOJiHFw+tcYfQrtuTdRvQ6gPyUD40R6nLUls9VKBY5l8Ew+PTz
         7M4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791769039; x=1792373839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fSK8TRXz9YiXYBWIiPTeq3ah11Ec5owqYypiu04/NJw=;
        b=K536Q5OaPYNT/ru+X5ksSqrv6vJm8hab06FjoeWQRlQ2xehrCMEaWIsqJP9mMx+/Rz
         DQCtSNtnZMQy2ofLuTDo9YYdxRYeFzmFAXxNBx41cGeQlNpQIGr4zZzUYQ1VmzlxztMq
         QJ0byBu1wSfJU3l4ZwTwAdctbSphk+rfH+QQHSg6Geo1fJCfSOFzI7M+rOuOo4qKbv0o
         2fk/kEZcjQi/yUKdvQUmbJxr2nfPs666363mVn+Xfq+Nig5uZn17inz3XgBh+6DMzanR
         UrH9zTmpHeXJqtPDDlUkwO3jqxQMKZcF8t6DLEOKc/nZa25KtSh9u/jsOzFdbo7G2blp
         vNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791769039; x=1792373839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSK8TRXz9YiXYBWIiPTeq3ah11Ec5owqYypiu04/NJw=;
        b=hfIzZbZfLDSZkO739DdXJykojOiFfeX7HigGXnVvpstO/StyoLhoXD7xx7paVaNQy+
         SVJ4q9J7MiruLifWLUZdaZa20UbDO3GHfkf7SDx2r6g8xGLJNLNbtwGpCD0FZnb4bW/m
         n/hx9a1x25cnMssQtkw2K8/xQ/JgjJV/lC8obUmI1/H1Oxwyi8Zi1A9IqXIWElaiu4LD
         CotBteOENxAuk33jI3FQbyvPMmDCFYxNp/u4FmCut+WMwrKMoNbR5UliiNbFaYg6JEST
         avRhlF+IUgOKNj0xyIES+5LM7RPBBm87+Tfg55nNk+xaqopWE5MeCVW61DMu78cE5Pf+
         FRpA==
X-Forwarded-Encrypted: i=1; AKwUvBx0NB1L26leY241dZdX1mIb2iyTV1LcW5ZTtnmmr6FwKcXoRwqPBA5ImUFb77tDhy0g1gX17pkuqgiECZWs@vger.kernel.org
X-Gm-Message-State: AFq9FYIszr2RGjw7G547wk3IluTYtHjBgRnOyBYbzGwshkwqRAimeGSQ
	HHG7s1gnASTxQvCTvjTr2CFl7YJF6RlFPlSka2ehZGnbrakRq+vbil7Wx9v8CiNhYWavL1YHYXb
	283q7lgxjFG4IDIcw+133gfLVMy+gLbo=
X-Gm-Gg: AYBFou2tAcEdwdWy9uJelXBV61RBcFJe++NJ3eTdANwyGvt5tnEdTe/8aWYeiCjbAEP
	MDiw7ixUigo45CdCoZx8ZRYhJvvmDnPV7XgnFJL5prmsMBQXnPXM+/stAGmvzId62UvWeqVnzx0
	2NC+t0cciRrky9BCI0ydBxQSZo3/BjAepq5gXR00MowoDTDlsEcxVTVrS9+VBno3k1by9+kG7eL
	LoAkSp59TDPpsIyt4JTsWG5LCNG0VnTgRb4SloUWBr/kXbTW/c355LmZ0JdDqkpit/XedRMYI3j
	IYOFfDB5T+Isxhk5xcLjU+NrzSqSKpTGB/szaSRNtYiPIB6D/VZ5pnQ=
X-Received: by 2002:a05:6402:4007:b0:6b1:bc9f:8ff9 with SMTP id
 4fb4d7f45d1cf-6b1bc9fbad6mr1546187a12.19.1791769038583; Sun, 11 Oct 2026
 18:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-b4-ipcc_static_id_race_upstream-v1-1-6e2163e20523@oss.qualcomm.com>
In-Reply-To: <20260921-b4-ipcc_static_id_race_upstream-v1-1-6e2163e20523@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:37:04 -0500
X-Gm-Features: AclHuK_hRJ6H5b2TtORUrGn3dEPyJXEf2zEiJvpFEwPt2qNkCCdhcmrNuTADBT0
Message-ID: <CABb+yY1LFocx82GVjWeUjzcS8hkYMFySLXOwNTs3ABN36dn8hA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: qcom-ipcc: Use dev_name() as IRQ name instead of
 a static counter
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 9:21=E2=80=AFAM Anup Vishwakarma
<anup.vishwakarma@oss.qualcomm.com> wrote:
>
> qcom_ipcc_probe() uses a function-static int id incremented with
> plain id++ to generate unique IRQ names. Under async or deferred
> probe, two instances can probe concurrently and read the same value
> before either increments, producing duplicate IRQ names.
>
> The device already has a unique name assigned by the platform bus. Use
> dev_name(&pdev->dev) directly as the IRQ name. This eliminates the racy
> counter, the name buffer, and the devm_kasprintf() allocation entirely,
> while providing a more informative IRQ name in /proc/interrupts.
>
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-ipcc.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index 185b63f724d4..456596569bb5 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -282,8 +282,6 @@ static int qcom_ipcc_probe(struct platform_device *pd=
ev)
>  {
>         struct qcom_ipcc *ipcc;
>         u32 config_value;
> -       static int id;
> -       char *name;
>         int ret;
>
>         ipcc =3D devm_kzalloc(&pdev->dev, sizeof(*ipcc), GFP_KERNEL);
> @@ -313,10 +311,6 @@ static int qcom_ipcc_probe(struct platform_device *p=
dev)
>         if (ipcc->irq < 0)
>                 return ipcc->irq;
>
> -       name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "ipcc_%d", id++);
> -       if (!name)
> -               return -ENOMEM;
> -
>         ipcc->irq_domain =3D irq_domain_create_tree(dev_fwnode(&pdev->dev=
), &qcom_ipcc_irq_ops, ipcc);
>         if (!ipcc->irq_domain)
>                 return -ENOMEM;
> @@ -327,7 +321,7 @@ static int qcom_ipcc_probe(struct platform_device *pd=
ev)
>
>         ret =3D devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
>                                IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND |
> -                              IRQF_NO_THREAD, name, ipcc);
> +                              IRQF_NO_THREAD, dev_name(&pdev->dev), ipcc=
);
>         if (ret < 0)
>                 goto err_req_irq;
>
>
> ---
> base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
> change-id: 20260921-b4-ipcc_static_id_race_upstream-2914786b5628
>
> Best regards,
> --
> Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
>
Applied to mailbox/for-next

Thanks
Jassi
