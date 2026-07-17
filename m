Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB9C364953
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784274637; cv=none; b=VMmIMeRmGI+IaPxohQNFg6fPgm9PULgZfHnLcG0DHRcnKzgCPNo7alwFmmUaEYXGSGfpv53xYo0EQB1p+7EMampGfG0Atc9Wuc560gFVgW3tvBDv5aYWgia0a5mx5sutFmEQYxjxrYzI4gYBIVwDaQo9n++XquvLyQi1iBfH6fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784274637; c=relaxed/simple;
	bh=RNrrExDB0crs+KWWfJaxcH+5XUSGEwzrOWOOZER1RgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uaZsMFEAo0a/pipwf7lWGYwpch7jAcMpIjEUjlUHvMPP/lfZr6H5Y2k2p3HB8dVBnAjixcY2UJYM1f5KEF84JTRlN+ywBIFtK8TnUYv8zU/bSUYFt7WZRnqE0nEsWKQ3Lj75aCo1TDNj7PmTpPZX+XruyDVBQdDUGg2hI5pc60U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Im3Ln7yl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNa97OmJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Im3Ln7yl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNa97OmJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cIPA2098556
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z9ahLJd24WetNOKn8K9LuXS+j/spyO79ug8RcOxvsHI=; b=Im3Ln7ylHwcRdawX
	hVJjE5BaLEjbJD6XkHBvi4aoqmUQS2LzWqcBgJwi9Or3yYdEW44E/6tJsJh4hn/C
	eGj1hhD+nKCTZxZ0RXD5OBUc2/MyrKYCR7xzxQ7/P4aytgRB/mPprGzfFIktVeRq
	KP5SBLgmfspiKg9tYeWM2PaweLq/waomyHVASK1cgVH+907Mj76db5qPcywCQ/Ks
	Z5I9AVFvRwAc/eDAP9/EvaR6fAvTIuvl+j+IY9wI/2vAoTVg47OngUDeywesyzNx
	cnwSo8hoE7bnF9pj6b7u5NCtPzOGw2/QH0OkWWfgsr+RzjOZK6B5+fESgbLyTzQv
	R+/W1w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6jn9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:50:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a67b16217so5343149b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784274632; x=1784879432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9ahLJd24WetNOKn8K9LuXS+j/spyO79ug8RcOxvsHI=;
        b=GNa97OmJq2GSS9lhS1LWjnjMgbRKH8Z0o/AIyGvNwU9Wu9rDGIXqU89M/gvtgg7VPA
         XQha5E4an5jy3z+tb4RbEEm87t1qtzUAwK+5FNqgABZuK4jMzMZd67Ol3phg7lrY10lZ
         UI3sgBBjGKO0WDZ9A7tGa/Qds2Pw50rC35AFny6V04nKyzf/GddUmMHBWVBUaKeLVZs5
         PGzx6YKQvJHgHIidrXT2eGwBUA/+y4zwW/ezLzK9YcaN7iIdd0XgMYPFztzqL8kUxkQJ
         +zsPxS0Ce9NJ2lMkE/vxxIrKIexyxTjO/CetGsuyn2QPuz2oQEIMYkPoWW2Q4y6cBXV+
         yy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784274632; x=1784879432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9ahLJd24WetNOKn8K9LuXS+j/spyO79ug8RcOxvsHI=;
        b=lavFiaxQRnkO0O/TwEUzUOQ7DIDfAEYz7xjfyk4PCVKsXdiilEzcV7ZjLVLVC5nCk/
         a+VqG4Uw/omOYWgbOSiL1rIKrqsBXlsn/B1i5oEnXIUyms1bh7pVI4eZ9mEQDaUrfyzW
         ZV+mnzBdKARuGehxPOV8PLyNgSyHNgJnVx95XWe4PeXxb4HLncs8K9HrgprcVLma33b5
         4/ZTKt78n/9Cd3FH/mcPlmEccYTxZ6HjKcvEjiO8wShP3aGsdLwCUYzuDxj6GTnnJjsD
         vGUmyF+zzLBCvp7hpdklq4nyALGrvwhuOFHbya1Y1hqkDreiDquLtYZ3fG62m+HBJid4
         vPgg==
