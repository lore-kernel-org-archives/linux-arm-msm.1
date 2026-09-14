Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33426479894
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390102; cv=none; b=GG/yHbpYo8u+V4MomorD7MmImLUC6Yjxxzt6kSKzQq2iCbjk2Z+aGeolsNcqkAT17fhd1EG2N2wO/97ZYAE+LfQEiEmr8U5u/x6ZjS6gYxVoeaN6fooDuf9N9645ckRqMAXqv44f4E2x8s47483ErbXUjyO9Y3ik9MHkO4gY5T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390102; c=relaxed/simple;
	bh=LvvWfbXuyJlvm8eskwUL5IeBcesN2ImrgD9wZBjLG7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYYqvubkzYFGVnK7FpIMjw/zvIR/c/VJTw/zREKfGTObbCzWswIiRvvqhmbTK7M1+dcjfIukMQmBXeSXi78y2tkLDsYDSkcN7+JeyAyTc+D7uiNZSadM1nvECoRb+GPiJapboWzcyX4I12GuqGKMlJWzNBrVeaB+9+76hLJH1rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4Wwdsx+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U428e61m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4Wwdsx+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U428e61m"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRIkb407030
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZz2Yu+1ZmUpDgt4rRtOsrqf21LhHDIfRsUyFBdeHvE=; b=J4Wwdsx+xUYqZNqo
	bpmUYl0fMBbVKdY7ImH7pVBg9XPQwWkCTbDImqjplsZyGuj81onP5OLKZrzNSyIm
	QjqhwtJAYaYcpkaVls8hY4Hf48uBQ2BlJMl4L53jPMoOOgWYTnjan9g01snKHmQ5
	/bm7yXtmCRk5zS95ngulYZQPy2rUpfoxC1FH+OEJb39MbZRjXBXb78I+Hxr3S3ng
	ZDc+qzttvXZray147IUUXrBuP1XrQemQl3uZOUEq3zVpDL5MqZlfG72PxAVqi026
	x6KLgBat3bqe8gDEL+roMy/YhCzaXjVxYYzwad1ZGNCJWNB/x9V1cpJuNXGL5bjM
	00nt/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr86s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903622880so849815185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390098; x=1789994898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZz2Yu+1ZmUpDgt4rRtOsrqf21LhHDIfRsUyFBdeHvE=;
        b=U428e61mCLhDHAuxhpmV4NrMXT5G8xmlaOtqb9xm+9m0BDcBgSivpx5835dZm3CZ52
         3Aw6TGP6uQmnWZXy9vB4DGnpYCu65Zv8XYd7yxBAnvawaN0liRShtsc+FoY0IHfp9qt2
         S7VKqE+aZmEuLE6TCG0fRUmomwFv6C5CSLPR7GcMCdqWyAw/j45VO0BtWwscFFk/H7GT
         3HL82OkfR21RNlBs+YteevgacXgsXqYFsLkWg+R2gFF9cP7kui9eOLqeBIFs5e/QZQBh
         OeIfzcuybQWKdNX1YpOpA+raiFnrJKffb4Aqd6ZuZ8g3n61ikbUnwxu+gzrwEQ8JxbI0
         CSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390098; x=1789994898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZz2Yu+1ZmUpDgt4rRtOsrqf21LhHDIfRsUyFBdeHvE=;
        b=FsfFgxALiggib3lK+hbND2GfqKADtQO5ZGYZo1GM4mZ3bLvOqIJV1InhL0BtmV+Grl
         S1ZcjtHvtV4y3VR6m/7vfJC+D5ur2GXMXBuAl0Z5/ux2xvZn9uNUvihkrPqHxtQMvzQl
         r1vPj96iqfsKkFUDdj5keF/hLfPlNPdVc/elwl0P7RUmKmJUA+c4cC6bN9PQgJ4rW2Ab
         qm9gEeHhizS0hwQN/yX4zaxpp3T0s1TS0aU3n4/ybV2w+RLr5ampRthTKRZW6aMjgakD
         irQusq1BXL+CY6+iQk3qPbya7pvu4jWvfw1cMQPBcKxISp/QbksFIizniDfjgSrC1aMl
         1wEw==
X-Gm-Message-State: AFuF++n6sXH+lVZs5/9WT8cxsYxPY9PbcQOESFhKmx7+yy6KJJBPOZgK
	EMW77ZSmKlSM5e7dEbql0/nP5KIEwoAru651OKLmN0bP6fwjV95QT9hyWpsB2SJ9UT6enLCMA+o
	TtAodEL1DZMCnz9AMpqx8CpRODXcwgoXqjtJml5BEglUUloMT1N6tcP/PyORNl9G8AEkJ
