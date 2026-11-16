Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835049;
	b=YyK5H4nN0kb7E6Va9ktsnMrEwWTtAd8HW/q52fhSwVC/9iKZjo32bjRafMODDUAcKnao
	 ndfOB6DBIBeupUBcNW1X405MpiVTFssJxZEhMlO3SZZByFr73l7h3xVjisB2eUdKQMX96
	 j9jXXOziPh3wBDS3MUdxq/UaWtPwu0tJ3KDoGCMH8WxB3oD9myupUOYSozTQWeBbBiqig
	 /mlYiqA4ZBdpogwoxrZSPl2p+WL7I8fIEGoQF36KYauARorKXEHG2jJ12lU+W27wBqYPm
	 5Qt8/2nJfmfDr/fh4TLkq2EqtZIRipg244B5e+KyrYyTLqq+IyaYafGklc81q3w9gfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UjqYFlsGYQ1BQRZcmH5d7N4ve510rUSjekhHGgLagxw=;
	b=PtmmUrhMz2nA3fvVstvhyX6nL4STQpNzQLJ98w2oQSskLNhiBkJAYFyjtd49f31flZqb
	 lElbpWhqUq7uZpTtrwKHbO7VKg9mKcFr2S0jdp9ucsV2cTpB6i/QPaXP1UySWqfU6XS0h
	 UVY7fM1Tn04IoSPtN0WkutqBkWDeJ37z6PX5OscRsLD8ka0dQ8KjpHYGk9F2AYVjs6XUc
	 Da/RKIzJkXZfYxe6o9ljDbdmt2msmuvxkyObnY1t7JSaZmvt3JKEI5qCtkh//DFFZcUa+
	 z+lrquEJRaZ5UAlLJyAjf1s8EUEALUS1DA7jwKK29xcb03I64cEHaumKQt5dGdBFiUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjgWI7YI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DQ9tHAwi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8244606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8244606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjgWI7YI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DQ9tHAwi
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC18NH4069702
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjqYFlsGYQ1BQRZcmH5d7N4ve510rUSjekhHGgLagxw=; b=QjgWI7YIpdtgeP0n
	w5Tkt6XKngbzdR+lvg+gkpmH2poPymIDAu/Nxg6f259SLON41kBrIbBRLpC6pqtB
	DkGBx0jdXV7lMP76y2/MF/I/K4HfuhQdzfNGgixDcOV6lSQUX/SniloQgerVi9OR
	OIOqXpzuLI0xKHxyovsPT4Xo6SyzCF2GEQZxm0LfV7+iSs7iBdyc5qsaoB8Ufje7
	cNULvOMVcUPquoVRD0zft+01AhTCpM6Q1M2wf1/k7oLwWEP3F+nk2DG2k5kYPWq9
	C4RSiHSZyZLWaAKY4JQU8S+l3h2IxxtTb+ZVIyjPaX5GPHW+bthV/YCJIsk4Gdw+
	myH4YQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcehpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:17:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495af07676so474894685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835047; x=1795439847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjqYFlsGYQ1BQRZcmH5d7N4ve510rUSjekhHGgLagxw=;
        b=DQ9tHAwiQ5VPLDr7ycd/81zrL7AwqkhcvOU5+g3lm8sIfZ24a+FXUo7wg5BzxgbxnT
         6QNOlWwhskv2kHL3BJFHkFTnYHmbUlncXmf0vC07zPhafu5dYxXznlBK3mq9Mfd9Jy6P
         a/FCVaK5rS5TzlkaZumhPBdoh0PRRP8kLG3CAY5QA/UM9a2FkVkcyoPcQPLFMpwkHJSt
         RW+dw4g1hlf6m9g4RbtpHRi7ceETbXYv7AHO/RSRKJlxC797z8OKmnH4+tm0y8i8CpGO
         k3NtQPfWO85kXquk2pURHaJMk13NYk5t2QAjzEY7Qn8uk5nfHhorNMOuKi+ZfZ9kQtCY
         Y2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835047; x=1795439847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjqYFlsGYQ1BQRZcmH5d7N4ve510rUSjekhHGgLagxw=;
        b=LLH9vGz4hVBlfRaqaiqu/QeU/jR7l4BsivP07548Su/D/Fy4PQofm2M3VzDOu2mial
         n7GZd7cScvQmx9/XEGteD0AUyOYyCEEZL/SwW8qoq+W7tmmDjo1Q+dp8O7TPGIbzO9nV
         FCTAKUrXbALYdjhWz80eYb0Moo+CAyjJUhLV/e0x9xg9Cyf/xtJ6Vwilbf+QBmHlJM/J
         UWhycbJP51SFmc3QfGTv8h7uCm5A/drV/U4iyVA1BCvm+8mjLQROa/x9TkW1PRH4aVmQ
         yaE/pEiM5/iyzphFnUxYhPyLouwN7Du5FpF/KfRAf6QjiELHq/j/arDl9Khk42vSn2jP
         T1tQ==
