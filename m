Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23F244063E
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191504; cv=none; b=NuLyRxIfia2kTNFvSDAKVyw5NJMnoSHZw2dsJSvtuRietHn5uh+wc+AxEwW4pKlrDWBX3Ar5QnyqqcD5XLpkTwzlsDWxEz84UazLSaJRhCnr5Ff0mdKfGN5BLB78+foWSw88fcUNBdC/HEeB/MF48XhY/QRaf11Zg6ijpjf1DxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191504; c=relaxed/simple;
	bh=Awtww+xGbDL+nxVnQEG1cxUG7fthGy19mjWzqfVG5cg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKKMQTwQRPEqkKQ5tZw3EW9x6O47O0Cne0XybP51qL930/ylr6CO/aRpWYFEqg5RvKMbHuBN4nVltORMGt9ZjjiMlAb7GeNQJEL4Fkmtt3FQgtqVTvfXOazDKvjRByhP80YNZUL50tdMzK/YlTGNcutC+oV/oF3WMtGHWB2zTc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBMu0uc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H2jOZsEh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBMu0uc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H2jOZsEh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xRfJ1502310
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 09:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdoSA1kgar9Z3f+Ulk0kOmhE3Fl6cLYdcHN+I2h4KKE=; b=QBMu0uc2PKO4iWwJ
	RpZ8D/X8vY9zSTP3Djd6mz8TMu4qYjFuLFqJN/1uMvBgTNUsQAGlugBUg1WUYlVR
	U36JWj/Ft8wAuEGbTMOBAQdTN+e0o2vV/l+OSbLJ785j1dgDmt0TlDW6HoZMFoJo
	HfY7hGEuW/CMKBFnJJszO85H8jgHcUP7RYm75bsBjtYfBHk9dsGUPDidTr0JFEjw
	ipLbmfIB0EyvM1oKi5In5293o5tGDOwkmIdntmpd+deZ2OmHXV9ooi14tIWwTnPY
	6ss3csoweaqJfbjwDNjV20axjgGp3xB6Z/y8/+uuBAk2JqKeALvEbuHsj9Fy7Z6n
	YWGcNA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgysf0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 09:11:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso27892225ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 02:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791191501; x=1791796301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdoSA1kgar9Z3f+Ulk0kOmhE3Fl6cLYdcHN+I2h4KKE=;
        b=H2jOZsEhQsbmHQ9Kk9waqkFJ3o7aTkyn3vtws850D/rlsuCLCHRturlkP7U+AJeZyK
         BD42tyFzXVZzvz/3xzAAccZC4HD2ssDDlsTlCVLM+jxqyi19AxcXcS1Kf4O/YeYjvvYc
         zx7GEM1kPuXGjq+zMi79/rKTkAhkBQMbAR5mzotiNZ0K6LDJEkTHkEaMRShzG5iuL3jT
         JYu/umw/xxLrLFlUFNrJLiLa0RXsZVoKMfYjuABAC4wKziKptdnIMPk+aWcsgACD914w
         aRWLDAcjNq2cf9i27pOqbn+YYQyGpkojXDjNCXZ6/c5Q6YSorCZ4mqgwIq8zqrn1jCEm
         6kVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191501; x=1791796301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdoSA1kgar9Z3f+Ulk0kOmhE3Fl6cLYdcHN+I2h4KKE=;
        b=a4umB8xkD06g5wfmNQ9O5dCjqF1Lx9+wCvVorv/nQpNGVZkJXx7Akv32e9Lpc8kaUd
         RVlhPO5aUynEGEWJI17qN+ze/NcQ1lNTv2jVQhR+HWLl5ZqREx97lZEiQjc9eI0WuxDN
         TD7mP4bkjzYtdFZnWy4REkMRqKoHQHM/GQgykpKAbO4RTZ7AdXlGikb7EtZsudsiU56w
         AldFGsUbjHZf42p57XsnN5OZ9afe9fkdMeQhS50fIqdidhD0ZdXKeAUDuHYS7SzjHEzg
         AGL/I1HhhGv36SiaqW7y42qCF8s4jOwZiW5sO/iBNBH9w3k0xqfJ7HyXbqJub8ZurVp1
         lWxA==
