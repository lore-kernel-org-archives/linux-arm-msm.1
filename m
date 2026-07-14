Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC6738C43A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029629; cv=none; b=cNg2WHFdFVLK7urv7bv6j9NLDhJCiD1MSkNZ7mykqRhA9Ej5Aq8TLpa3PwHvHyCpTQSSn0G8Zs4kaJeBwlrRIidgEYTBsW97JA0nLlrRGcWW8Z4ch793EH7g7nLrjkMxMhu3VEt59uwmv46QX58hUnAaKNSBP+uww65xS2OnNJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029629; c=relaxed/simple;
	bh=X2wVqRoit1+4E3SJBgb2YLDCRJq7n5J1UWwaW8Wo32c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgKOnrmC2MVRLcoPQgNbRWlsee2SaziPbT0BGV6YYkPTw7IakSggKW052779P3Va1MNcIfwF0Urjx6wo07Q92tH16A00o2uduJGS+3T5WvNW0a8WIP4YKwyqtIjb33tla/c/SAwWuCUbJtXm6zDbyq/qWeH3pQEkYS2Q2/YzBtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArLxSAFx; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArLxSAFx"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso4051322a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784029627; x=1784634427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CQQ+xhhQTJIQk1G/3qoal2tftp25+Ya+e3y9IcyhICU=;
        b=ArLxSAFxkT8wPJ4FUtusvN4arssaKMGkBVoyTZkrkBNkQdaGd7icp9J+xwfvjhVkKz
         kMzGj9xygRiapIDXvDuaon7eB/jDOt6d5JH1pG2FgfygAqzVA78kO35gIld/z0quviN4
         8mJZaJbPMXGpl0Rt1Vhvvx5pqSIQvewd/lG1Tkh9Yd7DHUD1uDfKvLFco48N+TDiVY2f
         SGxoJEHUWSxpciaorcmUfE7eJZp9gzODwjmNXye3v1CBWUiWARAYkvLxo3UcpX1eU6Lu
         C/iKy/EAi+VJ715mQg7Mva4eQLF84hs6XtgI4xF318mq5vF7l5Tq4gL1XF39eljdjfaK
         f+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784029627; x=1784634427;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQQ+xhhQTJIQk1G/3qoal2tftp25+Ya+e3y9IcyhICU=;
        b=gWObj4fJeFTi0ZFEs+y1fniuEksuC56UTD5sWFSH/cIvxqudhzzVwkWNQhUvEqlxRg
         Aki8z36zLEogQHVJbZz0T3HVA4DofuiRG8xn8/sYRAkk0Xv6Cc6u5OK1b7yIHyoDXl1+
         ynymREw4JvzFXZV4cyGCwvtHeWeFj3HDZFS02AZpCz0gSAEPydL3I3aoxCkCg1X5puyL
         Gl8HQZeWs68+LRqMVSRl129QAWeePaWMYynS9LmlTWQpWG6SqJt8NO+cikGrKIk9ukEJ
         yEw4XEGY1WJD8FzOgbjzPPHjGWsgrP2ftN4MqtuK9Y6Sihei+3m57Cuqgpnb605+mF9k
         1t6A==
X-Forwarded-Encrypted: i=1; AHgh+RrmEqmqif1eCyy2iFr5MfTqq0sxRu1WuYSdVD7Y3TwoN9T3CBtLUMDsVOiJBTKQF1HBABbQ89CwSasi8j/L@vger.kernel.org
X-Gm-Message-State: AOJu0YxsvvKL+aXmYLzbyixpqnJPw5OESL+wC/gBY7GH1ixn+QPnc/LW
	Xzq0KTPTZ8kEx6Kf62QEuq69RUKCLxPMEPbjVjbvsgMYDN40FwVKoDuh
X-Gm-Gg: AfdE7ckZ0ypXpsjqrZqrC558XsGJSHZzA+/Zwn+gz367Je6GI3aoRRsiiyioScYb3QE
	Z8mr5M1qDgb0ypBxSGNNE6Ki44bqF438kdaX8u8USy1pWwASNYMWWQPCRUh+NXD9yvyoMw7njvL
	GrO6hVfICWkU06x5ZWS57vgWbkgOtsZX6xE8XMgVbgsObVyPznltFgUkUPheijj0256DMYPyR41
	HCk/fyJd6psxZeJ85RzlELA5WP2Ge/BYnLxWsXuzYaXXahvg3b7rppfLGYWu8OaKKgXkHelHGSQ
	FsygBfxGHLn4M6wvF9EITVXCCqrJ95r/0brrtP+SwDTMz+iEzT1P1yh2xk6WlFGHsQ5Wzrg2aoI
	vTkcwNpiKWq45d3QYZBWLNquAiMtV5q39gnPM65UPJQKeR6W6FkCQrJLlDCqc5qs7zfN26a04El
	hfHXh8SnNi4EsUJnxN
X-Received: by 2002:a17:90b:2c83:b0:380:f34a:6ff1 with SMTP id 98e67ed59e1d1-38dc75eb657mr11649534a91.17.1784029627050;
        Tue, 14 Jul 2026 04:47:07 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e17470008sm1356162a91.17.2026.07.14.04.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:47:06 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Sandeep Patil <sspatil@android.com>,
	"Andrew F . Davis" <afd@ti.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: stable@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH v3 0/2] dma-buf: fix fd leak when copy_to_user() fails after fd_install()
Date: Tue, 14 Jul 2026 19:46:52 +0800
Message-Id: <20260714114654.3885457-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
References: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
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

v1: https://lore.kernel.org/dri-devel/20260703080922.1838362-1-shoubaineng@gmail.com/
v2: https://lore.kernel.org/dri-devel/20260710105430.3059661-1-shoubaineng@gmail.com/

Changes in v3:
 - Split into two patches (dma-heap + fastrpc separately)
 - Add dma_buf_fd_install() to preserve trace_dma_buf_fd tracepoint
   (spotted by T.J. Mercier and sashiko-bot on v2)
 - Add fastrpc fix using the new helper (suggested by T.J. Mercier)

Baineng Shou (2):
  dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
  misc: fastrpc: don't publish fd before copy_to_user() succeeds

 drivers/dma-buf/dma-buf.c  | 20 ++++++++++
 drivers/dma-buf/dma-heap.c | 80 +++++++++++++++++++-------------------
 drivers/misc/fastrpc.c     | 16 +++-----
 include/linux/dma-buf.h    |  1 +
 4 files changed, 67 insertions(+), 50 deletions(-)

-- 
2.34.1

