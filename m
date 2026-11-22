Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361327;
	b=5ONn+7PBa8BUljipYTXjmfPau8Sr9gANh2n58E3wQzMUwFwWWXTYJWiSEDxpD8aNyj5r
	 QL19RREP0O2Z/68lQ/c/GXx4pYF3WQcABexv70QINwj37EzDqBemosxZ0SmnEd+m/k4ZL
	 NinPbWKLjqw1FrLhfQbLaJ7w/vjMKCPhryDVf9xgRFBMLPdfz/pkZVFuE2DCnaJKfRJs3
	 Xnx4QAG5YDdWkeB3gib4IOR7YhrIpIYjnRyk9OCX3r9UkqeUCBBy+c/49Kl6Wt5hPidtQ
	 5WEDd+pRNfAiiQN+IB22dpoiX4UI+VnRYOL8KjyN0JliWa1d6avldmhlK7m7ZEom37Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361327;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WhuQ7hE/REZTdcs/A7QYXERFZiJw/aybGfvWFONrpf8=;
	b=QdpZ4eSRc1buGkCVM0aq2jZwTkc7/og461xcUEv3K0HNGl9Rg+vnwPRRQrAK7YCN//KN
	 flLOg4ZPLSNPzht0ton0HUWZQnELOwC/DqdSFQjULvRAPZ3IP+xojhYdgJVhdyyxW7BMx
	 TGVz2JKaCulePZ6N9GTqKWyxuoXtCbrXMxMLEsZPFyYmFZIdbIlIOgEZnpLhoc2aVbf5s
	 dfq7gikXblucbGOEdX5+OlXRJBhlU8i3TI7nZJ3KfprhwbedGBUpKw1hcvGLmh/yRAORD
	 zsWO07g72j/zPWS+g6+1qjyfUGaAvh0PuBD8QpCqBZ3Q8QNqJ1zXz9Ga4OOtcLFdXdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0pIIYnY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FB2606A320;
	Sun, 22 Nov 2026 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0pIIYnY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E1A1F000C6;
	Sun, 22 Nov 2026 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795361326;
	bh=WhuQ7hE/REZTdcs/A7QYXERFZiJw/aybGfvWFONrpf8=;
	h=From:To:Cc:Subject:Date;
	b=B0pIIYnYzq7frzK2W0KhwRU5NSYN1aQc3RsG63CyS6ZCPriCybXfZbfSNIVJiA4fn
	 x8rZmJb/5Mpt8UoICEURkLj0ItHXjt49+7WlrtgC8EosmUMZ5BIYrteO9RcrzVNsV8
	 Yc22YFyItot7L67tUE+vfLOhla7bUt/c9BHUZwrmkrVtwIs8lJIQfMMG7epSSBjR2R
	 xObUOZm768khxIUKK6H1kmheMmYKB42pMqAyUqX/l5T4vAjP4m7l/VDbpb2LrvrVfd
	 ha8xa9KRBD6VEm5raa7Wq+cqY7HiYmqNZIU9ooVMuHkZ9mrf8EApYSqyd+aaS8wv9f
	 A605bQAMoRI0g==
From: Sasha Levin <sashal@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom: Build the TrustZone memory allocator into qcom-scm
Date: Sun, 22 Nov 2026 10:28:43 -0500
Message-ID: <20261122152843.1113882-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

With QCOM_TZMEM_MODE_SHMBRIDGE=y, qcom_tzmem.ko calls
qcom_scm_shm_bridge_enable(), qcom_scm_shm_bridge_create() and
qcom_scm_shm_bridge_delete() in qcom-scm.ko, and qcom-scm.ko calls
qcom_tzmem_alloc() and friends. With QCOM_SCM=m the two modules depend
on each other, neither can be loaded first, and modules_install fails:

  depmod: ERROR: Cycle detected: qcom_scm -> qcom_tzmem -> qcom_scm
  depmod: ERROR: Found 2 modules in dependency cycles!

This has been possible since SHM Bridge mode was added. Since commit
35abc3cd8ab6 ("tee: remove TZMEM_MODE_GENERIC") it also happens for
every QCOMTEE=m build with QCOM_SCM=m, because QCOMTEE's select of
QCOM_TZMEM_MODE_SHMBRIDGE now takes effect.

QCOM_TZMEM is selected only by QCOM_SCM, so the two always have the
same value. Build qcom_tzmem.o into qcom-scm.ko, and drop the
MODULE_DESCRIPTION() and MODULE_LICENSE() that qcom-scm already has.

Fixes: f86c61498a57 ("firmware: qcom: tzmem: enable SHM Bridge support")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/all/20261122051636.GA2630332@ax162/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Tested on arm64 with allnoconfig plus: Nathan's fragment; ARCH_QCOM=y
QCOM_SCM=m SHMBRIDGE=y; ARCH_QCOM=y QCOM_SCM=m QCOMTEE=m; QCOM_SCM=y
QCOMTEE=m; QCOM_SCM=m SHMBRIDGE=n. All build without warnings and pass
modules_install. Without the patch, Nathan's fragment and the QCOMTEE=m
QCOM_SCM=m config fail depmod with the cycle above.

 drivers/firmware/qcom/Makefile     | 3 +--
 drivers/firmware/qcom/qcom_tzmem.c | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
index 88ce74d74c3e2..74c655856b0c2 100644
--- a/drivers/firmware/qcom/Makefile
+++ b/drivers/firmware/qcom/Makefile
@@ -4,9 +4,8 @@
 #
 
 obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
-qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o qcom_tzmem.o
 CFLAGS_qcom_scm-smc.o := -I$(src)
-obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
 obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
 obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
 obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index e1d944d0eb63f..9330cd428205e 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -522,6 +522,4 @@ int qcom_tzmem_enable(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
 
-MODULE_DESCRIPTION("TrustZone memory allocator for Qualcomm firmware drivers");
 MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
-MODULE_LICENSE("GPL");

base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
-- 
2.53.0

