Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD44743B3FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228225; cv=none; b=k/6sz5PI+CHeqntbPu7NiZs1hwFogYKVuX1xb0xyqLRYPrbnTcxsI8cByc+0jHqWS9foGO2p2gsCFXv4zQ1MebqugEInCNqWKW5dsGJ0+OzMGCLcHaaZLCJZa/SvTmE4UfHrjrgQH7/3qys1YzjNPaYkVjNSt9Dy/W3xNbxTJfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228225; c=relaxed/simple;
	bh=IfLSZs7XgelF0/NJACD1cJ8p3CERDYHl7sB4IP9i4xI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NJGkW5h1SWQboNFM8ZHC+e0C00c7Y020FH3O8s791wHIK2bTwzyX7fzLAHtQ3d/7NHtm1Tsq/cYNUhHt+6ulRoWaIPkWQ0TxitJdc4WVdWRX0aqe+b74CR7GSjffkIirakHHpOyzEI5/HPJPwgd4bg4+aW8RIKLjH+48jXjk/eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jz34Qy5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ui25AOeW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jz34Qy5L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ui25AOeW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eZQ92161130
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GeTpCMJLG00VDkgP1B7KDB
	KBv8+LJUVs4dqPY969ALM=; b=Jz34Qy5L9SjgqEaYiWzllyXFKKu/SD5j6iePLU
	VyhA3JkqR+kl2mnQ4EI46/b5QpWwLQWqMoRVXf7k6iirLCvuJafFRbsKCm6MENM/
	CxNZvZv/Ot0pQKqKmE1pbJ0DkWxHCQch9o92BY2UeWRLmH5YGnzl1phJ3pTsG8RP
	3vUSpaX6cEE58NM1X6iHJoQUXwONTQw0+oi8HvZCV6Ib5zuE2uYXNWldyjdW9A/Z
	YlxaQzAG6JRYa4kDQZO1DeZJ2H6G9SoxG/1Fkz0UzbXXtXI/BxolFrFbtc23iYYF
	zbxrltrFBlS0D/fKdg0vRJjKpsqSxrMR/eQCVHNy3fnNpl/g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7s721-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:17:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8488ac68185so3960486b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787228222; x=1787833022; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GeTpCMJLG00VDkgP1B7KDBKBv8+LJUVs4dqPY969ALM=;
        b=Ui25AOeW2GMuZLHOrgQE6G+huI4tmcBiVbg+ov0ppRLEEuElGjTbviaB2tjF+klUeC
         nC599Pap3tmvXoMS6XmEwmICq08Z3wQUXPEG7Tu6rZTqiRZD1J/wRESKAGzkKil8qFmT
         OrT4TyDCoc15oTSBFBaSl2yNsyI1+GGDnUGN2KcgrCaAx/SoYShqKBFbNtLJukTf6M3z
         xrgoVitstWVAPhfxW3aLmKW0UDpCdDihm0Z8k8GU2hkZForWXNyAhVBaTJe/nFf1bc1v
         SLfQnOzH5U+eWEVOnf0eMl+1O6ufEk2eD8YQR9uhiN8weOcVN2U+9fG6+CsbL+TIEL1j
         C5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228222; x=1787833022;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GeTpCMJLG00VDkgP1B7KDBKBv8+LJUVs4dqPY969ALM=;
        b=EJKzePLuSdGqvfNnk0uYwVr2v6MMoRP7vHgKbEkHTAFA2UDlARg5HPAnqLufJNtRLi
         MiHF+Pvjh74A91buO+b/4L8BQBjUGmTJ039Qe4Q3keuvRDSX+RLBxiJv+P8msmpeRUhS
         CcjEI169kIlkgiJ8EU85iF8c1JLOH1KBc98IG/CRK3PM/6pygtRzx4bCf+0qArC+wACu
         CfrMJ5c3qWeYBpoKs/hlTTQJHWEZRG75PrsBGR8KVpa/enfh5V483jNuvf2mulDsSg3K
         JoDPgXJ6iLxk31f09c3mIHHzwsw+ckMa2DAcEdjLvTssOPr11gObuig/fcC84eLLkbr7
         2KBg==
X-Gm-Message-State: AOJu0YwGShoMsHbQDWJRrTy5yNBrusNV0VaO6DGF9C4OpszPQZonbxEN
	ZlNllDI6DzFTbPpUbpyfz/YilJJD6z34gtBq1/Y1OLkgFufWIxYXpbRIoqWWoAiWiGIogjeqD/P
	Z4rMqWTQ6LnGMwwh5MM/uS0fK2hUy6HDBoOdQXqd86fu8lsmd01lPftKe0BmyDgexa7mEAMxN16
	tw
X-Gm-Gg: AR+sD111LxzO+WqVb1vcuosbVbsr0aJ9SxM2udAuTrkhqT9WzsBZjto2zF259QpDqik
	8KHul9ddT8XOphlZ8pgOENxCPCTxRERs3oiDfV8frCQ+zZQkDTNcX1ZMWcpihlXKNAZfTHJXgjM
	/LNYTnc3P3B4cR9xVKbWPfVmtNieLKJdzdIW6YM2HaitHrpZQRDvv/hQvKvPVfAD2E/eZbtftND
	++upX44PlRc40aQA5/S5eii5VxHdRff+kIoyTuG+OOKj1HctjR7hCS3xvdfOk0XRTqZbe5dVphF
	j25h1fLMNVJ9AdDlMbHUQ2AK7vwG+J9C7WNRmhpdZUCZ8gqLtC1pl7z13XAltUbFF2FllfOL8XF
	rDzlBv067MJ0185eVPWOW9JqQ/dhIidGE
