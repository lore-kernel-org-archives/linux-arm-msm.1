Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AA93C8C7D
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791434; cv=none; b=uN3W8TddGAU6q7bqHtoljYx/KMh7sVkO9rNvwOCFTj6ASzGqCn5T+ygVvjoWbEFESViCiLXYsJD0SA0SmOJRkYKwJDBUyM7ipWKY9jfPJVCVToTfv2wCCOb6BoYjO1K+UmVvZQuEQvvb4IZ7C4LUEX1drDtZI2p/EWtvRGwldxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791434; c=relaxed/simple;
	bh=PxY7s0ef2eTOJq4et3n6pTSS+HM601tQ/kGpwr/Q1D8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZxVnoil1BALGaNtJ55+HLIh/POnoQ08GgcWT2BVcO4oymMvC5bW7Rs5LGuoNeY89mDv9VIsV9APZPrqSqpBXdzEa8yAHGYIIpaO6YqUcLQUxpjIcOckwcKocxPNn6v4asC4TBjzf4bNTOzPyRUIJys4THxzCl4XFiA2v8cKoWpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/4QU0Lg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/4QU0Lg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so12547415e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791791431; x=1792396231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVxIVgS58v6Z9j6X8602a8nGRWydc8ljk56Wi8nDAZk=;
        b=f/4QU0LgwnIUn0onkp9ulKK0UTOJ13wh8MoMtTs0jhP8x6Qya6LGJ6myRkl7M3jDzZ
         RyZcu+WwvCOFa4vAOrbkqLge1aXTFbdhNREuXenhwaFtr333QDtm49MeTAne5wyZeArx
         chKv+MPs/DWQ0M5uQPy30DxOSS2QCakfNmuZNWnmbm1YjWFPWM3OrjiGIX3UWNmGJapx
         O5i+kic9feTW5Sbt9go7yq5bZiFcaQoOChWxTxhxJs5ZRcol/Ig09y6jKn1tOL8w/3Xi
         r6jwvyQaxBj5VclwLkmuXUp1i+XRnp9UoFh855e545/a/k++rxjNMJOSd3MZlaNvI+5s
         8aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791791431; x=1792396231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVxIVgS58v6Z9j6X8602a8nGRWydc8ljk56Wi8nDAZk=;
        b=cZPIA0uNbvTx+XrvQm32iJjgwNp/v7iXOEFm9+7K2I+Vz4Ply0l434FcF1EIDmFaRV
         eF3q0Paxqh0yn+uS3qeSL+/+4Lfw5BdTfxkR3J33Om1aTh/+NYZca3IqyIA7djtp6RdP
         jGTkSFKq7mA3Ucs0H5pwOct/ZTyo35iXCy478Wv9HEmH+UyGrq8WJHM0Cars58AkgNHn
         OOnl5zdiTyTdyLHGJkwC5QrlwRbWeCj3VRDQUar0Wz4kpkMzq+aInXdFbsY9rZvgiCE9
         H6zfJQfuB8XhOScGAmr7l0K2s9ll71Fl8BtdUkxjxVzBOZ2AWSSev8UxAEENZSsjMhHH
         uDYg==
X-Forwarded-Encrypted: i=1; AKwUvBzJZjuGy4gLg0OUYy2hTt2AFFKF7Atzhv4fJFv22GVBsUIUxh8CqRSAwsQ5Fwq/w+2/UJdwv6yKBWgppPLV@vger.kernel.org
X-Gm-Message-State: AFq9FYJLiE1cafzWh5/NNn+uCFXzV/UfVi6AOhHSTvxrVphtmC+G45kR
	Q9sWPSQggmKlyoUrZPh3Z1/sugtUkxV2Q/gQqfhkQ4Um+ePIdMLG0XOu
X-Gm-Gg: AYBFou2eBUQH1V3Uml9ZGAmXcEK/kRzUTe0tQcqxp8TCIL2DKkx26i1+0pfBPzdze+m
	XJzgJ+KVhPDKojNVLUyJ9pQAXO3e2XN2538j7M9E6iOgPgrePnpAGEMuWFxJ8eoUPGNsyUnPIEz
	EDiU7NV2jPIYpGYbXaIeSP23fGF1cN3zAqjwxa+WNeZjAMSbQ4Nsf13xM1upUcX7ijgAIkfksBr
	MXHv4XYZTgnPIj3wB8fE1jUePks7vkZ05tV7aDnef8i/HNMbzF5ixrlyx64SdCQqMMb6aDl4Qf5
	gvkqNzvmEPiRAxx0t+Y8NvA4TT40GwBttIns9osh317GHL2eSBNw11G6s4YlfFibBsC+/zCaWQq
	gySpkzsPpetV5YunLRV8+BEw7MVM1REKWcICFRU9WCg1kpIh2CkNyG5tFpmENRoKH5vXA97Gb/l
	EWsw1V0r5T7pGb3N8HnedxZ5tQr8NDLmL7F0rcLpb4cfqaK+UHfETHOiO1IS4TwKT0P/MPt+m+w
	VMFOEs8php6B3IvmOGMdA==
X-Received: by 2002:a05:600c:4ecc:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a18e4d55f2mr192414765e9.31.1791791430487;
        Mon, 12 Oct 2026 00:50:30 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:38e4:cb76:562:f06e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf35930sm263268905e9.13.2026.10.12.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:50:30 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: glink: release channel OF node reference
Date: Mon, 12 Oct 2026 10:50:26 +0300
Message-ID: <20261012075026.3265557-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_glink_match_channel() returns a referenced child node, which
qcom_glink_rx_open() stores in rpdev->dev.of_node.

The release callback frees the rpmsg device but never drops the node
reference, so it leaks when the channel device goes away.

Drop the reference in qcom_glink_rpdev_release() before freeing the
device.

Fixes: b4f8e52b89f69 ("rpmsg: Introduce Qualcomm RPM glink driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/rpmsg/qcom_glink_native.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 55793fc18293..5142730dabc4 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1623,6 +1623,7 @@ static void qcom_glink_rpdev_release(struct device *dev)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 
+	of_node_put(dev->of_node);
 	kfree(rpdev);
 }
 

base-commit: c39c2cdbde1f2ad9e2886167e55ad6b4c4907d7f
-- 
2.43.0

