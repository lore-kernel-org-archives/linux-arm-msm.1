Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502656;
	b=XGLKYUBwOD5pWlbwSp7U2XRCdJpiwTlbQw5WcEEK2G/OmCpZm8YUNLzAY8EZPjG8xB5Q
	 arv2sZh5AqMlRynXfPdKGa2ClVcIm+hMgwB31m4lpCqOpPhQYRF8Pz3j+qHX/ED1O4ubd
	 K6DY5V79gn5PHPTpmhCVU1ttEJ4Pv31F238NMU3gCswdw3f4gPJBYLsQK0z23fxi0yViZ
	 B/K7kGkMFYdz7tFGZ6BLsso9k2Ii/201ASFmDqtdaheC3c21RwfQ2Bkro/gzTc8G7p+BV
	 gZ8buAB0wovFA60Sdk0KbWf7WuhHtWQwN1Uxe2XUOZqrI5eYlDbOPsYkxkw2A/cBUhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=;
	b=aIvrtJX1mbwuk+DR7gTY/yyHGnX33LSTJ/DlN/86VK+Ra5Ni31s9H0n7MAlSE3zmYXcW
	 hPyfk9Bz8ImVAs4/3fQhrg2mSNP79xjdlB/hLK1eMaSlc+LKEWkWaRQnrKLkGiAoHpS+2
	 Gt2WhXnT4IaLbqKQp5CJzrFq7Q9i5LA5XiJXIh9HZgH0wvLtpx8s8tcMnmvMrUikozr0V
	 i0pEcSjl6fdj5zH/l6ZQ8T2GmnNdeUbxNWLqBaX+T3V+ZL3AVIDcK0/DwHELSu5q3albm
	 +5FGuCH6eOfBbgl4gGIlikXzSQadr07KxxXmb6A09KQ9Ov8a+dC5/2Au6xtazp6iBbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjH7focB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfSWUqQA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C7606A696
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08C7606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjH7focB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfSWUqQA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k21R3701111
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=; b=PjH7focBiqaa0ZcR
	XISc8LNbhtosAMxTl3vqQzThZ0Tt4mgpcUFq3X36UlN9VFBNlAFbGlnp/tA/EbWy
	avzuliDj2EYdnjovzHWLoQyLv7UC7CJsPN/ZuA24/TsVmVFBzNzEiz5aerg2lvKU
	E9ab6LSiYiMKtF4LyErbvc44tMl0yf8fRVBpTtzDk8ceImycUTZ29a6zjL+b3Phy
	TyJ84eMo6yg2gv99WgDtahE/oQRslkBwKlrMocRqasgrBaHvOkku3cT9bksPMIDJ
	4Ex3yaU++NEuQY2u2J8SXAI6290UGQIwt3jmjpOGSalIdH+Hg8r93KmcwHzCgKw+
	xaIUjg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky13x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:44:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869c59c491so208400eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502654; x=1796107454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=;
        b=VfSWUqQAvomUy/YAyZeUDz6wqYsZ+Uo81lZylw40WJeKjThMRRklwStkUoxO9mxjLV
         zweP4jLb4Qz2d65VhF/FaFogdqURtbUs3s+Fiwmn2UYwCQRlwPWv39AxGCtGVWqQcQNM
         gnD0WkZSzQrhac6Pm6VrJhcsWo6gHpZrAs1llP5YJdjqGab9PsvuIODKDV/TGgV4PjZd
         SgRkVzXxOb+GMEivStqwr+YbrtKpyMOpDapIhGSMr5nwhlPeM4cETcecYwC6r5MaXv8J
         Fz+iPiFk4z9BL4pPJ5I0siRiYxHB1sY6UNjqd9Pbd0AbUtTAlsx0+rEHA7s0pyQkuocE
         uzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502654; x=1796107454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJlO+n9QddxiQfqLhWfnSxFjyd5KcZXhTMEEZh7XIK4=;
        b=ZTIT+7Z2oJud5e5sZiZBNNJJiC3OpBxXh8yvyxMnhfl6XZUn8rrm+Zj5kQBePBT/nM
         vyrDu5UqEM9h/YWvcIH9Z/nbdwRopjBYDZacQrM6ypyYdzzqYYf5Xq3wA97PUsNj11a6
         h4hhwrl/q/q70g84xLsYWEV+b5HFdMjA8Qnbdafu8hDjayZPKe8dxs3Q0v9vZoZe+ZEe
         2FKhUdV5+C2tg+uKxGCre/RwEzbOr9BwZhyAxf/pZY3hyw+LxSzHjUni08hQZm7/J4eF
         OMdO80IBMU/Na5PDwHGiatmFL4sH9aJwA8KHZ6kfBUG0n0nnGcwm40c73ZY815e8Hlo4
         O/CA==
X-Forwarded-Encrypted: i=1; AL+hErFhqUvc5Det5rwHZS5QEq3L2Ykplv/hc+7feJd29P6cL0fECS2nA9gF/c0UdQ/8dJO0C4f3OcvkYxeyS+Tk@vger.kernel.org
X-Gm-Message-State: APuU4Z+XQH27cRACkfpQo8vhGbtkdYiaH7HZ7p4X6uActxdC7KeaLl1x
	TJNjBWrP4/heFDbw9Bx0Qp7GPks1O58zHX60b0gPLinYmgSjn+wjUtwlL/cY9xA2rPcQkHW8L/L
	MjAp+ur+ra261OTkeq+oOuGsiwLnogFX7hYsTuACCyUmqxgzqQ3Fb6ZpJ6b/OWOmMHYpD
