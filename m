Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BDC4E021D
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773354; cv=none; b=EjVGhTwPmdRnGdscjGBOHFzvGfRpxDZucyhBdYuEH4jOISoaAeONjwX/0xRk8Mx+PqG6UYhsxiNVLlHgUThvaCpLwTejTlmqJ3kSj6/gxPxhgtYjXMF3cyX7W9193I/vd6lCDF5B4tTYajooXkr0uVq5IRB/RfDkWyNhCRgyUyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773354; c=relaxed/simple;
	bh=ltqw38oqTiV8y+kaD3UGw5jHFMwJC/FR2UVSSBuZbcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5uiEcg7s2uYr5+yqRccSkTkwMyRmJLxfXl9sorLEa7IezUbvUh1lZz34PmtYK7XirXfwqMjq5FIktMRD9TM7/hpGE+hnI9N5JuuZlMIPnxB08SiLis2FaT6uSxLxRmQy73pQbmy0IHifocIwZcLSuqPtKqLezum8yWVSbgQXOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7gX3Tif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUtuFh42; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7gX3Tif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUtuFh42"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7O0P2019471
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QP9XFcOlvHmKC+vLTSIEGZ4UPszljszOy3XO95ROkP8=; b=C7gX3TifyRhlLQzh
	WhDjWNEUw8K3PPfefOvxvtQKZGMX36mOp5j/8iONVfVmx2DlPjRn10iiD2bRUGFj
	6mOTseFpw8z6sSHNKWThXj7vDT5cd9IBUnOdYFpA8q2e0W0Ff8QeKQaqOkl8vNjn
	HG8yh5gaxp8vCinp3NDYXFGnZe1+VhMWRW0RCQJuHyecgiPIQ+EYqU3V+/4SKPjv
	9bJZuFwqnVqvth6ry85YNCmVN4UvuRUX6cTT5tTJ4s1FbPJYqzL9kjxHcE7+1MCL
	KrIGKhotl6SA3Qeqh8GMU1IY9pdvuFYy2alNlRn+H14TIGxyRtjfGwRlL5V/y5o3
	LLQYrw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c1eba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:02:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso4534274a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790773347; x=1791378147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QP9XFcOlvHmKC+vLTSIEGZ4UPszljszOy3XO95ROkP8=;
        b=XUtuFh42EvRhIPl6TTVOQfTZ4iiMjQ4h6w3vaXS/duAVPAr2X1vjEudzT2fJ/kxkbz
         MkW6/s11iRelCq1REHkiguGpGeNVHd6P6kfZNOwjQl27Lc6km0QPq9I/jvuRSUmDN3/7
         lmUfGbCW+kSCFAvLP+KQuOx7mPiaCv0Zy3vDAtN7A7Mn8AM3IKhrORSf1MnTZW0pq/H4
         1PmINC3Z7iwPpgM72F3g6pc7/ZbdaZIxAVVA0Rl3CZNhMXJ65g/hwchqImD/X169Y4kJ
         jYPEWjjkF2IQqxqX8f0Cw35YK5GAmo23e5Xu5fEwmWxYWE71/1UlyGaHq2MbH08T1FH5
         G73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773347; x=1791378147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QP9XFcOlvHmKC+vLTSIEGZ4UPszljszOy3XO95ROkP8=;
        b=UihdcCHh1RryExT/yHq/Zdcmwjw1645VpFJoGwFrIj5mPtzbVuUrkwdBx7+ZeVhmLH
         90oX6zokWlYuUg89Rlh9vtjl58/UZtRH+x4M8EBHf6B9Hz4dKvI1eX5txEasI0bSZ0FD
         2GveV697Z2+IYkfC6piOmwreeWVX6ZxMsl3EXHWw5xGmd/HzlvSuFNLDu4uidB2AsUB7
         SBi72RYywqp2MO6g6kCRYYX3xCCtnJXFwDhxN+Ohx0sIuYxc0Le+iihFt+SkZ3bmGFi1
         DMrNU6lgf5gi+8NQuWFVKn5oEqj3NY7QlnEPp0j7+2Q6YZ3UTzFgQF9VXZrw+9EUCqAD
         YJUw==
X-Gm-Message-State: AFq9FYJLD4iRSjPbEvhALRznSnx8MEBkf9xfPpzx1v+WdmtHdsYYhBPv
	TpLlMPtI84qCaSXdklAtrfEN43AG2pOKxLsPjuKRLCFY8TtVCJknaewQ6qQSUpa9zIfQ/6qqMM/
	L+r+qmu+uXRQPGSCh/hiH2pCdhbmdul7ox0hXieibLwWt4h+iCpx7hS8UX4f65E7so5Q4
