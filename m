Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467374;
	b=Qz8WJSPrJYSsIgdarkl+o/ySsjC89Zlocab08QvCHQVKUqwYzpRHrI4G3kd7drOp1cTj
	 AJPN1AUwSL/Z8G4W1o4YScCO5EUG8Ow2iZc/tQhUhoWRcpuFafIOYuyZeGWkHeRz4w7xj
	 T8FgjQ/G+fmhDMm5hiwqAQBqChvsy8PZZhkx0d3N4Xiw2mltP2Ku9qeseY2dxz+HUO6dq
	 QmlP9rziTbXARw9gDpq661IyDO1QGJISzrBtSomJ4w75/uscmY3FZX9+qESKCo579RRSc
	 a1ZiQP45KWsRfnYIDJHE+4fsplaCo32AdjXDD7oJBjrq/IU9nK0sC5DoG2PNMz5fkqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
	b=OjU9jS/h4Qx6CBlFc4TZnoT7/AI1buA3Sqo6+FfOIFVg9bn1AZs0eMNs/k7RXIp40yFP
	 vwZVCs4q1ilYaVaNCt6XYCu/tr+yZmQRVQFpD18YmszTiOvUT+ZmmTjL3zMrDS9Yh0ju0
	 a/9FRICPBF6JIJukauMlk8BwZ3+WgjVLYGlruEdugp6xmQ/hOTosEtkBzLQUMEPrhmUbX
	 d3bR52f+wkZKlTQusxRDroOb+B/Gp1xHZWsD40YN7uzdbGBw2FzyCsCf1bB07RYbWN0mG
	 gUKteA2hCEoS1ryxC6yOr+VGQcOyHxAcg5prCAtSXdWC+iiJdW1urKfMSbObQ7UXTQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGlpvE31;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKYlQclY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978D5606A332
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 978D5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGlpvE31;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKYlQclY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuXd41332761
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=; b=YGlpvE3185+zcNRC
	Ke6y79Wm6NsMW7wrJaITFCutoGy0RJTFyhQrSd3f/2P5YJLxm4aWKl5/u+q+Qx+v
	pUHFraYXZFCvEenCOgBvUsiH+fGFlBg9Xl2YzVhGOHr7DuHoOfYuTSt4/KlL3qzC
	1vmlAHOdP4TSU4zPU2SyUILNxISbbbYrHOQ2wla1ehB4I+X96fAc1lJPE20vcSbS
	kYU7r+y69Cuxtt70ZuNo25rIm7jnVjK9VwMDQq88ic5epIueLXk3Ak8CrSZdczwV
	l0fHUmOJC9Fh0iBgQ2deWU1IuMKOgJnjoFJ3L18DiryGGcMrnpPYrWQiDynPS4H9
	1BmFeQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g743ewa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:56:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a65fca25so2356012eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467370; x=1796072170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
        b=JKYlQclYuzvlvYssp9dqZgpBlRc23gqEK/pkCbb/vCXIKAW/2boZ4q5ZwK+64/ND5z
         hbv1PH3UGz9/BuvwBM8Z/BrQzL/BLDutgdgukmmWfbn/m06BFsrLXTu0ePDEShpUx5MH
         acPPgUiE/7MT8wr3/QTv+SnJgIGA8PE6m6joLKorRoUinpdUji5RhF4SbxnF63Hecvf9
         ooPzhOE5aiks7cC4EcZLGdcVbxqC7K9M5udOGoW/0S9Zo2+ObEhMVzIWRsr4damQMmn7
         zlZXQLXWLXlsvmvkZPooD+l+zmT7j4kq88WwI2fbyBg8n9azZ/qnla+R20NN1wqS+h2U
         fJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467370; x=1796072170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
        b=CrU+OmvCdcOXn3drgMAYTCid0lQo20ZNEYFmNuybAh6vKUBDWx7fGEIzcV2ifAWdn1
         tgQSTZRgfGNhLGvSdDHBXTgYqTqkTkwOO56WO4FXcTSdNA4yyZVov3yqLNeynC5w1qfE
         Bt8L5vABcizuVnWGy63S0ViBcC4c5ZM12p28bKXaD9deH6YCvHsOzFtQfe2N5qtqlHTO
         MikwjKIMTL1kPhv9IWBNNcq6LW3P1RF/J9CMqPzqKgpZqLbpksO5ZR3w10chhldEZQ3m
         DQt/TbeTsgL9Kw5QRjkt6ntZmhKlsxU0huVePPmDjnXuGa/RQb6yIkJ0Q63C2ZsByGFx
         m2ww==