X-Gm-Gg: AYBFou1RQERPsIOcKOv47qX+vUYyBUtDGaAI1JdIoP6zgKH7vgd21t/XLmkBSP08lWW
	xFjT1AAV2zfA+pJ04IXYxo0qEdkqw+KLNVOviZ+cZSUV+GZpVaaiyyeMsNks8yP/Desn5ZOIt+i
	cVumSCzmJkuFG97gp/LXr8Hvcy8ysvqK+MuHCKbDy5q4PfdPN1X4ege9VpbmiJAJSxlUm5oTi47
	YWsPv7QNPzSE/wVxzpMJQVaV6Gp2EM/OI9SBxIL4o4/Nrj8brPSQL0AjD1SoM4FPL8sFVIZZ5F9
	XCuaK74Qpl/LI6aIIKken4A1kc6oi9S965Fzz/MBH14BvJsP8vn8V5aGikaXn7RJwhU5pcqTa3Y
	B3qpPM6mR
X-Received: by 2002:a05:620a:40d1:b0:939:f861:8836 with SMTP id af79cd13be357-93a18601143mr607411485a.20.1789390098324;
        Mon, 14 Sep 2026 05:48:18 -0700 (PDT)
X-Received: by 2002:a05:620a:40d1:b0:939:f861:8836 with SMTP id af79cd13be357-93a18601143mr607405985a.20.1789390097762;
        Mon, 14 Sep 2026 05:48:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:05 +0300
Subject: [PATCH v4 06/52] dt-bindings: clock: qcom: qcs615-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-6-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=LvvWfbXuyJlvm8eskwUL5IeBcesN2ImrgD9wZBjLG7c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zRk2lGPPuDCS3iqc8bQCNDBapOLWB/ESxba
 vl+GBlxj9eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs0QAKCRAbX0TJAJUV
 VrxLD/9oyR/iGz4tV85OCfXs7U3RmOZBtKQwKPkT0Dww7xwh3xriuGvYqh3cK7CDJ5NeMix/6Fo
 SWblMwACcshnDMnMzQHpyfNvlCvnqcm31nRJIkOfM0Nod+0Im8xRaEmqNwfUp7dmXnXEUHqMXbQ
 w85P7lqsgOYaPPYcptx6rE+yb1aZVEDC54xOA5Kmvg7vhThZLzRKl9WgSzTVt7OjwXLkJr7XC/L
 14EQRE6OIGiUNAKp/ydrpbiMmp7633GVE4pzIQ3fmLD1RoGgk0mW0qOgya+zzEENUdBTvwAonNo
 p26dlUB9Lo7q67ebMPzIwQ0IQN5Mc2UPF2HZ6IyvfowTGZ2pTXRDlWRsQ4ZJrRwG0FFaYpqayYw
 kYvFvaYae85LK7uP6PlRi+6PxW92hPmhltfGwEOyEXIvgT9gEoIWuzXAisYnQrrcxG0IEkC5dTz
 ngRrq9KaENHd27D9xpqQm9LGEUCzihAVt7e58dseKzyzF/480r9Uc+UbMZDuxJQg2berzQrnCGi
 Af/POskUYBLmrNE4K6/AJ+lN03QdjMqVtgKt2sisPByHd0eDIOjpWWH98GyqeGAssJqC3jP7DXB
 AZ0wlLf6iUBGZLxBXKteX8q7x8x680d2EjviMGvhUGBxPqVSrFqQOgocejOEWbvDbqpv3v049mn
 gBD9g5KdRUmvVig==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: hc4XkoSZ-X4aMq6Z4LWpRd9Jd6IuGepx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXyc1vfdrme+Pg
 v0c22funn3CAc7saooC1HyFrkwpsFDqt620VTV/etpPHv7oUdTMmrCoankksMGnyl5lxsEOeavq
 jz7OVn6L/iNKxE6uewhmCNSYQ2BIF2v4ibMlVE0ZsImOEksq3XN5UjcKLtf40G5t4vL5m3ec/QL
 ACUwnp6MyjcZBqdqM9UJLc1E+e6eeKlEJPCZ7bGqL2RdTKu8d4fBSm+g3AaHvq0sOYR+vsugHhZ
 kldI6j0yWTOF5G1bAJtOnbw4dGXISKNbzeDJnwmZsaW0/YEsZ2rsMNuiRzn7gi0YV9F96CeEA8t
 auuI4Kq101lgS99cBCmKnTht4+TwPyu3LYKggcsOv+TcUcQfcau/26tpoosp8NYnADDUUikWBoS
 bSVmokx6OMmO/3ncLpb2olFo5x0HZVm7JRbSP1tCa92JnmCEDywk3PBKbGcTYXweQuz2wNARdcw
 B0+eTeLRgbtvbS5xzZQ==
X-Proofpoint-GUID: hc4XkoSZ-X4aMq6Z4LWpRd9Jd6IuGepx
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed13 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX7R0iVQxhz0Rt
 qbm0nWGViEefs5RYYqvMcpRQzkMfnZ6qid6SKPlc1l4kJAhQWQyi05jwsw24e3amlJFs1PuUi7f
 RA9WUYyP/i2aW5fnBf0FQIkatdDsAFU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the QCS615 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
index 4a828e102d25..c87248531563 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
@@ -31,10 +31,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,qcs615-gcc";
       reg = <0x00100000 0x1f0000>;
@@ -52,6 +58,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

