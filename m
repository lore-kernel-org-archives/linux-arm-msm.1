Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792809241;
	b=exR+/60rMgBhvD6gK/wZedmZw4TuVR4mHQksqaLp9JXeMJGCZmPeaKMriBNheWrMprNh
	 yEC7ub9bjbDol80esz1judaCNW093ALxu0iIFqnEdaOVBl0au660FDcBWi9m6oAB7Ikl7
	 1RJloOZcM520YHxh/P1BmzMKKvogyET8NC37ZKPEboXKYIS5kyZKN91U9R8FW0GbVtxmA
	 InWbjF2+Si1FrJqPg5/gB9C+ox0bl7g/4z63wvcGIoXPONTsH6SjM5xI4g9fksHxWBMoY
	 ypr9jSFLvhzK8MV1ND5WdM3lFW/Tsbb8BrGBN1gpo7N1FGm4lQkOHd20c/xYDHeAK6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YOvydlCVwM5PXFqKpBEvvD6ro2jGwhMV+E2WExIceR0=;
	b=stX4KiVFqhLJZTuR+P/eAbO+aN2OgN+YUqy+pflZI6VZrcooFnklqUfautfRqcT0gPx7
	 m/7lHt/w5cagXj9TImjgCE7prSF6MiVjfz+zDVvQpTadSMbEBkuDZpQl8oCQaer0oFpxE
	 6I042Q4DUEioboUxnSXLZxSOIVFHWDFn2O59/zFjpmy+B545hQwWWlg/YyZBmOQYcJAFz
	 rTNfmht5mxxohQfwBz2PXeu5228Hjf2GN9JJOoWb+Z0fGMkTtqwmIAG54AvQsXD5c6tXV
	 ZQsN8hH7u9rr41cGiGSnjdvrSZ6ByxMCFhJrV+40Xoc7HCtR3sqAqrC5GTqaBVaFyJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZNWvplRj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E3606A31E
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 02:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F0E3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZNWvplRj
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so2395718a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 19:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792809240; cv=none;
        d=google.com; s=arc-20260327;
        b=bRWwFgFIR8FJ7xxviM74cgGcM3gZfjkJ84XmDhoFcL70rdYDGHllzhtKnvpnDMsREI
         I6fjkmyWNo9Zw2hnzRudnq2/bXU0rJf8myLfmIqH7vIxc455W35pmpcHlWYn77mLRU/B
         XszxSd8ISkeDR1dIXItaZN0BX5UQIHa+/WUJNHyXZ1I9Ru6CoQnTSXGC5/JHagXK0bSv
         lQD8oAThGGHl/m9z2jx5qS+0ycWxAtp/g9L5cVFnOU+tDtc3LEdhAoe5PeXgR9DKGd8n
         +pQzCVgKJqQr6GS3yGs7EEk9wanor8yZInLP866yKDukpsSPVO7bzMRB0Psnitt4e9Oc
         3+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOvydlCVwM5PXFqKpBEvvD6ro2jGwhMV+E2WExIceR0=;
        fh=GoRApSNUDdSA3uHraC+VRKiktu0AJIVOkOeUlGfQYiw=;
        b=Vd4wgszLkaT2wOZs4rQi1ylhhfa/OmOL37e+BVTXMXtCvONld8tGc9aG3gnLSwQ1P0
         BQKq94oYmmzUbD0JLbHZP4bUmANupooePPZcHmpReJVzeazMtZ0LzSSrOQuJG+Qj25Fa
         6gGrG1erB+86FjtwvPDJzgVv11W/R11ETtzpYVX4vVertglLHSqH1LI1+yQCd4Dm5pJS
         UYo2WdbPHZ19Gu3W4aHM8Mf/gNsg23R8D5VPKd8AhocTDN/+9ImDo6431a8135Yor0pI
         jbqzc9CGztfk4OU21Ure1+uaBO5VLDm6V+Gy5ib5+E/XkVjap/p2UkdgREqgqEacFMZf
         06rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809240; x=1793414040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOvydlCVwM5PXFqKpBEvvD6ro2jGwhMV+E2WExIceR0=;
        b=ZNWvplRjO+I1horpBlo8J9/L7pCEpW8hMtQMPU2a+8lZ7X5bNp9yChxqm96Bshw9Dg
         dkhaYKv3i9l7YjPCad/Jw6ERfjTUYxjj2YQqO9wxme4wu6YIRvXoZpdJQwdRuBuXDPp0
         9uEwpFDlzZvSs9XluYQZYAQz4+t+F8VROOpmmmPmYDe5ujIlriUsiCyQ2ihN1yaKKR32
         0knsUYy+dDxJdbiRNHxVg0IC1VCtOKkJWC1YulNBpanU4lgoESJHLOra/rAyZnDzQMJz
         YmCYdyLj6MIIGINi6YYvfiwtqm41sJjRz2BxfiIIsv1hVGFod6tJf6QmppsY8DZpm2C2
         jWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809240; x=1793414040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOvydlCVwM5PXFqKpBEvvD6ro2jGwhMV+E2WExIceR0=;
        b=G6DV281nSA2bflnCZDKbpyFyKdK2XEAGXI6LTXvC0OLwosuUekAqeLucloHMCnWWIF
         YQBgroBYvfF3aYhKoh7Az9yILGl6syppNV6a/D0eSsk5eCmeVYJ/rz92AOXt7sr7/uHB
         JtVx3QmkKMP0YeWu8J2O6mXRdW8ZPWGD8JvH0CxL7lY68Z73lcNwT7evlL/msJbjx0dQ
         +H6sO5mwusU+ImyLi9JyNf6DFS/MWR1Bg5qpmo2/jPxUH3JIOOF1Zw180H7rr0wJTlj+
         KJhF6yiO52mA9nkcWWwyeSjskO3CPxn2hJTAU5q25TQZioxsnOnMLBVfGYEFr1sbvnIy
         3dGA==