X-Forwarded-Encrypted: i=1; AL+hErEi1HNI3qiV5nlDP2wJJ6m2PT4m1pulSen3ioo6qLzAavipjoRLLPB5IPqBYehsv6tLbBNIFSk/1ld2CDx1@vger.kernel.org
X-Gm-Message-State: APuU4Z9Anq2NA21OieZsAHZFcqK0x8/KDz5OLqCPIISEHrDzxwqvmF0S
	LolvXPCCe4GMicvbS+ntAWME2FDOvIVaDwfOdepr41SKpi+VkCxf5AUOpGAhH5DpZII1dZ20cXJ
	6g6VrwuzgnQ0C20vSRaDbJNTcP24KEaVrRG3N/4wwdQny85JTdQ/QEP+F7ofxk1bmrpDV
X-Gm-Gg: AYBFou0WVDvd5ijU+DLcxIBwOo9QAmCbYpyN61gMxTyabmLIaD+dvg7iN2OxYSzO9SL
	dIn1QTabiFVt2JhskHxGUfncuXkE/T2HW0SNsdGSlKGrcveDbhChuB1gM3X4RE8on0oGkLugvNp
	XzKqdZpZIdyulQBw+OZ/jzhK18bA5RkaBHYL13KOTwMmfYaE67SRc+B1Wz9AQ5FoC4d8IfM3/CA
	mIBgzbC9vuJwjrZ5+5r4Xu2FribcZqaCWxP7miaN2v2cnQyJyes/ZOTgxd+s9JiIw7oCp0miKQQ
	4jzHa5lKCHKv1GbQop8dfsAv5MtBIQrRkFKSxxCRQTDGkh3prKiITwI1qbTmIouaOWAPk7bG6gK
	WgxN53s4ZhZ7RNvNzOLx0OimygYc0J2nS4lp8C7StHG7wg7aHMEVrl4zIn0MiLoY/tTbeBjWMuH
	cd
X-Received: by 2002:a05:620a:3915:b0:949:7572:e76f with SMTP id af79cd13be357-9497572eb07mr622419685a.46.1794835047032;
        Mon, 16 Nov 2026 05:17:27 -0800 (PST)
X-Received: by 2002:a05:620a:3915:b0:949:7572:e76f with SMTP id af79cd13be357-9497572eb07mr622412185a.46.1794835046441;
        Mon, 16 Nov 2026 05:17:26 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:17:26 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:41 +0530
Subject: [PATCH v3 02/11] dt-bindings: display: msm: dp-controller:
 Document Nord DisplayPort Controller
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
Message-Id: <20261116-nord-drv-dt-v3-2-e3d3bf0e2c49@oss.qualcomm.com>
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
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=910;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=nRlWeo6qwZpE3h30qNK372PqbYIGf1MFndG0VIRsKqc=;
 b=i6ITwZfY21YuZyrTMvYWrpTI+9AHfbQ5K3aBNJlABaLA9eT/NNIL0fXWuALzmd8XnCtpQd0ZR
 F2hraEx6/IlBVnXX/+Dn0+ng9V4wOg1HwNGpnrt86PAM/eN7YQy/6/E
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX4EDcqjIVVvVC
 QpkBm1BLI39JoZ0PGdiZzQJJxHcN8q6PyQ2CygDP0NZWUWebfjYORZFLMapsj6oMjfM9C4CimJF
 bk/NoTAFNNt6QMura97JvoGakzNav3k=
X-Proofpoint-ORIG-GUID: E9cbJckZ2Ix6v-HRJ6WPdnyTHoGm2k4x
X-Proofpoint-GUID: E9cbJckZ2Ix6v-HRJ6WPdnyTHoGm2k4x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX0n1wrIxMxWJA
 r7kbjNjIk0rKHVunPV6Ut1SNsp5RvtskLRwz+saoSF25/zHM/3y7ieKrUeqizoQc1YNSzSyr4qy
 wSFZE/1xnG2H+AZfzGYszebIs4BXiUhztrhwASNYCBpmHsMf0HUZZqM/pBpq9ljH5P2FEaHexwu
 3xq+XyUv4ddHtueEZtDDI0dvMktacnq8zKUE2d0sVhRddJcv4mYQ5CWLtLJFMQ4kkJfEqbLO8NX
 cOmabTwspTwOTqoEWqVV7jVVH+l2Z8P4plzFa5I2sAd7+cL1AJR+/fBAGQ/TNA4juwjDbfgyR3G
 wZaFPrsR109EQxk6EM/NMXMvoBnbFdF6RJF5KQzBR5ozkNuotRFkdp6TcVg6+LbS9TIyo6cvb9t
 eKU5bx9fppUkSwJQ5goVT0zMDc6UoNP+10//4QFzqrCZIZU+1F7EwYBmhK5YoVDMgLoTkhtEI01
 +9vOcBvzLGGc78IK8eA==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afb0268 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lCWEfuFUYIIHy-HYLagA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord's DP controller is compatible with SA8775P in terms of register
layout and clocks. Add qcom,nord-dp to the sa8775p-dp fallback group.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..9be0288261e7 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -35,6 +35,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-dp
+              - qcom,nord-dp
           - const: qcom,sa8775p-dp
 
       - items:

-- 
2.34.1

