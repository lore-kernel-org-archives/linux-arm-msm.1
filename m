Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874039;
	b=yXm6nfEYgbLLe+gA2RtuZUQydykL3x44Est83VNbyMoZNDmbor7j+KfxqiiKn6d2Pchz
	 JTm38oh/4y1eErMI70O/TZFAIAedD7SMCa0JyO/OeqJzIBO6gLZyQQMtp8AwN1tDksOED
	 SdHmtJXHmGOeNlvXYW6BhaaPuAxoihSmX+j7yUBdO/QQm1dXmseseZ92RrX+b4tJPcK7M
	 Uq6KY6Vbvtij2cXPy3m2wEkuet+JWLvgWHhVAYoyrWEQ2JU4alfTGAf15hw/Ud50JTquc
	 gWIIkDxGOxrfhxVXrDCh/KWK56zO5Ig7CNncfO+vZf73Dv61d5OrRt3QVT3wSB8xOPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j3MiXUY5DliQEu2W104SSlUFqiy4PGY7JahO+C2gJ4E=;
	b=kilsjXl+nRsWFK8Hx04KMmR8qXvM57ZjhPrQZRDHCvUb5dBqK2zzHLVp9EpNMEicYiT0
	 6KyQvrn8dIbQGprR2zdRvXikLe/5a4s858W0eNV5mTqr/SKxu+lWjHEXlr/f8FCJuEYfO
	 5SCeDjYPl7CO470i7oOYYcIX2WlD+5jsCLHBhwjP2a6YQNcltetU5zST2Lg3gSnJGXLhV
	 iT/4DMYRf1Fhaiy4EpSw6yoUffq1GwqyYMxzRDFmLt2M1cR2KP2mSIF5OCN2yuMh48rxk
	 QW1bTRxPVRqIVSC3jcdFlj43+YdB5udp7BLnldSdWp0Wwq8B0/cH8xvc3AtXRY4RqjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIoYRXa2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVnnB7Ks;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C902606D83C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C902606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIoYRXa2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVnnB7Ks
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tW634084645
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 10:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j3MiXUY5Dli
	QEu2W104SSlUFqiy4PGY7JahO+C2gJ4E=; b=BIoYRXa2x8aYOAwTsLZfTmGF8Y6
	XpAWstodhWEybFqn3hxiZnEnsuXocduhyZMBCkAEDcALVBS1fq0XMFmboTVpgjvb
	fFjSDzzsFtGeOqUtCjWTjeFPH+Z3WC+A9k3qK5Q0oNZBgMIELDhFXkCBTO0+p+Sr
	RSG8a+6LqhZV4MgAG9cRDJoPV11NSznKG7YCX4NVbL8NGX64e9AvU7Q2CHwKcvqn
	AbQEZ3r5CqCuGiQi1xJffhfUGt5tWU2ZDpcju4WYd5dhvBxequlL9AdIcSKKDSHY
	5PXiFco8rou2Mpm0OwnsOhqf/Andm9+pq6xR0OPB/5nlNWJJvvJ49hC6aeA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr3uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 10:20:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so2173046eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874038; x=1794478838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3MiXUY5DliQEu2W104SSlUFqiy4PGY7JahO+C2gJ4E=;
        b=gVnnB7KstJLVITcQ8YTexJyRr5zD/nTonevvAbVz4q/WOl1yvx/L1sricwba6fdOCE
         vROHQHjvt4muJhMZvfbD8mCQF3Dt4IlpU0+uS/UpZWqgdd8MLoNNcKnKb/mkUkSXmsHv
         goNSHEOte+i1pJr5jTHhYWkgPdimfAhEudTzcBjgrdidM19+RvFAkwBJbsuIJu+27PoZ
         jSliQusn4hcH0qPnSgy2/dt3m+YQuEbNFtb4DbLbrSitC/xlquQftOspl1R/IKSSWRpX
         afWUaPmKDAGWf8b4qnp0hfIugndvO9flGcP5bRBfTjL9UVrQjGT7f4nkpESAw0NVzmsK
         RE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874038; x=1794478838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j3MiXUY5DliQEu2W104SSlUFqiy4PGY7JahO+C2gJ4E=;
        b=txOEYf69LKT8FHdZ3s9IapDn6DEMoUQC78581XzB7g+55b380lXSRAverLyNPThAWq
         hxOADOuB+JMwNdj5BZ09uo1sca48/TGGFuYYDvs1ZHu+WTyN5zy8iVwRxmF9O8c4vxEc
         ePzHN8vXjwOVB5pIE6FQMJ6AuXHkRtU2nR4ceyaB3CcJlLvRGs4Vs/UNpHeA9QFbn4GQ
         MrMbAQkhTdPvQ4cx6DGA/sYQ0Eh0UblDlce7K/XBpq0tgaGqnf7oazhLHOXgM+/L5ulq
         UQPa6mjI4Wa+d0TkJoYy3TTsfrUWj/0stVfaf/vEDz9E0foy4J7J75Gz3V3Hnk45PHBY
         iHkA==