X-Forwarded-Encrypted: i=1; AKwUvByPUhbMFhuYICvQ+wRz2BlAgMQ3Uwk+ttebRD63g4rxFybYTgn2dhs8y3k6ts+KIli6JbyZKH3gqoSWB0hs@vger.kernel.org
X-Gm-Message-State: AFq9FYLb1QPsfE5/H8Yn/uURWJDUIXXBFCigfhHgfofyqvusk6ueVU3s
	YoVIMJ/mCiMC0iZwcroxS8ZBAhtjSkqLY0lWmRYefe8L+6MHydx09RF7MqYYPn9Ukno6JYR7Np5
	E3k+OUFyJeTQo6vQjmPBCxqPYq92TKA==
X-Gm-Gg: AYBFou3zZlwJtFQbRBqbSbjUq+iVkZgn+W5Yu0uKb9K9X0h2s+qyQpv0n4NBi8SLYq/
	am4MefOQXpQkvsYMJEbgRGDdkU0OQpJqhMnMVRd42vq67Lrxp9UN1JtTnM/nfcnmt41sG2Pduoc
	GDM616BVNuV6yZbNpawUym7UPiLUXGZ6gaRwmTf9tD1MUOPF8CNvx+o7w0wDlcV/p95BAk+GeYT
	vmHbUaWSPXU0ws1ankozDpq6EZX7fg8voe5lnXZ2Ptbp8ogNkUWZAUaKn6fi+mFm2g8TEXL0N8u
	g5r1lR0Lhau3Wpg9tOIahoekYRvgv2O1avUsmkFkNG+O0/6sLmRs+vUbcOMlNFCNXvV/Lnb4F4C
	4HQi8YPBtsJdhXwCCz63qnaNXh+g/H3PYWjSTJGVutH20CtmVbZ5P73ze5a6WEZZs8xWjyrz5Vl
	dRcBSMpuWWMgslIPmuIA+rN9RY+LdqUng7xTFG3+LH4a8N+dblQg==
X-Received: by 2002:a05:6402:2491:b0:6ac:934e:a9ca with SMTP id
 4fb4d7f45d1cf-6b4429ff463mr1127240a12.0.1792809239498; Fri, 23 Oct 2026
 19:33:59 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925191653.3144006-1-mhun512@gmail.com> <20261001175502.4045853-1-mhun512@gmail.com>
 <IUKxO70u7tuzfobwy7veeNHbvyK5WtlYFOliAToGsdPncgmwXfbd95-SoyBBUj0AUENfcYLnsh4qaFj4AEkeKA==@protonmail.internalid>
 <20261001175502.4045853-3-mhun512@gmail.com> <74c10fee-bfb1-4225-af5b-fc2b3ce664a9@kernel.org>
