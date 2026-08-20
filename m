Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC647CA79;
	Thu, 20 Aug 2026 16:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243418; cv=none; b=oKlsowMMf78jrLbGeEOhVkB+LkVKb57STN7uG5URP/QwOzXBCaz+ZdebJUeK7V8v6x3E9o2mhlzFXuUM5uqV39DVy2DqOoKVQS4ljpKl0vsVW9RnqfyycJbp3s4GnoT9QxO5zg1ND+wQb9OxZnK8OH74eHZBY5aSzpsqwPLzL8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243418; c=relaxed/simple;
	bh=UpnB7qEgpMNxxChy9LNeO868nR658WwksoG1i0HRrIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uJjNph6YSg48GQvf46bbXxX5t94UHGNpi79Qf/dl8O9xnpP4c17pnflqTx1RlPYtVRYAJPvKXuOFoyS1i/KeN/C2wCRTF2pyhGeyY8ujvJqfXk3DRm8EUwwp8h3N2jcJJVVuwmLaOolMP7cM6Zf+ojoeFljm0X+EOZ0OV47/Zvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbgrhpVH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbgrhpVH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067B51F00A3A;
	Thu, 20 Aug 2026 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787243417;
	bh=i11xx2iln2VfAKywmfY1HtI/IU1g75jbclGOV4KkmBM=;
	h=From:Date:Subject:To:Cc;
	b=bbgrhpVH5LLIr72uKtSyl6IdMKtSnGeaYyEvZI6Ta+B1kt2e6ZSuoSuMJeUcm1Lih
	 GullPzCQ0uYgj0pvfNmx8Vtpl0sUiahDYGiD3i6PUtbJ6aHYMmTz7Pt2TadQd7pA6J
	 JygFxmTouovywLe+vZtunY58R5LKwFPkPdvxcQf4+fSb6A63KnSM/slHQA/ssXODm6
	 pUV4pIAc3FXTML/P4Mc4+4f6GbQew3I5D3Dqbv6WxOpMrIwA5CtWSusK45Ts5Zjbhz
	 dOBvJNvpSwBFgsxuiB7T2Al8yJuCoGjs3CXV1KAlrNdD0/Zl+0f33E+gCGWyfnxchJ
	 H0BLu755JBCrA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 20 Aug 2026 18:30:08 +0200
Subject: [PATCH] soc: qcom: smem: support Glymur DRAM info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-topic-glymur_dramc-v1-1-f714eef34e4d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QrCIBSA4VeRc52gjon0KhFherITTeW4RTH27
 rO6/C7+f4WGTNjgKFZgfFGjkjv0QUC4+5xQUuwGo4xVzig5l0pBpudnWvgS2U9B2sGM1uohonP
 Qw8p4o/dvejr/3ZbrA8P8PcG27fbhROR2AAAA
X-Change-ID: 20260820-topic-glymur_dramc-63256613de88
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787243415; l=4409;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=oJrdISwfLDvRkfOeoB8VyvsJHBipqLCBenCpIHyyfMM=;
 b=whw2XpQtYiUm4a9fZ4AQGGUpffi+IydM4FNDhdgGg9CfA6mN6x/hBsoNg6W0l1ApiB6schfii
 BlwvVIxtGs0B5UWFR7WvpYTZyDH0jg2PiecnYlZZmcdPhZBSsZIgMDN
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Glymur firmware provides a version 7 DDR-info SMEM entry whose 872-byte
layout is different from the one the driver supports today.

The data contains 16 channel descriptors, 14 DDR frequency slots, four
4 DDR region slots, a 10-entry SHUB frequency plan, and v6 misc information.
It accounts for 616 bytes; the captured SMEM entry has a further 256
zero bytes.

Add a Glymur-specific version 7 layout and recognize that complete entry.
Parse the DDR frequencies and highest-bank bit from the common fields.

Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Validated on the ASUS Zenbook A16 and Glymur CRD
---
 drivers/soc/qcom/smem_dramc.c | 66 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
index 63ebe7f6db59..9e3234a67406 100644
--- a/drivers/soc/qcom/smem_dramc.c
+++ b/drivers/soc/qcom/smem_dramc.c
@@ -20,12 +20,22 @@
 #define MAX_DDR_FREQ_NUM_V5		14
 
 #define MAX_CHAN_NUM			8
