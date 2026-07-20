Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0704D2628D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 02:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784514971; cv=none; b=ZUfz4CZ6SlQqkNKb828SqfLL+yR3IBKl3gjckXxD4UsqeG4dnLDhdvtlVWYFyOWdKGqhHFZ8MWIP+zYYfbsUwNjnsLIJpjGkTPJ/dSVCZaSY8lboS+YijHAGtKvKIt6/XRg6Srj5Te/JUmH2Vstngv69qfjFoXstpI0eRIQWKH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784514971; c=relaxed/simple;
	bh=Zd01etCEfWO+CM27GNY1MbP+KsTaDAZ942YCw2f5G5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YA70VYx6TzIf35t5hOR+h6eXKAdbgL6mkN7M+altCO5vc6mKliI9D/S7TjAunnajX6VttUmLxC09wevbkXw1o8M8EbOFoGOlPCW6xeyzW1ovs3fjLV2zbpsuj+pG8L1KT2WZq3/CJKO7j9S+v+n12bi1f1AeiqyhYFL0c9UlqwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5/Bdg9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUTGH25Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5/Bdg9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUTGH25Q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsPXa1911515
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 02:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JvsdJN4ylr02nfEuq1zebFxCT9Im8rIcShf
	jIkDDYYk=; b=b5/Bdg9m4rAvFnX8Hrx8VFWvIycY3QV6CN59DmJIfnt5spSzgeZ
	JMCE0y/HlQ+R1eAmP23djwOoz5XzaS72jDqjK7Un5Sg9nhlIAzKj5oG1kCLmIFbd
	F/NP8enz2ZHcI2w6X1zXc3lCmaafk3BcjugMMMNBw1V8iHIThB3d/8fis8BtsygN
	mdsQdRif6hBowTKxwrS+Rx032o8OWKwwNVo9e+8DTXFdztOJIBsU1dVGUf4XVo92
	RlIaJcuXQgNDEk2l1zYldDyaWwvuLzGyIAb6O3U9mRC7pcaEu9FIoSMS7wj2vDKn
	EaTTpqFnePwP4jeKOnylcu2Cld2FgGW3wcA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aav09y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 02:36:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso12903545a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 19:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784514968; x=1785119768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JvsdJN4ylr02nfEuq1zebFxCT9Im8rIcShfjIkDDYYk=;
        b=hUTGH25QIebCveT3SPzBsinrGUMdcRlsuYczagIwYYKz/8am4q3tTABwDtBZF5VdvC
         f3mCrHQbR1H6TEkZMilDXdk5VDwgjvbpK3Cj3dBoFUKhsx75ioE2Vju4vytuJly7shR4
         8uT7ZUQBCWIwYHIou2+HfsER+GCpfVHgwMMo0GeO5vXtH/XmjbNJ+K1XytiE/6vpZoEE
         DnMRBjvAutLYmAi7t68pAqqhFt8cZvKZsVZrfJwbS4KixYxS2xwGzJ9fAxBTJz2pawMJ
         hApTw3yn7px04cVccPUB9Of41iE5+WvPzoJFW1EEefU3kEQAIqCj9xvcqEDeHwnerckj
         d2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784514968; x=1785119768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvsdJN4ylr02nfEuq1zebFxCT9Im8rIcShfjIkDDYYk=;
        b=VBzxPGMMrvL9f+BOGCDFJJxEE1zRttA/KL6C0cCCgdBcJKHDQRUxtPUK6KktZHwSet
         YQuQqFWtjLNV6ErfAyT/rwky1jZqptQyY0Cs/U2WpLT//4neWe4b/SyIl132msrpKAl5
         pwJ9VA7adDGvtBl55HlUtAdvaA2p1+DHZqvr612iFEJPMxPKdYSBBAotTdiO605GxoWQ
         HR5nrWiDmGbTEITSKDTOmlnPIhBG/LcKCtDPBfHD1xCJ0XZ0eD/4benH/sTtkLV7d+C1
         yk/aIma3z42M1rR665Ly5WAE4vQIkzM/zxshRYxoiOfBj1dUdwArQxEeF9IZT817gTOI
         uVZg==
X-Forwarded-Encrypted: i=1; AHgh+RrHcQ4tI5Tx7prSUztcsTVK4BYBJYHV37REvCM27xkhpvZQ4KqJYCyoxFHMcwFLz0cYrdIPoBY1ENR3NjDl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9RFyDrHcyw7uEc3gwMFHAd4wvqwlaXQjKNZ4nSlDmrOenWyWV
	XkA0WXW8cNI7aVV1WbuzO2NRQuD1h7V547/5Aj9BPy7qYGw/fqLaDvqJpTVMvaJDrv2wWZTowpd
	R/r5Qg65og66oQ7lW0Xx/lkrp8mf9P49yNAMJeQO+eWF1DKIR26XewPdirH5VYphcFtDN
