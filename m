Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DCF47C10B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246443; cv=none; b=KG0VqttAcf4sNfVfkWAAC3Pj9nCHp77zn80jt7Hj/PohLuuG61rPZuhQon0LesQrvWJds7iRkrC7AL5C0dh9O4Hai7fdKRMLmewsBajHSRClIcYFWZkHlKBJLGRENdCMunpUS2TJSjiOkAFfgh1S9Vu7XvQOROXhH7nBcU6Qmhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246443; c=relaxed/simple;
	bh=/GkuWioc8EmlLG3OhgcLeY/qF3cuJPcE3d5ehINiuok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOOvQpg1ROT5HXicbPPYm5AMd7GcQVb0Nmwgi5x1WGBVl0OBanKxz5VZLPw+Mc67krvYmfkfMSO0LNSLVOojq5vtBiTN6oE7sEsuUySAKUeHvTg6EXe4B6MKF4NOdnLnwcZI0serHzk/KbE0w47I4vLzGoR4WLGyy7IXDLbVHFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1nq8bQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1lEsjy4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1nq8bQ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1lEsjy4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1Oht2857939
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QMnK3BU0x8u3Ow42e0wy/Iz9sWsMqtB3FpvcoguTk0g=; b=O1nq8bQ2eEVGh8wu
	0bl9Z6F9Fw32dA0E2VZRCbxajc+GmiIXfu5WSc68mcrS+MwOzvjZDbGjmi0Hzt5B
	EELjf7Etm5vWedt9WtNRy2KisR5ug0KG/VlSigs971caumg7pY5vnZESIKvvkwEl
	42yADg2gyHL2KkgWsWJ2744V6By0i0Ef2SSDNIyrjsqnJ8JZ90huNMhLLcPGGis6
	jMz0BybstY/W9b/oGNCIvMH1scmCMaE57SWdyaNcPL9XiZUo/L2KgZDQjmSYIdtj
	QaP6ucC/1jDdPIhMLrFDAjAxtD545bpAxJV42k0CZNDxiRwvR68MAbeCpGI65eQQ
	6JZHew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag56t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bfb2da664so457945685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246435; x=1790851235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMnK3BU0x8u3Ow42e0wy/Iz9sWsMqtB3FpvcoguTk0g=;
        b=R1lEsjy49iWbaNrqo7mvRYWV/SpCW8M8WhZtvnokNxFRXPNz1bS8W2+oNd2OLUbGJq
         S5IRdt10Gif0k3mIQoyJJG/WDv4QOwlwq46duqI8A+r5XLt4LREMnRYsXNOo+/rzLzRM
         0tPkUxlL/lA7UtT1oVLH3hTKkU+1LPhob6QqujamiMWoEZDcYhWa7yRSr/FlLHUyM3VB
         kVoJKIWlQeailRiFKDU89j97r7kOTJGgmV9h0ONHyL1yb+PK+1/l8RuybNRREGBFl3hT
         sSboxwgcAmOtgwzFP2gaUwzQxVUnVIZ3QnWmHxw9pQM5PdwIYwGjpIJQvxxoH7WH45lY
         CbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246435; x=1790851235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMnK3BU0x8u3Ow42e0wy/Iz9sWsMqtB3FpvcoguTk0g=;
        b=IzZjGAaskJj4q+oJTWa9bwt03boPpYyaWG1J+fHQYSPo0Pq3EGdCwNH2G1yw6tRH+j
         ZuI2vkrHUm0KdrDjBnMoIF3bAYlEZ/h/st919aRYP+BRM1Xbl9bPmyjVkYv5diZWLqCf
         Mpjw9fmcT4MYHmzTDa5YjNb7bsoeB35N6t401Lr2NC5IGUQJG54aa9WdqCcsYlQ/o1Hz
         +Nlj9QrfStLfMGNafh57HYTVg0Zmwt4SOn+XQkP7E4V6Ps2UqMv58kFIHJkAEKwF/vi8
         skNyHCKjs//W/EuIxjppsn3Q3biu0DGToO5qI7IF6GXkh1leuglsl0ZOYdtM/WEW2CWm
         59HQ==
X-Gm-Message-State: AFuF++nOMnmnnZBNkFTHwu4BAkHVa+G983jmhLbM1pk+V/y2SM8iKL8w
	JJM/A8hI/FEOYxgoX8IeuE78s2jc9zhlLLCTmdNbthkL7hkyFm/zzYu2XnJvvWW+OBdCZUbHxG/
	vJkffbCdgnnKC8bWpYXLQaM9Zc7d13zkgTtHbI6Jp3d5jremOBPSxlSOCvZM6v8IEGJ40
