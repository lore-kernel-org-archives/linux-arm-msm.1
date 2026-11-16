Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835039;
	b=L91J/spVE+wFKG0Wx4TTSli//sNoZ8ZeJUtXs2XK/PH0B6z9gLKsVxCc436K4ncTkZqX
	 oiidBTStmzQuUz/hkSbO19HesH/l6O9PwPJtAKXLA/W3BjQksyoJfKjHM+52tsIUruvJ5
	 XktzSyaprIVUvYZiQq6bKOxEcqo7hiSvi4JG+BcaXgU6QGZaEzkghj6meZ/tN3bluAMPi
	 UQIuPpoiHdWNakJUSz3sGidWin5vEwb6HgA1GUIv8ooYZHOI86iadB3Z7miZlEmOOkYkH
	 MDhOJlKqqIg2Z+Z5NuKydYX8Ft8+B5kobVc04K2f5cDhWLMVXtb6EnchF8+3MUZRqSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1w0FWR5wWQFDU0ye3GVQmTCZT/x5MR8HdbR0B68w3LY=;
	b=IFg3gdHqR4dlsevI7gYCGvUhbMVGRoKLPptxKK0CWzqWhNBIiPEX64lxgKbK9Kh0ezKB
	 Ir0rXp730rrYwNhFfsW9l7cOi3ekwcBms+22/aAvnOqKzU3stPrwxXXx4HJ7cRbsXqJhx
	 FzvVuYkFGfjKbvDZn3Vd1UhBKuvjm4PYDrjTGIjGIVqvTb3N7Mro1he4i8NMLlKN6KTZL
	 oJM/zkZ/zmOMA2ChwJyhgCfJD685Bw6Z5oT3IYGC0T2FNZvYpLNbV+wiMWYS3cH5kXIjB
	 hstae573b4ZV/ju29MqfnAIG3KPDaCQBHmKYEqLg+uogLpKxhhQb2dRRgnxxzdH62rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEBaEYpH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYNnN985;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D510606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D510606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEBaEYpH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYNnN985
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1Fms1214651
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1w0FWR5wWQFDU0ye3GVQmTCZT/x5MR8HdbR0B68w3LY=; b=SEBaEYpHc8jEl+Tz
	VTfNtRbaEmPc2jrwl93W0jgyzhiVnqxEyy96KKDGqfOIzzOoHdfTo/FNCousA585
	/BZk5zDyNUvjk5C+02CzTQPKyiP+khk5F6dMJqDC2Kequ5/sj2vLzxy8og8KPiRB
	xBzT+cMUhTZleyuOIsvg4lxeVgKA3sgdYefq3el6EKI9Sot5Mx7o6TUqcxyXmr5x
	g4b7gpwffP4tJmzx7FuPNZkqcxJwBqKpvrNp36qMEbS/QaAFD9/aXAmCEPr34R6o
	YwiAj8P4FvJlbrH+SrnDVseHGi06M8XW+rylW90SxbLciHpljZILQ1YmFebMGCbm
	pO05uA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqy8nf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:17:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91f03ea17f4so72648646d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835037; x=1795439837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w0FWR5wWQFDU0ye3GVQmTCZT/x5MR8HdbR0B68w3LY=;
        b=RYNnN985P1rf0m6y1kwIFq6QYhfQVl2DB643gped1WQtSKIGEP0AXQQWc8bhZkE4XK
         3Q3LkWc1q14FDP5mDKXSXi60nBWKv9Z92hBCp1ZDnLRWKPZxYEbx7QRaSlY1L5dLYPf8
         LVTLfMcXLVGWgfe6XQevMYE99Hac+dIdRutaixIh/rATYy8AxhMwGCf1pbiK0SM/W6Q3
         WsGs35AH0Mv5wFOQPHLdV3J1CLfI7obUQR2N+M4Mdr6qQafgzV5bHALewcWlBYogjCmf
         ExVGPXWmBkvmEW4DXWPqlP+3zTQR6h1GI//q3wNhfCYs/Wp+lKbF+OLpOqLz0sX/o7Y5
         bhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835037; x=1795439837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1w0FWR5wWQFDU0ye3GVQmTCZT/x5MR8HdbR0B68w3LY=;
        b=DZ9odYM1ponMNFci/7vXDAxZdRGf0Q2/De6kg1hHLZZ5T0xgzcJTG2c+mewY7onqul
         BpYjc503Ycp+A60lFeKBbcgOq90jy5qfb9/yJM0TMW9Ap2IvvI/ezDoXNnb4pJXyyHBA
         cOoYRppicNrONq3+kLXNehnZSr8SZRPIhZlKge9n2TcqnEwgaIg+WI5p0wlHxQ8ftyd3
         4PgFMFTZy6brzAAkwsxGZbIvBrPaakWTFSAorWRzsubGMb29ivu7kNoUjBtic9I6lJY2
         pt3jl2gvKa3UGIvOP0n+zrAWPIR4DPzvf6I+sOu6fHreXL3y8K6Rt52p5QJus2CzPXts
         RBUg==
