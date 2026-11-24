Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535129;
	b=DPkwOHpfI7ZFNo6qop1BSw4tSZxIJU9/Kdvizz4scj4i8wtfa0eHF0LZE8hrA+T+s7G7
	 yfGmWe+WsaSTYCbCExkAD4azojZ1uxh2gzpOwsL6b7oPlRL/036uw+yB8Xx16yG0JgtLw
	 OGDYl5J3c4AnML3CSUZuzhMCvRydXeB8mcEvzuXVhh1MvJ2nmH8vpa2u8yefdmBJvD1ow
	 kFFp2AjbdgRs40KE8KTTK+CjXnmni+8cNs/QNBamSJ9+qaVUKBA9VomN5MN/Su+zNn0uf
	 4rgP4VOL08W1QxSYjYWTK3CvQkVncDPCXeWbM0yL9uc1llZEy/BmqDYOsc9/6AZkTDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3hkJat/Gg3boX44Q1mafJG1F0JYnnq/y7sAswGXXbDI=;
	b=smu/OYe6NVBTOLAUDNzEjGelMXgRRqLbka9ZQGCAB4jqDCfy+Ph4r7/aNJ5OyeTgwY4E
	 f0xmGpDlfIFKbm1Pwg86kQyAkTj/0fx+rd0fsodrUFgo/F6G8A4GrvXGTJqJJgywJ8y8M
	 lK5cfMp8zjgXmrnddy3Wqt33ArLdrFuqBt6NVQtShKiU8KR2I1IhfDDKHUemjY8t6gOtI
	 Z1bI5tF2K3mPrihCtoTIBGqvWIX+xlI3XztEcXLM5vBPeVajgxVk5Sg4PmRszJWGTP4Xb
	 3kK7vgqN0Lbos9ga1JkL19iUuVnbLbM9In4w22m3Z3XsWj8YxbEYbZ1PbLxNdctT3jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T08HQVU+;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74042606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74042606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T08HQVU+
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2432562b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535128; x=1796139928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3hkJat/Gg3boX44Q1mafJG1F0JYnnq/y7sAswGXXbDI=;
        b=T08HQVU+RG0vW7CTZSiFCGrFWeD1QNQWCYFAfRXlUt8EbYsylC69ARNtHNoxccWMgD
         0XjlKPgKy6YFYTO2xeVhl23Czdkzs2g5Gs4osvH3SV5fLBB1heBG7EhNQZ0cFx7h8Bq1
         XgqV7tZGT1QDqN0WU4wXZEUjXOrJBiiaL9EyKV7FvrSHQrIcFNGVHOsMGDrh6Yg5EY1U
         ltbUUwQDEFYLjWxPd3dR8NUujAmPorV+/4c4O806ocsqOL/CUw6EoS1YP9j+wYiTPy1o
         kJLTi7Q/TzRRISTM2ICkPs77NSR1cQjIjGCAYd+YPEv4LbtnYhznhnBmlvXUbn6MZ81q
         GYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535128; x=1796139928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hkJat/Gg3boX44Q1mafJG1F0JYnnq/y7sAswGXXbDI=;
        b=D1LZKNFoU2PIeAimg1XumN9yulvl1P6sk0NrL0VyrJk5AuC/QbEp4ykyPCmJJqH8rq
         oE74lPQ30Gr9oaBieKue0kp+y2DdznKKmWBgr97ppYJ2VS8ap8Vj36Tlp7Mw8+4fBppt
         Cy0SVqxslhdkCquD6k0xJs6iaT7mZwppw37pAGPEkWPdaISVQXs/d3IUdt3gNNyhuRnI
         6Dkg4efhLFgEetK0E5Y66Z835/i7FHjpNh62uXDL6GSsiFSvVWEDodeYkiZw/1a8mHi0
         DdC24VKuRy1F8cHG0tlOoiUejPz0l/64Ez8p3O08pCbvYWqc56RS7L4sGdAJjku4+yEw
         bt9w==