X-Gm-Gg: AYBFou2HTkL8xLIhp42qIeDpgyfogrqPIPguhZkf43wzxLU8EfHnVo3CG8HmLn+u9YV
	G4JP1WH9xqCExe4U4AlxYGOPY/euBE2FhnV9oZNIT8P3l083m4hfR1G3n7VSSBs7t+ED+gzFzvZ
	0X0WnvQ05NrawH8KgiYB8yzIR9qI+0U5CdL2ZVD08+o0bOuNonYX0R3FjFa/p1LkZfrTNENP5mF
	E1gHHCvNjPRlBOWz0i2GnGIkXh70m/j2F5Il9fwLg6+VhIbAQg4WwiLvrwiB1otANxoJj19CUEI
	0uKxqQMyak3UPq8AuWCK64MJu4c5teJh8IudZbJBvn2vWCTYYq4nF0/4s0K3PuWMrOA9uKFfltu
	YYNEcWP2L
X-Received: by 2002:a05:620a:4148:b0:93c:2c15:e51d with SMTP id af79cd13be357-93c363d6666mr216465985a.46.1790246434474;
        Thu, 24 Sep 2026 03:40:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4148:b0:93c:2c15:e51d with SMTP id af79cd13be357-93c363d6666mr216460785a.46.1790246433838;
        Thu, 24 Sep 2026 03:40:33 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:25 +0300
Subject: [PATCH v5 09/42] dt-bindings: clock: qcom: sm8750-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-9-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1901;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/GkuWioc8EmlLG3OhgcLeY/qF3cuJPcE3d5ehINiuok=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3iS849P+AfG8Zuc04kIJdWro28qL000OlnP
 cN3aR8Z3SWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT94gAKCRAbX0TJAJUV
 Vp64D/9s5YJ0v/ehu2LuE+H1lfTvrwbE3H1S7+TteZ7YAXK+nqta7ztJMGHbvD7jhk2qwZ5nIab
 YQPjc6pXmlSWgOWne/VmlrgvL3grhlkCChVDtsXyAch0KAZaIRV28VTvRssrYHXz/3OTRHsXPC0
 OeTDTYY63suZiXTDrolsuLTUPpQtNdNvWfD/riO4r5n84lxTLZpe5yUbZvw6nQ3+qYMrwZONWWw
 GZj0o/PdIh3hodK6lG1Xtn59nQUtD1EiuxPDN/qFuPcMJxIzx+ZqgK1NiKP2/80NIHWeWGJTW8t
 +hlFtvT6flLMTWpO5jqfKIjgrFc3XTH4tCFBOeKwXdnE6YsBFz++qgEDI8g502DWvIM+kwDI0+B
 ONwB7em0q5hSxH/6wuzyH7JYRXBwyaWbzmjHBRp++MOKe9iSdXz7Kv5T7O9sISp1Us58wdiueqE
 /ScXYKQuwI4LenDPRSxZVYa2GWDOcR6bN6EeHeLVgHD49WefzvNmWu+W9wwN4xVLhv3XZYZu8wR
 oE72XU/utDoM7DiQSQTEa1ldcZ/0JDN4nyP9hPLT0KNruvQPoFz4SVMqkr1+HShE8Nte9RnpKsX
 Sa9AyW6FpWGm9a60+5PbScPPxf6x2Pn+6brVIyPvJuPokDAQ0tqMZ8tPmFsK5h6Li0zBy1My1rw
 YnBjNQ4C4hJ7aaA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXyE9uDIDi2jR7
 TmnWpVG6y/TCgkwng0vdhmnFo3Kyua0/xSkC5NpFBnr4cHlOukDEkNNPbyBDnxYJVbuBdGY+BNa
 TCLvphew5+2i5KJWFYg62BAjd7QldVBKfhuHVfUv1BfjgEMrqO/Y2YAoWPQ53iD1aqzBK7YapIQ
 mJrCFfME2GSBjSeDvgMjxxx2LYczms67C8U5gMOeEuXxNnDnHJlZ0ivX4a8pg+z5MHSwA861www
 QFz5gY9l/qkOSj6BHZvgNu1VxZI8Qy0vw1KqNyqnGZBSQ5G8N/ZVhM81KTp4s6sDbzBoA0o14+Z
 IlH4aO+HUK7J8AASeGN61+AoIw8IdpIAYIHCjnlluqDQyfyxqXYyRNoKhmEA/HP8HXXh1xtWCBw
 Cs9zcq7xFVJHgFoPpq10fepd6t3h/E1+RcQL12agfhJYecnDGJbXOYcXIUnaryLsofn7776wULt
 KPPuKTi9wiuQA7qskkQ==
X-Proofpoint-ORIG-GUID: 2IRFXwoa55xUuzoNgE7whiorJ9vnDVrw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX9H4xsRa4k9xF
 XzHM0Ln4ca9U30btxN7DfjDBd7BDZQHZnVD4pcuB7WrYJy9Qod+4YfGBn5cNVvjnUyWsS8KEQJ9
 FR0ucLhULslrAyvyikWM+ofjqZZk/2c=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 2IRFXwoa55xUuzoNgE7whiorJ9vnDVrw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SM8750 and Kaanapali GCCs are supplied by the
RPMh CX power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Fixes: 342d2a607450 ("dt-bindings: clock: qcom: Add Kaanapali Global clock controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
index 0114d347b26f..59da3eb2b073 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
@@ -34,9 +34,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -47,6 +52,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8750-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +64,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

