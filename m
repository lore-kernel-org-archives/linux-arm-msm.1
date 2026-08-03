Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE444334C4
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 19:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785313; cv=none; b=N4esaXnziBkqID9DPmMX7ekHuA2balOcsOzRx9vS6WHNfr9ZdDPDWQ2xALZIlQCPr7TP/TdZARCIDwf2sbre39/52krU32XkGtGKsBNn5F+o5Jgv1TwiWr/ijqAwh+9tYu+0pU5oXSov0AT/erdGYmZxXF0i/G7FaNkkDx1BWO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785313; c=relaxed/simple;
	bh=YWYbD0q8q2lnvrPo99IiSTGSHkgWn58Yw9xClj8ECs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnYAcAUb1xMKB7zL8wxF10r9z544wkLkhrW7l9h4vjGs8ghEvPLW5Vlsj5AeDzwvA+qOG+bF38pIQOvg0E16bMky+pcHpzCltIhv9pqa0OcRZJ3/yphENoayw1ohqzMZn7IyGvgdACJfPJshfX7DwzERRnh88F/ohN19vuz482E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKv83HNj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NO/nOMDW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKv83HNj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NO/nOMDW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gw6K01737898
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 19:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HclC+S5vf6/LTROVRpMjq0Vwx7iLZ/22m52hp9ae4Qo=; b=MKv83HNjZ+7b/Jxd
	0Z5J5IlWptIFOti0yCc3dby02apnsFc3yKKWnwIMxWHhEGj73VPHIfvrqPy8b3M0
	6oK1sGwZJlonIZhbLZPGXCU9Z3EOTXDbEkZVasIA+IVaBk3j7PDiAkqc/FOWp6Jb
	+YD0zyWWrHkD9CvPWot0bWF2wrhQ6tiyDFnFtNneqW8cEPl2Bq4tTB8iNGkNTEK/
	INfKBrsby1okGiJg2d1CHbldQ/G5GcnJqC5dUkxA543zn82inSwLLGpkV43EqB17
	rntMZUkBnotd8GSnxWOLXB0+6sFUYA4dACfy+tAWTL+or7O4dgolRWLf3Wa392x6
	vAJbew==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrdbd8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 19:28:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848662cd2a1so4819089b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 12:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785310; x=1786390110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HclC+S5vf6/LTROVRpMjq0Vwx7iLZ/22m52hp9ae4Qo=;
        b=NO/nOMDWxUYrw4hR7ZeGFQKzHjbV6nM607AQuJFOl97i6dd3a/xqDyNkzpvQ8YoU/X
         JpfMnMoJTZmbHl0p+pB3mNhkuHGHD2RbVR0Ooa1TFWnV/aLqenWfPY6/qBTqnyqKhG21
         kEN19SAcxlnxW2V7mGvBwYJ4ZCW7P9PPS/EXk0zSdscs2sOZX406BOcQHmEkLjcrnFxG
         WIUpuQq/LlpkVE6a49TNJMua94ke2s92yA0XL6AmOZVE6mqV1tlXUT7Mz8M1Mgt/jK2c
         Jd+ymu1vtYmKXD8soaayEJLwGFU0+3tSRPZupMq2jjfDTTFh/lubR4R5hY56RpMlB11C
         KfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785310; x=1786390110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HclC+S5vf6/LTROVRpMjq0Vwx7iLZ/22m52hp9ae4Qo=;
        b=kOidcyCozg6rFoLOBUVqEol7h2z3U/boGpwPTDnLVh+P2tuS4/6qMLaNTvkerA37nO
         njrKgwNJd6vvGpkFLAThEh+3M8PD6soU/1wr3hmrNx/+0arSmD5rmF61ehrDSOFbJ3kt
         D0hDpCV/xVMvSLVoUyXDFwnAllTqksYICJYBkrNkPcQisy81oEvwjPnrPbs34fhqQX8Z
         NDht94WMvRrSOGJSEu0QNGjF+FpZmcz/QqVEmRavpjfKBUiGdfctEjQ42lcbkG9Uwrcl
         XWr/mZ99swcy1UN4wrhp+cpz/tBwzOrJtUeCuv/+ZiSPw9+JY+Q0WHUG75iDlSZSmjrZ
         KByA==
X-Forwarded-Encrypted: i=1; AHgh+RovLAXlt3+fYlZMxWQ2aEcLaS1XufnWHwhk6OELA4kmcZ0A0qkxIHu+pNtX0ogH+Nr4SsOyoldDq21Rec7X@vger.kernel.org
X-Gm-Message-State: AOJu0YySqx3ADfH0ZGkXfotOasp9LROUu9aGmdVCCafBP6vX//dOdACA
	iHNEtLYHumT4hOj73xuULYPme9W9QSLTGZ1pcpkog2KvTn9CZaUc9vj9oqRtGxwKdUNwYwc7GKN
	uu0T/OXClEKlC+ARGF+EFjeQ4nBTzZJQOp8IdpUlRoueeAH/WXGTm0w72kjAUmj9WuYy3
