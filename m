Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F430221D89
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236295; cv=none; b=nN36q2N8BK4VkMDCykXkvMYQPriVMOixMFhGHEp3u4mbwED+fUYEZDB1IecpKT8IWQO0ZiepUwEZn65DXDADmJO+J81enPSD60TbPUmWyNXwQ14pPz49kH2+gZVLjMGpj0FS45BVtpPzfhsF2uV3Br7EAWKmiGGzTThqg/SU1ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236295; c=relaxed/simple;
	bh=r/aMG71rbNo/S6UKVNGEmGXZ3oMHRMlBBnvkHh++Zs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjkxZ72rZ3AHDZTfqrYtetlmi33hf12bET3GELzXCmNSR6o9XU6VHcynRcqB+jeFSCLD/siq+l1TUVOukw7zGwh+aUVGE8LlivW188ryOlZ8v75UpPpc3zKDbumbkZupO5JrBk1113w4VWafe7OLXz5/bOachrVHvZ/Nu6ApDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ap/JbhVg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VApScuvx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ap/JbhVg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VApScuvx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7WHh3559836
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PvwUyC83yu4XUNEMIRKr2REu9WIwE214jdhfMG4Sbcw=; b=Ap/JbhVgOoD7MASA
	6P5eVIh4VW1RgBKEYqd2+jxiwnc/QOEFnxzSk25fXKRhcJAvZa1NeYonNBZQTRMN
	4JIGUvcJRxyEUvRLO22K/Sa3ClRsO8GuXHOB2DEDBUfaBW+LJ2jHlOM5ZEj7ja+s
	UqiNtfJdZQxMgegKt0MT/EZPq6n1faRP8earRFUa4ypeV7HRZRFWWYG0m4zE0Rb8
	Qv19/3+eEKFyoAbo1Qhhu88l3Ng9ETnDR98cPT42wC8fttYTyzBZaIAnrjiiN0UI
	3SZRCPHg9r/2ZjOV1i+ZWHkyK+LdHgpLzhImt0MukNja3T3JmHSoRMckGsc4IHKl
	WgEXBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk18cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936d067836eso276841985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787236291; x=1787841091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvwUyC83yu4XUNEMIRKr2REu9WIwE214jdhfMG4Sbcw=;
        b=VApScuvxjqX3x/m3NtH6grAm+NJBg3rIfHdu8qkNhY0IM7eNaEeD5vlftrj7NuCo3l
         Ae9Igxbrxi7K4a/B/vf20727qL10dxr7gTlT4N6xg1+jY/VBhwlIg+WK8MhjLMtRbBhc
         CVaZsOiaoFd88Zy1+bqao1phT/d8RSVb606dYVngacPD+DhezldLBqjZpY7yJwK6wXrq
         Gq8o1ewF3jd2eSIubHUo1p+Y+wx0VOF/VTBAgAMhRsV3qDY7NKeHr1DzFl9Zn8upYJ5S
         8yOsTs/bSTFCmiwpRy4PXLU+E87ytmMFzKROB5UrcDZJf8TRqcDh0zDU2tGKBfEgeSuD
         Y+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236291; x=1787841091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvwUyC83yu4XUNEMIRKr2REu9WIwE214jdhfMG4Sbcw=;
        b=fwFyVfusFhxyMp88G7wHTicPK8U4a6lJ4k8E20Besj9Ma1lQmyNWS44XgICihItfz/
         SDmeoVBeRmfwCl2XMOW1g7hpD+twSjidxywZYbQOaO/BQ89u8lG79t40Qq7cDzvXROCV
         YdDCPHaraOokkxfZK9WQuBhGnvkdu1JQD4Gl4vE3lVgMpUMoZfhFs+rdL+9v7MxcvtML
         +J5p2tgWw9AvAp+rMRVkYGXgGxhKRf6C4Pfm/A8K5Fk41PzNgHh20IhZ2WkiOXNZSZSq
         Ln7soT61x9Vz86ZUYprwK6Zp3/nC+zhgKVB0LYi9Oy9dpnkc+x8zFvtEe4GNOeXiN5sy
         xt3A==
X-Gm-Message-State: AOJu0Yy4ul5MxmsQ64BD7azhzvC7O1sM5MbafX+F4fX50N9W58zx8RVm
	rUy2SUCON5jA4Wb5U0uNCyfqz3bUCEp8TvUAZd+ichAYZYD3F0EV9b1hXHhrAn7X2rNiuMZrjRo
	e0q5ljkrz2Hu4QQ1ul0MOYc4VSZNjLFMV5uWtN0l1Owam81sQgkJbaREX6FjyVVw5oqM+
