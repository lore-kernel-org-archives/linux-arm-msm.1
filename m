Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA94A8418
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 15:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003715; cv=pass; b=j5EWmH48NUpioAAi7eJ6O8oaTiYAx3KB015/cQhx9LC41Ib/+kAmQbPhOaPvixQxGyX4YLIY5EzWnZsT0R0Z/CHj7c7hCWjnBH1U4mdKJx6iRDDmwbwc8Fnwas+vYu7l+5rnhH150o532AbW9nGv252DDGAHDZmqco2HKOWHdtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003715; c=relaxed/simple;
	bh=E1DA6eJVvIMFAljzS7SN9tcSVSmcyDpJjIEWFM1xV2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ml5TZhHx3+0Vgd0Q3gZ6V1X2xPSIk+u9MNLJIPAEbhhiQ5v3YEaxeusW1ele27YSo+769bSBE1MR2QBHM55EzqX/WvcPxr/5MFo54OvkXmvhwdyPZpWV7+geRACjO9nMUCR9cMMTUQX941VVy2/Ath57NCW/t01b6WGvkJuVw9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYcejnEZ; arc=pass smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYcejnEZ"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c6560f7a84so106117e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790003713; cv=none;
        d=google.com; s=arc-20260327;
        b=XUVgOJ4wO5Ngh2bKXVOa9SQwnRlu+yJ0xGgUKtaD7zP0adhaUOByEczAjkR4QpAtxL
         UkGD00upASUWUPiIM9tpkX0FTl4vuzxqJAhB9KaY946nECV9jL96PHoabHU10bp5WLwH
         wk91FbOtDcqE4j5jcJRcWTcQMlttD3Cap9ybcXGxXaxhM4rL338mBK3fK80p9I74I05s
         Ua45n66+Y6NT9I9gOLOk6EA65qmo+h9tYrRCFFIFkgg+7Fp+qjLYhMSG78gMtA0lvit0
         1csDKp9qh2TlZ7kQzX6HoTj4IHrpvu3QdJxyMjCRJHrIXAT9K+C0rtrd3FAVErU/igAK
         TPtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z6taRN1yfrJhXingP4b7nQEv0S92qILvbAb+oYWwjHI=;
        fh=7O91Ns2STaNXG/DTNzqQmv7nnORcMT3lE5K/3Mt1i74=;
        b=JuwB+YWgTsJcpRLkjSJtP+HFoJEO/xB42wfY++roDank3MOWRaZnwOGATq0ai8Hi7h
         duCzesAzHaxx57TQcVgx1Hmcvy1O1ngLKoCQpaLxTAEEbMKRmm2owAZibQwRaT13zKUZ
         X1QBck89AlrCoXYGB0OULG1+vGqk8Zonl5aiByxHichz0PMWBJ+shtiQHgxZeCE+U4Vr
         nRSrYHtmOvLO9eMzsRz7U5UzYCifLnIEIeQMHnrS2PbX6PLqWkHxoGDl0jNpSwKzd5sF
         /Qugp3aoLXfeA4PIvI2IsPHpkUqzpSevlot4fiwbCqYWg5JzuZf7D1MWNZmtAu9ojA02
         1MOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003713; x=1790608513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z6taRN1yfrJhXingP4b7nQEv0S92qILvbAb+oYWwjHI=;
        b=YYcejnEZUgXmxS+DBiRdXO4VYJ3EkCmVURstwalAAXBeZyJcM53rKczeAGMIpyfnbE
         lTZHz/YTf+kwkyuZ3lPn40CRhta35f1qzui/vUpObOnDKtNwJ2PBrHoxoavPvm2XaR17
         pKGwpY44RO8uPDhkrOGkZ/28cPUegfJ5HQMqaKzA74G7Ze7sTRE3brsBgRgv5h8K7heq
         Xwqiva/zVcyMZ8lDRpoYzwnr+99BS8CSZ/jDlTev+N7FVRBxaAFOTvsXzDEzRyFDkgiF
         s7Djc5Gnd0xNDxiBkSO1MBJ0EArkcqMCU5PPeMZLL4B2P8NebjRm3o7FW9eU3eahZRvu
         mYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003713; x=1790608513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6taRN1yfrJhXingP4b7nQEv0S92qILvbAb+oYWwjHI=;
        b=ppFTJSXYeGLGKHFOEms3E+pnDc4pjbUCDnQTXW4rRvXZl3XMIO4wKW3JNUJPVE8cIt
         wzbt/TUU05kScc+eebafULJarNbt5MUa0cO3Xl2AIVYfcw2+3td2eeYusG9ZxKqcoNAV
         GoqhKwY2tha0QT8G3KXEG9HlwSBHFuT7VKbZLF5qjSbh/kPdp76whZcDW053NwdvxdhE
         bpA+5j/LWy8MZxvKcGqiIgA6F2/kaV61zgtlsyV98CIRDctcSTK9sZfov+5BwQoMSMP8
         T+dGxEUcCep9t90EJ2vr20k9NTsyPRvHfKr8AfZhh5k+ni80y0E+ycf6d9uYUE2EKZF0
         gBTQ==
