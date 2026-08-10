Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E955437DAAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367038; cv=none; b=NTyPphV7UkelLAA31q/ZGVt71+1VOVCcegLusqjAjOhryVpwa3XWW94t0tpT6bWmiD25ZXRtFEKUBe3HZ/c5GqU6XT5MyVoZ75NtyzsJ3UzGWDJAF60AV7dfMBe1rCfOF1HhlDLMW/x3Gegx99P7W0dYnx5gldLQ9yd1nXfOHH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367038; c=relaxed/simple;
	bh=NlzhrkF7JSpIHBiXXSqMcyHhSGAiA8qh5mZEtT/g0Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOnQRKxgdbmMSqILnGU2XrhrRSv7eaxjDcl57dmeW91gPZV2s24jmrDJbaKd8Q9k1l/Bt1Cuue2IYhPIcmQtLEG6OO9fmgIyTD9A8Mfd51fxEHqzI4NZyKLFbGlIALypXntifm5Ba8TTinyw/sestl/p1hpb8WNfopdbeH6LTQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IY7s+oGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AByLXowW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IY7s+oGh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AByLXowW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj6mc2816484
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zs6SgYOQTGF0cWtvmW7156pRkDFZkuJqOnalOR1+T94=; b=IY7s+oGhbnQ73ds6
	ORMd8jDkWkQgxGBcOWnum7NYYrcAIH3KY0URRRWG444g4SzcG7xw2cQ+MJ4HxR71
	vWhYdmTWW55oLjAnC8FlslnR5C3+A0C7a2MapOf6KylHRv0WHAawcX2Iv0IXGahZ
	Miu7DIbHZjDfVcnWKFCfAxP753S/YQAFdhZ7AQg/+vLVDmykpWHAPTAVmpstkq6G
	JIeF1E/au8Srw8FwhJXE1IxAQrGC+Y7BtnBYLwgq8ZYYpljGS8s/wk76CKkjxJrb
	irANjtJx9R1kWKDMT3n3DXwp5o/mgF2aqV++Kbqu/7HWFCMIxhdPG18/vb5rvBD0
	K36lmQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy19kjmm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:53 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9fdc2870fso1106389a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 06:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786367033; x=1786971833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zs6SgYOQTGF0cWtvmW7156pRkDFZkuJqOnalOR1+T94=;
        b=AByLXowWdDVqyahV5Rw7qi6WB9+D+YRQdDm8di24aMDh+5bLUmdMpyxJ1CSmlpP0Ss
         BLccBjJ93V2bPq4I/VGal3gZ1UODGOw138SgXHMKpqHvnWuJiNt5bhIa5LadZsHX8pCq
         SL17yQhUg3R5k35a6bW8H7CIvOM6UB8L/hxCxsUUHDR6BGYJOjd+4GXJG6SHymM4gRuP
         HNN2A7yEXbk88aT3+yfbXl204JTeE7mXTTrZKuTtk7TTFjJgrO8saNNmU1xn9x04aULN
         3gwvSP2WIc+sn+tXgwpN0eYLkdLAqkVPC/zuFErpiXMj7aHgFFEipvIHkcYeCJ7XOsF+
         ikKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367033; x=1786971833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zs6SgYOQTGF0cWtvmW7156pRkDFZkuJqOnalOR1+T94=;
        b=ATibHu3RJjuwLru+du4aHXhfxjuXZ2KSrHAIxBZKLA34lXXjqBbSBECHVioVJjHj7W
         v4mhYcBHGaBMYF1VnLB04Vv+4BHSVdFv0TeP7XJMzucTHQIffrZNKIKVlZUdmsjgt4tP
         58apRkYUBeQpu7Txphr8mTm9NwTCfzSzD8rX6nZ/JDUMQsVoPDuVo55ZqWubfn01W9m2
         DHSVZ4nBA7GwqH6E4+nDJvMYE4Y66757nwj650aR+NsZve4VGQdw0eiJ2+ZIzWvnFpc7
         hyVoy2iOP79pIjfvQERgJ+TcZrt1jbh+B/ouCoqRLZIYMmgXGos2GD+JTYBQ/iexrg62
         qAlw==
X-Forwarded-Encrypted: i=1; AHgh+RqmG1jJ0nc/6eXLukCKL20BRSf6iP3JQcq0GH0W8P8mnPQh6y+qHB8RSD9hWz6sDp5SB9z0MjhdRa/LF9PQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwbbWBNKk/HIPWwjdYqHgmj2tjyC2wWiU0vM/eaUf1b9VcuLpwW
	WGuom/aC0kl+LrBfNZwl9saCbjoSm7ej3kpKjuxJ4uL6rBe4pa/uFZpfulF5sGTfwvKclxc0QA5
	AEy2WOifz87i5NPlfjxyiOvpLi8usQIP81smt4Z8lepuSDLveoKN6ewFGoSe6WGvl649r
