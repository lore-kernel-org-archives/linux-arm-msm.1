Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB933DAAB8
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 18:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867603; cv=none; b=DJ6gDi2Gp4WoG7Y1i78EoOfGSqigeCX80BKxyqvf6W/Ra2esK9Fi0g7NBKZrRTtSWlD4Wnyb7a5YVamaShejQWBYJjUJ44wYj5+OX67wgn1W9cvyn6VB9oG46CBJlyc39wg+rJJYdXL4QNmnF6tN7tM3sqbLNZsLaGVuMRu8+XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867603; c=relaxed/simple;
	bh=PtRqzhQRb7bU7mah6yGiifES/yEQ4XiEOjC7ACQkKnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s/pZQ6fpSDusLaUgNtR2RokroiOKfQOeZCXoBlGYWz5aNzAucC/6kCqRvMwmS3kWu7VJJrWQPl1RReTaR5j9sjE97pom9JhvaR/R/VhQHheVPkO1TtL90XUODD1dB68EHUFAGDDJYUMvcjQ+vSeIHXUZrHsnT0tyG2WlzKTzjRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOZkSBS9; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOZkSBS9"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbe64a0afabso9771a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785867601; x=1786472401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jw7e5Rfr9nTLu9Xi7DMR9VP2hbwdbhAjZW2kw4eVdlQ=;
        b=HOZkSBS94JF7pNhIcibw0zVV1uPoLMNsSB1b28wUWyRBIWgCTAlib3GyFEDp1ZaMi+
         PIx1iGaHBaXR7sSX2Xk3zSk1Ik6SouVh42HrmExX3+8YasT7axsDjG4jnryYzpw17btN
         CDX8TzKQxPDene03awLrz8PpijfJSPCory9DWiaQrTOeuN4lGkcjiUaumtRYrB7zQSJP
         3ggXgJh6XAUvclu103+0ZnCeaWlcWaewcDa0T6UBt3soBZz/ZJiHwvZmmGHWB8kVn0tN
         Fgg9Pr7lqOfjD6JIUuWiJQlKqa8w3Y4ntnk6UBqeysRUblY/nvDdJ9Uu9Vbc3BUcC/Qy
         aysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785867601; x=1786472401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw7e5Rfr9nTLu9Xi7DMR9VP2hbwdbhAjZW2kw4eVdlQ=;
        b=ZCtxyjh2MyyAVGHjA/MzI7nzObNhHL7cPa2V78zl+SzWUOkQTbs8LE6C78ny9JePIH
         KMsOp3+7rg8bt8aty/4halSTVYEPQ5lELx0goWL1rAuXY7wVu2ooECxcwuZoRRZfe2C8
         Lu9qzi34GG1n8rXKfW3uAwAC5pboQcNQdL9aQSkUe8H9YaWwjRbDcttFXTPa+PwKHScY
         e8yKQMMqNFI/f8HZ+Sz/skg5rf3R+OqYAkF+rbJUYnS+3aTz4WXEwsijrzLY4nl6/kaE
         9rl+XXNnSOccbPE4tj/AxUXFmc/JjD4Vxn/+RqfwOlbBhiOE0uJl5s2V85Yo28lcHDYo
         9xwA==
X-Forwarded-Encrypted: i=1; AHgh+RrGG04FiOhFzTxd8O382RG84gMZ006/1Du/3A4PShpkAeTNxsMhmAmo+6wvYsCMKALZBwyBxJqiXN6ufF/V@vger.kernel.org
X-Gm-Message-State: AOJu0YzD8sxb67AODHDbTBgarLXlCpk7+mZC6r4f0QKol6L9RHG3lH8a
	pEwjEa0RF+/W4jrgsYChrc6C/0CskDwFYm7M0Yq3d/NL6ps/+4LlGvvW
X-Gm-Gg: AR+sD13yLWIKNCf0Pa0N5G6bmQ6lzDcsZnE5KKgTZ4c58jjHpGuavPgVFFXF+TIn4Xy
	Dq210SQgRP/tIiYpqRk4zwhThOD7QT4Yq3NZA5t/pAi6ThnIrFsK54e5Iwc5eHhbxd0JGHbAhzI
	aNgnimhJqCUyLHDyGZ1mcthogKxiSegSGQbczfDEQfiNAhKDhUN6rbJPAGR4pZZAQz1CNb6hj6F
	1OolUza+njHCrU56XcPiNK+CJS0FopptHJRcf0eYVkCjEoIcWU2bbnwrutPnsz4wpQyUF2ry2kg
	nWX5IDh82Hy/XsQ9qanYoqGPy80l/seD330Olr6QWUfvyrm6701N/o3S0dgkNJPi7vtSvpXmiTV
	CDtsbuN62n9DJnEsnyDaG1izLewpF9Zn01cnI0sZZAf9DNHHGrEosBniwc2fNeOKswN47YJ1wWF
	5bRLIJxlrZh9DpjkfHGDHXDHLAdgsBzaF2UedLbB+zQAz0UsRD8lu2poZbneWOT2ugwV4+kOJ/M
	g+BfO4dc7NdjG4=
