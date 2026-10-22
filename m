Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687810;
	b=jz8O6rHKScYuVUJrdg2IdDomfxKPDnePAkpLuxSI8mbN/bqXYVJSTpq2BAxyApJPh/iK
	 SMqFIHIzy1Jkt1nDMprG/ZGQetAnN0IbKbYEvchBamRH56pRhkB+MRcBjcj9dyiwNuZqQ
	 3O5wKnW608AX8TbDvxxHBz/BT//B9BNt3stax5VgIS37OV0VBvYdgdgfmoPYnZKdKyut5
	 yzEWa/tp8ZozHgM8ctF3NPeUokBYASovNKs3PB8GYkHQv1D1xLFU/n7M4rzjzSdEmnby7
	 6YAkPd1csJ7yWtfuoEHGxrOohKoHkTrYYVQJY/a+CedRyx9SrhHk1Un8kjgW7RVAxyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DYshgIa6KnBet2+0IXua2x2TyzIJmXFM77y+p9+FuZQ=;
	b=XyQib1CDrEZbBxGa4nch815jIZrjZM+mR4+lat4UvDcS/T0A0OVa1E6dW3hZxzhpL4UI
	 XSshSIYUWQ/yIieawi5krY5pByP+tuTgXZFW4AaPKgx0PcdHjivJlfGu9Qz1OxXGfBZ4r
	 LHKVFy6E8UEtuf56dZTzcXYVyXqVJ1Rps2gVm1yIVUiL83DgXopdZcoLCM78C4QHNuBts
	 R9HeztlLpw8NlMLthYi3enlXj/xu7I1NXQvEVoekJ6v5SXef8TQRcaiqG6HQbzJnBVs+c
	 7BfytYLsAsrXZCsoHcGmbnj6Bb4bxzxZkbLMO4CDQ/a1vXeitZVvdH6/I3dQBOEaTOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="nus/qRN7";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44962606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 16:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44962606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nus/qRN7
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso20057a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687809; x=1793292609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DYshgIa6KnBet2+0IXua2x2TyzIJmXFM77y+p9+FuZQ=;
        b=nus/qRN7Tkld78bj3tzJ6Nx4QFUDBHzOCLPO/PimuYIVcI7+dVmbPTw7K9WR+Jsww3
         o7DIsENk8rW7Peienxm8dB/tzVLd5Vum320SXU7uJN8ykGHXnF6A9vM9/seZ5upCMI77
         m+VXwJstz78OED2Wq1Yq4JlRUMInBKRz9RzW5nBLHcFqSuJqLV2cFs2/QOiQkG6p9/w3
         RHBT88gK6TMEWYhIwnZGHIO7vBEzyJLuknEwElthdRTi4tTPLnmv2Tk7JZaaGmpQKk1V
         TDX91oF8kDMwXi1IIH+Kivp5fBeXZCzYQqAmPkLrj3yLFa1Mfm/+nqPlefMpKcovBv54
         qb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687809; x=1793292609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYshgIa6KnBet2+0IXua2x2TyzIJmXFM77y+p9+FuZQ=;
        b=cZBV4O0uOdicRpvPa+Ui6ZzXUHmemVHjTWO8i2C/FDwSP+Y8ZZz+u1KphtFZrS8pm1
         ntV8wzxn3fzUCdT1h633FCDNXNgyRreZa5KHdlS1S42l2jHwVynhMUrwHqX68QKf/mRt
         JcWn9C+qsN3MQ/JoULXUt/yVwDGOFfgjMfVvH10qoUMc0g+DQPZziFR2CxvLRvdrB5xj
         zGrLqvZgypbOK6kQvFv4xmRr/7+M41Th7eTRRTtQVSrS909Vy2taiFgvbP1Ajh1VN2kY
         enVUIywuDIupSvkN4/H08YfJbAPG6IoncUQMy2jL1gxYicPkK8L2MYekA0TWvZkN0szs
         M6pQ==
X-Forwarded-Encrypted: i=1; AKwUvByZqh79B4rRG2/Tiebxk2Rr2UlNXubkLCtHI1JY6J7YEZkRGkHSk9Ua36xPP7OA3JpoXOHw7HdbAU6lWqGT@vger.kernel.org
X-Gm-Message-State: AFq9FYIqRxYNBijZYfULXxzbS+Ug2tW6Q3T2NbLpbE2xQdRsiucCTLdQ
	tR7Cb7o7zNUzvr5sVw65yasxAKIZlEogPCowH1VnBPT1MgocR6FxuoJ8
