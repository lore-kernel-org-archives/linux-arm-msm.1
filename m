Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AAB430CD3
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617671; cv=none; b=CPEpnWqZqKZYHnT0v/qHedRtCDEVEClkXO77LfzynrIAl3zQUstpWIJldfdzHaCIC211lQEiA+iv/One7HMmdynY7pfJOzbPXrCoEj5YKXtsJa8/XMH+RqzO786LH3EVft9fOUnIgHD/TrZQNRrxv180DSAhDsmj0rgkJV+hmkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617671; c=relaxed/simple;
	bh=1okje2fX+lTiCbL6lMem2yYO7T0dnH3piHUQ2fabOSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ue7xhOAZU7i/Z3eFeXaYEfTuPHMMEqZVrlZk7sSHbRlhyek5xoDI4j0SIv7iF9a2X6Xf5kyNeXi04DcFWQGooLob3E57ZsjRhhGg9EOTDarCOHYHZn4RYu470x+1z8hR1ShhbXkGyUbF+NPnPtq/PENIlnh1k6NmVob1STduwbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgSMaO2g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDK/Qpz+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgSMaO2g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDK/Qpz+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6ZwRo4106910
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2KoOOUrZxn0gtuWAu6cEtmEZpFumK50QDBx67PwVNg=; b=UgSMaO2gHegFzAOH
	BEcs9vp3MjSiRBOvKWxzp0AcdifJO/vGC/DqJ+k6j/5+4HHsOfhF8vVVGIGpwVFv
	2ma0EN+DPOSGcalojKEd5/591Cb76agzsnA3GjK/s7vdM2nx+b20xD7/Oz3bqT6h
	vnuUQcF1v81h2gUyyGNtQ1ZjfsyoxYbHojmj8PAnw/+BMj5FJNzI+/9XIOcy7Bq6
	nKb51Cc6nCJnERV80Xd08eK7s0T1C9HwG/yz3eqaVZu19SBQvjGy/odoYMjRPJaq
	88eOy4hGhN7gYXl/IkyHU3d4m8qPBYZlJpWG5wx1zqPRKwfoTYfPyXQe8CDgjGuk
	OxSb2g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn9nq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:07:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so18834197b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 00:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784617669; x=1785222469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2KoOOUrZxn0gtuWAu6cEtmEZpFumK50QDBx67PwVNg=;
        b=ZDK/Qpz+yg8PyS1j5JZXL/zQvojWi6+tySPf5i6eOF1wwy0Xd9xgifkGzlTTyBNGAT
         B4DjDOTLJlH42amg3bMv7uxMkYHyM+IVbfm01kqq5I2Q+XstKbJbdWdEKjVavAcQyYma
         bhxvXek4WKJDoUaEnCz2EWrACtMYjExwsBIFOsJQVIgoyB6x76zWkPF7uBl3bOrYJqLL
         yOTVKq3xR1Px/EZq7p1CQG3ILpRMuMTwQDrAzD/iDGf/OQTjStDX2lucpdEs8MJJBKDs
         +zdL1TDcGFGyGyOWXRPwAxhuwydZAwUZlVNrOREfmKsOrS2Vv9g4s689SNQ0SCF6p/W7
         ZyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784617669; x=1785222469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2KoOOUrZxn0gtuWAu6cEtmEZpFumK50QDBx67PwVNg=;
        b=kfsAdz6JdM3to5saEEbmDpvgr2/jOrPe28e8ER1NrLX++z+BenWurWf2OdAOLRE8c8
         hUovvR99YSG9KUlXGB3KC0j+/xdVEKi1WohiFs4Yva/af0AFDyG8Kx9XjzdViLpBOSU+
         EBBk3OfXmdo8Qdg1A0QX2daBpETmnDb5ykLqFtZ4PnMh3Da9dRIEBKYEEaf0HfNj3Z9l
         wDZtC3ZfjpJgGtW+JKkoMk2KXNg6Tt615x1PmJ+6Zrwxh98d68zfO7JonAvn/SCmxYmt
         ghI8P/NQWUBXcYEl6mZKpPeEJnockZNu6P6GS2tJRpR5hOizU/ALLx9hYXv3QvE3PLWn
         yYYA==
