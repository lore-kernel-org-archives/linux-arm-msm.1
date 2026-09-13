Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC67B3EC808
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789304111; cv=none; b=qDsji204gpchc9ZiiBZZgHUTfhE6ynrrb8lEjQ7HdsZwyE0cSp3NOKE7a71QyQLxs2CI6F31a0jBqD3jGA152vt3PtHQmMmYOE/SkXG7Wf97dzvuTCVAdEyBVfp0sqIShtmjKAhma1s/xiSwXp3XGeay54ZuZAKhmGmGhrseKN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789304111; c=relaxed/simple;
	bh=Awtww+xGbDL+nxVnQEG1cxUG7fthGy19mjWzqfVG5cg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7trodRkoGNb2Em+YBOfINFaPNxxIGcOAMWFSVMKDsElalOX7sv0d+Gl8Wd6KNxj6NQSze8PBT2ZyGDXkCmj1gwDTNOg/3sCNIJWeYUU8tVy/Nuz/fnOkPnj2HDVpDJws2XlkRN8RGJCJ0DIaBT0IU5Rc2unDtYotR02qg5BGB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJ/he6kS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RN5FWVLq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJ/he6kS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RN5FWVLq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAUiaa1690749
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 12:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdoSA1kgar9Z3f+Ulk0kOmhE3Fl6cLYdcHN+I2h4KKE=; b=QJ/he6kSePzEqURb
	PlkZhDq/Mw0Rq7mc32YYsGs0JLMlsLwdG7QuZ4bC0uTkKL7PHqTZYznKc22q+L1j
	BJ2fPD1zD5kGv+kTBO9PUJvNmq33wjjDYgR14XeTwPxPkI0MyZdnJ1h1Ov1tWdgI
	LXsLyu5pIa8Xykclb0v1pliPuhUEBsxKyuJypcWGqukEq7pz1gKimHtqVIyn+d9w
	CL+KLAq48CokQrE8qMHVeAAzFYETjg/dd3fpmdJ2D/y/a93x7zRLOhNhcAEtejVS
	lXgTxJ8bxWTG+h1FZ8Qm6B5M08HMzNmJNs4E8UTx/gPoRN1eJ3J7j+7Ev0rjpiJ9
	TkOf8g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cb8h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 12:55:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc132709c76so3158996a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 05:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789304107; x=1789908907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdoSA1kgar9Z3f+Ulk0kOmhE3Fl6cLYdcHN+I2h4KKE=;
        b=RN5FWVLqxIubuj9n53DHYO7ChRFUPGftLDwLeA4oagWYW+yjqg6GfpxZOZ7BbVmWp9
         hv+hACBohgo/lui7AbecjjlwcEAUyDAce3UA4r8UoE1+hnpmWrVF0Kd1iL00QIpiQIM+
         w33a0V5/qSdGTRCr5J/IQsoXcSZwJnkb32eZvTMC41xCkpB87hXxep+sFJYEsuI4pdk1
         FzBV3+X6Y3ZTMGEFUoZs+uNG9Zpt57O8rSIbGBy9f8pWWIH+vyTsQIDANOqVONwlsdMR
         oR4WR9OydQ8zT79apTUVfvMYWmEzbmafqjHHDAWr0zXOf2C01qbmgZjn0cEqLMGwcIdx
         +2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789304107; x=1789908907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdoSA1kgar9Z3f+Ulk0kOmhE3Fl6cLYdcHN+I2h4KKE=;
        b=ZoIcxjXg9KId1DGD18L9jTgRq/idFCESKTh25XN3B4e3VBDBbLjif2rzbgr6+tl9SK
         vIc2Mr8RABNLfB850jExH2h/g1pkXvyEIctwQJh+XcjCJIfiB6sZpyVHl7eoZmAAXQG3
         u3IOO3OkUbmZy8xnPgU70MYMW4rCQbuAL0Fig/BB6A7+0aGMPv0PBTMre2S/PhKQkOkN
         oHONsdqYTSbvZa0A6kgSrstvoXfq+hqNF6B73mXPJ1dvYUtEMqvJVaB54GFj10qrl7IX
         Xhtgbjf2TwrPBsmKUpXwBEuB0Vd2Va0qNEBHGqdmRxxmJuTsCZa2qs5oj5U71YUDFrKX
         l+Qg==
X-Gm-Message-State: AFuF++lx3fEUt0Cg3658PB86tMLqip2ytEmH1JvdVhb6EMZXTBNMLvuL
	ElkR7cGZ+lgnpuFCsTZKY0TtiiqpFXcj2M1tty7R+P9bU+IbWIPHP+/h0zq04I2COuYM92R2XxX
	2uVTOe+l2Hh88MWUDYPXACSD+b3Qo+LZ095pMomKGTjVJrmavnBzoxiYvQQzWIZEuqjHd1BUEYR
	/+
