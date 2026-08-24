Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45583E5A31
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553484; cv=none; b=t3wPw0S744xv+1JPp6W6AGRHvTjBlzElaE5fs7zB7TrhUOhGTeEhonWZZBtDpz/cH6onkdy3jjmVeV9D5Zb8zQhD0JhGSuGVUsge8ZZWTfXk66lDOqmJFGL7s9WQi33c+rY3y5R94f+N7X9oalEuDaQq3RJOb3TVDh7RlcFCdFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553484; c=relaxed/simple;
	bh=WfaCQ+41KJWCn9Zcqsgk7xOgN9BIyqgBEVzZ+B4Ek+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CscjjTJdnt527dgb4s6/g9vPR02y7FkL87Tem5gCjESW5NHCllE9W7CYMlzssIxq0fsUI1fFDBkuVNN0r+VgpHoDaaRK5pyoxUvma1gXKw1HvW9HPn5+H9RpVVG+l+syow+uQl5W+JV8n0DWKnDVYoW0CzKqKRahfXhacXOBaOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1sp2utC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+v5Jrmu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1sp2utC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+v5Jrmu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RBWi2058202
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHRCs5PMg7VixneuGCvyGoyiqOCJ63TfKuQmXV3MgOo=; b=T1sp2utCVlNYSWEL
	S3dtXpPC1yV4IX0CwuLxZNKMjvisf+8ue3KpZBp9ZkxBnY5zwPym8nbbR7QS+RWB
	DnmrBBG8n9fEasvTpq3H+TOEoUC6LskVWpy1ndCwKbPHdclji2Yoe1adFd/izcCA
	8WkPADfOx3kPwlh8wpXJWDyJbcIl5M9Gp4ElqKYHHK2PPjEosFmDmydvxr2/OawI
	rmbz6lz1ls/6Gd5hZDZGwmAr0K7Ed3R7lrlbGBxe+LpcfiMqsafDHKmxKwPQNtMi
	Jaj5GyLyEk90DSFtwu46oCPxM3QmjP6waA3i88J19U5U4g+oXnjU1V/I4b6GtGU7
	HM7ncQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr0wnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:38:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so674359a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553480; x=1788158280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHRCs5PMg7VixneuGCvyGoyiqOCJ63TfKuQmXV3MgOo=;
        b=O+v5JrmuVhgSTLkpjMDaLQCwWAIqi5eJzxqbbx14dpXUBHTuV9hRMYfpJojbDosHAI
         5N3ejDKKbCDY3G7QJRDjmu5jZPuJUgnqYmQ54N+XJY8X1rfOFIw0/W+kxubbO2Jm1twU
         s4FH09v0uYM1HYgMF6k0SSXds2uRLMTfzJEWDvC/HgrKhotlYaCkB3FG7mXI6ODq8A8e
         UrFaqLwk9lhGgoJ1bxS2f1qx0301s3BeaMQxZv94AFX5yCsVl9AdBkhCSTtUrNKAYtWW
         dFJs5LK9HY+mfyhbm2V8HXLhPfMowg8chjTZLqh7eNkN3vW6UkSc8ePliJSIFQF8EsUd
         C/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553480; x=1788158280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHRCs5PMg7VixneuGCvyGoyiqOCJ63TfKuQmXV3MgOo=;
        b=eUeHtlUlDWfpalG4rD15Iji/8+l14umE3jpdTgTo+gD1x6dPIy+J1uNNYEvgMH5gyf
         hmeacW1B+AP4gQ/RhSWc1W/JiixG+iFp3IgBCIeUuumeOvp+AOq9/Cyy2NyjMKFUZGUh
         L4GdNaDyYFDswXjHcplPWROaUHZUCO9mJN3xbn//kIQbGgfH9/2Tkb/foP6XysK07ky6
         PPCiT4R6q3diQJIZV3lPUbhUrhGlNh/dlqG2T50dya3iURJlCGrlPvC0K5ja4W2Hxkqv
         nsovsJqLVMeuUZgEn0a8MF6L8+A7F63unXXE8tnZUThPEGz7ml1XkDHHrFe1s1L5vB5b
         yI0g==
