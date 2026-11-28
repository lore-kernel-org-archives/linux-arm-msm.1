Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858518;
	b=ftj7Z+RTQ2tMZtZoa6wMSnuzYr9RmiytobQ82XIA/fQlMmueIYj27RnqMAFyQ4F+NtUD
	 d8CVxP+eCcREscE3r6l8+4IG7rgnYuBvpvEiqyPnI2RzXt6dRJduJ5Nt2I1qVpQtOUA2a
	 vAa3n6qyCJ+b/Nd0GRn6UWA3/dwooJdySMH8kQqYeoFBLtDWyUfoSpU/oLPxaH//VKSg+
	 SlCOGvo/VqG3+EeH+7zSCzhe5RDcoOj2vKsmzQphFCBvGSffSoRJrBhctltL9KrEZAkZb
	 /5lu83tJu4tC5W92VcKhGVLK7ellHBFrjrS8IxaNqUMApRMKHp2zpERLr7DIa8VOITA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858518;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=hBY0ZMqRZmkIhi198k9dX9tGPXJ7CqRD+6OcWXXrb9k=;
	b=tiyL79CNtP3SQjKbcwmrt6QqZhe3g52XLIJiiZ90nYv6eBoQQlTvbjQkbV0sesPAZtMn
	 RcO0Ldta/72if7i1Fv5WR17siZNYxQ7889W1TNFLG27RkiwyN2dQcKyO7PWAWogOMJxAX
	 GxamKacFW1oeYZ/4vg8+2GBb//JzYrBqpyBn0BxDxBjcAKX742/tRUo7Yh9a5JhN1A64V
	 //BsCnk/N5tNdC6Mt5oL1NL2RhEEFtKaetW0ZHoDA1FxTUPSqyLUVACI537IaF5KsolWI
	 qFEyFhW8q3j3OEcjuAtB4RPi4U+qnr4erN//GHsbC5V+kBUxPYppytxq0kS8Ia9jM9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OoAX4mmU;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1631B606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 09:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1631B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OoAX4mmU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=hB
	Y0ZMqRZmkIhi198k9dX9tGPXJ7CqRD+6OcWXXrb9k=; b=OoAX4mmUken0+na1+v
	BQ2FIPyQ9bOiZD8puUXzS/UiSfo70CVzuo/7LN9ia4H2E7LEE0NXjJe7yZDCBEKd
	A97RmP2cBuca8/YnwqX7W/XBi0afyp0O4+f3bny2gNJi/GnnIxY+XPSZz9mPAeXG
	LQthWaCFU8lGB/rQxh1CjmJv8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD33xYVoAprc0BGLg--.29209S2;
	Sat, 28 Nov 2026 17:34:16 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: jeff.hugo@oss.qualcomm.com,
	carl.vanderlip@oss.qualcomm.com,
	ogabbay@kernel.org,
	jacek.lawrynowicz@linux.intel.com,
	quic_pkanojiy@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] accel/qaic: Free the DBC buffer on management transfer errors
Date: Sat, 28 Nov 2026 17:33:22 +0800
Message-Id: <20261128093322.1217738-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD33xYVoAprc0BGLg--.29209S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur48Zw48GrW8AFyxGrW8Crg_yoWDZwc_Ga
	9xCF18G343KryY9rnIyF1fZF9akr93ZF1vgF1vqF97AFW3XryYqFyUCFWrZa4rZFy7Ca43
	G3WDt3y5Ar18JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuUDJ3UUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hiL+WsKoBhw8wAA3e

encode_message() may allocate a buffer in encode_activate(). The
buffer should be freed if something fails later in qaic_manage_msg_xfer().
Add free_dbc_buf() under label lock_failed to do so and retain it
on success for here because the buffer should not be freed if no
failure. 

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/accel/qaic/qaic_control.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 2ccc55486aac..f322887ec53e 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -1250,6 +1250,8 @@ static int qaic_manage_msg_xfer(struct qaic_device *qdev, struct qaic_user *usr,
 
 lock_failed:
 	free_dma_xfers(qdev, resources);
+	if (ret)
+		free_dbc_buf(qdev, resources);
 encode_failed:
 	spin_lock(&wrappers->lock);
 	list_for_each_entry_safe(wrapper, w, &wrappers->list, list)
-- 
2.25.1