X-Gm-Message-State: AOJu0Yy5YhUf4pM7KHqalt2ckwlLhm1JVvKxH/PszfFQx545ULjv2V3v
	AaP0D3D8T3ac9jvI6qyj+rABsN1b2UTV4b0vZkiHyZ8PWvNzazUzrH9rff1mErgIPu6DqXZGMX6
	unUlcpmUvrSxiA0CfZLkjER4Qc8GdIzgSDA3ep83maLrukMhLIc26BUtIF988RATv9d6EaZfv1s
	5+
X-Gm-Gg: AfdE7cnW0x005w0mAFuxVXYBLOtScvF6YLff0YGTX+o9Qc2zoBD6YaBy5AfcExGtcRJ
	HoK0H8iUk+zo2Gm0xskXsK18t5IVhQZHGS7U79xKETlu14sjM7q+9LLsAU6HoD5/fPcUzyyxuG7
	EpnKMOwNu+NnB/huuGhYeeFA+1AT+7ao24kQox99OvXhM5TIYa6H3aA4R1zyMU/zN++pFinR0vY
	0eCe3CFf9PPoIKxlx7Usu9n9o6dmIh8yeMXwixVqvRNXgpXmD8fdju5D9+nG9oGtRLzKszm+Zr7
	MqkGsnAD60ebTvoDL3DXbHDzQ1U+NJYZp4jcOqtV6CzsSZTPJbqNEf2E7/cVbT06LtC94apbu5E
	CJewjXSwQND1gV3WkhNTb9GCs1jfu
X-Received: by 2002:a05:6a20:9397:b0:3bf:6c08:fb94 with SMTP id adf61e73a8af0-3c3ada37416mr1635800637.54.1784274632173;
        Fri, 17 Jul 2026 00:50:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3bf:6c08:fb94 with SMTP id adf61e73a8af0-3c3ada37416mr1635768637.54.1784274631685;
        Fri, 17 Jul 2026 00:50:31 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517f8f223sm449323a12.9.2026.07.17.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:50:31 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:19:43 +0530
Subject: [PATCH v2 2/3] soc: qcom: cmd-db: add reverse address-to-name
 lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-rpmh-timeout-debug-v1-v2-2-81ade4fcdb49@oss.qualcomm.com>
References: <20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com>
In-Reply-To: <20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274624; l=3945;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=RNrrExDB0crs+KWWfJaxcH+5XUSGEwzrOWOOZER1RgU=;
 b=irz6cUlYq/G1EhiVAhtIkb7QKbkMRxvSwCNYQK/+r9ATKC6bj+sCcnQIWd6ak2ktDhbLkqS1s
 qmpef3WCBPzBd4+HbaLC3IGLosM5B/6imcb/P5xJpkTkkMe/Yilwdac
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX5KQdlEaKBn7w
 MpmiS3lRS2nw+JV6f/JrXbbFebeNTPcAy+1kBiAL0cweeJmCR1/8axFwBxD3b5FOhyK6b7XoKwo
 6j4J2NjUe3I3Eu6cU1rUiMtzi98CNW3hgX+Ug8XwJDAXXJTw+DYabBi19/UEBSijREboIGeow4Q
 dOdpYrKuIbF8KNPovoTCMp0hHZ2jsn08bN64/IMYIWXMn46bPd5IW8093oAT6wRGmnMzO6hRquV
 jsq6exguUAmDmunl/TFNSyi5k62gsjG7Av1gE0vOEyRBM9XRgvCmGKikV62hMmKBl8JtX6N2oCs
 Ax+1aDuYhg+30//gspFJXVivJrrVe++fDpxuI92R/shKDQDYG0QWvCoUx8VVWsmpNE+dp4Y763h
 Fli5i8g2b3FpROjmcSh+p1Qml89MxcbuE4DFIVADXXtxg+HD6htjsSlSS0K0Ue4W7zL5Fg/ASJx
 o65SbUn34hg2v/aH/DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX8x+xOU+Qg7tf
 eGlH9ZR/kaDMy+lF9R4V86haO1GZLe/KZ2sVBgY19xtAupYa2uYnISwsF0qqC1XhKoK6Uj2CU0z
 zKSKWVnfJIIpwQ+LcUw/HL4QkViWDmw=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59dec8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1a8ZsbFLG5WLaQwJOl4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: hzpOtjprgBrpMIPXDROPLZePHC5cPIxl
X-Proofpoint-ORIG-GUID: hzpOtjprgBrpMIPXDROPLZePHC5cPIxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170076

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

