Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5BC43CED9
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768853; cv=none; b=ajQ3TA479D8Q3Al+jJj4CE2ZzvYMawK8e3eGXW7FR1Wo1nHFE0EhMpfAngj25xxqFbJUAWx/Em/qO2RFTCHtPvEN3IM9A/f16T7lcLxJFnX8wbXdND9m5+fyyJLFVGaA/GhoaAPAkWpA9i/DfNBgAjNeUxeJlrhwuBOJ4o951+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768853; c=relaxed/simple;
	bh=BsLapVmHLCuAha/WZ1wZmmEpvmswrlNrfZQt0WPobwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SyHzMeFi+BdUOyr7Wn08VhDA7mCU5Xu2rYXjGGA6DcyiI3Cwm2WukyfggTE8CtwKR/TFvytAdiuc9ZsnPCI5jYxrPQ7GMJCIIRiOJbb7GK8CstvXiMgAdLnpxwUqICS5ldxHpHhzKeT4PDNrFieLL7S4VPy55+gSh1TfOtvj+Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ECLi/QlI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+QQ25Z0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ECLi/QlI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+QQ25Z0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687785kj3687791
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VrLDfiRoP0Ay2b0G2kXIVqGEBpJBYH5iJskHBkjiaOg=; b=ECLi/QlISQRUMCAM
	1gNbfghkl293tPZT7UKw+lELcaKKvnXmlqAEv2R2zzNFWQtPgARL47adq1pmkzA2
	SeX0N2NSA2gV4ByLuEACIbC+XOlfaZZ+DIGRwEfXSqs1KFCwo3DzrzaNScfLL9Hf
	dC88lbULQGjbhCHXaTZaDTtAI73Y1mzEIsRBCkf8nJM97840j1D7Uvt49GUgCu0V
	VC6O+IvW0H3Ifpujq3aCuoD6KIks/sWjXA+sLIpLlZ7KYXemeXQeSjLrDEpDaK5O
	qvvHJKYm/l0eEVLxBC9xrz9ZQqDMBajz18DCuyK1X166o//QemHhKGLb1WSE8/Xl
	lNLm3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga37616x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:14:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso4081814a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768850; x=1789373650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrLDfiRoP0Ay2b0G2kXIVqGEBpJBYH5iJskHBkjiaOg=;
        b=i+QQ25Z0HUP59Z1KLU6SLgx4dAEtGMA93NKNPQtWssBBiA1xMS4PQiEjNl7KZqV4Ch
         oXa0eWi0jbU888gdxeAffn6xWVYoilBw+rIIvf+ZkzP6ZYl2YxAI7lGF0J/06OUEujxb
         QL491BzOGcE3i5090XbqhnFxy42I+YSGlILEwocn065pGIbKjD61c2O+l40pN/v/BZTn
         4WUOZVwcF9fDpjXimJZUT+pDXYOYa9VhL04brJYTvak7FSS5Sc0voVO3T5V8FV4Irvis
         ecxbu4SENJBfdawQWiCs3DQ5gVnGZe7dAwG25fc2rfnY4gXstnST0qXfvpqWcNUhEcwC
         irhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768850; x=1789373650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrLDfiRoP0Ay2b0G2kXIVqGEBpJBYH5iJskHBkjiaOg=;
        b=f17FvMet5CQw7pZOTYd4N+VEOScsvu+ErldoYepwASDLb8JS6aCa6D4JQ3w8PK4WiT
         7/XWDYrD3AGK5UfcQcPz6JVIn4twjRRJbmLK1ZXBS8owSDZ2QXcdu7044J3rRsXJhOrg
         Ge8IKjIQxRh9r7gPwqN2ij/szq4ogGrcYLjQhgDzlPHRSEG+Lszj+jOwRs01EJJAnGTi
         J1dr4ks7ByLL/omJD1PerkU5OdYBOkNV9ZPzZnezcP/vADQSR/zP67OXITMlN6voGYZW
         cjR+ShRXvdk4XpsQ/Lt61yl/3h8Y8JBkLet/C3Q0HdKuTjyDfF0/146dX4RcfaJSWq4B
         8L7Q==
X-Gm-Message-State: AFuF++ln4m7CDseMRcB52sL27SbJYV1IVFMyF3HIDOLCS42lMnNbE+NN
	WgjOAVRcNOrH056QF1nn5FzW/alNQCyqLJDayZrhN9lcLwSrb5Bj8Wf3wZKJZdUnKjbie7ryRh1
	PNUFINNdoLGmRKKLiIs5FfXBuf7zKRqpZ793kpOCKx1zmAzIYSu71DHWMAoxr6gWE6+8o
X-Gm-Gg: AYBFou2nEasdhaE7KA3T3lNv58wVYM4CrOfssveWwOFkN7XYetqmi6dLQbrKUpju6ak
	CxwF973A/CrvHy50WWsAcDmwqrb8TsQePRcZqN5/dB2zCcGusoaV9J4T98+F2xnEOZfcqseBm33
	ECU0KkAOpOGegiF1hKtr6vQmpCoR3fw8j2s6gKQgJV8rZOlh1JHdjLX7jFN29mo6LrIUpSwGjcf
	y/R/UBmqKoyLjvGopX8hjlh81dt+QxUero2I2Im2g7ez7r/82RjkJq/8KF3aPfJPcUAj0sXo1E/
	B/hOYMD2zLVCvDvibGa8bVhBGrBq/Us4y3vnd6P1AnM97lvDZN6+XQq5nq5orzomBhyH/udHjyW
	G8yLnL6fp/EHKXtHeJrdY194h0txT/i8=
