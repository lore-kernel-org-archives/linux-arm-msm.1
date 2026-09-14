Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAE447012B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390095; cv=none; b=gCB6E/BUUOgipQjHZxdUG2Yh3ieMzFZAGMSmq8y9ZgFHjbR2TaftLRtTi+PsNy1XC5Di2YRTGMkpPoAO9/+43CGRhlbKlhFV8yFAfboIxq1f3zT1CWytQAmayv/HTL+xuzVq4KMzHYb6EN5cNT7PT8O07mr1EntdqZFNKT/LtK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390095; c=relaxed/simple;
	bh=HfNHkaVNQW8Ivt7UX8oz+gycqQ1mngAo7/JgQDEJuKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZo9tMhvotKbZjELkGOKOVff4Gtpe9TazHWcqxSgTci09V03Kws76RH8gcDJwNXYmaO3Y066lekzdFeU68q7Zads//3NruM6YkmYimPJKaAMw4WHJBa8ZBlGm5/SbyEhenF0Xb4QCcRL2LvPyKkQh1JiwVI/eu7uNcwbvj/b6Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzxD7pge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f3Xl4Xx5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzxD7pge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f3Xl4Xx5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8YZ530979
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dmVNfPdj0vkPUVD5zgWrGN77gfTJny/x13eJrlZW7Y=; b=hzxD7pgeXwJqbBaH
	gxxAEUehlba71vOBJQtsrBEa2kcSgaWY+ubcMMCyfWTOUOZrxMMleulrUD8xPa8X
	MExU/bycvSPhNjqm2Ku48fh9CZi+hz9iNtcrTxduUMCmXQJl361bZ99ZAjPHlUOr
	DtHPIFQwwYxRb4qbgCTo89i3d5tN7sqdF9Zm+FyrmlfgpTgZICy9D08OnKYj6T9w
	YjW554eBV8lHBnGplmLIUyko34JW9xadxBh3Y0MyAHnXHQxSubAC2MgNOoN3VAQP
	A8N8JWVZkJ/53OGbMNpHY9+HZoxTLsoX0nmrWXeVWpeU5m1B0HphwtE6cV0kqVBZ
	a9Bk4Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstfm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a05d645acso442543685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390091; x=1789994891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dmVNfPdj0vkPUVD5zgWrGN77gfTJny/x13eJrlZW7Y=;
        b=f3Xl4Xx5zbnvQk7Xz2rq33En7t3pJKxdB7rU/fMqMon2q59p1IxY+yb4umYgCWXty/
         yMpc0fVGIzdmJDKOv0OxHa1dXA6p8F+LhW7Ltp2cjvt7k6ePhGs3APVSNd0BaKJHyTIZ
         jmky2WM9xl7PZOaP9nNPeKJY4QMvwLpksHr/HFG1mxLgBxWLXlGzzIp2x8+4i7EkQECd
         Tm6ZmIHQ7n8ZiYk0U7jxhvXGkwjayDsc/1iZHcTF2NUicHaSKQgtWETR+vG8MZl18ARv
         G0e2rqufMU6POvwKUnC+FVXLRKgJtvgsalXSTLoZxeoTNfB0Rk2eEm1AgyrKUDsc64Sl
         bsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390091; x=1789994891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dmVNfPdj0vkPUVD5zgWrGN77gfTJny/x13eJrlZW7Y=;
        b=SLJiQHG/QbIRNKC50ULKnsAtF2GRYiEXzPk1+PrOialHyxvBqeemtIza7jeeme0etA
         Kps1kvSB3cxcwYHRpvofSBpXwtZahe74p3CEh0gvclcPJAXn325rO4bXeQ2+l+u5rgxA
         B43jJErHdZy4Gvz58BaCs7I+X9yV1Yc1Dks9539riE3fZTM4ZhyEHy0m9YK/yByetW9e
         ZtQ1xaRfBqruUbaHv/V+yNJc/71Laff0vgQew3PpywAL+7Lv7Hg1zC6G53gtHoVFPI8f
         Ev1QBc5QdNf3FmCAwACs7aUDycdCnjwIO+NxowK0bpD+04+npLIz+hPz/fmQ3Qutqrk/
         DHTQ==
X-Gm-Message-State: AFuF++nFnZCSCpDYONVw/H0QJe5lfxyysTkGmjIzmO8vKoxi1rnJ/6oG
	ex262qSqYMvw7zePfPwusEWgK9+ZAEMx3CLNyFjdZgBp0NVJJBbxYD+R4U4bAKvKfZUt1KVRnvy
	dc1GuyRBIS8pAAA8BIT/nIivu+PSKCCwMqRiTt7YJfw6KOfy8ExYuhKvcrQbeDX6LI0/0