X-Gm-Gg: AfdE7clSx4wrwKalJStSrAoS80Ub7c13mdEn1Oh1sGjM9TpA3uV/sB6C9pUbzJjA6Xg
	ON8pYzxax5ZWyWQ2Td/UFSebuq5rsrZjc0NBxIUolqGszMXECy4M/HLHXpqtUk6sOejUgX0zyEn
	q38Cnue8xsK1MeG9SziCO6xWSoW7xfxmjDghhmyH/9/lhIB/3D9uJJYfaKToN2+ok9DCGa8mhbx
	MbkntETUNEar/u6wGST0+SKHVyFIyQHdjiUgGbpJAEh9VjyDa03dG06AYXvCGzB8fQAhs8wEej8
	mlhXwSxouJp3WfPB4ypYOM9J4JKDHYdo+gwGIS9xCiJCT8HT4Ws5gGwe1ZVaf4OhJWLGORSg6Wr
	WwFuBs3nFe5653aXE1uMwHrrdN8ucAFtu5BBtV7SYnZa/5k3kANSElfvSBA7g
X-Received: by 2002:a17:90a:d2cf:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-38e4b446353mr12364854a91.11.1784514968440;
        Sun, 19 Jul 2026 19:36:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cf:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-38e4b446353mr12364810a91.11.1784514967443;
        Sun, 19 Jul 2026 19:36:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29e340esm24646932c88.5.2026.07.19.19.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 19:36:07 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH v2] scsi: ufs: dt-bindings: Add missing mcq reg for qcom,sa8255p-ufshc
Date: Mon, 20 Jul 2026 10:35:52 +0800
Message-ID: <20260720023552.2667237-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6me3Y_AStq3rflmDJZfAVk8J84S6HfnU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAyNSBTYWx0ZWRfX87vXRXZSGKH9
 74W2a2T/cOcrtPkdThu3hjaqfdiA9WeUKci3s67n7r4pl/0pDteAvtzVssATynIHKgqAV26BX2f
 L5McCe+uwU+S8Cq5/6pMJgilPDag9WM=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5d8999 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3miq8Qb-Iyz2LYAwW2cA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 6me3Y_AStq3rflmDJZfAVk8J84S6HfnU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAyNSBTYWx0ZWRfX27zPBkCamM39
 M/Lntaw/XFZZ1RQp0QETV/DqSRDlGBuBq3Lu8JBwKauhH51lx0ODEp9Y3aXUBy2zumQxQUnF7UD
 v7UJs8B9V6ExF2LURSguDAmZlapHjlRxJ8LN5HaFf6K/7Cc3NyyW+YL2GzrSr8wvu96PDBhLXxK
 u9RkYWizlSvuwhJSWFdVh+XAzeEX4nxHuN91Mfd6Wnip4Rc9kk7YdgUOTJwu+Lb5pG8jAnYTdgz
 AGk2Ifh1lwdNAnT6wUaHuaw9i3tZ01UJnNIaQXHnBZB4GoWEEZ8LJso+N1VdS/WGdS43VT5uMEI
 EAMnjDORzNC78EFAL1+ZnPwSyWrrWsh43daH4N8Ve2EojSXUuim7HfYG23+xTPqciWPAJ0RV04S
 NwEc8S4/UEAavI/xGMp14o0m7bXtJ7MpRTYBgiJcFFXp529zLUxsgYEdlT0QpLjVBu/7JaAS5UC
 0DWFWShyRD328XuruDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200025

Qualcomm UFS controller found on SoCs SA8255P/SA8797P has a MCQ I/O
address space. It should be defined in the bindings even though Linux
driver currently doesn't utilize it. Fix the binding before it gets
adopted by DTS.

Fixes: e2725ed2a7fb ("scsi: ufs: dt-bindings: Document bindings for SA8255P UFS Host Controller")
Cc: stable@vger.kernel.org
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Recover the newline which got dropped by accident
- Link to v1: https://lore.kernel.org/r/20260716083313.2367249-1-shengchao.guo@oss.qualcomm.com

 .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
index db165a235cb6..66d73e9025d6 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -18,7 +18,14 @@ properties:
           - const: qcom,sa8255p-ufshc
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: std
+      - const: mcq
 
   interrupts:
     maxItems: 1
-- 
2.43.0

