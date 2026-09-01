Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF83946EF79
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249360; cv=none; b=bKi7BkkujAw2eBho2sZPYouGLdfLWJb5Dw515UA1EH8q7HbG9DAwVeL35eSjllrGHxWVnUbsys69ff0V1reig0KzP824i45XStI5CMj5CoUzrL4+G4QWjc1pNqvDbIrsC+h2dQTMKmRLe/opBTI6BBmQXM/zkuuymJBH2b1H80I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249360; c=relaxed/simple;
	bh=f5VRYrNrkoFkzfYJ3qJcnbvJpcWK6z3G2sJ/OdRAgEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8q1okRcflgdfjZjF6nDCP3fyK4zC9PBUy/w7Oj/aCSn0sgBRgEbOcR3PPXfyFJQ+7I7ZRr5K2un8lRYGVgsCNfc3nCIfn+3ElkMobbqCnDnQ5UnNVxraEXObGSl5fu0MZ9jdA9u/6QUj6+rnhcHK7XMTzl+wy5/bQgK8R9Atk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUwgCudP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jppGyUY5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUwgCudP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jppGyUY5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179CbG2061536
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 07:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YqOiAEMac6E
	D3MqD1TR4VHjt1zwOFQxdqtob1gSUfPU=; b=DUwgCudPu148gFW5duXESwkvsU4
	EiZYgZTsrXkAi+8vg/IJ9awCrZXuww5etNUwf3M8OVyIN8zdF94cOk2xohUB3As/
	VSREhUVnQvYWhe4QPURc6yEyEeDZq0S8yUSi9S8e8BxNmTYxferKH+oFsvnh/TFt
	2RnpjgWCWerGaucILK9LNmnlYVnz0qf1ZTRM8ImBOlz5inYWsplf5iWsabs0+ehX
	UEfGpZhLSlpHx5EBXF8iWt0IBJyiUx2iacKYiL/UCZi8CSAJl4t4KYxjflAUl3qz
	4IsQclQ+ZZJuU7OiBKn4+R59gh/omVs/lsbMnLBZ5AQP4rcBdyhL9xnYK5g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0v3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:55:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so3171428a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249356; x=1788854156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqOiAEMac6ED3MqD1TR4VHjt1zwOFQxdqtob1gSUfPU=;
        b=jppGyUY5yQguOIJ6T5qFrAMdGeRoh7US+HtUaxcVemg2aZXH6SdQDFN988QTIysPNs
         jPkBV0SgnxQieeWlF/TfjUJnkBZqVc/gc78Ol99TWi6oRt3HdX2vpYN/bQ20/eQn1MSQ
         LLdLP1JIXvf7hn+Gr7wlkUhXxLVW/2gMo9ZBxA43fITcN/aWSdiyEtJcOvd/nUAqgCdB
         fy9v/QJG7dNGfT5WP7Cyqjs/XZrsW5Qgtd5/pkJXkGIXqqO9BY3dZ3yNp9LEQh/tpTvR
         UiCxGbvOULd0kY61nXJDkgydoCi770Vktdt6ZVarVOGU8z2Gsd2MHsUX8WU9hAJZCgke
         Hlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249356; x=1788854156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqOiAEMac6ED3MqD1TR4VHjt1zwOFQxdqtob1gSUfPU=;
        b=CyKiGBUYKvEW9ONRVDdV3F1MOeQ/fyG/uNYniCOSqZLyW2d4g9zh5aY0YUfpiUghZY
         wBOywU3tEu/6ekBAPDoudjkmcAYeCQi88X/l+E1x/r1G7SCbMD6yZVlwqVu8RMaCJuX0
         5HaMcKHz7TYy7mcuMrSdWmyiQIHPqhVBCiQKlrpQc9z5wxbzJeLc6quOf7gj8JDGHGYR
         7dxlAQdwIZpyTUMBWXgyl9q1xaE9N2rtLdPVS7SAbNvhaatrdJZj3L4bCYehtMoKCLc2
         XiCF1Zi5dEwIR9g0LCRQFOo+Dip8Qb0zf59mlRRFpRHPGipcdWDqO32Sw7DcLZuhBQW8
         lpTA==
