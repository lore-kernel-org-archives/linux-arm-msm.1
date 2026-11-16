Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830796;
	b=0bXa4aiNpLavt97f7efzQAgVDCS4sbmNu6w5hZIKd/FFzXusHuLh/ihtzStCLdlqkdDI
	 SF6NKCWfPNZslOggbSzRzdf5mSZeuzU596Czzo7iMF+2KY/DLCCe6HEq7L0GjzWgtGNqQ
	 OPtGeBJ3BSvZHR4H6gFKXbXvRzHpZmrrqeMyGULPs7un5jjs+Bq8xXalaptxO3CZR+hUq
	 q5iYm1HDZ8VNrEOkFiVnbwxuqvSZRAxE2D+iQt7+Eb7KX3zE9RzlMCkuiTebF3utXfj9o
	 MMwXdmzkCvGcykomiEWSGQ/gB1nuv44pOzbcp/fL1LoaVJTrYqz00Wt599YETt2F2mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
	b=ZNPpeasYQqOBSAV9kLTAnIqo3THqQFjnRDPbj65o3sC8K1kvBfRS40vhAJfJ6TitloV/
	 +vZi4pQLJaudCfxAG7mqeXYxu5KGKgkJeCoiDjnIiIg/i2DBRLlgsAYb/m/eo0jcw5S0s
	 lg0FFd9C33aa/ZMO0/vF+arpyzzZGifPz/Exv6QwxUdu68gvRpV450On0kUlPRDCVf0pm
	 y1xMJyYeNmiHWVuca/vHacFm1wsZxan/KlTMQXz131IHWgxVfS35hSIKBk96vHSMOaH3S
	 oDK4Jhm+vbhTdiPhg1qt3thoLZKWORgPt4STEgzlCMOw+VzFah4g1RhByzjkaMjAfsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrD260gc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IwSQvyG2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB460606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB460606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrD260gc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IwSQvyG2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1NPN1004680
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zW2/gkGq4nm
	G+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=; b=ZrD260gctRypcdquqIhXZNM5DUL
	SVu/Z+em3Ag//0e+nCXBEM7kBImeDezWUi4mmC7MGNSl8ro2AEDBdOU1TsEUDcXS
	uiAqVmPVL+ih6YqThJgp51YtjtKzg18NP/Mw2X28V1Y2JQspLGK4SsDjeUIiSbxK
	pxk07cqCCMP53ZwA3/mropsnjcN2wZkL0mvZiT4Qg0actwgFszSSXMTDIThMpn4h
	cuNNkShpXDMzWdUS5Gt3vB6xT3egwDjwVWkzqDyhFRNwxQwcoQQu65BiGkAvOiXI
	d/heAaFuXbsJRhpwZIl6BARNPSJZ3HXDG32SIzL7zVxfyMUJHcwpxDyf5qQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0bxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:06:35 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so4070895c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 04:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794830795; x=1795435595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=IwSQvyG2hq79wTr4WXg5jrJmcPxtW1yyAyEiY18p2dpGv3Wkt3KZUwVdnxbbQ5uEN/
         SFH7c/5TJGOMfOgBC89qM15442QrCZuq9C1ljdHRs0xJoWbsjl2ZzE3am8vNd9hc4jVG
         2XAsgGurZM+KDfhIEGJB2C1hcDvic9LPz+NDl2X1GWPRu2EdhnPLNG3NuTKv4XE7MS/Z
         +f1ZJArUDVxFINv3o608h12bvU8/thVhXGWKBVnGjxV9bI44BjZL+Rjk4P+/HLSlNyib
         eTOYUaohSHu11mjDoUwYtIGvJkvWVuQpfER1dK8AiE3+ta2FxvexTu3EpTonzy4Cxzn7
         VMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830795; x=1795435595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=TVEYmp3ePsxcw45+OiHVm3CWNDNuQwEGrTF8jshYr/Tv2gAMLHR9X1XE3zcLa4xke/
         cYeodPXfuBbie/jOOFyGxfkrH/CjZpY49YnLKI1BIrSVtI/+/1JvnB75LbYKKe9nqGkB
         5aXHlNpZjfaQ33tUP+4OaeQnKrfYEmFmeSu3HaI2zben97WHk88F0c4ZK+YHJWmvFtlW
         GWgqQWSwR5kMjR6hvwWoK7H9SNkOurBiYROu1mqM1FcXDXOamejP1KEe2Yn0O4P+zzUa
         l1lmLUWI2QT+xmkaIsSMfiWOZb+Ju8MJ7JwgCjDmIuKxHJGC83la1MYjiyZrDFo+9R33
         gHEw==