X-Received: by 2002:a17:90b:4410:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-3903c5bff9dmr807451a91.1.1785867601383;
        Tue, 04 Aug 2026 11:20:01 -0700 (PDT)
Received: from localhost.localdomain ([202.164.135.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca8e969esm4967976c88.10.2026.08.04.11.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:20:00 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH v4] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle and leak
Date: Tue,  4 Aug 2026 23:49:51 +0530
Message-Id: <20260804181951.5206-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTB co-firmware was previously requested and loaded in
qcom_pas_load(), but its lifetime did not match the actual
start/stop lifecycle of the remoteproc. As a result, the firmware
reference could be retained across restart cycles, leading to a
leak for each successful boot.

Additionally, if qcom_pas_start() failed after loading the DTB
firmware, the remoteproc core would not invoke .stop(), leaving
no opportunity to release the associated firmware reference.

Fix this by moving DTB firmware request and loading into
qcom_pas_start(), so that its lifetime is strictly tied to the
remoteproc start sequence.

Update qcom_pas_start() to ensure proper cleanup on all paths:
- release PAS metadata on failure
- release DTB firmware on both success and failure paths
- unmap DTB carveout where applicable

Remove DTB firmware handling from qcom_pas_load(), as it does not
match the correct ownership and lifecycle model.

With this change, request_firmware() and release_firmware() are
properly paired within the start path, avoiding leaks and ensuring
consistent behavior across restart and failure scenarios.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
v4:
- Rebase onto linux-next
- Remove unused int ret from qcom_pas_load()

v3:
- Remove the unused release_dtb_firmware label
- Release DTB firmware under the existing dtb_pas_id check

v2:
- Move DTB firmware request/load from qcom_pas_load() to qcom_pas_start()
- Fix firmware reference leak across restart cycles
- Handle start() failure paths where .stop() is not invoked
- Ensure firmware is released on all success and failure paths
- Remove DTB handling from load() and drop release from stop()
---
 drivers/remoteproc/qcom_q6v5_pas.c | 47 +++++++++++++++++-------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..864446a484f1 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -231,7 +231,6 @@ static int qcom_pas_unprepare(struct rproc *rproc)
 static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int ret;
 
 	/* Store firmware handle to be used in qcom_pas_start() */
 	pas->firmware = fw;
@@ -241,23 +240,6 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	if (pas->lite_dtb_pas_id)
 		qcom_pas_shutdown(pas->lite_dtb_pas_id);
 
-	if (pas->dtb_pas_id) {
-		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
-		if (ret) {
-			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
-				pas->dtb_firmware_name, ret);
-			return ret;
-		}
-
-		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
-		if (ret) {
-			qcom_pas_metadata_release(pas->dtb_pas_ctx);
-			release_firmware(pas->dtb_firmware);
-			return ret;
-		}
-	}
-
 	return 0;
 }
 
@@ -282,9 +264,23 @@ static int qcom_pas_start(struct rproc *rproc)
 	struct qcom_pas *pas = rproc->priv;
 	int ret;
 
+	if (pas->dtb_pas_id) {
+		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
+		if (ret) {
+			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
+				pas->dtb_firmware_name, ret);
+			return ret;
+		}
+
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
+				pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+		if (ret)
+			goto release_dtb_metadata;
+	}
+
 	ret = qcom_q6v5_prepare(&pas->q6v5);
 	if (ret)
-		return ret;
+		goto release_dtb_metadata;
 
 	ret = qcom_pas_pds_enable(pas, pas->proxy_pds, pas->proxy_pd_count);
 	if (ret < 0)
@@ -352,6 +348,11 @@ static int qcom_pas_start(struct rproc *rproc)
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
 
+	if (pas->dtb_pas_id) {
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
+
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
 
@@ -361,8 +362,6 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 release_pas_metadata:
 	qcom_pas_metadata_release(pas->pas_ctx);
-	if (pas->dtb_pas_id)
-		qcom_pas_metadata_release(pas->dtb_pas_ctx);
 
 unmap_dtb_carveout:
 	if (pas->dtb_pas_id)
@@ -381,6 +380,12 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 disable_irqs:
 	qcom_q6v5_unprepare(&pas->q6v5);
+release_dtb_metadata:
+	if (pas->dtb_pas_id) {
+		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
-- 
2.34.1

