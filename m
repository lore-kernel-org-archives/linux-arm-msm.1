Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4C24B337C
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446384; cv=pass; b=lFEj+HvZY0ZjYbWnxaph/X4/zTD4Cq9ONGgNjiYUJIrJy8gWmD9jWcFA58+etJUs6y7DiNZaD+gKKvL2sIyDOrmqC1mo6PoypRMFYBDGR8IWHZstx5Xd9kBkfJGMCviFEyxrE7ctZ0OMa/ZId26vsDKrDFp3xoCV2LjkGzNDcZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446384; c=relaxed/simple;
	bh=GRG7VAW4y3EdB7x7u6hb320P3gD15LYx1LfsViKAjRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=iH3gzJnyTGSckJ4jyd+q0+RKnT1tlchD8JnFqMs/yaGC0102/FO/4O/9ufYxiYzh5Q9Zt4URVWlht+qXmmN2dFAEkRR3xAGod/25mSRYVK8hxh3fXiLbIhxwHI6RWV4Px3vMBOfGxj7/J7zXjrjQZlw0EWJtg4o9kXBXk2iupUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRbNn70k; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRbNn70k"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-861f30636f9so33619927b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788446375; cv=none;
        d=google.com; s=arc-20260327;
        b=iCHz1LfiVc7TinZJn2oLhuO/Uyl+S8UMCP73Dr1TxVi/UtHacaaNGaj/hD0GOYjgGY
         BODYsYTq3KIwpfnS3aKbfpEeh2miVg3p2CM/Ba40vaOSp3tD0PSdSossEj0QNmwxZk7q
         vxpACianNnyNIURQjwX9dq3G/hrQH2TyA6rMZONYtCs5hN3IwbWJm9p4zmPdzrMVMND2
         NrejY0u2uGaIppi/UEx1z48VVPyFKldEagqynQYU6epa53xLxFgFOMXMTRU6TKGSRF5c
         21Nm7qSysCZVPQVbCKM+jOvNLJp+L1pSofFMWDlSjASMTdfYgZ4PdGLOVExw7gVo3vqt
         U7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cmlPLJyBSVhdlXIs0gcABkaj2xlIPjqFJYx6h3IxpcE=;
        fh=5rENlYxDuXWSDAnkNnoZY5WrLD1kkDEYDhHlKBjgsEM=;
        b=TzprTJqArcpTpFfNDl19DTh/xNl1dKxMLi/EbA8qekox7ANwkiCRFLYbOrMj39kRpG
         IxxQAsG6jn6YNaGqFgN0PAejT3maGYK1tJYhL8yKgUaeDEhZhLU6KHpAE7jdRdNTWfUb
         zl3qEvXayqBbM9SrzgQXQAgas2gQ4NYNDogMaZfkke6UNPx8yVDdpOYjS51fVAszX7I0
         sMIUieIa2zFs6PlyVvG9m4i4nHv/F3X2DH6AqReLS2V1s1lGjTwjDtwCKCsRGm5e0wsP
         dIDdrQDTHUno0W6vqVopnnmjcUtpv9HWm8iCDa1IkweaubHyuZM4sEwngvSaUZMwfSRW
         I4tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788446375; x=1789051175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmlPLJyBSVhdlXIs0gcABkaj2xlIPjqFJYx6h3IxpcE=;
        b=DRbNn70k6bjBwzq/69XlK1DKkzE4TZTcMvjla1ycME9l0goStPJ5V1Mf87RQnVjMYl
         3zRB9hcGBgWrV0o32Vq00EMx80pqHv19h9YRhP8xzRq7peuRot+K4lcVCQ9/qRRz+0Bg
         wV84qd0a2JEA7ZC/fnqfi9H64zuZ1NVHzq69x9BNjdugNJ73CsF82wkJ8WMOVoF/F/zv
         yiZsjGtFqmdnadadmJRtgdQqHot/fcgNFFqv8x5VU9oYq6LzsQ+yoLLZvBWvDXWubIL7
         CBbkRtGMSe28RTbZx1YQ/ndeofRz6rjEftEn05tgZf5rdye5hxaoJzUqRpC9z+XlYwZU
         ypWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446375; x=1789051175;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmlPLJyBSVhdlXIs0gcABkaj2xlIPjqFJYx6h3IxpcE=;
        b=huMkXx2Nx8LO7CwkwW66mTqbmzEXpZv9cK743bBEctHJJKJk5vjYnQmF1flhd97bIZ
         EY+udbUNr90CW4F4HDKNCEm0w+YMPGRV1udY2+LWVI6HagDVLTzJK8M/rHkeTAgvnrSj
         ibLNn0zXR3DHkvh1+GcuMFk5LX4LdAhhF9OgI319BIEQuDsK3+ODWkwOzdK7dFXf0lIq
         6IH5nDSIoOTyNvqJ2oieqjvd6v/7ZGHcw5mwj8vZAZLTT+3SC97eKU78G85UVXhEISzy
         1+ShMlTAmSp4+1lFKR7/wkolTDIiBqObbJ6NTCVXUYYdCkkBg/9zo1TRLC9r++xrJ1Mx
         HLlg==
