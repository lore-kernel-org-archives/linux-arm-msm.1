Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A97E46F495
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697239; cv=none; b=BKJ00g2WScNzEwQGqcuC2EX2vnznOHYFQ3VCqOWDIpsBx3BcN5qMGu3BRH47kvoRjI1C4UWZawVUe1DD35SxfipCbWGlGk8u8WiAQ0D4kvj9C0grEMzEXD5JZApmdMBf/U5P3BzZBDP+270J1c7tv0yhBR//AyXwcseV8rPZykk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697239; c=relaxed/simple;
	bh=tVAHr9MefWSa+t58TJ0O+GDITVUSvOGFLXxq5aqVEyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulFvEEN7ym6q0Bgmq92HOU7aA9ipVaaUvRGmwLE8LlTb+Erwm1cARBNfVWD8HPOLfHWe2PBr30YmWQM+FFxKZFvWY+9Zup0apZ2jdDAQeUVJyBfKWbNLYgB8saHrKVmjGkO0h+Pgl270oMDBGHfPIXKbNXDsX9sY4KXLhmKTqVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEmkaLRQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9JzW9fd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEmkaLRQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9JzW9fd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE64pV1649624
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=839gDDq5qZP
	I0DAPMcjXrTtc1OlOlOgTU7/KGh9CdtM=; b=gEmkaLRQxeO2U2C48CeiSdAEi8Y
	B0FulEucSQaDY4YLllXN9VMGGe3mcOhEktT7MzbuWnvnFqPS+Nzreteatsh0chNJ
	cTIsglivAQUfn8pBeZlW2KSVyWBRqnd/+VVww2gcRKSFLuJPKvn/xRa/7cMg0oA0
	ylIUqkp0wiWXcI2qvlg6jMy1v7TSrFmfW/+2hPUi2JoYWRSYTtXcnbOsVC3AhLyi
	JQj5CarNqwZ1vThpt9FFNhYnYUZ3kBQDcVGQ2+/KZRpfS7xVI5cYkrn2DG5++YJR
	gv7JrGBtUOpYyqxNZO59hXFvPD4xRRP7tGnnQe+IKNR1jVZSeJRE0LBn6tw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0et28gka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:53:57 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14383177746so9670651c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 08:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697237; x=1791302037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=839gDDq5qZPI0DAPMcjXrTtc1OlOlOgTU7/KGh9CdtM=;
        b=N9JzW9fdMVhnRsPkg5EjFQxZAKFCxki+U9Y5VXSJj8qx1UjYnDtPw0rh5bpAKlW/Zo
         y+WKTishQoxOQo+dcqQguKRvqP4ViZ0/fJ8omnpC4BpsLUQjlW2vWqxI7Dz2jSSMt+OS
         UFwVhvC/RwcXX/aK66jThNgj4XqdfBXUfUEtvikO17xSP9JSJ866w2C8tdvs2K4pEeaQ
         v6k8KEabBg55rOz2KqWWyisq7YBEkC0HTsgzuawuWCjRdGS0s0k3UDmANCXbjzuYGrQ6
         MOYgdsbs/wdXyhTdALfn/EQTVmG+0bsTVfrYnsL4rctpkb0TLHRCpzE7VRrQo276XA/A
         JLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697237; x=1791302037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=839gDDq5qZPI0DAPMcjXrTtc1OlOlOgTU7/KGh9CdtM=;
        b=gc8ANt9kQyP/fZZeFk3g8AUppgMuyCwVsi8OUX0yTZNn++9WiK245+AZB9RpAR3MzW
         PB1XqUgvk+/zHAsLQK8lTHOnECuEcPbHoOBgHldzMEueam8cuKVl6JCmO/ofm03Rie4M
         BcHncABdtmRWk6p+lM3JWZ0s242/fDBL5kpBpnAop2cuQvX1u1dMUncz1KtCE8pf9ESo
         S3pffsdKB6J6/9oqxzPYEaNSeqS+MvL7poMkHy2cvoIjw4r93l6wtNCCX1cFuFQJjr/E
         rp6VxPcmguplvjk1pLVi50RazjexarDfqwbFzsppP+6h3k2TuqWt6GYi2j49/qsJBWsd
         nMvA==
