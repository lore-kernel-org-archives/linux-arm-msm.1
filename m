Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406B9377A99
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Aug 2026 09:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785663407; cv=pass; b=BKj2o9G8jR+xqMtzIM/cYzA1bpOkp7ZdBs2egCPGO4FnMNB8FMqPEdNu/m9mGdadvoqY9HoE0wdNFT0R7ccNa6MVLvxyhIQFZpNw0J7jSBNhEhfaGW4gHqnISn0f9OTtK3Xyktnb3oxysZ5a1r76ajQZQvyAY5LlGFsRPy9V3gU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785663407; c=relaxed/simple;
	bh=wd8tHqZohk/aW8RdGgbQAyMCpTo7z9xvp77bTfHSxhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lylw9O48XYFdAhvmAgZnktLqtR8yMyPBvZK5gjUepQVA1VSRvQ0g48NWWcGqj1LdYGX40VTn4dPN0xVZDWfNf/ZS9Yg/Yz0EbwFYC9qJFQ1Ziienx/6i7i7Q5JbtbhOb9BX0arhyncs3KeVvjQVq2B2r32OmcInmQFhblQjnqPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdqthIqw; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdqthIqw"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bfc4f26c67so77602e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 02:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785663403; cv=none;
        d=google.com; s=arc-20260327;
        b=kgwAviStButQ+RieWWUGmAkcwGO1Km9pmDMsNPcc2Ye7Kw7DhjxMHzqgvTYrvdFLmL
         POqfBYl25aPD5t2Mqh8SbLdsaHkIxwJuHZrVdBG1bLqrnHa3/Rot7XlJjviV+G1YLoIz
         6oSQ5EJgusLtn1xghtR+fngqxoAU9yfvPyxsWmKiMNsPx5pMAh2/8+aCLB+FtX+ZnPCs
         REkydOje1VI1vV0PFwaxKrzeu2KJahJZyfNLxoSJnar3p9s35jMaUWa/GNWfycrFX8TN
         u+x4mLNvK/Q6dMBk7dzEdsODLovbItip2xo4Y2zfW+BxG5cNTbdDoa33KmCnGUDmSIPp
         yLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MhnnTLSIMkzvtvCSWKz/378Edzf0C9gWj8aS77H608w=;
        fh=vcZULMVUFf/jvWbw3ZsVURzsnGKger3slxsYxlzfxYo=;
        b=Ry1DZ2N+y2BynUDVecnEW7rpRGp6YyXRrX3DYEQoAycbmCELAuU3dxB66V2+dHr/xC
         iT0yVe3Ux6amAIbVqaia9nN83dEYSPG80tbOcTYlQkCW8gvwns2XQvTHsv+Of7B0nScD
         t4jGz5u9Oz9z4c86NCQJMhh3u+3xOmaj/LndPgE0/reV7sP6Rypj11gSWvnf+UwG3HWu
         Bk6p2VekBIRO6nreEE/l31Gj0uOUycEWIZ236bF/3dCYzlr84H9kEpW/BWdNqG7oty1l
         HQsUZFkb8C7tB2dE4oKhFqEuuRCLYjwLSYYRROdtjrUCn3AmentK+BDY/hr211hcewVj
         DwtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785663403; x=1786268203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MhnnTLSIMkzvtvCSWKz/378Edzf0C9gWj8aS77H608w=;
        b=PdqthIqwaBb/SjO6/HxM/suGBArJ+pzUJozZ1CQndGu81T0DEmi4dYmjC6Tm9yAIg4
         iXSQkruY4Pp7u3WHfiuzjlzRTqRTuDfLb6khf3z6khBCd4LASf4p9zYr/5nXhnfqTcm3
         uusE2dcO+s/Cw2Pi9MM6OvlCOYODA62Qshudz+Kk/j1Dxt1sZj9SUsxT0/9XTG25v7Dk
         rG+DxPCtlU2o80uqjd+TvGraO6TrsX6QBV5AZVJ3ExYqKeZpSzICpHDIoIhWzkdTGt3l
         8nNJR8vbLs9NLx1WWKf1pEb11ndb5Id0gRJT+g6efQEtbMPTbQnoRjNTxOnjIwg0EC5o
         AisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785663403; x=1786268203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhnnTLSIMkzvtvCSWKz/378Edzf0C9gWj8aS77H608w=;
        b=bbR4RG0kk1JThE42hKyCr7BHC0OmHNF+ZR86oB3TLAu3b1kNlK09OMRnIMxKgqMzf3
         WLHXU9MOtmscQsAVuFullympfYJnZ9XMLxYUa8MRQctuV0CLALx+9BnMKtjM+qIC7Vpl
         4nAcKJHopamVzswmuw6UqDR26MaEccs/G8xcC8pre9KYgYYgriZu9dR12yxkVuzvW7SA
         mulZQ/CrNh41v7LPn2OVmfEe9BcEz/TKEAcTBOlGmW7KwlKp3KlXZXbw+o1Kzy96gfuF
         53Nf56WJHNzYh+/R0j51R36hzByHmV9K6CWZdD7gqdCAYG2xg6RVhfz6txcNPUdAYvmq
         0E+A==
