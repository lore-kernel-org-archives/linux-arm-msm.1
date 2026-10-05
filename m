Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADBA43441C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191507; cv=none; b=VDggAiZfuncX7c4VYmiY1orX5BRdwxxWyiErJvkYmNH6PNMDubMMUy33OYghQebnRmaZJF7sNjSzhQ+Wr0WGF8Ba3LeVIOgCAtcOE63pKl2ekN2dWXX2Lf1Q+0xHj/kHCCQuEvunq6RfYlYJvc9sj/mU1JozRZJAu/JSgafpq5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191507; c=relaxed/simple;
	bh=b4WvXQ0COzU5NuxznFesN5SzpLiS/QR0/NbsHm44HGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uodvqn6oAHV2f0iyyQyYA8mrpvpjZeKJdK84VRGCgCCVFofnLUOLyTI3kQ74vqxcn75+zzECHC2owcLoWNCk3qU3JUy7I7FOrpcHmvqcPe3qCix0zlLYcEvHFamqTWLA3yRk2g4FK8KZ1eI9VZj+OWFXB9o4Z/5Aw4THMVy+qjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYQQnSxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJUCp3c3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYQQnSxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJUCp3c3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xV631502661
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 09:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0hFYEAWjOWGQHPFsazn/kZWAVEinVYrYfd3wwodbro=; b=CYQQnSxii/jf51Lh
	EWjcbE3/WoPIMTC5eXlSfQU89FNCsOtZ0nIrp7rNBTzFKg1ZXNizGObyEgbiRhfu
	yPFNTSyVs/xh28d+duADeuUKR0UDcdn1CIkj+TLhjj2jVyLWHW7gUdwzO1l/9GB7
	Rs3zvcGQ7gVhtVfzC67L14DRX0mBVBgProqqomh7DQbQih0rNg0m5XdPP/ixC5h9
	8SY2aZ7vdL35hkI9qlT9repM4+VXkAllQmBqK3oA4gqG4g2WjfjQOn0U/DizrLTB
	5V66zmIbh4b3W/ERikf6AsZqKeKsNKhc5ZDDz4K+ApXGi3M0rhdOLjUx5W0Iaa1Y
	/F5B+g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgysf13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 09:11:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so1038205a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791191504; x=1791796304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0hFYEAWjOWGQHPFsazn/kZWAVEinVYrYfd3wwodbro=;
        b=kJUCp3c3Ug5WhJnwo6inqJ0S++dSUQWRhKPZ9ArCs1ScThvOedE/vv+cFC0WnTdq+z
         sjOyp48Y+82CP+e3kPjg7xJQgQdy6dE/FWwC+RcqXslVGT2dC+NakzhbcMzJLetAuZyB
         9yvDMNdJ2w1HAswDM8CUB7W9VCWZulEd6j8wRrkEwFzvP5VZcWTVG8Vl3s6D7vbxFK3w
         UhnJYPb+Y4Di4UGX4sPlaDxrSnfWk/nyv20c4tX9l7Ou34ewg0Jvka6rrNTdkkrsRJHG
         tA69hk6dJyvtPblyJCBmG4FLbtFApvAmuFWKTf9/qZZjKiUasqiemGhFX/EOjpsdaW0C
         xPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191504; x=1791796304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0hFYEAWjOWGQHPFsazn/kZWAVEinVYrYfd3wwodbro=;
        b=2LydnHCmMM8NYiVpy8lWmmEfdS4XJtcx6ou8eK7JXp3MW9ngpN0Xm7o9cwT3Iaf8Gz
         gksM7OXjwr2KncTno5shK7NZC2cedKhbIfgwxahlvAs06EUz8VjsrAGiweK28LVGFdvS
         Oylw29UAANlwt2QdZl2Hszgo+04rVRoAlCsnEmWdLtWqRlPp+NcvB6u+zg2Xc02KRK7L
         UpgPb6gKyH9YqnhW0i3tk8p3QA+FbKgLvFJS7jruEw6oFlXOgsCsZkGIhJuYYyzpQDQj
         RtH57FTVgFi60ikEmrpu7VWlkEmPsXpvFFq5AO4B/TVP3BuECrUacTQY407Z/sW4jPOX
         BTZg==
