Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084953148D0
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780033; cv=none; b=lEp92cqR2DDP1H7YFX6arThvM3xRZEO8fAb5rML7fGCl6XAKxm1BDZk+iTf9+l2wVH+236WxjWEfpzAZHk1sD6NfkMGtjWgMroczy00seSCZRbP1jasfPq3b3/7WBLjBMdaWQlgKxUoO5/lcOJUF3y1Jl5B5sl8074dilmwB7zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780033; c=relaxed/simple;
	bh=Lx5qLwYek3xBbqB6Gyk2KNpSn1xl+lJXHvDuK/KX52s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qd8zFRZoNz/vu7AVLd4daFmVSg/pjqpZPuzXuYn9ohN050rU8SMup6wehnkeBFDMxY7rcgm37UMcyHOJwltrnpAl6iVhzs9teUb4YTzwk9N4ACzdCslfN/RU+hy25FEcmoP9q/SbsQD8AfV1nPkr4qx5e77X3VS1uMXniNpEx44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3EYhGVa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/m253zd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3EYhGVa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/m253zd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Gvo9k2393648
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 18:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dhwJwuiCJeDAcgQZ39mym4QMu671SPGhRko
	VcMsbpUw=; b=Y3EYhGVaJwSeesJ4FunGRfoCd8YSJ1qdvQAzJF5o5+gOFPG7tFi
	PPRGMmmHvSuhogJeeiHB+t4Au9u6tydboXmyb1Cp576i/u93TreCRWLczPVbvynn
	8CAZIAdBhTMbeklwq1DV/ni/MxxOI353bhkzi408RkrxSp8O/E2V3MXbb/N5GNA5
	KTpOHEdbBiKH/cLUGtaJ0hP+HOXhGGT1qvna7ypTvDt/di8HsQUS5cmgB2WRpvXS
	MgSx4AZT4R4T4D5wI4NLqLXRzstmd2laO2dvSQbaPbNf4PiqcZPBwBHxTssRlHS7
	ItGASydylQhCkr5bz6clhIgbSJhbDWEX44g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftwhdrqev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 18:00:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848568a6f62so7326109b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780030; x=1786384830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhwJwuiCJeDAcgQZ39mym4QMu671SPGhRkoVcMsbpUw=;
        b=H/m253zdYnWyMyll4J7pIB6R8/Pljn5UwNdX3G7ynAC3TjyyaEQCyegXP2Hg1WYND+
         FkC5AYD2UEelrbDwDN1OrAsxgpc3daKGdNUZFfpy9Z5EzcckT1MKQDL3V3xiP2hHqUKM
         dcoKO+U0yex9C0M6z2jJ3nQf00tlzX8e+spqPBgLSuSlLUsdX7J7hhlZvcUUhelPHqO9
         EOV5VS+p3w0MuhASI9EGNHipGcak/kz7BWD45rjskCO1Ck3GponXunFGjcWZG1zL/SJz
         yP5vPeF46H3VMmDjx8Qzys1aY7jgdxaaLofd0zYZP2Zei98AK2PiuVJlRNa2nVtG50rX
         Kbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780030; x=1786384830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhwJwuiCJeDAcgQZ39mym4QMu671SPGhRkoVcMsbpUw=;
        b=gtJ9LoibppE3pz95j+CzxPeNUVdDFq0SO1yuTVWwSg/cBMHuRjOwUmYbFodtG2sUWc
         k/O5J7SdI2zhXuapKpjbQg7LvnYYut3Zky+RrZrw51G+BX/xole6kxf/QrfbFq99GoGu
         UyUyumgWUvgafzWgybt5z5D22z1tw6914KTjELpxAIKf3g+PLckdE8YV3okT0turVDyd
         t561BX+eW3yasZOFadkUg9RLIjysdleT/CKOtKQ7//sJ64bl9IDTKRXzEKfbfQHXH9zn
         VwBZ2KwkdaMLzBnP3Uxqk//VtDIwDD1bq4bE0jwCYYJK0YsyBcNgSOndSQP+p//KN9Kg
         9k4A==
X-Gm-Message-State: AOJu0YwwFuQXOB9AfnFlEwzB66HXx29q+69FtwbL883Ir3oYRVuNvIQ/
	oLO+vJ+7XS31Q67nWEokElccVT3XeemKJ1TZtyx6Fkaf/iuu2AHb9AymEGD+IIaOSEeH053lhrp
	4w04D+FU/8H7WMAV2gmKv+Lal/1ufUCGrS58cXYRyMHAmy6V+HS1zr3KdChAZabMtNeow
