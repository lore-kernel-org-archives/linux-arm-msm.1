Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485923;
	b=ctnAvdVkvdv0mP6BxSgu+jY8svkgn5gmvrywY0BHlkrwQoQLb809Gpz7FinbIcafZgep
	 L2YavRMD4EsiIUS3GQKpK3DXYK4e+oGIpkgxIuH6YlcTK5Bdld786nWXNbR8ZqVQa05dv
	 SG3nENkfNESn4Zi6laASrDaDEwT78o/IEgX6AOL4+MJ8tvNCMcRmoy8xMPjzx6xrYW9tq
	 JK5oGcq7SNSZIEe000GYIBmL7ktctqI5SEIJkXTudgabvR4teyMr7Q1hwRsF7XfffXMH6
	 mOv0kZPp+Z1vSoFHL83UckKdd0UWllD9ueUaTAwuM7O6xy8E/wSJZurbCBemK4jZg5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=erg5YrXF+Y7d6I2pDimstr4WSiE8qZGfD64QK2fOvs4=;
	b=kJ2kbv3iNep9NpuSoZf4tdXwedRkY3HEQWAkS3VRoiMa79qER5DpWSYcydsZn/kauaTQ
	 F/zuTxn8ftzXfwh0eIzSS9BynrNXh8sshqU1aeQfG6jjtwstZFfXOwfWwMS2HWkbZtfZq
	 WYFCZFiu9JzbXOaiWerZg4VhSF8h8lcbReKK0x31AQ/raOpB+hupAwsTc3mXJPYdSx9uC
	 +EBUO3yEgJt0uWWD2JjIf3bl6iwb/BCf9ECp07inv0UR9bXysXuEYqSB/EOe1fpRL2AdC
	 Q4H65dkp2dVwhlrOkFNjbl1uxYZctQkF0+Kte/57SEPoeZzwcq/PM4F0Vmtn1bduWAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JbGs0e1+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZaVU3lT4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A0B606A332
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A0B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JbGs0e1+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZaVU3lT4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K7vVuw185960
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	erg5YrXF+Y7d6I2pDimstr4WSiE8qZGfD64QK2fOvs4=; b=JbGs0e1+Xo++jHb/
	7hb49mniSKDVwJC+DX4K9Ly+vq3XfoJoAZPTQIw9xI1TFUpixZSnaZdt4kFXLp/9
	qGxCf7iE9bOH5dP5YRhHYO5+72XH5ks3De8WGrPkx9VJ1/hV5qarz/XMskZlKzKd
	uyrZ1kmqM2QGiGdlgbk34RLwgPlS1PyvHZ9VDwl+VoeGP45GXyf9gZl3VymhunRF
	kQk4xww7876pbwlJbRnTaRCiJZWUmCf8PTHk83UzjgGI42vv9scG26hl4zwonvIK
	u9rTi5B0LSbd1qReQYPLlFi5NChY0Hxk2eLmgybu2S6ucetV8wocrimC34ky139s
	TXyK3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nspes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:45:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so613593185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485922; x=1793090722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erg5YrXF+Y7d6I2pDimstr4WSiE8qZGfD64QK2fOvs4=;
        b=ZaVU3lT4++VD9PrNCqI8PSH6MFnLYkqg8TZJPVuztrM0bDbI5n8r5KgsZlJcYjZN1l
         cwmsuXrqyt0xx/21JN95ldxsZafmeZuMFXGhiiXoda6fIj3DV+56lKXa3+8y23OBFoSS
         wrU3eR53FPNHcfvQrTlYcW26NIKAPnBpQzFfQfCT/07Jpl5RvNjGBFwtl/hy/zeZlfss
         GNhDuHiCDo9DjbwQpICPuIctRZWAiIoLmDPl7O1B92RuArxbIznV88zPd8w7SPQn7cTG
         4TITO9ehkKc3zhE7bsSdBALHDPv8hC7BNIKF5ZMsSEasnm3EaS5Sc0pf16FTWExQOzHb
         QGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485922; x=1793090722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erg5YrXF+Y7d6I2pDimstr4WSiE8qZGfD64QK2fOvs4=;
        b=PPPsWxSGQHrGS7GnHdU+nsgRNfFydqQrTK2dn3DmgYDzor/CbVzcfN+UovCsGWKxL8
         700aJkbUL4HFcg3p/ROoHolvHXGyISbXD/ZMCgrg6vMJTt+LqSpup40oKI6lYZ6pDbE8
         p4oQA3TNM9Krq9Vet22uHaGfZoaPLZLtUI1WgP3yKq68vdss3x4sBP8AcHGlhHdpokDv
         U1vBLFFLohWJVs8YpczZRoipFKW/UMOH8zQ+TjR0gGQMZxqJmQIioi5Sy7YcoVNgTMS+
         5HgqlCnJlEAXNUDmNeg1MluncsU2SQ0GhD8lZUm0xg0N7ftg5AztrVYtFCE6Z4Gfly2o
         oMbw==
