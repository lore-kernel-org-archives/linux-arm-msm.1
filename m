Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898262;
	b=fMRgImtyJuE+vp68diqzWyNQUWndmyTVdbnipnizj1SNkrtFDu2P7zveZg1XF8DZvFXi
	 2bKjJY1I9p+6z03ClfXkS8jOMO6SQZklIRDz+UYdA3zkDhuLbeIPd/juO/M9YHwG0VI/d
	 m30yhtBxdK/0gcZ/eEIAMucyyCk2Z8S/E9DkUU3xomW3A83M8cFiBKHb/+T7iwaa7Lt7g
	 azfBSvDsBo8FPZW86F6r2hBQcwdDYsOkwDPeaAfcPiN1ohQJOtbUzHYJbI4oj5ogsmtd2
	 elBCoCXnocUdUc7K/frj21x9Of1AIdQEMXczyj/iOHwxHM1EwTnNZ2qz3qgo8mVIIJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
	b=uTFvJfVQ9BkKAWv4ffFtdthZ2blGHaHv2wICEG84WMpiq8LK6hq6nN3trWyWcrhrrTkY
	 n6c+94czYI+J+zYo8xhB9a1q0Ky+UliaufLb8fStxF0ZHPOhU3t/sH/ep0cVY8sw/AQ8t
	 UabjPQQs6AbH1L7DmAdzQI2zh9VLZIZnhaVXrCbJ7mivbu0RhtBuYwAx2NC+nXQLGhxff
	 R8W5pkekeZ+40KcWrUlLx7Hf3U8Qvced0cijck1MhXy2f7kUMbpqa1uH9MejMgEgy+fvs
	 UebK9K87latTP0pL9Uhch0K8bxed8rl5S4nlJYXXzMF1K/owM8SLhuUFK6jDhZd6ibg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gqf5Wgt7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BLghFkbn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EE4606A321
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13EE4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gqf5Wgt7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BLghFkbn
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P164wx3074669
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=; b=Gqf5Wgt7FLstbzJC
	lki7X6yL4yu9ukVAl6Y42L6ZfGb0Gw41DEKwlOe5obCT/uvG2fWHSAzSAZN/AFZr
	Zj+F8+1fLxasf9qPF3OUAndrVjl90mQx6ivyFaoBQbPWEYNNca5NQrKMhSPWk4vQ
	xSFuhzu0vR2Z/gIJlL9RuGstdEbVusKLN7nw8NxLIUymaqgQDBTepNNhZe5VNjf7
	DRhVpI3ZzLy+BV8wQKiWj8rFfLIzBstTk1yI2nPckvarCnPf/a/VkDGuDCQGPMgI
	38qx4l7cNZi9K77XL0uCaARoF5KoTh9AqSoIm/OaflfyJ1kPTFi1rZcB2tzizg3x
	4+rzGw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmruja4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so9408833eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898260; x=1793503060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=BLghFkbn5hI0lL/YdwEGP/qC5FE+4IkAk29jj2DWTcl0EI+SyEz06i3LJTAWdflSzP
         NjdYfiQuEzOxqUf0bsICopeZajM3FySO2Wi7wcJKSMjswq32ML6y+haUUhI3aiKy+7aT
         UCl6tihGMgb3L081h++Js7kWFbzYlfEcImaC2qhhiBplZfmr8c9xx7lf7WLIJVrkmlSo
         yZttia/B6Y2yQIyhItQCKO6uWgoSVaz9xo+h7yHydmQry4+vnAFL9jtk2OB+PwKfbuNJ
         6GeOOSuCImQogngBtjqntsfq0wLGQC12GL6ChQ2iYTQiAu7XF04H1m1957wFnAloVvr4
         CVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898260; x=1793503060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=wNHfv313zL7F5QPMjhYud1O9+22iC2V9Xy4EiAHL5PhJ3LaFfhETwhQMAN+K4iPwqS
         5L9YAQPeFCROfrFkwB9ZT3AGDSku541peSTBpynQWoslTrPSV17WBeTv5+B8vsdQkEHs
         +laEEJHtdbY0F96znx4WdDeD9rtpT+Df5HWPHucXCl7vCX1x5q9UYWJSyGckbZ9OgiLJ
         C6Lj7nP6Ftw8s0gMQkiwg6KsTENSpQZYtkJ51g5w7ie14C5/rjL8cIA6FOo7kncMR4Ze
         1SGXzECok/2o2IT15SfURbCJzLa91SUZ+5IRYGNLEVNqwYFpwuvSZRzj029zOfm3HJBl
         U0Pw==
