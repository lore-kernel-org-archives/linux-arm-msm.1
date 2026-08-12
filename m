Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BA0339393
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515187; cv=none; b=txgLxMXleeOdvru11RWXQLZuqFChABHDpAoqFephoiEKru85wgqbQoQ5oudt9OTups5fyn1tesUkEfSei7Q50/DLrbm2aU+2UffYVNgl0+/h7OvR2SxilU64X4HX4mMM13W/6+od+hM/GLZy308CQsT60ZD++uOjXf6JiipaOfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515187; c=relaxed/simple;
	bh=yHFPGk4Ve46gltpkXTYpju+KIfqAZfLFpVogqh5/qUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLhTvLw3vl0+pNOi/sH+MmVopuF+asD8ZduMVDWFS3M6sfCNhrobvlSEGi7HRLyTvfjQemXGES7+5oqfFcZxXOTaZohM+m95SNEnnLcbt1p6ISw0wWqpqDuTxom14LCIxqjJO/zt8MlvpyvSSD6yrJ6mNNp5qaMc5a92GLbaXjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjRo7WXi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NteFw1G3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjRo7WXi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NteFw1G3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62B8e2646686
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sD3nip2OzwAHAEX776zfWxATpqXIE4RoZscjyaaIZ0s=; b=DjRo7WXigbnKrs36
	IjzZJv+4jq/YOLpLa1hPcXWqo7oKFdwCPd+4TrwxzQrpiOn4ZKmjI6C5PLC/KvTY
	/eh9fRLJOHyPe9/JEJAtBFWdN8Kcs4VDYG9ncaVBUOibnwaOkSWuJOStNPwwjW8I
	n9QmQWyXN70CwkUjEPzdPaB2EJNt/Z27q2aEXNkIWFT+PaKIPoRC9DJWbqQtblK3
	mBPbUeDYzaiwsx15JD9usdp3xBODHT0nA+ka0B0mdplz06swsq7f9Stvqxab9Bvf
	8FfI50y8CWcgz9SSu1/9G0XcbFB9FB642lP3+4wgX+Z5pPqgbdiQ7xaKfJ9DrCau
	xlfTqw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049kktgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:13:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso2043885b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 23:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786515184; x=1787119984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sD3nip2OzwAHAEX776zfWxATpqXIE4RoZscjyaaIZ0s=;
        b=NteFw1G3AlNz/HcUjPdqhU5eJbdjiaD+S6Fi1bhVTtILpI2XRiFQMOl/tkYgwlYldE
         Bd/FkLQBMAeM7X8DjIibeTBWWtUH48z4pNmUPAT7OVSG+5JdqqHdwyJbeep57TCPKxzo
         w8fjmEHSbImsNu/0AwLWS7JHl76tdVRYYGCjDOEhWeLq7PrwmTgM5wBrD+UfVK9LmSOG
         re+5hNurkPuMs83aOeitkONcX/7tZROJ/uM5l28MwflIKxTGyXEKeXt2Gt1FDZD5kwpn
         rvEnr+jlxuOcPH2t6Ti2VSQYIn3HPthlB7S6YtFdUvrXIcR2YLOZfgHzo0gpZBqCTZhv
         Mmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786515184; x=1787119984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sD3nip2OzwAHAEX776zfWxATpqXIE4RoZscjyaaIZ0s=;
        b=fO0zhbpnNb3CJRqhUvhXQsldBqoc2XRdD+3K6oaZShm2kSxJGFwNSjGJXhaEWygBPP
         HqgOnWaohzBSAxa4BIfr1MW/MaQ/KMquxnoWWmVdtUTeKzm9W8IGEkTbcamLN4oKrYQY
         6Z+GMOMOe4ssmxuxwv+o0D+NAAPJUUNE/xsQJD64jlDckshvOw2gCfFyj64I+zMEpvUu
         iH0Oa6s7s8moMC+KIWEbmQxyz3hO3AbGb+/olZ3+C6uCS7RhuQ+G3HcgJRMLJ1Ds2iOe
         Q9ZugJnTjK7cft9W9WztJO5Svp3wOMX11wlOCByVRnscf6ySs4AOmKnpaNyw3tWhGK+t
         cHrw==
