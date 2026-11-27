Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795667;
	b=UjAVvxcZN7oacobfwVKy5jgXq7mnoEdGMHB0T3V+/TJOjz0YlrWfhAmerjqp0A51kIUK
	 K1hYS60cQIHgDmVJSPDNb9tPcRoCdY4FwmvQWhtOlNz77elUZuRndWPiJmNXAIaTnSnC6
	 Z+ObOJrsiRK0VzMh+EluL754lPnxdo3jhrnjExTnP221AGxixOE1HPIU0AeS6Pk7L/6xS
	 zxCLPB2te/CtWzf0KnyAh6AH7o1fuFvXTO/lX9EMbVjlG+eg8QlKNipjQyHN8atkTAhho
	 L42iLmX6NSKUT0IQoexwM1MBAMF9Z8oRohKXhNr0qmlzM1QZYiAV7Y1IIsS2lFUVyZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795667;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JZJLFSCwdofmSxrV9wReCutK5N290ilN6i+csfWW26Y=;
	b=DlB/sTsv50KYQbJcVU0TfUyDl51MAnDpoFKHLL5Eal6dJF2moxwAN2MaarxTU4piFsOD
	 KsNTZFskHJjDYM0+4W1ZCIqE6lNtMFfrH5wSNKhQ+yMUds+ZN2AxBfsvUlu2MkcbpPFd5
	 58A8R3o0hHbne4yxTen4aVrhIheK4FClq+w5KMokHTvEXW9oF/0DhCjMx3bEFFON9rwgR
	 F5WBjhZXrYw9K1c8Y8mkdMvPetTLACUEK6QJ1rqlN+JEpPiw3egTCP7MXEIko7L+yEHNY
	 iEdthAVAGoulwrzqGGaS0RVm6mbP9pfonrGBVhM/E2EKqqTkgwyDCfEn0fGVutVn3xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEVHkyZs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dfX5IrOc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87FD606A69E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E87FD606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEVHkyZs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dfX5IrOc
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpBBr3328919
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JZJLFSCwdofmSxrV9wReCutK5N290ilN6i+csfWW26Y=; b=WEVHkyZsVYisc0Wt
	AzjI5Rb6YW9WFiskgw9YUu5/pHzGTbAFT290vtsXbKzAtqGfQs0ckom3JptmvmD3
	BIIblJcS8o7/yLHFy8GwV8sTmXLxZBy6V0N87Wu67/tPykMOfPVG2VtYHjNwlvWO
	J0QS1+xy6ToSh8cfsQ3zVqmUJMXw2AFyxId/zhlcQ1E84T4SyopF1tIz/S/iOqdi
	uXDsYJsowFriMInnwa0cvabnsMf70Tk9mUzSfWz5QxtfPzW8ZxZeKbThxKTVq3ws
	AQNV28aPOrb7cWrvfH1hOx5237qmUymeNCI+oHLtA3hRpwRp3sQF+Gbw6eSRFxIH
	llMX3A==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gha49y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:07:45 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0bf2140b7so107010747b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795665; x=1796400465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZJLFSCwdofmSxrV9wReCutK5N290ilN6i+csfWW26Y=;
        b=dfX5IrOczBm6LslHlt+04g+6Xebx479Zp7J4l9DVQN1yNqIg/Y04lCkaapzLn07HEh
         0aXi120quRh6JMNOngNTyE3FxkseHgjWYToPAWTXNlMbG9R+8eyqhUfUfirZ8Ahh47cE
         ej461gxQGS4IDNcSc2UvMf7sMaDhzABhaOWNWVrmdcT+K2fFqGiVqi+illo9Fh1JymTR
         6OSyQtbZE+Of8sQsiqOfx5ZO9exRj2oSdAdnj/ncsG3ord2QLvGNZRVvKLaVbSrzXnzY
         jP7MrVDqdzK9y9hVyuc/jztqRuTqpePEDlZsNwaGCLwtJUx2UJqCxFJxsZQ7ePerFZcA
         ttEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795665; x=1796400465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JZJLFSCwdofmSxrV9wReCutK5N290ilN6i+csfWW26Y=;
        b=jkuwKU3McQfJNK+DIGiTm+VCYbi/tGbjqoaMkRFCQEIHkbezNMadDDuI8JV7yqa7uH
         LaAsyLwlYrt/LPKnBJObVuqNDuA9cje9WkbK0Uj7aEkhIKyRoHz1vGEebP8/q5TpsdT2
         VUWi6IIqjaKxE7/GJEOIZUucKyDQD4TOEtwvbWoitZMBGC4nnKStiIPVvtmq9cVdh3OU
         rxB30Csxx8TSjj3kwdaNKOmMA2Q0G2v8NRt3sKFpvZ4e7vYUvE7JgjTULKMru/rZWUHA
         gAc2YKXun7sRBVzSw2p8b05UbMc3xL3EBu8zbakEa+MAebNHetJG7XIE3z3wvLSWuy3b
         IOgg==
