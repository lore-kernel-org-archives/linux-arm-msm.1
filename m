Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D65334D93C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773842; cv=none; b=Wb6OvQQB/7P7xso/C02ZB5zuWN2RmaofzWCegrZAcrmuSwrsyKWrw7SIs71eOQjGCftbIoovg0I7+7tEiVJbQUSjkcNhUaLxg2xw6KA+FI6PCUBrdhf2wSNq6+1O0utk8V+phWX8zYy2V49CTq+LNGcjtuCO31tG1fUS6WuymE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773842; c=relaxed/simple;
	bh=KWNs/xCEnPlXMN2fZRU/bfpMbHhsvVdPwo2ZWlrIGks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IqI7svRtUtU3ozAoW2Eh9ECoUhjkz1SZLx0ob7vzBkEWY7qlJP9AytgWu0P3DqLsTNQbg7/ZMEJbavW11cURdgM99RnrWM8klIK8K2ZsWBuorwYPk77uYajz+PzFARmoir+fyZi/uKqRqkSgHdh6ppA2MAPVKaS11hzQspazHNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXDhHiXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+GfNDg8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXDhHiXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+GfNDg8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X2am2264409
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGQESnapNniC439AziMhXbTJfLqaefgPzfYKsPTLavw=; b=hXDhHiXIypTL2I4Q
	Nm0xckCyLs0Y/M1peMRut9fEBa9Yn311o9sHlSc4WW+VXni04g9zgJIEcVfEbWjC
	L3hv2z0mr88xgEz7a5jyiCmeOcVwdEnZWivb8ot9P1AOCdDDqSGjUTnsrxWyBp4/
	3D6b9Q8RkA5y7Dn1JdPzHSfyYvPj/kOQLBVchOY9t94tgaFfVI0N8CL66rQ7FDTe
	S5ilX2XdR8RZV/SM9P1teb3tOcUHdO9XOD7yFm0HwiX7A0sL71qCpfEGp5FX+Byf
	4i1z3m15MWfhQw6pGtt+0nWpuv1VC/CmKSzQBxOHcEbANDrTT1GVHptrJeE7bR9D
	IuAccQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2v1ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:30:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccbb61893fso4378655ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 19:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784773834; x=1785378634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGQESnapNniC439AziMhXbTJfLqaefgPzfYKsPTLavw=;
        b=I+GfNDg8hWei5vy6SFOGkxpUGLxwmsNXJTfePWu+q2/MYwNRs2m0CvnYw8n3QtHr/f
         Xvjpb4A3EIYlioXOOo0edqR1ERmN0+D3GnmK0mDzcAbMHK8b6U6jl5VNY7sz9QqofXW8
         yFVc0GTRAciMGoO6Gwxcr+veNHr4XWcPTgGs6kJ+XMcyfcl104xyzjYP3lob48KL5aXM
         GtxLZjwHZtEbjEKvgEpeebE/2RFdg7Hb5A73ftcMhcViV2OAHwDg63OlhWK5+5NYYGlp
         uC9rdTn17ssI82ngQPe8to7p/tkHe0Zo5MYhTvJ7cXzgClz+2DdBEOO1Ecd+AMzlpR0r
         wHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784773834; x=1785378634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGQESnapNniC439AziMhXbTJfLqaefgPzfYKsPTLavw=;
        b=e1Jonpp5pidmtUGMgd3UBKptSgUVoBTRElsfGuJuMO4DX4ZVe0uRSmcWaj9pC61WVi
         WFNRtVDk8Nathq1boZ/ZMIGy6aEUvsgC4cDZ1RmmUpLCZJLTf6Scl/fydK1FyC1OX184
         NMUfRSb4ssHYwkDQ0hrJfO7YzSLILocQwdZxOkx5+Yxa3nbRNcER1n9nKPURhKbq6H8h
         RBDTVtjY08QQSSMDT5ziJB1vrA2VQQczezberIg6ldbYmgynJoGpEB4oAw1Wi2/xMILG
         eifX5UuBx0ZI7PhObNf/fga+TJ0/EHv1ikSHW5XTpN2CM4/nTOBXr/DM3i9H45c8m8sS
         WGkg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7P+tGnVFixVlYL+l9hFFj3RCNOYJsr4MaeMoHwmNoRpEC6Cg8yeu6RKG3hjUz4jjXrj0efmkc0wHB+aPB@vger.kernel.org
