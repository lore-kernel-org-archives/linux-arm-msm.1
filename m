Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F40041DE06
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097485; cv=none; b=He7PHbaoxP4Xi5skAzyJ5Tz6qyZ8vWRZMKWy4rbSPQdxnMb75ryMRhKhOpjy8I4sw1rFJLUFRcMguwuXGFinTeB+OrlaotZK0fq0RoMtcPrYTHmD24ezB1Fjme+YHgnhVSk0Onyrczr/50lrXmhDkBNEihJZ9j6210AOBFnd47o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097485; c=relaxed/simple;
	bh=Lh9CRmCJRCXUfNdf9uNGdR9iSpJFMr7nm3Cly0+0f/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tTubOqYBodaVAh7QN7QqBPXz9oV66xHwDds9sAXqEaC5ImMSRxTiW0VG0hyslMjJQ9B9N/U/wizYlQBppp1GhZhWRxMrrBkbnep1W37RI2/Fc7pZYLIJSDR0SsTpHShSAiLrMcBp4+M7f7J/OYlretTbMFAc3YiwghKFpEdNYZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWSzpG0D; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWSzpG0D"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3122479a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 03:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097477; x=1786702277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MQciLaflxhQrAIWokNvSZ9sUyM0S9LcjwfcEZLUvgpA=;
        b=AWSzpG0DMAhDsGUtavAmQ6Fu/fEdTz4FYk/miy2J7IQy5SOdYJxUrwi8lUy2vEQK9w
         PE48cpC03WluYAZihYrYcF/4S5yvaxw5r+YVRCKZoqu7L3m/OJ91vSUrDmckObS5IeBt
         qwImmH3g9z38q0iy7sehGVs28+iJOui0LDe0Cq4+F3kwrJwg+H/QzYIs9V4x4ocApXcP
         32+7YPUF8NwUr1txp8Hq0EylFCiIAYDgmkvkdA3yRjVFELzIr8cH2BLBCs+mYbiT1hFj
         inpWlhpgoWLkf2jN2809HUs679Eogx1gEBeGDtM5NRkIAnOs7s705ONiAi10UhNCwGXI
         mg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097477; x=1786702277;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQciLaflxhQrAIWokNvSZ9sUyM0S9LcjwfcEZLUvgpA=;
        b=P5Rr6gGN8YXfQneQfZUb+z/xpVpbYvdXELM8zbqXff4BrFBDxOipx/rUSf1753oQfV
         sdbf+GezfUvY/nIovaHBoeYfg2sgoiNypwss/EjDKBA9/7xhfQ49fi8k0xOOjj+jwxbm
         XElVlBU171UDZvHj8jP3RN5heWjaqXvNFRtoEJQWD2RX5g/ybLLmp7J2XStHN5rawRUJ
         g6Invf5SEUNTRHYW4MUkFiwV8eGzS0ImMhyiwpbIhhCE1HnAntg4CJ2VFjT/ru0Z+JRv
         xi6xEx4nYx9m8kf9zfvNYnMECynKiJSaDrkzAEBUIRNmik1Kxe9OKf+jOKsZZOgzht0Q
         7cPA==
X-Forwarded-Encrypted: i=1; AHgh+RqjoTZ1nKGxilcQgcSrk40BVIjGd+dl1wzE3meFKaazQ38dhA2nvk79YxosBBpXeGRPYcwRK+Gg/MgrZbHs@vger.kernel.org
X-Gm-Message-State: AOJu0YwhWkjyYvVXn3q1lMt6WjtgDeOXEPKofKDVGG4nFZAyF6ODdAhS
	OU6ofLn/WR5gzUKUyfdOed9RYaSBbPwHMyk4W9s0WU/zzNORjGhqbmYV
X-Gm-Gg: AR+sD13uYzqFfCM3vprzvpqhiLmsD5TSztfVU8DmzWhlFh2rNyYnAmmUw+oWk+cAEvb
	+DOmsQPJ0O+pj3E9aVePFDws+JC71K/OC++A6tU+7HWwxN9S5jXRtoxzEvo9tOu71G41NrmZhDF
	ozvVsNApgtGWFGptzeeNuFbzIVcl2B1NXKkJ8Jut13Tf1+rlB6/qV7+HnZkwtJ+ktT6YeHJLHm5
	jeTtFDwQhzPtbeoINei8WS2fwiM9uzItYn9KJ8mZc1YMKxfKR44FRJVIynLxskPgtQ/n71krRUD
	NgxU0WTFc71bGWxXD2Me2+1UUprYK/pEq/5oiKyT9b06yNm+xS/nnCVCrrK7QP326xAah+eXolH
	ZdQ/aTAeVzukrocbKrizL8WlXELL4HGe6J0haucEmGISEA21bh6FDlliKJRSkOXkHGyKx4C7YY7
	2Mdj3XYI20tvFAiHvxxt8hO9Ol/rcD7NXx37BhXkMuZeMJ1gMdXzCV6JZkQukBRC01xDzXrE6We
	lc=