X-Gm-Message-State: APuU4Z+mF7AdpmNxNMMl7wlZNxGiYvqF/zOI0+DIbfgImTuqTctp/gQo
	+TqESM5XcxWxWDP7Gf3IKPS17bByVjrGo0P1iK9iLerH9QJw9p4hpQTwSWdnFvmuaiOtMQWZuTY
	CzIV8IY48O5Clt0AQ/3/CnISfpujeySPDFSsvNE7fJjL+rzSfxGZadQQYv/ctbcfBVS4E
X-Gm-Gg: AZFdTZdX0tzMCuSHZgCSr+MYiRueiSI7XxJCweqbyKq1ckK/Cyc0argHyADUwgCRVTt
	E4ms40qdzvNqvE9v9HYFgyKkS6MHM7OsuIFqYAhvDODPKgVXROpBs+xwuQSn1n+bleLq00jBpR+
	vOa8/BB4s9B5ITwX2SjZcx1aOIjVj0Snb6t580UnCGI+teJNMUAhZ5Bjct2w1Fbv/b2LPagDZXh
	j3OazQD4RiHR8zLux5btkFUaDNW4As7RRo3nk2yAOivQ+UuC87Ep8T+uaqG2G4dQhz3Hz7J+T+w
	dL4yydozZ3EPZE6AGzUtyGs9mwt1iJy5qwRIHF0toKC7Rt8jjmV4kCnDi/bX1ouh3EGWF+zTf1j
	Pea73waAndNHShUd/BCFDrQO9vAqMpOsiwCSMyw4+76iad3gdliqlX8f0uM//FI5I0WrjBqsdeJ
	gKVkqGMnfjJGktmyibjgPBfbBtIVMgRUFnNJaftYO4ZH6p+sidFg+ONnxrQ7//Sds=
X-Received: by 2002:a05:690c:6c81:b0:8b5:6873:5294 with SMTP id 00721157ae682-8b56873598cmr56192027b3.6.1795795665348;
        Fri, 27 Nov 2026 08:07:45 -0800 (PST)
X-Received: by 2002:a05:690c:6c81:b0:8b5:6873:5294 with SMTP id 00721157ae682-8b56873598cmr56191487b3.6.1795795664871;
        Fri, 27 Nov 2026 08:07:44 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm46623137f8f.30.2026.11.27.08.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:07:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:07:38 +0100
Subject: [PATCH v4 2/2] arm64: dts: qcom: lemans-sa8255p: add ethernet
 nodes
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
Message-Id: <20261127-sa8255p-emac-dts-v4-2-f0c5a95cc6c0@oss.qualcomm.com>
References: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
In-Reply-To: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6596;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rhHs/EIeQK9WXf3OLzA7RvJ8H7H2PBjPaMvu75lxpKI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCarL2NhnKDYVkiRh0xcUH3NnMQmQ0eiUhk9+s
 aABLWG0iw+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawmqywAKCRAFnS7L/zaE
 w4tVD/wMwrSX+qAGvf3OuehCLMucG8AHEroWoYKqLOzowheeuoATuoBAPrw98cUm4uGd8yK+YK4
 iK2/QVU7VlZoVYxxhN4vk3MhiHQxXi8lAXLdWTFJoFwsQ9klZ5yQPwcodLV3t1Z9bEMEgbI788z
 bCA2faTzy7BSfpeW0yRjcn2D1NYDS5xouOBSGS3Yca/lgTP7MJUkH5rmSzkfESmAbqCT3d3XzwY
 lEX29pXiE+fAsa5p+wDUJmGqiUUwbaFgSjfdxgG71ImLMja08G+K/ve31EtC2yQSlGUF2E95TDp
 oWWKvMYwKgIDZ/VxeBCcbtB9fpZxogFi/iSEAkkVd9hrCW0KPfcTWZZKej9Uxrb7A25weXwTvi+
 4MKPvTw40WRs9UHZ4/8X+VVCozexO4OgCjfYWNcsPeuZE2fiFNJo4B7HgB3ynAqSxfIOwUuGYva
 tqAj5+cqWZE3dIAPfpEcKT+xo3KL5H9l13Urpr1elFSXRjECC7HNt1FLCbpXD7XOQ6znaGPIlRs
 bAfaBPkvEGn504GAy0aGgPdw0+5hCJV2hHUE1B+vyqDFDFrU+chswHrCNCMB1rW+mH+c1z1xXqT
 hhRkM+uC2Wyt+mWTlYma3TZNvJZZi1xVvNpeHG276bgoJng9yc+ahksQvqs8v+ZiT8rOSsfsRIJ
 dtvGWw85Wv1dYRQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX2uj5hj2Qt+pC
 zbb4WsC2BkdOdPCxw85WVqedKgIMBEmjgiosv7BwS+7UG4t5fzRBCSVtDQq6lnrUcC2qDHO11LF
 U4D4AIdXMRB2pYu/5Cud4TKNnjMibJw=
