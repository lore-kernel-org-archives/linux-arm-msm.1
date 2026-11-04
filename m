Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783294;
	b=Qci0ZqR4yjdIHIqp6B2Lc53mi6wxSnrnK21DLpML/AyvpPal/tK8SAuxX2AAXdUC720u
	 EGPuEfTZm1qpkt/INCcFvoEX9xksMRwsyJeSL3OZhWJSeNhSFDySlNC2RZR5Eqf2kUpO7
	 SEUVmHeF3kWqNi1gt62T2U6FiLadHdnc6UJWoTMLrB94bnTgJbGWr0ahq6UvP5Bf0yu+C
	 sTUkZQsw8JGBC1o2NMp6ULQRiEKDz8d67Y3LN3NzqqJbHHxsHIqJKsyEbZhgVEehHLZZa
	 96meFIFdfo5cY+9ihEyratWOS8jM5aMEjbruvTicGKniyDQdP+a/FGO9ITL+QdxP+Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0pP8dFy+RMT44qLZsDL6EP9keqwqs0ci0Z/KV1ES620=;
	b=Udlh4JhFK9Ry/WFieLTNk+TkV7X4/7AMztuNeBWfBmxbimeJA6xyefUwVIjteQN+yAOk
	 7hagPAXtU8qTTsuDQkKvO07+lHOhtF7ll5ElCEs7csN8RYxucGSdLMKQklMexEKRJvb8W
	 sxg4WcHbXDrG+m5QpooJmkc7vLez/dy5kzAzrjzWF3s41Oo41EASY2hLHk933/oE6YVsO
	 qcYa0CZiFvCPoG+DdwC1j851LtLeRy7ZE3lYzGRNFkl8B3siq+xCjQF3Q9CFrE7cu92BZ
	 5pMQIpz8Hmp85H9H7GbmAfmae0EZbtLfK0elzQPCDJBlcrmAdYrVmb0x4bV4cAX4YjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=azrTao7o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jfmQbyhb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270D3606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 09:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 270D3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=azrTao7o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jfmQbyhb
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KbJR3875798
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 09:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0pP8dFy+RMT44qLZsDL6EP9keqwqs0ci0Z/KV1ES620=; b=azrTao7olxA7+GjR
	xpXQPcYyKjMCkK2tCnHggxTZbWEne5HBM9kbEcX6wKOBAv++dkyb9HGY1RlPFAnJ
	G0SRXl8DGDCwy7hE7xiDvjbKIR+3x7POzADp+Gm0vzNOA9PDx5GrUv7vis5YQAkF
	m0fThlpfkcVoULDAaf28nT+tBJbLKa0SwLEt/DY0pvaneBgQEABz0USxKg9LVtL8
	9wuHMeRxQ1xC08kRdQxT+nBLN2shdWgMzzqI96fUzWm3te8/MbVtOosf0OjhZMaP
	quRQaPCCR5ivrGEED2wluhYSEY6NvDBGdAEdN0mOz29Qmpc+nqGRWogdkqpgviMz
	mytwnQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0978v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:08:13 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6f4d828b9eeso334633eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 01:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783292; x=1794388092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pP8dFy+RMT44qLZsDL6EP9keqwqs0ci0Z/KV1ES620=;
        b=jfmQbyhbaWyqeKvLozywIo0yxmOCSBRHsBOjs+pM8ROZocRxU9o7XFwxjtq/cDHI6o
         cpbOM8SkfbHYJR3W+X25IXXnapLAtEdKDbSHAJMnABBn9uFYripCMc/MSDMFaYpjWsec
         D68eb7+w/VL5CtiqZz/eckhQ3nW1VknIg5Eeunqt2LXrKeUIW5ZZrfjxs3i9eRhTuAW1
         5OR1+4xubvmoerICKI5V+JQjTRoyLdfj+LiEp65kwm4Zb6r6r76YGqd7zByvR8EZ1+05
         0q5kW/5KPd18+KLja9f07rky17C/FiqpcPhWAMDp+nyc83KW0MBullr9Jaj4y1RmSeqH
         hanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783292; x=1794388092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pP8dFy+RMT44qLZsDL6EP9keqwqs0ci0Z/KV1ES620=;
        b=WKpaA+SkSA3iGGhc27wK6kpz8h0wB8uXLN3zRVO0DHEikBhGd7Pv4JnDeWt1Zg8+wE
         9R8ic9S2mar8ni9ASjnp18lIRbN8ZkjwDGFY4zaUT4r+lWNXZVgruJmoSOs98OLQ/dzk
         mWg4GFTFhoJmslnWF4+DPbktlj2AViJmtayN5t1ix2qlemw2yOHilvwry5jYvYgbJgal
         sSFXivo8dn+mQgWYwn0LC3KPBSwx5FRjjoOzImHGcj9bAMqEJezjK+l7OFK0LHlhLghS
         zoeKOD5KXYS0bCJK+GMJsGuTxR/xM7BLZg9UtZ6Oa5TTcu01t7pmZ3eVDJ2BV7H++9lZ
         uGaw==
