Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558544;
	b=U5dkjMQVBPJUYQ0SHEq3QC3kbd/lIRdX/7XOZZWU4iMGqvbdbLVdBKLGoxVo9mQ3mpuI
	 bIXeQTLSi7YDuA0qw3tXsSHOFZyaphxKBpfgd1U08CdJDQsmV7g/K4miL7C2717C8v0Vq
	 K/lKaOsoilnb8uXPvd1G/UgIG7+TnnLvojkvLUGox21FvqQfaXOX3EAtdHwwMmOMj30B+
	 LJBX+ZaO9r7InRgKy9x0q3tqGv/Fe613wwFWE7Qaw8ttu0VYGwj9H9Jd+Ypi9g1CAPIuO
	 Iy2Iu4ieDSnlT3ivskCANuBWFVw/rlUnlXISV4WFfh2nSjn1rthRqlGoxmRMRgwiqrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QS2hi/XTSeELagHP7SsSG1Dumxaen+rqGEqvdL4ons8=;
	b=LyeVbMoEa+lZDsBZKNmurm+b3w1KGBcAhHuRx6DOp2SO23OAEAJCfBLD1Qcat1QOexe+
	 nbqbGDQH/0FudOmXwAsNFwKdAtAJ5C1u2A4HwdFO6/NXCUvKSiid9qhjV2qG8VIq9NJIP
	 wHvrkh9V2tRXrTEMBGpMFItHHFLQ8ENWEB5cfz01gh/sBySc7uYg6bRjcXlBqPINDE8r8
	 BvQqc1nDAuLC8iKsJfsiygl0fk03x00MwHtujjFOb23GjbTZJKH862Pf587LXUjm4NxzF
	 aZeVoSawM2f+li65S/ovGi1Atyha/+N59+Bz7X3ajL4Td4zX9nfDVL+k42k35hiEx/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J6o+1KH0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iv0Zug5l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06624606E0C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06624606E0C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J6o+1KH0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iv0Zug5l
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57BTu3615977
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QS2hi/XTSeELagHP7SsSG1
	Dumxaen+rqGEqvdL4ons8=; b=J6o+1KH0WfgYs1UHibV90VpMXOBx978hOaFe7L
	FDLSI1IqM7dmXWyJx5Yc05cBPwlMKXqvBZ+IHlTU9lAg/TrD7rh4vLblxy0np9z6
	htxTEmwkF1sdLherLCO+N4gYkh/F4bDOTOK2WMD3Ls3sfN8nB53t6udstfiFzHrD
	NC0XJ6l663ilyCmOVcVj5VGcvcLAew6N5SNi4xoyaLCC8wd0GqojFxQyf/fAH7yO
	VtRbn7IMcAEUHhUZmBllpGcSj5qvo7Wt3udwu+YbTc6bkDqkdwtKTehNg9yVAmha
	NeDjElT1OJEmhFE59K8p7vCHHdRueW0Gvx9a9U9nPM1tWpjw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ajvwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:29:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so151099585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558542; x=1795163342; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QS2hi/XTSeELagHP7SsSG1Dumxaen+rqGEqvdL4ons8=;
        b=Iv0Zug5lAxHRxzkqXT5RALgHVdzbMpJ+TI6JTRkrezVcfuauxpcH9qb3fGX6JmrmLi
         ds+Uh7NhV/LzpLWzVDCCSFX9TRDbe/wQcIN/+52GAYcfaGh539czjm4BpOLPsChzpD3t
         x3y6Zn0UrIVnGBYyqpGMh8VwWFa6K+/8VlclFMMOnXHy1WtCdzrauL9PvJDNhxoo30Id
         cS9A0LH8osZHVxWLtMpIRp1gSk+B0OisZMC0m7jHGc6vdtVi0uoGETyWeig7GV3JZ+cK
         SDA9hBUMLOz9LYiLAoVekj2s2XwgFVoKuFjim8181wnKOoXXvYAhUo8DK5bChy7zBdVt
         T3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558542; x=1795163342;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QS2hi/XTSeELagHP7SsSG1Dumxaen+rqGEqvdL4ons8=;
        b=rDeVGCXZWxopneDBQaNqrbXVqEuQhvbNg3DLe07UBeifitdk4ZHZEArtqPUC3Y9NlR
         TR9viqACHuaSKBhFBm5mkAvZQGiXBzITS7F2lq+3snLTMivYydUHgX/u5slxuB/5VA9v
         cQPmJ+iRzBy49c9DvZ1Jn8YtVdAfjXCf8vbD4WgTAd5IN0Fe/8LOXkh7qMRYMg8M/qCK
         9MZinzhWz7iKcwZU1OUk4Wh8rjHheCaNfSXNmK5cPOmEiG4NkBY3kfW2ixqQQsvX4Mb5
         Jevd+lj8bbawpQ8GIBzjeSD/oYnNR+5XEjHrq3XIoPYjwwh1yGtqD76QkEVuR8JrLsxZ
         y4mw==
