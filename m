Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01B63DCD8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273539; cv=none; b=kwcSJYmhOHuGxjX2uomAuKOobVKTW2iBBPJQRfnF1DeIvMgXlS+cDNtUhURP5pbU6F0px26vquVqUB0int+8IXOAFIYXpPdOpeigjiyfbcIJSgXyw7ePuFvY9/ptC8pQDB0kSw3z+Y61AQxqLCI+PhkH1YZ+dOdEhxGqketi3pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273539; c=relaxed/simple;
	bh=xsymo1ugehFJSuAXGkDjvH2HKamUbLSlU6g27kRpMqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CN9IkCswv4TcgrtoHWQzauJVBBkkju1Nr5iej9uAhtUJrBsWFts8kSvodCRdH4OJryzUiM7/2WrdyCideP/FF7u+SnL2PRvfbwT7SUj+nyh4yTr+0SoasQLb65Gr5S+a80iCx55fLfjLuDLDGSsEpwAFg8/DgVBoBM+lAK/HcJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzpyDCic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDnI3Ftz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzpyDCic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDnI3Ftz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cbkQ979985
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cSMEyKRh5Yb7aSvXdUBKQev/vl7ZJs6RT901GK9RBY=; b=JzpyDCic8QmZQxeS
	ytNwJXOAQf1aPGgP6UoQhbaROFbCwPnWAEpp80oSs0NSgoaajp8lioe5BVJlOg0W
	XP0lrcMvFV0QAEFvpjxS6+UgBT59tqpKmDxHb2HPD3gX2iyOSQMBijG4kvksAFsW
	bp8GVayxVJWG8LmIEPsmXg5JJhwcyMpACngFDHtMNW4K1a32b/S5NptvAt+TXIUp
	3e95eiLaslPWaF9eQX2pFvZQAGaaZHra2H/ze3HIGo2JM2UJv7Eaqe9/oO1Nvxp2
	a15u3gQRojXBzfuUnaSUsznFQw1i23nRHuw1WB5Om7KoLhFXF1vQ5V+LLp1uuGDC
	lbxZxg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gr6t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc88e22f92so154523925ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273524; x=1784878324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cSMEyKRh5Yb7aSvXdUBKQev/vl7ZJs6RT901GK9RBY=;
        b=PDnI3FtzeJrrxYu4nLzh6qPzHrQR5+IKiGQuZI4Wj12Adre7piH4pGhrEYWDBw8vx2
         ypmMXP+MnsVlM/1wW70hFf1EnIjIOWMyemGpBInzmkJoklhHe3ZxkAkUcE6Gwxp6TEOK
         zjy2woac/mL+OUU1VlCoMeiTwcMKMigSdlb+Pv7Jz5H3Y3n3sOfvcCYs+kc+Q33GF1vs
         hqu8CGHC/Tvc+XBM9A64NwjSA43a81ws8RcMaLLC2SJ5D/alCi0ltFiuUpjt/RDTErA+
         b6trE5teojklL8cU/crf3aYrg0/MLkMytddbCp10OMx7dIwJ0pzKFkASf0Xzmg8CbAft
         aziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273524; x=1784878324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cSMEyKRh5Yb7aSvXdUBKQev/vl7ZJs6RT901GK9RBY=;
        b=esi9vem90sD4dPnS7MWFMFj470zulFEmq4/VbvyGRCCjIfuoKYu6xzH+4PSeYo8uVF
         QxiKOZDlaw7FNLYdAapDKUcdexJna5jTP4D1jYPYa8sdYqRziTUjv6ACFKt9xRH3Y0be
         wk5lf+Ii4M4ZEvwSSLtp/K+QurBscCicB2xtqLDzP9SU+w6pizyATF5zWPOog4wIDDL+
         uedMqjWYq7xv4sEes+wxDRLT4EBLga5H8hjZq0Cs4daEuI3nPEe6iVpTwuLSZ+UDolQ5
         oWrFt2qSKh0UTfIaCbiF3OVKjZND7PF0dDk2CWo7fKMTL1MWumFNvCLRNYrpyVRNG9nE
         ZBuw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+gBHkIZHh6ZvB8BKFNRmphRr2nfW6g87gv/eGTvRm5L1UKL9mrp0gV+/UYA8GMlu5YdmbXAGPh/6Lcl2W@vger.kernel.org
