Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD7B3AAF41
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915093; cv=none; b=gZqub7DrS2c+XyrtKDI9lbBPH9l4Xwh6KOtAtNAEX53xTzpJWcDQRYi13/rgpxeG+K5/HapOQiXS2WQF5OnnXbE9TXeYX1LVUwQQs5M6HcF3NivmaP5ds1ho2GrybNNt+DiVo2LSPm1yAOuiGaa3JjkDcWE3OFViRexosAzYz4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915093; c=relaxed/simple;
	bh=nKcYhq9Tt6Q+VWNEVhdoKYzsvR//5tXwwDCTAB3JF7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PG3Q5AfJfknqyKUNOQ4o5kGd4Wdx63xqzz5sLQWDAk6uBOqhEBPNMsmXi2cM3fsQMvogk+HPln0In47/y2A/wWLOHajvE6/dg7jd2z7axoeOwqfi16d4xYwxYcxOeEjnjAu4tquclPdk/0/iNe20oh13hdXLRYKXC4TaCmVlxqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPo+hAMt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5bD3Cmy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPo+hAMt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5bD3Cmy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo24D2189545
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 14:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3tzGjQDM/jrfxY9zsJ8dD0yImoczDIdSsUt0WrKXjq4=; b=HPo+hAMt61cYwnI8
	iFbp6Vwf+eNTtdk4JNUK4lUrI83KOfuNr11N080OkUXMe25alXXSoCQd8ett7/RV
	1EGgHvzIrDUQ2JKvTVZYIzZ1uvS65r0iH2mhQd7RivRX/L/uU4E/j6ihD6RY4Kaf
	NpDEsyGPOV2n38CYu2kibGHfReY6hUZF7A2kixjMlYVwjaYaeECo7ZnryE9k/HgA
	8IQBtbDTHaUVTvlH30EEJXU4NEAu3msni6cGaQUDpFAd7MZWQbrTeyL5nEV0XMpL
	Re8oME+yf3h/cBLO3RezOtfxtTdpPjbe90wFTuaP+hcTagSA7/vGIaciW1zWB4YH
	hnbtDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqfu8dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 14:38:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so204784285a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789915087; x=1790519887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tzGjQDM/jrfxY9zsJ8dD0yImoczDIdSsUt0WrKXjq4=;
        b=V5bD3Cmy5oA4rudAQQPRNKCI9osop/My9K+9qs9fqaqw0lZsya7SbkntcyEa5IypLo
         Me69ZWjzsMUAFq1nsBFCJyVd/+XC0RhTt4wEgSlJHY0asE3q+jvsFy/ONOSVc70bWrhI
         GZSekeAnwi0mDKHETaEu582gpDNK29QI/gYl0b+qP61cEbLb9NNM2Gr5ZA/EBk5xgwWH
         oWGlxgR42Sxl1g4jiP6AGctx90uduAvq7jsioTO1sBd74MLSKQwtyEMj+8JOlSmZpPBf
         QaCqErLh3kknCnrrL9vu0KoVGj1GoXIBkIqEOSlg1oilnw4kKDoqCBfedcCn9MHmm6xh
         WbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789915087; x=1790519887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tzGjQDM/jrfxY9zsJ8dD0yImoczDIdSsUt0WrKXjq4=;
        b=gk6OX1BclZmzQCqip4psSOtyEgl9XoyalzoLTA5+eIC+Hd9O1Ew9p9I9dfTJAOjYGf
         aMn6j18XBx6L/oKTW4uEivrvclfO/d8cxSrRxgEVFGbCZMdjZITuB2wNYs819oEWLmFc
         ssUJNpVzKLzuneiySHkyof+AtT3F5/x1Wkz7F6d6YHTGUUtY01WRdv2HQoGh6wWc7VPO
         gwzO71NTdcmU5QRHUq2wq1/KP1LA4hrfocDQ6DJpFOm0aRqC2XrzalOZTTrVlUJRgRgq
         oQ7wEgJNKm/NW/gB8vsFCOB+CvhVXRy1owuIlwFe3J7kwkEAhj7+NNId87CdwA5wC9F/
         zgvg==
X-Gm-Message-State: AFuF++kJPhvv4GxAV/omlskCS6XR+SS+4DZVZKqYI86w0Tgx7s2vhClJ
	rWx5aT4N4BZu0eIqaXkn98OuQHDgaQmgjVT5No9FQLjlAhPdK5mLpoWG9CU6fw6lub1JeSB8T+u
	rlaG77CrrouL1cIq7+3iXPFZ6+kXdHGoOVJJJU4h1DL7j2egpj6/2JLyyq/qrA6TTxB7U
