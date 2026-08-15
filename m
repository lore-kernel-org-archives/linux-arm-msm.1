Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F83641DE0A
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800383; cv=none; b=D2h/uAp6ouWyG298JQlmJDSuhwt4MG479zv1SFwWrHA6e6MPcyeNHa8HCKmEGRxcfvkJ3yr1fEMa6evfd8gnMzmYLdDj19CS++wr6I/HjhzUqUkl+OYKs9Yr7ffJbpkZxdUIrEw1o5aKhIFaYY+VeRPwV2Gf+UzlgojCxmLDUvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800383; c=relaxed/simple;
	bh=lJR6G5HF4bl1M1j9qzIr9Pod7FQ6Wv8te8xQH+WXaCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgXdCpmiFfqTczcRnhBbIpwB3c5ZJQwVNbD6l/mnSpibIsuwmxpKaHcCIVK40VK1xQKYNRDtH5u5LlIHkYavZwjt8SQ0s+4XPo1iSWRZRuIRo1WlhQlKDWo7RZnXJjhc0IlCj9BoBCVj2bp5kZqmNsIBzIKIxbl5Q0uxxN9SN08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jl3M/2sE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htWd0/8z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jl3M/2sE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htWd0/8z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDMIvZ279353
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GXUsTUTY9OU
	wECVz/6AHbVUjWEzJ2lKqUl+uPQfQqfY=; b=jl3M/2sE6jyZJXYGTyQwxyOvhVN
	XHBtGcbQOM8vrtknabBv/o483i3QR3H4N/zJDxupzXNZU5lq3CmPJJsLCqmOS0Ph
	T8KPaKm+NJ5uPFsyoatMi1hlh4MWpNcI612fo98P2YKMLlIboXBpZSiMv13+EEvY
	v5aOlRim3qe4ce5JALxjHjnhMNMamdaenowmsgMnSCR7ddZVGVy9/+HY59UNaeb5
	9B1R2tiuz59QZ+J9PoGt1zJgO2QbLTZN0ylhIogTwQ7Z1OYhQ9tV/TE4Ck2Iku1r
	2FfOnayIzG8Y7i3Wx1g/lHmQysnwR1hFXSYRqZ9ADnM3pqZWb/yQPlynbLw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2gvcgxjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 13:26:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2275541a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800381; x=1787405181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXUsTUTY9OUwECVz/6AHbVUjWEzJ2lKqUl+uPQfQqfY=;
        b=htWd0/8zB3P0VgiId1mYUBu9UpHzrQS+q5DUo1/roytAOfmJ0e1T5xkZoTkNt2i9yT
         ddpVBjdpfVJx28uByNI/CTJEsa0txRZyQ8zOrx3rhp2yyOg0nGVyd7kbX5VSCI7X9Xyy
         0uR9uMDPuGYd9SRorSqlQouzauBkjWoRuOgIflFwwKf28uHnxGCZPC/6N9zdL0ztD5UT
         K6Sv8RN7T9J0PaMGaXCu53f7oir7MJv+3rx/cPCKA7d8Qz7eTn9pn2zIkqzE2wUlUwzo
         /0EBGmZxaZ6RjThSJmcenZUeICwbEIK9/wPAsyUNeRIeOi3eYTlQbquIuqyrqP2v5eVd
         TVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800381; x=1787405181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GXUsTUTY9OUwECVz/6AHbVUjWEzJ2lKqUl+uPQfQqfY=;
        b=p7Q5lR2SFmk1GtCAiQKw7pAr6S0qBxkfmIg6mhSWDR+JgmXDNYMQbND9YAD4NmtdSV
         kkvU1C2PGzyq2zS2UoOMET+eRlztrRQm4hP97SpbIKq2DV2NAZuQ84uzS5arFcTcFzK/
         t7V6SFG7si58ksajRO0MYtItCvhiGNvyWM/WEtq0IHFbHHJpkPgI3loCkv54txMxw/uk
         yrD3RiumiWnYZGWbrOgUpn/IdptdInHoJR3LaeM7BmukD3eHrCqrX73Kg7127YRzBS4F
         PQerQFFOWNdlU1NMWc9ADFFyQAn7vtLtZOz2DjHmdlxHuOBlZOndMLhpsS6AdzUgydLs
         QJpw==
X-Forwarded-Encrypted: i=1; AHgh+RrE0O4+MrM1A5kfJH5hALVPPRKfbDC+US6adivfbFLmnLJVjOQINsP9Urd2UHRdNiojP5F3cGHCcVHb6wvg@vger.kernel.org
X-Gm-Message-State: AOJu0YzjcLmhJmX6JG5+GJnh26I3ZG2MP5d/b+Ug2S/NHQ6w9FKQYTmB
	tPmxt6EYpMZyGvfns4zCQaWmdEELV9f+oyUk1Cx49UpaBVYCPX219LE4spVnxhFIRwxMycNDocZ
	lkWH4S9suAIJo4JQ2wA/VvxNqFMVG4ViuGwblWvwT3fX7FiZ3aHrc/YJ8kraD6pOLlLrw