X-Gm-Message-State: AFq9FYK15J8HrfaDR2BR9sXa1pph9Jg3frL5k7TSfeYiX+RpDEWrIR3j
	ieL8RFohMqfQUMpmck3dBKIkGYdsNGC7uXQwJYTMAdtQQYX3gTpTPXU7abgbdOJngKyvvPpseMr
	FmXZoAFqwMnn2VFfGkw2JUyWtbbLvJEZrxzO+hKhMt1AQraX75vw5zdIqgvNkFARCyTLXE2xODE
	dt
X-Gm-Gg: AYBFou1xZyQySToisjhP/e2cxGpNYyGvNmnD8A1iP9j2rhMX89VKAOcITEpaFb8jUM7
	O2Ej9dcCnInquPVEQ5RsQZOHJbJVOg1O8Ne4wmcj/Dz10nIJggBFIzObqpci/w0D1HgA2mZM1Q6
	GpcVqboF+GSzts9ApRR9iE0Q6gLaDdui48erMfoegdeIPHnlLdZ+fnNjM7OEXIPezQiQDt71wa8
	9Lw3TtZg0hcVhg3EyLAqqP7uRtfVk83pavZ6J+TMyuFfOFDZy8kRRYQNpynUUx9HEeV3GEPdqgO
	02ne2mWhTFk3nHO1Wzl9TzkZmC+H4PB+NaPAn50C99LzWuUav52A1RTz4atXbhTbFCroTxGhvxN
	4nPND7/jsLH9PQotTRtRRKzYW8hT9aFsQt6zz74tbvdbXd25S9LYe+tk5Z1m69cbXtSZ61EvpPQ
	hcJL8oSldVmbIv
X-Received: by 2002:a05:620a:bc5:b0:93f:1d71:41d5 with SMTP id af79cd13be357-93f29d7bca8mr1593091685a.52.1792485921686;
        Tue, 20 Oct 2026 01:45:21 -0700 (PDT)
X-Received: by 2002:a05:620a:bc5:b0:93f:1d71:41d5 with SMTP id af79cd13be357-93f29d7bca8mr1593089985a.52.1792485921258;
        Tue, 20 Oct 2026 01:45:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab20a8b3a4sm27637231fa.1.2026.10.20.01.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:45:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 11:44:53 +0300