X-Gm-Gg: AR+sD112w7ArqvPHPyrtLfOphATntV3qbfi09CYC2fO2rSZqbh7bEMK5ZqQvT0mET3y
	mZM7EhAfVE3rGL5YnB5kd+hE5qB0XV5Qy2HRLblsxGfSzhquS9rgpaA6PNJtkv8u8Rj8yWbvmbt
	rTmMR3l1m7UBVwtRLs2DPCv36EBONdzLUdkT6AK9NXa9WF+sQOYq4U7Kp+8p1neh18n/ZKvT//V
	v0NAYSLYdyXx6zTpukgcsnwaXfr5x/g1DwLPxqZ7omr/pVwoBJs2C/Yz86vRcNyVNfSkhhKbf2/
	nktl2AhZahAftLq+HP5RBv5PwI6xJ6TAHei2udq1dTgXyWikBy4H48TJLyYRskTX7Q16GEywmpG
	bq2iG0PXPIZO/mm7JCM0o++uVTZgNlZOVvarO
X-Received: by 2002:a05:620a:2406:10b0:937:2762:ef33 with SMTP id af79cd13be357-9372762f077mr611186485a.41.1787236291047;
        Thu, 20 Aug 2026 07:31:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2406:10b0:937:2762:ef33 with SMTP id af79cd13be357-9372762f077mr611178385a.41.1787236290586;
        Thu, 20 Aug 2026 07:31:30 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b145c9d7sm15226618f8f.15.2026.08.20.07.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:31:29 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 20:01:00 +0530
Subject: [PATCH v2 3/4] soc: qcom: geni-se: Fix fw_end computed before
 round-up; propagate size to caller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-fix-write-to-read-only-firmware-buffer-v2-3-7badcdc455fe@oss.qualcomm.com>
References: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
In-Reply-To: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787236268; l=4297;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=r/aMG71rbNo/S6UKVNGEmGXZ3oMHRMlBBnvkHh++Zs4=;
 b=VJDY+5gW0WqfRPaejhG3tF65SjrzDwt8p/NFNJLW1L2nnRIUH9XYCXeidUIBosj4+qt4K2aAY
 zdrsFovCQyADtOxSUoSbcgnjurwweGKpIA4kb/jZ/g9f9OC0veTohS1
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: aWvwP0gLG3riAhC8_sJcpqojVslKytWn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwOSBTYWx0ZWRfX0B1lFlHCjhEU
 snrdQ5o+paScV24x9ha02Kadwrpwp7l6Nu7R+9JuR2tOW/D3Rba7YQqAS5sjeZQIL5/gbmRXx7g
 B/ctr2Uq45dvKBoPza2zipid2ty7lkQ=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a870fc3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TnNaAZle1ZcGXod9oXcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwOSBTYWx0ZWRfX0/LlCU2O+VB4
 kOTiBjNsmNKmmTBlVENeZSVKnkE+PrOFRDcIXFsfjynUtrD/gfK3rAdqdiVvQM4/pOp656IVfw+
 kYmFCqi8BxEGCTJhDyxsN8D0MQjgi42C0Euagx99zOO4N/kszf5ZscGg27ejtTylxdX7T4yKoUm
 J9Fs70iXYF8Q+Asupe89m+Hlww9Q8YyUVxr51XHhFD6DrNvEg/nu/fCl0x9ViSKPauKGa/tSq9R
 ZpdDnGQWbNWOV3auApsnmo6Ue8h/5JXtI1Gk/RULRq6nrH/0OuudbMF90yTjJXHnYhQfK8XIrg3
 GXbY3N5IHzS8XQtsml8Rl6nVU7QGpndOntTQJ0LzDJsfs+2+F7SnV8VdSxaw6wtTtcakavX/FMo
 5CJyxcatYDwCfq2xrKdCYUkb46YHEndiOJxHkSDcwlAMllGBTMK5NW27XCgdMfiCwl3cxyNZCdC
 5CDpepVp99dp65pBxYg==
X-Proofpoint-ORIG-GUID: aWvwP0gLG3riAhC8_sJcpqojVslKytWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200109

