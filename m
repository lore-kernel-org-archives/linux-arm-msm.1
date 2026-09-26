Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C55023ED60
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437668; cv=pass; b=Tl9umm1kTcox75CdA87Fnun+EMQGPnXd10Fg0cDuALFEGco3Dx5Mb2khcV1XaSESfIU5UoIsz7DHjanHiakqzC8uIfu9Zb4rk6Z2QQqIRvzL70jvSuiDVtSeRo9UG8y5eLPYN+/0I0AgeS4tPkQCIUnfcXuc7TBPmm4tDll45Uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437668; c=relaxed/simple;
	bh=bja5dQBpSKcVggNbbhhqokEufX0ymW31CX2DChhuvR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ks0h1axSRY8CwZ4aqEzTJ9TEhSFi7ZEpRW2ZU6NR8YiYfS+lr7J7dh4RPwLHQDcQF+sQdUUTJvjzw0n5Inul5Dd4sEIEffktWOsRm7J/ELhnngwd8rO6C+HE+5XaU3Ek2c7CgbKAVNcxx9YvBIzOzsxbvFdbj70qd8tgC3Bpnfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fO7jfr7l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4HRGNq+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fO7jfr7l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4HRGNq+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QDeARD4059888
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 15:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=JMZ+iTCkhXTeqoblAjLsoVh6+/LG9XNCLdnREQCp/DI=; b=fO
	7jfr7lwRzdlPAXZlW3o5LbBTZrJPA0ZNCtEMuY8mBLR7J/Uz27vkKnTD8FP+KFE8
	fJQ+ZoF4ph4GuByFffW8/zuGWUILSkvS3B2RNwb+h7b/H0P2RgbU0+1WsjCyifxQ
	WOmYAPpMQYlcfv9YuASU2K7EhId7nlUTaue6lj/fRjdTO9nAOQqVMr9LCzsDHelT
	6C1rZ3/Z80FzeuKOyT3L3kqxdCnNe8wpxmcWGYibLMflEErw3DLrLNbbpTx2wCdt
	W6jbFVeBJbFExt4YS32LMLGrpITr6PQ0KaHQxqZnI3ji4rjeTqPNc3YysoCozCWF
	lPa7oOvZoAPfs3iFEmUQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp1h0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 15:47:45 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e99ff505c2so3021195a34.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 08:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790437665; cv=none;
        d=google.com; s=arc-20260327;
        b=sVvTJkas43wo0lfPfLxpFtOsj4OEJ+iCCI64cO7/f1mqLd2wihGZVyxLWLJ1PWnxP7
         0jRLAYcDAlTpaEcjVYKHeumg+gZz7dIA34G65heXE4VOQwvEBh4mQEskH5RFdpcXQSnI
         jt76GDzyUKw5WJ3K1jg6uAxWD9GSh1FHpl1FXakK1YHajdvYtMy8zQ80g41pTnXtRboG
         Jy9BggEpk0pu0YvC2oodAN9FkiIxOq7kdY4eNmsHFBpEn+ipCegP80g3P95nWo+H6CCC
         dPDqKJ6SAlRayMR3/RsTn/J4Yi0x9s3ndnTHDIYL4e/SZ6nUCuem+/nqbQS8iq4mKcEt
         tl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=JMZ+iTCkhXTeqoblAjLsoVh6+/LG9XNCLdnREQCp/DI=;
        fh=yH37vTwjWOeSsyt1O/fBhxQ3ezWB/aibU8+o+CgXwqw=;
        b=KhLdfYBX+PkIaaGiuBCo3rbRiJ+jpM0uk1mFpUzxXxpz9CCfc+fyko7OG90B0WqjTW
         oX5tXj7LU+u4TwN40VeNdBnhLv/RnfieP71530uLa9MzMGHsWnJKpjjQWFihdGxaqP6U
         mGO5WEEvtE3J1YIfGCOnRzAPgmuXjzU8FkjNawoXlHquFYixQxxisUgGf1NJalZDJpyr
         u5CdH/QP4cYjhzYckUwlJ2KCkRZ/FyodL8/GxOs0KNWxnzbqLvVgLPgyorZwRwn9N9yP
         J+YkVTck7oWT8Pj7xRM6gRghk0kmIxffxfeLZNZ3PYMbEKdGx+sjspKWxeE0FvR7vkSQ
         exNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790437665; x=1791042465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JMZ+iTCkhXTeqoblAjLsoVh6+/LG9XNCLdnREQCp/DI=;
        b=W4HRGNq+k8ALdsU5ABPyqYm7N2V9nen6yaLrUesC3/0YV5JujYsveFYz/310W46QuH
         4RBPEGC8wSFIxFWo7Xcr2BGLntKJH3MSNuIqDVGieXCJ+Z5nMFQ0fELa2om7xeVuYbCZ
         aTGNhjlZsxT1lGHv31keZNpkItaH+qAJvbtuRsPjvNiO0jo0itygD2tr8xWqLYIayDEN
         xaEV34n99LTiSqCreGTH9xbbSfodz34dIXDNZQB6dzpAh96kpAV63gRhUYvc9E5SPcAk
         mgVR+bjL22XhDe8OCkp5MsSzSZfe5B5d93NvtPIaoEHShvkg3Dasn+qeambFfxTr325B
         zrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437665; x=1791042465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMZ+iTCkhXTeqoblAjLsoVh6+/LG9XNCLdnREQCp/DI=;
        b=h4qw1205i2yZTKtWTTnfrebmaR/yTJCCcZ1322NP0tm/E/Y2yS21LbpumCWKlAHHLe
         QeJQn9oQmiIZlkNi22G5QS3z8TtKuoqeWbXwLQls86K79dK5H4BpCL0r3noaD/FSGnwE
         ArnssJgB/hv0MDY2tfZbMfwP6CKXNTupZp2LX9/mfyoLe3jgQkusHBbr6tGhLqXL9xrf
         DCCzJLyr8vWSlli9n8DfOe0Loh9SxUddZa6KzwJ61iybipGbnWF0p0+kGSzGJ03b9j4D
         62QS71LRFC2RYAOJi5S1u5cMGvFkstsLueP/NvPn79lW+i2E4KxCMa73Dtjt8X3F5m3A
         M4gQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp53XlAaOukIsixIeHhhyStu0yjvNyYxJHZukzBv65KOwSkMre0ZrWX7MxY88ka2Y04lx6NISYW+8rFM/f@vger.kernel.org
