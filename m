Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC6348EC73
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052593; cv=none; b=jFNOhCKAjCygj3glYlBg3xQrhmChtGDkFwFElRz19QREo+GNJbG+piRCSXz9Wmi+RumiM9AnKpW7N7O/a90DuRTPtS0kiZxhCBz9UIV2AvYsfKkcReXjCZ46JptLhT42okRE4d2u1sJrQVXVdLyPEoWTxetJq0VF/3Cq3Cw713k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052593; c=relaxed/simple;
	bh=dHoNLuP/MiZX34znx8vGKptkQj0DrHSQ6SDhwKumKzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ir0sPPkAqOep3ATBub46vHl8sBoUWV+8WBbQGMdB9adMUTGgFHmLlnr5R3u3kzU60LJ4s9Qvkd/Teh0dU10MSLEiwgmJQrPT4ig5xsUiM6PjBpew2PqO3RhFRoLTnqMwVzjKEmtOsuoLdIWUAc2wAxWlOv/XtdfA+Qx77Z0UdcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/MDshMI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiS04r++; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/MDshMI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiS04r++"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADc0dq1067711
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lp9PVQSwM9//Q3MhjgsPcpr9H9dxts26WAnHPe71+j8=; b=b/MDshMIORZTKmqw
	vJz8QN94jT0yokssQ84WcLV8RlJrZgNgSYBFcKW8TJCgcXn1kZ+srA4dOU3+zcs2
	2NeKQiPKiTT/P2NakpA82017WG/xE7xHZ48tSSl83e771pGo3BFEyBO21ZAjK+nN
	46xoakL4rMDIx9W7yz5JbHrbC3b1azxOyCtbg2thVZk6HuPXwGAwj5tezowTKeUh
	xgVdeuamxNGyjl2HoeoRlbgqTlSjr8gNENVFTChbAWAv9Z0+WkHsz5eanzQan8x+
	hFCsFY/ZfweFnIhoV53/WbaQ2vJQC28jtgN1ezbkD+P+u+FOYz9p+70PHV+vrssW
	lrAxNQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkw8hfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:03:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4a447d275so2896704a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052588; x=1789657388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lp9PVQSwM9//Q3MhjgsPcpr9H9dxts26WAnHPe71+j8=;
        b=CiS04r++FHPy0xuKrVlCI/2A60Eev6VN4rluUVCHKK5tht8uE2efzH9uzflJB0AFKV
         1RicKeR2ZTrRDnAoABM/WEQGtricrgUSplKjLsRN9nYGV+sqEtsQwWG3C57KlCv1o/eQ
         ApxJwAjz7/Coi2rnAJ6TQ7K6USGcMRxld+g65e4MEfXzBUGnNYUf5rztc5R+ZZNtoaN7
         UDIMACXm0pgP2EPZHaco+W0n1WgS6Q+CIePVg9Qbn+xnyTtwjeWVshjEmvSwIPVCUuiK
         C/yNcujaHPWUWax7Vqwh/lLbw/oUdi+ojTJIFfUTlQCBdoYqpw0TFj3lY54CtbJ3861a
         eudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052588; x=1789657388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lp9PVQSwM9//Q3MhjgsPcpr9H9dxts26WAnHPe71+j8=;
        b=KfXVO8dgWnSLjSI6alBeIh+ivqD4ZwGaqhFGA4XXJzYxzLEkuz4hqH6GL2iD5Cm0Vy
         CiD121MezECYGcZt7Ym5B+oJifPtHKl/JEYhw3bN2mH63Ug8Gd8T6Zcqk9/9G4dRgYVu
         9hVf2c4HPH2ZuVxQc8FvWSdyq/twORgNR6nnCKvkDVs52FqCMhUgzqckbQekCWuJPpD5
         xiwBDLNy3id24lSkX4vw0a5YGCJmToTdbc6YmB9ZvSpXoGIzIKI7nr7V1l9feSIY54fN
         c9pdhg3VS8J4FnXrIVGLSUw7XWthw6wgUEyECtIpWtgeqbhfQVCldOIVw3dm/NX3fCXv
         LovQ==
