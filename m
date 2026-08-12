Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB73474267
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548448; cv=pass; b=lDy3zcLuSKDQ42xCKoeuE0mLtRJrgpaarqbeTbda3pps4mCjkYQ4+dfn/U2wWWAGKqqjtbyA0h0NkjUfvRs4AmoifY/JoOanDogResM8fSuoK3PVs+tD7ZN/vydNNi1aNbgN2IkCJbjh5NVuU7n/B3OI/qucbIApYhcbGRmZCUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548448; c=relaxed/simple;
	bh=Ts9PK9aXwLEU/nrIRNxnM9qG/yIOXNQLDe8r+ZcI+pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbt3Vv2BHLIwSmZYf/oa6ao0sXIyGaad/3Rpfs4tnDfluQAVWZeVW8EHusiB+E2bEPtvSuKLt4kl2TQKw9RE13Sc/XlnLnmOEWVogDVY1snFByqf5JKEZ+idiDC7QIoVKdrnkbVfBlAjFvmEE3B39fd2kPWSKKxmPAtDotK3yS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KhEW5xC+; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KhEW5xC+"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c197e7e4e94so202251466b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786548437; cv=none;
        d=google.com; s=arc-20260327;
        b=fZrh0QCS2y7e0EXlheBjRSE1AQlgDL+RJzoL4tWc1TZ3niyZwz7bvbCoKZkcVlHyGi
         5fKEKrvDLIKhe5w+aRJtv4FznLjhB5/Ot9X8FbecWaiPjhTIxYOpHb/7qlipo2Bx2F1c
         ZFO7XF15skeweSEL6T1xjhU7Pm0T+mk59D2RJQg2MHrr5IaRwdthzewYc3QsjVd80pW8
         qWcJf0D+17KIuVTWcm7/CcVNykhm4UJD6Eig6Zkr70FoTCjG4tsMrXMuOseFAWHwRouz
         KzRdsQMeeJSxROHQyUb+FTtmSchiyUPpHkZeo+5ci2WLBtLRkxjwo7DhjgO3dtTMUQkX
         VeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9HQw24hdIiiBy71zEiY+V8zJ9GZN0hXXJxvtzQE5bgc=;
        fh=8O9i2hZRIDUqKVRx76IXouTQJEM/fEpvIHp39Ra6bdc=;
        b=Gdtd7ww7DJZ5BouiMq8QMrWMVS6Unr3RHzO1e23rVKjeyoBtzwf5Kz08kZ98SGVVBW
         /2W60sarl6lDrbsUCpzpj8KnuvKmOXT1JRmp4JWkn20BCCE0v6kLJDv6eiZTUxn95Pln
         ve0DEWph7H6VuGkKBOBWLCyUa9nP9yH2HOI2xctH8yTVFFgUFoog7AkQJtcmQS+sDhXl
         RMHhY1SjmVXV/x6eQtEM/CEr2ueAHI/U6gQeOzpDqbssVPi10d1/Yrf+IWVLOKoTr4u4
         VWpzMaaU1wz2zvj9J6UJyN8/Miqchg8d/rtC9ZJ61K2NHD6BghCBZhY7SCMEORgZN6Pl
         oBEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786548437; x=1787153237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9HQw24hdIiiBy71zEiY+V8zJ9GZN0hXXJxvtzQE5bgc=;
        b=KhEW5xC+FDqLLuf8KKrrSJ6cOzs0voDjw8qFESBp6beMcxRmkE5Xlq0qY7ZXayer/z
         SDnP4JsVmX1UzZQXOAoUVdXJCGwI/ya7JKWeX5IJyK0dXHtxQvjtr9bY3VYl630Geyex
         wFJ2EJPdM9gSoarbeR9AFfCD+61A4kWq3yCw/e19WcXFr9tiVWZ5N4vfvujzIU6w1D3X
         xN4jV+7aTxHn68w0jMrR3y4JYWBisX2HTwpWalXniN8b38JziPELolRqOfIqHCexqfwf
         EYFAIB0pu+lDu5GRQpXQOjhQiGd0BEab6cyk25rS98I+YoVKWNTzGZHQJr70tLguHGCe
         7y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548437; x=1787153237;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9HQw24hdIiiBy71zEiY+V8zJ9GZN0hXXJxvtzQE5bgc=;
        b=qTor7m0VoyG/AOQvboJoHxynJvsES8xaJoEvOTho8arGNKM01w4BohZTqVa0Lq/0Ni
         qwgtPLXThz0nVx2svh/JmGJF6czoQC5+1Q1iayRsxmyUocWT68qHM81UTt93rlCpE+kS
         FAHChs+acjSTiyvbvyQg1QDEo5s0mBb7QQYCpRLlUHanCCZx60yGe9AeTekk2EaS+t/w
         P9/WBM8Ld0B11TUOxOCUaC48qtCoS7dFU3PydwpqEdwcv8OmmVR5jN47DcPYtCQGBAbz
         DN6n1khxbU4keSWBIIEs7a+7Z7JlVeWd7JZoQpG6NFeO+GwZQLAlQx/GXIzAxKPi8lgG
         NXJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqy3b0FxokLmdYx+8EUAyf6oeiB+niLpp5V5uoTby/Vr7pqi7KcNWPNMqsZGfeFMA0JZw1UKD9Y89JX9/MV@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ7HhypvWlwTks2hQmzLR2O+0ihZJXD/UKkRFJPGm8aQxENN0b
	yMGEpJPto0p832YJ/67DN2zLyQnwCJdts/zSBvgT954wTQLVbN8GryNOoUxcFxbl2HD8tjyqX9S
	+l9DtfMZKBunhqkifQ1e15k3lamUP8wL3n+frtMs+sw==
