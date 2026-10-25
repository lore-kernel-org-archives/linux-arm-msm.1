Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792947720;
	b=bYZQnKCG+vZ+6Y7heh9CWA3kVnlxU82w4neT8cNx1XmDA4sbk6HZW9SceBsd5An+dd+N
	 EFg3DDArF/zjKcYppn3/oj4bA+9QiZC6NP7brYJgGdM0BwOaZBAj5AmEbzhCv76+7Rpl3
	 ydEVcnBZgRwpKQjxERbKUZXE6dM0+NO62BjMa3ZuBPywu0o11lvLW+U2orXSM75dvrC55
	 zEPHZPqA+D9TuNlzhIOEF5yageVfrRkWjAw9CPqT4rfNuX/o/mySgXa71LlOBDx7ZzZLK
	 CtQdcfmnXOWfu0L1HiawAe/DiaxA00d6IB8PpdpAmT0NMp4e2F6nY1ksJlIByiDkyCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792947720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yC4Ixl0yXMVt9ps7yzBx2x4QC7PQ27qXmobL+RWzIck=;
	b=QbtzZM4wqz1m7mq9duus3i9aWrVSuweVpTpcJyYrbAcpwajNA3lCpjm5wzDpY8YvSkeA
	 8XpzftfUVU5yi4VtXT8gv+Wf7hpsZH9iV3SycC3H3/TPp+Sp/7Nx8S/nTyPz10V4avgVQ
	 xBGMITgCvS9OkFgxqKfKhzN414h9PGngQMld3Qmo1Bq/tBgFC8c568TbL9EwftXvqlPGQ
	 4KjcbLQ+QUMIgrYC76Sysr/e/wgL5h4h6uHia04AVy+vcXNfVMLiXxBstuFFq2v8rZJW2
	 lk5tnpyfVgDVYxjVYmvyB/v89Hn6zYMkLOTuhqfIvggkTxaG6c+nW9F01Kg/SCbKUsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owac0YFS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TmdILhxn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851F0606A31A
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 17:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 851F0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=owac0YFS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TmdILhxn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69PFjMUW3343700
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 17:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yC4Ixl0yXMVt9ps7yzBx2x
	4QC7PQ27qXmobL+RWzIck=; b=owac0YFS4DUXO5Y1TyTE1MxsunU49C97lX/k4N
	HIhbbMP2Clx8mwx51sSR4YtrOG4TtoI29MZgU43J/tZLp1jKz51cs0NdpGMhPhHn
	cPP1ZbX+8p6XWHjZeNo3W2CNrGrc6mRa33AtQ40t4+laQtQE4eht1fHNIqYKZOM7
	f1mNR95/H/oFUnhZdgajy+k3zSk6wcEiMdXHAz6wFPnQVKud+sfOKttuQBNm8tgI
	3lD9sQBi0guYgBgb8BWH6J9f9wIl2N1b7LY2jXRj5Ah5hBWRpq20AkgrZOwWNMhl
	4i9dIcdCKmFZIvm4ZVeOIsfpar93ooko2baqMQo+ArebZYow==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnukbard-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 17:01:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso9743654eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 10:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792947718; x=1793552518; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yC4Ixl0yXMVt9ps7yzBx2x4QC7PQ27qXmobL+RWzIck=;
        b=TmdILhxnW032sQxpPg06VZKZraK+WCg1PCCuxnKviSMq11Hq8T9AsX/Mf5LcoEz5jJ
         7GgJh9vSuT6aItpMTsTKMZslYypOjLGTVoUkcrK1v0ypgU0q+iWVPCiFVeqN9PA0Yaax
         Qm62fB6AvZlXzfiQ7KI+10kPdPnbjMSlSH3tPL5BLLIUDRNOSwx4pj8Ei8vaadQbbmRu
         BtTEQ9cXZg+y4mX4On6fYDJ5+j/8frUUIBNr1WYPkw7YIwCE26+mFC2GjRrUMMvfadcY
         VsMM0VRHwMXYDoOt/73ZpcQA4h5NfKe373UhW3YTkkwpVUwCgiUVaLd67o8JSuZWHvVv
         HX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792947718; x=1793552518;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yC4Ixl0yXMVt9ps7yzBx2x4QC7PQ27qXmobL+RWzIck=;
        b=zak/4HIuqDc0pUDLdgeWy6eNQgjYIpVFK+42E/lr71qRtZM67hjAJIM9nuSS/VLvJw
         ntSG56etIFODbhFkbgzapqA7Ow2o4jp1H2fcrsG7DRasNsSpdvf0tKgKbGwxrplQlWpw
         hTIMBI545uPFNCaOHjz6pQ1Mnuqbh7QYx+I8G3rEiQAqGWNV4Zl5ALtus33PLz2qx7hE
         0WXmFncSyQtzSlDB6MwFBob0+4c0aVaGGnBK8S2JBLP2BXBduMXlnQ1oiZga5PByaWa9
         hffMeVWFuInOoK2K8OdP6KPnPVuFz42gZ8z5OdxGeFvGFFZ5u/1Je+2kpTBs/XUmCL6c
         XHyg==