X-Gm-Message-State: AFuF++nwJrQ9+a1FVl0Hj49lLJT6YC2qU6HX3m/DVcxOMTiw6Q1BzSe+
	l9tpSo0rbdPPXJkhJ/U2U21x5AYj+GNV6Z8GmxuaFKEsD6809e4FIxP3OqDMmt+NXpQV3wzxE4f
	/1W200+2ct+j9UTCgsjMx9LXUxXfqFXoBV9BxTU/sKM7HJElY21RZgLOUAsz5COi7vrlJ
X-Gm-Gg: AYBFou2iTmHGc2Wk+SMqm0Eg3ygBl8vBCgA75kf0hcRDDLVeSJkzyQCZJjzI3835QT+
	0Cmdp7pE/E+63SRn+NG/68GJBkwYuQdl4cqSOavAKeAYOo9sf2QVXGruWUXoCtuec2460eZkHeX
	Pd307b9QeXt98H8mOgKcD8Pfbg//WSzwuZsXKzFh46I9zt9icMNmKIqQwTX3lCpPm51BVAp7EO0
	hhZ8a+HhMBVYvS528PDeiKWRnArmNf4EY63VU6OZhZIZkO/BaVT1hUQwIlIl7J7g0+fBJAidO1y
	3T7nt4+wcrPPjQjWYAIJv0zwiP/luj/GnLT+lrddplWyWFQgXwgEysFrHaAaE8cVk80/zCb/h2a
	EJASh+SImvQNUYN6ndskAUstGzNDE
X-Received: by 2002:a05:6a21:3417:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3da3a08ecdbmr67376196637.17.1789052588034;
        Thu, 10 Sep 2026 08:03:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:3417:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3da3a08ecdbmr67375892637.17.1789052586239;
        Thu, 10 Sep 2026 08:03:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:05 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:38 +0530
Subject: [PATCH v2 1/5] ASoC: dt-bindings: qcom,sm8250: add Shikra sound
 card compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-1-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa2c6ad cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IO9S6bmGf6N6HOI-BKEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX91ckO0F9l2Ur
 aQ8gN90k9YrXIEmspxONICF+0v2mfrZvx53AX+kL0UHMNjGDwhqoNQCnbSPsCxoVgrMo2liYY7Z
 WaqGhmiVDyCQVqJGjhxeecS6uNsz4/M=
X-Proofpoint-ORIG-GUID: 8dqIsUVchag8W_nBvywwrGPXbRPQP5Y7
X-Proofpoint-GUID: 8dqIsUVchag8W_nBvywwrGPXbRPQP5Y7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX+GZy87ccQROz
 lUuuEI4zbSF8QP93z71tfewpS0Wh9G293A415zGOXJ2ifWa3FOSu3nX5FEhnTp0L6nfvoPjXWMB
 dcqmFOh/qEa27Jp6/LkwvfdKDgAEdz2FSiKLKBr/8CMgrtL8+G/muyDreU8C9voYivcCI5adOg4
 ghrvFV6GK/Awtb3AXSLS6MhaifBbR643ejlCiBLqCvWqiUIP3Qo2p893V8Ev8vwNG2mTL0H3YoN
 tkJ9vZz1SovKbCZDT73fN4wQS5o7mnjq7mzD7PlCWLoGjFAmBBizUdIWJh+M9OBeMSf+m7SeGRP
 3Y5D/j6kH9xnoxWcyZY1lpg2ab+V+Hb8wXnNrbEZkqneb53JJ+1Y+y+2en4L7UK2B/rNWAPfYw9
 7+1QwDC9eM/SW1ncdHDlGNcgqKy/JNjpvJpAJ63jtG8WpWYGzVOzUqpqhko/Hsk4JZDd56ypfrj
 Dn0QeCHfSdjOJUrcg2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Add Shikra sound-card compatible strings to the Qualcomm sound card
binding so DT can describe board-specific audio topologies:

- qcom,shikra-cqm-sndcard
- qcom,shikra-cqs-sndcard
- qcom,shikra-iqs-sndcard

Shikra EVK variants use different codec/interface combinations and DSP
processing paths. Describing these variants explicitly in DT allows the
machine driver to select the correct DAPM routes, controls, and clocking
behavior for each board.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 1536fcd96d68..0e7116d33bd7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -51,6 +51,9 @@ properties:
           - qcom,sc8280xp-sndcard
           - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
+          - qcom,shikra-cqm-sndcard
+          - qcom,shikra-cqs-sndcard
+          - qcom,shikra-iqs-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard

-- 
2.34.1

