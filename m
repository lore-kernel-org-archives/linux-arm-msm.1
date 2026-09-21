Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D4D2F7F0A
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971625; cv=none; b=UQ7ApxzrIPYq+EFCxnFgBj0RFmbIw4jMRz16B+vE2GNaJxq99EZC4RZCC+nJGl1vO0p+lPo9KDSru03vcBJBnmeIai7H7SUaL5m41tcVybuLZQ2LyCSFBd32crTArCOzXmTmi7S4dgPPYiddfqvOOoL73EXbXd3gly0cc+jRvK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971625; c=relaxed/simple;
	bh=oh5Pm1MGo5brzkk9JyE/oefAJPHOCcWpo9TZGmNPa9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=toU8cjqB1L7JRzRh3gB66DcXAkBgvahoe2PiVhcKD3jOWoLtObEnz2zI+Z1pxTN+d5JZdo8d0Ssjm7IWxxwuOxDUuUz1PGSAqTTzdIeQFX2rQNtU28mtVJ0QhRzhXhOZRN+iuALgUmbPlteBl4ySMk3gimGEgSk01e9ZquDoXLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eqql0gGi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCuzmHgu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eqql0gGi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCuzmHgu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3YvWw1162088
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uey2gqkHDQDDHIIK+N7Py82i/jmkDPiVZc6EZZrXCeQ=; b=Eqql0gGiuHrDIuza
	Q80QusDE7BZgEDAmCQeP6DM6Gpt6eSPQg3s3lVLwKaaFt0cGNGI9uFmKxyxdkyIe
	E/Qefu/p+ZSDDxibWcN3Whhcfub++DeR/RWRStUhqnx1aMk/n9cayjnnzbKc0QkG
	esv4dsm741YIH4RjG4Fx4dThTTlLRXXKCSAKqk2pyuHDT1BJsYTXC04LqNigQ2TD
	hycwNB3rLqbovKXwX50gxp4OJB5xn0mteCRYa1Uk+Q5MtzC/TEa3CJyO71ksTH8M
	j63q2wfOy0Ppokx9lu6zQrHPPvmCU5tl6AT2W4lthLRw+8H9vvRk790cQc/zUOKi
	/GKMjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wrw5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:20:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fed0652bso31309455ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 23:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971622; x=1790576422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uey2gqkHDQDDHIIK+N7Py82i/jmkDPiVZc6EZZrXCeQ=;
        b=cCuzmHguSVC6RA93t6GmlJ1ghQYTWeZmA9Xxled/1J5SOuGBPAs5FJPCFlo0ATzIEn
         Wnzkyxilc2eU3R+StYLv3pGUMZxC900K3hDKPwoBFIY0znOcfFYdxJutr8fre45ZctjM
         siXB5HnqkoJFcxacWXk9jtPY6+6YUUquoin64PBH0/ArMaqbNyM2HKtVcroJaw4UQRFD
         HBbXu9M0/lHnyec7d0I3COdmTzNybu/JW+PqX+nq+GkrQ+5bh5jeOET36JjqfS7HDlnU
         6b/fMhEh8qBcmAMlya+843/CyxW0GgMnxRPspgC8m5U3IyZZ7voW5VPsAtPZoW3ABEpt
         aL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971622; x=1790576422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uey2gqkHDQDDHIIK+N7Py82i/jmkDPiVZc6EZZrXCeQ=;
        b=s6vQhW0sqGLU9/icZ62SDcbRiyB2h3NezpK7YR6JxwFMS14jGuP/6NVrfvbH3eaTaj
         wj+tW1GuWDuxZeJ21gqtxOW8EQKFfghXn6/81BRQ83jIIrSu2XjxpbOUjkWL0Beg2AdR
         E3v221cLVmo1tXufyB5XCPeRBD/f/FITENEIXtwAHFkCD5LIdh8pkY0OKk6Fq5tJ0Mxx
         8ivxah2sC5jn4MKosWlgeOLO/JVMzzxVeX7NylEWq8dJ+sESTrtytmbJXq4eTNlu1dJn
         MwOTGBKhot3MVfZohwSMcWhvSF29tyHpMbSNv3wB3HXiDVa7Dvld6FY1lYah6nQmRUbL
         V7Wg==
X-Gm-Message-State: AFuF++lbhGRCQowiKU4VkzfoVrihhQ5HEWhFzUfHnV08vINRTDZim9YK
	PSVKGdwAjFlg5MYYTLPHRWEUWzIhi/ahf/QygOQJ/BYZZmCU89T+OH6ChSAtzB07TGYEoSNiZuy
	pTmO890Jp9NUCRjyRpgBvLKGO0ze1b/c6JWrLCjwf2cC+v4U764YVo9bWYpZuBTjBddvQ