X-Forwarded-Encrypted: i=1; AKwUvByM0YrAjin4MplVjHxfaoSlekek+WiH464XY/08/qh0Qsad6UCALyJjTu9Dm+NDOIfvKeIezIQQY6T1RHM0@vger.kernel.org
X-Gm-Message-State: AFq9FYIskgXe2UKuAzmRynekzPOQv0mBIPv/D4fv/CY9RX4x+pJaJ2TA
	bX7F+W+1LApuSEeq0SkJdfujqV8JdW8P3UFbL/eOwcow7ih7Q4LGOz4yGFsijb9lz/PiRPIhJ2b
	sqfxsFZFYc3pemutsiOT32UtFDeo/WTKjBfPUVuAe8wQCrDlYnlJE5cF+csJIiBFrmkxU
X-Gm-Gg: AYBFou1G4EeGdf8nLB10avBJnIOIA01mOqRuPts6Ea9IFnEXbOcud3qNHcdLmdOZJQu
	0mXTzjuPaYJTevit8K3EH0HIaoTdLIHkW8IAK4db/Ybp6bA0bwL+jbQ8cXBLPiuye8QrGJLhpIf
	rgIhLAKAFjz184HzAXSbVnlCyX3C8z4oE+TAZF9ik/g1j3WVWk4Lan4ix6UGsG019OxfcVwi3eb
	311r3sOhvDxN+Nsk8BVQvsxVsl+AksHmAwXkbpqIWzz28Xhj/Q9jNcBc+AKBnloJNawjOuNZTyE
	uA/O4K8XQSBFQXn70vV9UE9v2Xvq37DE3V87pRO2iFoTtW7JONY6SslaaVsWIlEhT5sWklUk4gF
	LY4M7otueT2a1ZSIycXGPx2hucoc5KGcXshk=
X-Received: by 2002:a05:7022:ea4a:b0:193:9aa3:4748 with SMTP id a92af1059eb24-1992a250624mr6956613c88.1.1792947717843;
        Sun, 25 Oct 2026 10:01:57 -0700 (PDT)
X-Received: by 2002:a05:7022:ea4a:b0:193:9aa3:4748 with SMTP id a92af1059eb24-1992a250624mr6956585c88.1.1792947717240;
        Sun, 25 Oct 2026 10:01:57 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm15783683c88.19.2026.10.25.10.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:01:56 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 22:31:49 +0530
Subject: [PATCH] soc: qcom: geni-se: Leave resource management to protocol
 drivers
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-gen-se-remove-resources-handling-v1-1-e81da6707b5f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPw13moC/yWN0QrCMBAEf6XcswdNoBH9FfFBk2080UTubBFK/
 91Un5aBZWYhgwqMjt1CillMamngdh3F26VksKTG5HsfXO8HzihsYMWzzttYnTTCuJ3TQ0rm5N0
 hjPvohxSoaV6KUT6/xOn8Z5uud8T35qV1/QKQIG0RhAAAAA==
