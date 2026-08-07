Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6375741DDF7
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 10:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097548; cv=none; b=BzlLFP7KKr9dYQ7Vuc8mEI95sNTumdFqH9MLzd7RIbS2L6kqk2Yt+wTduMdmGJmSrYUtNEVzVtrQQfzaIF4/YA7UAJ0iAekH4vDfBgY0OO5UQjv9C38X8IxgE3jTu5ZgWYeXP5FxJmvNSZ15ZpauYk/3D+D/EtKA0qqfDfpC8g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097548; c=relaxed/simple;
	bh=F1UzQeZHsiabgRSoKYgZ6x2SoQv1aOF17+66tpxhGm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Avk3R+OImv84DiEJXBJ4ySABdPE2f9n2Dl/SXduGooIVgHVVt5tHpjqTDKLfAl/9Jop1/EmFUaJMT6N1iGLuvy6hNE52JhuHi/LUUlWatkudy8NDhZF31vhTRjv5GGcGwLRo+vieUZ8Nh7ZgyifjkYnOk0FVJa0FUUKivPACh54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+UAkjmY; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+UAkjmY"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84eb992a881so2869413b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 03:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097547; x=1786702347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1QPAle4B6UVEoKy/UvltvjtFmYUt6krDcEVyTwixgM=;
        b=R+UAkjmYQVwAFPG/XsDDKTicbg2ber+BJXst4QUEEcglLGxzmaLZ2eh70Ke6b39D8n
         gNTdaRXw0hOTbc227iBaKwE0rt3YGJPj2pMchuFwTJyXiBooqyBuCiSAaSIxokSu7g3D
         ND9NDcZsi2087K4qhwpt4iOa83ns5uvjgIspETrhX/hUrsjSqx0KmTgFSWrWYmf6jwNF
         c4xQQsarmmL2nBp/0G+ALhmfUEhTLKeb5YixerbyXVC93ge0iIiQbyBOgD9/0zhTQcT8
         cFQ5tTqb2Rug+fb2JNyaQueDucVoveEQs+UmBupD2qshTb065ALYnOin/Uo30LUu1s00
         LvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097547; x=1786702347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1QPAle4B6UVEoKy/UvltvjtFmYUt6krDcEVyTwixgM=;
        b=dzJ6//ecuNWTcEDdCXAT3RMDx8eplisqyRTqhtlMauyZVqTqHWPG6V5PAzKGRUcddK
         29VUghu4iCFjm8phrY/o3Nf+FzoXPucCRbpRSQFsZCdpJ7cENbPePDpUqmurIOlyt53Y
         +lRQ77UY6qimtR20PPYizYonzIn34FPfqjz5WI5AzUDMfloFVPDbxDfP6r52FsL2sTdu
         YJFlRcaZRcB14twLzgPL0E3h92qM1KPjCyFYwQ3IQ8TsZve1Mrwx1yJ3ciOkHKN6+YWV
         8ZSJ0w84MLcj2W9OooSHg2NO8jzWjR99uYBiY7YUmkM2gaVsv0KSyiPj3im34/3dyD4Z
         v/QQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8/6g1oRom9QBA2h1UovtEWSTf/+f/VLpBO5HNuYplLUW30RAErQ6JgHIDSqA96nF35D7RYqVB0nlQkbXr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb00G2WmoG7h4FPrHQIYEaSYOeGu4xBPNFpJL1exs+KNi8rJ6T
	q/i5nJAFC/fEjtXsRKMQ8A2WgZA/YV/cfC+H7yY0FTaWtad6HfEn2345
X-Gm-Gg: AR+sD11bUgHApnSJdDrPP2AkbEfNb04kMtFirpuNE+wkzTFkZ6y1jwY4fETBajrSmhV
	TUDgOz6IARakEwNI3qAFKnUFkO27NvXjE9MY/M67j/UIxfNVcsFc7/bfxl6ndYSjPUiJ+YGs3u0
	VCZuCCdNhORsEUsQkI6l05Yyh1+e1kTVUhKmae2qxQEnctt6sS2rHzaa6AOY4wP4FXRrru4v1JG
	TfVNUtDRhDqcxjxK8Pmxqi6/jEd2/01IrF4X0rpZox0lMedDAio2MHWu/lsBl8eBRsghdAUAQzl
	nHmXcz4xyVblKz2GqNCxEduA5PcTTqBFbxdyusS1j0RWX5G3BMVkvNYwAXY+w45Gbd1yZKkX+y9
	/RPHlHBaDl0LdNJg1ie0wlTuuJdAwfj9D3leeV6nrAzLqR/hYk1Af3OLDZUC04LY8Ydl1y6n/Wy
	rluRVZZWxmHAkdYz5JJaQRVWXuCYfnyI/lSA5g4Z7R0dNd40aLUWqVOE+aj0OoRzCa
X-Received: by 2002:a05:6a00:ba06:b0:84d:ff47:fa53 with SMTP id d2e1a72fcca58-84f4fd9f842mr10114159b3a.2.1786097546501;
        Fri, 07 Aug 2026 03:12:26 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5528adsm797510b3a.45.2026.08.07.03.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:12:26 -0700 (PDT)
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
Subject: [PATCH v6 4/4] selftests: dmabuf-heaps: add fd-leak-on-EFAULT regression test
Date: Fri,  7 Aug 2026 18:11:40 +0800
Message-Id: <20260807101140.1357218-5-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807101140.1357218-1-shoubaineng@gmail.com>
References: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
 <20260807101140.1357218-1-shoubaineng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test case that verifies no file descriptor is leaked when
