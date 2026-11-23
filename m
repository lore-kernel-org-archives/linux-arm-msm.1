Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426530;
	b=P7KUNvkprNmsSh00uQzpIZJZWb20l6EC6hwYOWuFmT9fi0rzO2xsfNg5Kx35wlB0ZMr1
	 WOaQf6vM91dPXBfyt6BxfAvaq0ekGP3XrLBUVc5daDkjxGc3A+kc8KonzGyqAA9eJoeXB
	 YNDCtltEfqgj3EnzIrXNOrAhEh8sriQsuY+2a4UdoPDPsSJKAGyVoybpJW2Oal9i1NMVM
	 g+fwJAGVcTg1yciIjDpuWpFXdD3v4JsvhIr7WkzdOFU7bEhrseB7LGGTSN4W4RZbBNK6i
	 ElvHiedTapE00xu+iuz9ECuks6QSJn+jwG2TCFNKF46/r4Jq1q3BLmgCyfK94Mf9McQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M9qWuj0GgOv3/05r0pYuZlm1jUF9K8rfTVr2Hj9dZ7E=;
	b=BRUxXWccW+C2oTQU0sMqxfuT2pqqx1HHvoPxaOQ/6ufG+1gurH7JXqa+iRHL03Ku6z72
	 fwx+9Rf5jOu7ne1phgVxsNq5xMy63rURq+Kn8EkXBKNo9JwquLxnrMKD8aaywgYfPWNiE
	 ptmqJtA3otH/Ul/mPhTwB/ei9Zec2qW7jwoh0ugwdk1L3ffxFue/IqhLv2Orb2p8mZJZu
	 cgWS0ej5a8vPBlSmDEjRtB0ucR0ocb3SfXq0YECet1CCJgu62hgii1o7aobrA1lNyHYw1
	 ZYtV9bkdxKV7v96j6BN7hHmrgO2/bBrb+5oXr3cM0T81eYrrll1equIiMqSwlpVfAlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="izL0nl/Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WstZYl95;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A917D606A33A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A917D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izL0nl/Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WstZYl95
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FpTU2785452
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9qWuj0GgOv3/05r0pYuZlm1jUF9K8rfTVr2Hj9dZ7E=; b=izL0nl/QIlQv54Xc
	+DFlOylTIsGvMJ1WbAg+5hd+5PNlorgQ2Gk60csx8mrQ+Tm/82ZP3+SBnP3/6zLh
	wS6a32ui70nko/niWeHasBnspjT+8NTqMUD9hUhulIfQkV+VQVOCoHuJpnle5LhQ
	WMANlczv/HMNWDCvu4MIH5QxnVjXPRkj6jjyUwzU3jfDbCRpDD4rQmNT/82+YAss
	Oc4xMD61+y7RVpXAyYzCprTuV7ujqOdZ1rHEq4YBv2M7EYNszdPUQiuYTQagmDMD
	sdGiGwl1c8Zn+OLI7pnktHWGkMLO0a56oNPBQWbEsaLy8F8iRwKGqGkA6UIpDIQp
	veXoPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd0r4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:35:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fcso551378185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 01:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795426528; x=1796031328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9qWuj0GgOv3/05r0pYuZlm1jUF9K8rfTVr2Hj9dZ7E=;
        b=WstZYl95qQuTMYT4xqxL07zs5y9PkXy+d8kfp4WkPqwb2KMuf/Xwhy+Sx7ANedE6qf
         xqCi7txtnRXM3sxK8g1KsHIjnpIvgmtXuPeCeql4+zaSJDh38CsUFgi4mUV/IDSiUfgj
         gssR4Y4TqjULauHUrfL5Q+11NGTZObdznTKz9q+huQKxiNWws6ORHyHZAhSlx5wZ/KOJ
         dtwPklSO1MLUCGWIpl31tjabn/yRIWKpKp8WZ27937rgY+hEC7WySlscsn7Ji75cXXSy
         vzp71MfDuiFaWH0R7OJgvKM2Zq7fgZtvL40+hSju+jT89lreuScecczHn0nzQWprq/Rh
         ws8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426528; x=1796031328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9qWuj0GgOv3/05r0pYuZlm1jUF9K8rfTVr2Hj9dZ7E=;
        b=ZTkae3jCDZ6SXRBqQrUMHYzesVY4FAxzPMSwEL3nKb0moooQ1Uo1d58tYoFdBySc0a
         HkefXTNVpqzVai3oSYil1MXAYyouE4DltJEUMl75oSUK5rM5cMG3BIicoSdobSPC60jq
         iGxvL2mMIvtYj1sJ1Ithi5cNAzKB68cv72k54vf6KNv4BvpYGL9TiWxGCSHg74HzmjLF
         yVUTcu+My1bNV9GYe0W5v6e7zqGtretUq8fL0IPN4JQbSs05gZvuGz84FVX2f+PGIJOq
         +FC2k0GQ3W/UOfEXys7fpxiRvLPA1esCPzet85f45Awf6Tz3AAxN/ya7Tf9WGVEz0zkM
         A3fw==