X-Forwarded-Encrypted: i=1; AL+hErGaaYW0J56HZAoaQFD/vdmV71g6A6o2WNESmsHA+5v30O91CRlhUJarl7nBhtTvLV2WNLQFYy48ku1SIhzt@vger.kernel.org
X-Gm-Message-State: APuU4Z/AS05tqA1/wNDwSHSCwyKGD3aNha5aMNnjOAryRv97676et/gZ
	ycBmw3E33Zow0KML3NMR515+MvLQX+sh8aAtkB4kmBZASkR6YIATZl4w/berL3uGsI7vO0FvfbC
	Fd34o/kifkbXsdAliqLemKc5ioAfkjkXEbs06ElNASd/xTiXeie9Xfr1gT/ot4drLZtOw
X-Gm-Gg: AYBFou0hyrwYh250oudsxL28uvLv4uhDfe81nRDpmKKb2w8yaZEnPT5InYWQEv4zoLc
	u6zqqphSkmq5D4KMAd+tbZ1B+fUIbz3YTdlW2hOCwKAqL2xKCyfXsr5Ah9f3tdzsJ9k8WfffRyP
	zHB4Vs3E1WN9G5NRZC5yLqy7+L1VEA1lSH6LQDsqLiOcarqB9SRvhy/a9m+UUO/2vBFmkFu+WKG
	i7xvue7ZLWZMjdMYLwROzdpSxAPjb1jZ4tPDP4SCnUk+h8YyAdrXnzbCDxLZX9fi15agBkXyuE9
	IU91SbsSD/un1/U1TTHDYGUlWoYFRpWrdE30uTPb7I8WhHmzhPI8dG+QSXP7xjh+n87WECfgIvf
	S5WM2aoFvUQbL6/auNhEg2Fcq74bS7DX91N6xH1QNs2Th3bLGNJGeyumk4doqtnmdtMgoERK5Zr
	XA
X-Received: by 2002:a05:620a:8002:b0:945:c4b9:3de2 with SMTP id af79cd13be357-9494bcb0e9dmr1652192385a.73.1794835036718;
        Mon, 16 Nov 2026 05:17:16 -0800 (PST)
X-Received: by 2002:a05:620a:8002:b0:945:c4b9:3de2 with SMTP id af79cd13be357-9494bcb0e9dmr1652185885a.73.1794835036121;
        Mon, 16 Nov 2026 05:17:16 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:17:15 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:40 +0530
Subject: [PATCH v3 01/11] dt-bindings: phy: qcom,edp-phy: Add DP PHY
 compatible for Nord
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-nord-drv-dt-v3-1-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=1366;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=htFubjaJPIibVGGK/b3gnFKqJhVT4tGAGnQz5T8JsPY=;
 b=qUoDsXThlUNNuRFU0T+sympFDVYGr9xmnyLWpJ06LdBycStF71umIvFt9uuV+rBK3WP3Y1cwM
 cbD7HwGrAdrDCzrbDAebYAipwZgM7ip3HF7Gf1tso2kcQQ8PgEacPWq
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX1YgfennMDVZ5
 8Rd83vdKZtTpoABimLlHTARwaWuKswh1aPT8stoPAiBX6npWA0vLsf0rZhVmQt6fp3udEuwCqlL
 PuafDW8jNCxJW8FMYfkht/9aFiXeI/o=
X-Proofpoint-GUID: TRuWRXhsxSH_Ik3sjnY3r-_T86LxBdT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX1nNr8M7kmwPN
 u4xyioaDJqvY2kWIhwm5Z6FOoRBP3cm2lHgB/CaRgcdai6rHq09SDDvP1ZRgyEDUA0y634r1efm
 32ArI1p3fwKRLltZ9PSrU+nj90qODHRmOoB9XJlRpFHkPfARn53pW3q+8XzFoCerIvv6nqmq7VI
 4uQkLhNWDIsJx3ZKqySOiTqFVJF5o4qKqXFHZhFlrqjHPwg1ceW0mTE3WqdUfuKfW9kiHpCXydw
 EPnj5paR3efrKKgH+UazP22343hZa8jO6BMzA3bL2OMIljFxbNng0wL3WfzhhJi2SQw5FsaMwrs
 k1KSTqtIIWzrd/JOWUkJQAvMYOAY7gfxwZBGkrKCFXG0FH9FUBOR6nLiRglwCmXb9Wy+ahxQvy4
 gytxJqXxiJiBYtQcZCHUFJ5hxWgC0yG3LvLq/vLLfUSQCFvrrKwO0fpD20Mgg3lq9CwsttqVod3
 2tJ4yQajCy5DqQ4Tm1g==
X-Proofpoint-ORIG-GUID: TRuWRXhsxSH_Ik3sjnY3r-_T86LxBdT6
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6afb025d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kfPMoZk3nD7OVdbVor8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord relocates several PHY/QSERDES registers relative to existing
SoCs, so it cannot reuse an existing compatible. Add qcom,nord-dp-phy
to the compatible list. Nord also needs a dedicated ref clock besides
aux and cfg_ahb, so add it to the allOf condition that requires
three clocks (aux, cfg_ahb, ref).

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 0bf8bf4f66ac..0ff07ddcb76f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp-phy
+          - qcom,nord-dp-phy
           - qcom,sa8775p-edp-phy
           - qcom,sc7280-edp-phy
           - qcom,sc8180x-edp-phy
@@ -74,6 +75,7 @@ allOf:
         compatible:
           enum:
             - qcom,glymur-dp-phy
+            - qcom,nord-dp-phy
             - qcom,sa8775p-edp-phy
             - qcom,x1e80100-dp-phy
     then:

-- 
2.34.1