DMA_HEAP_IOCTL_ALLOC succeeds internally but copy_to_user() fails
to deliver the fd number back to userspace.

The failure is triggered by placing the ioctl argument in a private
anonymous page and flipping it to PROT_READ (via mprotect) between
the kernel's copy_from_user() and copy_to_user() calls.  With the
buggy kernel the ioctl returns -EFAULT but leaves an extra open fd
in the process's fd table; with the fixed kernel the fd count is
unchanged.

This serves as a regression test for:
  "dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds"

Suggested-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 .../selftests/dmabuf-heaps/dmabuf-heap.c      | 113 +++++++++++++++++-
 1 file changed, 112 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
index fc9694fc4e89..1d49df671919 100644
--- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
+++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
@@ -390,6 +390,116 @@ static void test_alloc_errors(char *heap_name)
 	close(heap_fd);
 }
 
+/*
+ * count_open_fds - return the number of open file descriptors.
+ *
+ * The fd opened by opendir() itself is counted, but since it is opened
+ * and closed within each call, it cancels out when comparing two counts.
+ * Returns -1 on error.
+ */
+static int count_open_fds(void)
+{
+	DIR *d = opendir("/proc/self/fd");
+	struct dirent *de;
+	int count = 0;
+
+	if (!d)
+		return -1;
+
+	while ((de = readdir(d)))
+		if (de->d_name[0] != '.')
+			count++;
+	closedir(d);
+	return count;
+}
+
+/*
+ * test_alloc_no_fd_leak_on_efault - verify no fd is leaked when
+ * copy_to_user() fails during DMA_HEAP_IOCTL_ALLOC.
+ *
+ * The bug: dma_buf_fd() called fd_install() before copy_to_user().
+ * If copy_to_user() then failed (e.g. via mprotect), the fd was
+ * silently installed in the fd table but never returned to userspace.
+ *
+ * The fix: reserve the fd with get_unused_fd_flags() first, attempt
+ * copy_to_user(), and only call fd_install() on success.
+ *
+ * We trigger the failure by placing the ioctl argument in a private
+ * anonymous page and flipping it to PROT_READ before the ioctl.
+ * Inside the kernel, copy_from_user() reads from the page (reads are
+ * allowed under PROT_READ, so it succeeds), but copy_to_user() that
+ * writes the fd number back faults, returning -EFAULT.  We then
+ * count open file descriptors before and after; with the bug an extra
+ * fd is left in the table.
+ */
+static void test_alloc_no_fd_leak_on_efault(char *heap_name)
+{
+	int heap_fd = -1;
+	int fd_before, fd_after;
+	int ret;
+	long page_size;
+	struct dma_heap_allocation_data *req;
+
+	ksft_print_msg("Testing fd leak when copy_to_user() fails:\n");
+
+	heap_fd = dmabuf_heap_open(heap_name);
+
+	page_size = sysconf(_SC_PAGESIZE);
+
+	/*
+	 * Place the ioctl argument in its own private anonymous page so
+	 * we can flip its protection independently.
+	 */
+	req = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (req == MAP_FAILED) {
+		ksft_test_result_fail("mmap failed: %s\n", strerror(errno));
+		goto out;
+	}
+
+	memset(req, 0, sizeof(*req));
+	req->len      = page_size;
+	req->fd_flags = O_RDWR | O_CLOEXEC;
+
+	fd_before = count_open_fds();
+	if (fd_before < 0) {
+		ksft_test_result_fail("count_open_fds: %s\n", strerror(errno));
+		munmap(req, page_size);
+		goto out;
+	}
+
+	/*
+	 * Make the page read-only so copy_to_user() will fault.  The
+	 * ioctl must fail with -1; if it returns success the test setup
+	 * is broken (mprotect is synchronous, so there is no race).
+	 */
+	mprotect(req, page_size, PROT_READ);
+
+	ret = ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, req);
+
+	/* Re-allow writes so munmap can clean up */
+	mprotect(req, page_size, PROT_READ | PROT_WRITE);
+	munmap(req, page_size);
+
+	if (ret != -1) {
+		ksft_test_result_fail("ioctl returned %d, expected -1 EFAULT\n",
+				      ret);
+		goto out;
+	}
+
+	fd_after = count_open_fds();
+	if (fd_after < 0) {
+		ksft_test_result_fail("count_open_fds: %s\n", strerror(errno));
+		goto out;
+	}
+
+	ksft_test_result(fd_before == fd_after,
+			 "fd leak on EFAULT: before=%d after=%d\n",
+			 fd_before, fd_after);
+out:
+	close(heap_fd);
+}
+
 static int numer_of_heaps(void)
 {
 	DIR *d = opendir(DEVPATH);
@@ -420,7 +530,7 @@ int main(void)
 		return KSFT_SKIP;
 	}
 
-	ksft_set_plan(11 * numer_of_heaps());
+	ksft_set_plan(12 * numer_of_heaps());
 
 	while ((dir = readdir(d))) {
 		if (!strncmp(dir->d_name, ".", 2))
@@ -435,6 +545,7 @@ int main(void)
 		test_alloc_zeroed(dir->d_name, ONE_MEG);
 		test_alloc_compat(dir->d_name);
 		test_alloc_errors(dir->d_name);
+		test_alloc_no_fd_leak_on_efault(dir->d_name);
 	}
 	closedir(d);
 
-- 
2.34.1

