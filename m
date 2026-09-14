Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82B943F081
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382733; cv=none; b=X338XwyBrwNlYs82zSOYhbfLlFx3+ujpsxDEgP2FCd5gAZhYHbs52+QUbnBBAcKMEBmGH3H5kBpSbNPAmG+e7fDhxHQX15zd24A8OeufhJhVkwGc1lMPnTSzGGliGIaUKSUqCDVhsC2MWrcEvhnqJ9Ujmx5jmtghy2v+99wC+Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382733; c=relaxed/simple;
	bh=E0xPp8WGq/6zxWJIIsZb9X9a831XpeM8ZX+0nCt0yEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pa4mmZIo3BvOAWRJSUOIWmlQB8bPleEKVj3OvWPOneyeXiTt+/NQcS/ObD7i0Pp/BkTZmr8GIQzaCrRFzW+ExW53B7GaJKt04amuGPHjJAJyIGTHFcFsCCR6W/fjtZ+zD8p0+qpEalaVvn9g8K1HJsptEzk08zf5h3JNfgGAMtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvTH6iqV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abSymma/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvTH6iqV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abSymma/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nQlr3731436
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=; b=GvTH6iqVFfzybYg0
	YA8ocY1Jcy5XFn9qUYyKCPlQmesEbfnZGuTYw9EKDy/rYvFC6+ItGyi+t1PxCsB0
	mxXJdoyDFHUGUaBKSR9zgGaDGU51uahF8H1hUWM8zE5ZMmR5Vikd7sV9/CCGDWOu
	bhHOpdn+Z5+y9kBvamU+aXdoxoryLqzGp2OS8MpNPLWAWsJJ13R5mI5HREdQ1W7w
	gnO+NHBNobGNqRQMiF1k/8FxU6qRPF3MJpMicxwkUVj5/HJ55zvSeKDTE6ZTYHMS
	pz6UDf1PEQBb3GbvTpV9L9UqMWBOX3kaNJ5C26cVYgrHEW6Dy6H5g7ScpD+mjUJc
	JZaomA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0j2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0312937eso195358385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382725; x=1789987525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=;
        b=abSymma/rwrstyoWsz2cS5fJzs0kL+zcDOdPaQWVOnrMo+b3LBLQfqCvhUMSWeafgU
         CVcDM49yxPn4mHP20Xof2dw+MoAG6kaZ9Ua3v5DVKV1jdPlsbDHp0ODMQ7J8uMGXypSV
         2a9G0uPfXJ4mp0mXk5qbrMUmY2QdHLHm4AK3DU5PgKoYRSSfDV5OaTV3N50CiIlP2PYd
         1gBOzJuLv7F0XhZ/PyCJRt377dDDgTxc12giZMVPi+gFtzZBKCEHbRDFiiLaY1EXiybc
         4LU9iqgmFT4aMs8Y4ID/PoDcxISX71kSZv0wxmDtVu8jGZo+nFU5juWYyC2nBqDjieaS
         72ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382725; x=1789987525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=;
        b=GCtSTD3aGKcnlnYH2CmORO1MddlWDTHklCpwFJQ9f9f+r+8oTblqfOJjX/3VRTodXd
         +GG5RfStxy9CTtjKwfkSMzAeM/oc8SmHpcE5JKUdk2y91BG57LzWv7P7e5Tz8/Age+yZ
         2p0WIJgi+GO7V5rikb1zzQvf6/yV5wvxIuWnjpd8ngx+a5dtjBTB8CX1QMnH6cNfmh2F
         DAxVKBq3uwTwqXQxfrnT9qUMe3UiIJlUmKtE6mRiHLMA+E8Nb7QXQYgo9jMqkXRwvcxF
         0tHn7xYYGy0EQIAREvEQIOxvoaaBaM1+FczyDNR8oUNsKkVeqrvt5Yo9dedtvCCYUKbJ
         81NQ==
X-Gm-Message-State: AFuF++lshM5LSPsfdpMdbS7G5DnKoMnV+LSwNk+eNh2R8eda7mnACrhn
	bEaH2FlUjokvzRUybDIkvt6rEmPcqe68jBWk2lfmo7F06uduZpHxh+NcAquxACZHFvZfCOP4Soa
	eYEQpvV8y9aK1/gVGLcvP9uJBwRFx3k4OdKJrfv1itbpzNMnNAZuRxT+KxzZmSXa37XUN
X-Gm-Gg: AYBFou3TI6Lw7FC6ViSm53HQN3H4emHNQx9tCX2yRoxfCNc20XLW67z5VM9cnbsrXI1
	zPFqz4IAvGqXwWsYQlRj6nfK94jCSOSqKaboJyLf45z18UPcnvfDDApjxD5UoahnVx4t0ZhMXFU
	UgT3kZ4yUrCCM1rkQS7EPau3RAbYh6CSZcyxwZ4o0kf3OXt8OAfcG5NbQOZhxnOfACxpQ3ivGtI
	7x3cslGk9gzX2pSviBnFYriogU8tb+TVYZRCXUEFgprbXB+10VJmqgKUD1K1iPn1cA00tsqt3p8
	cufGceb9yPhYwErJuZJTSUHE33ZGpxdSH3wDiHlV5TGNqDrsek9kE/h9IU70ATllhlDmGoXvsh+
	g7zd8X/Cb