X-Gm-Message-State: AFq9FYJX308WfBAhDWFZmuRFbTPj0hdk3gsHDLA5qk+VGufQOrhRPhZZ
	ALcUIX9okDor2Lny5Kq45VG7NLBtJubztDtZkBZmlDFpZld2WqVWEMp0jGtK8BEFlMkaYeooB5I
	MNkOJust+duvhlvFtxy8oxwfvPlSv87fOGRRY/t/IMhnnQ3jHcbpO8fxrSHEJYxuUyhxPvoHSAH
	EZ
X-Gm-Gg: AYBFou18M7tsiBUzXxv0yO0aTKcOZD2O2zpLaKo2JBEhZeqZzyMGRMww3SLZm+3kbab
	XF7PrgHRsMJ6T3MLZEemHCNWMisTbirJsCJOcIIeUzQNsAKZrk6gGUcUGpg1y+K0KQY0cfkpHgJ
	3KkYIXK/QcuMNisdRd9U5X8Me2U1Wn1rG6UhJqZkPt4ve1czRmQ81A9w+sYlXi69J3w+E+ea1LG
	tpsxy0yC08YuDZA2/UH4dN4rBpN25O9zJ02fHhgmddQjH1D3c2/przoBQis62MUPZ93LvFIwXmc
	Ikr1z9R+un7NyApelAXkWefuSWx0CbyeEc8MHyZTlYCn3GtaeUWa/HIWXkmiOIwBt2MWOHGavx6
	Or4Eq+leyeO+uVK+VV+r3mZ1zZj1/
X-Received: by 2002:a17:90b:5790:b0:3a0:49c5:d3c3 with SMTP id 98e67ed59e1d1-3a6ce97042emr9143722a91.53.1791191500583;
        Mon, 05 Oct 2026 02:11:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5790:b0:3a0:49c5:d3c3 with SMTP id 98e67ed59e1d1-3a6ce97042emr9143714a91.53.1791191500130;
        Mon, 05 Oct 2026 02:11:40 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d8ffc38sm497262a12.15.2026.10.05.02.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:11:39 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:41:26 +0530
Subject: [PATCH v5 1/3] soc: qcom: cmd-db: export RPMh accelerator type
 string helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rpmh-timeout-debug-v1-v5-1-7b9c457a191c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791191492; l=2695;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Awtww+xGbDL+nxVnQEG1cxUG7fthGy19mjWzqfVG5cg=;
 b=sxKF58Gwb1kE0UwSVc3iE42FymjfeUmQv3hzKOAxolxAHUqBcoxtYAPSMsjRTA+O2hqoVT42E
 HVoL3olCJ5nDy7agS6cPwR+T3N/5UJn7OntorsFe0OM+z9u0pgksv1R
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: quT7u96HxyI2P4LBAmJjFAIGsr4Cxr6-
X-Proofpoint-ORIG-GUID: quT7u96HxyI2P4LBAmJjFAIGsr4Cxr6-
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac369cd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OEZb8WWwy_IDIPDo1iAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX5/nJVpbuYCYC
 +kMEEAJb80yi7uQW+5m6xosgXVoWp5LE0SojYdCVeAZMwYNywKrEz55Qz1IjbElK0jb15kd6nYH
 /0XRkRwIf7KuOpOmvOeUUumfUyRWnukkjNqq+76hCaA6NU5h0WMG3RQLHxzkIx2F8+e64+T7CnN
 ECPbUWzbhJMS4eKp8s7WDNX8Wrbwk8XpdEej39rsiu3awxrXWhckZluS1aNCzH2+xgH70RePAkF
 rgtVdf4LAnd1JvJsiCImkvpVwXK0L3o8gSvzQswoFXtZDKnkbyx/jLRhdCavO+D65rrr6a0bxla
 EF/uAbIomc7g34d8KcjpwTFhKx1R+i/cpwehX++rLvcqMvFGUXwAQKovplvfQL1GRK1wX27BSJ/
 48ZcAp9CO2ZFqOrAEYmbHrkzJS5ADp2ZfvxkKiIubb1z5ZUytPeJx6co0WkrHpKCdOoX8nPj9M0
 o/jKcQuk3+z+OfriH3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX3Tn2AXTEe8/V
 X0IMNUk2jokT7blMuVdQClEww+iK0Xx0Nlad23uUlL3WFXISKeiH5wDzQBYXjwX0F+Z2knKFudQ
 ZUSumYDnhgmNTcyr7w8Mlo983KPB6Vs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050036

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