X-Change-ID: 20261025-gen-se-remove-resources-handling-d2196f7c25d6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792947713; l=2930;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=6JW/djw6dTCF/7ZGylf7GTqpGywoSaSaOyRPyUnMUss=;
 b=R2XETQTkjObqFm78AwDWWeGYBSLyBccXIteyfAExZ86jjiIPTIeHWEgAILpyivFab6TSW3wCM
 1yeY9NmjZwKBBPQRVuwLn7VQSg9bpObGykg7vUPZ9vUWPF/xACsHGnY
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6ade3606 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DVgANZ3ww1WCvfZeIL8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: K1qMp2TRV7Tn-ELtvhDbsit51mUccKS6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDA2NyBTYWx0ZWRfXwSGmoPEsN1Sg
 45e6M2CTHEe2ALE9jVdMeAMRJnsdg5Bxr4E+ho6jpkyJ51QLOq756tJpPz04tll7/5758fw9bpE
 CWvOsQb3Hqk4psdLWYN03uokLahf5EfYhTw6wVLIqYSzUY19dlPKt4ZZO3lnsDJpOVXZwOpe09R
 ZEd7lAMTCpO4UXD8KQB8N2kCY8dZGrU+gxvbiEWxleiiIYJapnfXyPBu3Gp0iRAOmP404FABQTb
 mHsQ44TqhMLsPXYv5i+QPwGC3UZyFvq7cJg78y9X8dwW9u/Jfy7yoK7zWmF6Pn0RM6lhPS8YXxt
 vvbC1Uqd5lBVZ1sz623UyWepFbX3bSqKLPTVxEZz5PX+tP0dock/1ZbusDQ8fRJt50rK5oqln63
 OHA3AB7wdUTsmH1M6hgp8G5sZsl8Bw1PWLuqhouCIOFIHNIy4RQZo9PzArgYTcU49cFOrcwOk+G
 VYOMpzLm5g9I/1j4Xbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDA2NyBTYWx0ZWRfX6XjACShVsTio
 CTmPb68pZSIEXgJnpY1U5azNjD07DwS62YSFNdth9/RT8qxObd8AQOJRKwa2BU9wOp6DEkEFSCy
 jyFHL3x7NGIXl2LCrTTmKL1s69oPOUo=
X-Proofpoint-GUID: K1qMp2TRV7Tn-ELtvhDbsit51mUccKS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250067

Protocol drivers power the Serial Engine (SE) up and down from their
runtime PM callbacks. Firmware loading runs with a runtime PM reference
held, so the resources and interconnect paths are already enabled.

geni_load_se_fw() redundantly enables these resources and unconditionally
disables them after programming the firmware. This drops the protocol
driver's ICC vote while the device remains active.

Leave resource management to the protocol drivers and keep the common
firmware loader limited to programming the SE.

Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 074087c592cc..ebca60c8496a 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1453,18 +1453,6 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
 	cfg_idx_arr = (const u8 *)hdr + le16_to_cpu(hdr->cfg_idx_offset);
 	cfg_val_arr = (const u32 *)((const u8 *)hdr + le16_to_cpu(hdr->cfg_val_offset));
 
-	ret = geni_icc_set_bw(se);
-	if (ret)
-		return ret;
-
-	ret = geni_icc_enable(se);
-	if (ret)
-		return ret;
-
-	ret = geni_se_resources_on(se);
-	if (ret)
-		goto out_icc_disable;
-
 	/*
 	 * Disable high-priority interrupts until all currently executing
 	 * low-priority interrupts have been fully handled.
@@ -1514,7 +1502,7 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
 
 	ret = geni_configure_xfer_mode(se, mode);
 	if (ret)
-		goto out_resources_off;
+		return ret;
 
 	geni_enable_interrupts(se);
 
@@ -1541,11 +1529,6 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
 	else
 		geni_setbits32(se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
 
-out_resources_off:
-	geni_se_resources_off(se);
-
-out_icc_disable:
-	geni_icc_disable(se);
 	return ret;
 }
 
@@ -1559,6 +1542,10 @@ static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
  * UART protocol due to lack of GSI DMA support. Requests the firmware and loads
  * it into the SE.
  *
+ * The caller must keep the SE resources and interconnect paths enabled for the
+ * duration of this call, including holding a runtime PM reference when runtime
+ * PM manages these resources.
+ *
  * Return: 0 on success, negative error code on failure.
  */
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol)

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261025-gen-se-remove-resources-handling-d2196f7c25d6

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

