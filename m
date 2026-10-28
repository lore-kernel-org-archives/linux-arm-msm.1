Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200901;
	b=GdLeJ28prKIEeClJGKDq+qFI572+6mEpHmjueGYd7PlJv9dy8oOgixkfmKyyy420vXlN
	 8RwKemujv9R0Fv7Y9Z9nt1e4ulqnh7gL2vh76l4oa4QbP81LKG7W3jG1IbDrGVCEOrwEn
	 c3tx4WNVAHHm8HiGCKEZGc9waGg6pA0CVqWZTl3LpImxCGlv17+lRSLFKD/bDtwZF4pXe
	 6NbnD4MuehmGQpMCM8XoM9WTi+PKoMMSjrrB3ceGBjR8nK72QRBaHzwk9QIGujN0VCTAD
	 Eq4ZQWweIb/xefRXbAO1PFOm+eGbiykpJuKH50PTFTddWCSVfOcmtqhcbN/dEswFosw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
	b=zSWAOzt9OO5/okRGiM6QTlHUixIXdmt0kurPmmjAasNfehc/8KU+231AACQGE7r0yxdZ
	 ZSJHfmx7Ht31Fs63rOB/hbCzTuno8Xhg67atxXI3YNs5RHFsz5hVclpa0S/oc0jFfc2/2
	 ltX9fgNmWLHkUGG+sH+/oS9f3OMNZ26I1MvJrdUUjaybEWqIZvBRuzgM4VVUMNHJRr4KW
	 YikrNlHPYk7RVJ8/7mP/XNVFwoRyrgmS2kSociH7kB/0B2Ps890ltb2P3Z6c6409YtZ0l
	 iIlTLmH1yJOjvmNMBCTFS1Bq4sRxJh4quTwemsjmz4N1EpgYrb3wwOVmDxIS3BSEz7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFAcekdb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VqqxQPM7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEFB60A2627
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCEFB60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFAcekdb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VqqxQPM7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA5tC966643
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=; b=pFAcekdbJO0/E/fi
	vzeG2CEw5DMHakRWk+rWkpUZPeNOYmRoT4IyvxAu+bz/iKOlC8g2Mt9NXP/a3QPm
	Kw6iNpJcpn6s9v6bx8AgRSpg3DCEV35BZ2bfFvNWvWxVTojBnypLPMZqpuZ1bCw6
	4ZrJhU3ljGCzKXqFLmDrrjou3b+W9B6iEs2GblD5dfkohGVgccRKxxRZS5aOxF1W
	t2IAPbGfHwfON5rPh7+9uowdz1R7kDe5aCLeV2bn4KqvMzzZOFpWFKPE4l6cGl0H
	8wpOaVcrA7uwxdK3wD3MMCQb2haXXXRBxWZGvQZYBFgLND7AtS3egPQrt78CMLkx
	Ew5MvQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjghwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:40 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0f1c06332so17576287b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200899; x=1793805699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=VqqxQPM7IG4SU7iuamMFOaoHC5iH8P4cU14RyNViVlms04L4wEKCvcyGRdylCnF0BM
         F31fCYH9DzS+WTrb+0L/96Ap8UIJeT2eL6srTlklRCnZ9kQxv/QUWYvZGl39zYaa5V+m
         LHgyJkf35did3yqNSuGie49ibmgru8nOirjUMV1aBww1o6izvNTvYKJpbdCnWgYhR+4t
         qfeZd7p926E7czr1COVyNkPM7X4Rng+h6hgpSzjMpLn4L2dNMfZXlqsMU0Ej4//J4PtO
         lv8KEzY0QyE9Fsok1dTMhe8/RvwUOogWPYUtbYczWxtuwEbGz6VLdPETbdoDNV8oGHWj
         DjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200899; x=1793805699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=FY/tZ5/SREQI++tH0WvsYufbVl/NrKn9Wt/lUAONb+KFEidoieNQECqwqdmPyLUF13
         6l6HkS2r7cNtY9g9cGCVQL7avF8NQoE8TtPYWvtdhHhDAPd+gBtdOeHOlBoYuCo0Z8HF
         tA8oRDynwtKfyIroJFfzm0qQoaoi/E/qUl4spFUerxvmSVD6Pix/uP6NryH9UJIxXFUL
         YmuYRJrS1CIw84ByDZTgb91p+h5N45BVz1hmjmiEqvccSVKHMdLx0XZtGeJaP3hpATiQ
         1FNFohSNdjF00hOXrjAS9AzJW116+x+URRemSVZynyFwwm286//JOioB/93AjaXSwjQe
         VImw==
X-Forwarded-Encrypted: i=1; AKwUvBy507ormpSgMW3KDonPnaDoq8bXIXNEp3+aCBAWM0EwQfw8090dnDDR8m6Sk2eHzqg7w3hhuKbFt5hrs2ay@vger.kernel.org
X-Gm-Message-State: AFq9FYLfQZgO+yTSxa1KqYFampu59T4xHZAOlKeoNKBzIwSoQMRiK8aB
	4lAlwK0yqzfrnOCuP1GI22pVvXm7P8YGIZ7952aCbfb/z9BQbtHg2lDmOAWhwhrjZ43zVoXE/uG
	oDzcP9XagzDqFSPiBcGIsH6160No+2cauO6UH3j6D9+FMbbZs91gvxNMC2HneVfpeR6HX