X-Forwarded-Encrypted: i=1; AL+hErGMrj77WOOt/cH3bHe2UgVHiruct14UljE0SojeiIj+gDLGXRv4KUiwhcobI3wt7lnfGPWh8QSSYlLmWhPy@vger.kernel.org
X-Gm-Message-State: APuU4Z+m/L7AIADvFKkRVZoLHojqUJANuTs2XVgEbP15qsGUSu5g4QOH
	SO/Cz8unkdx0JngPbRaZi2MkuVIrdHhzju8WOEmtqjYsC+M97Hkd0NKMJb0xw2f6Jge4i0F7Tvp
	RQ4eQaxFqCkkQdqly005mKk4kHXISDWkBRD/hvCBjnL1Ce+Cwq+YWYHgFk9o9BjKygcUv
X-Gm-Gg: AZFdTZfLcqEzefLi4wbBV8EKwMyL/KP6a1svVBztgCjjZPuD2qkPSByBE7tIlcC01iQ
	bzAcprG2QtsIQNxhqxFKD8EDD+Kmd60v3OPukkLDrR4XoKeXBrT4qyF7eEiIatTV9frTyIm/fUo
	J5AycCnupqzdWL4q/45rcsZtDvTckUTEBeUcWiehxdz9XvOWW5R3DxCrQ3T1RXXKqQMgwUznniA
	zVmU7xNF2JBuNjEhjewMbCVdJDQVprJzCUZdT14tF+wiH+Bz2LNRfY0hEolR+7lgQtzBxT97+Jc
	FEF9feyUCGcrNwfRujpx0pi8d8I1qwl+luYY3+2bp4dADFDIlwuAMPCN9+72l1v5Kt6ysMmPH/P
	kz1yjPE1KNhAH8OTcq9pXG2excV6fnulHFMFEqvhBt2GfYJjVo/Gy9sn3br5foeIgQm/yukPprD
	oRH1UB4eKL
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr19946903eec.2.1795467370525;
        Mon, 23 Nov 2026 12:56:10 -0800 (PST)
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr19946867eec.2.1795467369912;
        Mon, 23 Nov 2026 12:56:09 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:09 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:50 +0530
Subject: [PATCH v5 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-10-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1326;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vQA8tXnjMgCPq3216Osyn7C4Zn7d/iM3eHvItTtMIyQ=;
 b=7o1OGucmXYOKDo2bVa0gCDnP/K9W9ENk6/wgM8rCg5bs4t98Mb2pKpchVkjKTEeowv0fgDD6U
 tX3jHhP85+KAH932WIpkebZ5iOE3RIZeitr08mZfWSp0Qe5nSe0i/vd
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: c7lMgbJ4vJSbkAi0LB1FTKy4FSUXgoOC
X-Proofpoint-ORIG-GUID: c7lMgbJ4vJSbkAi0LB1FTKy4FSUXgoOC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX028QXjsuXPIq
 w2XmDBIoCgFPZT+WpPMiwV4UI0qPtxcdV3gFQIGf41m4YhJvv9XpA4Q56qvt/qsd7EDVvRVRG1d
 PDzvkTcy+p8TZDQghZC/aGZRlaoVxH8=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04a86b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/8WxYqdxEjLI
 JuouN3hN9AnRtzG/U8BwaUy4+USvAXT7pAyB/pUJDt3NOf5VOWSX7BFskDUCwsfFK917OKw/xIf
 WAwdN7u4tSdiKTzJxiGqOy6a+Jy3x9z7odaHB5XGYzNUyJEULvwejo58jHdhWFCrSrDTKhDrVNb
 D7vcXcfQ2Dh+jLRk8PO3PZg93vjIXzxq2RhBiceWnWjcwBrO/ZfhSkak7jgQsI3zo+dh6pxqG0k
 jID313N9aGsKS3x2cCn3Ulb/9pq9HZCcV1g6PSu/omcJr2L9vyxwsVYvgvoRzrvxFzq3EunuupA
 Yja7xAfDmlACrAuR1VPmOL72BsJ0PVZDvDKOMAGuqVl1GQ+hnSSacV6mwbVBw8l/rVnJcAC6nMC
 lreKIU3yK8nqEiTbTDckAId8prrJS865UZDWa3CkUOQd8ITYHZi8MXY0vFyK6U8kpj/JeDgRLhh
 VN0VAApXYeod/1aCiBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..9f6bef6087cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,17 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