X-Gm-Gg: AYBFou3LSnrnh6iJh6ExeJrU9iQdmCwdniEy+5dui5XlI3+N6MsubRxqka8F4JIQtcH
	FRh01/+EyxHMM0pV4VXBIM9tpF555XETzHOIKt1MFNOzbXfko4cAji9tGZZVLBnyD1L5maW1pOC
	etKx1/8dATpmFKRPYcUPlDhE8mvzID/QYXqknGt5oIhio8tZA4kVB73cs33IiyFClVQ50q06MH5
	8J/8uoP0XfHX2qpYle5WuqYPlSnmhLxetAlFSc4I7ys1eS9droC0qE5EhzyI7rr/pSW+SFXC2gX
	TSh9J+rP9MIvorNieFgzHH61yyAyOmpgPXad5ADMOkvErIVdtTsfbOYfBqflcqFfTJRhnhJymyc
	wrnYELTE2UXssjV+T0WdAAkNJxbXAky955zqwOHqstsVKE+22rs4ua+uoIrqI3pJPftM3rdZJDv
	Rcwz/deSUgzr7NXGRbBwhKgCDo4jri7EWkag==
X-Received: by 2002:a17:903:32c5:b0:2dd:c100:80b8 with SMTP id d9443c01a7336-2ddc1008163mr79089445ad.51.1789971622229;
        Sun, 20 Sep 2026 23:20:22 -0700 (PDT)
X-Received: by 2002:a17:903:32c5:b0:2dd:c100:80b8 with SMTP id d9443c01a7336-2ddc1008163mr79089125ad.51.1789971621808;
        Sun, 20 Sep 2026 23:20:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:21 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:38 +0530
Subject: [PATCH 05/11] dt-bindings: clock: qcom: ipq5332-gcc: Describe
 clock inputs per compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-5-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX1LUDd2WuIrMt
 hy8TgkqroPyB+6kupfbHvVCl2fZWr9GZDFdJvc15EVZF6pcXeKnFsK7TLGxF0w3V5TRLe9PoPk6
 YSWvRfp19Lou7Z9811MRtlpIb4XrqLB5RsPgX38PKjUl7MmbpdReWXYhRnFpem7Pve6iBPWpxL7
 CcB0BCz1t9Gk8ZfOK5C4xYda3zDwx8EViHnBAuhGpUSWLLEKFMetA/pvvTVJm7SlLlkN4D6N/MQ
 mCFD6Fif0NycpzPebqoqPTzRdaCAKuvGmCI7rYt9gSFgDyj7huz50eKWVTgtkopnpVHyDJK1EGf
 ZnYOwOgowCkjyxRP/372vdWxq7t3kwqYJu+5vUp1R8nCwFegQa4wb8hGEAHJ5xWInlZW1ubwMjs
 iD+2gJXMbdhYeVJr3waQ0PlJdKqwyDlZCUatjRVDbr3kRK5cuf0tbU7jR6HVSlNNAHfjlFCgTGq
 A7li2ypkbehDMpbd9KA==
X-Proofpoint-ORIG-GUID: bjrL0ONTJFf_FS5sSijHV9pLN59CwqBz
X-Proofpoint-GUID: bjrL0ONTJFf_FS5sSijHV9pLN59CwqBz
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0cca6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GdSppTGlZM03nT4b0GsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfXx50+5CZgGCyx
 bT7c5JCyOD7IPrGzCm6fO5mnxa/G6N3v0nFpNzurvPurZjaYZ2/Fe/oT5CwFFaovQcgBNA94t4x
 yuey+l9Wkkd5/Wr7qCZBUYTIHG5OBQA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

The IPQ5332 and IPQ5424 GCC blocks use different clock input orderings.
Document the clock inputs in compatible-specific schema constraints instead
of using a common clock description.

Also add the 375 MHz PPE clock generated by the CMN PLL to the IPQ5424
clock input list.

This keeps the binding aligned with the clock ordering used by the
existing DTS and GCC driver implementations.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq5332-gcc.yaml           | 26 +++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
index 1230183fc0a9..fb39dffca988 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
@@ -25,14 +25,7 @@ properties:
 
   clocks:
     minItems: 5
-    items:
-      - description: Board XO clock source
-      - description: Sleep clock source
-      - description: PCIE 2lane PHY pipe clock source
-      - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
-      - description: USB PCIE wrapper pipe clock source
-      - description: PCIE 2-lane PHY2 pipe clock source
-      - description: PCIE 2-lane PHY3 pipe clock source
+    maxItems: 8
 
   '#power-domain-cells': false
   '#interconnect-cells':
@@ -52,7 +45,12 @@ allOf:
     then:
       properties:
         clocks:
-          maxItems: 5
+          items:
+            - description: Board XO clock source
+            - description: Sleep clock source
+            - description: PCIE 2lane PHY pipe clock source
+            - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
+            - description: USB PCIE wrapper pipe clock source
 
   - if:
       properties:
@@ -63,7 +61,15 @@ allOf:
       properties:
         clocks:
           minItems: 7
-          maxItems: 7
+          items:
+            - description: Board XO clock source
+            - description: Sleep clock source
+            - description: PCIE 2lane PHY pipe clock source
+            - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
+            - description: PCIE 2-lane PHY2 pipe clock source
+            - description: PCIE 2-lane PHY3 pipe clock source
+            - description: USB PCIE wrapper pipe clock source
+            - description: 375 MHz PPE clock generated from the CMN PLL
 
 unevaluatedProperties: false
 

-- 
2.34.1

