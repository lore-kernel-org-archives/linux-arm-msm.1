Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5BF3370EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515185; cv=none; b=lb5S305qyK7SFm9Ht4GIuJboPT6BrYvG8mxIRIjj3A9fjJJTs2HLTjkaAWe94EkmZNEBGS2zejL9QAU3j5wM7Hs06XJKbR0aGDOGMnviiqHYXW5kDxEwJ+KEyFjF+QCeTMQ/keXicUWsmt1P/2x5JERNF716E4Qlf0qaYotjWbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515185; c=relaxed/simple;
	bh=FWcf7jXap2e1oAdtrMlLlfIQz1hfUQD0zUkUAvMjor8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qTmIwwkuxIlhnui+Dr1cgMyTt353JXJMQ8htUvO0YyZStjalEmVFm3rcFFuAaAxoBOUv+ZNVMaQgpqpI/kfe4JGpFJw50BlEotR2Rja9/lZfyhw0cOYh735TLmWVUCnNJ132MRklfR186RMwEObS+/tQbNMQMZiS5u0Sfy1lNzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdcjaKum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/XxRlh0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdcjaKum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/XxRlh0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62UrW1720208
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSfyCqFI87uyrVyuB4dbWtl9ODKrTRPvMz276YDye+c=; b=kdcjaKumbxeSifYr
	/6lSE1pQ57SfmrKvZcx4Lcfs17E3HX+6dqKPGbqWQv41f70yY6gW5gK8I7wuauBa
	LQ9nqRuI6b9Aq/A0bgwesUMyXlgr1fDm/Ckbs0uhYg5HgT4R5prTmNCcH7BsOxXj
	hCrO26nI3oWPkZmWVTZqcANpZf4RUWF4NSV0P4N1a6OV7Ea/lPYNY+UMKm3GhWoo
	ZH3JqhkhfVmz+7JYiIn1dBLVcFZFt6WvQ2tC5njuqLUIZqnUJVKjrxllctYDq81S
	SJ8Ua/v566md+nXAbCeKq5xuaXoA+Y10XBEWzum7jKcH8FE4G94r3OTXO9Q+n9Sa
	5T4ijw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hfw0cy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:13:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso2043855b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 23:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786515181; x=1787119981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSfyCqFI87uyrVyuB4dbWtl9ODKrTRPvMz276YDye+c=;
        b=G/XxRlh0xGYwOua/Ddum+aaaHvnmd8xZPN1l+yCTNh2m7EinFak4WE20s9Gf8O1US1
         QQimPraKgnfZ7mDg4+M6WPIHpoilRFrhA06xoCyfzMe/ojt2hMJiLDHd5WJ2z3vXhx9v
         wTFefieXcCsIEia5akr9QlHF06pGzgPXWxGm0XRZRzQvq6aHk98+g8FxLKiihXzALzgF
         2kjCwmT1WOwhLoRQhg2rKTb0dEG15UU2pg2YjS2DtABxPfqzXhQqx/yb9V0Q9GkKh16I
         8CFPZjtuceqsZKoJb7z97OfCj/UBMLbuIPsDx0rrh93AbkljFwytBk8qr5XiqE9T6rKF
         mSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786515181; x=1787119981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSfyCqFI87uyrVyuB4dbWtl9ODKrTRPvMz276YDye+c=;
        b=gKY4zXNSzR5G9DVr+wgf0AUqiSHRu8FVLzvTF/9MzIdJWU+hiPMmFHJV7j+MzssSJ4
         AIT2a2d7wlffAqsUF5GTYaU0QlP4LJl2MT1L86l650r7EQZ6XXVcs0X9bYs13e/GTh5c
         bH/fAEZnpY/u647oEFjQ+HJY9/c1Bo5VcVGvPnhajSyV60Zsj5BMClfS3fVAN76mUGs8
         NYLO8SUQ0pHqRV6HmG21UXTBs3NTRfqhXbFCblYhTQ6hxUySoRnTM7uXMHHDUeOYJFdi
         sg0TEmcdROS/x9HVpHzVl1DYCr7I4UwHWyu6rteNlcVGVhWiZcDXG0/be8oMGU8ABH50
         a30Q==