X-Gm-Message-State: APuU4Z9NJy6XlOE0r3mltqR50vzLm18q5Q1sKokWoDYRaGy4U0LsrB7L
	7rZzZjgeWCkX0r3jdhmRYS6r5fdL8LE8HTbz0E79SfHPfFFul/FdevL7TyzDuHb4U5is7XnZHG6
	+UDfgNQlKI/yBqMNd3ahzaugUDxB8i174HQ8nZfFTmehSIc3puyk1Qt/qJ5FmyUqK+iJV04UePH
	m9
X-Gm-Gg: AYBFou3Em/UaatpZjVY3xEJQBMMoHM5jy4AIAki4VXoZGf1mTzh8ZPBk4DMtDYTUhAx
	TUZKd+bEKQkmyS7QdWFfj6o9r3w2rf4FaFDFidh/it1ivUg+b026hWVbinJw93XExcTPWRVIzxz
	0drElUipGJBYd2gGIxiMjv+hUg91k9zBJ4MTmHeTIvoBKugS1lesIS5/YAx6WSU+xRdsTSJLj/W
	9Sa6yFrzhATV+a7S90X5a3OjhX8AwPlkzhLHj6imi6f1uLk/K1XHQ0paEsoKj/wHIRJBAoO+hmd
	ylBxh8fNIyXmAWjWxiBlOWPDqKFrTPcUZUD7myCzfBOou6L1o1CHtZoscuoTNmQpBAfL4cQeV19
	b9UzzmgX1+aL7Nw0shZQTJKWIppmc3SHLO0BsD8mnAcpK2Lv7Xb22SDIHYGgg6ZI8QaGCspbakg
	Yb0HjBrYHZgYVpZ4fylf4=
X-Received: by 2002:a05:6820:a659:10b0:6ff:fcf5:40ed with SMTP id 006d021491bc7-714f2a97a1emr5707645eaf.90.1793783292321;
        Wed, 04 Nov 2026 01:08:12 -0800 (PST)
X-Received: by 2002:a05:6820:a659:10b0:6ff:fcf5:40ed with SMTP id 006d021491bc7-714f2a97a1emr5707641eaf.90.1793783291852;
        Wed, 04 Nov 2026 01:08:11 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d768c8sm1519846a34.8.2026.11.04.01.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:08:11 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 01:08:02 -0800