X-Gm-Message-State: AFuF++nx/P9PLXthVf8hRnkZVfECq77/HKvO9E8pAZbdMi1dk/O5iuaO
	+LsbFyrF7p1rcpuqzxhfn9WvTI0nSFuvIxY+EzvriKUabkH1wuEA0ZQrMemDCxxGyZxy71OoR67
	Sb2KfzYEO7KwhFzffjsfdqn2AA2PjtBQxXzjU2XbO8r54RbFQ9j+eDbAHrwC2Uw4uWXhT
X-Gm-Gg: AR+sD11dzlSE93FF3ic6+ggMFqje+OC92dCm4QkJUK00g2jbRAhABetrHiSytsqGKr4
	1OmVGC+dxzZBhMpZOeUEGHxWhodXBMkPHnB5eqJlVbPm4iZvddT7HSEKFnK+vRzf2pmb1p5PXAz
	walg6uaCJ3eV+bCRsd19fe/6YaSZfl6KchPpC62H7nGtUrJ/ETRL7ani7CERoDyhfQ7bXyt6kn7
	Wd3SsQ6bbDmwHn1cYS12dxb8NcmJLktS6dt9p9aDLYJMGVd41GRzASyBSpqkPRjqkdeot1G9OF9
	c7jIHr3ZvbHbE616f8piKoRi2gO9x6uWFbYt6Og4B1rqOzAQqD/e83dLcaXzAfGc1hAZfvLaApU
	0dWOhyUyWRgZ9BkdxyyaJJkWzZBuP9ph1Q825nC0xpJib5xskamKJUA5fSOdhcydkR9YDUGZEOP
	SqG09XW4SNskLLwmELTrppG5dZksT76w==
X-Received: by 2002:a17:90a:d605:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-395df5e8fefmr30332581a91.16.1787553480083;
        Sun, 23 Aug 2026 23:38:00 -0700 (PDT)
X-Received: by 2002:a17:90a:d605:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-395df5e8fefmr30331676a91.16.1787553474536;
        Sun, 23 Aug 2026 23:37:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm21667830c88.10.2026.08.23.23.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:37:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:07:41 +0530
Subject: [PATCH 1/5] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-phy-v1-1-257d68a3210b@oss.qualcomm.com>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
In-Reply-To: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfXzq9JcBcKBd4K
 LxDUUoIQDDX70c5woFsy9pgfgmTPVssIRHh6VlUjYwC6dV/5HNhfJri69DY1w06JFmNtbJ1PteW
 kwLuTSCldMaUGjlXqqMn4qNQ2zp+w5Sj/lDVKB+ESiUOM8zlUjZTMcBefH88u/BB1nyWTby/Vp1
 cBjdRTKicLEWR2bBf69rgujDqJOObvweAc4VQLZOusXAy/M6Cw1cTRn7Vxa4MELpFVcADmP4IAM
 g4/vmCnKCUcBAOxwJqfZrfGsxkKgwOcL94turnBkYFxE2ZKRFJ7cTQic9XUcR7W4KGSDM18KNOb
 4+moGbxdCZNrZi/pj/gwDxyEtIWM5jBw/sc4IieyjXHYOfrh+6qipvEU/8mdRmhLnZlXVapQA7T
 dtUFmJdDa3SgAGLdEraBcUoNdqkwq1CNTWVAI59O65g6ZQoDTnZ+15eXhaCzb3rPurckLFrlU6U
 au9YtylmNwcDkM9AKrg==
X-Proofpoint-GUID: cckYzHSUVeud1hocrHDLbLSfxdKwptxy
X-Proofpoint-ORIG-GUID: cckYzHSUVeud1hocrHDLbLSfxdKwptxy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX9y6Rh6VzNsJ7
 VUlZ1kg3LhvTi3CFBPGK/YTLnOXXa4m37kxGRQsaITK8YAWz44p55tEjitqbd9Gt8a6k5aIaE7y
 nYQHo4l3RC0YfipmBCzoGWxq9DKfRSg=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8be6c9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240057

Document the Qualcomm IPQ9650 USB3 QMP PHY compatible.

Use a standalone compatible because the IPQ9650 PHY has register
configuration data that differs from the currently supported SoCs and
should not fall back to an existing definition.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 01342823e57f..746c5a331f48 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
@@ -102,6 +103,7 @@ allOf:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy

-- 
2.34.1