X-Gm-Message-State: AFq9FYKJieBc/kKoW2SXWxCNS2yOONZleBF3qGy9Fkf4Z9400Sk1E7U/
	6k2MQebBZ+ZblYHxGtW7wB1xJXMh4SmhVlaZLPilCl8fsM7KTZj7s6isouL107DOmZzjyKFWS2O
	rfbnRgkaOevO8NQNzRNBjDa7dbvfzp6epBZiUv3lgPeG2jrFE7sCqEHq/SnDktWcJr8uFytU4hD
	lXpiFtK64mM+TMP3jC2PoYyVjaQL2dJI1sMihbndnzSus=
X-Gm-Gg: AYBFou0dpOLwM5hK1iKdpmPQ2g1NUpBvJwjaf4GNNnvvtDQcOfHM9DykN9jm42UoOfC
	I8uJBaFRmuMAGlwB1dMWJmFslU3SbnNCCMvs4SsoWGhBbz726A8SwjpD8Cizq6Ky3wbHMc+Y67/
	1odeh0fc5EXet/GuZbu379zzhOB3NNuMUDL8cIqD2Ugwh/SnpPbzL5lDbt
X-Received: by 2002:a05:6870:f613:b0:48f:e107:3189 with SMTP id 586e51a60fabf-491e6ce18e8mr8561339fac.41.1790437665197;
        Sat, 26 Sep 2026 08:47:45 -0700 (PDT)
X-Received: by 2002:a05:6870:f613:b0:48f:e107:3189 with SMTP id
 586e51a60fabf-491e6ce18e8mr8561187fac.41.1790437659970; Sat, 26 Sep 2026
 08:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com> <20260912-fd-kms-fix-smmu-v3-1-a7ddc6fe2032@oss.qualcomm.com>
