Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F48409E01
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294202; cv=none; b=LiiC6zLNUgEErpdhJGtcxyrVprvKnge1cVrA7gzvGIW0kJC3ZmfPsLI4FOxr6oktQu7El/J+2Af+kjwyXDvgKD9sLTm9xK+9IX1sMH/NlMvTDk6Ue/A0xUx4reb5HI/1vHIbClK/pMrs3779+J+QzR1EvwJQ0r9fTFri9zVhm7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294202; c=relaxed/simple;
	bh=kEUbBJqe7KY73S/5VTbme4LmRbHaXNvMiB6AKyMb6NU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oyT+CeJPYsM3Ield6ocPDh8a/Qy0r8dHHTVlD6Uw7WaZGVQrRVREq6ER6LChk8YFZntPssDJlolDx6vO2GReSMdNVBVxhj1nZvLmLpE1dcKSaMwa3fN0kUu5joaEqoic7CEmLenVLofd/f/xOXL2TcvQtPPodHQsT13Ek0EJhFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Is5me5vY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AwI6DN4k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Is5me5vY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AwI6DN4k"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5TnYF1270890
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5pzpKER50O1NpYiqhCGwCZ+0bZCuJrRVw6p1KzcrdTA=; b=Is5me5vYWUOtjZGp
	frW+uV8/az3fBgQx2u9kjZqw64jozYDZVGBnOMyezXuq3t/v2q/7dvs/Fg+ww1hr
	OJuwOUugHEQ4hlPstKSLHGYQoPuKXqoP+CA0DxzS+NOhd2hggaMaH10AGr8WXqQ2
	EsLROImk2BKPOItsbs9T9NGL2bs0WLw+LfM5eZrzQMAgeKWtP7bahg+4axfslfEH
	uXFnPFbh1eQYDixi1Q6si4ShaEg3EnldPZeGIttv6RvIu/fVx+EvaUYZ73Ndg8wn
	XTtvK3Sc2VaE98OlA5waQRpp3MrmfuYbvTq4bybkpQmHz8Fj/hqgn5LsRyV4qowj
	Y3hzCw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecb8ktr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:36:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so559136a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 23:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787294198; x=1787898998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pzpKER50O1NpYiqhCGwCZ+0bZCuJrRVw6p1KzcrdTA=;
        b=AwI6DN4kfdUKxCkOQH4yM8hB4iHE7XP3C+Yv8+FjWAWBtgl4Vv1O9pWsxmXlaGk66f
         h7TWrNLm0Lhyq6kOPSjrqBX6hGyd5MG/caGmk6OrrYTV9sa3DXZManZZ6U4VG2ns+3lK
         5ScQWG7idUg8xpMLGG17ZpUDVkf9AG17xVlqlqQbZEp9wmcn3mexueXuTh3EkmD3/nX6
         fOPKzLFSiI9vearpTvAF8/ZNVqzOx4OBnQHWhx10howkQm+gmV3l+3/JM62stn2M9bp7
         q1y3mxO6Q+Z/PoN5UNsRbG3HAHyOBu+n9HZ0XGyQY61mxMkISrRfJWmoRpgBtMt0NIKW
         yROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787294198; x=1787898998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pzpKER50O1NpYiqhCGwCZ+0bZCuJrRVw6p1KzcrdTA=;
        b=LNIAO0kFtBgbAsoDQqH0yIuKj1mtrsZSLKXgNpcRjO4z2Z1XkWGGWmmRjChuyCuRHp
         cv1rP8BwZgrIko6pzn5B8GOQp0KdI5xKrPbV+bjCCxxu0qGUyMuP94/04f6ka3Rr6bYE
         eVtuLZyg6bDmCr5jamuRwL6JlBVkNSljhhf2+r0+f7eYPTvqBJP8RFUS3eeyz+8Lv39v
         nCU9kX4GH8gvwnSWXeQ4xPwFeR2Nmegsmhnu+YrNrRaE6hHIFPsaCGuqPF6eVn60FG42
         gE2LkK7x/R/IHhh9RnBO0xeME71TyZV6w3ElB6yAJCTrgtPC60MGZDm/dcU9W7r7Z5V0
         lKkg==
X-Gm-Message-State: AFuF++kPMK6j73rtuuC4jMTngDYG8ozGuYVV8pKQurVFTRIgnPPoXi65
	Nr+qzW5PU7J8wV/Y+dlgY1RXKpnAGDiwcK2V8allX8ebRaDffACCH5H6ESF85TN6QlXt99X3ccV
	9qdR+zmtHoWAZ3PB/VyAa/IG6CnSY60A+wW6V6RaRYuhZOO0oZOlQUSKxvHiUMkKo2Kte
