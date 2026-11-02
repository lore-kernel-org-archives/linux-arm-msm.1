Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616167;
	b=icI1969TtQlrCOIkzjAmstSmiYHxu3YNLrmqyH0loPbLUZaDtj1T9kv5BIEHsTAZERI5
	 9iVjLFbSQ1F7Y87TYF2vW+Wi4xAlbJbb9A0ormKg2v9s8UvyF0HYE2aIWWJWJ+AR5hBa3
	 L+YCCFsnyNFJF8zvCDm/E9W3xncu5ZRyF6WyrL2aiySxLVQB0MlBJbW0Fh9N08UBGb6CL
	 VXCI0sRMPR+sv8ANEFLgwGxKBGpjIH8wDko52vwQ5ksYqrUImlCMdL051Z+f8ajwWHNpr
	 sjisW82IQOrgLOOtiu5L10ZpSXQ32Qbsv2t76jmrSkiFH6mUR9zXlMoTVrg9cHxVrOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=;
	b=3CX/L3VzAvqCVUZfHG60DU9KNlukQzTxSCBBQNj0lHFmDzrMvJpMqqKrC3E7Q+jYPWCa
	 pKjE5O0mwLA1rQHqM0lhPa8PabawKBCJN1Dm6vpwrq+e1og9BnS0B6H8ZJbKqVlj+lcNV
	 HgDwa656oAcG0vcu3JSsC/3ZhKYMluUGwn7mXWZ81cPGTnh0ZwtI+m7+8qomm7KNiXOND
	 T4SFKvVfPWaRyQn4zfXnzHd6QV6nItHLZlxNr9fz54r0T9tlCeiwHa92IyuXoXJ9tNSkP
	 GO23JX5IHC0ctKNvujM1gIoNrV7nHUsnIW11hcXfIXw468VCVUmIS5Op/Ca6NUlA/QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cn5HKJch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuNUEXFI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6455060A3819
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6455060A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cn5HKJch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuNUEXFI
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A4hW260600
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=; b=cn5HKJchFxnD2Pb3
	abSbABmjYOkN3fOGFff63kYAWGD68+t3hx9kIbyiCSyrHtNkQAmm0RSn0VXCKdi6
	q55s+pVoDqdKMKbmX7YxIn63fcSWLZRPvFZLWtvHkLBFcPhANL7b/G4TaZhTkTuh
	Ukeu5LaJXSGGEOU7lLtnyJ4raYvxyY5fHbBg+aYEtyGFkp1OWlktO40gzKYdQQ85
	9a2WlhR0pFbYsZXth3Z57uoThPwgOdH5A2/u+zIK9jgHSZyvwqCu2tjYOuk5+hAo
	J29UO62luPIJZE/NnTzo3BHjXudEVKzQ4T+Pn+gEeGeIK8HskTmqiLpccbhHuyS0
	8cZPcw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrc8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:42:46 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-847e2926d94so4728994a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616166; x=1794220966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=;
        b=HuNUEXFIvM0nrdaNNLZwxSR2+KktEwiFpBnFE7jqzvqyjlgxFLAr11EtDqJiFGS62k
         K2y+GYC02cURoRbbBGWL5uolqOuY6AyQwgBRWtBuXaDYQY70vdm+mzGGjGm45gDOkavh
         ycVh77HURppRBhThcCIN3bJIEcDs68QDP53TvrR+r0k8y1vXj2p7s0CwQqKirCUD0Oe1
         FMZd6fbPKg7+B7aGJI39buzUsezfJ263RseYYqHe7jSszazHxlLa1ENtVhdFnkolxxCt
         U+TNqBt0Idl8rbh3IC0EI0gJmHGKmW+UnIB6s27LJ9fzt2hJsLZu6+3hyi4Tz6R9fjuQ
         n/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616166; x=1794220966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=;
        b=kwiU6Tpfeeq03WKAMM42VfMjUKIucz6sEvDzXeVbRcd+Jo3DX+PrJiR+cMhdqslKNp
         aJIIh4qaYG09aa1nlZoPzjwANT4uK4CKl/EeyeVmkcCCM3/HPHRc5P4HvoZU+9AR5D8A
         u8cbbBKi8TL3AUjs28EtyOlMGZk0//xvj95ssFlqsJcwKMSDagQv1DNtANgKW+ZZJOUc
         VvwqFwyr/BI+XCMHoTrmiAsx9woVrAtUGKTOMTwAKe/OZv1BZMW94XZed95jtm0Buquk
         sByY4+sId8P0me+L1Dcp9OoUFmswlsxxQxPXftzD/XgM5JpSU/Bo5HgRm+Vr3YuJI/us
         PRPA==
