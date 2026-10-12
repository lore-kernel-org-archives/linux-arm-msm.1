Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABDA2F8EBB
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791769026; cv=pass; b=Bz4P8ndWUx7gYleRrhqQ2HHrGr2idZrXrcCBQIVbRz2KvvDUYlbT3IYedp7VgdiuTEzZaNkTxncPUk8/N2oZXsW2dVlvgmOyDKJYcC8AAGw31GeaaD7L/XlxZsJATMlc0VgL9FcMT8BXKegR+sX/AkVyxTeAqvbi0EkUM+njF/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791769026; c=relaxed/simple;
	bh=23Lw7vM4wP52T5CZZzj5VSVp9TctYmvu/KUZ9CKSfFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnIb+9AUjEoQLyFbLC0+4gKZmbXQE8VN/t2wG/2rMCHstrMyfEFnJzQ5uZ9rNJErXbs5dfQlEoo3QKWE6aSya2ZPC076mEidGwAGQib6kGNVjN9QOhcm5wQ4IjTjh8uFDp+V95zmXi6CLdMEz/48tbPjiBM6DSY1l53nk4yk4gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcNmOjgX; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcNmOjgX"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso1391785a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 18:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791769023; cv=none;
        d=google.com; s=arc-20260327;
        b=MkGCrQQ8FqiKzoRegMbYFKVtMEL1Fjp7/CZmgNegJwYOoCLW280dDQYGmikJ5GGH7s
         0ZIWnTddVpeMssm7WEW8iL83i6JYCvTCmeF+FqUJSHbco2uGOkyjkd+gBwnhaqUU0z6v
         /HbHfNkI3ddfLdugq2GM3WqGBaBeEEnRGeFYyn8/2c9Xi59+mbNPUJi24RssanREbbtd
         0HBmH/5HooBq00YaAyIhtjf0EdrasvCBjiddkXQaPHoNjht26EXd2OGs7LUL7NkM7Qfl
         wXjO8fcPvoAHFUqHUyXkHURuV/3Uz0+RyOcKZaOJ3IMOqbCao1QYEQPI4PAuU/QQ1Gmy
         ZZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kIt1CS5cV077Iep8QC6bTj/foPl01OdYIeRJxdNPDpM=;
        fh=rHywzu7g1IEdOtJrs1eFOcQwRgL7/oI8fWCMb7pE4qI=;
        b=O46YX/bHtZdQ2qvO+AhJtT/RV0IMF2OoB16ldvfSf7fVcwIVpyEUXKga0WQ5RPP6XA
         dl2Rqe0+6aWbOYqIJR3O+RGyb/maWuGzjCBLw1ynMYrSxzl1q23Tci1d9QAAgNEtFiml
         UzVQXr3lzT5LJSf8MCKnyZhXeT+ZCwXO45rwC1dndK5lsnI3w/vEaU2wGKDhkIX9Xnun
         LYmlrUpJGltkCx/tktJWWwUoX8+V6wFcfe+17mVFxIM+52MbKvp3H7Od2QHhgk7GVfyH
         koBaMDEKq1ZfRUqBGulG7HyTm6XscLQq/THPhgN5dwZmDaoD8H2kqRE5C2aCAvOM4XO6
         rDNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791769023; x=1792373823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kIt1CS5cV077Iep8QC6bTj/foPl01OdYIeRJxdNPDpM=;
        b=UcNmOjgXlPQMd1zO0rW4fso00eY7TnU0dd6c1bPHO3qs33uILAgn8qiwjkCIs/CRiK
         QcFqdlFhb+K4R1xgjWj9wAod5CspNT4H49FSTu7fICel2+4jVtzdBITP0YdkX28hAxq0
         CM9wtkn9yDRd11qQlYRSat1iwxVng3HptbE7Cp62kRBF376OGf7WRn42Gsnvy65IsW2F
         k3IzhfvMiLMTR9avLfZOuiBuTWm7y1eooBblrhBCu5am/2U4xAEwH/QluAd66aOoDs/H
         yUGz8xErzfv5eOU8jdzwyEvOkZu3kA2nUVgzB1E+LRZPRs+qCFINnabgKoLbU5GiBsUN
         jdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791769023; x=1792373823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIt1CS5cV077Iep8QC6bTj/foPl01OdYIeRJxdNPDpM=;
        b=dxXfyyfyznU9Ry+LwZuv3iWipBxrgoX6E3s7BvL3Jq/9r+cK8KP+85QRhOqgc5PlXI
         scgR6/JeuXa+yqsYPll1tG7cuJ5AbSoVfHwybIzHU6q60pCnnajT0Gr5zBsivGyap48k
         UWz+94qgP7mW2yda+Umc753jpoXSGtk2OUrauJ8soqmrVIUtjWKm8dHKxKEAglmWzrpy
         b0sBgIQFbjKH/XnhvrTUloGPxS9seJlV01Dijc7fbh18Or7d+TXMEjDUF4H+zesJjsfO
         aLC+JJAKxqsg+vwEJJTUtLTZM/XAtKrUjGcPyjK+W9paorac/HkmgekuLAT8sH/iVIja
         7ooA==