X-Forwarded-Encrypted: i=1; AL+hErG+09o+f7BM0IrFTOwYKQ+8pGM7wzIMipgA+URkimDAjKTZbY0WJDndZQ33VhMBetmSZYhg81u53n9DOjEE@vger.kernel.org
X-Gm-Message-State: APuU4Z+U/BM8c0GouE58eT2WOjxX6ZmjoKiEB79dMQLVYzPdOftU7gjf
	uzbr0epUSEhck639vWVgTRZYnA/2xGyZnXggAm7yQdjmcIJh3cq1HG+ZAH0Dr3Zasr8gx/DJgDp
	mc35djUjNNJuRTdOTOfBTAWCbYwWdhSKmXvbtpiqg4KXENC7DDoBva5dP6IPoO0X3478v
X-Gm-Gg: AYBFou0idsNwufk8eWETaMkqGMYc6eRHrpfYJrp5A0NjoCUPsa4cT4/NbvIhvB6DOkn
	eLYV2WNS3+99qkYY9WQ/RpgaiZ71RVHP6+QmHsBBgBKa5URCrBUYVB2crALbGLyz7Q90nKgRhOd
	a+wbtZGCfagbQU8ssmMVemobIptPuluKPqFhZsINtx4ewRRG7jFx72grrwVRefllrsgaf/R/C2I
	DPNMUE5h98IW8+9kG2qVbWWtI5fdv7Ec4Jlrhg+UN1S2QOm6N//FwhcyKXh3efxrhprv9p2srSa
	XnksGciF1Z4hlKJWh99Xw636r1VoSmavLr7+nUY6WulHSgkneujJRkeN7RmRtqZfvGi9p/TavbF
	k+84noANsL8DZE3OzIYxq6uTUIjqsUBM1uW7htJAkN+CuVb9AmZf30Ig6eksTsaRG6oLhTyRtcn
	S28w==
X-Received: by 2002:a05:7022:b045:20b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b50319306fmr10877408c88.45.1794830794302;
        Mon, 16 Nov 2026 04:06:34 -0800 (PST)
X-Received: by 2002:a05:7022:b045:20b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b50319306fmr10877375c88.45.1794830793583;
        Mon, 16 Nov 2026 04:06:33 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm36961530c88.5.2026.11.16.04.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:06:33 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Mon, 16 Nov 2026 17:36:22 +0530
Message-ID: <20261116120623.1726089-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
References: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX/dP5hEj3K//Z
 MXWQV933R1bXhB42OffK762HUmFS1IjmVCO42PP/JMxV4a6vYAWQX/SDuESvyurlckjbE3yvtO7
 sVbabfqmOUYe5orvhXinYZ1GeiOp6+C2P+O1mVJ1BdKpRQ7vPNo0jO8D7dXmm9uIXxhQjKoEi21
 uMqdGqpdAvvo0YEePf+542yb9UIx5EdNl3D3rNEXiSV106NO3A4ErjbYhmABN6v4onLAiIbWMvV
 Dya7a92ixo1Kuj6QlHhnPFNUhbHzzbt3grgQZ0WuLQYXGS13C7EwWC+ap4HmyirbFKsqSQnysRQ
 r/iahDyZoODj4Z1DFS7ZDi9MDveCJEAi4IsnQbWM91EOFDcRaefYmfyO8wS7KYbB0Vzymt5b7IJ
 A2xIgC8WZYCvF5q2WxbnU2D+wLQ6jI0GtK96vUsZjOUldde5CKuoaWb2geRV/5hr406BDTrYe9L
 BtbKt1yi0Yo0ODWh/oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX7F8ZtWsPeD9H
 MY/LHaZvk3qIkSa6vLIrwOAnoxX2dMYXGE8wFORmnduodSx3F9lP+pmz1W37sUx82acetjGvjAf
 wKjn6cmGFlGUVbaOXYyKDUKuPDTPBdM=
X-Proofpoint-GUID: zVSuEWdad8qnEGQZZqOZPcXTAn0D2Kp7
X-Proofpoint-ORIG-GUID: zVSuEWdad8qnEGQZZqOZPcXTAn0D2Kp7
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afaf1cb cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=OnC3CdEk30aKpSFVcR8A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160048

From: Akash Kumar <akakum@qti.qualcomm.com>

Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
the PHY. These placeholders let board files wire up a USB-C PD
controller's HS/SS endpoints directly via
&label { remote-endpoint = <...>; }; instead of redeclaring the
port/ports structure on the shared nodes.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
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

