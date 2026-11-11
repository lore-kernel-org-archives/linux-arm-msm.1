Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383528;
	b=U+5vQ/Y1iJemC1vcj77Bs5jReFraJdWf/NVeoYNwQMher+4aEqItsQAYnr5WZ+ltkFXh
	 DCFZDEShdfWa7vNyIFlCFJC2gTG+mfNHaFa1jmYdndy1S5sbOOaHpQW/+R83r3SED/WZx
	 m+/PBgIv1U1epZCa791SarZn0+8+mJJhyY2BTvn9fwcCymyqhaw+efIRCCSDPj2dXXY4s
	 WTT9GeXOflSVqyPsnBwJZ3ZVFxmcmkqhdyl2NgwTJKg7wuEsNkhHsEjjVQOVtvaZqpRMI
	 +tGpUucUPOkqrUR6UI0wUjjsEKSTHxL6NysAd8+Li03Kzu4TY740pb4ttAIQONZ1Y9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
	b=yYE1DuwaXbyp+dOQvfFz+yWnOZxaM4T7o9eIl6JTckBikiKqfop4MB6pjlx8KfGsYwvV
	 HCS3BbfAT+0DGkTEVjQaxzkLeJi0xTlZrbCXQEfkaC4+nhYza6R6Rq0+p3Jr18fnvcoWa
	 Xlc5QUQEKMpiMfCUwL8s0D4S4CpjHNWfXkGGMlh19YOXG0G4vqf9hYVfiYBWeBzH1B+Vy
	 ckwBiwYrhjzXxh/uFhOo1cTwzfXBU+37LRaKzRgRgFTCSmjxQ/Cj5PQPIESD1qDocpych
	 yv7sV3nu4TEHB+3ZaZ80GGP7mIPbtyuMiO45l5uOg4eUqw9pFHw+IuHD+5WuYwY1nSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+FRo4A0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QcYZWk9k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB40606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCB40606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+FRo4A0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QcYZWk9k
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KOMd3959025
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o1w2HYl6UPI
	FbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=; b=M+FRo4A0Z6U2HAu1y98V4BL9JKj
	wKbY7OV0xh95urDzjaDLCxdtG76wC2X7SvWLesGlwvECh5Cv8sRTl6tQRSBSPib8
	2Yuv3PaZ2FkRqI8BZrbCMUoquiBdQuyJOAXHcY4w7piEosl23/OdBRzYeVS87UYP
	lvnA/WNcZxGZP0GjaLGqyQak80oO4hUwPtPfh1dRGO122+jWTXd8zdy0xS/dAVkl
	tDpkQ94pwIQPAfK/i8zjdD2GbfRuxDNh/wEoTyoupO+VzFXtB6Dihm4PbraQUN+w
	FIQllO5ckdfhh5/IIAZv9I+t1LsBqUf6xO2S4eKxf2p9amAlkUDuS/TukUg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b32gyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so6096436eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383526; x=1794988326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
        b=QcYZWk9kYIquQpTleXGJ2NjTdM89PwBSMrdKGX3pIT5nd5E5ersO9dwGipaNPzKvsx
         SKOowJV5OEj8IGaz0KfkbkEKfTyjBv5V8ZouOa6FTSV5sYOrmhSWmZNRcm/IcC2yCEX2
         WsGk1UFM8GoH5+ZT5ppqW6ef/OkquMCt6rTFhDJQLOeVHWvbKrkl5H/vpNjLVayqbY1S
         PhDuK8PaNS4sjElULo34/9ZR8mBRq+RaVNpAp0+/XSqHj5E3oi0HBpgXoMnN9knNEkZm
         3u81u8UG2NIOvB8/Q/Mx4fV497IRWx+S2Rbf3Xxs2Y44B+LcUH1Xv+zaSDnIjmpS4f0r
         HYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383526; x=1794988326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1w2HYl6UPIFbZ+NjZMN5RjdULizFChLdC3ZbnPN++E=;
        b=cQnMC0tn2Ni31j0CExmX7JpIWt8c5fTG2BlCRadw9ACGz4MFBe9iIJ3QIbxHoT2p1A
         EyqQfyScDcBLxEXPIhZd862GlUQN6MHgf53vRr0ldtqE4Dvi44r4fI6ZFvE9VNYpQfvr
         CmQpo2QFUmrMxjO9y74xLo4mAbA5gVrT4isbvlwcC9g0upqVfUmWHJsZm3bycVJmGJBj
         rXqp5nAh+2CzanKXNvNmSaFKHjzY+Ven3d8y/Mvq6zu5ZksaQ4Vx5uvr1Ivc5uHI4Y0q
         mNFoWkJpsuFbe23An5gYg6/tQ/v25mA/oGBkbJiZlEPOhPsM4GpaW835GG9MFeigjze2
         7LTw==
