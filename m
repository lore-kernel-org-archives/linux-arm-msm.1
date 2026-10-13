Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79DA46D097
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871013; cv=none; b=Lz1gLYfhiDY7wbSv0aJANonXeOumwwHJlvoxdMyHL0+3MJzk/uMCh61+MzGXFLqGhax4aLS9+J5ocQ6JB0d16xTPbQ19h8Jl+f1ibjDfhZhwMNVjFcRTQYjnN1fdmo7bdDd8pMGl+TPTLWEbMlQSn6gYrnd3lt/f6ofkNJb29SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871013; c=relaxed/simple;
	bh=3pCOcqKf7T9wJyZUmZLGcII0V6IWGjvH8jpDvckklck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PjPUBbluYK2CkvFG7Hb6MskLHh7reXfX0jgk3Am9p6GNV78vOJXSe7nhyc9hwtOyDIxsFExBp/vzrm9Mtf/pNt5VYRYUwwgJRfWpPXPsWKEirWHvqkyjMBl3wVF4yxvschs2iaVLJzc6Y/ShVkmMOhr66qv4X5kn5a6PaJZ2UII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSx6Be3d; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSx6Be3d"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso32554925e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 22:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791871009; x=1792475809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=edPFNMluEF6s6sLCanSOFhEfk5IKgfxAjXociYy8RQU=;
        b=sSx6Be3d8rXaMlKRX3sy6Fa9oI+qKKmAUE/8C+bOSvCQ42dNOK/zcjgShIzu7j1rcV
         /jj5zxQRjXMS/3kPcgHG/G2QR4subIlihnIcY9LNQq1HTYF9q4EmTYVxsdqCQ1T85pXl
         Jyga9Lunvsd+qx4awFOipxkgG7Ml+VNaZEeX1DDrenDrSn3++FQ1/PFPQMcacNmRnRoV
         twfcvLB7sm31Ko5HyYb4utcjZm3wTtRNP3tX5JH2pScvzuG5yUGobcYT3uw71PHWuS5b
         RP/lgUl/6v8KaCn5H4hWkPQP3AcPAaxAhC4IyeckkpJwm+vzoXF3UwaHjLSAFiVWpsA6
         UO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871009; x=1792475809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=edPFNMluEF6s6sLCanSOFhEfk5IKgfxAjXociYy8RQU=;
        b=cNl0se4o08b9wsmJkAUzhnLvjOE4VSH0pZp3IzcjQNpIPd0atKflhz8aveJ3oIu6WV
         dTE2DvM80xWjth/HoWNM1qN/+sKs/0KPLJJXcf4ENwYKCXtnmnQAvztykJfSd1gBDR0W
         BzXQ7MllnOpBLrAhRXHf42uYEf7qjWagJGSIraSMRv6ocrR7MWvJxtNu1dnx0ICJXFVq
         /qHUWeOgNm/6Ksg5QnPAuEDZbM7Dzr9CJX/vJ/f1DPvjgxnF/92EmCjZ30FmbHEsQ/90
         X9nsk93NeemVhobYVSVg6pmH1SWJHfSVXjvkLt6sHLnT5GvBDU78ffixtw101VmRv/u0
         ge9A==
X-Forwarded-Encrypted: i=1; AKwUvBzkksCntsjTsBH+2Qk9LMFPs6AUe8PGDbA4G2gaF9z5vGmy68tgH5uCU8+piLzaC82sorHaCgnea9/C1OhV@vger.kernel.org
X-Gm-Message-State: AFq9FYIOO6C2890Z3dCMI+lvGQg6MS6x0lpZ9OoUO3whqP7Tm0FDlCWv
	jWdG+nvc4+L+Lh587r0l82Cmg8wh4vxNZqUM1FYdgF3jDA5/BNav6OA8
X-Gm-Gg: AYBFou1VzlPMcyUXN2G1PRhk2qyHqEFQ1omoA9759azW/pPRvto/qn9kyzOKwkXJf/8
	ZoIcmE/SvfsDj4v3w7xMvsccqQgdx4lZF1JWoqB5tGO74mVX0jX8BRG0MWdoVPX9YDE8Ub6SyuM
	THX+Y8KTZNW7j+/xtkeEI8sLPjtzTZjKPleUIJQnVDdasBfXGE960+lZvPPeyiba6Mj1wkpdofG
	X2JutZvtl/OP1emDJgr2z9++NS6+f5RdfsoHg1LVhecvUJS2enCsAgt+6wOL8Sr0rM/Vzyt46US
	2XyLQDLWNWMQUblHjZEADxXcf1njakxeVz4Y6B89JvGe/XbIYpRdpXd/GDFb8zRFdYScsz1P2Rk
	oA8FciU/lXpj3pTgAkfW+VJM+66mI3IpBzkMhwXrBNM5soV+WKVv/NgRQ4tlWWt++kTJZZY/IRx
	fbuWOKQ7x1k8edDODCWFYeOFMfR+cMesMxo7cOZx0wUI52qqRK9KzW7lNfFUvk9OxIWiEnjgWrj
	ts5kA==
X-Received: by 2002:a05:600c:154e:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a18e49ad83mr221940565e9.11.1791871008947;
        Mon, 12 Oct 2026 22:56:48 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:ee4c:dd08:4e0b:2855])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6b3cbsm271369505e9.0.2026.10.12.22.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:56:47 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: qcom_smd: release channel OF node on device destruction
Date: Tue, 13 Oct 2026 08:56:42 +0300
Message-ID: <20261013055642.793161-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_smd_match_channel() returns a referenced OF child node,
which is stored in rpdev->dev.of_node. qcom_smd_release_device()
frees the device without dropping that reference, leaking it
when the channel device is released.

Release the OF node reference in the device release callback.

Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/rpmsg/qcom_smd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 7dbe1c6efe41..6c1cb66528e7 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1065,6 +1065,7 @@ static void qcom_smd_release_device(struct device *dev)
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 	struct qcom_smd_device *qsdev = to_smd_device(rpdev);
 
+	of_node_put(dev->of_node);
 	kfree(qsdev);
 }
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

