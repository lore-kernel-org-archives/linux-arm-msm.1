Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF03C4B0481
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 23:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786060265; cv=none; b=ZM5jeICR5HEWQ2ZjmitubXGIZzQFuKI/dFMt+wNc4y4SzcKtSSkgaQsyUKLa7bWpBCgiPsLo5xoSdMO2b+UNQEpN+94eO10LP+m7Y9Y2Mre1w+WHH3Bl9uq6K24R8UowK8qhqBaEgCJYUMMoBQG7kd0gxKFv0laGpPQPIMUx8To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786060265; c=relaxed/simple;
	bh=Ql00Gi/e8s8Cd29IU6YwV4wqY3+xR87GYOT9JJAAcV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7PjZO/UOBt/Tv16v9cR5Dg6/qH2h8Nw9VQgo2uIJ1XtbncSXzID31ymPRoE/0kiNYG1Lw+ybeO6KvIR9efORho3E1YNf3sISqRXCkjbOpupr+3RrEGJYbgrztvjCWk+UZLgsQ0MCm229oJ3aVMa553GhJ/jBP+BS+Tp2t6i+qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pb2g+u36; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pb2g+u36"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e5b048375so147770785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 16:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786060262; x=1786665062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jn5M2DPxWkJRuSOq4XRDkDeVAclvZgLB7USjbXRxmNs=;
        b=pb2g+u36qzatmH24RdEXd0BPAB1TXR2UywaSh1mNK4qEatxFDA7o6Sh6N5zzn165Nk
         yGav3rXApxbUTpJs9GK0bC0hs7F5JPdUqwDxz6jQq9hVcSoPhWDorvsvvBKXNKLsFZ1i
         x4VneSYG38U0Q08xrz3kvapN6g3/jDJUkjv2o1BPcMvrtot6IxCIsePJMkfZtyRLnJLJ
         C/5M3JgxxqhJqtPESjvM7ysIsLl5BcZddE2jzS7vKJPPjx2E18li+jH7v3C1wG7u0I4m
         NzDCi7/E4hHW9m9NvsyU29+mqW6Xd8OTDAk//zfTifs82jgr2QS7ZtITeRP873qnFvWX
         7CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786060262; x=1786665062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jn5M2DPxWkJRuSOq4XRDkDeVAclvZgLB7USjbXRxmNs=;
        b=pBVaUj2aEOHjw8y4EAg7L3jtpP8Zw2DP0IGvZOfmPv4L0jGdnCt8ptWOqpPbt34hwM
         YK0Th2ky0RyrG8TKXZOAh+h/WTsGMOhPv9cnLAYf0VaG4zEVmhtpLXlQaGGOfy9+cZQ6
         ssvrvYEGLTPeTwoqmVcos1LXJ0zwEGjbbn0gsKeHtQ5lLODZAaR+HyZLP20829yjKDDz
         xPCTOo5S43XnecLinr/Es8rSE0mesjmv+YUUcxhcZa+b+OMeiyrF959nwdXRBlgGlx0f
         ZDesGLGSO+14XYtpm1eU27+BpzkU7Hjyz57XRocASL5Ckza0nabHxGI9T3iq7DmSFTDh
         BrFA==
X-Forwarded-Encrypted: i=1; AHgh+RoY/b72Z67xzKYuGOwt5YUhJTYixGPp8aL8yLfPRiZh7opr6G4nQISxwVyTXFnUMNlXj5cz02B+Yl69uRP7@vger.kernel.org
X-Gm-Message-State: AOJu0YyDdJ4Z2TbBpG0HYIKyCrY8941zR8VPOifYeEs1wPGN4hM3wZsJ
	KNQRZW15JcPkkXq6LQpEQ/CggC5HRpqRh/T16U2PIoE1MPtDTtdO9Xjv
X-Gm-Gg: AR+sD109W6fqQTz2fHESxQKS71BqYnJt3rZJzDaaChEW8AGw5AiT5vu+wel3vnyV08R
	iJDqehXVGBTt+jDBAF5u41tsLkBGtI4HqyYQebtOG99u32azrGJV4S37j2FKk5Ej2lD8EmW8wr6
	Z+4SSleZWizPvCerlaXx5Ii54No4MU8qeCHcC8t6m4oRZnoSS3jb2t/tPvUicnp07Fk6Q6cNMqE
	W6Jmn3PWZyB4S/azWeqEJURzhYRSrI6AVAv60gD47tAJKF9iJv15Gqm4lF5usvpALeMwMDWAkMY
	S9GOgoPdW156ddHYsjcg0DOLXKvMsEbCxnbDPQdiafgAShSs80zHFS9GQ0x2gZjSoFbMSPSTzVl
	viKhRTqz7axgMxk94fbKSnc6wjeuMWUxPAdHQIQFiqSoQdJ0vbDyNkQ4c0sF3IMuu4u+3rGKPVl
	gxStqME+JLKI8Xbk8r34Q+SRnBM+h9sS0vyiTC+E+V2n9hdM/1gQVbYMLHN1LjivGK7H0D9fNgt
	FGjLt6LRaYyQA9/vegKiXWy9SYXX0T9XD6L7waRFTqIDHQYpAW7tbA=
X-Received: by 2002:a05:620a:a2dc:20b0:92e:8aed:4785 with SMTP id af79cd13be357-936490e7a4bmr1535882085a.25.1786060261714;
        Thu, 06 Aug 2026 16:51:01 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e258edesm25793285a.32.2026.08.06.16.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 16:51:01 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] misc: fastrpc: fix use-after-free in fastrpc_map_attach() error path
Date: Thu,  6 Aug 2026 23:50:54 +0000
Message-ID: <20260806235056.456341-1-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map->table is set right after the attachment is mapped, before the
len > map->size check. When that check fails and jumps to map_err, the
error path manually calls dma_buf_detach() and dma_buf_put(), then falls
through to fastrpc_map_put() -> fastrpc_free_map().

Since map->table is still non-NULL, fastrpc_free_map() repeats the
cleanup: dma_buf_unmap_attachment_unlocked() dereferences the map->attach
already freed by dma_buf_detach() (use-after-free read), and a second
dma_buf_put() drops an extra reference on map->buf. As the exporting fd is
typically still held by userspace, this imbalance can later lead to
premature destruction of the dma_buf and a use-after-free.

The branch is reachable by an unprivileged process via
FASTRPC_IOCTL_MEM_MAP with an fd whose dma-buf is smaller than the
requested length, before any DSP invocation.

Clear map->table in the map_err path so the fastrpc_map_put() fallthrough
does not operate on the already released attachment and buffer.

Fixes: 334f1a1cbe03 ("misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f3a49384586d..d6be951d5538 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -915,6 +915,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 
 map_err:
 	dma_buf_detach(map->buf, map->attach);
+	map->table = NULL;
 attach_err:
 	dma_buf_put(map->buf);
 get_err:
-- 
2.43.0