X-Gm-Gg: AYBFou0O2wBmdHJSj8pupC0Q6ilEvhqa26OI3Uv/Frt1GXPgN8Ochg9jTbJyxC9nXI7
	SDp8NmXSDCNiBbkGTnKQlly63RXGfuGApmWOFmjD5Hi30ZKB1sjYMMVm3+/0ZXoV7lP3tGC+RWc
	rtfV15JeC75t4ZUTA+MMxHwV0CnV6h8KwUPDP3g5bZznMKWuhPJl6zkcWWfBeOE4O5vbprHJADj
	yU2A9sePZyvlOmjootWw+oIAk1U3QiWhe6WQL+lxWjJF/pni6M2r6LC5O0X9LtgNBnJAflKDA+j
	PyKrYbeU4Z7qCrmY+GavpCIltjlbNiX7Umcxcd27IblNfDu8KCDgIUYoiCEXhPCjtyvyGo97y2p
	GM4sy9pY7ONMMlqX2RHWKS8qbiqSX+qfkPZYAo3CFOiIWRSrALyfRpTxRhcQ69ZrUdNugP59cuu
	Bp131BhN3DvIO2oJYpFmGo8+eS039pa5QItlh6EeBD1gRcR+iRXRfM3qhIeYAWpV0dgaHM78Tm8
	V4UXOMvtpLTj9kFr8Ef005qfS59ogxxuYpwsULztDFNpwPYeXpFOiiXT8C2766JZ4S2pU4e
X-Received: by 2002:a17:90b:4d06:b0:3ac:9e76:aa93 with SMTP id 98e67ed59e1d1-3ad86dbc0c6mr4089294a91.7.1792687809336;
        Thu, 22 Oct 2026 09:50:09 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48bb3b6sm5160804a91.13.2026.10.22.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:50:07 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: mani@kernel.org,
	mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	bvanassche@acm.org,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: ufs: qcom: Reprogram ESI after a host controller reset
Date: Fri, 23 Oct 2026 01:50:06 +0900
Message-ID: <20261022165006.1275-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

ufs_qcom_config_esi() returns early once the ESI interrupts are set up.
ufshcd_config_mcq() also calls it after every host controller reset,
which clears the ESI base address, the vector mask and ESI enable. After
the error handler has reset the controller, the completions then arrive
only on the legacy interrupt while mcq_esi_enabled stays set.

Allocate the MSIs and request their interrupts only once, but program
the ESI registers on every call. The MSI message is not cached for
platform MSIs, so keep the one written at allocation.

Fixes: 519b6274a777 ("scsi: ufs: qcom: Add MCQ ESI config vendor specific ops")
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali; out-of-tree board
support) on v7.3-rc4 with commit b52d695d0620 ("scsi: ufs: core: Keep
internal commands dispatchable during error handling") applied, forcing
a full reset through the debugfs saved_err file: before,
REG_UFS_MEM_CFG, ESILBA and ESIUBA read 0 after the reset and all
completions came on the legacy interrupt; with this patch they come on
the ESI interrupts again.

 drivers/ufs/host/ufs-qcom.c | 12 +++++++++---
 drivers/ufs/host/ufs-qcom.h |  2 ++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index fee9b54ba5e1..ea2a106cbe26 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2414,7 +2414,9 @@ static void ufs_qcom_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 {
 	struct device *dev = msi_desc_to_dev(desc);
 	struct ufs_hba *hba = dev_get_drvdata(dev);
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 
+	host->esi_msg = *msg;
 	ufshcd_mcq_config_esi(hba, msg);
 }
 
@@ -2442,8 +2444,10 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 	struct ufs_qcom_irq *qi;
 	int nr_irqs, ret;
 
-	if (host->esi_enabled)
-		return 0;
+	if (host->esi_enabled) {
+		ufshcd_mcq_config_esi(hba, &host->esi_msg);
+		goto enable;
+	}
 
 	/*
 	 * 1. We only handle CQs as of now.
@@ -2481,12 +2485,14 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 		}
 	}
 
+	host->esi_enabled = true;
+
+enable:
 	if (host->hw_ver.major >= 6) {
 		ufshcd_rmwl(hba, ESI_VEC_MASK, FIELD_PREP(ESI_VEC_MASK, MAX_ESI_VEC - 1),
 			    REG_UFS_CFG3);
 	}
 	ufshcd_mcq_enable_esi(hba);
-	host->esi_enabled = true;
 	return 0;
 }
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 944b2e532a09..d2647695abe3 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -5,6 +5,7 @@
 #ifndef UFS_QCOM_H_
 #define UFS_QCOM_H_
 
+#include <linux/msi.h>
 #include <linux/reset-controller.h>
 #include <linux/reset.h>
 #include <soc/qcom/ice.h>
@@ -360,6 +361,7 @@ struct ufs_qcom_host {
 	u32 phy_gear;
 
 	bool esi_enabled;
+	struct msi_msg esi_msg;
 
 	u32 saved_tx_eq_g1_setting;
 	u32 boot_spare_cfg;

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.43.0