X-Gm-Gg: AYBFou0fcmU4wGilcaChuApebxIS24P2Ou3vUXVOatOwrYn3mS/D5aESxqsVRxCq4Db
	HAJXfaAUeSXFJy6pLe7FSmchLDiMeUvMUal6nPIKj8Ouyg5CAl5R4pBXE70ybNHcsxnd9oKI71g
	mPnkRJJ1ofYqfKjJpQPNUvbbNsrUJ8P00r+BEwEfTbPCJj1GLEuXd2rD0MKE6pCVtMbnmdDvqSE
	t4OhS+zSevMGoS3tbs9O9RyGDMmFuSH7rBJbRGZnTGvOkkmdinzbR3lTQywt4oVLACYmv59tWjn
	JusvWSerXHH4wzU/PSiud4wi69CEEepkzK9O5nlZuJrfQJtIewwAdk+jM9O2kEBaxjsHS1gRWSC
	AV5qR45e3DxmZo3CNtjnSHLWNLdmvwTaTUzHbsPnZDlWBF0kn/28184h5otBFbDezM0YlGaiZtS
	y/1PXzO4BxM0BnY0hgLvrd6toQMZ5iHrTZHcZ7yKT/5rpk41bNtmmScDQNx+8h
X-Received: by 2002:a53:c78c:0:b0:672:a678:da59 with SMTP id 956f58d0204a3-67a7bf245d2mr1555992d50.108.1793200898948;
        Wed, 28 Oct 2026 08:21:38 -0700 (PDT)
X-Received: by 2002:a53:c78c:0:b0:672:a678:da59 with SMTP id 956f58d0204a3-67a7bf245d2mr1555956d50.108.1793200898271;
        Wed, 28 Oct 2026 08:21:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:37 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:49 -0700
Subject: [PATCH v23 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
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
Message-Id: <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXx5jb0igSy5z7
 ebfrB03nb7tunIfVVEsn+zpGxmJmpCfsYwxVX+M7zHLNAOExMVdzeBiFzotZcsMH/WS0Ru8uCT9
 6ytxu5TuRNUWIgBhTSbWZkfllUYHdWccv580K1CbAGafkhv+g8UJ4XSeHHf1U7lfmQLBvuahwex
 NddvyLDF1gTAty2Mb7G9XJfZtp3s2hZW6BPicaIiH80F8UGWUpEuLZ69RErkdi3c2WGOwE46xt9
 ZdmgERx1OHFz4RP6o23KnTxU9+SqV5a8ctKPNDiRWpnYwcZb3itjPMcPWUZlc2SD9miEht5Veka
 6znjw5OYN836zUw6lOfB5LZcKm9FeRZCFH/zmwcgfpUOGqIjUoPKhbzJV3NC0nDhId/yHq+XKCT
 0txtfsQXXHx+EzjVC+i1hdxjFkNbuOgGRgW/xBT0OGw+J1C8OBtZwSoqlxf25bYIjWn0pxVgna9
 FRI2pjHB+aJzOr5FElw==
X-Proofpoint-GUID: Wo3B8-CDCB1wDkl08zcKYvn1Yr3f0W9M
X-Proofpoint-ORIG-GUID: Wo3B8-CDCB1wDkl08zcKYvn1Yr3f0W9M
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae21304 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZJyx6tJpJz6uHbTMGDIA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX4Vn7JlScRIdn
 4x6udtFA85c9sHgoM1s+8pLXvuWIOJA2aFDkhWY5n2zAEndiiZWQikmdm3x99Iql3fH4QQBruek
 6FKT8xs4s25OFPJz/BzlaAbVqBeKd0Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  7 ++
 3 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..84b244d43e9e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -48,6 +48,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtbo
+
+kaanapali-mtp-camera-s5kjn5-dtbs	:= kaanapali-mtp.dtb kaanapali-mtp-camera-s5kjn5.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
new file mode 100644
index 000000000000..d0e39855e0e6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_in_port {
+	camss_csiphy2_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy2_out_ep>;
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_mclk2_default &cam_reset2_default>;
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vdda-supply = <&vreg_l4m_2p2>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+		afvdd-supply = <&vreg_l7m_2p8>;
+
+		port {
+			s5kjn5_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <1248000000>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l3d_0p8>;
+	vdda-1p2-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_port {
+	csiphy2_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&s5kjn5_out_ep>;
+	};
+};
+
+&csiphy2_out_port {
+	csiphy2_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy2_inep>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..c70cd39bcb75 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1243,6 +1243,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	cam_reset2_default: cam-reset2-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio16";
 		function = "gpio";

-- 
2.34.1