X-Gm-Gg: AZFdTZf33O3RYpWGAEq1PbtTRdpivhJWiKZONrkKZvuqdbJrVmr+jbv/kQaJdGk2UfX
	dLxYvcO4LoZ8Svf6o2dQJ3cjW+zfw0JqBO5O7boCKVQGZzpz9HdBkSTBUKyM7jLYOsKWLl9CRXr
	RKKqV6eMzAUoQ8C4DqutdyvC6Q7+i8k1mEAC8Rt6m+wfi8SfFM/TODN7W12TsWFTE+/NtgG29cl
	qV6jM7n1FLdexofR8nF5slpKCPvcC9sIJRZhISDH47Ua5V2mR4VtpDaVbyB9QYJxHh0RfAek+cU
	sctGISY7ANVrWH0b9eGxt/uYvfIYskFHGIk0OtR/cC1ms9D41+Osk2iefQTpurRk08cmo8wPpg2
	gtlbQIank5wP/fPdJcTjEwEaigV7kjVLyleiOdU+YiNzEdVaPgedGZBvAw640fKeSk1nOF1yVuj
	f6C2Rliu28uJ3472ZDru9s5Gdmqm9Pvga+gA==
X-Received: by 2002:a05:7301:18a6:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-3856e84e391mr21262522eec.1.1795502654028;
        Mon, 23 Nov 2026 22:44:14 -0800 (PST)
X-Received: by 2002:a05:7301:18a6:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-3856e84e391mr21262479eec.1.1795502653545;
        Mon, 23 Nov 2026 22:44:13 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm39265484eec.29.2026.11.23.22.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:44:13 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:44:05 -0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: mahua: add iris video codec node
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
Message-Id: <20261123-mahua_iris_enable-v2-3-b1a16b16afca@oss.qualcomm.com>
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795502648; l=2664;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=qjdIwYmv1raoOrxdhbIt/Aie3lUaYl7m0Yszv6aLmdI=;
 b=Po+I1K6UW1QdqQB2jqK1BLYSJklxWdpghSl8piBW/o3T1M44wR4e4eKuHpfw+fvmFEq6Y9V8r
 p+WfVltS/6EC7w9VLIgHImyunyKinqlP4wmKw1XAzFvGS7JvTb19vED
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05323e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2ggMmf_gxUOvV-BHYncA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: sUbTzmg8dpJ7SmrgchZBljtnom6vGeq7
X-Proofpoint-ORIG-GUID: sUbTzmg8dpJ7SmrgchZBljtnom6vGeq7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX3GTDUrmSHKMc
 22RT0vhUxixmYqHaOu+LQU1AIsbUrdGWNoRHvSlblxGzekPJ2T34P8JeexaL2sKVYh/slUzJoAF
 h6GaoXh/WjH3UEKn7HpwMeFP+Bc5oMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX34k8WLUZY8T+
 L6fP7A6CJcAmNAcDFXYBp5qrqy5Xe9VjYUaml5Xqb2jXCKm6+veaYetqYJdt9hOyw6ecYNkzFRr
 /kjHKmIn9hhf3tvSpAcrUKLZaZCANubmhUbK94Pvu7zVRYBkHEeeMILNN8r51DqxN50hjfzcLHj
 U9Mql2bZ4hin7M0MrncQ0ySOeqllJ1E7JaYUeF+bsJZnkr66mbEfOQarRBitRnyK+2FeAZqBXj8
 78z5nhwORe1p6D/xpRgdmKzCYnUM2pLd1WGHRHHe4tkRq1QuR3eBU/8LCSbnkuTiMg2uyPjFMZe
 ho0kZ4N5FeZoY8SAbCRaoXaQWb/wfmyBt4RKEzQVrK7PwkZAxNapDST8VzTAVhSq617M4nPeXUG
 vEdVFlZDdRzFfLtobBVuBHYO8Wqr3e/7WykZJ17DEN58PDqz6G+DwlDDUG3KWLeZx4Z8OZrK+xH
 emcM09EUbQjb/Re5Jag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026

Add the iris video codec device node for the mahua SoC, overrriding the
fields clocks, power-domains, resets and opp-table reflecting single core.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 67 +++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index e7141f8c9e0d372aa30f2ac1ecdc5941d249311d..4f018193be50a9f62bd9b0b403a5a6b0a9f6b6a5 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -150,6 +150,73 @@ &hsc_noc {
 	compatible = "qcom,mahua-hscnoc";
 };
 
+&iris {
+	compatible = "qcom,mahua-iris";
+	status = "okay";
+
+	clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
+	clock-names = "core_iface", "core", "vcodec0_core",
+		      "vcodec0_iface", "core_freerun",
+		      "vcodec0_core_freerun";
+
+	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+			<&videocc VIDEO_CC_MVS0_GDSC>,
+			<&rpmhpd RPMHPD_MXC>,
+			<&rpmhpd RPMHPD_MMCX>;
+	power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+
+	resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+		 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+	reset-names = "core_bus", "vcodec0_bus", "core", "vcodec0_core";
+
+	iris_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-240000000 {
+			opp-hz = /bits/ 64 <240000000 360000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-338000000 {
+			opp-hz = /bits/ 64 <338000000 507000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-366000000 {
+			opp-hz = /bits/ 64 <366000000 549000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-444000000 {
+			opp-hz = /bits/ 64 <444000000 666000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-533333334 {
+			opp-hz = /bits/ 64 <533333334 800000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_turbo>;
+		};
+
+		opp-655000000 {
+			opp-hz = /bits/ 64 <655000000 982000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
 &lpass_ag_noc {
 	compatible = "qcom,mahua-lpass-ag-noc", "qcom,glymur-lpass-ag-noc";
 };

-- 
2.34.1

