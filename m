Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126553DB626
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 02:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093356; cv=pass; b=BIn8zkopEh5ao+72b4C9K7DMVk3CLiGk8BKZ6TrsWOi+yVASCgX3YiDUDfk2MfwEAXopC/XP3JFthY0H/1Cp3bfHPuZCL/46euL6kDWEsyB2sQx/AJWlOEfIqN8hbKQY+19/GrNC+1Pm1SDbv3Ut3kxFK//iVhL2IsUrBIb81+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093356; c=relaxed/simple;
	bh=Bz0sCgcCcFvltEMwQaua+/B5cZV1CmGcPPxBoEWouf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKGm0vyi2V7hwFZNuHfG2529xe1ug3Vra+6o6YCJrHHeIvQ+nU6bG981UQf7CamNFWmBXWKFFo8G8j1yK3ieNHsCpVG9zOTVhbhKkst/QsIN7q7U51wFRV4I4/Ypv0B6Ll6zUHUNbDWe8o+wM4tRGim95ioAw2g3Z2YgmGudeww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cptcqt6S; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cptcqt6S"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a7ea0046deso645850a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 19:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789093353; cv=none;
        d=google.com; s=arc-20260327;
        b=sLjk0duTDjLyEOD/M3b2UlsQzZnSBGqFfZO688U3y1n87KZMW4El2yQ0U4k0cXt+a0
         JYdGSj178YO72Q1tBp4g1nr09PYxiROpvM0NqCJPMa97HsZwqlTA4T0b1sb7SWfutwV2
         wJls6tJ00/QAh0rCj+gtQONRrQC7wZo8Yt1dA6a/59evn4j4aDjEUTVHrjHrn26d4Ep8
         mrk2jHjt8r0sD5XkDAUo0f/clODRTgBiiD/u3E0/AtZWV/V9JjFZr07xbwM2LLXEDZXW
         qG+eWEs6clmd+J5grFR9JEDHsq8mwBc11xJcMRtZ4Ee6RI1OooVB9g9v2X/0x/HH0kS9
         nczw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zzI+H0AYETX+xpgB1CN8oegHDhglD5FDUHZp3f5RBM0=;
        fh=4/TcfA9bU0hyx2+xEFog13UxvesGagmonAtNzsBlWK8=;
        b=hXfy19QE5NkXz2QTmnJIW1In816IjFpWj/J8cInIZ9pZ2IwjSMgAORocQy+J9KjHjT
         XAV2rqyIkhWHUW3iIPuv9aBTllIaA6hTMAU553/sl1F7oPbOrLPupXT1vhYsukwuji0g
         pHUxkrsX1q/eKPxFOAUrjZYiCQhSRiMfpK9+4+VeIYoeQ6T+hMenns9lye8c7yDUnZyJ
         oBwB643vEH0ysv5ThBberj/+k4knfhhgVtx324DBVbjumOMnEt274MNrqpQxTGi+BPgi
         MVEiE6vssKcDxECbfX/d8MB3YjBVJuL9iXfuJfUVajlpPMnwMSFczjOV2T2tBcvz3ctg
         Ij3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789093353; x=1789698153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zzI+H0AYETX+xpgB1CN8oegHDhglD5FDUHZp3f5RBM0=;
        b=Cptcqt6ScpqGb+URyJ3Ec2fUg3HynYHi4aLZF1yLhpqbeEivPxohoEdtZnwEyJ54Fl
         q6G/qi/2/EsF9tqb79rSNz2BJpx1v8bTzA/WOrvhLJRM8cceKP9QtHqPuOoxZrTxpJVQ
         LwhjR7xA2BK1RNTgt2H3Fq1+Nxf4ru7VM+XP3iZA6/j9C007tx/Uq1kw4b9c1YYgHo+z
         wSNRd+/hP/BDO7+WPuOL0sMBbyV4aUZSjLNKdLQcVqMbiHPJu9CsRvidsZX5vIUJ7Bea
         I9y4x4hLVPaJuTbAKONX0kDQ03FFjybMpQK8zrIQzHUAcuU9W98pO7OFrERVn4VMvc35
         5V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789093353; x=1789698153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zzI+H0AYETX+xpgB1CN8oegHDhglD5FDUHZp3f5RBM0=;
        b=U4NZom2qHA0q4OEMoa8zNMMAcqi9USRsEkyGX8JkpY25mSUjESh2CVGiL40oQFLBek
         278xsG+rDfteFW1LqgvU+tx7g/6g41wXy1ZtP5GQPSbSBu3H2dvmwbnR0Z59zbnnt4wI
         wFPaJ8DUFBbY06EXPrzINHZS4pq9on2fl/ylvSVwLh9VRi/+r9Q0/+mYjk88XyCQI46R
         jp2fMJT/SccaNeO0g5Ox6wjQS8R64Wc+UnxRfD2SCoHA2Z/4p4fHMG0kRHSU1a2vjlRg
         ywfyyATMSsgnGRVQDAmnOrONLExlR3x3vKko45xQ2IWWhaUputbDS+/zaq3qGX7Rj3c/
         2SyA==
