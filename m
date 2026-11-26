Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695111;
	b=r4shShi3uJC4ONFKDaEjNlFJicRhxbvbuXLImLRhPmrs9i6oq5/9h9cCF/T75JixZ5zN
	 4GTEuf6QGy2XqESMQs45n2kVP2XdPN4xIxKVFKJ5gaij81+MEnkZfvIF09vtF++0/LKXS
	 C2uJTCHE9/zQyFzQXLRCgJz8dXBb8U+VlBl3uU++260uTMTgNFJy4gq1Cyvtn2p/k6+YS
	 spESRZhbgzAne08fbo1VEYZRHVzDiygAQYxWJpmD1uLydqa2rHP+Nk2VSjnjuoJtgq0ax
	 QXOkN0w17HcWruCPM2Do2/hWLhl4v+XYCITVKPWsKsLZ7KTuIwOaGj+XRZRWkaQYt/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6asvH5wJCavhVv+udt/vbg+eS+8NjvtN0+Jqo2Ecdns=;
	b=5l//cwfuy2uj7S/742OpvBlvnf33tmJhYSlRxJWSqcMAD1c962zpc+hJyKblX139O4Vd
	 596uKR8x9xhYusHiRpHJDv61b2wYQH17+izKdh4bYpWL4hQJ73PnOY8JVSMSAsWaIKsLU
	 6jH8DgWW6Y13dN/y1DUb5mTX2/447yOhwJeRTmQoOnUH5wlBm0dKsbJ5iJj7iWQq5eKCu
	 12YvIKoIrB0jlfYUgl3ETDloQCrA/4/FhEt0qLOSsXCfbxF4vo2FGE+32xOrbouEO45Xy
	 8p6QFWZaw/rfsEtrR3BqzQl8Q6JVPiAnpiFB+ZnStpCMKigJ+1aQGpdUS7MhfqvF3cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCTymJZQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5vwu14M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4E0606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCTymJZQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5vwu14M
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVReL1497053
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6asvH5wJCav
	hVv+udt/vbg+eS+8NjvtN0+Jqo2Ecdns=; b=UCTymJZQNu5+WfDfqajkoJdrGSl
	KyQZC55I4z2ORzP+2irQLb9BZ8zxfjhInVAfgizKEfGh9QUZIIUaWVj63f1+xvpD
	HNDiCVyrxpYa6Xwv3rWtFg1kIHvntSSfczjXZEyCLtxasukAd9akp7P2aEaHgXqD
	1ZvHAiXAI35Qv9YD8un0y8ixgZR8poqqcaoWlTK2JSyP4aw+brBRm9u0p6ElvPzB
	A7rIujdmbA19JKh4vQB9/WNSanG7RlTpA/aEaM6dz/Tl1DcOsDdM0YhxLNMP0dqM
	vlRv+BHjJ1uQWcLWodvieDGqd6JDEK66TuKOHdP4+4pAq2jOiei2SpzyTAA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y30d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:50 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b588e4bd7fso2076137c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 04:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695110; x=1796299910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6asvH5wJCavhVv+udt/vbg+eS+8NjvtN0+Jqo2Ecdns=;
        b=I5vwu14MiBNj93ksKL+LGPGFlnE7qB7U3LT9PmUt+9v5nzIXiz/bjj49qNbOKF9I2v
         aSUHvXiUBKHUw+G02ryjZ7mvJaynSksYhYbTX/uJsQhxUYQSobMNeKdaUhtqJIabBn9S
         gOZwsNIxBvj7o/zEKoIrUgPyxu0X59zKSmHblV7kEL8gbjtmv7iNnLuFC/ACFhCYXZiP
         jPX6DvBXpABHeNnUa8WBulm+w0Z9V9Kaz+23TlGQgvqawEuQQucHPgoz/SjG2AszIO6/
         shLrcNhcsGTwoxp8rnC069xDq4pez/oGCYceRSbtpE/a0VJGLkrIPYaP3cxsq+zDGpHH
         O9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695110; x=1796299910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6asvH5wJCavhVv+udt/vbg+eS+8NjvtN0+Jqo2Ecdns=;
        b=QKz1R5DV45kw+cPzyPRFpUU1DwPjUsz44yf0AQYDIInGYe79/MhCommdAoHOaRD+bK
         1q5sn+WhvdceZB8kzPP7/CL3Mo0W8r66ec8T1QKnVtBIPBEIlHELp4Sn5rPDPuge12vX
         ECUTbfv7+vdDB+XBGc9wQ7Y6IHCtFGGcIpLIU3K7t3yMjwikJJK45wH2P+VUl+uWnZvA
         d5mO4DKRuYVMrv83CXewSvitkuGj5gNJpoHQRgy7l1zeSZPy78pUXcdCpHR4CdZUJvO5
         NLVs/NL/5C6Ql30ehABWz57kAzm7+4Dl1fTHnj//mlkyq9E+4MB5XVvhZZJA/u4Jj0wd
         Xdvw==
