Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A41B409114
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145248; cv=none; b=F5h9Y4Y4dXyJRoC5kCeSx9H50VzP8imk5pxcMiXjZPnAG46SAQX03yVeVJrgc5mVznxGt+sxBokXvjiCDMKf9MseKL1kqC3fX3ZDFPIoqEawk24nkTFu/eG/2tRHw7eZyvbK9wgWbVPQ+LPTK3s72n89UOV8LKNlZlPYabkH33M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145248; c=relaxed/simple;
	bh=bJGsImACvT9xM12juJhgFEgiAuk2ivW2Mi7AoKZyfZg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YXCD2xBbHvXP/xylNRxIRI78qn93rAzb4CNPC6XF9/Kna9wc0LSa+xndVloyoIOCrHuKtOlfOLttfphCsmN9HK+iPQSVHSu+zohZoY1X3iugE7F4gB6cyUhpxGTLoVGh+A8jQzk0zlKnfbFmOBPw+t7ifmhKTq2fHEdwe8BF/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2Pyuk39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1TwiMSb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2Pyuk39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1TwiMSb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm4Cf3748899
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zFWiaD82+LLEv+4Y9AJ0DX
	fzOC3GSd+sVzZ7Y6z32BM=; b=M2Pyuk39KtAEXKzA2rad6d8Rh5FP1aKqeYiCnH
	71rBlUozstcPj8RV63jHyw4M823w8F2u4yASW+T9hgOpmkiXmkfee1HvDxH8Lytg
	Inm9cUQE98qNLpNcEJ5pTnW0ntgYRpkidUO6QROj9RuzepB+9/HtePcyGg5Ln4pw
	xFF0vxfideoLigoWAhwCZdGb+SA6KLgoSOThjMuIvq4nN+HV0Lu5j+xpRzr4U4qv
	R018axdb6fJ8kCTLbXODMRE5+LApKAT0fB0wV+v5mMVUyLSoeIrcUby4Wzr7skb3
	Ly5XWWUl6zAfPuxJM2Ufq2AX+Tt7c3D3ss20hWhx1SmM8aKg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729krgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:47:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so1619486a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789145244; x=1789750044; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zFWiaD82+LLEv+4Y9AJ0DXfzOC3GSd+sVzZ7Y6z32BM=;
        b=G1TwiMSbf4+cynYxM5cMF0R4zuaCOjFCVsB6JqUtNSCryXFCaGkgd24vpEfCV2VBpE
         lLyt7W9zRM5a8bzv6G+GjoWNhFADn461shhGTTu0FCN1oAlNoG7T2MvvJAMFq5NzZJ+X
         zBnStbItHRP7wdMBSsUsVC0wPAJ1Wy4WyC2QYNjvCFjOGHUoIAmHdy7h9BTE80VyoG+p
         GVwMwBcsJObedjZLCAZQSgik63aaF3q0WispHihq0hOJP9kHUi7Rcb6dDyKO6QnXnrJJ
         h9cMAUpZsgGXUIg9PgPQl8DzjNGM+b9HwRBvLUaVKH6eG5wdaYVrXnh26tgbXkUcXFN6
         QC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145244; x=1789750044;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zFWiaD82+LLEv+4Y9AJ0DXfzOC3GSd+sVzZ7Y6z32BM=;
        b=imgavk3/SY1Px1z27FLT5s9TljK9Wjhfee2TkmXA3S38Q35jKEOFsnYHj+HljF580b
         //c5ZCtsVvc2KYPucEOqf4zPsK0CAeVlPu/NainkYWqNHk9oBzZaJqoMxdsiDLYKigDx
         ttcdEUVs8BdBWBKUFsThfeHrJZb3tPGEMY2HcGx9ZIlswKqUGJxjJ96BgtYT9q7QkwjD
         lC9au5PYyLmmBm6Mji5VZCa7TzFbSGfoYwOpxnGT+LXNJeI5Z5aLHDdO3zUmDBHSP0EA
         KOIlRVlkD1osArXjI18B1GqTAyA2aJf4FFHXHGWMoz2zI7EoqBhMuEGNJ2jbfpYt6fHf
         TMJw==
X-Gm-Message-State: AFuF++lVkoRULjkpc1KpyZhnMz5lm7509wvCYUWDtqh3lWFfnSeNHUmX
	KecjlKS2oy/m42kd0AMqauTpJpIl6FqTgkqzctWUdSkgPIlOm2TnpvL/pHcjvH6WZRBiCutqrII
	aF4CCuIPM2gBrcjPdY83JpTEtxK9JDDYxntsWIcN+mIyBcKfV3XXemtnkaHOh37d07sC+
X-Gm-Gg: AYBFou17LwQ9x/sxgCHtTckSjXlaImjUW+qYmgo4MhM2LCHba9rliYZ64j2UGH9iYF5
	xBWbe0U3YaCSih+H9qIWNUrU8MNifVC7yIWXIlmae1A67plENG5Dl4UR8ZcKrR2Wepm/rDzYKiI
	UFPqA9KCPjRwtpyc5ojtjrOXYdsyOV7R57R6LRHRE8ZHfqOitlKw/IvORo4PdAFxrUii44STlRA
	LanVEg+8E/iSGP90qXoGql/ogO0zyVJAuM3qgOjxKrdP0O32IeGHoKjZ5ilg+y34dSknsEZahxG
	x33NEUaGBXh4MgckPd6WOCutYXepb4kmRQJ6xfqCRbVFDujqwHtSTrbius4U2nlUk7Kv3gRBmVc
	XRcbbX8kbnCxwhZ8WlR3S++t3UA==