X-Received: by 2002:a05:620a:4885:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93a2985c04dmr252657085a.19.1789382720289;
        Mon, 14 Sep 2026 03:45:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4885:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93a2985c04dmr252619985a.19.1789382715062;
        Mon, 14 Sep 2026 03:45:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm26335926f8f.15.2026.09.14.03.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:44:52 +0300
Subject: [PATCH 5/5] arm64: dts: qcom: eliza: Add CQS EVK UFS variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dts-qcom-eliza-add-ufs-variant-v1-5-78b3249eae61@oss.qualcomm.com>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=E0xPp8WGq/6zxWJIIsZb9X9a831XpeM8ZX+0nCt0yEY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp9AusjYM18x9IpNGdVAu7SKvvsa4gREWp9NZM
 9oypAYT4eKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfQLgAKCRAbX0TJAJUV
 VvYkD/9MJkph+VqvIwodkfb1IF1XmN3G2OXlE4S4jjJyIkup79J7wolt18llPtQgRmtSBAeZFUM
 c3o6wwiMLCOCHARzdW8W/r5HQNvy2fmPfiPwxn31dgxe9PcN2h6ToYBpCHjYAhmg/XfQCXKBmI1
 1clMuU0zekPx1NRFmj4ksyJs4RiCI4VvWGqI9T7F0kGfcvyqVXtbC4Mo9vRm3ERkD76iKb/oaDd
 jp1EK2HLkj2d4FKNRopKo+Srd+9ISoZ98yfzNLqJj2zZuz0kX3UIBK6JSwlig/mQWObEMFaiY3x
 9TyaxRe+8E7Z4RmHMktg2Q0FDPgsJUN7wVGe3bXATSHFvfSqOWA/REzPAguXRJmfBChNSrj53cJ
 POvsKuCQRWnMjaeuGwD80ulfF4vKOmnHGtTuniNAKUadi4caCDb4+IF5yYHep7NKZ2S28kTQzlA
 4iSp4WiyESzt/BFsYICbmHHIeFmQNulIquSQ5clYs7GOB9kvKe7ReUNg7YBR+rPTqZrFKiNOiqW
 KZeyq/MWi64Ho0hzjyQZk5zkuuMbsD8v3JHojNPpa58zQMdCpPNQl55r/UWL3JG6IvCd9OMUSma
 zGagBfJoC1IOBb65AP6mAtbL4VvK7Jr0hJ462XrxmlE6O8qRVGJxWWYK/6pC7yD8xs+lReJ7ftY
 PTT6xqJ/qWJ9jLQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: BXd35zSZkJAH1334pGfb2mQXCnD1d39g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfXyqeVssLRY8nA
 YYzMIf5jlvzLXvch+qxSuSjb//6CDemXU8s0c5IHk/RYf2fn8e4f+3AtfZsQveeztDtSa3lVzzZ
 ulfy/5dunoDDuP2m1C2MPHNw+psB934=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX9qqt49i44P2V
 uWzPH+bX8VdtzfIGAa9wjB313z/Yxz9mvRxIxywUjaOcnzJYDKpf+FcQGA/zIxeABKjPjUnz+cG
 h3i7j1dIMAgAm7Y85JeY8Kmgxt5kjxBlx6AHnBIQpKafHivImU3wz1hYAat6HlU3m17LWRvuOVC
 AHfN318+wbXqFa3t/luuDhv+sneD8cu8Oq7G84muJnZp+WjaOO127Aj3cssSfjb+qhNsq02e9MF
 e7Qe+vnmYlVMLBAKWxPwEI/u0Y6LMq3uk6l6P9tolX11G7HS13bQuWxjEBgsUS3+/HIUsaUPAfn
 2zU9i4bb1n94fBJAgasoI4x4EwUOp7PwrJdFIn6TewSPpmr6iuUkKKq9WPRgOn0s2F77kHp51v/
 5EzWPCfK6KjNp7xGqKH2YU994F6VsnyzDp7wb9waosXb1Hn1GbWwH5L2QMmTmVt0xzZaptZ+ZrM
 tNPMkCA8f9AWhJZ88/w==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7d046 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XdqwL9Qi1ApNGgobcvAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: BXd35zSZkJAH1334pGfb2mQXCnD1d39g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140154

Add new board dts for the Eliza CQS EVK that uses the UFS SoM.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile              |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ccaca98ad4c8..f44d7ec94216 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
new file mode 100644
index 000000000000..f5bdb2526429
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-ufs.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
+	compatible = "qcom,eliza-cqs-evk-ufs",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-ufs",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};

-- 
2.54.0