X-Gm-Message-State: APuU4Z9SZUb7ssStneqoSYtnr1Xs9C06DedhNEK1AOq5Ks5QN5Uf111y
	GlQaWxpQbYe9/j8GxkKsN55a2Kt6hsht/cOMzrszMbg1CKSZUpl+BlKXBGk8hVQh23xEOzKrnS0
	47MSikKJOp83fSgkXaGoz1WiJha1L5lEAOtgbOwN9lfrkfJceyCm5m8TjCLjnivUwNhxr
X-Gm-Gg: AYBFou1AeqyIYpF7dJj/eupyxXNeLX2ti/YYHLFfPGpcMvqH8tcH9Xt9hkCeZ1dWNxx
	+F0EhyPl2X8D5sBFzFleXlSmQl0OV7yZgXZmLDT6feVAglmIkjvXy6qrLkyZfXS/ZI4BQGMlPjy
	hRyufUS+XQbcA+FgH6UuKDRwue5kHab0Z0/dDiT0vcMCFW87+FI9cIYb6aOWCeM3n5f9y3ajqnP
	bZpJa/kdbzlZO/1lYztWO3F3CiIBu2/7hb48snIcauKdgYHbCzhL2No8uksLZUhSp1ohPyye3AS
	21KJxeLZHj0PhZC/hQQbcscdO9UQw11UypH+bRt9EYSoAc/DwIcVgRg+j51wEDQXP52zuzJgoj9
	SAMxO3I88iYa/14SUJ2F8dPhZtzFTrabOGfnQNfLgFPmV3gdcmz60jEpq8GW5cIDHjWXGd62FCw
	y1L3NABgCP
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr30656497eec.38.1793874037765;
        Thu, 05 Nov 2026 02:20:37 -0800 (PST)
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr30656446eec.38.1793874037091;
        Thu, 05 Nov 2026 02:20:37 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm14115330eec.9.2026.11.05.02.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:33 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
Date: Thu,  5 Nov 2026 15:49:55 +0530
Message-Id: <20261105101955.3732723-4-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
References: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfXxC+eL4PRk79B
 WGVmdoR+3ki8kpJ2ef1m1aVyw3x83CcovutkADfNaE+gYOdcmR2FHfpfn0V8f9ZYt4kUj2e/PO6
 QP9gyTpmaP1LlwoqFPMUQqlynJmISdXEkrSgHybLxYKZo+LcoUqzUACGsAEjfW1RvW3XdicALAy
 ik7c1YMTgez+lBYk3WFFqJQUzKglZd/A4FfScvpTZ5PuYRBbV4biMV+10bISD2GE0cOM0vfwGin
 hMLyxU9yaQB4trtakyKfkf2N4ZIIYnp0EcwcK3/AYtUBpyx6/QA9TU87IUEQsDwvwQUVJgajoYd
 ftaXTZXt+2Yy9VchiWmlIkyj85xRPkPKWeF1dtrMbMC0uM7w8cf31O3Pwi8qIJIhxDtXp7gGKTd
 rS/d2HUIbFLW8F8srBb6Gn7xzUSXHFITu4fjwE49oejCGg5XdqWxgU5SUEXIfGW3Ty+juwKThiV
 3qLVOcVQCiVjiwse7oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfXxdVb5dVeYhPZ
 AKKkuBKoxtFX5DtzU0Y0VFg5w3MegyZnlBBzRsY4tuXhcuPAmLQxgw+k471n3v0DUfBubrUUu0B
 2wWag8r7orBFM5kxCi53jAuGbd/pksA=
X-Proofpoint-ORIG-GUID: H4UtYro08CLYOfcYJi4cLD88vBceHoTg
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec5876 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=eWlXABRqF5iA9XQ1jREA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: H4UtYro08CLYOfcYJi4cLD88vBceHoTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1011
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050041

Enable the SDHCI controller for eMMC functionality on the Monaco EVK
using a device tree overlay.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 +++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 27 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c5b2e95cb9d..3563ccbe771d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -80,6 +80,10 @@ monaco-ac-evk-ifp-mezzanine-dtbs	:= monaco-ac-evk.dtb monaco-evk-ifp-mezzanine.d
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk-ifp-mezzanine.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
+
+monaco-evk-emmc-dtbs := monaco-evk.dtb monaco-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-emmc.dtb
+
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
new file mode 100644
index 000000000000..6454efc03ddb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	supports-cqe;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
-- 
2.34.1

