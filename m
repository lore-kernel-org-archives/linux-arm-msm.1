Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB8341836F
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 21:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786139374; cv=pass; b=C/8/gADgGftAOQFcaBWQ2WcVtRhiyY4hrizkuvGwwsFRGWV/i9+YyGVap9s3IXTfUaPnA9CLBkZ+QJHmIHLVW2YScmCFKX/eC/WmFhpOAksBkvTLctyYJm6JnKZNqTYng+T/gPjDxsRKRd/JVRuu7dQ2G9c4hSemqshIlsHpkXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786139374; c=relaxed/simple;
	bh=G5FTjcRpMezBve/ofJFZdVct+f6BL6BnRtg87rQ8DyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+4e0vMnEP3f2qiNs4B8MJUY0gMEmt0tAblRNlC4pnPUssfAHEDLNJ0ZoYmIYKJTWXqvHL74nQ2v64yVeiardNGidEfxTlxCht8W7UQsabqYoi9aqIySDFq/P4VH2fmGkEHLR+JvbKQCJp4o7RYX6QDLYV0v/oiJA+A//aNqrwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Me3rQyY8; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Me3rQyY8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495509b08ebso5685e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 14:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786139371; cv=none;
        d=google.com; s=arc-20260327;
        b=YQLzMFZ/m2PPA7FfzC4pkVRNrtopvZaIRGhQOYMeyRmi0jGrEplvkNBfRQS1ozJFTS
         rM3vMtBmSGFKCUDYa+eNiP37jTiDbZdc4xm70fHU3HWasgPAYJ0rUa8F2mdz0hV4HBYF
         wbIw5SLe0JmSCg009uyENICQnkEMPHnmifcQkLIyccQNT7SATyjPDm/aLZT8aGISrSE5
         EvtPJhPvIdRvEnvNCeOUDj2iH/NRXiFyCYamAOzUgSBnes6aoB54dgICRSD8fyZj6klP
         momz4uz+PTb3AbTvYgF/kx9uVitkt173Aq032nJqDmm1fqP9mMzir8aGY0r2e1Lm5A9U
         Z7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tojr7GnFU0It/HjO8jYmDDXbwX4n7nas02X2nGuMiz4=;
        fh=/VKs4PSGXxOjdzMlfb/lsj0CQQKODkJI/fSuaK/kaO0=;
        b=D+7uR3A+lncUt9uReWdGmNKTbVPek4qivlhJeGwyMcgXu4T5UV70BP7ms4ed1YRfog
         k+wadiribCcVpLi1aMEWnA4jW9CH4v2F0grSsTy/925IRCyraLBxZDV3rPISkHArUyds
         lZODt+pj7JV6tEjKhhJoczvQWQHLP+32N/iL8hpqhxKdKF9CUfZMny0WSwfj8lB5Sljx
         W9kkf8+3JTh3igf9GApGlXn/pa4MsGVjsERlj4OjQfe4qOBRqrJm3dkwP4B7ShEckkiX
         W7InU3RpA04GbE7QpCH7Efkh/mncV3hgXYGcoAz5iTDXtJ0618+R5tGjXBC8FYITDaQX
         YI8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786139371; x=1786744171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tojr7GnFU0It/HjO8jYmDDXbwX4n7nas02X2nGuMiz4=;
        b=Me3rQyY8zwJnMbRcsTZYZBN0mUbQLcwqP34ndbwdzzsI6PoCk+y0Egkc15WFT01Mh3
         qnQozarUufIbzgac0Dxv6Ha06P/dpGiRhSB3m2cDz7eeIJy3RvG94vlH/jjLYVxYff9D
         qrotEmfATufKSn+YCjnOKCaKDuQENt0XZGkGIFsUWkwMpsR+v66iyxMHQ/oiFAjV1CUu
         q4Tr7dsLgdaUJGcpjhsEKwz2NFXStEvDuJJfjxlg00B7nYI2vTZNSnXa1tQCrJgaiASK
         7E6RjiiSlpiVu4DEEVO+s+FMxw7UKP0j0TPGrqTVGYtcZNouh7P1HvKvz//oPr4QGgRM
         WIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786139371; x=1786744171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tojr7GnFU0It/HjO8jYmDDXbwX4n7nas02X2nGuMiz4=;
        b=TIxtFs2bGco5JWEH88Xd7Av3689rLB4jPv4eaz5CcZgjhDGKm5jPGYMOuqLrI9XwRC
         zSoE5mhvYvY63zJI4EzoVIrNsASGIQKep/vYfAqCpbGnDPtZzyTb5+XWYr2mDgBPnfbm
         p1S1I2tmGinDga0/OLNdblC2U3uZ+jRBPPPO90VWu/SHO9xeUCInZ+KLoBfH8oUcoM42
         2THcJh1f5+Fc2kfkM9F2xDOcvaHaG4mhrkXYcjukj7a84uC2GgSUq+ZNGRejsLQ3N1qv
         dv90uJ5aLBilDJB1zuRcM34BTfuLh7mk8H6+I2MrYRbG/nKS/xEjCUjDoZXJRL+BLKV6
         K/UQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrt10cWb2v6jTzt3cfY/kB+CpEWTRJCpRSIn1l0KoFQtRqeOX/E9HYXc/WGkNdgfjNdEU+WKHDSEN/6CuM8@vger.kernel.org
