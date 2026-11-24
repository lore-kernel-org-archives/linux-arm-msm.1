Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528757;
	b=kPl4hPes5dnr0U8sig8qsZLJ4QgdHqgqzRa9D8OR9XRPYEa/UNGuf3JHtTWCH0XF+Nw8
	 zjOGUUB73yv2v33bEb3JJ8jvqs3UaRWLKW2jvkEcP5Sf4Zfjay7oLI/Y8tpdc9WFBOAMX
	 0epdGrJ8+U/TTi9SuAq4+hBTUZZWIYh8BMjIU06E3wrhfah7coCk0WhiPW8LMy9MhkvIH
	 babSlzk7JqXjke0sfJebuMfWrsPpp94wz7t7Csu5uht7ZEDb+O36kkag4DJVl7qRrjTW+
	 GXqtuWgENey/ygStk9WK2x8vVOwg7r7cocrNmCUsphiUAD5LQli3rFVmoTGVbDCRw9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528757;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u9VDZjXSVqCPwr8VgtFCUaYj6GBJ9isKJ2rRZAJP8cE=;
	b=pfCEk5kKGSvQpyW1KYadgMQzw59LlmUxCTjN8hzs6ljA4xf6Y6jHRSE36X/7FzhGpglb
	 9WE3/vAQ7zF5HpNw82NMyNMnTkvIgV2dc06b8a5UfYJWZdyZ2z8Rz3GgFJ+Zp04PHn0Lr
	 4sNRJ4rqsRrNMH9xN55L3+avVPM2adxNqyzeAt89a8ot27kkOkeQVLp6jmMwb6iLfZxRW
	 lazNZUzmC6E4NcQCyDKI+AY/SRpBVB/Kq5qieJWjerVPu0KvlQtuyPNtMwaS3bmdHjq+V
	 jZU5qj601T4sBdC7vGCBXjn76URBy1L6ETjn5TBYQ6GiW26OxqRgEqvZprgVciIq4qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4ViDz5j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8744D606A331;
	Tue, 24 Nov 2026 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4ViDz5j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6DD1F000EF;
	Tue, 24 Nov 2026 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795528756;
	bh=u9VDZjXSVqCPwr8VgtFCUaYj6GBJ9isKJ2rRZAJP8cE=;
	h=From:To:Cc:Subject:Date;
	b=U4ViDz5jYA1zpwQvV9osW5+P8ORsxM8AYsi4kx8sH/lESYqzWX/KA3rkDJjGHp9ae
	 zKnFVzZ/W7VRZPBB2BmwHPB6jhsyetfcNtkm7GoaBr6mYTiL6y4HnMqx/Y4AE8fA6n
	 FeLlHAT1TnXP0lxXJQ3alj7aDkru6tnlK5GHepcg1CUybx1LeGaFr+gBPrYv6RzB0j
	 WNMvf7Y9vYdDG8RhMnIlkIKbvY2PKyelP+tYm6FHxdexvxRiHrSuUO5jL/MIfwzhz2
	 bXnRcspytGItLjHXVWSn24Vo9jpUFDzXMMuQrD9xmJtPYXFRR6I16GYd9gYUjUIpda
	 gG0CZHDeoEpqQ==
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
Subject: [PATCH v2] firmware: qcom: Build the TrustZone memory allocator into qcom-scm
Date: Tue, 24 Nov 2026 08:59:13 -0500
Message-ID: <20261124135913.3358988-1-sashal@kernel.org>
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
same value. Build qcom_tzmem.o into qcom-scm.ko and remove the
QCOM_TZMEM symbol: QCOM_SCM selects GENERIC_ALLOCATOR itself, and
QCOM_TZMEM_MODE_SHMBRIDGE depends on QCOM_SCM. Drop the
MODULE_DESCRIPTION() and MODULE_LICENSE() that qcom-scm already has.

Fixes: f86c61498a57 ("firmware: qcom: tzmem: enable SHM Bridge support")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/all/20261122051636.GA2630332@ax162/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Changes in v2:
- Remove QCOM_TZMEM: QCOM_SCM selects GENERIC_ALLOCATOR, and
  QCOM_TZMEM_MODE_SHMBRIDGE depends on QCOM_SCM (Nathan)

v1: https://lore.kernel.org/all/20261122152843.1113882-1-sashal@kernel.org/

Tested on arm64 with allnoconfig plus: Nathan's fragment (COMPILE_TEST,
QCOM_SCM=m, SHMBRIDGE=y); ARCH_QCOM=y QCOM_SCM=m SHMBRIDGE=y; ARCH_QCOM=y
QCOM_SCM=m QCOMTEE=m; QCOM_SCM=y QCOMTEE=m; QCOM_SCM=m SHMBRIDGE=n. All
build without new W=1 warnings and pass modules_install.

 drivers/firmware/qcom/Kconfig      | 8 ++------
 drivers/firmware/qcom/Makefile     | 3 +--
 drivers/firmware/qcom/qcom_tzmem.c | 2 --
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 3ad22f8fc3e5f..54b9abfb6aadf 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -28,16 +28,12 @@ config QCOM_PAS_TEE
 config QCOM_SCM
 	tristate "Qualcomm PAS SCM interface driver" if ARCH_QCOM || COMPILE_TEST
 	select QCOM_PAS
-	select QCOM_TZMEM
-	default y if ARCH_QCOM
-
-config QCOM_TZMEM
-	tristate
 	select GENERIC_ALLOCATOR
+	default y if ARCH_QCOM
 
 config QCOM_TZMEM_MODE_SHMBRIDGE
 	bool "TrustZone interface memory allocator: SHM Bridge"
-	depends on QCOM_TZMEM
+	depends on QCOM_SCM
 	help
 	  Use Qualcomm Shared Memory Bridge as memory allocator. The memory has the
 	  same alignment as in the 'Generic' allocator, which is used when this option
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

base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.53.0

