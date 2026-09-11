Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6894457B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109443; cv=none; b=HMyrQwfTWpvoetLpsA2xqSQ/YP3nOD3GkiN7AvDvdgKevyOEfq47o+5WjuB7o/KHdnhYvBPo6+RWQ0/Mberptpzi+XT6NmWkNYI6GTuDGt/lwdX4DG3IiVdM2fY/yXVVOeg6zmAFgi5TW9Cd1shUAPlFdIExhEU95ZK/o2dYhMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109443; c=relaxed/simple;
	bh=9H5g3Swcwg3dlkgYOPFBquTx6iyt1DX+wBg5cLvnukQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hkys0FcBdroL/LUaYO6OGsmZmNhkut82U/Aw9qEGfNUzuuCaxG9i5ktJlPBcRqOF5Rl6x4ScbeL2SSAXT8D00Zx43WNUPwCV6meGIJYZR1dRmQX0zHB07kqg/06GMZiCHvBfDCrR/b69ZAmHV0EAiObqcgZ2ddhB9IM9BMcLR+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2UwpS9D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T72uueO/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2UwpS9D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T72uueO/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kC9G3550701
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRnVSGfwXFEcZBjwNKcSaOhcqJwxLrIrpC0MQG1jT6E=; b=V2UwpS9DhJLx/3WR
	W/Sb5SWrQGA3SM3CutT2TqE8zisz9lUxhp2jlOaVmnuGy0rGuNEBvIB9ZpLkcWKO
	ch22tc2EJEcd1AbDDta8efr1iXw9RXncVhp7CXI9WQo3CvXyBAeJ9T5GAdX+IZis
	GwEnVjzK4qgdyw6AWxflcefM6yHS1Zo6GoaW91Xxs8ilyPnkGZefRnIUbsiAlkh/
	m5jLODXwC2VOF/tsY+hkbC6MnbOcRxKEebIIvFbbmltw/oY7CyjwHkaWiNb5mRmx
	zD1QTuKEtQsQ6mrHhQbmK7QydoWiSo81nMUtjwrMDxC0Cv3ux9J+dz7ltXbKpym8
	jie/bw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg0gb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:50:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b6416441eso1130945a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109429; x=1789714229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRnVSGfwXFEcZBjwNKcSaOhcqJwxLrIrpC0MQG1jT6E=;
        b=T72uueO/CPHEZEARMzMrq0QiEaGV12fToJvgrzvhqc0yFc8HTVYIsQg3fd5oH8121S
         zVWuXZEBuQhuw9mz5//6ml6On5W3M6NK8lbpICKq9lre6m43sNPZwqFjX4ZzIhT0WRI0
         GDpuF6GEJcajrDuq0YWdsgM+JwetRCTJHGZS4ZUK8FuXBwz0r6+uJHSdqw1LDb+XBy5N
         /6RxD7qUhr0t+d7xvBz1vPvgJ6d5YIaVxFOuBFY0YQZz7b2El3qcrepO4G2mURkgdtbn
         yoFju4lHszDHJjlOdwBIoywcCeZFJU/KuvWajgarQhdL0hTLIw/6dEeul50d/Lwy8Or4
         YCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109429; x=1789714229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRnVSGfwXFEcZBjwNKcSaOhcqJwxLrIrpC0MQG1jT6E=;
        b=hHNB4LDwJDsryjMD2dE2tNr0Blk98nECO0w9lmtsmVB3he5/vE+gI7H9xdEI5zoNgz
         UkRYBRY8FEJPenU3qUr0yo671Cmu/W/gX3sv4zSWQMleovTVOJby/ScPW6UyIqxg/CgS
         5nCl3N2qw9RvYSddhT6vy+Z+dNwVL1+BLiT6TVWaJQ9mrpSIKATTq74qk3y7uObBIjTN
         PTFl6V7vP4aB9dwg2bjbA/O8rEGwLPIXFCBohJvTPoL5H6I8YMcopSw19zqEP4L9YfDb
         ty7J+a2fuLWQGoCyf0IDBmKHSbI3xXlwq/qb9ugu1FFXxNfVmqSDzmuRe4MEzxTXEqYV
         plDg==
X-Gm-Message-State: AFuF++n4A63oQd5MhqCBo/YR7WRyVVBQX5ScHXcGco1/GLhTHdVqkK1e
	7ymJXBG6cJMm8QSbWJaEG6v4ZmHji4YjeIkiOapYRiLHbtdmfGRXIhDlPgHJYPWZ7PuNbPxKb0u
	dV/bjO75JtsNRW4fjlonup3vYHagjGOrzih31U0Lw/AQrB7D/egGwUVboGPmEnZys3gEH