Subject: [PATCH v3 2/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix
 ADV7535 interrupt pin
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
Message-Id: <20261020-ifc6560-adv-v3-2-5da1a33fdcbd@oss.qualcomm.com>
References: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
In-Reply-To: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DIToGo2BfOvIpfUMC2cI3zd4SN8EqTcftxa4XLSNAxQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1yoWiGWmmOvLBooDg8c00aeCf67/Hv/JRiQY3
 zd9Gp59VhWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatcqFgAKCRCLPIo+Aiko
 1d+YB/92Fo89RpOKx9MqfGh6TuLXak9JhzxvFngwo3RP6LH80AMAszb4e6BQCjpuYBguA/5BG1K
 9L7q9pBUTbcmsGlIFvKSdDlagmHLylXrUqDRzsuD+9NMPWZ9hmsVj4Y+BHySWNEaM5Y7cvf1o0/
 Ib4SVlS5wIm1ehooO+4AUxBH7KJ1ilEPGUiERqd6Q5Uv26qEWbtyjCoyRuPqvTFF30UKMsiKhZn
 kwSsopg2vDq/7qpcr2xUkZQ7GlX6dIyaKDa2hBlInVsUgeemORFtknpUi+CqcKgRt75NnAbOIrl
 /NLg0APh/CT1l7NTqA0OT1BBTI/TxOgsCzuYexkb2WPOhNix
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Rp-0f3Jhhz4XihN0UX8bG2_lhGcC1Cux
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad72a22 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KOZXxBBog8g6AmAVVB8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Rp-0f3Jhhz4XihN0UX8bG2_lhGcC1Cux
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX1PTeYy4GDxck
 YdKyxylfe99BvJNtF6R7nBBVWDVHbzs0LD2mnZXBrnizoxQw/8L3ESYIzZxSm4l8xRt5dzu5RHf
 9xAW+alKTogrBzLov9HC2M1Y/96UG/mUhb6YAEtqZoIJ9siGQV1A+JEXqoB9NYy6R8+sLEJPj9b
 whaiS7W4Arm8mOFh4WxX9O89klnNwdWW/5x1Z7VyWB6diPIpKAFjT6Ceair+XT+R539HHEClDKe
 C5QsnT2RLYD5N3tirtotaplfkXp5Tlr3PB5hQPHVR3CStKlfRmfGu7RvlwuH9AU817hMGh8DjQI
 7iktQ+gbDO4V8t+UIvAiSZ4lH13RV2SGod7V5+7ywvMpoI3kdTxgX7wI9hC5AIJUzB/0lOrURPb
 XjnLgZbJ74kOyWU+pXDNoYAJeQif5xm4thilMamWVUXFCaSTwsmUZ15yOVLkG//JCPkcYHJ2Jdu
 +ewaE4LAE2vm+Rmcw5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfXxBL/KofB5XWw
 6I494h2OArgT+bkUyEFNPSfeJuwFSRUsx/tD7OwvgujQ2sV7N56Ix9v/lJkAhScs5AOXRPOipA5
 IGHEAaamFDC0eAZLvCw2Q3qb3qBfr6o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034

The board never configures the PM660 GPIO11 pad carrying the ADV7535
interrupt and relies on the state left by the bootloader: an input with
the internal 10 uA pull-down enabled, working against the pull-up which
the board has on that open-drain line.

Add a default pinctrl state switching the pad to a digital input with the
output buffer and the internal bias disabled, applied by
pinctrl_bind_pins() before the driver requests the interrupt.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index eef4cab8c200..b3e4a7c378b4 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -170,6 +170,9 @@ adv7533: hdmi@39 {
 		interrupt-parent = <&pm660_gpios>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 
+		pinctrl-0 = <&adv7533_int_default>;
+		pinctrl-names = "default";
+
 		clocks = <&rpmcc RPM_SMD_BB_CLK2>;
 		clock-names = "cec";
 		/*
@@ -283,6 +286,15 @@ sw_ctrl_default: sw-ctrl-default-state {
 		input-enable;
 		bias-pull-down;
 	};
+
+	adv7533_int_default: adv7533-int-default-state {
+		pins = "gpio11";
+		function = "normal";
+		input-enable;
+		output-disable;
+		/* pull-up on board */
+		bias-disable;
+	};
 };
 
 &qusb2phy0 {

-- 
2.47.3