X-Forwarded-Encrypted: i=1; AKwUvBxZhtLa904RwnJBv6wyCdPYXJrv57htCS/65EwyRmaJaeJT8wp0ugnqtuebO+BeBMwugNhOH1yLlNjGkKMg@vger.kernel.org
X-Gm-Message-State: AFq9FYIW5VRmxYtNq6dJ4DT3QygbodqYUC06ZLmULsVidpYjQsldlFyf
	2Cfq1L2idx+v96QMRE60CVL8TVDuTUMeTCgkLNY2w2dLlaVuI+akBVmcHddeWHdHd2bNySPokB6
	ihjfq4IxmQjoEAHYYGfRsFLFdO0Nape4=
X-Gm-Gg: AYBFou319tBtlkKa79kV9ZTLaqIoLdAvnBImk++X19iCf4cmeV8uUxnF0aM4jnTWb0+
	HfkIj2Pdy/nmgXGIQgMcqoQUgVZBeJ3KddNKMycfA4RgWly2uPQgNhnhDZ2d5Bf8rbnCE9QRCGI
	gAEDusBWZADPDoEFGWl+vtyrLHDc6ERf3zhGewr4U6UsVqX6V8eAszHASvLVUZSX3BHrjptpXle
	C61N2LTkNlNGQcp21e1PpstOxrEcaM2GNBwYVCSoOkmqOReTSD4NxATHsQi6sMa9F0vgu4YcaU2
	QiMaaPshSQfaBnsZ7PGjxeNKnFjAsZlLlIldPnBJbskY08u569wEqDI=
X-Received: by 2002:a05:6402:1ecd:b0:6ac:8ef4:177d with SMTP id
 4fb4d7f45d1cf-6b17c244847mr7817735a12.20.1791769023054; Sun, 11 Oct 2026
 18:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-b4-ipcc_send_data_null_check_upstream-v1-1-bfc61f5056a3@oss.qualcomm.com>
In-Reply-To: <20260916-b4-ipcc_send_data_null_check_upstream-v1-1-bfc61f5056a3@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:36:47 -0500
X-Gm-Features: AclHuK_9kqp9LiaECpF6jdko0DVDOwODce2xY8QZwz01sjZXIAlcS2lK4ydkNvI
Message-ID: <CABb+yY2TGZX37Ketsx33Q93wWLSw1LP9+auTHywmb9-GrBd2-A@mail.gmail.com>
Subject: Re: [PATCH] mailbox: qcom-ipcc: Guard against NULL con_priv in send_data()
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 4:57=E2=80=AFAM Anup Vishwakarma
<anup.vishwakarma@oss.qualcomm.com> wrote:
>
> qcom_ipcc_mbox_shutdown() clears chan->con_priv with no locking.
> qcom_ipcc_mbox_send_data() dereferences the same field without
> checking for NULL first, so a send racing a concurrent shutdown can
> crash:
>
>   mchan =3D chan->con_priv;
>   ...
>   hwirq =3D qcom_ipcc_get_hwirq(mchan->client_id, mchan->signal_id);
>
> Add the same NULL guard mbox_send_message() already uses for
> chan->cl, and bail out before dereferencing a cleared con_priv.
>
> To close the remaining race where send_data() reads con_priv a moment
> before a concurrent shutdown clears it, acquire the spinlock in
> qcom_ipcc_mbox_shutdown() using the modern guard(spinlock_irqsave)
> primitive before setting con_priv to NULL.
>
> Fixes: d6fbfdbc1274 ("mailbox: qcom-ipcc: Fix IPCC mbox channel exhaustio=
n")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-ipcc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index 185b63f724d4..387aa72aeedf 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -10,6 +10,7 @@
>  #include <linux/mailbox_controller.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/spinlock.h>
>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>
> @@ -151,6 +152,9 @@ static int qcom_ipcc_mbox_send_data(struct mbox_chan =
*chan, void *data)
>         struct qcom_ipcc_chan_info *mchan =3D chan->con_priv;
>         u32 hwirq;
>
> +       if (!mchan)
> +               return -EINVAL;
> +
>         hwirq =3D qcom_ipcc_get_hwirq(mchan->client_id, mchan->signal_id)=
;
>         writel(hwirq, ipcc->base + IPCC_REG_SEND_ID);
>
> @@ -159,6 +163,8 @@ static int qcom_ipcc_mbox_send_data(struct mbox_chan =
*chan, void *data)
>
>  static void qcom_ipcc_mbox_shutdown(struct mbox_chan *chan)
>  {
> +       guard(spinlock_irqsave)(&chan->lock);
> +
>         chan->con_priv =3D NULL;
>  }
>
>
> ---
> base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
> change-id: 20260916-b4-ipcc_send_data_null_check_upstream-072b8856680f
>
> Best regards,
> --
> Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
>
Applied to mailbox/for-next

Thanks
Jassi