X-Forwarded-Encrypted: i=1; AKwUvBytF6SxZhoZorXodG5Lg54UnQBLoOEpK2xd73fXtjR/lVbekMDtGMsUcDcMJy/QS5ATzWk2TMqAc44c2xX5@vger.kernel.org
X-Gm-Message-State: AFuF++nLbXYVQ6fOOhLoT3XQ2t5EdaOmWcukGZbonCe1OgjDjQ7cxgIM
	Pq6NP02jdiBk4GebqHsvPskj4ek8pr57PEVl92sTxdTsiNDh1VjAF3LahZS+8PGnOoIP3bZFRUH
	VYGPwDl73x79MPND92RZBjIOLBg3dyZM=
X-Gm-Gg: AYBFou1aDBget5klv3RB8ZPA+PKuNr45CGrTMhSnORTmzdJaSqNm8B7c1OodRkEIbJq
	fP70PA68Aimdcu52IUN8GpXCVyiLUyn/ayz1lkI84YCfw//2fIlqJrxhdpg8eN6CTOa3F3aO5sL
	YRV3U2u10IQ0tpv8vatXVlP3hrLYYYAgOGgxYNofo1sWQ+Nasu1QnWGZ7bt9cjodEOpDD8t83UU
	WEL8/7mMc/WMQPjCibiUS2S3QD4OzLhP2wYKaFjPpEpo8AuBk2FbA1UgekPHIvRHrr1jvALIC4x
	iGtOLlTY0Ca2WjjPdA+Yzf32uORXjC33dYweWjUTAJaggP6RdDNpVqg9/NO3sFg/8KD4HVCHLAn
	RRJRNH03UaoY=
X-Received: by 2002:a05:6402:50cd:b0:6a8:d72a:3b23 with SMTP id
 4fb4d7f45d1cf-6a9b56f9fccmr842660a12.43.1789093353125; Thu, 10 Sep 2026
 19:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com>
In-Reply-To: <20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com>
From: Jason Wang <jasowangio@gmail.com>
Date: Fri, 11 Sep 2026 10:22:21 +0800
X-Gm-Features: AcwNN1Uzpxn8BhhthHEzwNinazI3iL-_kocBQlmIkQ9u52465cUbeWR1Pr_TyGY
Message-ID: <CAAf7B_Oi_z7M_A_LwoAs_CAvhuk1NGxvADQssE65_OcTroncXw@mail.gmail.com>
Subject: Re: [PATCH] virtio_blk: use synchronous quiesce in virtblk_freeze_priv()
To: Cong Zhang <cong.zhang@oss.qualcomm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>, 
	linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 12:31=E2=80=AFAM Cong Zhang <cong.zhang@oss.qualcom=
m.com> wrote:
>
> Replace blk_mq_quiesce_queue_nowait() with blk_mq_quiesce_queue() in
> virtblk_freeze_priv().
>
> Keep the existing freeze and unfreeze order. The synchronous call waits
> for dispatch code that was already running. The queue remains quiesced
> until virtblk_restore_priv() calls blk_mq_unquiesce_queue().
>
> Fixes: 7678abee0867 ("virtio-blk: don't keep queue frozen during system s=
uspend")
>

Do we need this for -stable?

> Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
> ---
> blk_mq_run_work_fn() can call blk_mq_sched_dispatch_requests() through
> blk_mq_run_dispatch_ops(). The dispatcher checks QUEUE_FLAG_QUIESCED
> while the flag is clear. It can then be preempted before it gets a
> request. At that time, it has no queue usage reference, so
> blk_mq_freeze_queue() does not wait for it.
>
> virtblk_freeze_priv() then calls blk_mq_quiesce_queue_nowait() and
> blk_mq_unfreeze_queue(). A new request can enter the queue. The old
> dispatcher can run again, use its old flag check, get the new request,
> and call virtio_queue_rq(). At the same time, virtblk_freeze_priv() can
> reset the device, delete the virtqueues, and free vblk->vqs. The old
> dispatcher can then use a deleted virtqueue or a NULL vblk->vqs, and the
> kernel can crash.
> ---
>  drivers/block/virtio_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 32bf3ba07a9d..7a570591e040 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -1595,7 +1595,7 @@ static int virtblk_freeze_priv(struct virtio_device=
 *vdev)
>
>         /* Ensure no requests in virtqueues before deleting vqs. */
>         memflags =3D blk_mq_freeze_queue(q);
> -       blk_mq_quiesce_queue_nowait(q);
> +       blk_mq_quiesce_queue(q);
>         blk_mq_unfreeze_queue(q, memflags);
>
>         /* Ensure we don't receive any more interrupts */
>
> ---
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> change-id: 20260910-virtblk_sync_quiesce-9b2c88d45416
>
> Best regards,
> --
> Cong Zhang <cong.zhang@oss.qualcomm.com>
>

Other than this,

Acked-by: Jason Wang <jasowangio@gmail.com>

Thanks