X-Received: by 2002:a17:90b:1f8e:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39d9bd987a6mr8508370a91.6.1789145243631;
        Fri, 11 Sep 2026 09:47:23 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8e:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39d9bd987a6mr8508313a91.6.1789145243180;
        Fri, 11 Sep 2026 09:47:23 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da64d4bdfsm944193a91.0.2026.09.11.09.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:47:22 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH 0/5] Add UFS support for Glymur Qualcomm SoC
Date: Fri, 11 Sep 2026 22:17:04 +0530
Message-Id: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIgwpGoC/02OXW7DIBCEr2LxXCRYL7j4KlVk8bOkqLaTgG01i
 nL3kDpq+7azmvlmbqxQTlRY39xYpi2VdJqrkG8N8592PhJPoWoGArQwUvLjeJ3WPKyxDBfvBpq
 tG2mieeFSAVo0nQLhWM2fM8X0/cP+OOw602WtFcv+/Gvom50v8MXnlc/9+MV3S+FKgUZSRpO2/
 SbZ/32vdPe7jtdlXBIEcN7INoZ+a58JZwtxf5qmtPRNBBedb5VCb7WRBt9RtKIDg4DOBKLnFQD
 Z4X5/AHsXhpAnAQAA
X-Change-ID: 20260911-glymur_ufs_qcb_enablement-1524a497520b
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789145236; l=2110;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=bJGsImACvT9xM12juJhgFEgiAuk2ivW2Mi7AoKZyfZg=;
 b=9lAVJWvM3G+ZFTJ4H36ve2HVhPJYTkVEvGF/7ChP/40cX7VIcizqD1Mv0hcnhj3AZgC02UQUU
 rIIGBkxBShdDcRoPiq97ZoDIZv2Hjq3C1K5sezm29WdGXtxOmEYLq0c
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX4y1BIqVK7Uxf
 VY3eMbF5yw9WwEhcbnN5uHJlaM43H+LfXqmRGE1hZGVaWgMJZmzbHLLC2bh3xTqZko0xIGM10S8
 ZgqZLnNQxlHOpxIerfYlrhg7szFrARg=
X-Proofpoint-GUID: HlOE7_3VOQAn-Jrx4m7i_H7Sf8Yl0dSJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX5AydNo6o0Dmg
 eyh3UVS1m2IhtGtaBZbgkNQEK7d/gyj+llPAyFRyq3DH9cPe8Pjw847amDlRxbNQgS00jbHvLQ/
 SWR9TF7FNMKwnbZCyVVa9SqUb2BnKdaCd+YXHZveHaiirYdFwH9KEi0C6zt9Ep3Kw1dbz2RoyZL
 frRct0p9UTXp3bN0v9KheQkLZoi8+2+8Cn5Yw0ZFpVeOAOqigTAlvepg38rUOPnI+7LbjUrx2kX
 BKvad/3yaWPY2QBheE1RKVqv1v0IIfD3Erfwfg9kXVnl3+ysEz2oY6zmIRF47LvyBBe8T/weP+A
 9vXaaavM9Lgd2ZEdC8I7nXNZfArrafKEifxtWL0/goox8e1s7PKQ7k1Y10Jilvg14w3/xaRBm7l
 MGxTex/wKnhyMD6VRQ9MEGndwU2T4l5k130RDIvK14j8ULi7FC8OHpq2qVsuMlfmJctLONIsP2Q
 FeXESkQsWHqytWiQWVw==
X-Proofpoint-ORIG-GUID: HlOE7_3VOQAn-Jrx4m7i_H7Sf8Yl0dSJ
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa4309c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cnq2yzGENyK2wpwfoncA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110234

This series adds the DT bindings, device tree support for the UFS PHY
and UFS Host Controller, along with the required PHY driver updates to
enable UFS support on the Glymur Qualcomm platform.

This series depends on Glymur LNBB clocks[1] and Glymur QCB platform[2]
series.

[1]: https://lore.kernel.org/all/20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com/

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
Pradeep P V K (5):
      dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Glymur QMP UFS PHY
      scsi: ufs: qcom: dt-bindings: Document Glymur UFS controller
      arm64: dts: qcom: glymur: Add UFS nodes
      arm64: dts: qcom: glymur-qcb: Enable UFS
      phy: qcom-qmp-ufs: Add Glymur support

 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    |   2 +
 .../devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml |   3 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  18 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 114 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            |  99 ++++++++++++++++++
 5 files changed, 233 insertions(+), 3 deletions(-)
---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-glymur_ufs_qcb_enablement-1524a497520b
prerequisite-change-id: 20260904-glymur-ufs-clk-changes-55264e596e6a:v1
prerequisite-patch-id: 934a81749f6e977edb9214104fe2bbf4c7758663
prerequisite-patch-id: d4215d48878aac66f72ef5b6c74d81d1163a596e
prerequisite-patch-id: 28be2089f7836210401b8a68c7cc0ca90d63c375
prerequisite-patch-id: cdf227f5515ad8faec49bde5e0475755a961100f
prerequisite-change-id: 20260711-glymur-qcb-1e2d2bc913fd:v3
prerequisite-patch-id: 53dfb255c51efb63dd26fae3cb30307f0d175ac2
prerequisite-patch-id: 7fa1b965056eaf3b90ce81a537d28c5a2adc73fa
prerequisite-patch-id: 96b042ef08bba0e028c86ea2a473d996880ab38e
prerequisite-patch-id: d2f390b67a2ec320db1e725f4b84b500f1f0400c

Best regards,
-- 
Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