X-Gm-Gg: AYBFou0yLM04Ha6SDuPPCre0mU6E4nRPB0R0nPlnuTl5QPzaDN7zFhbIL1q+mbkVeRP
	VzmCbktAE6svJq75Oo7qBrl6s/eOGHW2zhR6v7dzJpAGaahqiUZHx/4+uVhtWk60/RpRIYiOAzH
	syBVdsB0c0isXAvCQuWitPdUi2mxX7ZdbJrFo6Hza66VirH4t+2biAfw0wwMPH2hCmyRpE5ta2I
	PcNS9e5GZxScT22oeQx3sv9+OKOtib9pR477kv9REiOfv4aAlvbgZ+fg3tPYormO2Pd8h3Kh/0l
	madPGcBfBEDAGkLnEackl7msmjmRBBncVUNhDn7wVqda8DhEv/CeGU55R891xEIMUDKh8Rot5Zu
	HswrKaMe4fDSsX1HssXqJ6mrUKHrQCn6JXK3J/6jNZrcg6mtp/TbOIQPEhMYnQ7bRZBGOUEmj2z
	w3LJRO2xNwH7i3
X-Received: by 2002:a05:620a:1a24:b0:93a:48a:167 with SMTP id af79cd13be357-93bf572c8f8mr579909385a.39.1789915086987;
        Sun, 20 Sep 2026 07:38:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:93a:48a:167 with SMTP id af79cd13be357-93bf572c8f8mr579905685a.39.1789915086466;
        Sun, 20 Sep 2026 07:38:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c78c1549sm1251055e87.4.2026.09.20.07.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:38:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 17:37:57 +0300
Subject: [PATCH 2/2] dt-bindings: usb: qcom,pmic-types: make example use
 generic VBUS property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-fix-tcpm-vbus-bis-v1-2-cc9347bbe81a@oss.qualcomm.com>
References: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
In-Reply-To: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nKcYhq9Tt6Q+VWNEVhdoKYzsvR//5tXwwDCTAB3JF7w=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9b690d332RY+Odb43v/2CMarcFSh4vkxbZMmye6wkInP
 Xf1wzmHOxmNWRgYuRhkxRRZfApapsZsSg77sGNqPcwgViaQKQxcnAIwkVn57P+Dj6S45d4rqvvZ
 cjBrT5zAURGjNTHKZhsYj/uZtZkeWGomU78y5ujuQ77XG5+o5d5OlmC7rSOcpTtT2V50uUScK9O
 BLr7ypZ6zau5WFFySORmbUpySVMJ3XNNKcuPa+sx525JLZj+d94Ox0POUd2qFh+NS75TipeEM3+
 6zNzxJspyzbvOC9hcOTEyGV2ouWIQ2bq7T+BHyfcLpl2dlfaV136/Y9VFQabflZZHdQc41l1dOk
 bNduv+c44+tDsIJmkELfZ+xdgr3xb4+YRn7QdLOjC0qtd3LKfNftVLU6/l8i0rEDSdE+0ycldfU
 7zrnfEqwb/3bx7e6li4qOv2k4b27M2PtMlfbPULRLSqXAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfXzGwxrnGJYLhs
 rU/eLEZonazz0A0783es5R/bv2amlN4HBUrIwbjiVVmyIVjp0b4Jb9TxS/EMdRXvZuGFG6d+aQP
 DSzhDaNT2mHNqQfrIke/gTiu3UO+prZl2Nyby0A8+x0v0c+ZntCMZV5Y/nd8dJOCNRE1fQbcCOH
 Ol0P0A7eYUa/NwtRsLI+0+eXTuLALjbQME0jWpcvxGGz3Gkd/0OO9f2tmNfUdpIwGuqDGNhuJ8s
 rmhbLxwfiqvuDm5Ia9WsV0dzBImlPMeSGfmSjZMn+lAtI5aBGMII8UFrDaZbJzQQc/wkU/8e5Hw
 3UWU32duzey4klz+mZhIShJKhA7qNwH7Y9crtPMJaGlBl8A7AmH0LIRzNOQjynwyVp6K0EcAdSh
 CjsQ1nKPFlTJHiFsqM/KbWvwRVGr/djsdXOQDfIRaRQEw89xliPv0KaiYUIqzzN3IY4e/Uz6cjY
 4WCojgdvM09ZmOenCnA==
X-Proofpoint-GUID: XuZLabY5hXc3cXoJC_0KGzeFBj9KXsfL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfXxQfSgLXIRHis
 jfjYE0qjBptxPoOjom4KpP21ZVSQlRXkj2Ev4JKWkwYdBVL9yrvEr/BJbIaHGw6IAI9fT1g1ZxA
 SsXsk+klS7KP09lY2VFcUp7FcpHjFEk=
X-Proofpoint-ORIG-GUID: XuZLabY5hXc3cXoJC_0KGzeFBj9KXsfL
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aafefcf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=-4HvE1n6-quVXk9uR7wA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200212

The commit fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate
device-specific VBUS") switched the schema to use generic vbus-supply
property, however the example continued to use the old, deprecated one.
Update example to use the expected style of specifying the VBUS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index db487562cec4..dd56dc8afe03 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -176,7 +176,6 @@ examples:
                               "msg-rx-discarded",
                               "fr-swap";
 
-            vdd-vbus-supply = <&pm8150b_vbus>;
             vdd-pdphy-supply = <&vreg_l2a_3p1>;
 
             connector {
@@ -186,6 +185,8 @@ examples:
                 data-role = "dual";
                 self-powered;
 
+                vbus-supply = <&pm8150b_vbus>;
+
                 source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
                                PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
 

-- 
2.47.3

