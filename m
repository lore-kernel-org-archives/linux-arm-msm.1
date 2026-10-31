Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456711;
	b=SM3rMu+ybiTtyK+jC3PxPawIeXd6G/zmCCoLgNcm5sgUhSXlY3ozTJgYlidVxix+ytdQ
	 SLz3PLENnpv+oXssgLN5r46MEZqnTbfINfhrtivtExt4J/yYsDxhu34Ni48vY1CBLyrVl
	 EHxaq7pkj326dTFlz1RTnHsngATaGD5LHoQSlVD092Qlqf9jA9J4gIcj/0RLOTTxqA5/s
	 OnTDTPMnZ8zNY1PcaU7s7KzY07iRuBmsplhiXN8olYHHhqyOJwl/i+Q6cxaHnQvfd425n
	 qd608Vqlvl0QGqqYUMJbLaccKxxqreLSk0uzzF6b7pR8s/FnUYyK7Vq7vKNrHMDnnUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
	b=xAzvgXKrDNcqC0vNkePehcVYyjIL9QyUBQ5eIVH99fSyxLXuN85hOV7st3PsemxwRolh
	 PB2SHnZzyihj+ObXygiM/v7dGeP04l2WQm2p/V3l/OPkRlgiY4KB540jKO7vc8Al46RK1
	 XvNKpiQGKKbsV3oJs5oKjNn3duJbYCiSj+SKaGZKvPxhsLbT47o75rbrvQoxYb55zR87U
	 WOEnHV5brxre4uoTTj4q1FrPXn/VNzx38y/rwky+Ssnumodp1JA7pnmTgx3jbansuaVH4
	 EMVnnbBYc8D7igDYN6srbXODtxaaVO0jdSf2sHvW5jE5GuY2Q2XTdrNpWdpYTMANQ0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODwIZ6ph;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnwBjjS5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F33606A327
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14F33606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODwIZ6ph;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnwBjjS5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD04g83208646
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xvXRY7fo9j2
	LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=; b=ODwIZ6phT6LtfDVX1vhVpeiKO21
	eNHpum0+d4r+xzmEd+9OwwLifAXXWudMWQgUTOv5BwztCvHOwC4HIuZn+x9yYa5c
	NZ5yIdHo9YygzjMLi6tCBk4llPBOsGtHPZh4d0RS34psRR13Gmx+UtVgXsIPKeY6
	doGDNs2/2yUYEbmhifYl3NM1ipjdgOgfzOjIsDgzp63SM/9QtMvnBVUC/QSXFExb
	09ePabfmxNK31FvkjnoUdxPLPKnmrzUNrMNjmo7Oajv/8N+SMax0fGwbvxpmxbxt
	qJAnTZKgzLjxF+7ggSSYj2XKP+ulzMeezhTSyJTnvK62uu0MDf8FYhErJgQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rse6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so6448795eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456710; x=1794061510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
        b=fnwBjjS5s0vxwo/QeLgAI8K1c3CM0hANI1zsbkC0Khei9h/nVmI3Y3HSmarjuOQScs
         RSFu8zj39D8CpqMQvyHqTz0Q/mumDjVfgEFlAHb+w/lUkJq9KXumr3+UVNrYkasUL50T
         Qm+cXli+qL+N7Ea1aVMWJlfxSqQvIQpOrMFHVyrYOvWx5zHOLj1Az0s336XOLax0p2Rm
         Vg2YoLdb3s9lSBR2ZXjtDdFkGBNWg2ZwgWuZc2kieDyiO81VRr7+DBU/pChSsldhMfV0
         AzqiG50Z+ob6G4Oqzj/ZnxVZ6estLOYiCe8PzJ/l5QVG7oEAezHOfZz9z1ymmsWY0J3v
         Xsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456710; x=1794061510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
        b=KUY5KNlf9sKfAEAwnl7I+M9/Fihdn+kBVQsWNk54GIsOwUP2MaFDuaqbKc9IQjacV3
         QIbRU62UUFGPJIiF+4fEVGDlINe8AkyKB/BvprCMYh/q5vUVOuf0vMNLixh2VUlJvWZZ
         xndL2dNOsrfMuiOUDiwtDGWflx1+qazQkLV0VioveCVPnRIztxRv+E6If/ST5u0jBoQA
         eaTgs51XUBgQBUhxi7ZjzR5qpnEJXNWnf8cC0c5e/4GayIpBauwfM1q2+MB+8h4iscQx
         oA2kI8NtEpXTVWcrAy9cf8rpibl9+jXSgPGcgeUzwopgDQnlifIXN4Wioq/itPuN17YF
         4J9A==