X-Gm-Gg: AR+sD11Z4bgzf8Ae1cv6Qg54IMjfcEU1T9+82cX8bn/p0GB9riY+fHkE34VGVtX7SZK
	3mAIVIp0RWHDchHHfdW8lI4KQvXmXKQNBv1L1PsQheEVJqAoFkMrsMFMaiBcNq91RDII0KXBViS
	P7ztwZBuXXDzUhXSMVFq+aOFFlYbuTLjKjWvItY6sL10CYZwFNTggPSNsNhqkMBi6yIY7tAZs7e
	o/4be/cuD4q8iLEwHJ9VuqQRnTxKvcAtsmBAPYpZ0pZj9/pjGreTLiWJgI2kkzgkF4FE4Dv/ZlN
	Hzy0RbSmSCHxoq42lPF03kPYkTJJb73FklMK1s3patDAzOGfoQxNMRs3Od/3jyVkfUoMGPpG4df
	z+RhLwx6eeDJPbogt13Cuf2tP3JbTMiJXu8fL
X-Received: by 2002:a17:90b:3d87:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-395c3702bc7mr7872541a91.7.1787294197917;
        Thu, 20 Aug 2026 23:36:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3d87:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-395c3702bc7mr7872465a91.7.1787294197441;
        Thu, 20 Aug 2026 23:36:37 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c3da9csm1787377a91.17.2026.08.20.23.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 23:36:36 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 12:06:19 +0530
Subject: [PATCH v3 3/4] soc: qcom: geni-se: Fix fw_end computed before
 round-up; propagate size to caller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-fix-write-to-read-only-firmware-buffer-v3-3-43e6a3abd651@oss.qualcomm.com>
References: <20260821-fix-write-to-read-only-firmware-buffer-v3-0-43e6a3abd651@oss.qualcomm.com>
In-Reply-To: <20260821-fix-write-to-read-only-firmware-buffer-v3-0-43e6a3abd651@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787294183; l=4358;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=kEUbBJqe7KY73S/5VTbme4LmRbHaXNvMiB6AKyMb6NU=;
 b=JtdkvLnEy9n7MrC4EcG1L6OYoZ4tvq77Etayo1IZ1k0Em+5rgSfivKgWeOH0kyYizQtoCljyh
 pLJ5UfqaVW1DJ1sWsDwgjiAOTTWz81eSdDGTrmxiol9YwukvYt/Jss7
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA0NSBTYWx0ZWRfX0wiezkrYpyHm
 Ai7zMniwn1qviyYYRgMlXY7JhoaFEsaHctXe7wvVpnoFLPwClxIBTWIM3m5b1nfFgx+HegkodJJ
 HKsdmNR21UeZygTh51eJoVyX055fq13qpOYurboPkhoS4dPZPfxs0pxy9esqytezrqJJ/JdUhHa
 g3Sy1aN/lilpF+e7GhT/nJMao/u/h24HRIqPWjD40PPAI4mjyG9+mDiA/kVO8opXkLgLM6khOln
 167ELBC7yAY7mIqxF0yXi3HnVYXo6WQ8NSBl8WHXgEWBlAsxD1cU6UbaNKmlQM8MeO6niWv//30
 7m7xcFLFiZbOrBaaRHYCUfF/b4mKTI9ZNIe2k1ZUqqw6H16aZkTLkbGud386gtpwTgPD5v9DezO
 xLyVpnhXLj5KHTu51MuEZ73We8gpSnJXr7MFr8Zf3N7UsvZaMxw1cgpZAP4iVgT9A4gU/WAcXdS
 gmSYLXx3ZSpE5eU7Tkw==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a87f1f7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TnNaAZle1ZcGXod9oXcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: y1kiGA35DhEPRtneX5aTdbjJtbM-J2cJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA0NSBTYWx0ZWRfX1zdp6oqPK8pX
 Ylo9BdWcQjDvje73pkdyhxGlp8H2y83bCgNvUb706fuNadcQLfNt/HuY7Z4Jv2hLFvR1z/7GkcN
 BtG9YDEsViMneTCh1aTsOlBjwZ+4rPk=
X-Proofpoint-ORIG-GUID: y1kiGA35DhEPRtneX5aTdbjJtbM-J2cJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210045

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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