X-Forwarded-Encrypted: i=1; AL+hErFYxxh7N422eCUL3G61d8j2OJr+impn02RKmrhu0TOYLlLiXW/lxfta/oL/q/RmDOJ3b2v/dhaxk0rO92mI@vger.kernel.org
X-Gm-Message-State: APuU4Z+gJjZ2IYg+to7RcRnH2scQgzvCzhl56C5Rmv+95xhiKEFzyvPb
	2QsvgZx8+zQQyaYcpItfttG7FZ42rT5Ix5sHGMMneARsyPNnDdJLP8acWdF/sLqXxkEddyMCUUl
	2Wb2E0VNQoLuOC+6F2fZZpjwFnJ6dTsOlgeLZj+syK/cOrECq+GntOp7r6nmsKz+/TPOV
X-Gm-Gg: AYBFou2A/2pVxXYZim5Vg4rdG492rkISskRWeeBHcZq79S8WAFSfSUhOrQXuLvZbbY8
	IKyG8wgEkjeEcL9OQ0ai54yQ+/vO2X8sb+ZuCYpGeaQekfGaYgvyZooHUr7bDsSHXt1AIw7ZHl5
	l88Hltd65HvNJ+oKLA7wfhndrsKqDq+XxlSYjIdIZXVEKBlok0AgJ7prd0+CP0WxhQZQdmKIoBj
	TZWfsy6CGXYc/9A3lQyPASlr/EsLuDW+LwZG24IXtCf5TcQuWoYiFaQtqnQ39Fkc7acyaAI4Wlo
	VRxEMb37YvpZUz2fXejgVKYVIFtBlRpPKSs7jHaBB7LceiJ5CxqDAuRbsXkqtF6GqrPx6snRqe5
	naaUuT49eT5A07Onpbbuxs/p2fa18NmJZENVDRq/I9nD82Q3m4zNbRaDmW9bAfr02bDr0uaMTlF
	yt050HDGF+9TvcmqxkKRc1qsEsTQIOBo9w
X-Received: by 2002:a05:693c:60cd:b0:369:f18f:3492 with SMTP id 5a478bee46e88-37686d38d9dmr2892300eec.35.1794383526221;
        Tue, 10 Nov 2026 23:52:06 -0800 (PST)
X-Received: by 2002:a05:693c:60cd:b0:369:f18f:3492 with SMTP id 5a478bee46e88-37686d38d9dmr2892249eec.35.1794383525526;
        Tue, 10 Nov 2026 23:52:05 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:05 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 2/7] arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
Date: Wed, 11 Nov 2026 15:51:36 +0800
Message-ID: <20261111075141.3710366-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af41ea7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=f6-OUQb2phOXiqkgZ7QA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX0RG8uwLLuyxr
 C1LWHotbRQmrcc6ayTuJCaFMRfXY2znJ6o2p+f3VmhocbpqVjgMfuBos+Trcduv7ljhOWoFHIoW
 Vupu+roIf1VCTAQRfXjrRdpeW9VIIp1cPS7CJ66yWVaXftOLdQC86bLYAUYjrLzyqTQFei3aSdw
 /bm3prsKZzTW0qpBh0icFIff3MqPbLi6OwUqmsuec8hLjxXeWArB/TpCbhsLPLBarGKL59BiAWw
 h0/I3magaTapR+AsntjPu5VCc2dHA0Ff2EA/so6ekpbtDMiT88EFtnSLPyCcUvt6RJjfIggpDUa
 7Qw+zCZJQRJJICf7Wa+srh8b4CUpsj1serae8rjmQsTz729rwqiDHAQNr3WU3ouncNVqg4MXtmy
 GXYyn4rawXXahDMLIRsGPAYKoW2WrMBzv3/hEBFsRyCj6S8XKKMNUhpdWvYoI3zZrPyPscPY0FI
 fomQDblf8s2aU+jQNUA==
X-Proofpoint-GUID: GdqPzpD9C6Vq3FiqLn7RbiQkZGP9aZlM
X-Proofpoint-ORIG-GUID: GdqPzpD9C6Vq3FiqLn7RbiQkZGP9aZlM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX0A/npZEYaOHk
 H8wZT5EnaNER3ofDqKZEZwVqatdhza6u+y97ExkSsbSkr1Ta9Rukm4GUYHEVNfrKYlnh8TV5Odu
 /jvdbpntyfLFhN8OuSRrHAz+82DaTqA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Robotics Reference Design board routes all four PCIe links, so
enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
rails, and describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..98dab85de64d 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -377,6 +377,55 @@ rtc@32 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l2e_0p9>;
+	vdda-pll-c-supply = <&vreg_l2e_0p9>;
+	vdda-pll-d-supply = <&vreg_l2e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

