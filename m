Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AF9314A6F
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786943121; cv=none; b=rwHvpNkuvERDaFsYuCHAuP4G/HnSmw4O02JMhUo3NBVDiLZakAvUsdWDOQihe9BnihFP8QsTX/yRNku4q/7VxPhC++gDVQ2MZ+K4ygM81ulX5/3nKWQQ6MD29dS5MRoj12/D9D1/ixVZkgPRKK6bMzffZ8GMatb71Yjaqac+aAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786943121; c=relaxed/simple;
	bh=ErYC+NBUB1uSMVe7dsSUwt3ETggiJBFdGT3p09rSUlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MOio/ItZykwtS992yoMuLqi6L1XeteuRQ1onFYkKXow9FHwGzlhPHOs68uoKWKbWxDpGH+yJqeqNt7+JpwHzbJPF8vLL9hzJTYyyfkMJFMDwXSWkvE6aPdSBJrBpqjA3ERaNgq45V2UTr0jyvS2RuXp1mRD8tIqrYV7jeMLvidY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2iYdAev; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2iYdAev"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso2923220b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 22:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786943118; x=1787547918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wA2XmPl+hovwGxL3ai/U+yA7AWOU/owR4IcUEcMXDYY=;
        b=O2iYdAevYt5f4khFQNgP5bu5iMekzcpaFVoh/eGfulEMTn9UNF+KYNGAj56vk/Xe5J
         uOOqtzH0EO6K7p8vNfUw9vJWjI/iHDdhutTGn/6TjBk1+WPzXKvgDVijfWZZBruDW4tR
         nkMWI+ZGTIV3paoQSx9VO+ExdUsk3Qrq9vn3DnRlS9mrNyNM7ynhOx1ClzwwlaNY90w9
         RB5dg73VoVq7hJs4DkKG2nQMvrHPNYxqdxCe0l6aIcFQNVNgkirANDhegr6HaKDjeaPw
         PGrcJ85cMgQamjtj6dErJWJoJ/339Q8MGelQnQYEvPbEl8D0pDsCaqEpJHsXVXv50CwL
         dB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786943118; x=1787547918;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wA2XmPl+hovwGxL3ai/U+yA7AWOU/owR4IcUEcMXDYY=;
        b=gf8h3rQOgq6jw8iYZtDXjVjMbZDz11D+i49D3viS+BPbHawHh0TK5S5hbZFhft8OHv
         1C6c+DjleuZS9WpuTXF8BR49zFrMArbulyPQw3kYXZdJnTUl1fXb6IAzWogKvKAMtNG0
         UYX23IOli5DeCd1CrkCQifnEris1OKZ8zfdXBV2HUMaTW71jxrUSrBWJTACdsDUXnWQq
         vyufIxnOvOuYzClgDaBvTqd1NdZFXBfkvOt9gIJQ0VMZHKN0Qnj+ojF+ZixovumCgji0
         CEryatoFe9M3EB2wk1bB6zv1U2bRRGMR/Rb+UlY6L26fBkRLrtt3UFhVIIU8T0f4zlPl
         t2Wg==
X-Forwarded-Encrypted: i=1; AHgh+RrTU5ijpjVWI9gNYudUbsdKW5HUC9y7a8oVJHQnupGazR/xmEJHFiHFin80Nfmf+UF2IusHc3t6rYihAo4C@vger.kernel.org
X-Gm-Message-State: AOJu0YyPmWh7/QqEDDcxQ958LUqAr2Z8d+ixKQ8O9p5T1uYOHQzUzTjx
	4wSBqHQzqKORCWNuIyIeU+cbGoe9Npy76bHYmI9oZ6TL09tVHYJwtKep
X-Gm-Gg: AR+sD13FYHuduzjIfHjQrypSbAz2bPFhywWR5CN+PietY2/c7+B58Ro+fGLMGU2Kw7o
	EdAFjHPqONwIbXw8fRbpEciUW9KizuQrHOaK5z6ooeYc4D9UgzQrWBk4FIxVxVjwt+HW3rLd0ir
	+fCnq4sVMvebt5WN1hz38IYl56Se/Q5OVV42IkEKFPm8ym5oL0G5jygNDLrLOtqCgw6lvVganDY
	TEQeF32HYQxWqvH0YA9jb66scdlnvBeoOsXPuLcJs9scdA5wd7n9RVc59FOSJpcAFyuj544cO8E
	YLtGvcQSrl9SO3ZHrpNvi4AWZfQ01Ml/dh6jeJk9+SvZYdEbfA1JVCho4IJ5XT46ZX3II8mcV5t
	tH+axM6q+8vJ6nlRou6D5iuqKIZ/vzpqQO9hAexxQVZzbOPSGD52DvsXPRYKekmYkxirQ5sN/R7
	v3QHLRX9oQDawUmQocHIVYSRH4rjImnVReD+2Xakz/5cvyhkIkWLjX/O0yIc8t5+P1
X-Received: by 2002:a05:6a00:94fb:b0:842:5da3:9b89 with SMTP id d2e1a72fcca58-84fde3e397cmr21923062b3a.38.1786943118310;
        Sun, 16 Aug 2026 22:05:18 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d267310sm2131036b3a.53.2026.08.16.22.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 22:05:18 -0700 (PDT)
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
Subject: [PATCH v7 2/4] misc: fastrpc: don't publish fd before copy_to_user() succeeds
Date: Mon, 17 Aug 2026 13:04:55 +0800
Message-Id: <20260817050457.1005285-3-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260817050457.1005285-1-shoubaineng@gmail.com>
References: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
 <20260817050457.1005285-1-shoubaineng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fastrpc_ioctl_alloc_dmabuf() calls dma_buf_fd() which installs the fd
into the caller's fd table before copy_to_user() copies the fd number
back to userspace.  If copy_to_user() fails, the fd is already visible
to other threads in the same process but the ioctl returns -EFAULT.
The existing comment in the code even acknowledges the problem:

  "The usercopy failed, but we can't do much about it, as dma_buf_fd()
   already called fd_install()..."

Now that dma_buf_fd_install() is available (introduced to fix the same
issue in dma-heap), apply the same pattern here: reserve the fd with
get_unused_fd_flags(), attempt copy_to_user(), and only on success call
dma_buf_fd_install() to publish it atomically with the tracepoint.  On
copy_to_user() failure, put_unused_fd() and dma_buf_put() cleanly
unwind without any user-visible side effects.

Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
Cc: stable@vger.kernel.org
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/misc/fastrpc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f3a49384586d..c5143cd25767 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1709,24 +1709,20 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	bp.fd = dma_buf_fd(buf->dmabuf, O_ACCMODE);
+	bp.fd = get_unused_fd_flags(O_ACCMODE);
 	if (bp.fd < 0) {
 		dma_buf_put(buf->dmabuf);
-		return -EINVAL;
+		return bp.fd;
 	}
 
 	if (copy_to_user(argp, &bp, sizeof(bp))) {
-		/*
-		 * The usercopy failed, but we can't do much about it, as
-		 * dma_buf_fd() already called fd_install() and made the
-		 * file descriptor accessible for the current process. It
-		 * might already be closed and dmabuf no longer valid when
-		 * we reach this point. Therefore "leak" the fd and rely on
-		 * the process exit path to do any required cleanup.
-		 */
+		put_unused_fd(bp.fd);
+		dma_buf_put(buf->dmabuf);
 		return -EFAULT;
 	}
 
+	dma_buf_fd_install(buf->dmabuf, bp.fd);
+
 	return 0;
 }
 
-- 
2.34.1