X-Gm-Gg: AYBFou3YQx8wv24BVcdBQnPodDpOjyNaemjnpiOBo81SfD1fkSslKWuyyLu3PZJeSjK
	VvHEeLD0UdL9toaa8mjPaX67K6bP5vL+yPbKA7UERH3P0m3xh4WPQ/72n7D5MOMIsskm4I7CNRZ
	i7zP35d04ObJu6pHmZONQNO/veYegTLvzQ1vUeVbwD7wA1Y6w48caKgVrkbFRUCW+gHCfrZefwf
	HPIhQdBEZfBMXUDM4mYAhlaB0wg2CoUq9BkdjYQ6QAmF1wmG4ZTgv8Zdv1+C1zr9cVaJqgxI13L
	ulF+ShUaMHq9zl2v3HxzRWeC95XciGXTAE5fCGZDzwUEmt/FfrjdRfwNiO6TOwke6Ujpuy51YyJ
	73+/oboQy
X-Received: by 2002:a05:620a:489a:b0:939:fa1e:d6fe with SMTP id af79cd13be357-93a29966d7cmr334801385a.25.1789390090665;
        Mon, 14 Sep 2026 05:48:10 -0700 (PDT)
X-Received: by 2002:a05:620a:489a:b0:939:fa1e:d6fe with SMTP id af79cd13be357-93a29966d7cmr334793185a.25.1789390090028;
        Mon, 14 Sep 2026 05:48:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:02 +0300
Subject: [PATCH v4 03/52] dt-bindings: clock: qcom: gcc-sm8250: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-3-9d5a606ada33@oss.qualcomm.com>
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
 bh=HfNHkaVNQW8Ivt7UX8oz+gycqQ1mngAo7/JgQDEJuKI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zOOwIgbxods8dI3eNoWZOHGKl2iXFWTRguw
 YdCq40ZQj+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfszgAKCRAbX0TJAJUV
 ViXpEAC56g5nwPtkEKHi1LBazQ0ZY76kDbzr7aGAXOt0oqDLb9HpicMxabVKpolPBJJM/rCr5aM
 1C5qz3WFmFvEoetOlIugySPphwMB+aSCJ+KWvs6e9XVu8+/roLYk2cGsUYjVmufeW85P8v7RtKu
 QXcn+6qNURNcgBlwrCO79MQxxPGvVmKyyviy/ckA/9oYnVp88BK2rTSK3bJ6DYIdZzYnSzfw+sS
 2qF9H57NAkCSbus+Z3X9++NuNo1X8S3MJe1UQ24yapSqQikFcF0qfzsPlm6Yq1FTL8a1VIMJKFx
 j6w0FinE0ezknAM2ReZfG+e4kg6y4drLjsw+rYMAJfYgxhqK/q3U+winPG1vPcPO5eGhJE6EWOb
 DuW3/6TazCtbS/Tma9OLW9eAww6UQ39B3JdInRJ+iyDvSW5JnhD9kHYjkQ4Iv2bWZwyYW1G+Gdk
 +wjTckEosNHBjaeCxfZMqY4iqlnucPNoaSPGF4qbiSZxkT3uUiJwKRH03cS6n9x9TDpp1igeYcK
 mEwM4i9540Yl00nendPLQoKbxWZiLQ+IzUgiSxQmkoaKhkXyfnMDNce8ciN3NIsmB98M6HmnmQE
 SaH4bxsAhzuTH+88B/kiKj7CfCTw9Na/J7nyvcIqVERkLZLQxM5lm4C687TzjMazqJOTrVtJ3IW
 K2SWTihGKZF9BWw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX5+safQnqu83s
 +8V2L2tr88oVN/xWcHFLE7kqoRrWm8/K378y21P//Ch6GWpmMlvYKdvW2vrOdM91Uo1CWKELdwC
 BwI1mTdZ0UBz/KzYcGVjc/pR/xLPVYtZ0w8lLcYPgZuMdF13X9n7hNklkScu6Jwre2Wuo8djry8
 Ni3rwUR4qMJQsaGKnDOfb8w0xXSWcEL5x0II+rZm5gLOjrNBytTTv41iFhDDVerZJTSotQpH2i+
 a/VC7W0N02Ir56MkMwDUDp2tYoaBRdFOBa0z/BRWHDeYUC9vDKbWsxUmq7HbN+Y6n/XFvTQul15
 dfERZCH9m59uHCdmcJxNeDoeXXrAkipVsMqHw/Q+dWTsYq5WD7lTHKv8qNVhT4JocWVDb/enCPo
 yweIoS3yBlJaASD8vhsPboNwmZb7Qy4gFpfo93820lc0/MwKoI2mrlj3on/jjqLOPvWjuhENl6I
 veJv3fdXjUMxLH3Jlxg==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7ed0b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: av1toM-aUOc7Pu-eABfB2Yt_mdq1nvY7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX/mqtNIIKctuo
 p5lNzMROlsWbVuUoC99Kq0y6wDsD7/pxdSse5Vwk/YQ2SU4v9yQMy1R6ae6Ai9s+9EwJ/ndI499
 l20/myWq2800v8fHDhqAdEgyU/Nghwc=
X-Proofpoint-ORIG-GUID: av1toM-aUOc7Pu-eABfB2Yt_mdq1nvY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the SM8250 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index f4cd5a509c60..5f9aae728245 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -32,10 +32,15 @@ properties:
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
@@ -46,6 +51,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8250";
       reg = <0x00100000 0x1f0000>;
@@ -53,6 +59,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

