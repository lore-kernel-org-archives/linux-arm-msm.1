Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648147DD65
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101637; cv=none; b=JtL7VdBY84ppDI+X4JzBQjzZkK2XWuneIPopnB+JO98Bi4VKS/DDOfuTVyYSZvDyZG2wUlpQXjCaJkyGjgNAmDESjZbk2iaSzFv2Gke9tArawwcARfN0VPOk3CEVv5KDiQrPRdf/9Ve7lJlvDzwniQ7zwXeDsS1kFDLln7W1oNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101637; c=relaxed/simple;
	bh=V88NOLkF/IJ670wq75ooUkU1C+dvWqwkp/u6sy43TNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRdgPMCjaeopJjk0L7DjMgoZYnzr8XiSmc4wutVjhHTbx3dGhL6nHEE0j3Gor73gXGRne9ONdEoi4xKQlxSXd0nSQBlEYa/+h5SZWJ9GURVwi/yI+8o7MN6mmZm6b+6QigMgaGqF9dPJthZadPz3SZyoIhjhceXXLKMyX9dLdw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsY8SA/4; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsY8SA/4"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530e28a62abso2255251cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101634; x=1790706434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVeL+7vTFvXkSE5mBaWcD6vVnIFM7Y6q6/+RTD7RliM=;
        b=lsY8SA/4lwFuGz+r3SoS00ijtDNWKhbMpl6Isc2c/YIgBZVQsQUFTy/+CqFUjQhVRl
         Rt4DgRG/2TmT3+6BII4QebnwT9uAv2Z9uP12dLAJbK0UTeDQC6BFWNEuDf0pUrLcbv02
         27XhCWi+tu9dlpxYGFfS4xwbiDccT/mgMn21oer+qi6Rm+jHBONhh8ZtWAaZG9rZC3Pk
         c0FqgJVcPAxYT7LkIFTTQJYrTgmLHlagJNCm+DJi0x6qYkE/20maXubHzJ+B9gHNNnfR
         LOl5AjmcfW+Gc+/6YRPjKgdKYKXGgVCyuuXnJRRDrWbIF5PvmX68XHQlwCPFw+g1znBN
         hoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101634; x=1790706434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVeL+7vTFvXkSE5mBaWcD6vVnIFM7Y6q6/+RTD7RliM=;
        b=PY8WNWt7Rb1fiYutd8uKMQFrNZDrCY0ScTWxRzH1AVdyaljwNbqP/ZJgvXqlZLM0o8
         B367VPbPC5yXYPCjJNWVa0D5lZOvNECBRjW4NYvAOsqXbNZK+KnSGHTGs50btqBo0C+j
         09SUOUhSQjmhXab0OXuqwXf4RG43fc2R7kGFkJS0DPUGK99kNZWV6ip9mGuxV3P1lDMf
         MUznO6dtpDuubZoRx/fCwIaRRyM7GhSVE/e+G7/ZfBf4jWQ7wnSZAx7U3x3npTiYYfrN
         auqtzUhGUreDaJ6bIZ2MQVZvo3uUuy/YjxGBpiPIttkA62XsrjDyQ6mJs7VnQOSEsThf
         fl1A==
X-Forwarded-Encrypted: i=1; AKwUvBzZ28YGt2pPjJiIxLqt2YW0PDKxuFWFwVPiTfiHNgq5W0jsU4BlzImpY8lcXjq8Y08M6O7XiPS+XNo19vXf@vger.kernel.org
X-Gm-Message-State: AFuF++lT+CHaD0klJi4RHMUgBzO+C/miCZMx9W7pBlT6k0mhDWUY8FY3
	OgbGb7Gv74+CqrM8ojdzUM+ROvkFgvisPL4SwQgIQvn63kVDuJciziaS
