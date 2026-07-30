Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140813AFD05
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392834; cv=none; b=eEwTsni2P98OZ3BfEZlJigE1u8Xw4cGWmq3dgqMJyu2iRgrlqdQkJNoBfnZbuZGnKTDLV+aLltx2ohSAhyU+PFDOaD87as0m7/2Rl7A3d7jwQqnFTypRzDV9VU1sR+/r+l5oyPnIkpf8phgrMxUaSZFLvsPrnGmaUtWEQKdePQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392834; c=relaxed/simple;
	bh=lb5lsOeFj44VvYqr0e5zyDhlpbvgh8japzWZ8lWhj9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nkNaVPAxLhpWXUd6HUkpZai9X2/EUxeaF9o81F7Y7H3u33N4x+4j3VWWbmntToMZhqugsdJoVJ2+/gSiy+lR2NzkbBsWvO4Jn9UNfHkNVSw0t/TFc72q9celigWzSxXG1fgl0zkWYOdx0klCgTJ3hgEaVoCKd2e/1usH8LFY9Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfpsrq+g; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfpsrq+g"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848743155bcso707457b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785392832; x=1785997632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8IRM8cZuTQT295+YDoKUSZ1109m/5RG3rOLisZSSj50=;
        b=cfpsrq+gDbduJsNAp52zgxCThAvbB3c3uPVibTJJrPklaMXsnXZhWZiw3ajsb6arnf
         +095D68HWb6BgHwN32cchivHyR3iDuyR+T3LvfmL5cQqwxl7XSQVxz8Ex0Juk6Mvm12p
         0OIOSjkijMCAuVyaBMdZOmfeOFhE+bp0eZkcms42ffAMb2JLo+jfEFxMoH4x/IzIXoBH
         jRBihIjSo5Hp8tfEZHei1P4ta6uxV2w2ZNVCj/whxhx6SJygYDXjwxEA7Q9ngm+nDHNm
         ir5MScA3YkaFCn8JziFnm5ursiAEumWx2Wrh1/dBVhd1WyMj5yue1mej/GNPPwLTg0UR
         kUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392832; x=1785997632;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IRM8cZuTQT295+YDoKUSZ1109m/5RG3rOLisZSSj50=;
        b=Sy1uIF2iogEQ1Zk5K4bes/tyLlCWZPiMCDh0KZQwNiX/hZxeWhZWj3Es7+IVNhBdcJ
         Buz+0OIF9uBMi2k9jkcc9PKX4KrFMgDo0R19yCbv+Dj3Rz8W9ACdfK7vRDqAiEKJX2mi
         GElyKwDH3nVg78ANaVrThoVZioNU+S5I4kJ/GDhbi7cceqYUK3W/BRd15E6zh2yIiwCO
         QFio3bX8b46LkKZwjk2DQRlFHZx9jR0HTXIC1O5tPnoRJjgfGwViDzx9s7EpClc6X4uj
         4fMcgzGK7I214MgKUroosODiqLcsyOe4XvprpJaum+xL6ZgdEw++mWr1PvfXDVqMzgii
         lM7A==
X-Forwarded-Encrypted: i=1; AHgh+Rrc8MwRTQnz+nrGp+2ONrSn/qVSHl4WbT8D6btyXIIYaX3C+iYlyde7RofchPZYXOnpGJhbq3Z194D/qTia@vger.kernel.org
X-Gm-Message-State: AOJu0YzWG7deDTgEuujS2DEIT/T+Aoqwq6gk27PQpYr59h5d5euiOu2s
	dT1xOF3YU/nysr0cjKaL1HWxZywK55PpjqG55JuvcMmlknhy5sS8tWgP
X-Gm-Gg: AR+sD10JzjiK1VOI02OA7c7SM2l1Cv3Pfzd8CbCA4cs7SLGBQg1tXjaVA8+tsGGlk9/
	CQ+6vmtYpCr/0nEqkI6RIWo/bv2X+tvgTFAcYEI+5WxjyGYJbrC2L24GQHRXYI5ExFua7uxDDFw
	x6cPGSx4lnziPMEJFE0HerM7seEVlpM3jkSsw3q9Az8ROBwOJEqTYpyB4HyAVVbHmxuIYj/UJ5R
	NkgYqStC/dDg32KtLMyt3tqiehwgMLdfgByR4k4Qw0Zv5XEFwBYVffw/o/xVtyEu1hMi1f1UJzy
	k/nhfNMdnU0JvZlkV1v3HIUTbkO91RaOrI5iVfGtT9EovyM4oA0LriEXBqIWCxzsGRNDZOoghFd
	OwJJ0h473M6asEBk5zGNZAvhbTZXDOGNkEOAf0fags4TtO13dd9I8qF+IdGc6cKzSk3AeHMQsUN
	9+0xhUJf6WePpXHX38pvPhqEMMg/COqnUUKJY+YdakGLmr+zVICdoOQURN9ebb+RMX