fw_end was computed from the raw fw_size_in_items, before the odd-word
round-up. A segment with an odd word count could pass the bounds check
at the unrounded value but then be copied one word past the validated
limit. Move fw_end (and the cfg_{idx,val}_end) calculations to after
the round-up so they always reflect the true copy extent.

The caller geni_load_se_fw() re-read hdr->fw_size_in_items for the
memcpy_toio() length, bypassing the validated and rounded value
established by geni_find_protocol_fw(). Add a fw_size_out output
parameter and use it in the caller.

Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 54c0a66d6dd6..11ca8223fbcd 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1230,6 +1230,8 @@ EXPORT_SYMBOL_GPL(geni_se_resources_init);
  * @se: Pointer to the serial engine structure.
  * @fw: Pointer to the firmware image.
  * @protocol: Expected serial engine protocol type.
+ * @fw_size_out: Non-NULL output parameter; receives the rounded, validated
+ *               firmware word count on success.
  *
  * Identifies the appropriate firmware image or configuration required for a
  * specific communication protocol instance running on a Qualcomm GENI
@@ -1239,7 +1241,8 @@ EXPORT_SYMBOL_GPL(geni_se_resources_init);
  * Return: pointer to a valid 'struct se_fw_hdr' if found, or NULL otherwise.
  */
 static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct firmware *fw,
-					       enum geni_se_protocol_type protocol)
+					       enum geni_se_protocol_type protocol,
+					       u32 *fw_size_out)
 {
 	struct device *dev = se->dev;
 	const struct elf32_hdr *ehdr;
@@ -1289,11 +1292,6 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
 
 		sefw = (struct se_fw_hdr *)(fw->data + phdr->p_offset);
 		fw_size = le16_to_cpu(sefw->fw_size_in_items);
-		fw_end = le16_to_cpu(sefw->fw_offset) + fw_size * sizeof(u32);
-		cfg_idx_end = le16_to_cpu(sefw->cfg_idx_offset) +
-			      le16_to_cpu(sefw->cfg_size_in_items) * sizeof(u8);
-		cfg_val_end = le16_to_cpu(sefw->cfg_val_offset) +
-			      le16_to_cpu(sefw->cfg_size_in_items) * sizeof(u32);
 
 		if (le32_to_cpu(sefw->magic) != SE_MAGIC_NUM || le32_to_cpu(sefw->version) != 1)
 			continue;
@@ -1306,6 +1304,12 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
 			sefw->fw_size_in_items = cpu_to_le16(fw_size);
 		}
 
+		fw_end = le16_to_cpu(sefw->fw_offset) + fw_size * sizeof(u32);
+		cfg_idx_end = le16_to_cpu(sefw->cfg_idx_offset) +
+			      le16_to_cpu(sefw->cfg_size_in_items) * sizeof(u8);
+		cfg_val_end = le16_to_cpu(sefw->cfg_val_offset) +
+			      le16_to_cpu(sefw->cfg_size_in_items) * sizeof(u32);
+
 		prog_ram_depth = FIELD_GET(PROG_RAM_DEPTH_MSK,
 					   readl_relaxed(se->base + SE_HW_PARAM_2));
 		if (fw_size >= prog_ram_depth) {
@@ -1320,6 +1324,7 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
 			continue;
 		}
 
+		*fw_size_out = fw_size;
 		return sefw;
 	}
 
@@ -1430,11 +1435,11 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
 {
 	const u32 *fw_data, *cfg_val_arr;
 	const u8 *cfg_idx_arr;
-	u32 i, reg_value;
+	u32 i, reg_value, fw_size_in_items;
 	int ret;
 	struct se_fw_hdr *hdr;
 
-	hdr = geni_find_protocol_fw(se, fw, protocol);
+	hdr = geni_find_protocol_fw(se, fw, protocol, &fw_size_in_items);
 	if (!hdr)
 		return -EINVAL;
 
@@ -1511,7 +1516,7 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
 
 	/* Program RAM address space. */
 	memcpy_toio(se->base + SE_GENI_CFG_RAMN, fw_data,
-		    le16_to_cpu(hdr->fw_size_in_items) * sizeof(u32));
+		    fw_size_in_items * sizeof(u32));
 
 	/* Put default values on GENI's output pads. */
 	writel_relaxed(0x1, se->base + GENI_FORCE_DEFAULT_REG);

-- 
2.34.1

