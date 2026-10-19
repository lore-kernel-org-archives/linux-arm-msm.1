Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428396;
	b=F/VH4e2OODQof5mve335shuV4gIPLBsz02eLEiW0dkEiuM7UTARhyZq5UPLIPieO/0Th
	 AgPntwBjH/UvGpvn51JAsGhQCnuHJGCyi9rTHJiqLQcpWEI+E0Vp0MGPMbqLGMR6inG39
	 h/4QhemSSisvYBbJ4q3cb3Yx6HiiuBiFDZ1rpm7IXxqJTg+FEWwCM/Vo1xIwrJwZ9bb11
	 70coh9UFvij8ZeY7bwxOc9xRp9C6GX7P3NJlaWZ1fKXA/tcG8BtWTGYa2x8v23G8nofZM
	 6E6LtKwnoYkzPa2/FVKGRXEzMvLR846Leydh/pIhEAaoOsNIqF2CKuPOZSiD4npfBFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428396;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hebtPO5JWaFqiDHPGNPU2T+9bnoIHyDDr0H0tLrI97I=;
	b=k4iNWcP+u8CXxzTEuNkxU+J21mmfTKL/hWFkbTu3b+i2zSfMySTbEULCYpuxCW1ARTkv
	 KBl2Rv7/CxyvECVeiUQE50tfC/6IyViJI/yw0wCpSWZ7pyaN2h1DwN2pPLBDbhgqx38ce
	 CMKdVnOxpPS0yXaKHaQoA6dTVgOVP7a3sNk7y6a16K+504rhgM6E9v32oZ6x5HjCa+leA
	 gyT1m0tW+mCTQG+vyTSAYPBlna4qd4WxwkgXKvJvM6f6Azj4ACV9bMOqsnLNzUySRdMom
	 cf1ksNHDqGYeX6N93xzxGEphk7d18m7y2B07YBZqyFnYkv9B2bHIZxWMRrhqxEzvT0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mz7CgNs9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fuXLmgD2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ABF60A3804
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8ABF60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mz7CgNs9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fuXLmgD2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFP6H53592094
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hebtPO5JWaFqiDHPGNPU2T+9bnoIHyDDr0H0tLrI97I=; b=Mz7CgNs9zSBOxPXF
	SKljQOXDULC+KrDJAuNHf09hNnJgVDAJ9yksW3yLFf5VWyjh1FkkPWiPYWAWQKoR
	WGSvaA9M+w0DpBZmyLY5Eb5cQjK3S+EyiJK5jUtbaswAPGMfSqNY8sZglnEY2Y+0
	j0c2SUjOVWgT7Qf6ua4VXxMLb1MPcLkL6PQWuvqhFyMUAep3sWUw+0o4vV4F+nch
	D04Fg4tEwyNM90Y9cJmDKFzeIKylXX1jTla9h0hnZozslnUa4NN9AbP7anMGfsdU
	cYmwt26AvNOzCIpjmeqU56ukYFB6/hMJHKHH7ONbQxCokHMKJrFJVwVjyr9U/DQA
	GKPrhg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn211r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:46:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151ba226e1bso3680391c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428393; x=1793033193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hebtPO5JWaFqiDHPGNPU2T+9bnoIHyDDr0H0tLrI97I=;
        b=fuXLmgD24aMTYrnlB/u4T4f9N9mMotk5ac3w+7vqTHnCpNBTu53DIS/hAoehmA6+RO
         dnVrHUwyWxhTIxvGhnWdVBAEYAzIUZzuO2TOZSSD3r9TcUPsWXukuT1V4V1c2W9mw8/T
         eQLWK79ocxTo31ZTwnvWK1UZc5EQUtXo0RyrVBFWrdUPq8zhmfRNw198NaGB/sRu5hO4
         j/dbLiNkiYHBPtnrW6FWZ7jkZ+xnsk79IIeU6M9CALqr9/v1OslMmYjrtthoiMB0eNC3
         Oz7FNxBQjA+v2RlB1YLzCYpl/TItiUrN3i90pEak5FoC+F2tsO4xLPsNexyLcuRsMmgX
         IvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428393; x=1793033193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hebtPO5JWaFqiDHPGNPU2T+9bnoIHyDDr0H0tLrI97I=;
        b=PAhLGf21Fym4pbatDqZjnHiIZIzXochJlzvfWzsX6jnvex9eu4QmEFprTmHa8YTE+x
         yl+F+O5vp8Gr/qStXEZXUxGfQUZcqIK2JBKrSAghNlLS7h65kGUgfkRjVpiokGUEpoUV
         c+xbU0OxhtfQBN0bgQC3HAv2pueLj3UKxrRL8JlL/hp0ZKDPpyOHsER2bocChP+5WjjM
         Z0IaJvQH+6oaKnqmFNEkGMmHQGPwlHrXrPU8/qBBGX8/aHaRoNE5rFMorE4q1JZT6C1D
         CrH0fZpAZF5kX1AyVCNpp0ay/umfoihgMC01+7WzEByOoj8qO4Fis76SlbuVpKSPnUeK
         dx5g==
