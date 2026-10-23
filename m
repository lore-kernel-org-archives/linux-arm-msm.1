Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743211;
	b=koehnIIpVEyZO0SrG7SLabzWLZzCxcFsTZtDkgZb3JyPnpG4LyISGL200bnwAj6Nt2HM
	 6vnM9cvAUStWymZK2PFPid3PoUNGkp/SDPgmhRqrPyZ/gr3HBv+mPr6B4HpxW2m0L7pvW
	 THVMWBcpING/flcRvYeoalO2BBAUEboWeJGQ8n65rTS7UJ+MCBcH8O7ktIDpTkfd1BnXj
	 X5mRSa2qaUC50qYPdu/hdz4091dzh0ysOsehtlWmJa6KfhmM4rVmyAyWb2iG/DcNCH0iH
	 Obrr4jtz+P6H6DDp+Ko6VPCtY+07f3Grz4XUxSHMA3tZ3hsbrxsHMkHadJ9FKxzZeMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743211;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XzpZDTY98X35K0p7w7mx3UsWiWF/bbvb8wtCEElzp6A=;
	b=akCUsJkVI0GdO2ICqXLtj7j/ohTe78DDMT2lxjKV+pJ5oO4vklBt0b0lidDIHmr7TpTo
	 JoD79hyF2UWVS3IY91P7EJTc06sL6gEYzeU68U9rPr5Ihiw6wTlSTKEOImr8r0yY4dKL7
	 m3zk00GZtyCL/Y/ziRq5yz4c1vTdgchu0ricVw8ohvWImgghdmI0rqDhEzIk4TBboq7Ki
	 jxi+jTNdW952ED3AAbjHiNcX5PCIZ8TE96lpZ2uKWqH1E8M2UfdrYJx3EFv5RkGlMDJtN
	 QL/UHYWQYpBBKT9ww9DJFeI5fdN7BZE1Ixy3DxxRTpir5u0Xc9fBADYzLcQQ/8w6Huw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K2nWi4wb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H5QYE2/l";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C450606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C450606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K2nWi4wb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H5QYE2/l
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F6g51200748
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XzpZDTY98X35K0p7w7mx3U
	sWiWF/bbvb8wtCEElzp6A=; b=K2nWi4wbmZRzuQqhcotLCc2T3ytyfGTPtAqhrA
	Cu3D82gtUqlIFSJHNgZD3efyjgNIJ4mEv0PQQhybf8OzJFAQzIJZ5B2QKbt7P1r8
	p/lNKuXR/b1nWU2xM27CDjcP70GCqXxDYDmJG4HpHbABn1JZ0lWCt3BftRrJ754u
	QuzGFeOkx1Qq0HhFE62Y/zEsy47T0P1c1L0zMN/WubBTQF4Sm77DfAx5tNsiWFW3
	yy7M2vKGKiv69lamTaVbCwG5iwAFn428oEugTVvb+Vz9Cm5CBRRDKQ9GeBKc87Nk
	TX5vbUbEiZogrHHnuoWEQaLvUaeQMMP1UKCDfEF7XjnrHfUA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2mv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso11191086d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743210; x=1793348010; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XzpZDTY98X35K0p7w7mx3UsWiWF/bbvb8wtCEElzp6A=;
        b=H5QYE2/lKie/WtDpV0Cc0l95z55pubPeS2xXLEoVwzaw/4+OTMT8IP9zG5aIXREX2S
         VprK/5AkZKy0aNA5Rtyb7vypD5JR1c+7cthauUgeNauc+8XmCCE9IS2B1d+b7gdztiB0
         1rxTSgF8KKC67p2NDUPICeJULzYCX+Dx6Fv/WI7KaeFG+R+wABrL8RI6f+FXQD3Oxz1X
         E2Tp6h7OZLm+PnDgwA4NEMIAynZ8sJPreh0yczS5feo8lcYxR2Yq72P/GRQRzxo3xbPA
         zxpneB70a59xhc8bip1GcpCYzhLbU2xt9HXfMKdCfjzS2r+zQmXVLCL+UlVsthEGV4EF
         9WQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743210; x=1793348010;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XzpZDTY98X35K0p7w7mx3UsWiWF/bbvb8wtCEElzp6A=;
        b=lFhKS6Uyd9iQz9AcCRcu+wbEQ7NaRtKzh+xCRL8pcqpkglP2+NUFKzSzaTzJYAI/i4
         Hl9esn7NmhHCVFH9NBzQoqjOjeTD3+3OkdVfShErDPhZgsHqp9xfIUVVQLIu+jAJKrj+
         EpdeIX1a2ugbv9Liak8crid1nad5Q1ukhIaY7V8Y1yaA291yArC2OnrYNHSNmR5ZIJYs
         KCGBxUGbIm+eaAT9yCTtOvNmhGNOjCkEr7A1ffo51k1WCjUNagmY5xzbQUlOWSwaepZW
         h3J2FHu6G0nGltmABGLkvO/EuNmN7PAz2dUbap8kjHPvYNDf3prk/CkCqnex237PYZ9j
         l2eA==