X-Proofpoint-GUID: VakTSjeMyUDg0_hrc-jgcKQbf2j__nm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX1LZfn3/rDWOZ
 FJYkSW6pvnZM9v8pXxLQ+W9rFnxbC+TvH3NL8ivGU57rj/Zr71I/l9qtQ073Nvls3Ewb4JVgq7k
 h7YEXBZLvsYDEqCY2AithyHrNMJL0azSop2vF3QEIpcEXo++B1TlOAI6mmt7lS79F72ZD9WE9Hm
 jxp2OMHS673T80w99D5/5v14SnfnLuWRgCWhk1N7WHdCVrcOmzIB2A7SQr0SSYmfM1R4l4wMZ6q
 sR/7VSmSbCbaEpqHzed6/QP92rdls/rDlY5FWypRjCs1qX64RQal3oKFSDTlstnCKYzxU6uAoVw
 xTGw9FMl49d+/dgXQD7oBK2Qb2weOr70GT/Xr7p6mtrNwtYc0ar21Qm8vh9U1c3nGLHNbFXIMoT
 FXpB4uQZPGcGyHVTVT1s/ZlJPBubIIEudqFZmlh3oRn655ku8T/26glAbzfctGBhrFTkOYp7T+O
 x0wKRWmpMhuBvq63qyg==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09aad1 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=LwjCQcZIY1nU89AU52wA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: VakTSjeMyUDg0_hrc-jgcKQbf2j__nm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270064

Add the ethernet nodes along with their serdes PHY nodes for the gearvm
variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
EMACs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  34 ++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 199 +++++++++++++++++++++++
 2 files changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
index 91c97a55f2787406b104650956b9a511a6a34c23..aaa8d96dfa61984afaeb13d7543140dd1724979d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
@@ -58,6 +58,22 @@ &cpufreq_hw {
 	clock-names = "xo", "alternate";
 };
 
+&ethernet0 {
+	compatible = "qcom,sa8255p-ethqos";
+	phys = <&serdes0>;
+	phy-names = "serdes";
+	power-domains = <&scmi7_pd 0>, <&scmi7_pd 1>;
+	power-domain-names = "core", "mdio";
+};
+
+&ethernet1 {
+	compatible = "qcom,sa8255p-ethqos";
+	phys = <&serdes1>;
+	phy-names = "serdes";
+	power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>;
+	power-domain-names = "core", "mdio";
+};
+
 &firmware {
 	scmi0: scmi-0 {
 		compatible = "qcom,scmi-smc";
@@ -2898,6 +2914,24 @@ &scm {
 	memory-region = <&tz_ffi_mem>;
 };
 
+&soc {
+	serdes0: phy@8901000 {
+		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+		reg = <0x0 0x08901000 0x0 0xe10>;
+		#phy-cells = <0>;
+		power-domains = <&scmi7_dvfs 0>;
+		status = "disabled";
+	};
+
+	serdes1: phy@8902000 {
+		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+		reg = <0x0 0x08902000 0x0 0xe10>;
+		#phy-cells = <0>;
+		power-domains = <&scmi8_dvfs 0>;
+		status = "disabled";
+	};
+};
+
 &spi0 {
 	compatible = "qcom,sa8255p-geni-spi";
 	power-domains = <&scmi10_pd 0>,
diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
index 6f19064997a4b50525fdf630307b843604368645..e40c811ab9f0fb1f0e5171a7ee6aeee59d2c746d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
@@ -14,6 +14,8 @@ / {
 	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
 
 	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ethernet1;
 		serial0 = &uart10;
 		serial1 = &uart4;
 	};
@@ -101,6 +103,171 @@ trip1 {
 	};
 };
 
+&ethernet0 {
+	phy-handle = <&hsgmii_phy0>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: ethernet-phy@8 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x8>;
+			device_type = "ethernet-phy";
+			resets = <&scmi7_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+
+		hsgmii_phy1: ethernet-phy@0 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x0>;
+			device_type = "ethernet-phy";
+			resets = <&scmi8_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&ethernet1 {
+	phy-mode = "2500base-x";
+	phy-handle = <&hsgmii_phy1>;
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+
+	status = "okay";
+
+	mtl_rx_setup1: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup1: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &gpll0_board_clk {
 	clock-frequency = <300000000>;
 };
@@ -145,6 +312,14 @@ &scmi6 {
 	status = "okay";
 };
 
+&scmi7 {
+	status = "okay";
+};
+
+&scmi8 {
+	status = "okay";
+};
+
 &scmi11 {
 	status = "okay";
 };
@@ -161,7 +336,31 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&serdes0 {
+	status = "okay";
+};
+
+&serdes1 {
+	status = "okay";
+};
+
 &tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
 	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
 		pins = "gpio1";
 		function = "pcie0_clkreq";

-- 
2.47.3