X-Gm-Message-State: AOJu0YzXM9BU7LZxa1100FEAj++vJSpOqsU1/JSyAQJkgsVJTMjJRkVd
	HEOLqsTW0ZjOazy2M9nZ7bCasyQREKyhjLLWg+KYEaUOVY36tEDXjoeFHQejiuUqpVnZilRJ0nx
	xKS53fL5Vq8Z6uMgF6KEQH5vuzI+uZaY+KDfO6Hz7EtfwjejjzUJM6KyrPLDJP8RqHCk4
X-Gm-Gg: AfdE7clUrqKRUkweRmep+ZrjlOWyCmKeuj2RLJB4yYn0sgScejuSCKdnnqTv3Y25AS0
	49oLVYsPghwfiRsz4+vo5UuB2LjKuhHgFCokxPoPZvG27Sqkn2mx5rVxLs2uicUfSbtPk1iMINI
	5rLrfpW7Hg0kbgtO7IQ2JWP/i06lqwCIZU5JBqcS3REPmtbDYFNHKNwGIQPgEltiqEEEBQAAWTj
	VF+4ISZsqTEsU08mnZj4i6mxfmKUvAyjqU0RQbnw0RAo5XYBz8YsolsVE43bVtLaAnMiqUkzJO4
	d5bLIsfKseXdn2WuIzDXNkwm25FDyYnHjhaHxccAaKBZJ3Dyn719M+hDSkhWS8KUgy3clJgsJuq
	9A9KSt/srPZWfmTwhKx+B5zjK
X-Received: by 2002:a17:902:ccc8:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2cf3484b1d7mr17097215ad.9.1784273523788;
        Fri, 17 Jul 2026 00:32:03 -0700 (PDT)
X-Received: by 2002:a17:902:ccc8:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2cf3484b1d7mr17096775ad.9.1784273523334;
        Fri, 17 Jul 2026 00:32:03 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:02 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:45 +0530
Subject: [PATCH v8 01/10] dt-bindings: clock: qcom,milos-camcc: Add missing
 power-domains support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-1-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX9BkHbXKwToDj
 EmREDPJGJaj3CVRx1P4nfkKtLgLY3kfzMagZETTi8M2kjCO5Xb2RebgKzsSMblQVKT4kbIleuh2
 jbsvSchWQklWeBhhDutKjOT9nPM5RtM=
X-Proofpoint-ORIG-GUID: lw0kAchVf7fmTVZ62HajIJwJhkNjCmYH
X-Proofpoint-GUID: lw0kAchVf7fmTVZ62HajIJwJhkNjCmYH
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a59da74 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=90z41mPHMHFWLCXoM8oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX94VgWcKcK+cb
 ebMwEmNG2mAR35MP/aDVPO9+8E8g6aZBHuIITMZb9s2DfBEjVwcHm3M7qGAa9mpJri/p8Vmvzwc
 UkrSjsh3SvpwLQN9D6kT+xnBcbncf2qcjkmtiF81cAFusAW5i1vqGbGcZCsQdy1MqX4pAZ++KC9
 AWX16e03rHWfMlETcMF2xR7/UgY0ax/xcgd7eCJmYsCxfW3F9RhmzoNj4mC6C0rkmWzqGbgBlB4
 qvK0anVtWmmv+jx8chlwHqHM/t7gW0OfEa89lGJZ0jAr7M55Ltzw/Pw+WIyV+Zn82o9eEw+mNrI
 rHH6HH7rVxLt8/TJdAH5KfrU+dNqXIvfYV/Q/xraYAvn1u/byfgE+Rf200ooRYzOak8kbEHxSQa
 kv1hnDiWr7o+b1MBnz2AsDq7XA1dJ80ZUX7HnHsGZz7adpmHo8I86a47JcvnDRKhUSQ1dk5hO5m
 YMnSFbKL0j78Nfc0EgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073

The Milos camera clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented qcom,milos-camcc
compatible, this is an ABI break for any devicetree using this binding
without specifying them.

Fixes: dbb9d53b7197 ("dt-bindings: clock: qcom: document the Milos Camera Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-camcc.yaml   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index f63149ecf3e1b98e60dba27093737ec84b66a899..2295e7627ec9feb6a67f3ca952e6192a31cce593 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -25,9 +25,21 @@ properties:
       - description: Sleep clock source
       - description: Camera AHB clock from GCC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -37,12 +49,19 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
         clocks = <&bi_tcxo_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_CAMERA_AHB_CLK>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1

