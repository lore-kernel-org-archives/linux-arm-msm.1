Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F8B41A909
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887313; cv=none; b=VxXbglBFQQO6vUDPWD3Rkz7vJi9msgD4Z7r1Tu5t193KatJfTvx5IvF7UNRv4+NQrbjsZtLRsx8V2pb2hZVFh92xcBkgCKR6myyDXmG1I8dlDrieN1TS3gZsbV7/e7nZdZoMYafRsNAqz1g7JtjLkWJx3dFWEbPRmWjr89Ge/iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887313; c=relaxed/simple;
	bh=KWNs/xCEnPlXMN2fZRU/bfpMbHhsvVdPwo2ZWlrIGks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ysdh3mMOcLnlTuPqyIcIYjEsUS+zTz6vv8lSHn8hb0BjJ4qw0rlfu4iRJ8T0py1tlTliuK+GPZ38hB2n/baVcc6Fel/BrSZ/UCxIRvvsuEtHeRjISY/+YsrUcBKWqsNIDFt7l4vesBPZY4XtU5njL4XVSQSrjS3Mdj7U+1FdhqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhoJytfU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQtHD2AR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhoJytfU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQtHD2AR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lXcu2099095
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGQESnapNniC439AziMhXbTJfLqaefgPzfYKsPTLavw=; b=OhoJytfUnZyAoPVX
	KgtU4Gf6CpX/0eBveUVSGWOllCb+REQbPJ12tgoxRX8Go0yPjMbobTHVhKQnu4DG
	mWMJ6wQlcawpGGd/90WsA44gBpCY+Lz36FXtTtXgv1Y++bjvMwca3ClybBKP6BV5
	Yff1oNiAQzlKaGxfPem59kWiG/cucgtFSfSQkkKmSZOb7aeszRb9FV7dJCHwM1rg
	w0ZuIqA/ogl72bPRI1N6gWgYtdk8VZM2F/a6mRU30JoVFgOIIdGQKd+sGGkOWPA0
	Z48J9JXvzebCkZjQP2gL/zcDI9Ip1rbLC/o097Mv0b0u2SDy0yyGo8J/6dlTDcm7
	jUX8HQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahte33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:01:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e375d9736so313438b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887309; x=1785492109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGQESnapNniC439AziMhXbTJfLqaefgPzfYKsPTLavw=;
        b=XQtHD2ARM7bFYrztF2fHTeFUH6HNhl2mfRZBjGIFcDl/iez29X3wii1xQRQe9OeoM0
         6ohi/rQZUbQjrWL6e6x19Siy9IaHuQcp+V+KA7xAetofcf0Biynf/vn7LVhCHdsQzwRO
         lay+Rw2HRgIPCcQhe1tiWfPQLS7Z33OsgbvojNJeYlTxy0tyGItESN9lKqyFpTeKCg86
         VHhuvorXIamLWUGw+hDidkAL9wNIk+AGzSDk9YYSuWh6uZgaPeb6HOBAqmrOXPrnBntF
         sUO2hbQiQBUuOfuSnLSlzcZNgF+Mm8Bw6KnFajlgq3/Y2pbLCMAYN5eo61vd+Y0/zmUe
         TmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887309; x=1785492109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGQESnapNniC439AziMhXbTJfLqaefgPzfYKsPTLavw=;
        b=iEXl6Q024erh/BtvMl3MesXRTShUcx08beCEOhUG8xf5aqOlLT6SAhiiFwIjGffD8l
         0WUoTLIgPMSA6dco7WRqk7ZSdRKotfGQx+6jNy0K+bgeD09z5SclNtCMtM3J1Gt7nTTO
         k6cW/fcwnQFoGeOVxwaISsAIn6AEIdad9KeMLj1BVK6+HA6rTsoO4MnDKDx7R+omQ22g
         rf/3cG2Id93RmiRJO8d21uqoaEm67pCQMqaIxV11ZYG/CJbMrAr7IbtrAeN1VkvWn/Bd
         XVOO80dIkT9HSF3vaoKWeTEH0kwHcn/p50vYmdCqvBiQlEQtJEUsGRzy8xolu/ConfDz
         kffA==