X-Received: by 2002:a05:6a00:1d27:b0:847:9c3a:b77f with SMTP id d2e1a72fcca58-84ebc3eb0b9mr1408626b3a.35.1785392832414;
        Wed, 29 Jul 2026 23:27:12 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea00507b0sm2503229b3a.14.2026.07.29.23.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:27:12 -0700 (PDT)
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
Subject: [PATCH v5 1/4] dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
Date: Thu, 30 Jul 2026 14:26:42 +0800
Message-Id: <20260730062645.233148-2-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730062645.233148-1-shoubaineng@gmail.com>
References: <CAO_48GGxJj6AU6vsu-Y18WKtL_9RT=zsXWp3L+ifZdLM7CgGtw@mail.gmail.com>
 <20260730062645.233148-1-shoubaineng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

DMA_HEAP_IOCTL_ALLOC allocates a dma-buf and installs an fd into the
caller's fd table via dma_buf_fd() -> fd_install() before
dma_heap_ioctl() copies the result back to userspace.  If the trailing
copy_to_user() fails, userspace never learns the fd number, but the
fd (and the underlying dma-buf reference) are already visible to
other threads in the same process and are leaked for the lifetime of
the process.

The obvious "close it on the failure path" fix is unsafe: once
fd_install() has run, another thread can already dup() the fd, send
it via SCM_RIGHTS, or close() it and let its number be reused, so a
subsequent close_fd() from the ioctl path can operate on an unrelated
file.  This was pointed out by Christian König on v1 [1].

Restructure the allocation path so that fd_install() is the last,
unfailable step of a successful ioctl:

  1. heap->ops->allocate()      creates the dma_buf.
  2. get_unused_fd_flags()      reserves an fd number in the caller's
                                fd table without publishing it, so
                                no other thread can observe it.
  3. copy_to_user()             delivers the fd number to userspace;
                                on failure the fd is returned with
                                put_unused_fd() and the dma_buf
                                reference is dropped with
                                dma_buf_put(), leaving no user-
                                visible state behind.
  4. dma_buf_fd_install()       publishes the fd and emits the
                                trace_dma_buf_fd tracepoint -- from
                                here on the ioctl cannot fail.

A new dma_buf_fd_install() helper is introduced in dma-buf.c to wrap
fd_install() together with the DMA_BUF_TRACE() call, preserving the
export tracing that dma_buf_fd() provides.  dma_heap_ioctl_allocate()
is refactored to return the struct dma_buf * directly (returning
ERR_PTR on failure) so the caller holds the dmabuf reference across
steps 3 and 4.

The failure at step 3 is easily reachable from userspace: pass a
struct dma_heap_allocation_data that lives in a page whose protection
is flipped to PROT_READ between copy_from_user() and copy_to_user()
(e.g. via mprotect()).  Before this change each such ioctl leaks one
dmabuf fd; after it, the fd table is unchanged on failure and only
/dev/dma_heap/<name> remains open.

No UAPI or heap-driver interface change.

[1] https://lore.kernel.org/dri-devel/175e98de-f414-47d7-81c1-c0fe0a8f7f62@amd.com/

Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
Cc: stable@vger.kernel.org
Reviewed-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/dma-buf/dma-buf.c  | 20 ++++++++++
 drivers/dma-buf/dma-heap.c | 80 +++++++++++++++++++-------------------
 include/linux/dma-buf.h    |  1 +
 3 files changed, 61 insertions(+), 40 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d504c636dc29..4c9add51f9ef 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -803,6 +803,26 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 
