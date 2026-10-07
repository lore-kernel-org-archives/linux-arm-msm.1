Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD9C40B0E9
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 06:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355874; cv=none; b=FvX/5GjZPcrFF1UOZgNF+3CCz6GWPtR+YnKg29lKAN9GhZd+ab9g+MAW0RBbmnnhsqy5FrhveH5bN0IJhWVCU1O0qsgxRmCUBRigwYJcVJ5GYKv+xwmJKyYut53pISNwAtxfxqCeqH1WsZun3SpClnBw2snO6QMB+TXjAKz31IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355874; c=relaxed/simple;
	bh=Wcv4ZLmmvdfjbZvLQSsVP39AR6mMz7RNXcdhox0hcvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=in7nicqo7/+YTiaBR2GzyWwsm6WryBDaEA2J5vO943VC4fDIggp6nO0SMrvy58yMPYqrvA4tlOBu3HWZdgo03lutaYOXuz1yEF4zaVEPeTBDxdR0UNJkGeOIGh7hcKmhH06y+p/+n9YehNFFe8Rm1cHF67v6vy8GqQrXN830svU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHJpZj48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjjXVb23; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHJpZj48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjjXVb23"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974ULeP2551389
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 06:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VbnQ5UhdwkF2mB+kgRVrvAgOBOsNAgejHqFSdDqSGng=; b=HHJpZj48q/M6t8U/
	t+Pl32OOW+6+BXS9E8/2oM7X5ul4JVr44NB8pSsRP9Xwt5c5bje/I8nCviU45FeF
	5hFgZcWzh0OrGHmDtR+2x/ZMUoghvIDYAiKSrCXlley8Ct3E03DSmKpWvd2szOlW
	k2ez9vJsiGvr5/eVyjrUd38TTVuIMwbGi3kKZfUs+WKCqk+szL18WcpD+CVXLY9j
	qc5QgOcmdtB02nO9KJLAEyAeYCMbGezPJUYEZ7EjkB+RCH/6YpjtgxEUcDu81tLO
	f9ePRaszcGIwQ3M3LI/kCJ05rn4AaoPblGpO2m1oXBT3NhrB0Gj3xKfy4Nn65Bsp
	VbdUBA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c678x5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 06:51:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35158d674e1so2930494eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 23:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355871; x=1791960671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbnQ5UhdwkF2mB+kgRVrvAgOBOsNAgejHqFSdDqSGng=;
        b=CjjXVb23D0R2i5MdDcI9+1ipswJyjcsX+mppnlAbDuaevW9NN+EzYHTJqPXHAT1mkU
         sCC+yua6C4vUPYvgarSyDCEKRWKl+cw4Oz2gbIWS4As1K7HFXibWwV/1AWIaM1pCsTZ9
         IIra5F8LhUHU6StyPCEvh5HsLV37a8vYAWATWLJgrdkcp4/1Ruiy5zlfdGDp5w/ZkRpv
         6Ts7dJAan0NacKeKQY/aBPwpM2V8r+O3o+7LIRltb5yF5ZgBudCzk3jNnSMUNgzeIgQZ
         nNqMKrpswCXv5zqOz1nOkPrjM09gHE7zENR7mkAmUsEpTVdO87/KidFzoq82ahtOZh6E
         go5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355871; x=1791960671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbnQ5UhdwkF2mB+kgRVrvAgOBOsNAgejHqFSdDqSGng=;
        b=UBwiLb7oECmICKT8nsgyktGE971abqjuPGIAPuTAvnYoeukoYYQwoCEeMyfINJ5rDU
         Dav9gSJAdrEssPkwa6Mn4fJLtFfmNTwKKXllWemuSQ4I3gS4rCgZWAlscHzP7+uquP63
         awmdb/foLVfp/ShDPXP5I4kUvB6mKoxuPq7Bnm0xEKGQaFeq+AB5c5AaiBUOxbc3qjI/
         0pz3VUnHVXx37rem80Sdr7y8mRxVKyDsxuAij1nBf/fReixkE0vzpx8JZ6GhTeDDy8eS
         x4d1CifgLLVrXn5oz/UQngpRY5BWrIBWpr5+RvQ6+IXJRi/FeK+jUjjSElWBS0UErRM+
         rY1A==