X-Gm-Message-State: AOJu0YwwU3E7UQXjlGw37Y7MIwjEmCULWYVudaT6AyNquQW9Gzry3Dnk
	LefKkdeDVRl/U75RSpH9Dk10ox3Uv9/Z54PImPeV9QzZX975imghZWWdQ8dJeDEh6D89hLv0xJE
	HGt1Jib6LPI296OzloDiE2dzRTE8BHlsox9+Ta1YU
X-Gm-Gg: AR+sD12QVMnPwtCzzRrB9+D2zfNTk0VY5KyrZCiavZdlPW3W7SxsgyUdKgAAiGdfZXM
	FikUE/RbmOcJL2rxb+LkDNj/d1/P/nKN5YzlJdOqh7bvGwOkFCgxUZgc3VajvGTasIPvuKbIFZ9
	g4uYDamJ1LbZgs2yTKDCGiL0stTbGBXPpqi0baA0OSRVZWEkafFBIEz90pRH5L+Wm7TiwQsOAKh
	opGw2cYgHnxI1uCrJXmQDpnfGuI1dTuXuKAaEJE8a2QTKsa55zQP2SLeQQuK51AZ8sgRb8ITcMd
	UIu9fn+AZrSHXM1MXNEJDSjKf2KlZmeMPSGx5SR/NSfEbyPPM5gxDKjGZvMTIKd0CQAA3COrZ1w
	=
X-Received: by 2002:a05:600c:1792:b0:48a:5618:b4d4 with SMTP id
 5b1f17b1804b1-499624fa627mr282955e9.1.1786139370663; Fri, 07 Aug 2026
 14:49:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
 <20260807101140.1357218-1-shoubaineng@gmail.com> <20260807101140.1357218-5-shoubaineng@gmail.com>
In-Reply-To: <20260807101140.1357218-5-shoubaineng@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 7 Aug 2026 14:49:17 -0700
X-Gm-Features: AUfX_myL6rl83duYDy7P4wt3f7i8-Bq4xO_AORup9Lze93VGtdc5GMGWYyQ-sUA
Message-ID: <CABdmKX0i_DaS8Q2=Q8Xs5bTbSCj2FFSpib9ReCGYFXSeiBcntw@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] selftests: dmabuf-heaps: add fd-leak-on-EFAULT
 regression test
To: Baineng Shou <shoubaineng@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Sandeep Patil <sspatil@android.com>, 
	"Andrew F . Davis" <afd@ti.com>, Srinivas Kandagatla <srini@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, stable@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 3:12=E2=80=AFAM Baineng Shou <shoubaineng@gmail.com>=
 wrote:
>
> Add a test case that verifies no file descriptor is leaked when
> DMA_HEAP_IOCTL_ALLOC succeeds internally but copy_to_user() fails
> to deliver the fd number back to userspace.
>
> The failure is triggered by placing the ioctl argument in a private
> anonymous page and flipping it to PROT_READ (via mprotect) between
> the kernel's copy_from_user() and copy_to_user() calls.  With the
> buggy kernel the ioctl returns -EFAULT but leaves an extra open fd
> in the process's fd table; with the fixed kernel the fd count is
> unchanged.
>
> This serves as a regression test for:
>   "dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds"
>
> Suggested-by: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