X-Forwarded-Encrypted: i=1; AKwUvByAR2zHiK/U2+2IyuAvJtzebeADyccWjxqf7AW/ogmKDMZR1cz7iwu2RZC4ls421Ol9xtw4xPpwu9kMH5Hi@vger.kernel.org
X-Gm-Message-State: AFuF++nQ3B+bkN77fbjov3bVe5pDF5bJZPHM0q05CvFtzw61QVCqrZNm
	oPKrCnlsis9TQlqHLROKwDErA7zqaOFwd69FEFSlY9DGfW0nQqWa1JO+Y8niwfhkKsQY29szYuR
	P4F9DedjJd60zVmkVFtE7PGBpBFbRCTI=
X-Gm-Gg: AYBFou3ff56hf//ZmYQ2xJdO2ZI3vYpOlo44emKo3Ivs47xfQ9pgAKHa3Kbui4z5+Fg
	PpO5gEnZZr8hjmxV5m4oU43NxIui8ydMqbz30wsNwdCa0vhnR/OG+fWEE/nU+flome1jWsbNtTE
	87jeIobR4DfHOGpWu1PKz3bPdUP7ipfJKRFES9UzvOpfpuZedIv8Tw+UGkiRvnB7pjHYK4ZG61e
	/Kd/2qfoLWxw2gZCqPy3ZhYjajj4a6/AU7czLsTQ1FZfOACh2BLcuh6f+trcaSETJ21A+uEVSCx
	Xr90BpY+5gLKmsZra+jUUx0B/ojCx2RZb/0YAEjWxNHdyuY/MkYNWj/9UQ==
X-Received: by 2002:ac5:c802:0:b0:5c9:937a:4670 with SMTP id
 71dfb90a1353d-5c9b89cddc0mr4130358e0c.1.1790003712920; Mon, 21 Sep 2026
 08:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804181951.5206-1-saileshnandanavanam@gmail.com>
In-Reply-To: <20260804181951.5206-1-saileshnandanavanam@gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Mon, 21 Sep 2026 20:45:01 +0530
X-Gm-Features: AcwNN1UK3NxgU8L7a7p0OqKo7KlHJ1rZX_wdea6dW2DleRXUVx778GaLAT1KLDM
Message-ID: <CAF+TLO1woWAd2WFKBV5T67OsmnV-7JbzAPyotRUz8azyn4+8Rg@mail.gmail.com>
Subject: Re: [PATCH v4] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle
 and leak
To: andersson@kernel.org, mathieu.poirier@linaro.org, 
	mukesh.ojha@oss.qualcomm.com
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mukesh, Bjorn, Mathieu,

Gentle ping on this v4. It moves the DTB firmware request/release
into qcom_pas_start() as Mukesh suggested on v1, so the reference is
released on every failure path after the request, including a failure
in qcom_q6v5_prepare(), and on the success path.

It still applies cleanly on next-20260918 and builds for arm64.
Mukesh, could you take another look and let me know if this now
matches what you had in mind?

Thanks,
Sailesh


On Tue, Aug 4, 2026 at 11:50=E2=80=AFPM Sailesh Nandanavanam
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
> v4:
> - Rebase onto linux-next
> - Remove unused int ret from qcom_pas_load()
>
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
>  drivers/remoteproc/qcom_q6v5_pas.c | 47 +++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index ca8e61254c44..864446a484f1 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -231,7 +231,6 @@ static int qcom_pas_unprepare(struct rproc *rproc)
>  static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  {
>         struct qcom_pas *pas =3D rproc->priv;
> -       int ret;
>
>         /* Store firmware handle to be used in qcom_pas_start() */
>         pas->firmware =3D fw;
> @@ -241,23 +240,6 @@ static int qcom_pas_load(struct rproc *rproc, const =
struct firmware *fw)
>         if (pas->lite_dtb_pas_id)
>                 qcom_pas_shutdown(pas->lite_dtb_pas_id);
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
> -                                       pas->dtb_firmware_name, &pas->dtb=
_mem_reloc);
> -               if (ret) {
> -                       qcom_pas_metadata_release(pas->dtb_pas_ctx);
> -                       release_firmware(pas->dtb_firmware);
> -                       return ret;
> -               }
> -       }
> -
>         return 0;
>  }
>
> @@ -282,9 +264,23 @@ static int qcom_pas_start(struct rproc *rproc)
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
> +                               pas->dtb_firmware_name, &pas->dtb_mem_rel=
oc);
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
> @@ -352,6 +348,11 @@ static int qcom_pas_start(struct rproc *rproc)
>         if (pas->dtb_pas_id)
>                 qcom_pas_metadata_release(pas->dtb_pas_ctx);
>
> +       if (pas->dtb_pas_id) {
> +               release_firmware(pas->dtb_firmware);
> +               pas->dtb_firmware =3D NULL;
> +       }
> +
>         /* firmware is used to pass reference from qcom_pas_start(), drop=
 it now */
>         pas->firmware =3D NULL;
>
> @@ -361,8 +362,6 @@ static int qcom_pas_start(struct rproc *rproc)
>         qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  release_pas_metadata:
>         qcom_pas_metadata_release(pas->pas_ctx);
> -       if (pas->dtb_pas_id)
> -               qcom_pas_metadata_release(pas->dtb_pas_ctx);
>
>  unmap_dtb_carveout:
>         if (pas->dtb_pas_id)
> @@ -381,6 +380,12 @@ static int qcom_pas_start(struct rproc *rproc)
>         qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
>  disable_irqs:
>         qcom_q6v5_unprepare(&pas->q6v5);
> +release_dtb_metadata:
> +       if (pas->dtb_pas_id) {
> +               qcom_pas_metadata_release(pas->dtb_pas_ctx);
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