X-Forwarded-Encrypted: i=1; AKwUvBzTNe5O1fnHWs3jb+VQmQxgRBAvoFeT9NjqftMDP0oRUYhSzIwECNOJ7I3glBWF43RRf79vNnsejYLJaSER@vger.kernel.org
X-Gm-Message-State: AFq9FYLWMSVe6IOLpIJ7I11ZwiVnRgTyFuu4T7luULEyIMG9/kXhjZ8a
	OgHCNAndP5Bw/FmsuZS0RhYRdMGcN8EDWQyn209gY8V8s5mZhDxULMN3rO4AhhBSiVn7IIxbrjZ
	Xf5s7eJP2JL14wbb27oyxHw5M8+R+xV0065OZJPVZlkDJA7y41zwFobfcouKrYc2rCc/C
X-Gm-Gg: AYBFou057drgvMp7IS0O+hx0v5TDHkbXyv0g/2dqOjrE//2WINqPZgbGREVItK4yX/o
	GDTQEB3l2c95HL4qt6P9Ze57ofYXczEINn3nBpIILe1jLA5iIBBsm+wWI0hWZnmmZO9273cJdnk
	ua5TjBjKMEyrESzk+iEf6ThzCYd6e9uLz1IyoNxQuw8wenrZ1IYbKIM7aX8Im8PSTq9mzCjNKwr
	VT3qQhYyCgeOIbLvWwvs0ovGk6j3cmdybKnBlj/SfV5dyf9Bl40r/LJGhMZR8cmg6KBwAbyHDwl
	czdGN11k73gJqsnasv7mnytI8kvPcmt4o/tgcIrfctkpD1ZnxJ7PAJx/05BKst5+zkT29fJT1M1
	fygdF4WIFPzCpya5F9VA0hjIVDBJrmARcTm61GOWsrqB4jzARTZlt7c8qtdyozj/4g6zv4TrCtH
	sgzqLb5jmi4A==
X-Received: by 2002:a05:7301:4615:b0:369:2505:380 with SMTP id 5a478bee46e88-369e84e80d5mr5202320eec.24.1792898260071;
        Sat, 24 Oct 2026 20:17:40 -0700 (PDT)
X-Received: by 2002:a05:7301:4615:b0:369:2505:380 with SMTP id 5a478bee46e88-369e84e80d5mr5202289eec.24.1792898259504;
        Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:33 -0700
Subject: [PATCH v22 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
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
Message-Id: <20261024-kaanapali-camss-v22-14-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX4QoKZl7mo6ld
 yHLH7oIZo/Lo5FBmWfHrYT5C1n0Bi4HN59gsOgq+ooATXJLcAkZyZIXHBLBEp5yEzqxfAnfo2kn
 SI9KPG/ZkTu/fV2Mt5F/zcbba6eYBwNAyTZjl5IFdsuPv2+nysNT4IDA6AxFSN82EV0ajrPw9NI
 FzKqYyxRlrAwWhdv+ElFRPq3LnCAdn1n5jkOzHOtlcyIRJ1BMBbbvPHTD8vdiDrCsGsu1Lch9X9
 sIVE3dt9GrN6yaTKh4IHKpMhDhxYIhtbkmp6zY+ZbcClgMila26L+URzMS470y5MIuH8MtwjqP1
 HoZEbhB4UXUkTI9FBtZE4ywnAXedTKEKiAGjmCMiy2h+s3osR3wScPmdNd8uLnhaupXhkg/ybse
 8zMLqqZCHHBA8Iax0iqOzN2Upr9jpzEfcuobJ1q0+OVnqoyzT+46PyDT417Hljn5CLJSUF4dxb7
 7088+Z9wqe9q04N/kqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXysaz/7MYcwuD
 +D15CDyOmvuMTpF+wKDmR8DR08A7J9neFPGZfqSCPJj00gUkBIPvHYdmzv/3pmg+BvEPLE69d0d
 +mnL+4x/ruIDJaEafXWqJS6dLKRR0Os=
X-Proofpoint-ORIG-GUID: PHrVlcA1njdk4TBl8c5tYuHtou0qHlb9
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6add74d5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZJyx6tJpJz6uHbTMGDIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PHrVlcA1njdk4TBl8c5tYuHtou0qHlb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

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