X-Gm-Gg: AR+sD107uhq9t3qG1SutDmvP1o2Y8XhclQOjUBQU1MENsbAx2ZXaDbqkmDtqH8vXAHL
	4SHlf5FEEVsVd1KkAgURQue6Waz5zNyyJgKNqBn+1V3Vwx41hPmicTWYZW1fcgwkjhMnixYVRzl
	EvfzThmxy8eRvV3P7CzynJs9yFwhX95lSLXlBy1mh7pmxHp+k21HMIdiCyp0GoFYXcdg/vwPWBB
	mrD/ZJpL6VoZj5+jL4UyK1YCIVcgENkcrqZZoO1PDxR/TwoSz0Ti+G4zKF1Yfv97vBiGYR6N/Og
	c08sBowrsJ/p4WytObfHstrTL7bzT1asFt+x8VjUhcsTBfb4ZMSIt0e4FBaVhc27/J1M21TDGw=
	=
X-Received: by 2002:a17:907:f816:b0:c20:2d38:e518 with SMTP id
 a640c23a62f3a-c20f2e66a3bmr273702966b.2.1786548435676; Wed, 12 Aug 2026
 08:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
 <20260807101140.1357218-1-shoubaineng@gmail.com>
In-Reply-To: <20260807101140.1357218-1-shoubaineng@gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 12 Aug 2026 20:57:03 +0530
X-Gm-Features: AUfX_mxKHc0XJq4SFZbCVvYoj4A8ln1CqD7e7dKrGyTLzT3rZmWFByVVhkPNP5I
Message-ID: <CAO_48GHc2TQJ9baa+EYst5vR0qUYvRVj=r8F9hxMLpySWE5+QA@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] dma-buf: fix fd leak when copy_to_user() fails
 after fd_install()
To: Baineng Shou <shoubaineng@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Sandeep Patil <sspatil@android.com>, "Andrew F . Davis" <afd@ti.com>, Srinivas Kandagatla <srini@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, stable@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Baineng,