X-Forwarded-Encrypted: i=1; AL+hErEfixBWALjKLmCsYmpSGasLQ37iU0+S9w1LRj+zgMbdj8uz8ZfeztfwFUWi0wOAl0QV9Fy6FtQ+dXU23h+I@vger.kernel.org
X-Gm-Message-State: APuU4Z/bUHwz2IgCKZ9v9ElMNu4yC25US1SCWF3AiDCbVo/qaC0YI/wV
	iAvhw9ZLDdUbtJqmVVav2euTvdC0VAYd7c70GalbdqtHDaF4Nbp4gyE=
X-Gm-Gg: AZFdTZcOicbqj4VjgoPH98OWEtgcMND7RaDlot0ho774ynbRbOtvzwoBMKYY4ZsEVc9
	zBslGbzRyDFvYEZCOXlx3bzhMpwJjv57cVyS1uYe9hzNs6J8o1AGkI8fIN8yHtWT4aXEIMnv/WZ
	qkVd11tuhigCCKbg3TcS2/Wqo91rEYmmLwqpYc1+QeJ9E67h/aTMJItBgaO3vdHrkLgIYUXWgMh
	1HJsvp35EXJ8+Cg7TnRnhujEO20pZt8qmodMW5pFlXVOXZSQYSEPsImDJLTtz4N0Ihm6+v1fhVP
	2PsZ5iCa5uy6WvOVokRx1gNyXGI+u8cRm92+m1Ba3l7ZEE1p9+/+P424qOpoiZr5z3N6BJF9yeU
	lQoS1s/Z+ICalpPoxE6jaYmkmduwPyeya1HDePu3DQa4+Ug35ook1gyo2oFLjg20YB9QfLM6ic+
	UA5JAANv/tFUj45iGEb58dNLQgMdHqGGq1mjNbVF6C5We4E5PpR5Yy9GZmzhDrNFJErAma5IGQl
	4QH+GIKLYaf5E/xgh+ul8WX83/0xPLXHY/sLia0m08yJRZVXzXsfT/x/KCjU+LyCnFCcPRNWbsk
	NcrTVRs9vKhTstEjdUsCumLYiEnC9T9683VLOwlCb+p53s59U53CwFj0TH3qjrLp7NEs
X-Received: by 2002:a05:6a00:1f17:b0:8a0:f375:d1c0 with SMTP id d2e1a72fcca58-8c87c57b5fcmr12396223b3a.33.1795535127699;
        Tue, 24 Nov 2026 07:45:27 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:5da8:85f0:b5f6:2eae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f11da2sm7136132b3a.55.2026.11.24.07.45.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 07:45:27 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: Clear the GLINK node after name allocation failure
Date: Tue, 24 Nov 2026 23:45:21 +0800
Message-ID: <confirmed-20261105-37-9a8d5cd59eb0@gmail.com>
X-Mailer: git-send-email 2.50.1
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

If kstrdup_const() fails, qcom_add_glink_subdev() puts the acquired node
reference and returns without adding the subdevice. However, glink->node
remains set, so qcom_remove_glink_subdev() later treats the subdevice as
registered. It attempts to remove an uninitialized list entry and can
also drop the node reference a second time.

Clear glink->node after the error-path put so that the existing guard in
qcom_remove_glink_subdev() skips a subdevice that was never added.

Fixes: 44f4911ab8e6 ("remoteproc: qcom: Fix glink->node reference leak in qcom_add_glink_subdev")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/remoteproc/qcom_common.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/remoteproc/qcom_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 5294e327f1587efc917eb01dde59bd1e723c225e..cb3f6f93c6da85010f89244a6991f4d74ae57dc1 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -255,6 +255,7 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
 	glink->ssr_name = kstrdup_const(ssr_name, GFP_KERNEL);
 	if (!glink->ssr_name) {
 		of_node_put(glink->node);
+		glink->node = NULL;
 		return;
 	}

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