X-Forwarded-Encrypted: i=1; AKwUvBxJdoTu0F9GD/IjHNjk7uy6lSpGnmkSR1KyivAwTFvVEvS6d0a0PY8aq+sFdWwCDaINQy4XhAtKzuEfOPzJ@vger.kernel.org
X-Gm-Message-State: AFuF++lTMB5V1TJF7fR6fOiWOsUV1Q9EYhedUrbc8247oS/0h5KxCs+I
	V6MhPumvP6V+roBtwytlOx0U3qw0ZKr8s2STXo0xzG8dHhLbEpjPyJ+fnGIEPMA4YTmMbNyiQzA
	Qq/Yi3xqdxBu5lkshTpd1NfGW+qKMFAlP9Uk3+kpnQjSpUee10/qVyJPAGn00rGxOVpRt9Y1WlM
	1D
X-Gm-Gg: AYBFou2PIStnhVHlM0jSMypp2QJZDrvFI9zx4khBZ0sNdousIEe2JVHO083TtXgeFeU
	CyJ4zwuqW+88aVvrDsVaXJ2CYxsGHcyHRKP8KkADg7pALBrMR5veKP2GS73j3EgIjnpRkibO3Tw
	CQvczQOirWZYZ1ZlLfbmXGrFwizD0kd0kgRfDJe3uY8sg/Dl/jWVvcNBht9U5Ly0AyP3NrAdehu
	aTJH4Wd2T0NR5wV2b2ABX5hrHnQ8h1dX9/+TkPbxgoIRu+/qBLWuBJ5z7mVK5W3X1RiPd88h5Ij
	soyXHp9oxpS3+As0ZwRfHcFmPr6lYTpmR/fc1qZdQd2uGSuEDU5PtZ8Wrixf3TvYa333TPyLJrz
	wls2Gv31/pWQu+cKSX7i2nwU65Z4mMMsDT6RgwPfkWg6J1pV/+vPO/XMAtxuVHYVyQrgPC25aWc
	KsNiKtM0337UxGPU6f2xNWjS0t9cH4fyNJyn4=
X-Received: by 2002:a05:701b:4550:10b0:151:8d26:a798 with SMTP id a92af1059eb24-16207e74c92mr1202472c88.26.1791355870709;
        Tue, 06 Oct 2026 23:51:10 -0700 (PDT)
X-Received: by 2002:a05:701b:4550:10b0:151:8d26:a798 with SMTP id a92af1059eb24-16207e74c92mr1202435c88.26.1791355870033;
        Tue, 06 Oct 2026 23:51:10 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm7374730c88.2.2026.10.06.23.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:51:09 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 12:20:46 +0530
Subject: [PATCH 3/4] dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650 apss
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-ipq9650_apss_clk-v1-3-fd4c2b3cbdea@oss.qualcomm.com>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
In-Reply-To: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX+Kf8sfkgTcRn
 7Px0HXtjNax+mmeUbXj+ig13ChJd3RTuslZUyG/h3K6SJDffKW1Olf749VElu1HnXtGjl5pXDHL
 3N50RjCx8ZJYd+K1lrli0VrAQMYoZ3g=