On Fri, 7 Aug 2026 at 15:41, Baineng Shou <shoubaineng@gmail.com> wrote:
>
> Several drivers call dma_buf_fd() =E2=80=94 which internally calls fd_ins=
tall()
> =E2=80=94 before copy_to_user() returns the fd number to userspace.  If
> copy_to_user() fails, the fd is already published in the caller's fd
> table but the ioctl returns an error, so userspace never learns the fd
> number.  Worse, the window between fd_install() and copy_to_user()
> allows other threads to observe and manipulate the fd (dup, close,
> SCM_RIGHTS), making any "close it on the failure path" fix unsafe.
>
> The fix is to split the allocation into three steps: reserve an fd with
> get_unused_fd_flags() (not yet visible to other threads), do
> copy_to_user(), and only then publish the fd with fd_install() via the
> new dma_buf_fd_install() helper.  On copy_to_user() failure,
> put_unused_fd() + dma_buf_put() cleanly unwind with no user-visible
> side effects.
>
> Patch 1 introduces dma_buf_fd_install() in dma-buf.c (wrapping
> fd_install() together with the DMA_BUF_TRACE call to preserve export
> tracing) and applies the fix to dma-heap.
>
> Patch 2 applies the same fix to fastrpc, which even had a comment
> acknowledging the problem could not be fixed before.
>
> Patch 3 replaces the bare fd_install() in drm_gem_prime_handle_to_fd()
> with dma_buf_fd_install() to restore tracepoint coverage for DRM PRIME
> exports (suggested by Christian K=C3=B6nig).
>
> Patch 4 adds a selftest to tools/testing/selftests/dmabuf-heaps/ that
> reproduces the fd-leak scenario (mprotect flip before the ioctl) and
> verifies the fd count is unchanged after a failed ioctl (suggested by
> Sumit Semwal).

Thank you for the series - please feel free to add my

Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

>
> v1: https://lore.kernel.org/dri-devel/20260703080922.1838362-1-shoubainen=
g@gmail.com/
> v2: https://lore.kernel.org/dri-devel/20260710105430.3059661-1-shoubainen=
g@gmail.com/
> v3: https://lore.kernel.org/dri-devel/20260714114654.3885457-1-shoubainen=
g@gmail.com/
>
> Changes in v6:
>  - Rework the selftest (patch 4) per review: extract a count_open_fds()
>    helper, fix the copy_from_user() comment, fail (not skip) when the
>    ioctl does not return -1, drop the bogus mprotect-race mention, and
>    reword the result message.
>
> Changes in v5:
>  - Add selftest (patch 4) reproducing the fd-leak scenario (Sumit Semwal)
>
> Changes in v4:
>  - Add patch 3: drm/prime: use dma_buf_fd_install() (Christian K=C3=B6nig=
)
>  - Add Acked-by: Christian K=C3=B6nig to patches 1 and 2
>
> Changes in v3:
>  - Split into two patches (dma-heap + fastrpc separately)
>  - Add dma_buf_fd_install() to preserve trace_dma_buf_fd tracepoint
>  - Add fastrpc fix using the new helper (T.J. Mercier)
>
> Baineng Shou (4):
>   dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
>   misc: fastrpc: don't publish fd before copy_to_user() succeeds
>   drm/prime: use dma_buf_fd_install() to preserve export tracing
>   selftests: dmabuf-heaps: add fd-leak-on-EFAULT regression test
>
>  drivers/dma-buf/dma-buf.c                     |  20 ++++
>  drivers/dma-buf/dma-heap.c                    |  80 ++++++-------
>  drivers/gpu/drm/drm_prime.c                   |   2 +-
>  drivers/misc/fastrpc.c                        |  16 +--
>  include/linux/dma-buf.h                       |   1 +
>  .../selftests/dmabuf-heaps/dmabuf-heap.c      | 113 +++++++++++++++++-
>  6 files changed, 180 insertions(+), 52 deletions(-)
>
> --
> 2.34.1
>

Best,
Sumit.