X-Gm-Message-State: AFuF++ncR+yRA9yRCUcxmma5QNVs3rlTiBj9l2JqSllFPoinHVCr7q7l
	uf0H2UTArj1QmdmsURl+ojm/VNtkVP7sVIfHCyE1+PpuXbCuu7ueTvy+Aqtj7fgdzy3YzFZ9FXR
	lNBidDqDWWkS0+XAlgzQTqsREUyvAuR/0/Emjbf3pH2Gdcc6lQPlQz+Y2yTAcmf3WCNGU
X-Gm-Gg: AYBFou3oW5Xappg/dSu9qhOwmbM1gAGLIg3hVrDr4CBue6NHq7DQf49+Q2pwnJDbghX
	14/8uyVpVI6R9gTte+8ag8qSiw5FKwSD8QM/pdpDuGyWb4HsXH+xePUttzdwrmfT7CA5Ez0yRHF
	a0qW9/qRKmZIHDeWZTs7Hg+k7Mvg2LUccjAIzzEILaHE+WiKVY3yaks7AR/zlHeVPZgB2dcio8E
	ZXWfuG9buqbPTggJQct42CzHoT4gAo0tjkKn4KE7myPA45TDGstZ2JKniB8j9Wbol4d5hNYBImF
	RsJrj2JxM0OPdhAmYN0czM+5c+Ka6ioT/kvX5X9TJDBtNcKkhQzfL4mTC+dBBc2TcZefTBAtIuQ
	uRoeEJ9tUYYaSgVIgiKpPZoSCfuW9
X-Received: by 2002:a05:6a21:b82:b0:3cf:a7a5:e310 with SMTP id adf61e73a8af0-3e0bcabf587mr8790543637.9.1791191504200;
        Mon, 05 Oct 2026 02:11:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:b82:b0:3cf:a7a5:e310 with SMTP id adf61e73a8af0-3e0bcabf587mr8790527637.9.1791191503758;
        Mon, 05 Oct 2026 02:11:43 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d8ffc38sm497262a12.15.2026.10.05.02.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:11:43 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:41:27 +0530
Subject: [PATCH v5 2/3] soc: qcom: cmd-db: add reverse address-to-name
 lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rpmh-timeout-debug-v1-v5-2-7b9c457a191c@oss.qualcomm.com>
References: <20261005-rpmh-timeout-debug-v1-v5-0-7b9c457a191c@oss.qualcomm.com>
In-Reply-To: <20261005-rpmh-timeout-debug-v1-v5-0-7b9c457a191c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791191492; l=4138;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=b4WvXQ0COzU5NuxznFesN5SzpLiS/QR0/NbsHm44HGs=;
 b=RNvVzcrs56sHnargdf38NNNxa31yA6gFSFR1dcaqDF8Wv05IZy8BQSFGL0C0IkuLogz0SfzjQ
 ni42ddIpZ6LBnWHGluMjGZk2u1gXzp3XrUOHToAeRI6uMQRQLdgxs+b
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: hRLuLGLrjlEdIY6CGg44hMEy_lN5_H62
X-Proofpoint-ORIG-GUID: hRLuLGLrjlEdIY6CGg44hMEy_lN5_H62
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac369d1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7Q9v_upN9S1qH8PsicYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfXwyA2mbrzUpEu
 0qCkQsmfKUDVtEm3G5x3js3Iu8Yf54q3YuBy26MXQzq+VkudjDNDFoOKiwbr21HeDGvGp25Ffr8
 muAeP+rcYYngLZ9QvWYIKH8bGstVaU3jOWxhh3zLl4yOyk3liO0thNWiMzasMTO7VTWQgqljRKV
 Z2/7z/XM1hvfZGWmxJbwvf7ZFe76Vnv/qVuuQtcFAD7+gt+Kqv0BqdcllHRz56chg+wSJdDkre7
 NMmk7xIOzYTjMSwV4trVNl3yENPbE4NNNqVI9+YqMRKlc+z+WMatqvvTHY1DXwtyV57fCm1pi7y
 YcQ63mTidX1tBC84aBkRCe2k2M6Ziu7ErqE81otuf2BKGTMMbYziPjuFplmHWai6rBt3OLHBjE8
 wPsjTxK60X4b5eeI4OCsnM8wlRAK00ciRUGrC4LzJMDh2zqUJqj4IQM8HrxQO7xEkSntsOogWq6
 gx/pDS6w0qvJMEmQ6kg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX58IHsPrLU+xf
 oHq7EpXgVcbj1HcmAnoZPzvVKpR9nJflr49imUTSPr1O6WNK0fgWIfDve1utRv8uyPac5PciYP2
 N5tRD5lZEbLPy5LvPDM0eQzYBlY0OtA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050036