X-Gm-Message-State: AFq9FYLI7PzgKsF2nvOiF+FfvUuIG9vHxIU77LRqyF+ZUnKpEGFnZCMO
	Syu6TFkGdxTqGLVT51jCV3YgCuAeF7559rshzhQu5U0HjjvsHOaTyIT0hmbp4cRyZxGAB17124k
	NZWwei6STExhSzPgWlxcNsAqqS43ax1PT4yKFG48DZFI2Y0QfEEdf5PXlBWMULGvDBgph
X-Gm-Gg: AYBFou0Mp5pN2Og5fTO8nEe4tJoFM/u/o1EiOZY4+6yu3rYlgnK88ahRxqRcW62Ru4S
	CHkAOlofHxmR9o+U7aD2B2DZdAJdpgSbf+bphNmuYWInX2Ado2+mJ3+/PbAMvg15nqibzDjmV3B
	TsniEndId9nsCQruDF15g22Jzj4DWqyTnP/bGBXgHCiJy0bjIwLOdlA2ozFOxqoy8OUc+pZlF8n
	34cOIrEr1XT75NqTDdy2aXosuSr9x1jd4f8JCYrDEG9OwbabOciyrl5EKcVnwSGeldzZDtKOWDC
	p6KEnfO0KoEvPiheBpWj++k6llKIaa0Bo/ztVwQSRS5JF9MxN3xLIeRJQ/IFuRud2l1JcHE+c0C
	nRUM82qUCIBDN9lhaH0qjpSkUQ25mhZb9aoSiln/5sHesvq3JcLIjYVmcPbBmYg==
X-Received: by 2002:a05:6214:509c:b0:91b:8d12:bac9 with SMTP id 6a1803df08f44-91c3a4bd85fmr20158936d6.0.1792743209349;
        Fri, 23 Oct 2026 01:13:29 -0700 (PDT)
X-Received: by 2002:a05:6214:509c:b0:91b:8d12:bac9 with SMTP id 6a1803df08f44-91c3a4bd85fmr20158466d6.0.1792743208830;
        Fri, 23 Oct 2026 01:13:28 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396af493sm14345626d6.9.2026.10.23.01.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:13:28 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v4 0/3] drm/msm/dpu: Add INT2 GDSC power domain support for
 Kaanapali
Date: Fri, 23 Oct 2026 16:13:10 +0800
Message-Id: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABYX22oC/3XOzWrDMAwH8FcJPs/Flj1/9LT3GKNYttIalma10
 9BR8u5zU9h66C6CvyR+0pVVKpkq23ZXVmjONY/HFvRLx+IhHPfEc2qZgQAjLAg+1GG3TzUCj+h
 BCQE2QGJt/6tQny+r9f5xz4VO50ZO9ybDUInHcRjytO0wSYqIRoae+miCQ2dNjBiVJA/gUGvyF
 JDdrEOu01i+1zdnuWJPPpolF1wbZ50xyUQUb2Otm9M5fN6OblpZsRn+AC9fHwFoQGtZUBadcvA
 PoH4BKaR+BFQDeknJ+DbQ0jwBlmX5AQ9mWcN3AQAA
