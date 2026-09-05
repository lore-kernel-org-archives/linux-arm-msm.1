Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F70C31ED81
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 03:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788579635; cv=none; b=gOQ3McfKeKpp5xs9PM0MXb8BuCJuzMncpoO96ZuiV+/aZyPlbqsK/6nB6vwSUfjcFpSUa2nGVN5NP33KJBzPGqBU+hc1p53+SyhSQD+J6wQG9dAkDST+T5hIvtiPuIblyBCmm5vxEGI980agkKC6K6y5TJFawD+0CF0RJUWIS1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788579635; c=relaxed/simple;
	bh=h58rRfgQOT1BFyheD9hG5lpbczY7NlBk2zXRfllj/ew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9BvQs9cFlmabzqLYb51ZCPS22+0oF5i+kiYp8/SkmpKMsJt+z6DdIv7/hRAjT3k8u+tlWxjJ32zLmBY7gfN2zbUm51MrACCx4Rpue2CZ15B8YoCM6UJV/3+991ANiRNGdMsU7Tjx0V1FNyFoRwb3P3S6ixkdZUDMPCk043P/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=qifJ7q3F; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="qifJ7q3F"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398a5aad413so1282395a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 20:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1788579633; x=1789184433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEg9KwaHVCx+xXyU3Ht7Kg/Y6eHD9fATek7hVNpbXCg=;
        b=qifJ7q3FemsdrK1TtoF1WrPgYMusWAqbgpKtOPEA3DiiOjCqEaxtxop3Owp1w9LrKJ
         cjp0ulI91m15doPi+VzuvEtQM1jRQoLEwM8laG8M15VB3V0O94yaDNTUbIeQbujku9oW
         s9lG6vRq8fTgrJRBr+jijS1vkfHfEJYvZd7YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788579633; x=1789184433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEg9KwaHVCx+xXyU3Ht7Kg/Y6eHD9fATek7hVNpbXCg=;
        b=hZ7QbrKGuVsgUQMGcRynIBS+MnPmKeTHCdh/e7rVEaBere0IMNSnhgN+yXApRLYp2a
         KKrB0V6gzqkMD/2NO4L3ij2en5hNwUwqAH5JdQO/sgOrBaVNR+a9r30ZsZLe/8Q0/mWX
         YvmWQiU8FIrM3BFvc0G1nz2BJXzNtYEHUA00fnDGh09ssExoQ+AqIAca7HD1q/x5x8u1
         oc7+2cPvM7k9dpnb1fcFMtEMkvk6oJ19LlHzuQhOPepi8WVOrufK3iNk+5reBIh+Bwhe
         4fdNzwlHy9/4H9sAeup49+i3kptc2JHERk51Hx708RPUF/dYkrWBwUi30gLh2ew/aamT
         /vHw==
X-Forwarded-Encrypted: i=1; AKwUvBx3f9q1HzrPIJw2P6oJzp5FJjc39vqCQcKAGgPBGGv8enwtzpXC6REGGOjdHbFEAilVkhFcL9BfiGClM2Ug@vger.kernel.org
X-Gm-Message-State: AFuF++l461eKh5WlwVl8roMzDTj6DE667Ww7uGs+qz9uNWIelW36BNl2
	DhN23/BxAnvsJ5ftz3aYQoWpeKQQZlbFscmg0entPit28eXlTH31thkLWqC1usxESAE=
X-Gm-Gg: AYBFou2TJOTS2Gvb9yiFzU6blixWK8WGDHEfTANjszAcm7J3jbo2fRvvt+2A3xkndSB
	d6AfvA139o2X+rBWtU98X/2NN4eaHNWS/HqnEkW1aq2z4VjUDG4wTxkqqxXcqu7PRGuJXfiTe+Y
	4ZxPAA61KwTeI0uM0lo7zgh8JCo0W7cPif4tRW1zbLepoqVqk73OAhmBd410h3psH1batFuomrZ
	iywDXgNndR7CBCdbRHB01iv/1qhOYbgk6JjZAfDC7LeEmjuNvGLG4D+zSyPPVsBIZiPUHd3J49j
	gWo+UdkM481Dy7vIvKnqzqA8u0Z32phLKVWTB//wP8Mf3+BSHiqKNnKQEbVpCPLvwM0h5/kwtxN
	Fs6ywq/nPu5M/MitUpSEdHhUy6THqBW3BmEIt7mc/ESkC1NJUtaaoB/IiOA6eEIDkJ22zogDFBT
	zjEi37vHwUsrkf9YNCu2WEOXa4Iw+0AlaGouK3+SFE1FJyvm6Sa2K44nbvUX0nOSv9y9/BFh3Kl
	XAc0e6OTOh+e9vWWEBWjsua1gK8UUNt2KUyVz4WExevCPb6dYGwUsVfhmN5co5YGpvrpN+zTay6
	ZBUhQrfV2zEkiBk46IovEb+/sI7zc5u9KqABY5XELZCAY0Y0vKG6x768jk2VM2Hc373mowcokwl
	ksyJlLn0MSnDwVOIkjx1SpVDWEA==
X-Received: by 2002:a17:90b:2c87:b0:398:990e:1587 with SMTP id 98e67ed59e1d1-39b26191cf2mr15056485a91.9.1788579633576;
        Fri, 04 Sep 2026 20:40:33 -0700 (PDT)
Received: from aegis ([2001:fd8:4d02:cd00:fe3b:5611:12cf:6ca5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b06cea473sm4210052a91.2.2026.09.04.20.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:40:33 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] firmware: qcom: tzmem: use sleepable variant of DO_ONCE()
Date: Sat,  5 Sep 2026 11:04:41 +0800
Message-ID: <20260905030450.34800-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_tzmem_enable() runs qcom_tzmem_init() using DO_ONCE(), taking
the once_lock spinlock. qcom_tzmem_init() subsequently takes the
qcom_scm_lock mutex, potentially sleeping holding the spinlock,
triggering:

  BUG: sleeping function called from invalid context at drivers/firmware/qcom/qcom_scm.c:334
  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 112, name: kworker/u49:4
  Call trace:
   __might_resched+0x378/0x698
   __might_sleep+0x9c/0x220
   qcom_scm_call+0x3c/0xf0
   __qcom_scm_is_call_available+0xec/0x198
   qcom_scm_shm_bridge_enable+0xc4/0x158
   qcom_tzmem_enable+0x178/0x218
   qcom_scm_probe+0x4d4/0xcb8

Fix this by using DO_ONCE_SLEEPABLE().

Fixes: 9941fe8a04f3 ("firmware: qcom: scm: Fix tzmem state on probe retry")
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/firmware/qcom/qcom_tzmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0fd9581275f1..ebcdee3c5975 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -518,7 +518,7 @@ int qcom_tzmem_enable(struct device *dev)
 	static int result;
 
 	qcom_tzmem_dev = dev;
-	DO_ONCE(qcom_tzmem_do_init, &result);
+	DO_ONCE_SLEEPABLE(qcom_tzmem_do_init, &result);
 	return result;
 }
 EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
-- 
2.53.0