In-Reply-To: <20260912-fd-kms-fix-smmu-v3-1-a7ddc6fe2032@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 08:47:28 -0700
X-Gm-Features: AclHuK9cxghme6lV-xoFMmZbZ0mWJR0qaLuDqqfDUs6jVDEGvSERVCEWpuW5hG0
Message-ID: <CACSVV00XJ4Ad8AMr9C8hv7LjnjVXmG2JrDtJxsyqx=Gz+rZ2XA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] drm/msm: serialise framebuffer pin state
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA2MiBTYWx0ZWRfX0k3/PXPErRRf
 vX899DkpF/pDXImFp9nFt3RsM0JBLKKks2g8rsGnxj7hxSB9LbI2f1pLdnJ2xL7XzZZtgNPTW27
 /kUCywwNcJIDpmxXSxXDHzzIxcfdnusqCpIDIaC//lG4TNfYu6ZOcdhaM2p/fd4puTk328BrlmL
 TA27Ja9CJqDNehYrTj64gl0egwmP4B3dyXqbMgj0h2GgdM1oHrCI+oVd36AAmbXPcpGvcBzMQ5C
 ElLQ3qZ5tUwCUkn49S/Q+HDcygp5b3HCSnT32ocMKfMdh9l+cNI4vy9SQWrQB5XONYgBaxyY2LV
 a4gJRwswKKeQwaIxWBTNggLaxi1G1CQoY/R+bHkLMmXpC+kAVlYDuNx2zaf8QwaTAglo0axJTPY
 +1mRX4EuUOcaF0Eo9Z0LMNa1dQvKQl0p6Df+ID7rjmgG4RZsHgNsO0UpLLbLlOTx5xfQ6XS77OR
 exh3ledIhAVmvhxbMVA==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab7e921 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=LMo7-oU2RdcLhoRdf2wA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: h22vfUMQdnGRzUxBMSEsCuNkCgcsV_8j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA2MiBTYWx0ZWRfX2RNj1a1l5SNh
 HT8KuXvViB3VPqFTXea46bBJ5bczxU26DUiFe00PGoOGmy7+sCqI8Bh9zdT62W2FryZLvB/oLEx
 IUeP2yox+4iFFr3A2Kd8ct4BrBwoR2w=
X-Proofpoint-ORIG-GUID: h22vfUMQdnGRzUxBMSEsCuNkCgcsV_8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260062

On Sat, Sep 12, 2026 at 5:48=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> prepare_count, iova[] and the pins they describe are updated locklessly,
> but drm_atomic_helper_commit() prepares a new state in parallel with the
> completion of the previous one -- stall_checks() only stalls on the secon=
d
> previous commit.  Commit N+1's ->prepare_fb() thus runs while commit N is
> in ->cleanup_fb(), and for a double-buffered flip that is the same
> framebuffer:
>
>   cleanup: prepare_count 1 -> 0
>   prepare: prepare_count 0 -> 1, pins, stores iova[]
>   cleanup: memset(iova, 0)
>
> leaving the plane programmed with a NULL base address:
>
>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0x402,
>       iova=3D0x00000100, fsynr=3D0x3e0023, cbfrsynra=3D0x1c00, cb=3D11
>
> The opposite order is broken too since commit 8ac37c88f991 ("drm/msm:
> Refcount framebuffer pins"): a prepare which finds the count non-zero
> returns at once, assuming iova[] is populated.
>
> Both callbacks may sleep, so a mutex will do.  drm_framebuffer_init()
> adds the framebuffer to the object idr, from where userspace can reach it
> before msm_framebuffer_init() returns, so take the private state out of
> its way and initialise it first.
>
> Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_fb.c | 44 +++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 60c108d35d2a..77415302e6d8 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -22,9 +22,12 @@ struct msm_framebuffer {
>         /* Count of # of attached planes which need dirtyfb: */
>         refcount_t dirtyfb;
>
> +       /* Protects the pin state below: */
> +       struct mutex lock;
> +
>         /* Framebuffer per-plane address, if pinned, else zero: */
>         uint64_t iova[DRM_FORMAT_MAX_PLANES];
> -       atomic_t prepare_count;
> +       unsigned int prepare_count;
>  };
>  #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, ba=
se)
>
> @@ -45,9 +48,17 @@ static int msm_framebuffer_dirtyfb(struct drm_framebuf=
fer *fb,
>                                          clips, num_clips);
>  }
>
> +static void msm_framebuffer_destroy(struct drm_framebuffer *fb)
> +{
> +       struct msm_framebuffer *msm_fb =3D to_msm_framebuffer(fb);
> +
> +       mutex_destroy(&msm_fb->lock);
> +       drm_gem_fb_destroy(fb);
> +}
> +
>  static const struct drm_framebuffer_funcs msm_framebuffer_funcs =3D {
>         .create_handle =3D drm_gem_fb_create_handle,
> -       .destroy =3D drm_gem_fb_destroy,
> +       .destroy =3D msm_framebuffer_destroy,
>         .dirty =3D msm_framebuffer_dirtyfb,
>  };
>
> @@ -76,13 +87,15 @@ int msm_framebuffer_prepare(struct drm_framebuffer *f=
b, bool needs_dirtyfb)
>         struct msm_drm_private *priv =3D fb->dev->dev_private;
>         struct drm_gpuvm *vm =3D priv->kms->vm;
>         struct msm_framebuffer *msm_fb =3D to_msm_framebuffer(fb);
> -       int ret, i, n =3D fb->format->num_planes;
> +       int ret =3D 0, i, n =3D fb->format->num_planes;
>
>         if (needs_dirtyfb)
>                 refcount_inc(&msm_fb->dirtyfb);
>
> -       if (atomic_inc_return(&msm_fb->prepare_count) > 1)
> -               return 0;
> +       mutex_lock(&msm_fb->lock);