X-Proofpoint-ORIG-GUID: WAUJqeDKI81cQQTPrsWWG99Mchp8nXqt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX+IEw3Cl9c/Zz
 y3GFSwBYC+19qVUIAYnbnlH0SAmuLFBy7W4g1ugGOQNOb72lIVFNdw+VhsjOrqcCsLA3WzCsrJD
 PETBJLcR6SGNDPwFG8SaHq1En8pYZ3B5Vs03kYBm4ManmFsKXiY+yyOTEV5IPVRRTx6m9g1qut0
 YLcMcV9Qe8tfnOrl4kSnz/q9ZUxj8w8+YhbcTSS8fwz/oYrC4UU3RIvBgjFolFpk8apVUiZMAvg
 Y+eW9ISJvy7AxBMiawdxr9Of5LhA0QsAWZKbLic5U7tX6RqMdTwBhum/HgfPSCZZFBImJbfEVL+
 qTg62SYQrYY2c9PGgDIa7n3StAWFpSmy19RXBsRQabYXXOe4NvQQ1d6LoVu7YjbZ96xYrugC4gF
 aRu6aOJmIFFj5YQYmdrkujP3iAJnrwiYTsBBRwxkK3Aj6sw/TDObKc0XE17HLzpQpc9pJ29YnHE
 h/5Tt/cOcuRwg/bMsaQ==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac5ebdf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=QDl9-_pjA6WZ_EjsUeIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: WAUJqeDKI81cQQTPrsWWG99Mchp8nXqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070027

The APSS clock controller on IPQ9650 provides the CPU and L3 clocks and
has a register space separate from the GCC. The four Cortex-A55 cores,
the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL,
selected through a glitch-free mux whose parents are XO, GPLL0 and the
corresponding PLL. The L3 needs to be scaled along with the CPUs, so the
controller is also an interconnect provider.

Add the binding, the clock indices for the Cortex-A78 (gold) cluster to
the shared APSS header, and the interconnect IDs for the CPU and L3
nodes.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9650-apss-clk.yaml      | 58 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,apss-ipq.h          |  5 ++
 include/dt-bindings/interconnect/qcom,ipq9650.h    |  4 ++
 3 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
new file mode 100644
index 000000000000..6b47183edd56
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,ipq9650-apss-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm APSS IPQ9650 Clock Controller
+
+maintainers:
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description:
+  The APSS clock controller provides the CPU and L3 clocks on IPQ9650 and
+  has a register space separate from the GCC. The four Cortex-A55 cores,
+  the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL.
+  Each clock is selected through a glitch-free mux (GFM) whose parents are
+  XO, GPLL0 and the corresponding PLL.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq9650-apss-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Reference to the XO clock.
+      - description: Reference to the GPLL0 clock.
+
+  '#clock-cells':
+    const: 1
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#interconnect-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq9650-gcc.h>
+
+    apss_clk: clock-controller@fa80000 {
+      compatible = "qcom,ipq9650-apss-clk";
+      reg = <0x0fa80000 0x30000>;
+      clocks = <&xo_board>,
+               <&gcc GPLL0>;
+      #clock-cells = <1>;
+      #interconnect-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/qcom,apss-ipq.h b/include/dt-bindings/clock/qcom,apss-ipq.h
index 0bb41e5efdef..c9b04f2dbb6c 100644
--- a/include/dt-bindings/clock/qcom,apss-ipq.h
+++ b/include/dt-bindings/clock/qcom,apss-ipq.h
@@ -15,4 +15,9 @@
 #define L3_CLK_SRC				6
 #define L3_CORE_CLK				7
 
+/* IPQ9650 Gold cluster clock indices */
+#define APSS_GOLD_PLL				8
+#define APSS_GOLD_PLL_POSTDIV			9
+#define APSS_GOLD_CORE_CLK			10
+
 #endif
diff --git a/include/dt-bindings/interconnect/qcom,ipq9650.h b/include/dt-bindings/interconnect/qcom,ipq9650.h
index 023a3878cc08..1a77609de832 100644
--- a/include/dt-bindings/interconnect/qcom,ipq9650.h
+++ b/include/dt-bindings/interconnect/qcom,ipq9650.h
@@ -25,4 +25,8 @@
 #define MASTER_SNOC_USB			20
 #define SLAVE_SNOC_USB			21
 
+#define MASTER_CPU_SILVER		0
+#define SLAVE_L3			1
+#define MASTER_CPU_GOLD			2
+
 #endif /* INTERCONNECT_QCOM_IPQ9650_H */

-- 
2.34.1