+#define MAX_CHAN_NUM_V7_GLYMUR		16
 #define MAX_RANK_NUM			2
 
 #define DDR_HBB_MIN			13
 #define DDR_HBB_MAX			19
 
 #define MAX_SHUB_ENTRIES		8
+#define MAX_SHUB_ENTRIES_V7_GLYMUR	10
+#define MAX_DDR_REGIONS_V7_GLYMUR	4
+
+/*
+ * Glymur's DRAM information entry has 256 bytes of trailing zeroes
+ * after its DDR details, four region slots, 10-entry SHUB frequency
+ * plan, and v6 misc information.
+ */
+#define DDR_V7_GLYMUR_RESERVED_SIZE	256
 
 static struct smem_dram *__dram;
 
@@ -39,6 +49,7 @@ enum ddr_info_version {
 	INFO_V6, /* INFO_V6 seems to only have shipped with 6 DDR regions, unlike V7 */
 	INFO_V7,
 	INFO_V7_WITH_6_REGIONS,
+	INFO_V7_GLYMUR,
 };
 
 struct smem_dram {
@@ -188,6 +199,37 @@ struct ddr_details_v7 {
 	struct ddr_regions_v5 ddr_regions;
 };
 
+struct ddr_regions_v7_glymur {
+	__le32 ddr_region_num;
+	__le64 ddr_rank0_size;
+	__le64 ddr_rank1_size;
+	__le64 ddr_cs0_start_addr;
+	__le64 ddr_cs1_start_addr;
+	__le32 highest_bank_addr_bit;
+	struct ddr_region_v5 ddr_region[MAX_DDR_REGIONS_V7_GLYMUR];
+};
+
+struct ddr_details_v7_glymur {
+	u8 manufacturer_id;
+	u8 device_type;
+	struct ddr_part_details ddr_params[MAX_CHAN_NUM_V7_GLYMUR];
+	struct ddr_freq_plan_v5 ddr_freq_tbl;
+	u8 num_channels;
+	u8 sct_config;
+	struct ddr_regions_v7_glymur ddr_regions;
+};
+
+struct shub_freq_plan_entry_v7_glymur {
+	u8 num_shub_freqs;
+	struct shub_freq_table shub_freq[MAX_SHUB_ENTRIES_V7_GLYMUR];
+};
+
+struct ddr_v7_glymur_tail {
+	struct shub_freq_plan_entry_v7_glymur shub_freq_plan;
+	struct ddr_misc_info_v6 misc_info;
+	u8 reserved[DDR_V7_GLYMUR_RESERVED_SIZE];
+};
+
 /**
  * qcom_smem_dram_get_hbb(): Get the Highest bank address bit
  *
@@ -287,6 +329,23 @@ static void smem_dram_parse_v7_data(struct smem_dram *dram, void *data)
 	}
 }
 
+static void smem_dram_parse_v7_glymur_data(struct smem_dram *dram, void *data)
+{
+	struct ddr_details_v7_glymur *details = data;
+
+	dram->hbb = le32_to_cpu(details->ddr_regions.highest_bank_addr_bit);
+
+	for (int i = 0; i < MAX_DDR_FREQ_NUM_V5; i++) {
+		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
+
+		if (freq_entry->freq_khz && freq_entry->enabled) {
+			u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
+
+			dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
+		}
+	}
+}
+
 /* The structure contains no version field, so we have to perform some guesswork.. */
 static int smem_dram_infer_struct_version(size_t size)
 {
@@ -341,6 +400,10 @@ static int smem_dram_infer_struct_version(size_t size)
 		    sizeof(struct shub_freq_plan_entry))
 		return INFO_V7_WITH_6_REGIONS;
 
+	if (size == sizeof(struct ddr_details_v7_glymur) +
+		    sizeof(struct ddr_v7_glymur_tail))
+		return INFO_V7_GLYMUR;
+
 	return INFO_UNKNOWN;
 }
 
@@ -415,6 +478,9 @@ struct dentry *smem_dram_parse(struct qcom_smem *smem, struct device *dev)
 	case INFO_V7_WITH_6_REGIONS:
 		smem_dram_parse_v7_data(dram, data);
 		break;
+	case INFO_V7_GLYMUR:
+		smem_dram_parse_v7_glymur_data(dram, data);
+		break;
 	default:
 		return ERR_PTR(-EINVAL);
 	}

---
base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
change-id: 20260820-topic-glymur_dramc-63256613de88

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

