Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED5B442B2F
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786990149; cv=pass; b=Q41iHI4PTWqhnJTXZo+JHICeuPAxejL5I5OYBHMlhf+di+Ua92pt7ptLpmZV00mN1OBrayfqhvGjNI7geUyJDeNxehZhtJ/0BetUFkE1p5q4qnTSX+8wQD0h+o4fE9ueg6cHloBoD8ItBlgSisaPpWLb5Eefy3uj3gwHXobNRLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786990149; c=relaxed/simple;
	bh=OoxGGKWqVKwMyVLWNyVOT02KEsiBJa3E+ig4rvuyXz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWjy9G2l9q/+hJ0NNqFkeEcsiSVAe+3mBc+YkSfmHk9Spm72JKTbqZkT3+tG0Kkh1krdWUevMjw6ZSBZzxTRIJfj5kakhn6ZTe6+v2qMNR08W7puBz0WljFKRbJJeooXhu9eOkp46qIcO7wcdR8VY284XnPXamVOONhtj2KpbyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/U+CRsd; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/U+CRsd"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-73d809c9b63so109026137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786990144; cv=none;
        d=google.com; s=arc-20260327;
        b=nsWXc9atoHgMoEx1MrUJRtioy3jLtCdQ/JHrwh6aNtxR4lMvyrXKExlSOLC1Wv7iXK
         GRrpI1x/R8f0vGl5/7xXapIupCYk7tVDwBt1FbO+iKz9dSbryGgtzVScPwPktsDQ0uxI
         NM+L7DXwAMoR19nFIYO4mvRNE1tCmhFeiDc1Va4Ki/W+3ybhuym0Iyae07iwBzX83xoK
         S9dym8VM70xpl/xEg5KjTbEp/6of5PvPaf47a4fgCCGQ5g/Qjiy2gTyhn7PznZpqPfVv
         BHh+AKYoNNOqCVtpPWKVzniprlYrqagbFaO5XdEJ9nTpv63WRFOvAnk3xtS4GbUChCDL
         8KmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aSWa13qAlD+BED8moN3yCmJA8L7FYp5BdbJvnP0zUko=;
        fh=5aJDk/Cvp1GfVnhIYdo1kMvNunNyIKwUPGjTNkOrY5g=;
        b=dkvDiMs7Sy7qZnQs2csvlyllo6Uhpc+/c5eIig0el0o5LZwVzvX3e4CMLIAHikNh2R
         ZBtdkp5Seu64/aAYWA7dtSizwZJl9QJeGVkhf4DC3Utl7CbE3Z/uvN57eccjm5/Bp93R
         B68jaUkeDxCyUJ7GLJBHkwLDdfP0puPWqhVzKtX8LAsv1Rkz56+Hg30twyOZI8m4boOQ
         8+OsjNO0jt24aPuKOec+8CtyXJLPb+yeB2YL+AZkIa5CRSmiLYolG2F4drej7nhlDMdI
         yM1T1SmlC2+AZ51+KZ4HTlEmxHVFSlPEpckNiKpncqKwPSCd9hXs5/L13+E41ur/NUPh
         izGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786990144; x=1787594944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSWa13qAlD+BED8moN3yCmJA8L7FYp5BdbJvnP0zUko=;
        b=A/U+CRsdD/lssURyzYGm8byb0Ijmb34tdY2gxIasNRXZM3Xntl5KqxzrQSCNjwcoOO
         LPa7QWc51SaMD7H4baEAsTzkfBktHJuSBECv+Z7kKdHYZX/02xXqQDdD+dbT0CtRoxuz
         8WGRDXplH6V34XRfb0v9Rued1qZDPk9Ub7vaQ0c048/WXOsyNu/IiN0zRIOihbpyK23Q
         REyTlKDNJN361+JeVu5+fkPwgNDNALBwc8yVv3u9FtzUs/XR7njalcx6SV6mdxI6bgYd
         TnXbEBWgj0RTrMtIwWv8DiEJIUQ07EisgsrHH8unvxJwSJ/s4aWNoa0VL+Vh9NsJqUsX
         LedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786990144; x=1787594944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSWa13qAlD+BED8moN3yCmJA8L7FYp5BdbJvnP0zUko=;
        b=X+55cRWxhIkZfzFFhDns2Wb+gIvtHGPkYb/S9S0oaIIY/IyfzvrMjgglkwi2HUIRax
         hOfAq0YkIhfUGwLcY0925FieOUSfIsFf4p4jw/59LeViepxkBYOAmvXJsRwzgRdjSXIE
         jpCP5G6liy6RksrSFMBf0RAoLMnzed0s+MuBxnQGEel9wV5zntj6ckfa250dzhDkkr+C
         5IQOqhnW9FC8bA97Fg2K2aAT33CZhBZAB6tn8hCqnbKLhA4TCNJrm7vp4Um4Lmp63A03
         rQK4tzszsBjSwrKcSFEGE2Dkkp14m+eDK4UlAMNPrDKFx5vixDFOsc5Q1JYCvuXUReJu
         S6SQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7s1jA7Cn9q7OO8ZBKbNHvhgwmBfEitzimNIIltTQ9qcEInBiPK5K2IJUdM1rGLtDX94nsCAxTCQnCmNHl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2TvIkx9CcYaydCfv/COx0mlPdr0jUWw+0UZ9Gl+/nqR8gGX4H
	zu/G3eN5CUKLy3iMDuOTVLO7sZJlA/R7h5GZWOobazpohekrRFi2uQLlKYwEAzbesG008HJSheu
	p5KHgLh/V8Ldn7niMnBLF1h8WP2PnsMc=
X-Gm-Gg: AR+sD11za9isabd63vu34DZYLMBGFaX4SaMG2dXGFaYaLXS5vy8J6kG+AGn/9U+daH6
	09WXa0jfieVPtz2+Cl3pcrSAoTBkzaNJiGJP4YE8VaD/z91g2915jh3Lq/+ZJoJC7jB+ZzB6Smk
	uigrtRzrTnNBvafGvFv4ZHN5hnj6zp2qBKkVq1bWxnC54SpeYabD7A4QMLEaSt7Fq8viP4/WXT3
	VgSup4w41VRcSEW6+M56S/Y++WhgwIEgUppZXclP/s4Q+H6KpNkqfUauk7S1B5SwTvDdsjzVFJV
	9fN8rfIBUatQS5vFU81H4bn8X6PW82p2lal5By0PPYzFFf4b
X-Received: by 2002:a05:6102:801c:b0:738:9abd:9ebc with SMTP id
 ada2fe7eead31-76f27676d21mr1966293137.0.1786990144108; Mon, 17 Aug 2026
 11:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804181951.5206-1-saileshnandanavanam@gmail.com>
In-Reply-To: <20260804181951.5206-1-saileshnandanavanam@gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Mon, 17 Aug 2026 23:39:17 +0530
X-Gm-Features: AcwNN1Xuez8j88A_FkIAJ-RTnZf2B-FaWlH3ls5sA71QZmUEuo1Ih50qYxcSGPU
Message-ID: <CAF+TLO0Sw4P10JEy4ibQBMuxx+ghw7JfMLXucFPZNAXSnPnkOA@mail.gmail.com>
Subject: Re: [PATCH v4] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle
 and leak
To: andersson@kernel.org, mathieu.poirier@linaro.org
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping on this, it's been about two weeks since v4. Let me know
if any further changes are needed, or if there's anything I can
clarify.

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
