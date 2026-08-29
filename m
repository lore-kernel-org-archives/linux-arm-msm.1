Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6183AFB18
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 19:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030497; cv=none; b=HZ2MvZQ+PRzmY7WSXH6H/P0fsh3uLyjXRKlOEGqWCjYFwZn9nwznUSoWRY4ZmVFZecpCZTMFrEaTzvf78iCvh/BjSOLL7Azo+6fnu3jjRansnyAM4YVZv9K0sRNwZP6mZfhBFSX1QbXKtwhuHljJ8crXfl5Baf8Qu7TO4vzLJ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030497; c=relaxed/simple;
	bh=W2p1gqkX4AQ8Th8f33I8eROJT74xXZVBij/fNQ25/NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKyt0xvianve8EV8e05dhJBcroESvlzJcLpQaA2WUDuRDXEfAdriRJ3uYYCNM/JM6JHlRezFHho0NkaaprY9fZB8Y1P7VOwc7Rk0OJh2JCBDi3Sn+Hu5o58h8WWg+toWnpkRO8llyhSHf+JVpzS2L4y0i3roWF+AfP1BsswuLN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4itGM4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHXUOoaF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4itGM4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHXUOoaF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGxWHw2301575
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 19:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=; b=S4itGM4Oy/04gOgP
	9lGTxN2ed98QDBA5y0Jc7Kme/fmTAlzReOESiyvpHVl8WNAXw8FleIH6yDgpJ1yg
	qkUI2O2n7vOrCNJ452SZKlpr9BbIvH89QjMoXWCZoTRKNA05GDP6lA+UqvYvDDUh
	n9ORvaRx8AoBp9uD1R/KuvHJ3iWpnpw6fhWRA22JYfLKFYo+sxvNdy0wFr6An9G0
	np3eiUClSEo1zH8G9Ww0dZhGNZ9DO4P8Uk6VpqTyGePJIvy3JDmJCAadSmB5yehr
	P/bTTplglHTaI0e+r+RaP5JAUlJx0vsDM1jYrdUDzOlLSSeoyzOSRda1HfxgoCOB
	CyAeAg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqfb1mtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 19:08:14 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-855a66e5c76so47784537b3.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 12:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788030494; x=1788635294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=SHXUOoaFbcyCqiCclPf27Ll86fDN0ZS+AYGl8/qetKAeKseL1Ed/QtC6VGDvRJz8TU
         EA8j15IyAkfMsqm9PxNlKLOX6jjYVP5IniNOSWwRgPwkZjTv/IVpp/inRYrKOzH0BuC1
         uSds6eISZva6vEktXoSNN8S4/hxwIIh/EsEnJ4FEKaPoTvaHINXPKqKpz+sNZFs85uEt
         zxvGE1dB+o1B0P2AU+AZAEKU0ixaiYweM+RHuY7fzAgS/RdMPm7bCS9niEE/eC96Ffcq
         B6htZ6YSkr59Gr2NdZ2B2snjlhlwTdnCWPmyrHN3aQpwlSzi3NxuuW0uiR7sJOAGbgEO
         nQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030494; x=1788635294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=bRYm9gF7TxbsWVJHZuqqoQiKodIY8s4dWtHdLbgwbsx5QKD+h4KXpHL2GyPxOvtuyy
         pyHVbqmQGOn1JuypedNIOux5B128Yq7pMSscnpal7OZ8+G+06rXiwa9EIrSuJ33F2g3h
         XXxa7uBNKYBSkUA86UR6UMLV6212GCGoW7DwyowhfLuF4AUayr8cei5M5EVwHVx1VAe2
         59sobZBC1U8IdrwxPbWJEeosDMsy55Nl6EcXeA7jI7SopI8M6ajAuMuVBXqNQQotZmVl
         qpaaRu7GA/1I4bH3Kz8SvcFhIppR2Xo3a7TJpAjUsPMQ3ARGj+hFRIOkp7Opb3hPRYPz
         Dh4w==