X-Gm-Gg: AYBFou1M2zjFGGKzM5yzpdyHXYJB2aSjX8LXaqjPe78bGCqRJDVabb52dlj0Md/bj/b
	0DcM4YGcd0k8ElMqeeHfgyus+dXn38SGIvyCPShVYrrXXME4bTVnt9ovRY5iZRjSOLX1pDPusZw
	TLQtEyXkXOgte+htQewvGlCoTqmPBl2jV5/JwZxpzL2DEvz/0LXs9NfraGJpk/N6D8zbFsIZWcn
	cZDi8ci5lWnRMtHG8y4jrFJi87gB0LCfB1j/02DCC1HU2/xmPAtvb+nMgdg3W1y2OUTbYTfA87y
	l7UJloK2qW+qWZJFle1RPu1zu7FI+sAWZr6dyxT9URR8xZZkWp1snxTdm1B1/CCgOsA2u6UKBWl
	M28jgWy3i7tv/Yxnrqvud0Zt2fJMHHiF0STE=
X-Received: by 2002:a17:90b:3906:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39d9c3727b3mr4406693a91.17.1789109429585;
        Thu, 10 Sep 2026 23:50:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3906:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39d9c3727b3mr4406651a91.17.1789109429116;
        Thu, 10 Sep 2026 23:50:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:28 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:06 +0530
Subject: [PATCH 5/8] arm64: dts: qcom: glymur: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-5-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=1357;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9H5g3Swcwg3dlkgYOPFBquTx6iyt1DX+wBg5cLvnukQ=;
 b=mSB9uw/D0MgRIWHxm/4QFHI1sl2GWegxaL2m6H125jfyr1DttoYv7dTiOPsUg0nNgWDoRoOJe
 Nnh7lVDbkxQDSOBHyAFLkQkn3pBPankTCA+3FMwII8vAJzNOp6O6gGR
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: LVQcg_vaqBoRJrmfoaV-NAG4XGWhVUO9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX0difIcX2Kg+7
 P8ayo1hygRDaL2OCEyVyYfFPKJmqJjp0cU2YWuWd5D3jhCKOMM8YJo6wEVI49OOLWk9H6jWszj6
 eT3H2wnlvMpOnJ8peSuePQe5iPt5JQ8=
X-Proofpoint-GUID: LVQcg_vaqBoRJrmfoaV-NAG4XGWhVUO9
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3a4b6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX+BYzEw/rxPu5
 drbRCPSZN3JZnKFFMcoDVSyBCl9iSBQp4bce+gaSRsWDihP4+rCEkECJhT6TXc9TJA+Og3IAi39
 FyVDDIR5EThB2MfN1WGC9+5aQSUSw1mc+VTLEAw8erqdI+13oASUjaeEE2sF/uF8Po+PP0ViuxV
 rxURlQUfHNvVtvcDiNgdf4ACP4E3bMAl/PayuX8Co0SfyqbpVwxlskGgnsdUIF1aqwx9HHW197c
 72WMJMjO5g7/fqmHos7a7TjBVz6qIhCw2sl6p+r6/qNysCXLadoKmV5CQiLdw/7P9cS6XHwnG1V
 Mw4B+VOdX5u8O4/Qu8V5cPIHllm187AmTySJHv6ee0wj53r2mQV/VoC/ECV63nyQzG+uiNVoWG9
 kcKxz1y1D4tBQnOtfytAucysfyIPUMm3Z1947ZwweRKOwnYocnJuu5Luso0/caT2zlnmt4hx2LI
 BMHzPJ7gq22PttYWH7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..f7d7d76830b3 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3001,6 +3001,8 @@ pcie4_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 
+				t-power-on-us = <80>;
+
 				port {
 					pcie4_port0_ep: endpoint {
 					};
@@ -3273,6 +3275,8 @@ pcie5_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 
+				t-power-on-us = <80>;
+
 				port {
 					pcie5_port0_ep: endpoint {
 					};
@@ -3489,6 +3493,8 @@ pcie6_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 
+				t-power-on-us = <80>;
+
 				port {
 					pcie6_port0_ep: endpoint {
 					};
@@ -3759,6 +3765,8 @@ pcie3b_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 
+				t-power-on-us = <80>;
+
 				port {
 					pcie3b_port0_ep: endpoint {
 					};

-- 
2.34.1