X-Forwarded-Encrypted: i=1; AHgh+RqtWxdr6Egrj1sjKWWWk+QMlhAysBoiLPsAP8Iipl+gAfkeHw4JcBmGGAuDuVJ11TXeLhqPdRBUlS2w9v2e@vger.kernel.org
X-Gm-Message-State: AOJu0YzfxEa6+FtVBISvpzarKVk36XuxpNwyj2OW2ZRPcZqZaUUk/sCW
	YYBpVk2aLL2D8L/x4SfibxPuB5LSGopO3afxwzzu/cpHDsTQbo0CMWsqSj71Jm8tEQfeGe1cCtz
	wrn7YqZo7BQWU+tAAB2o0tqrPZsc7mjs=
X-Gm-Gg: AR+sD10fZuLAnEyJeK84A/6Rfqga/3snhRNnq16hRSiSWaai+DEyKsg290s1u9Dgxyd
	EhDP2tt5YJKltFESS4nf7UsFdpWt3BUT2uowP1igVEctoQ8kcXM1wzH8ciQPp2i4ml/qwb8AdnR
	MUSEh7Y2XmvBxAs7hf4ae9e76YUQvW1VKt+6aFVUEMUU0aWyW62opYXjPF5Gz/wrj2AzqaBLxdF
	i2cfjuACcFRSmGsqHrdEh4Ae/Ul8VMTB9uJCcxPuSDP9pOneDMYMbmjJUC/a9JncdezT0RpY9mO
	6Dk+7UrAQDsGDWH2rtTW+ilW6R6mZ/ZwCSJmiyXMqjAwuRk=
X-Received: by 2002:a05:6102:f0b:b0:633:3bf6:977c with SMTP id
 ada2fe7eead31-75b21a5a8edmr1814195137.1.1785663403127; Sun, 02 Aug 2026
 02:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701175724.1972-1-saileshnandanavanam@gmail.com>
In-Reply-To: <20260701175724.1972-1-saileshnandanavanam@gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Sun, 2 Aug 2026 15:06:47 +0530
X-Gm-Features: AUfX_my_LxAcUdOY_WNOBOxaxIwNZaZlXe-TBifaqlN7yyXs0XlwlZWWPLl2aYM
Message-ID: <CAF+TLO0wG0h9yo-tAqb3rJCiA5K1opj7rR3dDgJvm-hd49My0g@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle
 and leak
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping on this v3 =E2=80=94 it's been about a month with no review
comments. Wanted to check if it's just queued behind other things, or
if there's something about the approach.

Happy to rework anything.

Thanks,
Sailesh Nandanavanam