X-Gm-Gg: AR+sD12MRS1Vw77gnSJVbyixxWgL5rnnF8iol9H94TyHeR+UnY1uK5zexut3bXaljDn
	yBB5DiPSHDWm/ilcetCHueHlM+NA3b5QDJf/9a4YmiqfExGKboQHLDm8k/Z5E7oGJJAygztWMCP
	10XD3woIy7XX77P18omhzHhHTn7Lvbm+LUh5qqQlAcLWtaUMUBb/uKM8j3DP+EdMDLaDFkeJ+HA
	FLfXODVM3jW5IPAkYnjOemYgC5AseX/rsrG4HGjbovw0tERGS0z5tv7Kr0h1Epz1DYn2opS1l0E
	E6jiC7AcPIjUIp5vlqXza4PptZIQ0W5w8G3LJ1TGDKUHDmT7C1pU1vXRFxskiF6coxX5W+RD52G
	S8H1heyV4Us8ZBfiXZ7ejUmHvn1z2HR8x9vv6Rg8SZ+qKRcS//ayLUWsqDs1/
X-Received: by 2002:a17:90b:33c2:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-3933bd0c033mr12646180a91.1.1786800380717;
        Sat, 15 Aug 2026 06:26:20 -0700 (PDT)
X-Received: by 2002:a17:90b:33c2:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-3933bd0c033mr12646140a91.1.1786800380243;
        Sat, 15 Aug 2026 06:26:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 8/8] remoteproc: qcom: pas: Add Nord ADSP1/2 support
Date: Sat, 15 Aug 2026 21:25:41 +0800
Message-ID: <20260815132541.1575121-9-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfXwf5hmp50HHwd
 6mwyW+E6/Ys8ghx2SLDyG13any8iIWtTDmY8YypAWrECTP3PSuRiF0yapjaireDf/b3dPL39fvW
 JGONJv2lvbD5A5Og3+TObMz0TYk8ptM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX8osczzrEXADd
 X2cqK8H1y6qYGYXvGAum7bbaZbtwhaPhtAQQQgKtEuTferyKpXx1pXpRayLEOn9omGA4d/+kjBd
 sWBB+nlqhtMRVGzTY7Zif4Cm+SdP1gBThDEQcx5v+JRI6HO7SoaC7AWVzyfSfLMG2b0Ts9IeH7y
 8w16CO9hf9heASkxCeHSq/W42KpgzMsLi7WtVw/0jAR/+yYbjc3L3a+9p2DM1ygmxpw7CeO89t7
 HHnKFxc+6y7Oc7V+f6akhO1pT1VlZCIgWlS6jZvgQlS7uOcobyoLo95Ebgr+QB0QvMQU7CBZ/++
 L3NOzKzpObWyFlRgjbdhbU+8TiHWqKgxOZ48II7Rjri/uNYHqyl/wYTwtFH9ZmluN4yrvdm5kvK
 8iwDHUYMii7iuU3eIF89bCgZNvc/bPA01nJ6386xzy0PhCj1ccmDmQBgjN9LP+nuF2Z1K8WSzSX
 uVF6ugdxtht6++qbBgw==
X-Authority-Analysis: v=2.4 cv=UfhhjqSN c=1 sm=1 tr=0 ts=6a8068fd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Y5oKQx0N-h3E-Ucf2xsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: g_RDB6Y2NLDxvefkgrxgL0B7mvVz4a7S
X-Proofpoint-GUID: g_RDB6Y2NLDxvefkgrxgL0B7mvVz4a7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

Add support for additional Hexagon ADSP cores on Nord (adsp1/adsp2),
which sit alongside the existing adsp0 as HPASS cluster members.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 44 ++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 0cf0a31f1f1d..96e2a7c74927 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1937,6 +1937,48 @@ static const struct qcom_pas_data nord_adsp_resource = {
 	.smem_host_id = 2,
 };
 
+static const struct qcom_pas_data nord_adsp1_resource = {
+	.crash_reason_smem = 663,
+	.firmware_name = "adsp1.mbn",
+	.dtb_firmware_name = "adsp1_dtb.mbn",
+	.pas_id = 53,
+	.dtb_pas_id = 55,
+	.minidump_id = 21,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp1",
+	.ssr_name = "lpass1",
+	.sysmon_name = "adsp1",
+	.ssctl_id = 0x1d,
+	.smem_host_id = 66,
+};
+
+static const struct qcom_pas_data nord_adsp2_resource = {
+	.crash_reason_smem = 664,
+	.firmware_name = "adsp2.mbn",
+	.dtb_firmware_name = "adsp2_dtb.mbn",
+	.pas_id = 54,
+	.dtb_pas_id = 56,
+	.minidump_id = 22,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp2",
+	.ssr_name = "lpass2",
+	.sysmon_name = "adsp2",
+	.ssctl_id = 0x1e,
+	.smem_host_id = 130,
+};
+
 static const struct qcom_pas_data nord_cdsp0_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mbn",
@@ -2316,6 +2358,8 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init },
 	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
+	{ .compatible = "qcom,nord-adsp1-pas", .data = &nord_adsp1_resource },
+	{ .compatible = "qcom,nord-adsp2-pas", .data = &nord_adsp2_resource },
 	{ .compatible = "qcom,nord-cdsp0-pas", .data = &nord_cdsp0_resource },
 	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
 	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
-- 
2.43.0