X-Gm-Message-State: AFuF++kg2UPslaUtIW7XaTBdvIssfsj+fzxAe+ijKKcMlQlujUDas6cl
	/509dAE40VspyBLDWikGRTs2UEJ3cVghq3LWG8JEdyNsehlYWiu1sSwxRxEAAAW1vyMUGrgxMpn
	Ogs9KpdrOq4LEVCnrHlXv40qJ/cJUEmDbzY2N/TLFKpKS75lKIX/rnwOAQg5Inba1ewd/
X-Gm-Gg: AYBFou2E8u5aPXhb4vhBCXLKOfKHzO4KkRbp5m49iQ7GOQC9s1Koo0SSZvrKk7XqGtN
	I47XwkUQfyGs2NfrYiyz/50aim6hfJYyROKIY0cq44B8kxQ5R6DDhBDub01opUcwERyqKM+My1o
	AsoAZqAOjV6M2bxItlUCSeg5893rMVTw2rqO8AlTWoq9oQ3UllDPSu04zJtwSwMcMunBVb440fv
	sIAd2aPobysIngXF+64QvKTbXd3lekQJLEjR27zn4ub5ovVV1KviGnjKN4b2HaZOInBf7BjMQNw
	PPMljAfdgS+ZWL8mrQAZpCRQ4PT0rfU6q2r1g5wG1cA9q/YGYqNOVzjpfC7HKOAKl7zg3cS1p9F
	erVyD4o11CCA3vyqOCSwNF7IHcv3W+MzgylkTIXCFrSkIbLrk
X-Received: by 2002:a05:690e:b84:b0:66e:5dcc:1050 with SMTP id 956f58d0204a3-66e5dcc10a0mr1394773d50.48.1788030493942;
        Sat, 29 Aug 2026 12:08:13 -0700 (PDT)
X-Received: by 2002:a05:690e:b84:b0:66e:5dcc:1050 with SMTP id 956f58d0204a3-66e5dcc10a0mr1394750d50.48.1788030493516;
        Sat, 29 Aug 2026 12:08:13 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:44f5:f599:5679:b5a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ecf1f6fsm3013945d50.13.2026.08.29.12.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:08:13 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 12:08:08 -0700
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14
 AI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-glymur-send-v5-1-a11bdf6a4b66@oss.qualcomm.com>
References: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
In-Reply-To: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfXwu6/6HIsHCdx
 /2pomoRWJm3m38uUzMDhV2z44x92Gv3Qa5P0IJf3LmfytE4qWXGO9ciJdLN7QVUrddr+QeGiyxj
 5D5jexHBpFjumqyt7SOumHmBwVYHtB4v8iOEiFRdJZJOiDDD6jGL/6d7X0ieXYQXkl8XBkmtSSi
 jzMqIej+bUBNVLP2xBNx9MObyKqsGe7ruCbFci9yt/w5YBnBJHOMVYxUiGoucGlwOSpJSN1r05G
 vy4PZF2GdSHe/USfVrkXygfLsoCt2z8Uvc5k7RYwI0H1ifl1DdGKr077DArS9/EriJexLOqD5P2
 OX2SZZPe1EH8iA4rknng+NplzS8/OFQSbhSnChkOf1GoDVTrZlYn2xSrYEbUX9OWND8Zhofs1+E
 nDxlmE1pmVP7Q1PJGVGl675es0xBtDcHXeTZQJL3BmUU3qTsRKJBI42y3ZDXQW7ipkoyf7IcZ/g
 1yEKhRp4dGJlJgKVAmQ==
X-Proofpoint-ORIG-GUID: xDTizZ4w-GuD3bMGO3CdBeDYbDqZbPUj
X-Proofpoint-GUID: xDTizZ4w-GuD3bMGO3CdBeDYbDqZbPUj
X-Authority-Analysis: v=2.4 cv=Q77iJY2a c=1 sm=1 tr=0 ts=6a932e1e cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=FzA6eXefDna1RhwR9dEA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX6d1IwB/KHEA3
 XW/sLrWEME7FD957qB9hVyFsaS56RacPVcj9JG+nvbXyTwBCVnaiYEmnV8bVcf9d7djFzXA+xI+
 FcCuRYfoYoAZMwHXAHvQU+G8bw3vqlk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290165

The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
Document its top-level "hp,elitebook-x-g2q" compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..d141872c2b28 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a16-ux3607oa
+              - hp,elitebook-x-g2q
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.50.1