X-Gm-Message-State: AOJu0Yznb6IjD3M3tZzAqzaZe/uAUmNMZ9/mJHWJ5zwOud/zbP+rV03o
	vBT2b54W2R6CV6mbocQNHx37N4iR+wzwD4c+NrT3ebirYOhi+oMWqOxBTutL6Jy75Sxqosqe25X
	aOlae0E1y2lAoSV02RdWF7MGi5ZuT4txuje1jANmM/VyjE0UCWJQSqUQnO4YV6o86r4vN
X-Gm-Gg: AR+sD1151GJ1pZMS7EZ1YXFepY4TqMDmYtz+QaPzV09F32zVoyBVgO4HtGAB+j4ZMVM
	BH13XWlcnFOM6G1qTt8juzYGGbbR4GZFZJbpAe9DgMXOjGcq6iEAgOWQ4JB7FpnSX77JaoTWBOz
	g4R78l5eQREqTcOUjA/22xZ4E6ZYkuflkmWPR4ZwYtz2MbJe1idft9RBlCDP1aPS+gEPPg2UgSX
	dr66CKKsKMaiTuRwNDSFR+7iWsg2pjKFIpFggYqXcdZHpnA2tNr4HGdLzK+adU8szIYl1jU5efd
	pIQd5+sIyUTl2jzbDwFNmkwamoXAnoINXV4sdSRpsD66iVxJKdnUPwE05j5XLeRWcGS3M12DF0h
	hJoB1mb7OsfsGfxyO+41rXHmEPObe1cVAlOxrmeN3axjcGVg=
X-Received: by 2002:a17:903:1aeb:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2cfa6a43e63mr15762825ad.1.1784773834189;
        Wed, 22 Jul 2026 19:30:34 -0700 (PDT)
X-Received: by 2002:a17:903:1aeb:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2cfa6a43e63mr15762425ad.1.1784773833688;
        Wed, 22 Jul 2026 19:30:33 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm13463980eec.0.2026.07.22.19.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:30:32 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:30:23 -0700
Subject: [PATCH v6 6/6] arm64: dts: qcom: mahua-crd: Add PHY supplies for
 pcie3b_phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-glymur_linkmode_0722-v6-6-bba8156b8cbb@oss.qualcomm.com>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
In-Reply-To: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784773825; l=781;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=KWNs/xCEnPlXMN2fZRU/bfpMbHhsvVdPwo2ZWlrIGks=;
 b=GgeI+2mlBp4bTa+H4va0AjEB1ZBhMjPdS2WjMBoprLL8UozW9j9WgkZI9WpFy/gdzAXVr+vvH
 sxRWa4f9U+/Dow9A7HnykLTLHwB/mWLeFBqqKA22kJeqIJamoV2Wu24
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfXy7BpntUElwKM
 0FNkDzPEc00u6DjWmMgBDrSqI8zXsDwa2Lc/EujIpmarltthuCQZcxFmGtzn+JV3gtu+zi2car0
 6uxB9AYj+rU0qmvRxnPWD1EyJBrh/a5PZaiQdsrqgWoFMgFnx48aU/Bdcv7MDy+fQ9zQGShE4RN
 dqeOvIrclkZd4h1u2sXY53hEAlGqnr1jftYqeFEERfA2AwCpQ/4wQ4DPFUnuXnUoQMszTwmxMZi
 JNfvWgiNXD9fhU5o2nAUqmDMZbWaayMW33SDQ/9RBcVjO0KCmlCfzsdwwHZNKuqcL3W7eU5s11u
 Z0yt9NSBDse/PR9GD6kAk3wmOD0IprME30jbJpnoQRm4r1aQpf//Vl1a/jpLIPMNZk3kgXg8ca1
 3y9zMAd/1rWlBsvbzZ6JDh0uu4GN/fm+oUACP8oIZlsudnoKCf6DpR5czQqL7b7zgceTzMYyLsk
 aB3Z0LzxDspUxNr3S9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfX8qx698hi3h/E
 tas520jo7UgmR50T+gLNua7kWKiM91NS6QIB0FiwUa0otxpCO5Ozq9yBve5khkgurB0bG8oLY6O
 Czf+F/OetDwY0b5Oa5xeSSkOgMLZ2RQ=
X-Proofpoint-GUID: zZBRYINhX4r8qr8MJHtwP0Icj66vKyf_
X-Proofpoint-ORIG-GUID: zZBRYINhX4r8qr8MJHtwP0Icj66vKyf_
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a617ccb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FJ594BFJAeq65zshAlMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230022

Mahua CRD wires the dedicated PCIe3b PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy and vdda-pll supplies for
&pcie3b_phy.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..c56f0ab71f4f 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,8 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&pcie3b_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+};

-- 
2.34.1