X-Gm-Gg: AYBFou2Sc+uPR2XDJb/1uicKnJutVMhGiPyFbzbREH0n/DmfNjWNOkHN48VIplgTtg1
	OTb/v+NBEbPO4cwWK6NNLDh7Fk2Qdwy19zSYKsIBXFpFml98/Oh8xMDX/pNl/XDN+6BgHJUqwqB
	Sw3LJ7acY5yVynzntEa6NjI6XScMypqDUtoI2oCRPDNg+4PTwRCwslcCLQL7qGHnaMpnkuO3k5g
	aybsXWckYPcTc3B5yUyLTRIfPuvEYIA9PDKVZR48wuUWHp77lnkPsF5eolj56RDpgkw63rF1jNr
	psP8SpoaME8eQBPHyvINUo5X3txQnXvio095INJJ5+bcMmdmmJp+tEXEcssBberc90kylsjuChV
	DaFscX4IuRBzZOJOa0ORnU9zyBDXZ
X-Received: by 2002:a05:6a20:1604:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3daecac7fc7mr24845477637.0.1789304107328;
        Sun, 13 Sep 2026 05:55:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:1604:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3daecac7fc7mr24845405637.0.1789304106887;
        Sun, 13 Sep 2026 05:55:06 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm18027211c88.1.2026.09.13.05.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:55:06 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 18:24:23 +0530
Subject: [PATCH v4 1/3] soc: qcom: cmd-db: export RPMh accelerator type
 string helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-rpmh-timeout-debug-v1-v4-1-e94d3e416ea1@oss.qualcomm.com>
References: <20260913-rpmh-timeout-debug-v1-v4-0-e94d3e416ea1@oss.qualcomm.com>
In-Reply-To: <20260913-rpmh-timeout-debug-v1-v4-0-e94d3e416ea1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789304099; l=2695;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Awtww+xGbDL+nxVnQEG1cxUG7fthGy19mjWzqfVG5cg=;
 b=OVr+rQ/in0HOwWQo/kZom+aLV8VkNZu+Df1BTO6ImCVLM/MwGUe2C78n15CAcYijW0gnTzVVs
 n0XaYyQcZ6eBgDs8huSIBTCaHUtEwXahVm5RBBYyq0/4xRGl202C3bW
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa69d2c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OEZb8WWwy_IDIPDo1iAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE4NCBTYWx0ZWRfX4oIs+H2w+6WF
 rreuU6BlrBDgChpy5OsEg2U7TZN4EbDzIRZ/5s8DHTqF0WQBpUPbd9MQwfKu+uBnGno8JMIuoF8
 d5CJlOfaUdk9eqvnoJKP9JuCQ9H/V8E=
X-Proofpoint-ORIG-GUID: iAGd4njD44Fv8ny1zs9PbQ5Wsw55uyHt
X-Proofpoint-GUID: iAGd4njD44Fv8ny1zs9PbQ5Wsw55uyHt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE4NCBTYWx0ZWRfX9aN7e4kFTqOH
 +qFM+aOY6X+PJPMseXfX0Y0MMKOdb4DIyEyWluh5oltqQceXezU/6sOvF7IPAomK5jOrTUfjmxR
 XdNu/eIxErFUvzfaJaLxQ7Lz5zJxuWMnu1lkoCnB81Ll0PosXQUj0rG8c7fK6opamJ2OQ7wNqXS
 0MxcBjnICCOXRgMfbwhU4sadYG7X3xtfpEmYCLlq9dDKC4jXgF2NDqEfq0SnunIAqSg81yfxbOS
 bL6LmGMkT7L5hk9eGcQdx5DWl8pWrDIvZEqsfaa9D79l5bNQR7BbrPY3jxaiDSPKrYHaeR0HIi+
 mSjqZEbeTAQeYzyz8wScCgb+xtjhQaZ2SC8eYXRkWgXqoggqdirVX5vjUMp6l5y0ygnLd8w71Db
 L4e8Ox7tJsVfI7klSR3BLhHvOfKqoUS46tK0tDzqf+3z22eBbdjhAsktMbYcUd3CLjTHeUg/yfF
 xGv/xBfu/oOVJje5hvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130184

RPMh resource addresses encode the accelerator type (ARC, VRM, BCM)
in bits [19:16], matching the cmd_db_hw_type enum values. Add
cmd_db_hw_type_str() to map an RPMh address to its accelerator type
name string using the existing SLAVE_ID() macro, and export it so
drivers that handle raw RPMh addresses can produce human-readable
diagnostic output without duplicating the address encoding knowledge.

Assisted-by: Claude:claude-sonnet-4-5
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