X-Gm-Message-State: AOJu0YwKWW5KsF/cBroPN+M345GsaGUasFJvBde0uHxEW9SLC08CUItd
	w+U/Ra1BsZrbzYnV9IOjTv0a2dC5fo4MRcmdtk1cbqUJUiqd0caJk0O/bzEboFaJmgt6X9tce/x
	U5yMzszgpKXaJUbbWG7g+v73twiV2EF+yEIszpVXPSxSOe59ismjJlw3TRIj1fN7luA/l
X-Gm-Gg: AR+sD10bVJ7itFw7ur2ctlBTAtsFz0KoKWblk10rh08f19LI9XNlwLuBfffX1KI8hrv
	5EBseY3JhnRgI3rULStRlPM87r00pzGhszgEqHKVIi207N2LL9OLtb7q7fsFQpEptnjy0IKvv6e
	Bccc5oGJ5v8w79f9x87Vmpj4XooqfySHrtFL7G7knOdSy0YHKYcEi4ZLix/eSTV4gT1rsaYVhVW
	pcd6Ihu/oomRU7uZTa46je8Z0HJNDLPO/gfPTiscIYIJ+WkszN6O7ARSc5MYxaj2367XTxnFdC4
	+tdk/WIhZWNAdGhNh0knjE8KSnGz28v+eGbY6L4m5K5yocp7DizrU1xCjwAtBRoGxDBT9tKnXqG
	QwD4WEWKPyDWbltE7XFeOvP5lJ7qR
X-Received: by 2002:a05:6a00:1d9b:b0:846:5d1f:56d4 with SMTP id d2e1a72fcca58-84fb6c547c8mr2237039b3a.14.1786515181339;
        Tue, 11 Aug 2026 23:13:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d9b:b0:846:5d1f:56d4 with SMTP id d2e1a72fcca58-84fb6c547c8mr2237007b3a.14.1786515180884;
        Tue, 11 Aug 2026 23:13:00 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1f2587fsm525814b3a.49.2026.08.11.23.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:13:00 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:42:22 +0530
Subject: [PATCH v3 1/3] soc: qcom: cmd-db: export RPMh accelerator type
 string helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rpmh-timeout-debug-v1-v3-1-68c0a40dce23@oss.qualcomm.com>
References: <20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com>
In-Reply-To: <20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786515174; l=2634;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=FWcf7jXap2e1oAdtrMlLlfIQz1hfUQD0zUkUAvMjor8=;
 b=Bm+e2cL9S33s4ri70rSunwEaXTK6VlpUuHUlTPohfTtc8+OYiKQi8dTqY7Xb9SilOUD1iu2mL
 byMuD4IJvnKClLHEc7U5DPk6Nj0Sz/EbgjPELlVIztUojRw4FMYiWfL
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA0NyBTYWx0ZWRfX2rB/CZotQUal
 mV1atAbT/fIVAuQWqyM+zbrL/cr1F3Um6KV9T6y7uWBhQmkzVKtrTqxOM9GMV45rQMr3rEj/s7U
 c8K0CXH8ghYkdbqNdQyooBq+JJE3b48=
