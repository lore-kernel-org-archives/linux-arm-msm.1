Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103863;
	b=pxn5edXafnkRy7DEvX2JFPId8F/0p49hjWGW/4uuAF78PeDSeEBF5GBoeDMzZVIJ27XA
	 H1oAqmqEyRHzOBp+yIXNJfSA4beNe6H/rqao/SggXUUxnAKAleg6nD2rI0mWQ8Ph+IToF
	 /IuQWXf8rLy76M2dcOjP+Ur+XC57aOGSfjKinac/Ee1+5+s5QfK9HdPufwa+79uW6wFt1
	 JB6K38S6znPDmj2oFAAuiUgZ5GXrixsce36ZlNWaj6Qy+tm+u9P5+z6IcmWykVzTA+u68
	 7cV9/1rwIsW4GBVwvU7N+soYp2yIN2ICsUhjrzWSqRYQBBFwxz4Uai5wuKRRfUmPT7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5kyCU5vI0oFKj+uVJ2jgfn5MVpP1no6WgwcQf5t6lQQ=;
	b=qrRHzReUC90TOKlIw+Y8I6N8B5cZZhMSn8IKNChXP8Dv19QZBxBsgVwilmGtmZm+ojZs
	 5MspL/IYk1QfF7HXKgpnarf0fgGtnXPMmEL0gykortJQp3GrIyaHPOsXzs81YY7a7YOnD
	 hGZ9JYOMrgp0lS+1k7ScD0HQaBOxyz/4gnahM5/RGXolhWkhcjGmD3/Cp1TiDt4S5RtO8
	 KZfccoMEYguzNCUqwqgKFcXfxji5GalAU+CWHhsREvLYcjf6RZc3vcctO/sGvHVpp1ew0
	 oLdIoMMZid+3pMMZ+g1Y1NCAT7FHqvjxk9sAcBT4/0gEju287hMTZ0e5o3Odc0DO/ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=icyvtZJs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K28xqHHF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB32606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB32606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=icyvtZJs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K28xqHHF
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCKV3026392
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5kyCU5vI0oFKj+uVJ2jgfn5MVpP1no6Wgwc
	Qf5t6lQQ=; b=icyvtZJsXjhz4DrqgWgbg18tiZ4ZjKbjJehTK127sa7yDnBhw8T
	TT2vUD+9D4R+KUfZ1buGBYySWnFAK6M5XRTXDMDbBc8Ut1Wx/OhJtWnNF1EU+ko3
	EP2az9xPWSHC3jok5bgSMy8wUsGBAXZHQBcpC8N3Z2j0TPfJl/RGEulayOhJHbeT
	+aYHFJ1vKWwQ4gyaWMqTNXOBcHtrBEG2ONpEYe8KJPHgOref4mkxl/mLjkToiuCj
	JGu/cjxDG6yzJXTYF4AGsOO1TrviSW68sZzwzqL8D8G3zcjBhLEV8lPipsKIPIK+
	J+lUQR42D3qZp+7z5OA/I7W/LLhp65eoASA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91adt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:24:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so5914135eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103861; x=1793708661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5kyCU5vI0oFKj+uVJ2jgfn5MVpP1no6WgwcQf5t6lQQ=;
        b=K28xqHHFRg7JuUVFsoYOm50N3s8Yo3B0Kau0JTJukErl3LxGirWHqHaPFlLpY+Edlx
         iESYyKO8ZHamHnGiU8p2GyimNy6DdmYRd1H3xTguMtmxrz0xzSC4ex/H27r2nOgukGRE
         RpXx31UXHdcmG2pctXXuMldiekGKKK8omH2nSruNbG5yfcmayQpFwoYOwazEyPco2XvS
         AU6A+Atus3zYoYwq4ZGQ7oZHsaux1v/OGgPsY8K4G4T1qSr0X0NCVVLJT6bgRFVeZino
         1CXcSK5bAW88wUw+P5NVmc8TWGJY+CudMXrwkIlvWFTLEtbwolaJogTryJkifzR0W7HW
         ev9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103861; x=1793708661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kyCU5vI0oFKj+uVJ2jgfn5MVpP1no6WgwcQf5t6lQQ=;
        b=KcD/6dZuSVnFwA0esxf2BDoAgMCyF3eygsxSCv9fGI3yQUA4WWJZEdVYqS6CXB2twu
         L6ZPZ7sB3GGm8Dv6tb5uZJgHkuZzvtUWsRP68LQPqaAgZATXMCLFt0lcTVQDJEv+5aRr
         PxOex6xL1Y30lIMsp09MG59niQrgIlJs4E3bbJ1FAidOMVYeieQY5yQdOxbdv4TFMHxZ
         bGLCIK9JRzJmDMVHFyfpebmCenXciTurBPnSCKMuDUF81iL5mxs1+shKwk40DFweYsHH
         M4kQaVu30yQEyX/fTbdTZ2jBS3quMv7DLtXhpJsERwCQvrMtDciPSc67xboO23dKMbXG
         /NoA==