X-Gm-Gg: AR+sD121LxDMBJIHOBNz1Bxbxx8U3GuGlvegPI3JXG/seYtVaGxmpFRJXFKsRqTXa3a
	g3Vw6Uo4/bxiEdwHGH7tOAjUF5PyFPoAqhGAXjXkfvBgtXgnPLv4uPvTttOLMqimAuv5SsS65U1
	+/BZ+193yxCYYw/b6/+1syrzTSmIMUHAkrjfCW1YkulBqZy4riFmNT8updgCy8l6A3b4JOMLS2v
	EKj42c/GKwCcr2RulzaTbqKNlS1MS2019ZkoLp39yjzEo3JZdJQkYC2ZPSWpsds6FUP9JvrKJSF
	eYPx0OweTkDiloZtsVp3joHykDtqmHyx8OHbs1In6Lx5YjxO8onEl1Mubfw3aEtPHeb7GSJYwl7
	fSqPBT1EOefdKhzgoqq+bE7iQQzw=
X-Received: by 2002:a05:6a00:13aa:b0:847:8ccc:d7cd with SMTP id d2e1a72fcca58-84ee48977c1mr9682507b3a.37.1785780030302;
        Mon, 03 Aug 2026 11:00:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:13aa:b0:847:8ccc:d7cd with SMTP id d2e1a72fcca58-84ee48977c1mr9682448b3a.37.1785780029519;
        Mon, 03 Aug 2026 11:00:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ebb9bbsm3920533a12.32.2026.08.03.11.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:00:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Make SDX75, Hawi and Maili MPSS fallback to SM8650
Date: Mon,  3 Aug 2026 23:30:20 +0530
Message-ID: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zf4t8MVA c=1 sm=1 tr=0 ts=6a70d73f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=nGdlRpcIv1g6ZF3IhIQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: DnDQHNxkHKdL2kACmOVrsQuaAzpRuM-v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MCBTYWx0ZWRfXyoKwFWGRPNVP
 yW8uOrzLMLoiusIgMKjm3r3joMo/YAmQL3D0sdbOXs80s9B6z1g3ZAmsExzJAnph5ai/qnD25Tr
 VlwcwgD5uLCH32Z/J51MJjkqWHfCnEtUiXvHVBfntuKoR5xzDymlKRvfmngflD3mWpjyAntlj7k
 jiIYFrbhD4vKRr0E3OaX6aJbODeOIQpRXHuCc68Iu2N5YIkXK7zQ+uMTbeAZ6NxjIg/6C7HkA86
 /UF2UEU4S+clska3R9Uxs/BEruclR+jRN8sVQYnTx20k2MxP7enk1yNjy4Q5NxyZMDXRJPMGtSs
 dkux2WnHShgLgNQEDAIt166o2CFw/BLn66Nf01ZduXT5Ym4VKocbN+T1Q5Hn9M1D9i8Q56bGsg1
 f6EdPwAXGG3KEXZfjh3P+ai1ZG9w0l3kLKB5pAA/+XLtI8wx89JZwSbpJh3kD3ys2AIizLt3EDC
 OWU6zOyX4Ocv1a/VfAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MCBTYWx0ZWRfXysSqpgAPosTM
 bnXiInHQU9kNOZ2hUoXvgIAzFL2/sJy6d0afnySBfTh9FmZFlMMdWNXELGTWkDsLVdp8F0EBO+w
 u7wIFY00MlT7ocv4xF7DvZdnw7FXugI=
X-Proofpoint-GUID: DnDQHNxkHKdL2kACmOVrsQuaAzpRuM-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030160

SDX75, Hawi and Maili MPSS are compatible with the SM8650 MPSS as
they share the same set of interrupts, memory regions and power domains.
Rather than describing them as standalone compatibles, model them as
fallbacks to qcom,sm8650-mpss-pas.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index a062188861ff..f722c55aadf4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,9 +18,6 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
-          - qcom,hawi-mpss-pas
-          - qcom,maili-mpss-pas
-          - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
           - qcom,sm8550-mpss-pas
@@ -49,6 +46,12 @@ properties:
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
+      - items:
+          - enum:
+              - qcom,hawi-mpss-pas
+              - qcom,maili-mpss-pas
+              - qcom,sdx75-mpss-pas
+          - const: qcom,sm8650-mpss-pas
 
   reg:
     maxItems: 1
@@ -205,11 +208,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,hawi-mpss-pas
-            - qcom,maili-mpss-pas
-            - qcom,sdx75-mpss-pas
-            - qcom,sm8650-mpss-pas
+          contains:
+            enum:
+              - qcom,sm8650-mpss-pas
     then:
       properties:
         interrupts:
@@ -257,13 +258,11 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,hawi-mpss-pas
-            - qcom,maili-mpss-pas
-            - qcom,sdx75-mpss-pas
-            - qcom,sm8550-mpss-pas
-            - qcom,sm8650-mpss-pas
-            - qcom,sm8750-mpss-pas
+          contains:
+            enum:
+              - qcom,sm8550-mpss-pas
+              - qcom,sm8650-mpss-pas
+              - qcom,sm8750-mpss-pas
     then:
       properties:
         power-domains:
-- 
2.53.0

