Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B9632B116
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786943124; cv=none; b=PsHks5SI/pK+CxoWltsd3Z88Pfh6hYVZeC3Q7eay+FqUj6bqc3XAFe6ghZsoNw4aDD+uyNPuBhqMnHoWx2OgLbf98Rokr56U6p4g0OPKfloR6hWZN/Wik5tq29eiM7G5Ga12MegVYxAA19h2tN+5EPCMdWkkaUCtnsqkt2V5iLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786943124; c=relaxed/simple;
	bh=XyfkbQZ7xpA0fIVTmvCcxzb8iQyPGQl8C+uZaIEtryE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jtRBCNVrzILWOCUE3crIsuGkX7QzYkBTT600Ulq+63y5a3m+YK2oLhlJ2GzZN8NXoJO9CzMOcHzrJG/VLyAPv3e3Tct+dBy02Uotu+mpGk7uED2IdtNLgBKfRDdkpph68/tvZOEcQ7ftmV6GkvLdbM0yxu+2RK/46QnGz0nU3Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqrjZPQn; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqrjZPQn"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2459880a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 22:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786943123; x=1787547923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TnRbd61Koh8fAk6B/yQ0KzLTDaUh5Tr2u2+ZL0OT4NI=;
        b=nqrjZPQn4gWg1T2uIQD03HRwSp6nNMs9LOYTJbOnJvcvLViv1OR6BPI2tFwbj4G6wq
         3KXdtiSKS7VC0OZtN7ZlbIxt4kx4xven1VX3AXJVx3RYzhpdMiKuN2v+2ujlgwJATzpg
         3LG7UPZCkWQAFWHemuZRJ/Bte3pc3pGYwL6596KHckUGuRqUZdXgmVB1Tuhgmi2vCyFJ
         d7blS8iHjAAPC4SjmwWGllS2QA1d/OKynrSD8SIBmvnp2Wmr4mwcALiwEjQ4HI0dhrYF
         n0tUhcEW4HiEDsNk+aqq4W87BmlTBMlnO9xSk8g6hmC5+rfeax+RUce+15rn2f22Gbg7
         W7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786943123; x=1787547923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnRbd61Koh8fAk6B/yQ0KzLTDaUh5Tr2u2+ZL0OT4NI=;
        b=HWfh4H654YnZv6VMYJ/6oZHHOshmw4wq9rbMCVd16I5ODbmndo9mLmVZiKwjOdafcM
         6Mi2a3uOpoqiayJeFyaNIU/E8Cu3+sxUlFCXakQNCpjitj9tXqmdyAKcJPOkdxz3Fglu
         D4hbhtxGKii+bU48dEKIEDuTla4l8g87XcLzPrEfh5N6UbNK3tpbYVsQRYydBlYUk+lS
         aPVQoCIy9NEuCsMxDXEtRO0cfJVX7VmscFstNvFvDiTbQBbcrKzPsdoWgArAqzkS/0e1
         ecumKi7MOuh0oCjHcbCeYFbKwVbOE2Y+g7QxKT2cbi+WCDRaB5ytP+wFqz2c4V8LhHpN
         3E5Q==
X-Forwarded-Encrypted: i=1; AHgh+RradYU9cR/NtjUgPem1Uqeu0JabVzX+AG2nLMEsJRt8oQRqOiO/LO8TlfctpcYpk8YbR0m0INadtimG9ToG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+H1teNvlYjgGpLmrkn01ObQvywBIUfyVf/ZlWNwfYRG6A/jm2
	RhdqSlWjIU76f3dHKuc7kJ4VIs8lyXfNr1B0R7xva/bbcXs2aIi9JNTJ
X-Gm-Gg: AR+sD11JtOBoN69V8GrhdigilCR/knBBk3FY4+OZ2hq6hlQxQfkQA2HFRdESeBzrVO+
	NYNn1Hvozogm24nnPYu1WmoO9airBbsA5Pnf4ogCCEv3vVKzjeAXxRkdpX3u7AaLadtgG5kHckr
	bW3LQR2dFWVyS7hvls7g9qVkciHi5m7rJo9JSc8hMCxMPZWQP0pUDS0ljEjoLCgCyq7Fxbn31wZ
	mhIe8Mp9d6PsZntekDsNp3mcuDbl8vCjsv+xM2vweAej5MTlGznCzpN2+fPF7bta9v9dlWDJirE
	NDzHjCcLTEz+Dc2PiFxW3kbnwC89As6KJuB3fkYCZyxP/J/vauKuCXtAjwh0T9JvdH2nJ0sLfU9
	uZLqQvBvtjfuQeZadoIW1FFh7UbAQDtmRHN/OC7WOWYTdgXbu/9QCBiDZi+JDLMFJQuVnO7nBw1
	uI4AG8p7SwAorqbQ/4GKMHuPOk0XYLq8AA99Or4ZnhnediddQyT7pVpfJScxz3gxeqXYYKb77Ak
	6g=
X-Received: by 2002:a05:6a00:3907:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84fde2ded84mr22165983b3a.35.1786943123096;
        Sun, 16 Aug 2026 22:05:23 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d267310sm2131036b3a.53.2026.08.16.22.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 22:05:22 -0700 (PDT)
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
Subject: [PATCH v7 3/4] drm/prime: use dma_buf_fd_install() to preserve export tracing
Date: Mon, 17 Aug 2026 13:04:56 +0800
Message-Id: <20260817050457.1005285-4-shoubaineng@gmail.com>
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
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
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