X-Gm-Message-State: APuU4Z/M4wFLJT0uKvUhE3EpbETexZz/o+xwC8997BnMNnwSfc9ZdJjM
	0q1KpmEmC3XSjMEuyRYk2Ft7HwqcIabCuuexrg8OjDFvn+AiIczgkChIwbx4rmBpKZShjfhQrD0
	hKKnyIhYbLWZ32Z6LwXY6h9YER8u9YXbAV35DqixGq4w9DHODZwesWd+hRQpXkNHw4SlqfTVwBZ
	RacA8=
X-Gm-Gg: AYBFou2XGCK8pNpYuaSmXq14+5pWO5u9sTgK/G070TPkH4by28Frx/etaahWmIYjt8T
	F0Nw8M8Evb2FBGfP41r7xZBkMXEWBBa5yUL9Z8Y0yLzWg5W2trzoD5XLBVjPCf+DTrF5yjrrkk7
	3xodUObwjsZxgT6HFX2z90EKDg3y6wKRaylr6iPKoqWjg9ODcVqsctb5v8DUjtzAbgsCBNFpG/4
	NVXOKDpN682lRacIXIrFV0EqUKPDWI5nyKz+qz91kT8TdUm1T3BODCNYMWu8ScqKS7gJMWHF0jx
	KtlgFHejI5jNDpJMTiOuEmIU2unwg1JEVBaygQPiilBthMKfwMiIf5v1Pjw5kyNlDxRDactonVw
	mqBw4WewpLxlorWwNzqU6W/M65XDhEeyn9uipEM+TfYRrJLU1ag7vINWFmFFo4MOySMkaW7nNQO
	ZhA5GFz0NMLIROn8TCuU4AC4fLoJpUKYqFF5bI
X-Received: by 2002:a05:620a:17a2:b0:93f:2493:bef3 with SMTP id af79cd13be357-9494ba4af39mr281718185a.10.1794558542230;
        Fri, 13 Nov 2026 00:29:02 -0800 (PST)
X-Received: by 2002:a05:620a:17a2:b0:93f:2493:bef3 with SMTP id af79cd13be357-9494ba4af39mr281714585a.10.1794558541667;
        Fri, 13 Nov 2026 00:29:01 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1b13917sm13524491cf.29.2026.11.13.00.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:29:01 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v6 0/3] drm/msm/dpu: Add INT2 GDSC power domain support for
 Kaanapali
