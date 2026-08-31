Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7C53AEB32
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146496; cv=none; b=jXGErDs0gn8/Sz2CXhNL1QXZPU31ag8BRdUnvj7Np1WfazokUKw77OXReLq/iie08j3wf0yyrsvVu4ADrYDSKiYpC8FSpgqNH48j/9eyMBQtzT5llPwRuYp6EDerH2PL3P1GwQCaIuRTBPAgDjT+MgGkErIEjLEm2Db52w/kHgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146496; c=relaxed/simple;
	bh=+8FGxgaHMamhBs90vxaKPN7YkBzTW6Q4tm36P+LSuWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktOsuhqXu657CL0ttqU9CSeRKZZQcf0OM0FcZQBTz12epG7F6IhNhbcR70/DwRBbYC2xwM3a8z22+kT0eAQ5PPv5smiqiT/Otq4aKcomm75T42iE1qT7QRP/2uZpwWVwP5kEdJMj/SFrrTH4wsDqjGIIFUXJDPdP4Zx0P07tM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILnf4b9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtgAeD6v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILnf4b9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtgAeD6v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bd9F2179756
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JAjjQ2CFRE8
	wAZAkPN2FEBSl92C1DE0+0SYWmYdAPjQ=; b=ILnf4b9YEp8NWNBuf71/NXcIC74
	8YunCH2R8FC4qJooYCeeiO5lTDy1ekb423hOwGHc4aHzUrvAFAEoHy56MR/8wcgq
	LSc6ESNiL8L9wQfswXLwKfGaJkaPKgDT7Rwgc6by8HW7nrbYGuDJkiXs5oyQDtYY
	ih5S7YuGhHKLDMXHjcyswFeKY8+jw2tAh+qFHlwISosDun40+rD1uCnfMWaoF73l
	o6hcVWr5JOHB9VM68vJCHgNN7AQbBMIg9h0VAFVlNcZoMmZ+eZhKeYHip3/y8Tsx
	JLvVsqBGY7hDym+8eSjP9dSyKVoreiQCXpZRGXAaRi8kjQfHWK/Z4dHUDug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2mbbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:21:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3991108a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 20:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788146494; x=1788751294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAjjQ2CFRE8wAZAkPN2FEBSl92C1DE0+0SYWmYdAPjQ=;
        b=LtgAeD6v12NZEP168RpDKrx8V3QYQUnt4nt/rGckYvY64yxfRBIMgJ2R1lrF30Tz6l
         q3gm+X7oSQ1bn4YIiRvEbaVlNouaZD+xIg7lJwhiTYsWVoz0ydQlxKcuqt5i6yDwIQ02
         HLyl/k8qHGI1ezlE7RZzsJQlM/wqZwpyyEjF2kobIq7OXOQzCHIvbYoveg1r7Q9GX40Z
         cjrjHWiFy4c+ulWPwn9nPzhZQBhWQG1L1vfBh+PqKt1CbtoA7vFnTL+E6p+0Sefi/j4r
         xMi+TpDxBdkAPYsjOgzX9DlsakTlHk8ELCZfOCDjxyt3H3TI7PHbxs4ZTw66CJ5DK4ib
         2uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146494; x=1788751294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JAjjQ2CFRE8wAZAkPN2FEBSl92C1DE0+0SYWmYdAPjQ=;
        b=f28wXi+QJdB62IeZEQWxa1NqPEq54E55vqajqCbl97CXjoZFtM9fNExwsMtBsU/riz
         412qGkjIg6nt2eUrXqWEPSL76smjJ7tyLbifCozRGhvpxZq2rl8MhyjYloqS4qEIXtAR
         y0Zj6IesGVFx16vANO7TyDgIDbfLHbLzImS9c7hGkYgTW+kFt3OXywPbCGP45x6B/mEx
         LTv75rc1Ql3yTJqHF7JFo8EIaAr0mk9DIVQgWHeyavtO0m2SM72SYuF6OcF57tRl0A7u
         8OevuXL5o0BwsHNmgqAWdiMK11msSYp2q+1lUL6kwn9X0PenCM56edP0bJk/5P5aEWwG
         npRw==