X-Gm-Gg: AYBFou2XziPsGzIi5PtHJAESrY9wwUiqwE23Vp4N/CPKxuG0VWEQtjfCCHIAlTE37DE
	N+PL6HSM0L3nXCeaHmPs+DgPLt3mWUFwf4ZFFrWji2iI8KGMoXQTqwQXXdaJRUXgQlzZq65xTVf
	eUu7u4ggCweHFXoEXK1RjY9dp6ssQW3GviVh39jo9AErRUhddnv6gfhV1jTmIUF8ZpQXGEgPED1
	Vdwa/0QIWTrUEj85k4P4kc3UQt79+kb/YMtEFq+esgFeGszkfDowsKMUDYg96HotVX0LJ6Cb0yS
	Qb5RQRya0dPnoki0rfMyFtenYYaoC4X2hYbhGWl1j61xZmKtsea0Af5BtMEIQHpgN/gIt0mRfr8
	lUklMLIqkv8eS2ELsN8DV2RxU5UZhkjSScJ2BxfFPxYZDR4BQjdn7STXS43/naxVfx+HszyYlyP
	kD5KRs6ckt9h6omb+zSvbhHsNMw8ebn4rg3uaYiMlHP4N97ligevVF6B1rIVmgjLSrjU7flZVEG
	6UEX/WukUfLj4cYWyf34cbeDIXxuMxJLZzvdXn08Za4xm8jD5wGnkqrYYVm06KlsaTWjgyjHPMJ
	NPQBx1UqntsPasj1LZrDxq1iinV2MVTJrw6/JuuaCZmtr8JD9OSZg1hV4Qi41qJCnyjFPA==
X-Received: by 2002:a05:622a:248c:b0:530:e0e4:b1ec with SMTP id d75a77b69052e-532eac93283mr6057871cf.9.1790101634364;
        Tue, 22 Sep 2026 11:27:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eaec2751sm3064991cf.1.2026.09.22.11.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:27:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Georgi Djakov <djakov@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] interconnect: qcom: fix endian annotations of BCM aux data
Date: Tue, 22 Sep 2026 11:27:11 -0700
Message-ID: <20260922182711.25176-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct qcom_icc_bcm::aux_data stores the values parsed from the command
db, converted to native byte order, but is typed as the raw little-endian
struct bcm_db. Sparse therefore complains when the converted values are
assigned to the __le32/__le16 fields and when those restricted fields
are used in bandwidth calculations.

Give aux_data its own native-endian struct type so the parsed values are
stored with matching annotations, keeping struct bcm_db as the on-disk
format returned by cmd_db_read_aux_data(). No functional change.

Fixes: c96fc14322ce ("interconnect: qcom: add COMPILE_TEST")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609221350.3Y8MOce9-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/interconnect/qcom/icc-rpmh.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpmh.h b/drivers/interconnect/qcom/icc-rpmh.h
index 09d8791402dc..30ec31eafcfb 100644
--- a/drivers/interconnect/qcom/icc-rpmh.h
+++ b/drivers/interconnect/qcom/icc-rpmh.h
@@ -45,6 +45,9 @@ struct qcom_icc_provider {
  * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
  * @vcd: virtual clock domain that this bcm belongs to
  * @reserved: reserved field
+ *
+ * This is the little-endian on-disk format returned by
+ * cmd_db_read_aux_data().
  */
 struct bcm_db {
 	__le32 unit;
@@ -53,6 +56,20 @@ struct bcm_db {
 	u8 reserved;
 };
 
+/**
+ * struct bcm_aux_data - Auxiliary data of a BCM in native byte order
+ * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
+ * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
+ * @vcd: virtual clock domain that this bcm belongs to
+ * @reserved: reserved field
+ */
+struct bcm_aux_data {
+	u32 unit;
+	u16 width;
+	u8 vcd;
+	u8 reserved;
+};
+
 #define MAX_PORTS		4
 
 /**
@@ -135,7 +152,7 @@ struct qcom_icc_bcm {
 	u32 enable_mask;
 	bool dirty;
 	bool keepalive;
-	struct bcm_db aux_data;
+	struct bcm_aux_data aux_data;
 	struct list_head list;
 	struct list_head ws_list;
 	size_t num_nodes;
-- 
2.55.0