+/**
+ * dma_buf_fd_install - install a reserved fd for a dma-buf
+ * @dmabuf:	[in]	pointer to dma_buf
+ * @fd:		[in]	fd reserved with get_unused_fd_flags()
+ *
+ * Publishes a previously reserved fd into the caller's fd table.
+ * Must only be called after all fallible work (e.g. copy_to_user)
+ * has succeeded, as it cannot be undone safely once called.
+ *
+ * The caller is responsible for having emitted the trace event
+ * (via dma_buf_fd() or get_unused_fd_flags() + this function)
+ * before calling this.
+ */
+void dma_buf_fd_install(struct dma_buf *dmabuf, int fd)
+{
+	DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
+	fd_install(fd, dmabuf->file);
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_fd_install, "DMA_BUF");
+
 /**
  * dma_buf_get - returns the struct dma_buf related to an fd
  * @fd:	[in]	fd associated with the struct dma_buf to be returned
diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index a76bf3f8b071..43c32fb28313 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -55,33 +55,6 @@ MODULE_PARM_DESC(mem_accounting,
 		 "Enable cgroup-based memory accounting for dma-buf heap allocations (default=false).");
 EXPORT_SYMBOL_NS_GPL(mem_accounting, "DMA_BUF_HEAP");
 
-static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
-				 u32 fd_flags,
-				 u64 heap_flags)
-{
-	struct dma_buf *dmabuf;
-	int fd;
-
-	/*
-	 * Allocations from all heaps have to begin
-	 * and end on page boundaries.
-	 */
-	len = PAGE_ALIGN(len);
-	if (!len)
-		return -EINVAL;
-
-	dmabuf = heap->ops->allocate(heap, len, fd_flags, heap_flags);
-	if (IS_ERR(dmabuf))
-		return PTR_ERR(dmabuf);
-
-	fd = dma_buf_fd(dmabuf, fd_flags);
-	if (fd < 0) {
-		dma_buf_put(dmabuf);
-		/* just return, as put will call release and that will free */
-	}
-	return fd;
-}
-
 static int dma_heap_open(struct inode *inode, struct file *file)
 {
 	struct dma_heap *heap;
@@ -99,30 +72,42 @@ static int dma_heap_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static long dma_heap_ioctl_allocate(struct file *file, void *data)
+static struct dma_buf *dma_heap_ioctl_allocate(struct file *file, void *data)
 {
 	struct dma_heap_allocation_data *heap_allocation = data;
 	struct dma_heap *heap = file->private_data;
+	struct dma_buf *dmabuf;
 	int fd;
+	size_t len;
 
 	if (heap_allocation->fd)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	if (heap_allocation->fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
+
+	len = PAGE_ALIGN(heap_allocation->len);
+	if (!len)
+		return ERR_PTR(-EINVAL);
+
+	dmabuf = heap->ops->allocate(heap, len, heap_allocation->fd_flags,
+				     heap_allocation->heap_flags);
 
-	fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
-				   heap_allocation->fd_flags,
-				   heap_allocation->heap_flags);
-	if (fd < 0)
-		return fd;
+	if (IS_ERR(dmabuf))
+		return dmabuf;
+
+	fd = get_unused_fd_flags(heap_allocation->fd_flags);
+	if (fd < 0) {
+		dma_buf_put(dmabuf);
+		return ERR_PTR(fd);
+	}
 
 	heap_allocation->fd = fd;
 
-	return 0;
+	return dmabuf;
 }
 
 static unsigned int dma_heap_ioctl_cmds[] = {
@@ -138,6 +123,8 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 	unsigned int in_size, out_size, drv_size, ksize;
 	int nr = _IOC_NR(ucmd);
 	int ret = 0;
+	int fd;
+	struct dma_buf *dmabuf;
 
 	if (nr >= ARRAY_SIZE(dma_heap_ioctl_cmds))
 		return -EINVAL;
@@ -174,15 +161,28 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 
 	switch (kcmd) {
 	case DMA_HEAP_IOCTL_ALLOC:
-		ret = dma_heap_ioctl_allocate(file, kdata);
+		dmabuf = dma_heap_ioctl_allocate(file, kdata);
+
+		if (IS_ERR(dmabuf)) {
+			ret = PTR_ERR(dmabuf);
+			break;
+		}
+
+		fd = ((struct dma_heap_allocation_data *)kdata)->fd;
+		if (copy_to_user((void __user *)arg, kdata, out_size) != 0) {
+			put_unused_fd(fd);
+			dma_buf_put(dmabuf);
+			ret = -EFAULT;
+		} else {
+			dma_buf_fd_install(dmabuf, fd);
+		}
+
 		break;
 	default:
 		ret = -ENOTTY;
 		goto err;
 	}
 
-	if (copy_to_user((void __user *)arg, kdata, out_size) != 0)
-		ret = -EFAULT;
 err:
 	if (kdata != stack_kdata)
 		kfree(kdata);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index d1203da56fc5..d15b2b31d3c9 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -567,6 +567,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach);
 struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info);
 
 int dma_buf_fd(struct dma_buf *dmabuf, int flags);
+void dma_buf_fd_install(struct dma_buf *dmabuf, int fd);
 struct dma_buf *dma_buf_get(int fd);
 void dma_buf_put(struct dma_buf *dmabuf);
 
-- 
2.34.1