X-Forwarded-Encrypted: i=1; AHgh+RqZpD1NGLvo/sJYJISG7kF7yJK7JOfRBcZkHlwNiuweqMLOoD6LjbA3XgNYg+8OjQLDLMGkCmf9UVCOf4GJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzaK/B9frXiLwI2ir4qyVAkGc8SS/JdCRKhZ3/1YM/3zdKl4THU
	NDaXIzFb59e94q+M3NbZQQyz/Rwq0iN92Yy/vYP5DQlm5Wuu1U2p2mFiW+E4xdXtfZ50C8vU2wB
	pzRRuhz4vUMqC/BYHFjg+9dDBZ1vZkGs7YTvTZdHoczIvIX5WLaHsXWQx1xORDZkS22HC
X-Gm-Gg: AR+sD11P/Fi6jIusIf3M91CaEZ3Hby/WYiTGtjWF6QEsk+2hyxoc5aEO56eoP5Xx4GY
	SMjxygcXnl2pycm3+qLODj/hxuYMIhDxKy6Bj1FNgZC4aGkGmcRE+DYG3Yl8IWbAEvoobfPNzCS
	vpueLefIBCwoGlP3hD2nUBd7nfjYs6bcwfYh3kGR/6/PU2OG/HRMF/kN1GsDSmfpXEZ0ZfFZFTM
	3hdRVa5wzi32E7bGlCOlRLmNp3Vd2jGpdO8IdR30YlMEMMtRqdCqekVLWICbrZ8x5mHeXxXe0CD
	HKnWWM/+bNbEmeST8R14dMiXjGmmKCm1AM1lQAjGkpAthiKUgC6VeJ+ivZBtud1pUIqY6FAHiJc
	gQ/vB1rvRiCPK25SemkW4Rwjs
X-Received: by 2002:a05:6a00:9295:b0:845:d286:1fa2 with SMTP id d2e1a72fcca58-84c2946eeddmr17836610b3a.49.1784617668832;
        Tue, 21 Jul 2026 00:07:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:9295:b0:845:d286:1fa2 with SMTP id d2e1a72fcca58-84c2946eeddmr17836582b3a.49.1784617668348;
        Tue, 21 Jul 2026 00:07:48 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc74csm7080833b3a.18.2026.07.21.00.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:07:48 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:37:18 +0530
Subject: [PATCH v2 3/6] dt-bindings: clock: qcom: Document Nord display
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-nords_mm_v1-v2-3-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
In-Reply-To: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfX4BT6uRK7cyAM
 spa+kJQrfRfOnoMUtRUL7eBndEeYOhGN8RQw70DXWrwF+rmUULnm6p4w/BpFJ0cMSt3s2VucD/4
 t6e+7B4sVqp0Ce05nw5GQdl2HNjwidkj4d/GwETsr06hpmdWaOgO5VrzShfhKxhyx7TWO2PmFbC
 dV6mjJWhMGJl+Pv6vbGgVKmqL8vMsMTpLyN2JXQ+QNjriEUTbf6dt1gXbXSDn5hseXWOWbO+kpX
 utFAaU+PT40C9mO0Pl2SyQGudCyYfFL6jTA8oPR2B87AFJDrf2ezc9/19A/de5jUy+0H0igrzzE
 8TKwKAXdUgg+DG0wcroe0hS0GRI2z+MySjvn+3I+cQTN+36OZW7MUG5/boDhNaPEEp2il4MEvPn
 0PSfIIe8ZtGsDgo516la+qeoYgKfbhOtpOwLFJeJdpMunql93eYCmDM9yneAwqeohYjPF2Wl/Br
 VZwZlv2qQiz0t9lcYog==