X-Gm-Message-State: AOJu0YxRcONmOUprybDNCZ4BIksGGTlBW/y1tk1CEQQ5c6v1v60AH81K
	P0RAGL3Z81MKtIWhasdgtR4R2Ab9vEgVNYVzMpFCP01ixMLuHsFRlsM0P7/PqLQsla7bMgMsbdP
	uUQtWr/D3Ej1/j71wZd7E/9nSraRE6/aZvijDpV78zA0k2Q7/Lk/SwGRGB86dUWekGZCk
X-Gm-Gg: AR+sD10+wDFhqee/uS5XO1YT1sUALt+SVyCgN0kxsTd3ezEfHg+Hv/tguw4hEO2l5b1
	EhJujlOFIcuWJn8s72pASm2b8iLOXlA7N//o8gP7YsnhmnWS2BWDFipgvoP1uz+zW4Fqn3mG1qA
	AnagHAp8lAR90zr/YHWGeHSYGR04AtucgSwazT2sC4w/agxw0kZpS3TbSgK6ce9R23vUFWLF0oq
	CaCW6wqjWOOdBSFzVHlCV9okB56HGezCvWKSLfc/A3vB3k1hLfvJGrqmWFOMg/FkozvnJNcFpfM
	5+aMvFvLPXaCPR/gH7rex9cMFImVJgZ7Too9BmzptYANLa4C7zFboSGjF+rt4GaE7S8W+YTzBbM
	XrwRJlkSec9LurZhZ4ABx1CEGhWOM
X-Received: by 2002:a05:6a00:22d1:b0:84a:29af:a0eb with SMTP id d2e1a72fcca58-84fb6b36440mr2181143b3a.9.1786515184213;
        Tue, 11 Aug 2026 23:13:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d1:b0:84a:29af:a0eb with SMTP id d2e1a72fcca58-84fb6b36440mr2181101b3a.9.1786515183762;
        Tue, 11 Aug 2026 23:13:03 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1f2587fsm525814b3a.49.2026.08.11.23.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:13:03 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:42:23 +0530
Subject: [PATCH v3 2/3] soc: qcom: cmd-db: add reverse address-to-name
 lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rpmh-timeout-debug-v1-v3-2-68c0a40dce23@oss.qualcomm.com>
References: <20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com>
In-Reply-To: <20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786515174; l=4077;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=yHFPGk4Ve46gltpkXTYpju+KIfqAZfLFpVogqh5/qUE=;
 b=5wkrQ6sSNlPi5Ba/ljPf6ONf3bL0YFPFlNd+AMbKJDo/tMAzwEllEvE8QurgRC+9d6KnfrCEk
 hPuvB+6PEqrDI8gYbdULVbuL8VJ4OPJA9W4R8jqpC8NfrEEMtjeRpRE
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: ZNj9rnh6UaOC82A6cgKrzVGZh12Mbm_j
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7c0ef1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1a8ZsbFLG5WLaQwJOl4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA0NyBTYWx0ZWRfX6gQsuHYNl8un
 m6/3I2kAyRDyahn883gIHzFzy0udEzKevn48gl09T++t3XLB3dZhp7i8cfAypENUyJWhRDoEerS
 tNTQcMGXr5jIns3g+7CDGv2FcdWMNlO+Y9KDxOE/M2DmRA7j2ndY8Bq4udbp88Cj/9gPhihee00
 ZpXCLks96n6jBA9YtmGgfIAbFziueYzQymo9qAIsTJsEhWUGDMr/cYuiUx0jJp/73t4Hg+wvx0r
 BReVLZOH0YbqH+vSfTjF0LZ6IZlf8M/O0A98vHlWvptDw4aDzFzBk4SBX8epIbmy1+5MiWOaWkY
 p06cbOEOb84Utsunv43eJrU68jqI9oTfYxjPTAZB1SfPX5cmttPfDVwxNqPljSnAqsQaH6c8MLb
 UzaN1Xf8ytvbiBCBpgSvBSIXNQmVICwoUFS31El8crcRxj+KNVa7nBZ5DtcbH7HF2N/hbDhqQDA
 XRAR976fu77R25YYlyQ==
X-Proofpoint-GUID: ZNj9rnh6UaOC82A6cgKrzVGZh12Mbm_j
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA0NyBTYWx0ZWRfX077QuXyF+4VC
 VDAJeSCHXHC2I6eUA0GzL453M28FA1abVkI3xdrfAEWuWwNtx988SJp6c7MSi0Zq6ilIzJ8Q7lS
 b89Dx8eAXt17iUDkE5eZDBkOGKgqev8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120047

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