X-Gm-Gg: AR+sD11qjXRxdhSY90xQENe/w3c/j+34oxqhyDYd0wAVBQAfltjdEYeCvkxshGOccBv
	BzcQOzzG1QmZ12BKZtqzDOJkhM4q80EzCD5C5XcDt+moLtdZR+L5o2b27NuVDpLkp9mHUrPudw0
	OPbxxtWhvBVBi17fZPA2LjlD3I46uFVP5IxJycuyIsJ51Rv3rw6p7xUTzgZwkdUzwIvol1JICaG
	jY6z/H/Coz+k1q3I6fCuPfD1laChYmOzgEvAaoStdL1+9dh1BrgH1y114lg8vSe44V3MHC78saU
	M9snPXbTxiRhFUC93MNbWbClPnfsPlwmFULJfO8vYV1bUbh3GmcpalQ3sV15f7A2IpUJDlQP78a
	+JWpjGzP08NxiNjfpVECYrBhC+SzlvQ==
X-Received: by 2002:a05:6a20:ae24:b0:3c3:7dfd:22c6 with SMTP id adf61e73a8af0-3c92a993833mr11259804637.73.1785785309706;
        Mon, 03 Aug 2026 12:28:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:ae24:b0:3c3:7dfd:22c6 with SMTP id adf61e73a8af0-3c92a993833mr11259771637.73.1785785309284;
        Mon, 03 Aug 2026 12:28:29 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm38622738eec.1.2026.08.03.12.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:28:28 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 00:57:57 +0530
Subject: [PATCH v2 1/6] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add
 named voltage rails and deprecate phy-supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-b4-sgmiieth_serdes_regulator-v2-1-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785785297; l=1491;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=YWYbD0q8q2lnvrPo99IiSTGSHkgWn58Yw9xClj8ECs4=;
 b=pOUiChFzIvvK9wZ1KPURprhUpB+A/vwjdIqvCvAzA7h66V0mllS7lBKcMcrpIu9jB8MlHjhYr
 gZfLPs1xcotAncMD/WMXttPZVjzqTSMCsa1iFsbuvHlXsHGbnNkSOxB
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX8s32p62Ztl1g
 FV4AOQH6Fw/imclnD4fxme6Y6jfLW+2MgVDH9xoDNLqgDLkXRtOe03LY2VdfpvzpXBN2RWcd7gj
 ZvQbx+t5gvnkSnGKBDxMNpDVtoQdByE=
X-Authority-Analysis: v=2.4 cv=f/94wuyM c=1 sm=1 tr=0 ts=6a70ebde cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=P3Ghqcg4OsJIeTKxcIgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: HEzy8oj90SgIFSqwdyufjCL9_295r3GI
X-Proofpoint-ORIG-GUID: HEzy8oj90SgIFSqwdyufjCL9_295r3GI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX2TgxtckvcouB
 88vHdyjn3gHkGE91W3VgRizwBb/X2bg5U6iLHwuRcPIV0iLQpMuVj+Is7l1mcPYtI54Vu89Lk4b
 75lDlAdQ+zUGYyNdGZ+PdMDfnWeIXzJyg9Zh37adSgfLBFJS8JH5aCSkWBtx34aVvxD/fKo2Qwm
 b2Mxeo3npKro0QI8kkJFw8W3JLJvAqhej/7nXLsGOKK0CIbjp5if6wg2l555UdgUDTxX42zvy/u
 /wmlY80v5RW1Ak4nN2GWDT6w1C0fIw+/Gx6sagNLbLeLOs0AbvYFmZHxnjBpjOuZJASbG2el5ez
 VJtMIOy3P8164WfMCrfa7eizWW9tQ9A7BBg2ql0N0akbvLHE0ob8h7kqzk4FT3MR8B68Sg3hWGs
 NJj6LoElXLB7WtO5fNRJFpBSsBN193Z1hePeLZ6cN+Ir2etJMtikymOFDKNkiBz2DWQmGchV35u
 pBZ2DLYhK4MD8BthhXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

The Qualcomm SGMII SerDes PHY has two distinct voltage supply rails,
vdda-0p9 and vdda-1p2. The binding incorrectly described only a single
generic supply via 'phy-supply'.

Deprecate 'phy-supply' and instead add two named supply properties. The
0.9V rail draws a peak current of 46 mA and the 1.2V rail draws 15 mA.

Fixes: 97b795125704 ("dt-bindings: phy: describe the Qualcomm SGMII PHY")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
index 90fc8c039219c739eae05cc17108a9a2fc6193df..e573abcb937df914ced25ec87add7955bbba7b87 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
@@ -35,6 +35,17 @@ properties:
   phy-supply:
     description:
       Phandle to a regulator that provides power to the PHY.
+    deprecated: true
+
+  vdda-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to the PHY, which draws a peak
+      current of 46 mA.
+
+  vdda-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to the PHY, which draws a peak
+      current of 15 mA.
 
   "#phy-cells":
     const: 0

-- 
2.34.1