X-Forwarded-Encrypted: i=1; AKwUvByqD0MKaIXTOS8OGUnBSygN9LixzoIzYtL8VuUvG7dGg1dLc69qnKjfoac+ELOuoj5MezsUbkoYj0IDVYAF@vger.kernel.org
X-Gm-Message-State: AFuF++lMIj2CW7RMBbQYDWRDtmyqi6q29JmPAGnkcAPSKF5CLke458lQ
	gYOgC1WlqvB206gpTL4tqAk4FkGCf8phU36MZdNAwCbRbfTpobheQw3DMQkonjOessMBlaV5iR9
	cR/hlIlZ8z/IsUFqxdiDFPcMAUjsRXAXR3mmxapYQcQ==
X-Gm-Gg: AYBFou0nA0Zf2uAL756QOIVUsemNIUnQqfryS7G8E8h6yv/uFJN2yAAnFirUjVAzFIE
	pYiTLARObNxd9iBrLKR082jy/B9D+ecPA0mSArEo0JGyoGJLrl6xPz2iECOj2/UhQYdZdOcd3Fq
	DpAijFQHKinGgFjGX1a/ziDV7wUzOZXjB9IwEU/06rJn3eOAZoJ7xe58a3usdoNmyPqjfGukWNw
	oGo4AFxNSLZrndIFuPjcZw7zFUEqxn653bqHzskuZiNII1FbLOtkwqe36jTfJnS/OweIKE997G1
	1wBa2qyWYyMgs4Y/B7AwSnHThVpJknzJ+o0HS0JTtEhx9Jw33XzKwYq2AQ==
X-Received: by 2002:a05:690e:1904:b0:66d:1478:189c with SMTP id
 956f58d0204a3-66f9bf8d234mt5185177d50.40.1788446374768; Thu, 03 Sep 2026
 07:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903143004.1026181-1-jun.nie@linaro.org>
In-Reply-To: <20260903143004.1026181-1-jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 3 Sep 2026 22:39:22 +0800
X-Gm-Features: AcwNN1V9Sc-XWHIXu60lPfwzYFhzqrxq1vJD2g2K6GQFtNs-hV63HQDDwAGV2Hs
Message-ID: <CABymUCPzN89G6pSH7hG44hRupeMoyA+54BRW+mW6tT_Y21mXCw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: delete timeout timer when encoder is not busy
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Maxime Ripard <mripard@kernel.org>, 
	Teguh Sobirin <teguh@sobir.in>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=883=E6=97=A5=E5=
=91=A8=E5=9B=9B 22:30=E5=86=99=E9=81=93=EF=BC=9A
>
> There is a spurious timeout error message under the following reproductio=
n
> steps:
> 1. Run "modetest -M msm -r" and press CTRL+Z to pause it.
> 2. Run "while true; do rtcwake -m mem -s 3 -v; sleep 2; done"
>
> Resulting error message:
> [  124.018206] [drm:dpu_encoder_virt_atomic_disable:1425] [dpu error]enc3=
5 timeout pending
>
> dpu_crtc_commit_kickoff() calls dpu_encoder_kickoff() to set frame busy
> bits, and then arms the frame done timer. If the frame done IRQ fires
> between these two steps, the IRQ handler clears the busy bits before the
> timer is armed. As a result, the timer runs with busy bits already cleare=
d
> and is never cancelled by subsequent IRQ handlers, leading to a false
> timeout warning.
>
> Delete the pending timer when all busy bits are cleared in the frame done
> callback to prevent false timeouts.
>

Another option is to wrap the enc_spinlock lock/unlock pair in dpu_encoder.=
c
and expose it to dpu_crtc.c to make the sequence of dpu_encoder_kickoff()
and dpu_encoder_start_frame_done_timer() atomic against the IRQ handler.
However, this breaks encoder self-containment to some extent. Furthermore,
initial testing revealed a deadlock involving additional locks beyond
dpu_enc->enc_spinlock.

- Jun