X-Gm-Message-State: AFuF++lo/gnj3Tq8pj7oiHPE4lWQHMDo/5aA0bc7vOBw9z6x/xn3gvrc
	FZX7vows3MGh4ELsmDV0y/IGrxo81JQ2UKKC9KHhqaYzkEwv+D83lBshmfauKXvvi/COuzUbgAt
	oK0j/GXcuoX3sHgqqWPZ7D7dpy4WdXjV6UpicGoYq1oqy1cj//yug9vKB07U1e+siUGDn
X-Gm-Gg: AYBFou1XO1opzfqXY9NlIzqTDeSk3K0J9exPaKdS7JmXbacTDcRd8P+qldtChyYnGO5
	ZMkiwtyg6gFPPafBTO2DmMZ4RzdK7CLNSvQKjmvOte0TcrrFRxKjlGNtflm4G+G4rqLqajyIn8Y
	OfFjY1TiCnVurKfXrd4JNq0ThhsYvP14LxU+VJquNpLjbdzrOhvFRSXPL/Vd+63fj4ad4JhR0iB
	iiwmBpRyl8kKhzdIM7/DiVlKVMjX80qtgqg5jVA/3OWEqslfVjgBdfQLDZrqwdQg7ntYY2fqx0P
	5bG/3HtByl/RrdYxkQvxdrLlYcOM2ezUlA33gp6hbNTtC+LpkmLKzkDHX24vPzo2juB9O44BOVD
	+fC0nlt5zVXnalCfT2kvmMH+Lv5+y3zuIeaUagHObPdN53Q==
X-Received: by 2002:a17:90b:384e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-396d104d0bfmr42433138a91.15.1788249355721;
        Tue, 01 Sep 2026 00:55:55 -0700 (PDT)
X-Received: by 2002:a17:90b:384e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-396d104d0bfmr42433105a91.15.1788249355280;
        Tue, 01 Sep 2026 00:55:55 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm54873262c88.4.2026.09.01.00.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:55:54 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        xin.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 1/2] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
Date: Tue,  1 Sep 2026 00:55:45 -0700
Message-ID: <20260901075552.3558150-2-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901075552.3558150-1-xin.liu@oss.qualcomm.com>
References: <20260901075552.3558150-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX5bevQTWK4lmA
 VhZ5Wl1g7S4McfkcIi6MCd58NLhuYZXLlzDj9j8tky3ZI+QbnbhHqf2nnybEAdnpfcezpHdAalE
 /4YbcIscaegC44Idut2APsrQwaEntPs=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96850c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=r8araxF3PNjSti9Ngu8A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: IAl5ClVztzjVLx38_ZjPkF3TT9kih9JY
X-Proofpoint-ORIG-GUID: IAl5ClVztzjVLx38_ZjPkF3TT9kih9JY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX/WbQ4asggCRn
 Uz2ei5WFv7Ncd6Wr5PbGJpCrbgKHg4O98nvn3nzDb/mHuG5odJAA6bKJ6b3rW7j13L1ztJKRet+
 wnBBkV1gsX3Umc+QZVBoWg1VtX+kMa/DptQUShmcGZNdKEDFh5v8cwmq7D9QBHhM7PSoz/OdPnF
 560wKEpBVjkTm5pVHfmvetqX75lm+1FKZVj10fKlofxYQ045lBUJhEunC8KXp83WLLilfT91QOo
 uk8iptQRCF7YTll7sAJ/BlyNgQHYpFDlYnpnyKzk4nKDsR/RQdj7gyR6Ws9PcmGEHqzYywacT2A
 8rXOxNFERnzcbEz5WUmpfyr0FSThJTJgAax2ikPzJN7jzhwmrnhJFNWpPmyMZmUz9SZ+7mPmRgU
 k5zeW2Pe7cbVPrCTH68PRmfFMkGBDezpHiMD/eIONZCIkPIthgFvEA5N7RgMPzvC+ouC1XXBvis
 meBSUTnNxB0RjhIs/kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010069

Add support for SYSTEM_RESET2 vendor-specific resets as
reboot-modes in the psci node.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode.  "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi        | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..5db2f19dc86c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1192,6 +1192,13 @@ &pmk8550_pwm {
 	status = "okay";
 };

+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 8a96ea1bdb9c..a416114ff5fa 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -374,7 +374,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};

-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";

--
2.34.1