X-Gm-Message-State: AFq9FYIV6LkhNnhtx84+/4MLFPIhdDPckKTHCBYptmJQ+ZNntCXWNCvW
	aszeTkO/syIbrxn++yTjTCTOwS7RLlRKktoTmi2gpe+Z8PRCxxExZKT+X88KswYsZhzStb/eqFT
	XQbPIN5qnCDPOFoecdcKsxweWbjjJIq5YzGgI9fTELD3qeDFIfc3GYESLKTA5uTdEHPdJ
X-Gm-Gg: AYBFou1MBgTxEbsu1XbGSImWI9N7ged9pKYv7mxnQWlBEOClp7T03Ak9tG5ww484+yB
	vjBTLrqfOwtCn/SXEgh3hhuIMgrpwkouThuw3DU0m8v7raLeQrY0pm8pk40oEceu8PxxvJBdaPy
	Y8tUvFkT7+gpwH0Xj7/qAkInPPKwN2SA/DMwtkNLMrXH3YmAqq01UHiyJY7bgTUimxxdKu8wUOl
	RfRHF9mtKBA7tcOe83tgzPSGkS9biKjiitelfMbxTmPD2SpGjX1PXtzBW0+T8MPWuOeb9GObENZ
	Y/ovg6M4yeLHcmHOC9SAnI8G6DPFIVwwWuMLAbG+LAlR1/MyxSGGBB1C87vxg9pxcw1m+fg+30l
	B7dJgaL/9Y/ei5MNEllG8CYs5yxBn48WzPMBiWFryhlv+BkxZ
X-Received: by 2002:a05:7300:fc0f:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-369e845b068mr15222628eec.7.1793103860871;
        Tue, 27 Oct 2026 05:24:20 -0700 (PDT)
X-Received: by 2002:a05:7300:fc0f:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-369e845b068mr15222589eec.7.1793103860223;
        Tue, 27 Oct 2026 05:24:20 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.66.138])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm32822215eec.18.2026.10.27.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:24:19 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@oss.qualcomm.com,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: glymur: Move the PCIe graph nodes to the board DTs
Date: Tue, 27 Oct 2026 13:24:09 +0100
Message-ID: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: gIISnB3c-AfyvfxuVH6sHqfqNrDt4UBL
X-Proofpoint-GUID: gIISnB3c-AfyvfxuVH6sHqfqNrDt4UBL
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae097f5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=+eK/VBehCgFHFEY5YUZdYA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=u5-EM3aH4ChXULmVINIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX5g1R7g+ZH8qn
 NawvsfNGqiw01BzwXlxlsrxETRzMB4aTLZNjIK5RBpbfbwnFFe/Sb5vejzMa0924Gk9aECbfBN3
 WQOhSmIYgdO4T+UxttHRAEk7vxifcsvF5UCQbHFz68gccB027FmNwhvazyxCz/6ZpQDAdEvvnDo
 IyU2FuI+ZJmVoBkgwKGhM3rGQs4lmJ8AQIiN/ivp5VQye8feOx14dk4fQJZnIShniIEVOrTwbgx
 CPw6EHVWkwLZbOe4DH87oToep2mVKVvwEajXxHk7SDE7xZUdDiSYRZOTdFuUHf5xp2b6US+5iQO
 CZpZ6WGHCyEQBxjhfIj1oCDy+UnNB6ZPhAoiIkhimpLAWsNyvv3CvZPVHAP8k6wGhP7mx5zyCzK
 f2XkAatHRYtx0G1T3GudU43AlHToYtfW7r2vkz1/GuZrnaDMyKe9IA16p/0J1n103yyo9hUzrFo
 u+6hIuEhF4HQy1gC7OQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX2EWMygiCabSl
 3atrPyhy8dSTHrz28HyEKNQgmrOOS3kaV1cQVgz0bB/buyuphZ/HrNIka4Jv8fJ41kQHC3OPdMl
 7CWPJBhJcsxYM2oXI7/pu8Ugr7569oo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270049

glymur.dtsi describes an empty port/endpoint pair under each of the four
PCIe Root Ports. Only the Zenbook A16 connects one of them, to the M.2
Key E wifi connector on pcie4. The remaining three are dead nodes that
no board ever wires up.

These dead nodes add more churn compared to the duplicate nodes added in
the board DTs (when other glymur boards gain connector support), especially
when they get added to other transport nodes such as UART, I2C etc...

So drop the nodes from the SoC dtsi and only describe them in Zenbook A16
DT.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts |  8 +++++---
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 20 -------------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 939e1a927a79..aba1821c9375 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -825,10 +825,12 @@ &pcie4_phy {
 &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-};
 
-&pcie4_port0_ep {
-	remote-endpoint = <&m2_e_pcie_ep>;
+	port {
+		pcie4_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcie5 {
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..e25d4cd3885c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3000,11 +3000,6 @@ pcie4_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie4_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
@@ -3272,11 +3267,6 @@ pcie5_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie5_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
@@ -3488,11 +3478,6 @@ pcie6_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie6_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
@@ -3758,11 +3743,6 @@ pcie3b_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie3b_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
-- 
2.43.0