X-Forwarded-Encrypted: i=1; AL+hErEFUWqq1EirYa6isnJND1S2991kAvdVxnVm9HeosBCgL8nvomJ3ZLxrirBK2R463lTFbALCx28zJue1rTT0@vger.kernel.org
X-Gm-Message-State: APuU4Z8m9Lw2j+XQMfczpX5QpeVCjl/2pA166ll7cVWow94bH8bYeEQc
	HwyLZnfMhR5BqP8FHjB+T/K7O/VE1x/DSSqiW8TIr+aIe452YH7H9WfQ0K3AVEYUF8IbIYc30bX
	08MqiVwMRJK6H535ScpQXlWx8v4foo/C6rkgKyw6ma5BBFvFqHqXwOAQ0mE9GLU/nzXjp
X-Gm-Gg: AZFdTZeeFedXSej/TzpE/VIP31Dy2mcWA3uD+cuPQPRvpfQREYsuCbx2aUq/4Y103fH
	JsP+bfAs7+BL6i+qNrpQVbEBEjZZvQXq3XXjIPfRuXSQhAgiDu41maqAjiyeqhJmBZrBCd8DICx
	g5lozaNY//gs6g2XBHmLJQ5EPAO4utVdRC2JcfurstqjUaDptnkLhgKIVBZ+ZxnCkdEZ7nH0r8y
	AMs9gl9B5eEeWC2q8uK6m75WChFdSp4Hjagpt78HTlc+S60OiPuL8fJqSuRTxwNCCwJLH18rq5n
	lZymug8VNBBWTHXFVB3uesO3kgPQcvCW5RZCi4+EmL/eaJ2okvhJxayUohR/RSpyh70r6XvC3l0
	IyWP3nLkX0s2QxugEruf40/Het15eiphRAUiPdppwqcRNS9m4zB2zxURPqnSOw9yZJkOWGf14eN
	FMsQ==
X-Received: by 2002:a05:7022:f516:b0:1b5:4aba:b087 with SMTP id a92af1059eb24-1b5567c0c01mr18076762c88.3.1795695109760;
        Thu, 26 Nov 2026 04:11:49 -0800 (PST)
X-Received: by 2002:a05:7022:f516:b0:1b5:4aba:b087 with SMTP id a92af1059eb24-1b5567c0c01mr18076744c88.3.1795695109225;
        Thu, 26 Nov 2026 04:11:49 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm58457549eec.13.2026.11.26.04.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:48 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Thu, 26 Nov 2026 17:41:39 +0530
Message-ID: <20261126121140.1716190-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126121140.1716190-1-akash.kumar@oss.qualcomm.com>
References: <20261126121140.1716190-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX8EP/cmUM7EDl
 n+LyuJ3kzgt9rbbUuRigu1iQrgzerybOSKrE2epMfAUTV1wsMDKvL3EQgUb8AztKxylG6h9hI3r
 qDISiugyrL8LmNjcyHrHbjUR0TTbh2TtEYQEYo7y26HgoGVYG9WEogl7Szsuw3QtbeHlUp30Ko/
 /TacIrbRZIdkrDbeKoifzOAZs85T8aze5yzIBKDonnw0yzbx38Y2A39cZpGp4ZAEWnbZhUPhfnS
 xAthMuR+YzAcvMf4EK0EPFaFqAK1aholGV8ZkooM629WbsjFYlQqffeLTkpj/cloASwMWTeoJS5
 QNl27iQ2O4X1STB4KAyqZOHEueEN4Yu9Z/F+DPctg2dtoJAKqUfqiyO3YAlVh7NeCMT+GDa6CuF
 BjHOm50kqerMcuKJbvF8f3CCiKccDnwiiLrmSd2MT8rs0lU6Tmpwk7rDp3v+DUrsHuBqLttJOMX
 iElQkG7nSj0F8hQxRnA==
X-Proofpoint-GUID: 8wy40krev51EeNkcMHB5rBTCKRs1aRCQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX6KxCgFAFu5gw
 x5sZWn4ZI35omEEgWbnb65G3i3wZFdS3oxiVphoGbv7yL257NGxUVqnCPU210TBn+xbm2ROZfhW
 3HA4LXbf3gC14KJVyh1HFxxTHh9xPLc=
X-Proofpoint-ORIG-GUID: 8wy40krev51EeNkcMHB5rBTCKRs1aRCQ
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b082206 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=DSWJuU78OHK9oOt2xpEA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
the PHY. These placeholders let board files wire up a USB-C PD
controller's HS/SS endpoints directly via
&label { remote-endpoint = <...>; }; instead of redeclaring the
port/ports structure on the shared nodes.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..04636fd88807 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5078,7 +5078,21 @@ usb_qmpphy: phy@88e6000 {
 
 			#phy-cells = <0>;
 
+			orientation-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_qmpphy_2: phy@88e8000 {
@@ -5163,7 +5177,21 @@ usb_1: usb@a600000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2: usb@a800000 {
@@ -5220,7 +5248,14 @@ usb_2: usb@a800000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		tsens0: thermal-sensor@c263000 {
-- 
2.43.0