On Wed, Jul 1, 2026 at 11:27=E2=80=AFPM Sailesh Nandanavanam
<saileshnandanavanam@gmail.com> wrote:
>
> DTB co-firmware was previously requested and loaded in
> qcom_pas_load(), but its lifetime did not match the actual
> start/stop lifecycle of the remoteproc. As a result, the firmware
> reference could be retained across restart cycles, leading to a
> leak for each successful boot.
>
> Additionally, if qcom_pas_start() failed after loading the DTB
> firmware, the remoteproc core would not invoke .stop(), leaving
> no opportunity to release the associated firmware reference.
>
> Fix this by moving DTB firmware request and loading into
> qcom_pas_start(), so that its lifetime is strictly tied to the
> remoteproc start sequence.
>
> Update qcom_pas_start() to ensure proper cleanup on all paths:
> - release PAS metadata on failure
> - release DTB firmware on both success and failure paths
> - unmap DTB carveout where applicable
>
> Remove DTB firmware handling from qcom_pas_load(), as it does not
> match the correct ownership and lifecycle model.
>
> With this change, request_firmware() and release_firmware() are
> properly paired within the start path, avoiding leaks and ensuring
> consistent behavior across restart and failure scenarios.
>
> Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-f=
irmware loading")
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
> v3:
> - Remove the unused release_dtb_firmware label
> - Release DTB firmware under the existing dtb_pas_id check
>
> v2:
> - Move DTB firmware request/load from qcom_pas_load() to qcom_pas_start()
> - Fix firmware reference leak across restart cycles
> - Handle start() failure paths where .stop() is not invoked
> - Ensure firmware is released on all success and failure paths
> - Remove DTB handling from load() and drop release from stop()
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 52 ++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index da27d1d3c9da..d0a12e5b2ff7 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -232,28 +232,7 @@ static int qcom_pas_load(struct rproc *rproc, const =
struct firmware *fw)
>         if (pas->lite_dtb_pas_id)
>                 qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
>
> -       if (pas->dtb_pas_id) {
> -               ret =3D request_firmware(&pas->dtb_firmware, pas->dtb_fir=
mware_name, pas->dev);
> -               if (ret) {
> -                       dev_err(pas->dev, "request_firmware failed for %s=
: %d\n",
> -                               pas->dtb_firmware_name, ret);
> -                       return ret;
> -               }
> -
> -               ret =3D qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firm=
ware,
> -                                       pas->dtb_firmware_name, pas->dtb_=
mem_region,
> -                                       &pas->dtb_mem_reloc);
> -               if (ret)
> -                       goto release_dtb_metadata;
> -       }
> -
>         return 0;
> -
> -release_dtb_metadata:
> -       qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> -       release_firmware(pas->dtb_firmware);
> -
> -       return ret;
>  }
>
>  static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem=
_phys, size_t size)
> @@ -277,9 +256,24 @@ static int qcom_pas_start(struct rproc *rproc)
>         struct qcom_pas *pas =3D rproc->priv;
>         int ret;
>
> +       if (pas->dtb_pas_id) {
> +               ret =3D request_firmware(&pas->dtb_firmware, pas->dtb_fir=
mware_name, pas->dev);
> +               if (ret) {
> +                       dev_err(pas->dev, "request_firmware failed for %s=
: %d\n",
> +                               pas->dtb_firmware_name, ret);
> +                       return ret;
> +               }
> +
> +               ret =3D qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firm=
ware,
> +                                       pas->dtb_firmware_name, pas->dtb_=
mem_region,
> +                                       &pas->dtb_mem_reloc);
> +               if (ret)
> +                       goto release_dtb_metadata;
> +       }
> +
>         ret =3D qcom_q6v5_prepare(&pas->q6v5);
>         if (ret)
> -               return ret;
> +               goto release_dtb_metadata;
>
>         ret =3D qcom_pas_pds_enable(pas, pas->proxy_pds, pas->proxy_pd_co=
unt);
>         if (ret < 0)
> @@ -350,15 +344,17 @@ static int qcom_pas_start(struct rproc *rproc)
>         /* firmware is used to pass reference from qcom_pas_start(), drop=
 it now */
>         pas->firmware =3D NULL;
>
> +       if (pas->dtb_pas_id) {
> +               release_firmware(pas->dtb_firmware);
> +               pas->dtb_firmware =3D NULL;
> +       }
> +
>         return 0;
>
>  unmap_carveout:
>         qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  release_pas_metadata:
>         qcom_scm_pas_metadata_release(pas->pas_ctx);
> -       if (pas->dtb_pas_id)
> -               qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> -
>  unmap_dtb_carveout:
>         if (pas->dtb_pas_id)
>                 qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dt=
b_mem_size);
> @@ -376,6 +372,12 @@ static int qcom_pas_start(struct rproc *rproc)
>         qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
>  disable_irqs:
>         qcom_q6v5_unprepare(&pas->q6v5);
> +release_dtb_metadata:
> +       if (pas->dtb_pas_id) {
> +               qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> +               release_firmware(pas->dtb_firmware);
> +               pas->dtb_firmware =3D NULL;
> +       }
>
>         /* firmware is used to pass reference from qcom_pas_start(), drop=
 it now */
>         pas->firmware =3D NULL;
> --
> 2.34.1
>