X-Received: by 2002:a05:6a00:a20b:b0:84f:d7e4:3404 with SMTP id d2e1a72fcca58-851d3911ffamr20757186b3a.11.1787228221422;
        Thu, 20 Aug 2026 05:17:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:a20b:b0:84f:d7e4:3404 with SMTP id d2e1a72fcca58-851d3911ffamr20757079b3a.11.1787228220896;
        Thu, 20 Aug 2026 05:17:00 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3617553sm1569156b3a.37.2026.08.20.05.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:17:00 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 17:46:56 +0530
Subject: [PATCH v3] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-shikra_dtpm-v3-1-93cdd4f3e8dc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADfwhmoC/33MTQ6CMBCG4auQri0pQ6mFlfcwxtAfZaJQbLHRE
 O5uYU3cTPJO8j0zCdajDaTJZuJtxIBuSFEeMqK7drhbiiY1AQaCSWA0dPjw7dVMY09BaV5zY8S
 xEiQtRm9v+Nm08yV1h2Fy/rvhsVi/+04saEE5M7VQEkqp1MmFkL/e7VO7vs/TISsX4Q8BiVBai
 FpWgltT7RDLsvwATC15AfAAAAA=
X-Change-ID: 20260820-shikra_dtpm-2bc494dd6756
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787228216; l=3364;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=IfLSZs7XgelF0/NJACD1cJ8p3CERDYHl7sB4IP9i4xI=;
 b=WllPVCxXfaqNnEYfmXmZ3rDmPOgKufOXVN4QkZC1oitLKdUio8zxB5ZEeMm2/uJdvAGfZhSeo
 kAH6jrNs19fBSN9aUUH+H/clCACYvulZYJnbzygkOnLfeQ0jMSmj9ml
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5MSBTYWx0ZWRfX26JK39F8+OIZ
 iX/0NMJP2vfOvagfCb1AQdLzHnUt2t24ypBaraZLaPdhexilzWpEI7IK+cQkUaaJKySqG+7a8mh
 /C/2rC7YDlM9U4Cpni80V7KssW4VriikdYyKdcLfmpEYb7qjszvO2xeK7ci3EQQK4xZwhVTmi86
 RIAuVotfSfx5QYt6/hjQ6Fj19Z4IGUBrr5RibKZu1PSC/b1FPIFjkWNFNcxxLtu772FHehzQDhM
 FiE+Yu2QQwfdPx5zQUS4ODFXHA79oyMB3O+0GJdBIpkm1C8t3oEl2NlkJZn6Jw2njX9EN7sJ1GG
 QPH4jvP7J4SgEs+PPa7MaC1GKrCfIWEcwqNHTY0KXlgGLGF383hg9t0KahZfAouIYt2pwWr8TjF
 rLqcBcEvvE0eptApD7L6OiK/YinuxB9x7fk+LsSS7be8hdQ6CbLDAgMs70tbEdn5J/vX9PI4Xqw
 J9VrsQwJMOGIKtB3JwA==
X-Proofpoint-ORIG-GUID: rGp7IylZ08MYlCw68z-9jS6j2lMVwpG-
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86f03e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YEDllJBE2-mRQRuHxjUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5MSBTYWx0ZWRfXww1EyQtLM6Ai
 1HnA8DeLmokwigHlKcHf40qxAnl5F5qpQkUNhPJKBKUjm73sbnWO7+pvzwOWSHCwvLUbdWlaSxm
 GZGWkKkfQqFDPuJWm36tDQUOyQ2+dyk=
X-Proofpoint-GUID: rGp7IylZ08MYlCw68z-9jS6j2lMVwpG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200091

The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
connected via SPI5. Enable the SPI controller and add the TPM node
with the ST33HTPM compatible and a 20 MHz max clock.

The TPM node is kept per-board as the dTPM hardware may not be present
on all future Shikra EVK variants.

This change requires SPI5 to be enabled in shikra-evk.dtsi [1].

[1] https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
The Shikra EVK boards (CQM, CQS, IQS) have an ST33 discrete TPM (dTPM)
connected over SPI5. Enable the SPI controller and add the TPM node for
all three board variants.

The TPM node is kept per-board as the dTPM hardware may not be present
on all future Shikra EVK variants. The SPI5 prerequisite is owned by a
separate team and cannot be bundled into this series [1].

[1] https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
---
Changes in v3:
- Added Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
- Clarified per-board placement: dTPM may not be present on all future
  Shikra EVK variants; SPI5 prerequisite is from a separate team
- Link to v2: https://lore.kernel.org/r/20260820-shikra_dtpm-v2-1-bc6698564ed5@oss.qualcomm.com

Changes in v2:
- Dropped invalid Depends-on: tag; replaced with inline [1] reference
- Link to v1: https://lore.kernel.org/r/20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..32916e9df9d3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -57,3 +57,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..bacdc7c77c2f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -57,3 +57,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..b42f94708bfd 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -57,3 +57,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};

---
base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
change-id: 20260820-shikra_dtpm-2bc494dd6756

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