guard(mutex)(&msm_fb->lock) ??

here and below that would simplify the error path

BR,
-R

> +
> +       if (msm_fb->prepare_count++)
> +               goto out;
>
>         for (i =3D 0; i < n; i++) {
>                 msm_gem_vma_get(fb->obj[i]);
> @@ -90,10 +103,13 @@ int msm_framebuffer_prepare(struct drm_framebuffer *=
fb, bool needs_dirtyfb)
>                 drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
>                               fb->base.id, i, msm_fb->iova[i], ret);
>                 if (ret)
> -                       return ret;
> +                       break;
>         }
>
> -       return 0;
> +out:
> +       mutex_unlock(&msm_fb->lock);
> +
> +       return ret;
>  }
>
>  void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dir=
tyfb)
> @@ -106,8 +122,10 @@ void msm_framebuffer_cleanup(struct drm_framebuffer =
*fb, bool needed_dirtyfb)
>         if (needed_dirtyfb)
>                 refcount_dec(&msm_fb->dirtyfb);
>
> -       if (atomic_dec_return(&msm_fb->prepare_count))
> -               return;
> +       mutex_lock(&msm_fb->lock);
> +
> +       if (--msm_fb->prepare_count)
> +               goto out;
>
>         memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
>
> @@ -115,6 +133,9 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *=
fb, bool needed_dirtyfb)
>                 msm_gem_unpin_iova(fb->obj[i], vm);
>                 msm_gem_vma_put(fb->obj[i]);
>         }
> +
> +out:
> +       mutex_unlock(&msm_fb->lock);
>  }
>
>  uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
> @@ -199,14 +220,15 @@ msm_framebuffer_init(struct drm_device *dev, const =
struct drm_format_info *info,
>
>         drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
>
> +       refcount_set(&msm_fb->dirtyfb, 1);
> +       mutex_init(&msm_fb->lock);
> +
>         ret =3D drm_framebuffer_init(dev, fb, &msm_framebuffer_funcs);
>         if (ret) {
>                 DRM_DEV_ERROR(dev->dev, "framebuffer init failed: %d\n", =
ret);
>                 goto fail;
>         }
>
> -       refcount_set(&msm_fb->dirtyfb, 1);
> -
>         drm_dbg_state(dev, "create: FB ID: %d (%p)\n", fb->base.id, fb);
>
>         return fb;
>
> --
> 2.47.3
>