In-Reply-To: <74c10fee-bfb1-4225-af5b-fc2b3ce664a9@kernel.org>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 23 Oct 2026 22:33:47 -0400
X-Gm-Features: AclHuK_Cs1i4iiemFtAKcWSfw5YUpemoD4SHO0r3M9ta6g3IG7c7Sepq9ogxnl8
Message-ID: <CAGEsz8GZ9QR=L9skNierVog8_=o-vBObqin=+dJZTDcpOa1TYA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: venus: disable recovery work before HFI teardown
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bryan,

Thanks for the review.

In v5, I removed the disable_delayed_work_sync() call from
venus_hfi_destroy() and kept it only at the start of venus_remove().
The work is now disabled exactly once during removal.

Thanks,
Myeonghun

2026=EB=85=84 10=EC=9B=94 1=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 4:10, B=
ryan O'Donoghue <bod@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

>
> On 01/10/2026 18:55, Myeonghun Pak wrote:
> > venus_remove() cancels core->work before the IRQ is disabled. An IRQ
> > thread can queue the work again after cancellation. The work can then
> > access HFI state after venus_hfi_destroy() frees it. The work also
> > requeues itself when recovery fails, so cancelling an already running
> > instance alone does not close the race.
> >
> > Disable and drain the work at the start of remove, before other resourc=
es
> > are dismantled. Do the same in venus_hfi_destroy() for paths that bypas=
s
> > remove, including probe unwind. Disabling the work prevents both IRQ
> > handlers and the work itself from requeuing it. Drain the work before
> > disabling the IRQ so an active recovery can finish any IRQ based
> > completion waits. Then synchronize the IRQ before freeing HFI state.
> >
> > Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper=
 functions")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kern=
el.org/
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >   drivers/media/platform/qcom/venus/core.c      | 2 +-
> >   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
> >   2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/p=
latform/qcom/venus/core.c
> > index 7087af32060f..6e495bc04691 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -596,7 +596,7 @@ static void venus_remove(struct platform_device *pd=
ev)
> >       struct device *dev =3D core->dev;
> >       int ret;
> >
> > -     cancel_delayed_work_sync(&core->work);
> > +     disable_delayed_work_sync(&core->work);
> >       ret =3D pm_runtime_get_sync(dev);
> >       WARN_ON(ret < 0);
> >
> > diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/me=
dia/platform/qcom/venus/hfi_venus.c
> > index e7e4e78a186a..20b8ba1e62f1 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > @@ -1689,6 +1689,7 @@ void venus_hfi_destroy(struct venus_core *core)
> >   {
> >       struct venus_hfi_device *hdev =3D to_hfi_priv(core);
> >
> > +     disable_delayed_work_sync(&core->work);
> >       disable_irq(core->irq);
> >       core->priv =3D NULL;
> >       venus_interface_queues_release(hdev);
> > --
> > 2.53.0
> >
>
> You shouldn't have to disable the work queue twice.
>
> Does a path actually exist where hfi_destroy() runs but venus_remove()
> does not ?
>
> The commit text is vague about that - sure hfi_destroy() may be callable
> from the error path of probe() but is any work scheduled in that case ?
>
> I mean lets just look at venus_hfi_destroy()
>
>
> static void venus_remove(struct platform_device *pdev)
> {
>          struct venus_core *core =3D platform_get_drvdata(pdev);
>          const struct venus_pm_ops *pm_ops =3D core->pm_ops;
>          struct device *dev =3D core->dev;
>          int ret;
>
>          cancel_delayed_work_sync(&core->work);
>          ret =3D pm_runtime_get_sync(dev);
>          WARN_ON(ret < 0);
>
>          ret =3D hfi_core_deinit(core, true);
>          WARN_ON(ret);
>
>          venus_shutdown(core);
>          of_platform_depopulate(dev);
>
>          venus_firmware_deinit(core);
>
>          venus_remove_dynamic_nodes(core);
>
>          pm_runtime_put_sync(dev);
>          pm_runtime_disable(dev);
>
>          if (pm_ops->core_put)
>                  pm_ops->core_put(core);
>
>          v4l2_device_unregister(&core->v4l2_dev);
>
>          hfi_destroy(core);
>
>          mutex_destroy(&core->pm_lock);
>          mutex_destroy(&core->lock);
>          venus_dbgfs_deinit(core);
> }
>
> Your patch will call disable_delayed_work_sync() twice on this path once
> in venus_remove() per your patch and then again in hfi_destroy()...
>
> NAK - can't be right.
>
> ---
> bod