X-Change-ID: 20260720-msm_gdsc2-cb9230027a2d
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792743200; l=2960;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=koeKof9lWoQPr70R0/9p9MqB8DhS+MvQ9mfyxhhF+0A=;
 b=XLJfrEMwU+3J+WogPu+bHoi36ooB/UzDIKQa2JXlYZTZgXEVBANULaLAq0jC7jeBoVJtYtxFf
 ZSufFq7g7GrCcfZfuzKEVvFi19S384tSpwdx4MGqrEucd1bawPSbiLo
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX/ehnIhCJ5hBK
 TI57undTSq/uMEl9acmCjJ5gTqw9IyDTXIpb2pcGM0R4fxR16D0a1xlyFzJ0+iPYbYNOjXciscm
 PuecmG1fPj47MsR4wNNEAvvhHQSgKQnWSUBgcEfqvorwrVj4V1iN+O2djmMXStkfY4oLBBXrT3B
 nKXtk2TzZUhi6rs9EzzXCniheSPCspB6gYVDkDTcGDUNMajTbvONlRT1pj/DiCnvOWd6YRij3+d
 BDHpao7g7EjT645+cY2aG1MGet+j7iNn8y8BLpjbrfspDKICi47FoUSyiTM99kUdM7JsskzLoW9
 o1KsDpqtRpCOjdB3KLtmclJXhLaIyuetAsxzwr9vAc1sbykhYKa+b6cCGOC86nRXrcTbg/Wyfj9
 j3nut5WxO+akB+xL3gSqQZjAaHvZtUcoSjiJzVHeFYF+QfZ7NJ2L64/rEeEHftkU1dx9SzRe1fI
 m7pYT0kvCn+sIzQGERQ==
X-Proofpoint-GUID: PnFfCEVDpNbCqb6umLrIFuYYsYL4KpVb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX30D1muPIG5nF
 BH7WkmAHcyyICYpHVvfOtcnpGj9K0yXWNiegfI+H0phBI0P5d5Cj53fqHlmmA1X4jeq903WxYLk
 ACyd+oDWp7tMzy+ZuDC1g3bnVeRJF34=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb172a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cXFZYRxNi65dCB_EMakA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: PnFfCEVDpNbCqb6umLrIFuYYsYL4KpVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230032

Kaanapali (SM8850) has an additional INT2 GDSC that powers a
subset of DPU source pipes (VIG2/VIG3/DMA5). Without enabling
it, those pipes remain inaccessible.

This series describes CORE and INT2 as the DPU power domains,
updates the DT bindings accordingly, and explicitly attaches both
domains in the DPU driver. DPU performance-state votes on CORE
are propagated through the genpd hierarchy to MMCX.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v4:
- Keep the widest power-domain constraint in the common schema (Krzysztof)
- Link to v3: https://lore.kernel.org/r/20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com

Changes in v3:
- Replaced MMCX with CORE as the DPU power domain, keeping INT2 as the second domain
  (Dmitry)
- Used generic "core" and "int2" power-domain names (Dmitry)
- Propagated DPU OPP votes from CORE to its parent MMCX domain
- Updated the Kaanapali MDSS example and fixed issues reported by dt_binding_check
- Link to v2: https://lore.kernel.org/r/20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com

Changes in v2:
- Moved INT2 GDSC from MDSS to DPU, as it only powers DPU-local source pipes (Dmitry)
- Dropped Glymur — only Kaanapali actually needs INT2 GDSC
- Used if/then in DT binding to restrict second power domain to Kaanapali compatible only (Dmitry, Krzysztof)
- Dropped PD_FLAG_NO_DEV_LINK, let device link auto-attach handle INT2 as runtime-PM supplier (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com

---
Yongxing Mou (3):
      dt-bindings: display: msm: Add INT2 GDSC to Kaanapali DPU
      drm/msm/dpu: Attach CORE and INT2 power domains on Kaanapali
      arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU

 .../bindings/display/msm/dpu-common.yaml           |  3 +-
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  4 ++-
 .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm6115-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm7150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 26 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  4 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 32 ++++++++++++++++++++++
 15 files changed, 96 insertions(+), 3 deletions(-)
---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20260720-msm_gdsc2-cb9230027a2d

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