X-Gm-Gg: AYBFou3Uw+4qhZylb3qx9TMBwAx0LPl7RhiPSAef5ijIiD+F+1qgapot67saayRgUn+
	zruiqEsTvN/ltBH05R2BnitkbN+Y8Fxcw/WbMWr1wEPxNwbZElmSGhf8WWBEPXvCv4u8igykECt
	JEXNUjpS/VDmoIOWzp2oAZXbOrwMPx6cALkyid0dL6ACkQsGUQrE+GHB3kSkkMcQf8vOEMTUFJ+
	bibTv5Cr0uMZgsCa6PfNr8QwSF71bboq3eaR0CArcyGfoE34oUMoTSWBz2MmqUoCZEo2a5KYOYN
	eh5tdSQSBq80AOiyCns+uBVw/tXtxHjoDBaKIR4pXO5rdua3A/Y5WTs5F2ZVLsYNICUwUp5Iz7N
	Ai7VFY8OYLupylO8=
X-Received: by 2002:a17:90b:5828:b0:3a2:b04e:8084 with SMTP id 98e67ed59e1d1-3a4d191cc5amr716819a91.42.1790773345736;
        Wed, 30 Sep 2026 06:02:25 -0700 (PDT)
X-Received: by 2002:a17:90b:5828:b0:3a2:b04e:8084 with SMTP id 98e67ed59e1d1-3a4d191cc5amr716781a91.42.1790773344924;
        Wed, 30 Sep 2026 06:02:24 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cdf25c6csm3426058a91.5.2026.09.30.06.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:02:24 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:32:06 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8750: Add watchdog node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-sm8750-watchdog-v2-2-b16fcda275d2@oss.qualcomm.com>
References: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
In-Reply-To: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790773328; l=943;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ltqw38oqTiV8y+kaD3UGw5jHFMwJC/FR2UVSSBuZbcM=;
 b=1ZFDBE/6DsQAfucDyg7dKzUVz5yszrLQ0D/OFGM4ZCxmjJt7O05roOsXlTrrzogMSJGRDP5+b
 cvoNw5cPy9LA5nJRdghB9QCyJYg22Fd5gn4utOt+4lYWSWJ3+IaWd7I
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX8QsHOmyJy1QF
 LmiEiSTWs14U1jhmg8tZRFek5lwJKuIEEmouSSj0DqpErIokgCTWthC98s60injLc19pZ92VuzA
 ksooF86nNUtcYAFedSx617qYgds3Yt8=
X-Proofpoint-ORIG-GUID: de89k7XrqtSrXW4gpmR1LfJtCsXeeGDJ
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd0863 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=flqOiRKoU30ykSV8YR0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: de89k7XrqtSrXW4gpmR1LfJtCsXeeGDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX4NUwt9b8naI/
 tvG45PjnUdGUGPF9RsG2gHlzvE3SJY+EhgPPsDnyoSDhytZefqWaT4+BOO2m8xWCJKJo7T0qyRK
 Ip62C1bf8hXP6gK4BYiiNWIyC2RzLkXbl9Ki8SfJRQsllBfL6w8Zg69poXaOGhsNgFQgcmTC43l
 uqf/UfvATrvNbhs35xwh2jE/pGB2nF4XzsB/wc9kDXBlHHL00fwgczFxNLQsPo9TEw9cldeGqjU
 3BHQBAsTv9uF8m0VHW972zVTfLEufjD5s0Rosf8FbvRWrfhcCsowbRGVC96Ibc8o34Jvvz6gM8l
 VIfmcnavIs3mnvLx0an1jRzkIOZedYW59vjIvkA4twGaGIXQzcHnRgzVC5RrvCuZntLpWJ/kFh9
 JKg6wTtl+Rjt2+G9URvaGvn0DAlJC88m6QNgOuQxtibssIb+hcKUosN97tQPebrR5ZhMHBYKEA9
 3Xyvg08TX19D0At9MiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300051

Add a node for the watchdog on the SM8750 SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 8ed5fa4d24fc..40ea164fcc85 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5999,6 +5999,13 @@ opp-403000000 {
 			};
 		};
 
+		watchdog@16410000 {
+			compatible = "qcom,apss-wdt-sm8750", "qcom,kpss-wdt";
+			reg = <0x0 0x16410000 0x0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		cpucp_mbox: mailbox@16430000 {
 			compatible = "qcom,sm8750-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
 			reg = <0x0 0x16430000 0x0 0x8000>, <0x0 0x17830000 0x0 0x8000>;

-- 
2.34.1