X-Forwarded-Encrypted: i=1; AKwUvBwp0DKOMMU83yZHAUOf9doRJloHy+P4Vj3bTC0IBd3QXh5rpzQ+bIPHTyODdOIT/jE1xBoBZQOWglon+p6A@vger.kernel.org
X-Gm-Message-State: AFuF++mukURXqCLnZwSJBPcLb52V3UyMARd38egrSA2qOV4pgh3d3Xbr
	18DvdSyo6Sjo+rp1lFyDpPDsu/Nm0i3bWTUJb7sJ8d//VndzGvfKF8lUlLtYm9xkuqYU55twOxp
	SFB5zy0j1hmMlbybFu0oagEnEDOeCdie44aiKk2coqgVlblT/I8j+pqpZDiUW1x5smckM
X-Gm-Gg: AYBFou2wjV+sdHFQEFJL3pEeBvFlysNbMh0KFNAsLhhyGWj+eVHnE3r1NKQO4ad3GbC
	0QFaGiozXT6j9SFGV4cmyC8hRgqxATkoliSnCvgjdSs3tC399W4arxd98HChdf24DErbuS11hsr
	aecYM/j5SXkGht8XtYQ6u5yAS4oCZFrbNcXGsNFJZNcSQ1MVdt2uuLNOKdjE8nx+MQ/LPCfv8WH
	CUAB9q+IXiegmptkcNEBLkLd4PNzkFpyTkX+GyDorsPBJPbPe3W4Ty/cQbWji5mLcSNvyQ+abli
	D9/bXJY1BjsdfA7EIO1YyOVgNsakPz5knFZUr7fZV1KtsKOHODotAeCGrOs5MOS5p6fcZRPYm8V
	wtbzrjf5s1KXq/oswBBgU7hb55J7dV0PrdQfTQJcaVfRuZhwl8ApqD4L7mx+/
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr38123027a91.13.1788146494128;
        Sun, 30 Aug 2026 20:21:34 -0700 (PDT)
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr38122959a91.13.1788146493541;
        Sun, 30 Aug 2026 20:21:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm25599208eec.18.2026.08.30.20.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:21:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 5/6] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Mon, 31 Aug 2026 11:21:02 +0800
Message-ID: <20260831032103.341633-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sJVyHwNbV8_CgVgzmkGpzc_7Ft57vyuT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX7ypGi7dH6WJJ
 gFFJp20aeYoY7puyU1uSTHMXL+vxHM1U8iENb/HFIX9Lw6rbVO7WQfrTAJnv7Urm/UUSHIJ/MBc
 x5sApPPLRi+RkcR5is0f06pgfmBIuArHZaQ7blv39nBkP+RnholP3e6WxfeqoFTF6KvroHR173x
 clvL2O4kkeTCl093aI6DU/0OKNxen1a+rSPQ89rS5OuGdfDXG5NDIN25vHugblOnKhGiQk7P/+J
 VV9WWCzY+10flSzH3i7SXTImkqyrgmTjLihWqmCUfJi1bKKbsN1MK6dVI1lpQDiNDU6kOLGq0y5
 qxdS1YTpTx96trbs4a28muq7m5GnUOWciQR6faiZxt54LfJVrTHIJzhws5hX7g8139D5kTWTPpn
 2U72leuwrloUJbxEZSj3m+IYDFcjzvakfStHiGIQCxWB9P26X1IvSXTnm6m9VgqGr1YYc4bK1CG
 6PDWPnjHb7rcz9Izk+g==
X-Proofpoint-GUID: sJVyHwNbV8_CgVgzmkGpzc_7Ft57vyuT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX4bf/DyNAIIcN
 HXidPRZErWgtsJbpFLU+nswQJSD1RGgETDFroa/BVTKY8dxmoCWhb/jyPLu+iYZuRTmgKI7pFTM
 rrgsHFjoabK5vbRVwfXxtZCCQkTvdsA=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a94f33e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KHWqK9l8iW_yKk06KS0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310026

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add qcom,sa8797p-ride-embedded to the list of compatibles for boards
based on the Nord SoC. This is the Embedded variant of the automotive
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 198314ddaa84..d2f17bc36f8a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -406,6 +406,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

