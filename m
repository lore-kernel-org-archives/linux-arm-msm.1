Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC3141D63C
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 10:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097542; cv=none; b=Is/IOjluEHDy7fhJPwtProjqusmSxW+XSbj94B3eHq/+gryp3P6oBNkKKE3KGmsjp+zvcXPfPIxO9p0MxRn+S6OW2D6SU2iQQUv0Ivfjc1pbUROs5Hbe7Oagww6NmT3HrOYjW3HJ24vftZuelFcRyMHRnpKYgYZCzwptImCdSEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097542; c=relaxed/simple;
	bh=kYA5RbCeLTsX+J20uD1xRq8xVWSem8VdkEpw2oXKluk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yb/5vyef+UNwWPzgxXipcDwBdrzz601GCBiBLXP+9xFcc3qYL4Ym0iogVR2Dfl+qn7Lh+jLG/hShZOiprdr1TGyqXd6En3Zojo4EYL0dljeEDBjJtpMgJkfNc/jHAyW7EsUqHGwQDcuuKX1JOIQ4otiqZCBJXI/pM6K51gQI99w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACjJUCsp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACjJUCsp"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso3870493b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 03:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097540; x=1786702340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8LdAoJKwXyAPy2Oxe1p5of7f27uz/x1w5QiaYqvn624=;
        b=ACjJUCspvxE7E8qbuN+1UtHZd5TKL6YYgv6D24XFFGVgccuLdhI4L7gZLUxM9BkCE6
         v/OFRzQNOiAzPoiUxsQbRRFo5UB9NwO9dnH6lCJ9MuAHSqkzm+Mf+7LO/gWzUUGgfTj1
         Khr33k1t2K+f0TbSOiQWogejw7i1BtjQNHL4gyXicVS1SlFybBjnc+24PzRv4O5rjXwp
         ZfKVo+X5FBrGRoHfWi4h0s5cfNl/Y6cGslXlziz7tYGIG8YDakWxbue7jockZdavI7a2
         6aW2zOI9AS2P407h948QKrhXFHHQ0b1wU+/CFQEwM9e69wM06HM450Bex5utIptt/BXX
         F3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097540; x=1786702340;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8LdAoJKwXyAPy2Oxe1p5of7f27uz/x1w5QiaYqvn624=;
        b=qzE224/RZ8N4kQbTjyMKdRjyG5Rg3F66rv8BadDDBshCGhFPeqAnSYWoNVd8aj99Zc
         taEaIylvd205+w77/Agpvbj3wk620vsUJqA0oQv/auVdEDp/cmcwVE+1ZNkkGcd0VQqR
         qL8sEUPkXd7Hd8nmympZ3TbirJaxf6VB25VJg2IRHJIzCgBmBjAmgfHMUFELrPFCMw7+
         ljoXrkt5FtSCFKmFdkqNXAbs2LrVy0s//QkOFYGq4rqzuk/b3KxxkYreJn9JM81ugoY+
         6oXy6RGD3s8QVxaEBXkKAXyX18QSgTWdgfJ5A+cxeG2fATzjw2bgROiPbF5xtBMlTD/Y
         Hujg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8EwK3kCL/NL5fGAGN63QC6jP6h1l52O2H1aEltt89MdsUhZGATvEjh+xSqR0Tf7onYQaJ12CyZ2fAGoX1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz01Aodd2WLhKQKEWRfyONpQpHnNgQpOdF7Whf/RbSPlY1Hyc4m
	rvG3IBS+KVTwclDKRuW3YAlG4W0gcs2MlrR2qXZJHasIHKUkN4RcSmvT
X-Gm-Gg: AR+sD12eU2VBQk+jwiGnTeIFI9L8LCyeB0+1jQ7s0ZuW+4daYUDWFuwkFCIqVejt9G2
	j2ci9X/RTgl9XEGigIm0TCDJAg5v+7nFLoU4UAMyb+I9srKuDbIS+okiY474+PzYCQZnJcBgiha
	d/6frL7u8nEmuleGTBSpVJ2UCUFy2mngruA5QSNQDe0mc5v/YSoEvdNMGCZ1s7HQTQ859AGY3K4
	swKUO/UBMQm8j0aleZb+i6Cyi8nMiNWD6DGXWNpvpWlb/6D7XJ6U/nQR29v6FXSmk4PmpwqyXs3
	fLGVfJW92XznfXWobjFry0Ao+lb83I9EVO5XvF3Vwp59ztNOdjr9FsC4gZl4rRIFh4a4UZ24tFI
	EtZL1awNwxAbppJ91ImWUZPhTh7jC5FepeSdURidyYHM+3dsPMy9epJ4F8y/l4XyrKXpexrBnuF
	QIDZfImDGdue/Rk+ShwlFF5Jf89FXC+pLZIXgwjr8HySvRwxFqZHTPEU6Pi/tFxVjU
X-Received: by 2002:a05:6a00:32c3:b0:848:47d3:47ec with SMTP id d2e1a72fcca58-84f2e0826afmr26947369b3a.31.1786097540308;
        Fri, 07 Aug 2026 03:12:20 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5528adsm797510b3a.45.2026.08.07.03.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:12:19 -0700 (PDT)
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
Subject: [PATCH v6 3/4] drm/prime: use dma_buf_fd_install() to preserve export tracing
Date: Fri,  7 Aug 2026 18:11:39 +0800
Message-Id: <20260807101140.1357218-4-shoubaineng@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

drm_gem_prime_handle_to_fd() open-codes fd reservation and install
using get_unused_fd_flags() + fd_install() directly.  This bypasses
the DMA_BUF_TRACE() call that dma_buf_fd() emits, so observability
tools relying on the trace_dma_buf_fd tracepoint silently miss all
DRM PRIME exports.

Replace the bare fd_install() with dma_buf_fd_install(), which wraps
fd_install() together with DMA_BUF_TRACE(), restoring full tracepoint
coverage.  No functional change; the fd lifecycle (get_unused_fd_flags
→ work → install) is already correct.

Note: this patch depends on dma_buf_fd_install() introduced in
"dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds"
[1].

[1] https://lore.kernel.org/dri-devel/20260714114654.3885457-2-shoubaineng@gmail.com/

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/gpu/drm/drm_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 9b44c78cd77f..fe3436d1235d 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -524,7 +524,7 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 		return PTR_ERR(dmabuf);
 	}
 
-	fd_install(fd, dmabuf->file);
+	dma_buf_fd_install(dmabuf, fd);
 	*prime_fd = fd;
 	return 0;
 }
-- 
2.34.1