X-Received: by 2002:a17:90b:4d8c:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3903c544f17mr18302876a91.6.1786097476902;
        Fri, 07 Aug 2026 03:11:16 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm1928581a91.2.2026.08.07.03.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:11:16 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Sandeep Patil <sspatil@android.com>,
	"Andrew F . Davis" <afd@ti.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: stable@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH v6 0/4] dma-buf: fix fd leak when copy_to_user() fails after fd_install()
Date: Fri,  7 Aug 2026 18:11:00 +0800
Message-Id: <20260807101104.1355464-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
References: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Several drivers call dma_buf_fd() — which internally calls fd_install()
— before copy_to_user() returns the fd number to userspace.  If
copy_to_user() fails, the fd is already published in the caller's fd
table but the ioctl returns an error, so userspace never learns the fd
number.  Worse, the window between fd_install() and copy_to_user()
allows other threads to observe and manipulate the fd (dup, close,
SCM_RIGHTS), making any "close it on the failure path" fix unsafe.

The fix is to split the allocation into three steps: reserve an fd with
get_unused_fd_flags() (not yet visible to other threads), do
copy_to_user(), and only then publish the fd with fd_install() via the
new dma_buf_fd_install() helper.  On copy_to_user() failure,
put_unused_fd() + dma_buf_put() cleanly unwind with no user-visible
side effects.

Patch 1 introduces dma_buf_fd_install() in dma-buf.c (wrapping
fd_install() together with the DMA_BUF_TRACE call to preserve export
tracing) and applies the fix to dma-heap.

Patch 2 applies the same fix to fastrpc, which even had a comment
acknowledging the problem could not be fixed before.

Patch 3 replaces the bare fd_install() in drm_gem_prime_handle_to_fd()
with dma_buf_fd_install() to restore tracepoint coverage for DRM PRIME
exports (suggested by Christian König).

Patch 4 adds a selftest to tools/testing/selftests/dmabuf-heaps/ that
reproduces the fd-leak scenario (mprotect flip before the ioctl) and
verifies the fd count is unchanged after a failed ioctl (suggested by
Sumit Semwal).

v1: https://lore.kernel.org/dri-devel/20260703080922.1838362-1-shoubaineng@gmail.com/
v2: https://lore.kernel.org/dri-devel/20260710105430.3059661-1-shoubaineng@gmail.com/
v3: https://lore.kernel.org/dri-devel/20260714114654.3885457-1-shoubaineng@gmail.com/

Changes in v6:
 - Rework the selftest (patch 4) per review: extract a count_open_fds()
   helper, fix the copy_from_user() comment, fail (not skip) when the
   ioctl does not return -1, drop the bogus mprotect-race mention, and
   reword the result message.

Changes in v5:
 - Add selftest (patch 4) reproducing the fd-leak scenario (Sumit Semwal)

Changes in v4:
 - Add patch 3: drm/prime: use dma_buf_fd_install() (Christian König)
 - Add Acked-by: Christian König to patches 1 and 2

Changes in v3:
 - Split into two patches (dma-heap + fastrpc separately)
 - Add dma_buf_fd_install() to preserve trace_dma_buf_fd tracepoint
 - Add fastrpc fix using the new helper (T.J. Mercier)

Baineng Shou (4):
  dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
  misc: fastrpc: don't publish fd before copy_to_user() succeeds
  drm/prime: use dma_buf_fd_install() to preserve export tracing
  selftests: dmabuf-heaps: add fd-leak-on-EFAULT regression test

 drivers/dma-buf/dma-buf.c                     |  20 ++++
 drivers/dma-buf/dma-heap.c                    |  80 ++++++-------
 drivers/gpu/drm/drm_prime.c                   |   2 +-
 drivers/misc/fastrpc.c                        |  16 +--
 include/linux/dma-buf.h                       |   1 +
 .../selftests/dmabuf-heaps/dmabuf-heap.c      | 113 +++++++++++++++++-
 6 files changed, 180 insertions(+), 52 deletions(-)

-- 
2.34.1

