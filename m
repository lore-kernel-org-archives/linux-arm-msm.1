Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517690;
	b=wy9zOzpVckr7slFbZRApUZ7P8UdCkhTIGAidmMgMoIsg24/0xWJ4fCyKzu9+G2zWbe74
	 fVn0F3niPpx0vxBA5o7LBvmZ4a4hElIALX+bGS2Gg/xgD53sc9LhyoGNs2ooNTR3/6uwn
	 GqJFYZDJ38ueRPBjuWqeTWaAT+PMMsDfvCX7N+h/eTE5RyNt0OmvW7L8FYpm6X4eFhThq
	 bYpCcJZbJ+d3Q8OUUHXvRN2u62nPyElpBA2R2j4LE6468eMqBce6EEYs9t90L1dhbRo25
	 MQe/3KQGwToolanMxFRnfgYe0zkIFsiUz28uqfTPCxk+pyl2rAk66RAFJDHGVZPL8Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rAp/Ls1/54nALRkGPdoe71Dsv0aoi886pdtKQJOKrIA=;
	b=cnW3VBwGB+bSAkZdldBJlgi7sLFkQclMZUcBfZu+no0V3fcWfoRXIZRLS6Eu61/tuiA0
	 muSC+gDS9TBDqmiVMmMMJw2ryfRdWFsxmyreHGzseOM8t5hBCYdA0wpobsdvzE3lTGhf+
	 gtgMUYOukn87b6pyNmmh8naZAWElkzXI/A9vNQTWq9941kLU+0f+5zyBGOh8xGwoU/bsT
	 RgOKVRXXzGpAjXdo5CWyLBxKxaIywtHcMeLrhk6koM2cY4CAttgxmD0w5TLgFHE238kzW
	 MhTJMlBr4JWPU2b9+CYz/RrJRLzeC1Dy0ksxOj7gVV1tUMCywNXaKhlsBTrtwfMaL9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FvO48vrH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b8Sv5Vjo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D443606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D443606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FvO48vrH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b8Sv5Vjo
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8nrpL647168
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rAp/Ls1/54nALRkGPdoe71Dsv0aoi886pdt
	KQJOKrIA=; b=FvO48vrHs05wyahmPTnBZZjM8Fn2C+qz3XTVR2X9tJzJqbZePyS
	aaVDddS4Y3J0YgLsAyKOnUJk1BNGHN3TswDAm67XOPnflO3Y4Wx2rJ26oKz3uTtz
	u10SyYo5g2TO+ZYN+DIvg+idTAqQq1RPZh0AAj6qJxlYru9/h1417JUJRC5OAYBl
	xsj/9z14BQ6QehSpR9r0kduDCJvD1uY7AWL/wBqsNGBQZIEmfV7x5+L5UgixrHDW
	BV97N8qLPwICsIv8YaWxyE8sL3iUhRhASB2UWVTu14ZeptTwFYq6j6BptweH9rtH
	bLYhMvsxZ7TjpMx7sFSZS49BCAHIWOW53bw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd2au3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:48 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so2327522c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517687; x=1796122487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rAp/Ls1/54nALRkGPdoe71Dsv0aoi886pdtKQJOKrIA=;
        b=b8Sv5Vjox07KvqDZt/H7sVzT6tlxc0vtI7B+CzV+EKtHuFjkR3fJ+e4kc75l7H2TrU
         z6nql0qLJk0eMoIYDqmaV+qxixqsTv5bFVDer2xG9JeOC/wyOCE0o7c45qMJjs9ss3Hu
         pAPXOg6VTwXgmRFQYWwCnDMthzw+wN+8/Go6il12H1mh6zL9jsbf4+BKIG2ch+RVY1XZ
         O6vLQYpXDwmYTRC77fQ4UYBOi88CKNuMQs5KH487jTQV5aNgy1qW/hY5gXCCIde04ioM
         s2MjQqPa87YR1SleSgYk2imsv/F9Y1ukoQgyVxOlAR7kTLdmxz64vKzAc/M6GPOQQbOe
         67SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517687; x=1796122487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAp/Ls1/54nALRkGPdoe71Dsv0aoi886pdtKQJOKrIA=;
        b=YvMeigoI+8K5kjwJAviL6IqXFmUPvnS9ez/ndbXpLCdTCQNlznPI5YbkEV0piBqTqL
         W2i5qzYRdq8fnE0eQQcAipnTmuxmF27mOlU/bU3EBgbf+Cj3PeeksxKtxj7uqwimwXqO
         zL1UzFSfnUldwdyD1IFSs6Rms2IY4Zg5SJafIBcMncTWawMwnerOL/SkRmI4RB7LqR60
         ixo3erkkiPwp7+tcas3jfd2qKrf5AawWGs8SHECd+LhfHyX0wMpFBXIPKARHUVbkVZL8
         UiEiX81dawmRn/hrGDYcKZ8JbmCf6s693QvWUuPZx1L9FRkHrkQYkk077gWuOHrWJPHm
         1Mcw==