X-Forwarded-Encrypted: i=1; AKwUvBy5QaSD1Dh4cigXIPkbrsgquf3TvZOXvTsojc1MWde/MLoxP0OpkcEbGp7pwtS4Cr8UHxbYb6xlKx7fCS1v@vger.kernel.org
X-Gm-Message-State: AFq9FYIocyltcBVuKnOuwDoJeuFDuKT/2JxHaTzQq1XYaZcrFdxqwI03
	uUSujC2yGlMCn7xzlqh1U/3+ioiY+hsESd1u74eYJSaX3f55mZ5R0uvioZcQ/Q0r+qGOtj1/r+t
	9zabp91GejhiFpp/jIwT8k+CzigDq2l1mIcu6dqZMBe24IK3HzkcumWPvHSE7erbQ0nzfP8Whhk
	WCDJk=
X-Gm-Gg: AYBFou2jzGwd6U1XeTIRfqwQBEPZlCgHBMgwp2P/UmIK1U5U+n0KLgVCIW2/kHYAPqo
	jk7Y7mgjHvUucwqBU6uNlihLhww/jVYAA77ET60rQAOirt7KIM25N0x8RFTrTamWtM5W9zLSwza
	V1wagNkj26RMj1Tc73tDuoAXKUJ6pT8wRs8xjB1ZkFcKJZBrflMClFdmKpq1Me+f97B6V5gk51s
	lrp+JSp+CJUzcLE1vEN5TGeQh4Wmd92LTIDRJErAAtlXl66D5QTU5bwNT/84QJSRVuR2JhTycak
	/jxmO3cXVYLaDnemANpX1Prb075nO+/OCbx3ERJ8IB7H4vaZkoefAk9dZhCasDQ1iz5gJg2NDX+
	BHQQ0uhLwVvjBhh9HCvuhVsbnV53YjCeqPoi/ESey3er+ng4dhcSeuyEDbtlw2UlqoC/JY+TyHA
	3RIsSfw2wJ9kWDKeFIvTE67GRTkz3OJJjiGdnqeuGD9a5f75jjgogWqaQ3diM=
X-Received: by 2002:a05:6808:244d:b0:532:4867:8916 with SMTP id 5614622812f47-5640d9277famr6043874b6e.4.1793616165705;
        Mon, 02 Nov 2026 02:42:45 -0800 (PST)
X-Received: by 2002:a05:6808:244d:b0:532:4867:8916 with SMTP id 5614622812f47-5640d9277famr6043848b6e.4.1793616165250;
        Mon, 02 Nov 2026 02:42:45 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:44 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:23 -0800
Subject: [PATCH v24 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
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
Message-Id: <20261102-kaanapali-camss-v24-15-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae86926 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=azXR8Rw6a_W_3m1MFLIA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7fAIGN40sX2cWTH0kMqfsDw8APTpyHuK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX9XqzPZsevxID
 N5ERb0wYoT+sPZA3JbmKrRC1ErSMxIEx+pvm+tcDgGRona/HvcqZDuMRa+GLbfl/9PYeD4pV2yz
 sRzu3oT1OAr2vbA4kUnl3PddaE+HQ24=
X-Proofpoint-ORIG-GUID: 7fAIGN40sX2cWTH0kMqfsDw8APTpyHuK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX+vT6qNRzpBYJ
 rssqWlzrGQftyHkjRUJMP7H7wioqdtdNgN+dAnbxlPn/r9w53pqrpi+f+nm8avKb5oZw+U1bxoH
 uJMHY+fVzyY9D3TwllxdpjH0sAogZy3nuYuAiLMHgxkYLvqNM8AmpPRtt/9XGfRCO+DKqMvrR9H
 xovP0mMos0A8kT7PSziNPWFiUpZUxrDCu/CmGHB8n/hBhI/hDb3n5Tu4z+H/6mrkm3avPlny5ky
 5tfE+LiJqYHxvVig42GL6MYZblFEnay7Jpu1c1hf3ZOBYCxvCefQ55/dF3fzlPAmqrVDp4BuTAd
 gyJm5DqS2kmc+Deh1xQ8+Fi82Y6QjLtABqHauIy1NDl47acS9PoNJNyPx69vYzYumQ2YGxksin9
 cyxXLe2r4tWQMkroXnyMghLZgSo9hVtncE17pvscdx1IcrOibBs5f+D+3mPWmeAghk+FRinZtGi
 oTCQvFo+Mtw/BE8I9Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
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