X-Gm-Gg: AR+sD12aGuovkv4CQ9IliECMHNb06vjVm2/CpssTM3OMnncL1dicA7Hx/+yYI/8RonM
	dAZLOtDllfUowb1f+fs3dQMFC/2ADK/dPzh2cIWukWHfiyxaQPf5kvpwy/q5w4umdGojP/pvJii
	ktUoIWnd3AO8ZbHWhZP7rqgxjjJvnSNVkn5YOR/wVyt8+TWbJ79BRYvRvmXwsaU7EJvjMhzkLML
	1cgV8ViralkwwFWNpAXaw87GS3Rh46kAH0BpXviYeYTIPqF/7vVt6RrsZJINH1f40LBLVJ3wx8X
	3QxltvQ8IDIld4Pw7+T+sOlL/zGFoHFPWqBCDc9MTaK4RGLqTGhg4cYqZpCVC0CV0KYF9C56A0X
	uhD3EmP16/P9QHkFpymJyyZ9Tb6r1M5QKc1fPbP6RRicrShC/rXLlOQ5OCWLB0UIA
X-Received: by 2002:a05:6820:201a:b0:6a1:8192:4d89 with SMTP id 006d021491bc7-6b0421e7d1dmr10154898eaf.29.1786367032752;
        Mon, 10 Aug 2026 06:03:52 -0700 (PDT)
X-Received: by 2002:a05:6820:201a:b0:6a1:8192:4d89 with SMTP id 006d021491bc7-6b0421e7d1dmr10154849eaf.29.1786367032300;
        Mon, 10 Aug 2026 06:03:52 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1a9e431sm8218971fac.6.2026.08.10.06.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:03:52 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:03:28 -0700
Subject: [PATCH v2 2/4] dt-bindings: embedded-controller: Add Glymur QCB EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-glymur-qcb-v2-2-9e6ea7987b9e@oss.qualcomm.com>
References: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
In-Reply-To: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786367028; l=1007;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=NlzhrkF7JSpIHBiXXSqMcyHhSGAiA8qh5mZEtT/g0Ro=;
 b=L2SHP3y6AA/DefISpvsaBMmLdWIK3RGSdeFaTPtcM2G30EW8oadbFiJ0Ba5drx6CeG+Rs0NJT
 TRSuRq4gEWsBDOmExnn01B9a9iWgKnpVItbsSRjdRPFBY69e/8mzWc4
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: Sfn4_H9NkXqoHAQs-M4z8HprWarZRszY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfXybqHZvVx9QS6
 7+o112UDrsjLVwBfEnol+jCzHv0aDeab/NR2fw7Icl5aAaEl63ORsaeAfEtDS7DlCpvqRX5AzPY
 xxN+L6Eua42Pa7ooIUoUVubfVrrvBgySxPy8bvSndE/OKyn7TxequJLv3jd3M4SqfoG1cP0OFOe
 T6F+sPOoAdRHZT8MH6fCfGYAerG9jDWD5RS1em+z+XVa49OmDS9skctuj5tLKO1Othu+nqT+mlL
 9gf8KEleXdzx93gPqv/kqsrZi9ZgrXstlkRmc55+5K/iQrTVztp1TD9o29+6I1ROK8NjKgq0OZO
 i1ehg6Z/He3fQXMLbg4SEAxYlpbQuFSpGsJq6y1yyg8iViYhKcPlPvuEJJ2cMvvwaUFbcC1/tnu
 j1bscOjeohRPKIh4eA9HjdfmlClsn6c06tdkzPr8fQRApeLGjbs4FJuly3xGkl344Ta5ehEuA+S
 hzcEG4ZUlgpsuoaUNoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfX7GHsVDecd6SW
 hVYprJTlTs64FW5lITL2wIkuyH3q4KXKwbXCFVC+y9Xxg6j6j7vVP2hqGu94pthYOsbCUdjWcO2
 GxpndZn3IUjGc0iXkGXalgxFL6/k00E=
X-Proofpoint-GUID: Sfn4_H9NkXqoHAQs-M4z8HprWarZRszY
X-Authority-Analysis: v=2.4 cv=abxRWxot c=1 sm=1 tr=0 ts=6a79cc39 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=34zfTHg3cMDFYMdkEaIA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100112

Add the qcom,glymur-qcb-ec compatible for the embedded controller on the
Glymur QCB. It is the same EC used on the CRD.

Reviewed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..de416057063c 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-crd-ec
+              - qcom,glymur-qcb-ec
               - qcom,hamoa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
       - enum:

-- 
2.34.1