X-Gm-Message-State: APuU4Z/A1yoJcQnzbc56JLKZOF6++eje24prkCOZiy/4qOY31MSCZOjJ
	94Cm91AVhGDYuFy8rNlLpns2Z/rfSipD/ZH7PMf4og4Rtb0TYNsRyPgWPfuaBjJ23BxU5VhIxUI
	/vuqxQj4ji2JH5jdejFRY8aHkWhPYRXK641C4RFKfeQ+ZCbmjiSqkmq8lGWszoZYsKKiU
X-Gm-Gg: AZFdTZeOoSlObWZaUJJoj8748ejmn+scj9lgPEZ559iuCC+gz3BvQk3tkLefQ7TIwh9
	97kFhGtVaar1rrtGHdSAE3/l5oHJfw1gjAe/FJV+1k9wrkzZ3/3SQ1Ycx/Y7MGS141oADnHLjfN
	okdyciYxTTSTX9IROsEVbLX3dIdFOxhWuMal4HHoNqYFLhCZGH3WtWJSYgyt3rN6hVqd02+fTKI
	AH3HwBz29gXlcikSi25/YJ+U8+xSTeB0dUKk5VG9JOfxrAh4mxp0jv9wwMtA1fFnKymW1RQ9kpt
	8AjPFVTxwFUa4SXkYGV5M48IbioWkIWngWY+y7JDR2oCH3OtETkU59IfFZs9nZ2UPidRdzhhq9b
	CezwE0csCFLLPMUzKeoWdiM2SbhmX9bHTo/M9AZcLC2TzQY5z7Zy6kRiRbxPEsO5bUDl4/h01qM
	3csKLe80ZsNs07IoAtCRE79qHw6LyDhT7GQY+Nmg+K6RUBqSx88NGT/b1Y
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr17920636c88.21.1795517687429;
        Tue, 24 Nov 2026 02:54:47 -0800 (PST)
X-Received: by 2002:a05:7022:e981:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5568ac1d5mr17920609c88.21.1795517686848;
        Tue, 24 Nov 2026 02:54:46 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm38072085c88.6.2026.11.24.02.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:46 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: serial: Add compatible for Qualcomm Seca SoC
Date: Tue, 24 Nov 2026 16:24:36 +0530
Message-ID: <9ec98ffd6cec85ad77738128329ec77777a1f69d.1795517676.git.yadu.mg@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b056cf8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXzTE+LpQN2V7J
 /Jv0lb1236a1MbAehb+CQV72Pi6WGDilp9fYML0FmK/m0T3rOsGZ3C6ykUS6MUb5nLZEtadzNlj
 pF4GO1p4ctfBkikxDqdPWQfgkwQ1VbNxDCN3qi7WXvNneSPgwgN+UC+vzENorBAWniDJfQOzObc
 xOG2Zu2q8NoZ9Id+48svs+AYs+GkrY0ZzYSQQReWB6AulpXdbN7tUqQ/vDxWA4v4BgDqzd4Ks30
 +QEZBOoeMluBo4VOokEHSCR8weJii20FnACZNcrmgxbHE8v0zgWRf9RRM5rF8O/A1jvJdcqhsq5
 b9nqyK8BFLNCpk6hNYeMNC2o/jaDhaFq4WBPEcVWH5zaK46DDRk/RxBmQ8o9g+ebM7OdMe4VV7c
 H4D89GjTS6N5n5kMil6SyhXSE997gq75fdesKeV0XNh3iD0yYbQSlYB2VK6VQuYyvP1wE9y1XTz
 N7BRX4Iq99GGa7NFfrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXx2ebfCUHTI9t
 39NYf3LU3sRNdtqZZka9zoxliUmKzd7bA6JCkXe2QgFcL3oTmER7a9nIEazhFTI3XkYnoBHPbiv
 0le7ough//etAYu7ovEv8972skQZAf8=
X-Proofpoint-ORIG-GUID: zVUYy6bCy2gsbudfnHGZ8_Am1UZOVaWo
X-Proofpoint-GUID: zVUYy6bCy2gsbudfnHGZ8_Am1UZOVaWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Document QUP GENI UART controller on Qualcomm Seca SoC which is
compatible with the SA8255P controller.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 .../devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
index 8496f822dfa5..8415764222ac 100644
--- a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
@@ -24,6 +24,12 @@ properties:
       - items:
           - const: qcom,sa8797p-geni-debug-uart
           - const: qcom,sa8255p-geni-debug-uart
+      - items:
+          - const: qcom,secaau-geni-uart
+          - const: qcom,sa8255p-geni-uart
+      - items:
+          - const: qcom,secaau-geni-debug-uart
+          - const: qcom,sa8255p-geni-debug-uart
 
   reg:
     maxItems: 1

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