X-Received: by 2002:a17:90b:5606:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39b262dfaeamr34470876a91.22.1788768849441;
        Mon, 07 Sep 2026 01:14:09 -0700 (PDT)
X-Received: by 2002:a17:90b:5606:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39b262dfaeamr34470799a91.22.1788768848942;
        Mon, 07 Sep 2026 01:14:08 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21724220c88.6.2026.09.07.01.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:14:08 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:43:38 +0530
Subject: [PATCH v2 2/6] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss-v2-2-75f7982dc983@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768826; l=11025;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BsLapVmHLCuAha/WZ1wZmmEpvmswrlNrfZQt0WPobwg=;
 b=icDMYzn/CGBOkbtsA1kf0o53AXSHvnNDGETFZAJcVIwuq9MbWPz/5fZ8dE/qwLTbo/x1p2RI7
 k9L1d26uvqlCqOAe4bNr15q7sVqHkHY7hnUT9vt3AplGxFoBLccoGtP
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: i5hCAmxyjHbbEJbhlJ4uG_SHftcy6UvS
X-Proofpoint-ORIG-GUID: i5hCAmxyjHbbEJbhlJ4uG_SHftcy6UvS
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9e7252 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=yzr0uxE_ijXmPgLYsrIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX96MQxZEDOpJk
 YZVaPOD8R1G6UsLP+xI5gMx+8OvFNo4tPwhKjXgeWLLu++jkPducXHWk958RnNIs6WoQDQu+0B8
 aDXX5RKH0VTN1WhI6f/5vN/mtf8n9Ps=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX14t4Fsr3Os+P
 DSpNUXy2xcBhEFrPbKPJrMiIne6qyDUnOAlVOE+XEushaFn8NdWzhso6JjY/hXi1Thhq0kq1TH/
 JGF11CZMXs1z8Y4CpJpjzo/TzPpAwaQgAVC2ESa9zDEI39s8TG5QTCYkBHajTBW1XUyKnFsZGey
 nOAXX/DknwCsZufg005/PwZW39ADDc5U+6/wAtebrjExXipir3Pq8A1hZ0BKk2eOdGDa5SnS0cp
 CUYcuuuYXuG6L5+DXfY0N99ugA0diSgA6K3zHjl0jz+WbrKK0z24Gz3GmsQnZae+WLL6VdRwWXY
 v29Q8f6Te6N1ewjLUeipzXONfaHWiQoJiyRUtgQMBTTpnapZk1TFQ6EqB46+YzbmxIvAwz/h+yn
 D7aOuO9p21V36sFHr5JQxWvByzGCktnBcolORO5C32a+UkHdgM4nuqEC6BdKrJUi1pOWL44dPvq
 JRPqb7XRom5IpRlruiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088

X1E80100 supports both the legacy CSIPHY resources and the new PHY API;
Glymur uses only the new PHY API via standalone phy@ child nodes,
so per-CSIPHY clocks, interrupts and supplies are absent here.

X1E80100 has four CSIPHY instances while Glymur has three
(CSIPHY0, CSIPHY1, CSIPHY4), expressed entirely in DT.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-camss.yaml          | 300 +++++++++++++++++++++
 1 file changed, 300 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a0b77edc212319fad69113f3d55ca24f184d4b23
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -0,0 +1,300 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur Camera Subsystem (CAMSS)
+
+maintainers:
+  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,glymur-camss
+
+  reg:
+    maxItems: 13
+
+  reg-names:
+    items:
+      - const: csid_wrapper
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 20
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_mnoc
+      - const: sf_icp_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE and IFE_LITE non-protected
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-3]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-gcc.h>
+    #include <dt-bindings/clock/qcom,glymur-camcc.h>
+    #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: isp@acb6000 {
+            compatible = "qcom,glymur-camss";
+
+            reg = <0x0 0x0acb6000 0x0 0x1000>,
+                  <0x0 0x0acb7000 0x0 0x2000>,
+                  <0x0 0x0acb9000 0x0 0x2000>,
+                  <0x0 0x0acbb000 0x0 0x2000>,
+                  <0x0 0x0acc6000 0x0 0x1000>,
+                  <0x0 0x0acca000 0x0 0x1000>,
+                  <0x0 0x0acf6000 0x0 0x1000>,
+                  <0x0 0x0acf7000 0x0 0x1000>,
+                  <0x0 0x0acf8000 0x0 0x1000>,
+                  <0x0 0x0ac62000 0x0 0xf000>,
+                  <0x0 0x0ac71000 0x0 0xf000>,
+                  <0x0 0x0acc7000 0x0 0x2000>,
+                  <0x0 0x0accb000 0x0 0x2000>;
+            reg-names = "csid_wrapper",
+                        "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                     <&camcc CAM_CC_CORE_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 458 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc",
+                                 "sf_icp_mnoc";
+
+            iommus = <&apps_smmu 0x800 0x20>;
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_IFE_1_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    camss_csiphy1_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy1_out>;
+                    };
+                };
+
+                port@3 {
+                    reg = <3>;
+                    camss_csiphy4_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy4_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