X-Forwarded-Encrypted: i=1; AL+hErF1dU6YQBgLb0AD+/IrYJpgENjxjGeez5GQqXKzFaUfUfAy2nPmHThx/EtZfDqgqpA1z1DdSblHfv/Kwqyx@vger.kernel.org
X-Gm-Message-State: APuU4Z/EvFkUh3KaPpCiPGJHJsmgiLopy4k2Fs4DnMDzqLKva6PLeATO
	3LiqAdRZGrYczw0yKIKGuRlwwyF5GMLpQF4gCxNbKUBIJS4XG9PH3NTYoe174kOPnsCbCWVcc/C
	+utRhZ7d6or7xF1gnRNwe72baoUg1534/UjquCaT9OI57dcEgEmpedMaWYf21xX/G0v9U
X-Gm-Gg: AZFdTZeug6EbXsg+MGnX2Jb++8wQ0NhTy2moTNH6gjlzcEGAriO0vZf74ziEnMyUs3c
	kadpAuBjnvN8dYUgVNPA9HITa99NOfFwj0R3WGLFSn4jpVBUTJNe24A7Id6+dL2kI+JCOyf499x
	hrMXkTVhPyiPwutr57GACvl5Cr5Zcl8CD8rNvJd4DcNVKItgcbKi5nhLZnNgCD4iVmz0RL0Q2SI
	nlO4DtsQKbZ8cxmSL7FluqhL2Yd5X6kwmPuiwFqhOaQY7d6Dj682pOl/U1fZphOKYSv3Xaw12X0
	qMUKuvDh6zNCdBf0GXJwlnuAKwrkLMpq8l4uhlzfcKbe09P9i0LqaRKIAs2XySh3ICVKaPlXUnO
	t1sUhdWOrHP5tgqEbSl2Wjwi/O8dcpvAlFN1cH4Lre9GK81RevCOpMr6ULA==
X-Received: by 2002:a05:620a:4550:b0:949:3ec9:9d6 with SMTP id af79cd13be357-949ba9b49bdmr1951131785a.43.1795426527754;
        Mon, 23 Nov 2026 01:35:27 -0800 (PST)