RPMh resource addresses are opaque 32-bit values. While the slave ID
in bits [19:16] identifies the accelerator type (ARC/VRM/BCM), the
lower bits encode a resource index that is only meaningful when mapped
back to the human-readable resource name stored in the command DB
(e.g. 0x30000 -> cx.lvl).

Add cmd_db_read_name() to perform this reverse lookup by iterating
the command DB entries and matching on address. Unlike other exported
cmd-db APIs which go through cmd_db_get_header() (which calls
cmd_db_ready() internally), this function iterates cmd_db_header
directly for address matching, so it calls cmd_db_ready() itself.

For VRM resources,
which have up to 4 contiguous 4-byte-aligned addresses per resource,
the match uses VRM_ADDR() on bits [19:4] so that any sub-address
(enable, voltage, mode, headroom) resolves to the same resource name.

Also export CMD_DB_ID_SIZE so callers can size their name buffers
correctly without open-coding the magic constant 8.

Assisted-by: Claude:claude-sonnet-4-5
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/cmd-db.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 include/soc/qcom/cmd-db.h |  5 +++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 117f810d5ca4..e1453b194aa3 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -287,6 +287,51 @@ const char *cmd_db_hw_type_str(u32 addr)
 }
 EXPORT_SYMBOL_GPL(cmd_db_hw_type_str);
 
+/**
+ * cmd_db_read_name() - Look up the resource name for a given RPMh address.
+ * @addr:  RPMh resource address to reverse-look up.
+ * @buf:   Output buffer to write the resource name into.
+ * @len:   Size of @buf; must be at least CMD_DB_ID_SIZE + 1.
+ *
+ * Iterates the command DB to find the entry whose address matches @addr.
+ * For VRM resources, which have up to 4 contiguous 4-byte-aligned addresses
+ * per resource, the match is performed on bits [19:4] so that any of the
+ * sub-addresses resolve to the same resource name.
+ *
+ * Return: 0 on success, -ENODEV if not found or DB not ready.
+ */
+int cmd_db_read_name(u32 addr, char *buf, size_t len)
+{
+	const struct rsc_hdr *rsc_hdr;
+	const struct entry_header *ent;
+	int ret, i, j;
+
+	ret = cmd_db_ready();
+	if (ret)
+		return ret;
+
+	for (i = 0; i < MAX_SLV_ID; i++) {
+		rsc_hdr = &cmd_db_header->header[i];
+		if (!rsc_hdr->slv_id)
+			break;
+
+		ent = rsc_to_entry_header(rsc_hdr);
+		for (j = 0; j < le16_to_cpu(rsc_hdr->cnt); j++, ent++) {
+			u32 ent_addr = le32_to_cpu(ent->addr);
+
+			if (cmd_db_match_resource_addr(ent_addr, addr)) {
+				snprintf(buf, len, "%.*s",
+					 (int)strnlen(ent->id, sizeof(ent->id)),
+					 ent->id);
+				return 0;
+			}
+		}
+	}
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(cmd_db_read_name);
+
 #ifdef CONFIG_DEBUG_FS
 static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
 {
diff --git a/include/soc/qcom/cmd-db.h b/include/soc/qcom/cmd-db.h
index 34adc04eac94..d03d64f3407d 100644
--- a/include/soc/qcom/cmd-db.h
+++ b/include/soc/qcom/cmd-db.h
@@ -9,6 +9,8 @@
 
 #include <linux/err.h>
 
+#define CMD_DB_ID_SIZE		8
+
 enum cmd_db_hw_type {
 	CMD_DB_HW_INVALID = 0,
 	CMD_DB_HW_MIN     = 3,
@@ -31,6 +33,7 @@ enum cmd_db_hw_type cmd_db_read_slave_id(const char *resource_id);
 int cmd_db_ready(void);
 
 const char *cmd_db_hw_type_str(u32 addr);
+int cmd_db_read_name(u32 addr, char *buf, size_t len);
 #else
 static inline u32 cmd_db_read_addr(const char *resource_id)
 { return 0; }
@@ -49,5 +52,7 @@ static inline int cmd_db_ready(void)
 
 static inline const char *cmd_db_hw_type_str(u32 addr)
 { return "unknown"; }
+static inline int cmd_db_read_name(u32 addr, char *buf, size_t len)
+{ return -ENODEV; }
 #endif /* CONFIG_QCOM_COMMAND_DB */
 #endif /* __QCOM_COMMAND_DB_H__ */

-- 
2.43.0

