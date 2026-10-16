Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189A04A49AB
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154769; cv=none; b=REOdT08/FUViiURUVNxgBEfrbrLSM5K/ysnPoKPxxm7FzGTKYuE1u5KjqK5/XHFZhaS8QptxlX+dIGVRxrwSMmYP1V2Bc0G0EO58gpqVFdW4W92ZodWErtxc00LWXAbiVudAF77Lrd3tcwEuZSCuPX69OT3AKq4EtVFmLOHAJSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154769; c=relaxed/simple;
	bh=lKAkidrvbBJ/vTXYNpqVpCG9VNbWjHMk4s8lEayu9QY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B8hZ+Qb8vjovJ4P3+9oZr2QMY46vKw+Wgq0MyYOT2lEBo8suGZ6wg6dU/UdYhbe5KNLA8rBkCvBlnX4/Hvi4KkXfym6C2HOudiQkMXHnqx8C2O8FVdpmerDVXS62hj9/mNxC6TihhWpKzLL+3pe9yRspb55AWd9oXdYxIrgz0rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boDcVw12; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boDcVw12"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd632f7a4a1so1003482a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154767; x=1792759567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrslgNHse2Dg20EAEUVpp54Hl92z5vT+wdBvkKVG3Qo=;
        b=boDcVw12UrVWhMkX6Y79s5SYBhSnNzOYML/hJzXJsU7wbdaUQYiv9Kfl2zjUzvuZL2
         tc6Ijo4lF9PJiXKns5vs1ctbNfcC41qzmYtWwg6WhPWjS49NaQCtB3+YfI0YuF9sEOB/
         mxNeY5YMajRUhe2cePGZPfXmhgijhEfAI+2boCtjKLpXCr6QH+97Ps4dyjaMULOLhcfw
         wg6wpT4O8OzJaHHrQucvw5kfjXnCKbwcfjGM6G3LXvSEqDLGP95zMcX+qPXawzuUCAiK
         fQRPIpN/x41dYlp14jtKhUwph1eQy6t1o63dVhOQObxCFHJd6Q1Xzct0zCjrAkcvAmje
         ypNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154767; x=1792759567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrslgNHse2Dg20EAEUVpp54Hl92z5vT+wdBvkKVG3Qo=;
        b=FEC+7xIfD/S+JqDmZ/goahgNpKzFJcrwSNt8zwEONpQr4vPkh+pBWDG3EXAU6TU7RC
         7WnMphmafG8fhgpiCWUFPSSs7dS3siFBVpFdl+FKE4NX0XeBgGWedt7bM4BnW6AR3m1g
         1C23++/+AOqtC8HdUHCXmvtgndX6B0iZYJUE6AF114oEp7Ye1qE3vGJ1L3dlc8XkxLxa
         e542wwYC4JiMZ9d1l5vCxacps8JaQxADWb+179UtOmYBng80/UeTvTu9kgmdc388K2uG
         wZ7F7p/IXFiwvmvZt/d3KBlOyL/qKwkFJ5jdV2SFaAJ3XcaGktTOOXq+CLC82EDn23lu
         G8JA==
X-Forwarded-Encrypted: i=1; AKwUvBxy6p6F/jtQfaWbf0z+Xak6oHihtnHZUhrAKfUWPTJGWS6rNMAiYUdBbaltrzIBtUrAbEz4sKJX8pTOgI+I@vger.kernel.org
X-Gm-Message-State: AFq9FYJSZEaauxSAHI5jYeMwSOc5SCCn2L83yQ/xmSVR/bAmAiAqYdaP
	ZArPHPtOD6I7taQI5pFAa8yWBXMXeYJb4FODFTHQMLEOmQmBIxleDYaO
X-Gm-Gg: AYBFou1dzIZJid+LGevinCMTxKI19qXfJLeYvrsddtTvWF+8LEuJr5RjGTHLwuUlZJA
	GKKD/ULlYfl2g0q3jhmV7lIC4i0GrpuCP1WqRKIIDJtV5b9PijZbzbcn4e6lNUcXHfSSZqZ7DY6
	iWKh+DrpLaxJorTdEFReaFPF/IUA0RB72sYzURfZloqr9I7AKAdSERO+qCAQuOApMuXzfD+gkbw
	wlO0vs4nTnGAaSK3PAZywJu2+fjIWIsxdiStTK7w9hrBQUp3cFpt20owm1dCxjovtK7XguJIn0C
	617NE95rcDf/KG8erbPpYdVfTJFmj75lo9VoFa37GNdY5MaYE0yI1ZxSxSWV3aW8oCq/6YwuFpZ
	BCxhZZATN5LdWyGfGtAJwqlA/Sd2iJzC8LJjNzZZDoLkOyyoNuddtVg/bF10BEydy/8q+nMrZ8T
	PnxDtUfwEKdxk7hcv0Q9My7HLaxcQ2jV1UjhJtmNTQ+ZhK6zv+XstIjYsqzo5OPIaBrnUwLWlBc
	/T/BfkgZK7etQ==
X-Received: by 2002:a17:90a:d604:b0:3ac:8af9:4a6a with SMTP id 98e67ed59e1d1-3ac8af94f17mr5664608a91.42.1792154767359;
        Fri, 16 Oct 2026 05:46:07 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ace34c8d9asm753751a91.5.2026.10.16.05.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:46:06 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
Date: Fri, 16 Oct 2026 21:45:59 +0900
Message-ID: <20261016124600.31-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint
register"), qrtr_node_enqueue() returns -EAGAIN for every packet but
HELLO until our HELLO has gone out to the node. The HELLO is retried,
but the NEW_SERVER announcements sent in reply to the remote's HELLO
are not, so a service registered before the remote came up is never
announced to it.

On Kaanapali the modem sends its HELLO before it accepts ours. With
rmtfs started first, the modem never learns about rmtfs and its
watchdog resets the SoC about 40 s later.

Retry each announcement for up to 10 s while it fails with -EAGAIN.
announce_servers() runs from the name service worker, which can sleep.

Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
Cc: stable@vger.kernel.org
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a Lenovo Legion Tab Y700 Gen 5 (out-of-tree board support)
with rmtfs started before the modem: without this patch the SoC resets;
with it the announcement goes out on the first retry and the modem
stays up. Starting rmtfs after the modem avoids the problem, but
distribution units start rmtfs first and let it boot the modem.

 net/qrtr/ns.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index bcb090ee79d4..33a9c4449d6f 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2020, Linaro Ltd.
  */
 
+#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/qrtr.h>
 #include <linux/workqueue.h>
@@ -226,7 +227,13 @@ static int announce_servers(struct sockaddr_qrtr *sq)
 
 	/* Announce the list of servers registered in this node */
 	xa_for_each(&node->servers, index, srv) {
+		unsigned long timeout = jiffies + 10 * HZ;
+
 		ret = service_announce_new(sq, srv);
+		while (ret == -EAGAIN && time_before(jiffies, timeout)) {
+			msleep(100);
+			ret = service_announce_new(sq, srv);
+		}
 		if (ret < 0) {
 			if (ret == -ENODEV)
 				continue;
-- 
2.43.0