X-Received: by 2002:a05:620a:4550:b0:949:3ec9:9d6 with SMTP id af79cd13be357-949ba9b49bdmr1951127085a.43.1795426527052;
        Mon, 23 Nov 2026 01:35:27 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm123208315e9.4.2026.11.23.01.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:35:26 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:35:16 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Sort the TLMM states by pin number
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
Message-Id: <20261123-t14s-gen7-ec-v2-3-3420a6202366@oss.qualcomm.com>
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
In-Reply-To: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3684;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=chKiFNfMMN0QJUFWEaH7T85onaId1WtAdMzTcSpQWfk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBAjVD+XmZSTKBnp6pRMWAkQlg49In8b2edwiX
 V1tqEVo1sSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawQI1QAKCRAbX0TJAJUV
 VpYCD/91xp0eN0YcPVJ/qLBx1G7p/SpSrZf2WvV2sg0HQXO1LHYMGduJDEi61kcXy/KFQIocOyh
 f3H1h8qjJlQgHSOar69Ab9s/rIgvqE4M3UKKUQ6sZfKFqVc2tCPiqZ86Dav+t84U9PVTEvdsKPi
 BISACyx551UXs91cV2LdkFIBnjTwCkgRfT7dXIgnWSzG6ZAEyC8EbPA9GBqo7ms5N9zWKBX3oZy
 NSG++Kdo5LNHQ+VwBaEca2IDGJMmiil0fHqFPV1tZzTffk+D3q6w9Dt/GgGNN0p0guwfTuZnEae
 pGS4p1oy0ZB80v6wTgBuDRVq4wI+viN0lUeIPY5+gkP0ZkM8dDitolzRACi0+xryNZ6Q5krincn
 p1Ew5jMjCIs2UyZQbzCAeMNcOPAtbhyk2PtIa2LbaJ1Ww6/iMpRVeHNzRBFHDwjB3nygEcNvqyU
 H2JOziikEjLh3VKK0tEGhLcgrnEFFavyfpGIbFMYlr9gL9ebJmjfdU3DQlYQKsFLDBClwzRZKM5
 aSNTLWxUwqpdZdPm/ni8ONcBPCO20BGmzJBATvxGnFA0n4bP++73v456loWmThlbib7kEb6DKl6
 9LmHqDGxV/IXmDsP1BnQfsGeFqm/yoMB+y4QrSQOccCx5Li7lRoLgG7Ka2rgsE0dx4+3ebmoUOt
 VUVfRiwCHFe10IQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: VgI5DYXW7O_QyYqWSC0cthOJUuE4BdH9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfX/zIZL8IPkyk5
 wUhGoThkebzN1JCFr1fHRh3cWq9cDuhf8BabizRZSevBJiB7FaBMJd5wd9jacJDZYTn6OazkzC/
 R0H52NXbzDGA7klaOh+2sfguWDzV8VjiURygoLydJ8B+R0MgL8QG6x7RpoA3Ld4Ap9IRXeU3BVy
 iRYe6P8rWzDha4ILkzjj8zpOILqDK8LrUCCcv0GygqKw3OW/T7/rChuZVqAE18SrhJVOyI7YMAT
 HOcXWt4/3VEVFQnUErYZF0UGb8+XT3Ill8Uvl1Q1NCVBDUxBWHY196IaeFfly6FdtIM1JcnrfxK
 dvyHhEyfMBOADUWw2XT2MyVzjA8uf2XKxNOr9VBku2nhOhLLOnxncBgcXVWyJ9EYP8kr9R+BLxm
 jGsV4Ar3H2i0ko/yNTb1tGTo1thDsv/b8m+HWJ+qyc0dTC2M1P7xqSNXFxa6WujO3d6US4EGBQb
 MgIZtI0m/PXwmjdHElg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfX3pTwRNAc370J
 Zf5meDbDMcRLXbTElwRZuHOjMYDWpk4IyWvhXPxoycdti27UvrXlEZLq5y2bCyogKnH5ScdOZTz
 a6b4vuO22Z6jTvo3WivIZkinK2KGbJo=
X-Proofpoint-GUID: VgI5DYXW7O_QyYqWSC0cthOJUuE4BdH9
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b0408e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3GbjgAZf74ck63gajBsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230037

The TLMM pin states of the T14s Gen 7 are ordered by node name, while
Qualcomm board files order them by the GPIO they configure. Sort them
by pin number so that new states have an obvious place to go.

No functional change.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 102 ++++++++++-----------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..9bda86f82a99 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -987,6 +987,12 @@ &tlmm {
 			       <44 4>,  /* TPM */
 			       <139 1>; /* TZ trigger */
 
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";
 		function = "gpio";
@@ -1001,6 +1007,12 @@ edp_bl_reg_en: edp-bl-reg-en-state {
 		bias-disable;
 	};
 
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
@@ -1008,24 +1020,32 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	edp0_hpd_default: edp0-hpd-default-state {
 		pins = "gpio119";
 		function = "edp0_hot";
 		bias-disable;
 	};
 
-	hall_int_n_default: hall-int-n-state {
-		pins = "gpio92";
-		function = "gpio";
-		bias-disable;
-	};
-
-	kybd_default: kybd-default-state {
-		pins = "gpio67";
-		function = "gpio";
-		bias-disable;
-	};
-
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";
@@ -1049,29 +1069,6 @@ wake-n-pins {
 		};
 	};
 
-	pcie5_default: pcie5-default-state {
-		clkreq-n-pins {
-			pins = "gpio153";
-			function = "pcie5_clk_req_n";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio152";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio154";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
 	pcie6_default: pcie6-default-state {
 		clkreq-n-pins {
 			pins = "gpio150";
@@ -1095,24 +1092,27 @@ wake-n-pins {
 		};
 	};
 
-	tpad_default: tpad-default-state {
-		pins = "gpio3";
-		function = "gpio";
-		bias-disable;
-	};
+	pcie5_default: pcie5-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie5_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
 
-	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
-		pins = "gpio116", "gpio117";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
 
-	wcn_sw_en: wcn-sw-en-state {
-		pins = "gpio94";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
 	};
 
 	wwan_reg_en: wwan-reg-en-state {

-- 
2.54.0