X-Forwarded-Encrypted: i=1; AKwUvBxaFVn5gOsnkhG7HYpslmhDVdYDWPnoQ1gL29GQfGIFhVXwUrO46CV8gbYRPwxZglVqext00r9oc3TnwtIg@vger.kernel.org
X-Gm-Message-State: AFq9FYL6gI9T/HoXRM21LyyUsq8gNgxK4uZkhUYzVC+lMnrmJa5pukzT
	Lmao1AMFcQfVNu8Dr53gEIJwfJMlwWQW0Ay2c6Ng6Oi8Bn01rK48V28mDZ7YcQcRldPzxUSYDpI
	WK+/F4fQHOocXmUaX/YGsHH3BfeVA/xMKu4w/rX8Ezuyn/5KDA9oj469mWOwHBcrZtj/e
X-Gm-Gg: AYBFou2NX6uLDizX53GmH2pvwGEY/eyrisWzep5hIx7bv3PfOVcyAWTErBpB1J9TW/K
	ydgNNRxSEufZKefgPLXLmWZbwwRFxd7Srnqs63GpjUu2CdWBc8SOpAe6KB+108g7V5cVLXWBSNU
	jM3+R2DLUQ5kSYa+DqQdXf9hSbWV0wH6K8H8ZZxemFX7e2qhWkPanxhaa7847a0eFlRyUyNJXCp
	pZPzzICOY4IF9DVvGUTqJdSvJtDAR0q/fBI/IRhAsNYhzEC8jT8kNyEdhf4CgBIu39ELXbrF5S1
	CFbaok13+QZUuE4y97zwwayxrv3rCY52xhlLyt0YuNbxv1eFkNv4oQcN4Ks96tq8dHfq1U4GEQx
	9Ta5qOhwaxKHf5DqkhUK1+VkoMLwonWLe62d6tX7ewheNAuhDnXLdurdK2Tm3/iK7Rk5g95E28V
	CuM5dI2bdqDEGhYnMP/YlCAMLG7aXIDCSZHvc=
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr18556609c88.26.1792428392681;
        Mon, 19 Oct 2026 09:46:32 -0700 (PDT)
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr18556562c88.26.1792428392111;
        Mon, 19 Oct 2026 09:46:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm30379415c88.2.2026.10.19.09.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:31 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 22:16:17 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: ipq9574: add support to get
 watchdog bootstatus from IMEM
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
Message-Id: <20261019-imem_restart_reason-v3-2-e6b1ff5de841@oss.qualcomm.com>
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
In-Reply-To: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfXzs6oKtGDrtIf
 Wv3dgpqPF99WuX7Rq2/oYDopdT4w1ERRUtYSdld6oUah7FM64ixyqDkXxBCCfwq/JhI3xWSp3ae
 o8kdAvnf8y7VLwCw2tVTs3MuUnqo9sg=
X-Proofpoint-GUID: 4SnRcIT160l6B0kDpBnFfZhOePgQQnOw
X-Proofpoint-ORIG-GUID: 4SnRcIT160l6B0kDpBnFfZhOePgQQnOw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX1Db6vyb64vFZ
 2svQtRg244FCDblYLpaxT4MxUxWINN4Bs4nc8YWsCs32iKgpC6iTQ7o1DLSWsN+8zvj7ILfETcD
 TLwtz2YJeKTGU1am8DIA9nk+zgXmDepJjsrJFhVO8KFuZ4ANb+odSnN1mMQ+xCLEOKSqDw3h+Pa
 S3DSE/IOmq4K4Wk+YAAz+VatGti3LEzcQEawS7Ubr8sgJH2w3Gfx2VU6tf/LaLoNCcn+WtCp65J
 W8vXUEjQfqFzrt7Sfs37oIlxn0oaKx4GbrKe7pKM7F9ScJltvD1couTPHXvQn3ozt8DEO4/ehNl
 L6yeF9tdb9RDkCqPaLiryDb2oJAZ9UVsR4BDmFgzUb8lBC/iJOR1OOuKLnAOzjPOQXlXPMj+cHu
 9z/5DerhFWNNEJuaH3HmNi8ix8u+NAGTPz8MN+FtoYZkenw3EEXu1geGCTTAlvzXaIjHOpfwMZh
 oGAt3vKmve553pGwwHQ==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad64969 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190066

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

To achieve this, add the IMEM node. The overall IMEM region is 32KB but
only initial 4KB is accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 771a59585645..e1908f01851d 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,6 +757,21 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "mmio-sram";
+			reg = <0x08600000 0x8000>;
+			ranges = <0 0x08600000 0x8000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;
@@ -847,6 +862,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