X-Forwarded-Encrypted: i=1; AHgh+RoB2+Ppff6FbqrFWuZHmTNGl5fyTFbgUqmDz/WdoMJjGL8Dni41iVUBeazvfCJ4I+TuQpRgtEroS5zGSs6X@vger.kernel.org
X-Gm-Message-State: AOJu0YyGn+CQ+2w2+gXa+M4z/iU5gb045t7e2EOoxEjlHwE0pKvrgy41
	3Hqhn8uCoDie/9g1BBl97VbXcPogJXs8+R38iKPbn7LWHL/tFlv22BOiT02x1zDAgZ8VN4/265J
	K/ktKHO0FNbfJ4aWZWKDeXLO37AoHpYXcl8tmIh7P7Y2S74o2P8ob6DlCnsM3p5zxBkAA
X-Gm-Gg: AR+sD13Qqcr1ahNOLJLBJe04lp5/BjOTkuI3t3WBJiFtQMOh4zKqmmEE+V2e3nJtJ+B
	otr1TglFcB1Km6HpF+32XUwPbxRGYtifufFbNpG3Ar+NYzdWv45lwp/ilusVi//ACKjLhYEOoay
	sGxxkjlp2wnUdfteTSCJ2R6/BWzaA4JhIq/njKdjnvHZosXtD6nEpuzCcxozjRIFDSvnKQC85Qx
	K06jvXag8z0KpUTl+x8BKURb1dkFFH3qJa4dNfE5UmtYAaJvFXW2f9hSJXgQ7IYJwIQdjcV+z0v
	5TT/5u9xH3f34SDhefxsCJSu3aGsoFRy7CRK+y9yTR4CMLE/8RMj3MfeQuykDE+30DwRwDKVe/6
	twyIwsbih0TehF+bC4dlyMOnbStf/XcGyuiXynfk44fw7d6M=
X-Received: by 2002:a05:6a20:c783:b0:3c3:8ce8:1fd with SMTP id adf61e73a8af0-3c44b29013dmr7413056637.73.1784887308601;
        Fri, 24 Jul 2026 03:01:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:c783:b0:3c3:8ce8:1fd with SMTP id adf61e73a8af0-3c44b29013dmr7413028637.73.1784887308203;
        Fri, 24 Jul 2026 03:01:48 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm29515427eec.29.2026.07.24.03.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:01:47 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 03:01:24 -0700
Subject: [PATCH v7 6/6] arm64: dts: qcom: mahua-crd: Add PHY supplies for
 pcie3b_phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-glymur_linkmode_0724-v7-6-65c8469c6b65@oss.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784887301; l=781;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=KWNs/xCEnPlXMN2fZRU/bfpMbHhsvVdPwo2ZWlrIGks=;
 b=9SCuhObYe9BCJuQXo7hP8niEwhoIQbq34eD+lL2jLagu9MGHEVaGXFshpAQAwg2ScgZ46Xd4S
 ddoDPu260AIC/45FkeXGGckfEk83JOTlbZBudbl9o2KWTBHU2a0yMcv
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfXzW4o3V85++46
 RKowOR+fh1Gv7OYD1n18vHHCQxGf7VhKjIbvdlsvHssz+q+N1Mmow6z5MtqfzsEtgvCftrvQcfA
 e4aV6/a4KvvR5pHiLWvdjFGqa8sCptA=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a63380d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FJ594BFJAeq65zshAlMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: HJLapLdwGSoMtnfAH7cfs38PG2GaG23G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX7lRSXt+pdX3M
 vF9Mu80nde3MwaAZ5hnCGFPajusWgrsb1ibQNeI/sL5SBP7woIVlpIBU9/8BhiD7qRwDtFYN2tC
 QFeTJYS+t6srmN/H6zMxyw4at2iVFNelzbFcQF6S7PEXn0hZh7qw56oW5opb8F2Pgt9e6YME90A
 hnr7YDqQJ0lrKE22m9dum0Naf+gF86zWepEPJ+r1UOX3gglJ0rOUl7M9wPdxJtfccIkCBQpMMEy
 kMss3o46CsMxzjiRUzGS/Ecr7LKtt/veflRX1EZCKxD7atgpMicnQH4OATbdIpbxEQFPoxt+UQL
 qCgu9dUDsZO1v9Ndl9PfSWW/StLxsZBm1921sidEYH6VdLeOjxJCo5PN21oOAO3HEFywE6JHgRz
 CiHpw3YP30BxLJo1oeoiUBPA5PeiMyn2jX8qMVg+9C2GdLg+WnX976NSPYn60EGmwYAJ3F3cnD2
 XmmxS8Dtz+BVZ3/jF0w==
X-Proofpoint-ORIG-GUID: HJLapLdwGSoMtnfAH7cfs38PG2GaG23G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240091

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