Subject: [PATCH v4 3/3] arm64: dts: qcom: Add refgen supplies for PCIe PHY
 on Glymur and Mahua boards
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
Message-Id: <20261104-phyrefgen_1104-v4-3-ba508fc6ab40@oss.qualcomm.com>
References: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
In-Reply-To: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783286; l=7726;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=qgl8m3HOTa+QKekvRBjrXG44N7rhEqII/ZPBl4OthEE=;
 b=c7nizw2jNJVMBhxWO8a9hYKoa0M0fVb3PYvKBeppGCcvdwtTqB63xV5Hfr+NTKSpZHqa6M5OL
 8uHatRLOxcTAxI7f3xbvCMYEFbdl/jKUtQjkaYVj9FVjus6OuUf34SE
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX7n6OQSTbiomR
 NeWY7V4JqNnujCbBCDmplJhyAt474Ruu5KA9lHMl9lKBsoVNeRGzjHcHCNzJbNaQ6/AWjk4wOeu
 6r3VU5/3g/bXd6/TXH+uf+j7g5DNLis=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeaf5fd cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hooUR3UheFJlRPkIXLkA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: O9v2wI54PL0ES8duB89WT-i0PkWgJAlz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX1Wf6d4uUk6kx
 d0dUKQ1UrL0syHsb7z4UALyOVA3KvDw8UVuqaYQ6NUK0rnTSJA+a8IF1cV4EfVVpFfraQnebvgn
 9ZaR7u40zPeoUwWkXfvcEcIte5TgGT6iy+KAmjYv2EwCQ1g1qi35L/mWUsbkOPOROb08vgQ8yHk
 YoeabL8re7YBzx+rpB/5yNy9hJrtCRZzJIXtSm6CeDh5wGZCmlxSsrDX2SARAFMTAIzkW+ZEgYS
 32SB0Lx/1AESr8MJ4YySNt4lWP0m5pNCGGlxKNX1wBnpxSkMVpKQ5fOPsaOXQqppKEbrOhZL9b2
 rFPH1kYAWx7Lo33hYgzYS+iu6bdVYDbfZlODKGxRfGAyEsEBUZHQ/R3ATGleKnsSiYVNGDHxJaf
 xS2E/bRXrH5agYtCzUvH3RDOhob64ZuWPY9m3i3RZEA46BYIa7BSthsSxqjJlFz4LYsWcSLw+mf
 EfUbtkD9dwllhHZuArQ==
X-Proofpoint-ORIG-GUID: O9v2wI54PL0ES8duB89WT-i0PkWgJAlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036

The PCIe PHYs on Glymur and Mahua require a reference voltage provided by
REFGEN, which in turn is powered by two LDOs.

Since there is no devicetree node for REFGEN, add the vdda-refgen0p9 and
vdda-refgen1p2 supplies for each PCIe PHY node.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts    | 2 ++
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 4 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                         | 6 ++++++
 arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts           | 4 ++++
 arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts           | 6 ++++++
 arch/arm64/boot/dts/qcom/glymur-qcb.dts                          | 6 ++++++
 arch/arm64/boot/dts/qcom/mahua-crd.dts                           | 2 ++
 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts | 6 ++++++
 8 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
index e96e65a0c5b4..d1746845a609 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
@@ -735,6 +735,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c1>;
 	vdda-pll-supply = <&vreg_l4f1>;
+	vdda-refgen0p9-supply = <&vreg_l1c1>;
+	vdda-refgen1p2-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 95da35125d75..bf3c828c8a0b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -818,6 +818,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1>;
 	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1>;
 
 	status = "okay";
 };
@@ -843,6 +845,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0>;
 	vdda-pll-supply = <&vreg_l4c_e0>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0>;
+	vdda-refgen1p2-supply = <&vreg_l4c_e0>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..b3f876956e7e 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -764,6 +764,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
@@ -800,6 +802,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -821,6 +825,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
index 096d40e49210..7f79470ec004 100644
--- a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
@@ -545,6 +545,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p91>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p91>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
 };
@@ -581,6 +583,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p94>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index 769f195c99d9..130946ba9785 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -743,6 +743,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1>;
 	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1>;
 
 	status = "okay";
 };
@@ -779,6 +781,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0>;
 	vdda-pll-supply = <&vreg_l4h_e0>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0>;
 
 	status = "okay";
 };
@@ -800,6 +804,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1>;
 	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..f26bdc1cd84a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -448,6 +448,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
@@ -484,6 +486,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -505,6 +509,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 17e40f2a6259..45c95543fff8 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -23,6 +23,8 @@ / {
 &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
 	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 };
 
 &tcsr {
diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..ac7e1382166d 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -813,6 +813,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
 };
@@ -850,6 +852,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p94>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -872,6 +876,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
 };

-- 
2.34.1

