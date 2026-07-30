Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3AB3AF64F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392832; cv=none; b=Pfm+wwpAiiafmwBjP4ZyvjsmSCj0JK1VMsslJfg+TdEOeTkDIXfZ3AKOE8TbmN43vFAhGHc6tw+PkxMMI2clMpfrs743mr05N6c5bMjjp6zW5YGtb+heuwbk1+0gdhhLxFcs/wHnIUFAhAtXq1J0AInvPvVJmuXQQFtkxdOJTbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392832; c=relaxed/simple;
	bh=F9WeV/nxAP6fHlwe0aqZ4cby4GCtvCwnHIr/wOKq+vA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CFTfu1CVboJMbvP0LfmNXRQ6rrGuPQEThJpzV+KxcIk2kDrsB/g/dDxBO4rZ9+q2K9cyLWGyaBBqaXu1MTEdxD5xcCTgo7Lubv1IjksJSo378UOq7M9QC5WtVYwTx1+PEte/jL37U8FsCHKPjQi8nP1owEnuMr0EFbxB/1WP/M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1w0edeF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1w0edeF"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso2109269b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785392830; x=1785997630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lC5eDEn/dzL9Eec299VWkBRGUg0dXbB9NQvY7s3O+kI=;
        b=S1w0edeFDpRDZQ3BaEigFHNvpdsf35Ha8TgPZVWhLdqlnnHO/1sDKYCL1KlZMvGEHi
         cbO3z5cDvuHlVBxVc9NEoK++OU9tzePta2Bx/CtBtYpk461p9WMpW8B4vRlARHoEv3M1
         zc1vYvDSpYGxw+4OC12FIWXIjHFSJA0GH5vORS191ZGN/gXz6C4Jyug3m2nvwafA0niR
         eRGhLqpcODTPSGCSLnNL6ISgsIgl4Bu57OyBhs/pae17bzPIzxMA8xObK93ogLhaRQr9
         kTnsgzNhuZbPXli8qCqKO7/xw2ArOnLYkcBWfONNNzywEjhZJ/WQMm9VipoQIkMXkhjS
         LVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392830; x=1785997630;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lC5eDEn/dzL9Eec299VWkBRGUg0dXbB9NQvY7s3O+kI=;
        b=rOMUtHWDxW2U4/zO5uw9obIfbVDkcH3YKoXmezltQ6nPXJwIuy7/nt5EV1PKeqPhNj
         eZVLAId6edFZ9dGbxUdjcmaTlxEIupQRnEyGFIbD7QaxkCFwB5/aJZAt2bxrwoSFKtor
         ZIyqjmAx3LoZ+67WlBbHDXyMoq9mAUPySMBbMdoGXxEyaQY3LxDY5eQ8sx7VyvANwmE8
         2362RM3lMmO01GSc1IJ19EIs+9vpyyM9AwcweIsfLHlJvzYJ8my57RSHjo/tqgUDmeQz
         X4BjEY17KhJuqJX+JqVbwFLLviRj+cuCZox82Rd5snGgiRahgKroakPT7FY479P3KgZE
         sCIw==
X-Forwarded-Encrypted: i=1; AHgh+RqwVy6rw64+Rh2gG5wo1tBqbD/fp3MfAyZY564IXwe9r8qF6VmEbGWTIUlCGK1z2WDpyz6k18QRn6EcSgV6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj3FJO95HAhOKJe5iFTGTvaAuAi+/6li37bihKVMVxUeZz9lBg
	SLnTElswCT33R9DYwFHmCrycU2G2p86qjA6xajuBzBf7NohNNlyDnG4R
X-Gm-Gg: AR+sD12mjrLAmiVqQ0sZrEBL5yUHEljlS5gCLagOwuCiqIoMCa/UIv61VfSpvBs9J8m
	3pI1hXd4AuiabCMBpb3iM7pt7W56nyGqT2K74L/DS2+jCQAbjLSso2kSVyyplREJwHd3IHYViFo
	znIvGw500hYuoatcHCePLO9Xzwqey5GVX4MH1+Xfxtetuvnq6Q+b0CbM1WHRwqOwYmU/lBjUJfY
	IFQD/B18bqtdkJa5of6DczaCRVcpWH1JbtgPJ+J9FAqQ37TtwMe7r+VldS+UKAPk/bryk/wq3b4
	vCTXUK1JBpb5l3tzu6GCt5S/Evh9Kun8pJ+JhSwvfxo9VxaiW7ckC5jWQ1+F1ZaxlztCqZA/fbj
	zNQp5rrT1JjH48nNrRnUVC2qzZiG1akf3Oi1lVY4gpQvlhKYsh8sHycsL4/DvXB0DHybFxupoig
	jVel0gWLQJ3/a2FYnCgDtNLms1xMp16Q3Cur8+OUbRJFzfgqxjvjYKqc5yQdxAqMuglKHDyLu+W
	5A=
X-Received: by 2002:a05:6a00:b44:b0:845:e8f3:bdd0 with SMTP id d2e1a72fcca58-84ebc2623b1mr1371121b3a.33.1785392821527;
        Wed, 29 Jul 2026 23:27:01 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea00507b0sm2503229b3a.14.2026.07.29.23.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:27:01 -0700 (PDT)
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
Subject: [PATCH v5 0/4] dma-buf: fix fd leak when copy_to_user() fails after fd_install()
Date: Thu, 30 Jul 2026 14:26:41 +0800
Message-Id: <20260730062645.233148-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAO_48GGxJj6AU6vsu-Y18WKtL_9RT=zsXWp3L+ifZdLM7CgGtw@mail.gmail.com>
References: <CAO_48GGxJj6AU6vsu-Y18WKtL_9RT=zsXWp3L+ifZdLM7CgGtw@mail.gmail.com>
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
reproduces the fd-leak scenario (mprotect flip between copy_from_user
and copy_to_user) and verifies the fd count is unchanged after a failed
ioctl (suggested by Sumit Semwal).

v1: https://lore.kernel.org/dri-devel/20260703080922.1838362-1-shoubaineng@gmail.com/
v2: https://lore.kernel.org/dri-devel/20260710105430.3059661-1-shoubaineng@gmail.com/
v3: https://lore.kernel.org/dri-devel/20260714114654.3885457-1-shoubaineng@gmail.com/
v4: https://lore.kernel.org/dri-devel/20260714114654.3885457-1-shoubaineng@gmail.com/

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

 drivers/dma-buf/dma-buf.c                     |  20 +++
 drivers/dma-buf/dma-heap.c                    |  80 ++++++------
 drivers/gpu/drm/drm_prime.c                   |   2 +-
 drivers/misc/fastrpc.c                        |  16 +--
 include/linux/dma-buf.h                       |   1 +
 .../selftests/dmabuf-heaps/dmabuf-heap.c      | 115 +++++++++++++++++-
 6 files changed, 182 insertions(+), 52 deletions(-)

-- 
2.34.1