X-Proofpoint-GUID: IHv7sIoow51Liad8NFlsuyw1eMc96BHD
X-Authority-Analysis: v=2.4 cv=fpDsol4f c=1 sm=1 tr=0 ts=6a7c0eee cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OEZb8WWwy_IDIPDo1iAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: IHv7sIoow51Liad8NFlsuyw1eMc96BHD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA0NyBTYWx0ZWRfX73K3qE5bueM/
 OIOIJnb/7AONigqlXek6/aEgGitR97QdFOVn9NxasdbvV6ZrtaWiTx1a7jmFURclw2Wr+fCaDuC
 WoiQAvlMKKTR5wAismqxaiPiCERO6GQpNWFtCeI+BRuV253RA8wTud4UNi87AIcgQkdWwvxBR3T
 2WgX4I4CABVBYuIOK0SiTr68YjXE53JThzVleCvWlrJwOFc0EkpRpu4zMQIsvmpz+Yj6WVLhuRi
 JY9rcZOu8G2lUPk+zm2vkhdLOI5Dn9qBPfdha+kH/PdSNMMvcU+39l3+3JDAv047T6fGs+sc8w3
 oJHCcODXpZ+u5wQZfNHE8tqiISqdpbj4XbITZhx8ygIBNPM8G5a0W8aW4W3fOsbypWBZYBFWipK
 X7NOCLA8Jt9KGFJ9EwIKl4A1JW9KCVH5AeVRSyg1jXwEe8Ppvu8Cu9a1m/hA0z0XhkKWu2tPGfb
 fETEZt5BUlFsM3Ey6AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120047

RPMh resource addresses encode the accelerator type (ARC, VRM, BCM)
in bits [19:16], matching the cmd_db_hw_type enum values. Add
cmd_db_hw_type_str() to map an RPMh address to its accelerator type
name string using the existing SLAVE_ID() macro, and export it so
drivers that handle raw RPMh addresses can produce human-readable
diagnostic output without duplicating the address encoding knowledge.

Assisted-by: Claude:claude-sonnet-4-5
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/cmd-db.c | 20 ++++++++++++++++++++
 include/soc/qcom/cmd-db.h |  5 +++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 3f1eee784387..117f810d5ca4 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -267,6 +267,26 @@ enum cmd_db_hw_type cmd_db_read_slave_id(const char *id)
 }
 EXPORT_SYMBOL_GPL(cmd_db_read_slave_id);
 
+/**
+ * cmd_db_hw_type_str() - Return the name string for an RPMh accelerator address.
+ * @addr: RPMh resource address whose slave ID encodes the accelerator type.
+ *
+ * Extracts the slave ID from bits [19:16] of @addr and maps it to the
+ * corresponding cmd_db_hw_type name.
+ *
+ * Return: A constant string: "ARC", "VRM", "BCM", or "unknown".
+ */
+const char *cmd_db_hw_type_str(u32 addr)
+{
+	switch (SLAVE_ID(addr)) {
+	case CMD_DB_HW_ARC: return "ARC";
+	case CMD_DB_HW_VRM: return "VRM";
+	case CMD_DB_HW_BCM: return "BCM";
+	default:            return "unknown";
+	}
+}
+EXPORT_SYMBOL_GPL(cmd_db_hw_type_str);
+
 #ifdef CONFIG_DEBUG_FS
 static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
 {
diff --git a/include/soc/qcom/cmd-db.h b/include/soc/qcom/cmd-db.h
index 47a6cab75e63..34adc04eac94 100644
--- a/include/soc/qcom/cmd-db.h
+++ b/include/soc/qcom/cmd-db.h
@@ -29,6 +29,8 @@ bool cmd_db_match_resource_addr(u32 addr1, u32 addr2);
 enum cmd_db_hw_type cmd_db_read_slave_id(const char *resource_id);
 
 int cmd_db_ready(void);
+
+const char *cmd_db_hw_type_str(u32 addr);
 #else
 static inline u32 cmd_db_read_addr(const char *resource_id)
 { return 0; }
@@ -44,5 +46,8 @@ static inline enum cmd_db_hw_type cmd_db_read_slave_id(const char *resource_id)
 
 static inline int cmd_db_ready(void)
 { return -ENODEV; }
+
+static inline const char *cmd_db_hw_type_str(u32 addr)
+{ return "unknown"; }
 #endif /* CONFIG_QCOM_COMMAND_DB */
 #endif /* __QCOM_COMMAND_DB_H__ */

-- 
2.43.0