X-Proofpoint-ORIG-GUID: Cei-wvcnwmyBFTjt3h2fwDsPKefMS3Ud
X-Proofpoint-GUID: Cei-wvcnwmyBFTjt3h2fwDsPKefMS3Ud
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f1ac5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EEkIxoOJKZrbPHcHuzUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfX0EjtR2xhyQbC
 6BP46aOqrB5GvnZOjyodvdIhA3Iki/oxxby+BibAJ6kc+HsbAjGda6+u/FqkZFsbCzaIO3nFOST
 PZQG7rmClRDYt7HV04AbbuIX+aLa03Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210073

Add Device Tree binding documentation for the display clock controller
on the Qualcomm Nord SoC.

The Nord platform contains two instances of the display clock controller,
DISPCC_0 and DISPCC_1. Update the bindings to include compatible strings
for both instances.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |   3 +
 include/dt-bindings/clock/qcom,nord-dispcc.h       | 115 +++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index 591ce91b8d54dd6f78a66d029882bcd94b53beda..61f58fbd5bd21c7f36081e7ae066176fd19a5811 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -16,6 +16,7 @@ description: |
 
   See also:
   - include/dt-bindings/clock/qcom,kaanapali-dispcc.h
+  - include/dt-bindings/clock/qcom,nord-dispcc.h
   - include/dt-bindings/clock/qcom,sm8550-dispcc.h
   - include/dt-bindings/clock/qcom,sm8650-dispcc.h
   - include/dt-bindings/clock/qcom,sm8750-dispcc.h
@@ -25,6 +26,8 @@ properties:
   compatible:
     enum:
       - qcom,kaanapali-dispcc
+      - qcom,nord-dispcc0
+      - qcom,nord-dispcc1
       - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