X-Forwarded-Encrypted: i=1; AKwUvBxCbedQv0GuT5GpRHxc2G1mzPkf/hAK3uqNMlOnYdVKHWpe8AKkmieaTM7CG49iI4f1nDqThQCbgvk39mVr@vger.kernel.org
X-Gm-Message-State: AFuF++lRmJYBJJ4106n1EcwVQULGkhAIVNthbc5PZDK7lDkQH1O+JvKZ
	LBQ2eZBqwv1+WK9cThrWl3vb78n6CDwxGVXARFc+7Az5Vtny7gA6QeEUrzKfzieLKSsnNYYY/Lx
	g2BbZ0WjkF9msGuWdE4Ln5ox0UBzlX1JnhABjTmMRmB+xj5N8lWcLz3aH4G3MLwSE0XSj
X-Gm-Gg: AYBFou1Xi9IShxwVquRpGnLtlgv3ywlGTLFArIBjYeINPxzlWotQZmbDX6Txpvofxsl
	e2rlGVilyg3LeQ8uf0vJzxrsGHNkXiNx30iReloZYQ4vIAOOw0N0P4Trffngl5WsFCdjbbBddBF
	KNUc1r22uB2OSZ+A5bOVf6qsm+82B4vUJ1F05ApQNWYMnzo5C9gSPfrk2QseA3Jal3TpzYvetF5
	SveBSrB7kFOX7eZ919x5vnsK71c9PddDnL3KaeKCbBIlS3njid+1aOOqFL4sE/033b3nNo4NZET
	nqUyTSgc1rv8pW9s25QbpP24GxIauf94rVUjGXAGab9VlTUjPO6MhwpVyDh/biOiPzG0zs6gpcb
	5G35h7QGxtxVemVCgrti/A/qmCfkWs+xH59ICOYNDenpOWyBN0cRbdt9pI5o=
X-Received: by 2002:a05:7022:222a:b0:144:f089:b189 with SMTP id a92af1059eb24-146d01af97emr19420003c88.36.1790697236715;
        Tue, 29 Sep 2026 08:53:56 -0700 (PDT)
X-Received: by 2002:a05:7022:222a:b0:144:f089:b189 with SMTP id a92af1059eb24-146d01af97emr19419954c88.36.1790697235939;
        Tue, 29 Sep 2026 08:53:55 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:53:55 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 4/7] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Tue, 29 Sep 2026 23:51:49 +0800
Message-ID: <20260929155152.1898666-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5S5o9DqD68tSYxRAGsTsaOohBVUIiaeS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX87rufySD/ipv
 AWBR8ktOpdJTsc2sWN/AE4selrf3nNODxyU1NKQzSJqYJ/e9QfZBP7yc6qCT2ynBThaDTPLCiNj
 GzEmXHaFOq0UMfGcoa3aO0R68j2KFx65pGIJiaqF6IQqdfio5lC8BHrpwpe3ceHJLSDF0r6Jlge
 7+1JADWT3Xn4rhX362L3e+cpFRdEi59059rcfpeIbuiAMUuKZ0HjKAU37M4NcpvW0Xd4x2Socit
 pkpKX8w9gIHZjrjWdWUeknXegaMcVg/jvsNKqalYHjpEud/D4aZcYuZexuDzWHyksUnp+EUBhjT
 nYQvhmqGynrq+dKxCB8LhSQ1zkFfqhUrkHybyVWBHK9K+DP9HgDbvYh80fUOkMPQNqyC0yGybAa
 0Kl1ExFbIoRJnEAVPZKgmDjQwSUucHkeWYwAXev7gC2GcHggjyeLiTu2QGrrq5H8lB4o7wHAJ0h
 pu2KJu4ul/OkrtyQTlg==
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6abbdf15 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pTKKwl7rlpcWqDfdxRsA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 5S5o9DqD68tSYxRAGsTsaOohBVUIiaeS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX4T9IWViatMiz
 0861bSC0fw0aJvnDt34bfTwAxshmJhzQHWWWXckCUNIcr5Cc1DRrGws6BgdOzXI6H7WiZpKVvL8
 9L+DJU20JNh46gbE/UrBd9nhrc846Fw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290063

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 32244921263a..aa52238adb98 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1871,6 +1871,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

