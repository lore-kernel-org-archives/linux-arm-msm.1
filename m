Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556DA471423
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390121; cv=none; b=WbPnk6zUW5c730lt6UjnZ5nT6/zKXLimF3iLfJB3dxSyrSlnUzfDqbyeCasdGolIDWVXGH89fUjXiMu0EzUXJmAWgLdaHCbfUqYRw4iJZ+PqA7CAt+wULZ/M7/bqaObpRPdceAcZUsvvHgbaIt+8hb4XnQswqV4jx42bLsT3BOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390121; c=relaxed/simple;
	bh=PRJSk2QBfWJN+tusbboqMv6IVMV0xjBz5ZLbJ7mLLjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UcWGhLZ53Eq0vkwSsji5/ocvNdMO1YZQT8SVhQk3PFRXqkCWhQLd+XU2A0n+TK5p1L18gvRi/beQ2heFhwDOYGcDmEYtQY/umjhnVlNjmjpJvZrpzlnd1aeov12ld6U5yYI38An6bpntDPayLlWUUYYDfwruIcjUHBAbvpe36kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VN5h8kjo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVskiS/d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VN5h8kjo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVskiS/d"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlvlk3860361
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmUS68ygi185/0SYErr+EnQ24e++GTJ96CGKimx1h80=; b=VN5h8kjosF15UGyk
	d1UZZlRRJqJ73Nj5zzLzAEC6m07N0Fx+s+kpc+gTXRV/XmClAsSYV4ivDvIc8jDQ
	b2HfL7/tCsi0VJcSUMo4mBOS0uasTaUP9GlvKnBQZDN0GNBOyFCRBUVNgc5O/h1k
	59I5KgjlAJXDYm2WP0T1zvKI/Yct05gEWRBBHM7LM3xi7vjJ1rCr/SllcbCXEWWH
	tQsJKWpmKhnb2wc/1i7u2BcrixfGDyQBcJlaYFl8O2i2OdNI8OjYr4cqGerardbt
	E3LATlgGJ899PX4uXuLgvy2SYKQ2Pk+R4jku4gR6bUWvCeOfwcaTrgoKTYohBJvj
	q8t8WA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f11bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so291121985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390118; x=1789994918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmUS68ygi185/0SYErr+EnQ24e++GTJ96CGKimx1h80=;
        b=fVskiS/dYZKXooTnrKIQ8btc0TFpqjoysW+63VPgiSD6cz/aWhQ0KDR4SD4ngX4vVy
         KE76c8vdT4DKEZkawdKBFr4GvUyWmIgIc745BDeCD/IG5RGlAuMCdo3JNV8QYQofV++B
         poR+U2pYoymFqpJXZa7Yq4iig4QTBJEmD7JC7ddd+BYnc+64aGxCjhZv5dRF9WMFxS8d
         m3VbJrcpJsHYeTweEXbLPSWChSzWHaGGOTR+7bPcfpCeDTmSNvKvWk3LXPQ2J/C0I1uJ
         mYSeCG0qt1PlImqhiNcYwqbIbhuOBOHOB1azgM9b2fDywHp7nD8oh5grormJVNCZYh8u
         FmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390118; x=1789994918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmUS68ygi185/0SYErr+EnQ24e++GTJ96CGKimx1h80=;
        b=mLwktRtxa9sTfmIQcJlUhRpafJDbRSQtD0avFctEYInbuyndB6RTSdHyDayafBVpIs
         5nCW4vdODPRcwOpkOXQmSOd3zasLuEKsLBffH5294UeigM8gvoUuQZi/IxQKX40dIX7p
         HfVLVauIrUOmteQZuyoziJ8iPDieJ3ooIv0bFiuOJ2ndCCtaA9hUNVe+E9rtUCm3hjbp
         0fEVU71pT+J0ISQKX0W8kDjkezqsVPylyrDs6MZArSJ2eua8MAn3/b+AUSphbFHEdOyO
         FkNoEGMuTb80OH9EVJtScYVN5T5NJLXhf+xKLNo/OJ5uODEuNpok5qbHyZFwSNkW4Aix
         PBHg==
X-Gm-Message-State: AFuF++kSNlQto/th7wCJskvsfrXvA2fEgkNwLCOscrtDspw+1CZUGRbB
	JXJb0Ocb0y5Gfke6GlQaIVsfw6W53NViIHQF1YbqZIS+61csul4M+dGdpi158iZkVJ1UN4K8ikp
	01+PaxJtvUa0qeAo9ZZJiFm8sYyibEVZ/fMX2ZfLovf7D/s/czLGC3Paq9si7wnZWpTIp
X-Gm-Gg: AYBFou2eSIQMrdBFW+1B8z2vHZKK1V4D3oVax0SMAdinQMJvkFy/0BFJPNa9XmyyJAO
	M2KZR1rx00T1PoQ6AI9FgaAzIhbUOURtHT0kYKOaMflZFFhCd085N/Ji0wiSSPySPGnns8oFd0Z
	L5QCfS4+dtls3glIO9G96x/uRCzBA3ag00q6TWps19WTW0GOLt+aRpk+ePxluYt4uMyiHOFMECn
	JwIY6XPpmGlUtIiOHBqycrRv6Xi8RUIWOuzQEaTfi5hXsEI9BA5IyXyl5KwuOSHykV9VYwVIxb0
	iFk0br/fPhnKiwX9FRET6dGD2ihD/UIgFG71xqsitgWDcVSQdDe++bHKJeZFgyfdUNQE1ULUx4h
	a37rm34OO