diff --git a/include/dt-bindings/clock/qcom,nord-dispcc.h b/include/dt-bindings/clock/qcom,nord-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..219facbbda106488d3f00391c9e14cb584fd12ff
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-dispcc.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_NORD_H
+
+/* DISP_CC_0 and DISP_CC_1 clocks */
+#define MDSS_DISP_CC_ACMU_CLK					0
+#define MDSS_DISP_CC_MDSS_ACCU_SHIFT_CLK			1
+#define MDSS_DISP_CC_MDSS_AHB1_CLK				2
+#define MDSS_DISP_CC_MDSS_AHB_CLK				3
+#define MDSS_DISP_CC_MDSS_AHB_CLK_SRC				4
+#define MDSS_DISP_CC_MDSS_BYTE0_CLK				5
+#define MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC				6
+#define MDSS_DISP_CC_MDSS_BYTE0_DIV_CLK_SRC			7
+#define MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK			8
+#define MDSS_DISP_CC_MDSS_BYTE1_CLK				9
+#define MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC				10
+#define MDSS_DISP_CC_MDSS_BYTE1_DIV_CLK_SRC			11
+#define MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK			12
+#define MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK				13
+#define MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK_SRC			14
+#define MDSS_DISP_CC_MDSS_DPTX0_CRYPTO_CLK			15
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK			16
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC			17
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC		18
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			19
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK			20
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			21
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK			22
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			23
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK			24
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC			25
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK			26
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC			27
+#define MDSS_DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK	28
+#define MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK				29
+#define MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK_SRC			30
+#define MDSS_DISP_CC_MDSS_DPTX1_CRYPTO_CLK			31
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK			32
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC			33
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC		34
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			35
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK			36
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			37
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK			38
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			39
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK			40
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK_SRC			41
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK			42
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK_SRC			43
+#define MDSS_DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK	44
+#define MDSS_DISP_CC_MDSS_DPTX2_AUX_CLK				45
+#define MDSS_DISP_CC_MDSS_DPTX2_AUX_CLK_SRC			46
+#define MDSS_DISP_CC_MDSS_DPTX2_CRYPTO_CLK			47
+#define MDSS_DISP_CC_MDSS_DPTX2_LINK_CLK			48
+#define MDSS_DISP_CC_MDSS_DPTX2_LINK_CLK_SRC			49
+#define MDSS_DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC		50
+#define MDSS_DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			51
+#define MDSS_DISP_CC_MDSS_DPTX2_PIXEL0_CLK			52
+#define MDSS_DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			53
+#define MDSS_DISP_CC_MDSS_DPTX2_PIXEL1_CLK			54
+#define MDSS_DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			55
+#define MDSS_DISP_CC_MDSS_DPTX3_AUX_CLK				56
+#define MDSS_DISP_CC_MDSS_DPTX3_AUX_CLK_SRC			57
+#define MDSS_DISP_CC_MDSS_DPTX3_CRYPTO_CLK			58
+#define MDSS_DISP_CC_MDSS_DPTX3_LINK_CLK			59
+#define MDSS_DISP_CC_MDSS_DPTX3_LINK_CLK_SRC			60
+#define MDSS_DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC		61
+#define MDSS_DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			62
+#define MDSS_DISP_CC_MDSS_DPTX3_PIXEL0_CLK			63
+#define MDSS_DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			64
+#define MDSS_DISP_CC_MDSS_ESC0_CLK				65
+#define MDSS_DISP_CC_MDSS_ESC0_CLK_SRC				66
+#define MDSS_DISP_CC_MDSS_ESC1_CLK				67
+#define MDSS_DISP_CC_MDSS_ESC1_CLK_SRC				68
+#define MDSS_DISP_CC_MDSS_MDP1_CLK				69
+#define MDSS_DISP_CC_MDSS_MDP_CLK				70
+#define MDSS_DISP_CC_MDSS_MDP_CLK_SRC				71
+#define MDSS_DISP_CC_MDSS_MDP_LUT1_CLK				72
+#define MDSS_DISP_CC_MDSS_MDP_LUT_CLK				73
+#define MDSS_DISP_CC_MDSS_NON_GDSC_AHB_CLK			74
+#define MDSS_DISP_CC_MDSS_PCLK0_CLK				75
+#define MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC				76
+#define MDSS_DISP_CC_MDSS_PCLK1_CLK				77
+#define MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC				78
+#define MDSS_DISP_CC_MDSS_PCLK2_CLK				79
+#define MDSS_DISP_CC_MDSS_PCLK2_CLK_SRC				80
+#define MDSS_DISP_CC_MDSS_RSCC_AHB_CLK				81
+#define MDSS_DISP_CC_MDSS_RSCC_VSYNC_CLK			82
+#define MDSS_DISP_CC_MDSS_VSYNC1_CLK				83
+#define MDSS_DISP_CC_MDSS_VSYNC_CLK				84
+#define MDSS_DISP_CC_MDSS_VSYNC_CLK_SRC				85
+#define MDSS_DISP_CC_PLL0					86
+#define MDSS_DISP_CC_PLL1					87
+#define MDSS_DISP_CC_PLL2					88
+#define MDSS_DISP_CC_PLL3					89
+#define MDSS_DISP_CC_SLEEP_CLK					90
+#define MDSS_DISP_CC_SLEEP_CLK_SRC				91
+#define MDSS_DISP_CC_SM_DIV_CLK_SRC				92
+#define MDSS_DISP_CC_XO_CLK					93
+#define MDSS_DISP_CC_XO_CLK_SRC					94
+
+/* DISP_CC_0 and DISP_CC_1 power domains */
+#define MDSS_DISP_CC_MDSS_CORE_GDSC				0
+#define MDSS_DISP_CC_MDSS_CORE_INT2_GDSC			1
+
+/* DISP_CC_0 and DISP_CC_1 resets */
+#define MDSS_DISP_CC_MDSS_CORE_BCR				0
+#define MDSS_DISP_CC_MDSS_CORE_INT2_BCR				1
+#define MDSS_DISP_CC_MDSS_RSCC_BCR				2
+
+#endif

-- 
2.34.1