Date: Fri, 13 Nov 2026 16:28:50 +0800
Message-Id: <20261113-msm_gdsc2-v6-0-17adbce47220@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAELK9moC/3XPS2rDMBAG4KsErasgjd5d9R6lFD1GiaCOG8sxL
 cF3r+xA40WyGfhH4puZK6k4FKzkdXclA06llv7Ugn7ZkXj0pwPSklomwEAzA4x2tfs8pBqBxuB
 AMAbGQyLt//eAufys1vvHLQ94vjRyvDVJ8BVp7LuujG1EUhaSsdknlyxYVEZFz2KKOVv00nhjA
 Fggi3UsdeyH33XNia/Yg40mThmV2hqrddIxsLe+1v354r+WoftWVmyCO+C42gLQgNYyIEywwsI
 TQPwDnHG5BUQDMsekXXuQXD8B5AYAsQXkcgIL2hueJIr8BFB3gDO3BdQCeMGVCwplsA+AeZ7/A
 Kjtbkz5AQAA
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Danila Tikhonov <danila@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558532; l=3516;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=JkP9GYdpP92zM+mAnzx7C2m68bPFerI79Z8OioofOIc=;
 b=Hz8s5npmEjIHMKaUJWlwsdM/wWurUAwpKPjleEmjxJlKdOYEmlCTEOIuH6ZbaDE5LP7cvdZD1
 G1XKJdDY6frDn9orAMuL/Nkemz6XsaXSFwjbnMC7ysgNqkVBMgWy/kM
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX+wsg9YpHINA8
 pmQp4UCXuXNOSaB/4veoVrlVQ+VJzIcWNAIEp1UluGXnrf+jimhcijVMes/0Xa9BmwLciddOsd2
 c0yj7549mvFvBnRPyS06fZBNnj5rQo8=
X-Proofpoint-GUID: StgN8o45G2xeQmZoQ2ekdsOBmnrjzmzO
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6ca4e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d2OlSeRB4JJFOaS-wp4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX6VpctguoK5hr
 o0uDamwkZKIJEz0q9CCR8nQt8++TW2O4OjxdzFB8fhUYUVMC4Do+6mk6Sp6TAF0l/u9m+Ru6Jsi
 xAWc9lo4QdaUR+ZMDU7aIZblk6Pdk8egGWzRARFdhF1PDMU3mharzpidD6LbX8dvB5F4oewipD4
 sNYRQryAabfdHLVWnkixuQf3rCs41vQRNvFNSpRCkHFAxGE0oUo9ZgxeAEml/9EW1WGZrHlUGat
 tpTFUvlkz4M4xqlpmkD5oL3+iaUGt4VkflA39qjZ+cvh60dYFIC/VAbJKfG8YdqVKwNDWACnUVq
 b1KweYGkAB45Qm5wLQiOH3z5ZxPxA7Oh3V2efHx3+dAETGgSFc6zZdsP2IDRDoXFtMP3ydHlGMu
 SCSxbrB1zeN5tGf0AxQfv3P2VCIHGTzlqGsYce28wsB+SU/p634VTE2YehFRoxmhh/f8QcQmOyS
 I8I527Qs4jtynplZmqg==
X-Proofpoint-ORIG-GUID: StgN8o45G2xeQmZoQ2ekdsOBmnrjzmzO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130033

Kaanapali (SM8850) has an additional INT2 GDSC that powers a
subset of DPU source pipes (VIG2/VIG3/DMA5). Without enabling
it, those pipes remain inaccessible.

This series describes CORE and INT2 as the DPU power domains,
updates the DT bindings accordingly, and explicitly attaches both
domains in the DPU driver. DPU performance-state votes on CORE
are propagated through the genpd hierarchy to MMCX.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v6:
- Drop Tested-by tags (Krzysztof)
- Move power-domain-names to dpu-common.yaml and drop the redundant
  'required: compatible' (Krzysztof)
- Link to v5: https://lore.kernel.org/r/20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com

Changes in v5:
- Use 'contains:' for compatible matching in the if-condition (Krzysztof)
- Move power-domain-names items to top-level properties; only constrain
  minItems in then-block (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com

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

 .../bindings/display/msm/dpu-common.yaml           |  9 +++++-
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
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  4 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 32 ++++++++++++++++++++++
 15 files changed, 99 insertions(+), 3 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260720-msm_gdsc2-cb9230027a2d

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