X-Received: by 2002:a05:620a:1a06:b0:937:2d64:57ae with SMTP id af79cd13be357-93a294bbcaamr335424185a.0.1789390117438;
        Mon, 14 Sep 2026 05:48:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:937:2d64:57ae with SMTP id af79cd13be357-93a294bbcaamr335416685a.0.1789390116777;
        Mon, 14 Sep 2026 05:48:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:12 +0300
Subject: [PATCH v4 13/52] dt-bindings: clock: qcom: qdu1000-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-13-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PRJSk2QBfWJN+tusbboqMv6IVMV0xjBz5ZLbJ7mLLjw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zYl16nTbRqsmM64SFPddapl63aYUuxI13CR
 21LHbypFDSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs2AAKCRAbX0TJAJUV
 VqOAD/9u7mi4X7fHCtsWkR2Si06S5hksigq+TCbBJramKFjs93DZbPP40qeXgYjVYpIy0+QKuvX
 y5Kyzl5K+HcUlyonALWU/GQFOor7EY9vJaRvtEM2NqbI7n2nXbr5o+FSKUQ8hzAj9+f3GW++vFQ
 yYw4G1QePwMBC8+7DmVp4kWZ8eAUtM8u5Fx/fLfqSj6f9T6y/1usNxn9yTeYLO6XrKemBVXo6gT
 VGPi2yr0GpgNvF/e8bK+eL18aSZRTrQZG5HPkcxL7mov7R1vmehwwfAHhqunGkM52EbBXK7dbx1
 CQtsj7ucljqNmiJiBsxcsnV5zx+tKTKxu3nNSlGA76M/I6d/+2pu8XRyw41sN1EPTGlDjHKePOb
 C01scEvHb9l/hN4+BLtQwRujpTZbYh4De6MHYvnXB3MOFfCq6lLIU+TS1Z7zlNdoTv8WM6kJaBp
 jH/YAsMRcl+WDrMU+Ba8cLJ7t7fvXBZLxHbUmX0t8vMTkvw2j4riU9nHrx1/bP1YY1o6o/SO6Oi
 IbPUZMUHyXnAwD8SQyvRF3zlJspybuSNfnpCdJX1dAG3SqB+mzM6zWxx5ANgJWEmmIG2/JKdEhn
 mVIFB/5mwf63H6w0GXb3uf+9+ttUb8t6N/YypxVysBcsc4y3SwPl+hsPB+5rwm8n+pFvMxYAswg
 UkmLwsR4yvnbXXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: ep3taGAhRN6LetXiec4ubWUuy1PjqngU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX86u5AmPFQCxV
 7OETKmJWhYIDYpPVu/cMCYoyiCCs4TAgcHDGHFd7Jj2QDEq2tQ6d1nU1xW179UrIQT4xsJwbl4U
 I9TErXmBLK+8HvpIjWmS4fPCdcX++kw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXykhKe+awXqt9
 P6FJcYRZz+IVt6RcW+BJ1Sv7tun847PQ8JoH9eBitYm7bNLp3qTbTMxK+NDqX1NKEjSdPy9++Dj
 qx1H0Y/buMskpk+66XUZghn9mlevKQmifOIJyFQ5L13SGhZXzQHKlcHKTKdbEhpY1+eaeFW/aL8
 0/QrnGGw77H1vvYL7LMzl7Zwu4s1tZjFi5vR13JN1d3IiXg/jIetzPH4q+ZTbv0dHOh5z4uJXoD
 Qhd+2gIPxr7IoTyFpRjBnR9mpD3bG0iXSCZufHEiZnJp24JynA9nFaRQQnlCvH4lqlR9wyjcae1
 mk1QVtEb7Vh46M6Gw6bS+5I0T/e36b5WfqCpGLIC0RQwngyWqPWSey7RGRoZV3qdxTFf1/hI/ty
 +gtYQWhh+w55+2LTfcwm/jW+UhxFUh1/S76HI+5xoYHPVWv5WcYruw63a7UpVp1/C/hSXAzLdUw
 /NNZXiYTGlc2lF/cueQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7ed26 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=AH-WQ1KBeD2DJq9sUnsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ep3taGAhRN6LetXiec4ubWUuy1PjqngU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

The GDSCs provided by the QDU1000 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
index 2c5a9ef4fe4d..3f2452d0c09e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
@@ -28,9 +28,14 @@ properties:
       - description: PCIE 0 Phy Auxiliary clock source
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
@@ -41,12 +46,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,qdu1000-gcc";
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>,
                <&pcie_0_pipe_clk>, <&pcie_0_phy_aux_clk>,
                <&usb3_phy_wrapper_pipe_clk>;
+      power-domains = <&rpmhpd QDU1000_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