X-Forwarded-Encrypted: i=1; AKwUvBwJNcyd58BpAOUk7qaZt7GtAd/u918TrCIyWQ902aGSxOH/Rz2tqOzVUrRkkxfhm4xsxxbKEDIBf3E5QRP0@vger.kernel.org
X-Gm-Message-State: AFq9FYIL5+DVO+5wsW0TBoG5qOiDPEd8Ci1hDzffJnpYTQeEevjyo4dI
	EMdmMdHXaaZAAqT1wFjl43NhIdpwh2I7yAqftsDUh+jxGu1TZrdGRMjlhAnzr1Y8LN+We/s5Pru
	FVP9L7HenmODFi2iWVIf4llHQ+ix1f9zZRh8t2cgeBAY7a7cbvrgZv7Bro7DZ9aKPiMmF
X-Gm-Gg: AYBFou3HbxNBoLkH5n2dALh48kHm2+YExvEEMAbqSg0O9niyfzAesYOy2fE2FHgeZO4
	aNBRiXh7IVjHj9lkX7p3HIa/lNVYmkt90uNSmlhFZ632ECeqb9QCq+t2i9ZQ1iuS8yRMplXnBuq
	BdqkvkSgVhyuUW37f1UuDqzRw18ruPJjalnLZSZyRZ2DgBRboRsqquEE0KQKhktwulaS/q59a7m
	iRcGBuhh+DouKA2/PdG5k/SgZ9uMWLy6fxf+rK4/alaN+XejJ0iX5btylbFvr+k39gcIgcUJZBM
	gVI2SUX+SxcVKSM43HK6UKPTPWw/FV3JuEUG3xAdmeAP1uu+wHtfA29m8KAHsJAvBsjaEPz7jog
	0aGImASXwW2b3tOs6I9xPBBncBI0XBM9Jub2HlPsEc6UXtqsd9Aq8PBYhMqwJoNopxtM6KClydu
	UlEgl1DrQB36bNnXLxnMmDlIsBPsQoaB1C
X-Received: by 2002:a05:7301:e0cd:b0:35c:707b:acba with SMTP id 5a478bee46e88-36a4220406emr7675980eec.3.1793456709437;
        Sat, 31 Oct 2026 07:25:09 -0700 (PDT)
X-Received: by 2002:a05:7301:e0cd:b0:35c:707b:acba with SMTP id 5a478bee46e88-36a4220406emr7675939eec.3.1793456708748;
        Sat, 31 Oct 2026 07:25:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 3/7] arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
Date: Sat, 31 Oct 2026 22:24:29 +0800
Message-ID: <20261031142433.1212809-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 04UdU3UqYwxK9MJ4zS6qP2MXx47HIzPs
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae5fa46 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ccc3-NsNM3ZFeKEqOdcA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX/BHAgjLqosa2
 sBKddeQbOjX9PJlNZo2aies95E9elGysqjw3i1tsE90hrhG0sgvlHvpw0B7o0gabtK+K9Cb9RyD
 IbtgwygEW+uhLfpBYORBejoaobRpNDY=
X-Proofpoint-GUID: 04UdU3UqYwxK9MJ4zS6qP2MXx47HIzPs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX+GCmJJsGUGxQ
 CkosdCW2/8gR1pGpSA91mz/Za2UWaVzwBeUmidfmQhU52J1ulD3JAEFgyBVko6nc3AxIXnxaMeT
 yj4jPw/+WsRrWfhhgDKgnh5tYYogBDo4H1G0rDs2pp4a/ouGO1LWCVYKxh7cKuuWgzqyqE7fY+N
 SBi6pJpAkfGYf3lU09C2i52CXFtFhJVicpSdM+b2n1IMokWMAwKbWJzKCC5LEEwGE5I6MPhBQ/f
 50el3tzJZ1FJ6w+EBzP0WZKXpFKSDsSwQFcRkeFR4bownwH6bM1zqWN2gZD+FKAwN0d2iBZmyJ9
 VORMqrGHiyvRcmLbbl3XeFALtAKkgqngjeJH8WD1r6P60//i2509p0J5PQ5e6Va8D5j9QIpkglH
 UNt7t7+S5Q3p2UA4hI6Wj5VZIYExKQM0WElwWc7D1gZLENGFNR6eqUaGwmqFkqhKFS0CkSYIDgV
 GIGpQ69IlI3nzDUo7fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Ride Embedded board routes all four PCIe links, so enable
pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..cf760ec41727 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l2e_0p9>;
+	vdda-pll-c-supply = <&vreg_l2e_0p9>;
+	vdda-pll-d-supply = <&vreg_l2e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

