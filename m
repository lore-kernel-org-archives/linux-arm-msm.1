Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449763AEF55
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392764; cv=none; b=Gljwxacdr4M1zD2brkI7Z0X9Dm+x2xD6ObIVr1D9elvGU20/PR2rrpN+7wxEeoTj9P92yWedP80DiosPmxLbiSiDyPvgiXj2zhkuZFlulcB5i0s7WNK5T/QcrYJ8drEatAbePEVPEprhht7STuRHguykpyxJv3W68/WMPHG1RNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392764; c=relaxed/simple;
	bh=F9WeV/nxAP6fHlwe0aqZ4cby4GCtvCwnHIr/wOKq+vA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VvOTIuUZ6QIpJo2fhw+6IS10ETT7XTpAwdUpSHxD2zQElQewB2axSDSCP7zg0AGjmStwYYlgGZSBBNYrRn3ZAl35u1bWbwh3qm4UF6eRJIRN/k8y00wX+CNKVV1Oag/S4uCK0xu3OnSfCH1vnMvWIeze4mgXH7fIJQUJQRLwTbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4OaBjJW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4OaBjJW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cace91f112so20776675ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785392761; x=1785997561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lC5eDEn/dzL9Eec299VWkBRGUg0dXbB9NQvY7s3O+kI=;
        b=M4OaBjJWIl1OOG+wWy+7/Y2SLcH3zBCcmsPxLjXmGIoemzYHjxChQMhlfNcxkn5TFX
         fP4pkZO8uwdHhhON2vTeBKojN/RohJTNq75ZhiVZMSS3N5ojtA2KzT3dZ/EcCeP0/cPd
         m/aU9TiZJNStGIyEnB8BLslVDADVU0m9MgrnnGWK1OcBVSu7DnkH5xDQbIEU1eYDXum2
         FHZaXUaFaN0M8cD5Ry8gknXO+TB+5vnZqL/12ULLO7Pz02WJToFp7pOPoM8D/z9l9/DP
         zvDqN+LyS7KXgi/LwVLn+E824gpMuQxLvemEncLJT2PNEg5XdkpkalQO3BLUwGV0IjLA
         VRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392761; x=1785997561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lC5eDEn/dzL9Eec299VWkBRGUg0dXbB9NQvY7s3O+kI=;
        b=L9eh1kLVaPvBAZimzQnIjTsibPJmKAMqjaSdDWC17CXEoEQzw8Rvf4IQOlXlCP+yfg
         MyxhTLfPVCDkxkkWffTDgbY6AJPYTw+baRrt+V0zcHe1sJOoCZoKpRtbewZDHGIMdmEs
         9z+Uw5DehLLCejSe154+EWkd53NltAI6PxdckHdwkgvejAAqIs3jWeRFw0GihgAFiuVe
         gc2ExFBFjDayo0gDVP2HbaaFN5vrhW/+oX2vzxN/LgXI8uJja+RQuoJpAHVdrGq9kZTy
         FNASyQsAlcCW1vMqkmN9Wexd6UeXBQq93sRGNxBPs4TWkZaYobobA4F2eXzwWSCVGEVS
         X/JA==
X-Forwarded-Encrypted: i=1; AHgh+Rpi6+MwBJe9C5rm1dM+eBl2WQQ0tOtH5tYWmKAIhA4/AVeZRvnA99+k2H07VUPkAyv+uS/+dZcTIp8c1/u4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4K2arPDBmUk8horeNF+2i01j6aV+Mm3NRtIzg04IoTbotx8nu
	NUQCWPX+JXXIEDJoFIV6ApjdIDJJV9PJdjMjet16+92oezA2PYTjqYO+
X-Gm-Gg: AR+sD11fv1fPi5EoIRLHIeDJiHL9nAmVJ3P8YLxKqLQOFOMXCf1LfNCrLdnwAStgAxW
	6mji1W7GcdT5RcbgdCnflJBmnOAaghJciwJ/udaD1wrjsiHDFnDnVoTPGfUHsPWLfjSWekmbPjB
	Ysg5DWJ3pxB7MnV9RjSWOQqQTL5yNxZYet6OCLIw103I2i381PLT/PPDeWqXRffLmhD/a1Zw2Yk
	oVcomM3d/h2sRh3T4OwneNTpTz4pNZO/JdU7TpYi5H3he0n9SOKCJ1TeqzRYVVHRwXB3UG9ga8l
	CIAXqcl8iEe3XPriBdB75dQWja0cHblY4mTrRHuVLtY4c69URyaqyMySPsjcYfW4V6ykPsOSMpU
	PxyOabVPPuK8ZF2KxwnQ/hbJT73DehuG6H1AM75FM4elRV5v3H7DF9XNegY++s4bLF0iVHVLptu
	zf31mPsj4FyWyUjh1/UgcT3QRAa11z6ckOVkr11LGu8uCH5LpRJeFyZSnkJOL0vJH+gCz1O5MFt
	KE=
X-Received: by 2002:a17:903:238e:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d035c1c8abmr13935955ad.5.1785392761489;
        Wed, 29 Jul 2026 23:26:01 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc9bd4sm21059695ad.48.2026.07.29.23.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:26:01 -0700 (PDT)
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
Date: Thu, 30 Jul 2026 14:25:44 +0800
Message-Id: <20260730062548.231239-1-shoubaineng@gmail.com>
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

