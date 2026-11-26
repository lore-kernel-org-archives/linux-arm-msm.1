Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689731;
	b=swwDBJkJcNQKqaMc7Z0G39UIvUgpmbC4uMZGl9rEcFUvZp1TghXnvFjvjVEeaC8wupDx
	 k9dxeo/YeXrPYLCNFSJzvVHPbiuAzyZAaV0mBIB9nXKmmnZxQvy9XtiEjmaIRQtGkpnRG
	 MvvB5wRHE9VJ1mHIxF4DU8G24kXk01AyKnboAQ7uZjnluFC/BFVzjPjNOKdUENJdKZOco
	 +3ROeNCcXfVndWP/h88gxaDMMJ82UT/ZZJyON1Oh5+9y3/tlTSU4ePvVyZiXfDWJvCy/J
	 9Xv2bIZw8+phqRVqTBtBxVcTokYWw15SIHxcPzw4+wX+b+su8WeB2gqfFo5L09vbmXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689731;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VZkaf3WpOkz48MU/mGrpWfJlT2QhQUHzMJAz+1FO4Ek=;
	b=ngrY4HYc7QOGXD0J/uIvArABJXKo38ux3F9kVUYuesDaWud5PjHIUGMn2v3i3vP83d/Y
	 JSIOL8tknuL+mieNaVepnZXrULtA/5o3LrVMZpGBzOOr0w9iKbnj+X8H09qoSuxH7GTOM
	 PMAtQF0WpIPRsc8USr0Zy+dTT6dTQ0osmBXszvBDgV/2O9sugldYPWKo+RVX8JsafmkG3
	 ObNAMLqcg9nSgvPFKQ0ja5GJRjwdOPpK4mB0VL1qr6eLJlAs5CFJVRv7+PcsF+velQq5w
	 EVJFM79GKbKVHVNOV+sd0IrUbm6eUlCWVocz0TJJ6DQ7JgHRiu+q3giJXQrIV3nabhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2O9bLqf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sl0A0SFY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D702A606A336
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D702A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2O9bLqf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sl0A0SFY
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXLc22629933
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VZkaf3WpOkz48MU/mGrpWfJlT2QhQUHzMJA
	z+1FO4Ek=; b=D2O9bLqfZQ+ueWUx1rHztnHWSor7P1LSeNxkGep7ZmvpSkwVAef
	VF4djEgYv1nYdW5YB0WvtINv36V+egw6F4oXF+XnQd4U7oOL/cKK/SKzPFpAjlKH
	CIZBzG7khoL3AosMd3smf1Z49IW1rSxyvUFV1gwoha+ySrX2FnOEdlE/hlZw8NBd
	n7eH2OeV3/dpQLJGeGWzygXf/3nAzHRsQf4hFxqG4C7S7tw6NAYZtmo1wgUxWtWp
	Q7pLiZyvvKOOTac8oI3QrcNCAHGmKJ1IQH7/MwlHylNnJ8F6J1xgm4/03z5TqFbv
	Q/aDtxWbjfC/zTAoDLnjhbAIBgUzWIWJ1Qw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahv24a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:42:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a0f79047so7384373eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795689728; x=1796294528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZkaf3WpOkz48MU/mGrpWfJlT2QhQUHzMJAz+1FO4Ek=;
        b=Sl0A0SFYUzBw2AmrNbzESkYobUG6oVas9pX5cp9cN+0EefifixVIHmESFKxjib2UOk
         9+xS4rWx7dzu/3D6W/kAlS+npkalj2ky3hT6YctiSWejEkE48WVXZRHN6vuhOYiC7wgy
         msEv6X3rNOhsxagsZsCyCJpT7QjqgqaQtSFO+qbiZDE9d2vggtm/ZsYka9HpImnj06fZ
         sfgeAph2AMH16a+4NJaAZtZuJn9Rsy4sD/bH51alr8d9TMRU/7Y+Pf+qN1ubqanXtvL6
         BLlXypkVmbkdRpZJ6kNYx+3kIVtv4QaHw7UQoRZVhi7Y3LkoQ1lsy0o2VNrzPqSs9FHr
         4P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689728; x=1796294528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZkaf3WpOkz48MU/mGrpWfJlT2QhQUHzMJAz+1FO4Ek=;
        b=Kvoy+/Z6fzPuEO4JxU6DdyFJaAplM/nfxJBUrrVH+iA+TdHTTantTMg3Ol29xWcuD/
         NpaT2r+Lv5bIgWzHZ/dAvmx1LXSSDOh791rtfuxLQxTKqaVXryePlJ2r8KxWEzUnDCul
         UtOhjVeazWiPIpg70bfSLXuM/APYlcYeYxTXTTdCUHDbi5JooZOIYew1crxF9Q0g8bIK
         7dkHRINh2mO9FUgYfq9A7ty9YGXLqQMzmZr4pfASGS+BJ2+CZPbMF/vXDFi61QamszmR
         jspx634eTR7gAOwT5+N95JQoVbSj3RFd2owtac+PFMoRE6dkYOM4tVmoG889em+QP9gI
         x7rg==
X-Forwarded-Encrypted: i=1; AL+hErEk6uv+Mf2ZdERCrpGi3EDsgZJ/LFG+Up4CvhUYAQhHvL9qP7act82i+Jd/xvf6EPqFCNOD/jKloWh6txim@vger.kernel.org
X-Gm-Message-State: APuU4Z8EQyt0XWt5duiV2qzvo4dBr28QLNCbVpGvYJwYxENJEkEgwedS
	+EzwABWy8dM081pa5ibOlE4zXHCvq5UpDdYl9/H5QHroI+NDo1AmNptj5SBANSWKrmvWq30fTW5
	gGOJtt7GHAP0F5sSUtj+/8WOHsKpwQxc6aYUPI9eR6s7iL7JYTj+MlOLUnJ3AS73tDMvF
X-Gm-Gg: AZFdTZctdPiapk2u/00YPqcaa1toOw/EWd2Sxp39x+eI4sEGefWQ/qDVSPzGKxaGQZt
	095eyvfBC8iXfeIp2sFV/rtKZF9R4fSRu0uFNuAboomsl95z+0/QXyW3wJvyZZXNZcfpXXNuwnI
	Q5pDxIQJnovt5JOL5dhgHNf81gOisynFWDGsqekgzMh/5vvIJmlyef9jHYWw2n/2CTTib0Vu3l6
	+AZmbbDXDAGkdPJ6V3AuPsPWymvPp6kOS8lSXdHThVuFOcBi30tqfBP8YgUqcPacpgE6D6K+P5G
	H2rNi1CXnGjcePXa3bKl3dqQlTWby+m9nybXfq+xnlcufntzGug/2vzHYfN7ilC4mRVpNYptyn4
	BubTtUTyg9OutjuZXN6qXMZn3+0K0Pj7vIKNYJiaXcbBqrsHiGN/fXhkMoBQ6ZPEwTYdsHeZEoi
	NVeQ==
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr15496835eec.29.1795689728222;
        Thu, 26 Nov 2026 02:42:08 -0800 (PST)
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr15496819eec.29.1795689727698;
        Thu, 26 Nov 2026 02:42:07 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm55627947eec.20.2026.11.26.02.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:42:07 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 0/2] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller support
Date: Thu, 26 Nov 2026 16:11:59 +0530
Message-ID: <20261126104201.1613183-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: a3_fdrsRipFb98FOtjJAuvzTtBPy5Gka
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX11JsukxP6VPx
 EOAnd3DGRLUQegmi91tgBYFk2AovpOZ2TJNRvbS3s9vF6sz2iWU8TC8CF0XgO6I+5T9vYa13RYM
 ljXGtZyq1G4MPHOfMZYcPVn2KbTxvaA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXy0A5CalkhVv7
 WPlHU/Hb5uoLPUt41jQlQvl1jJg4DMICm7MibkJhndBFAk4qM92ZJWx7XIW7MDLEW29IRHjXHWz
 W9TzJ/iIARnCSUg+BWEE6ImEOLDVdMlGcmUU1sjB6TozRqQ33wYpZBtaz1AS6tw2PHcTxr84x4J
 dIl6dORzmn5fBsmRewFuuEA6fL+jt4YfynwOSsFhoRC0Ux3Q/kJJK7bE3RpNIvV0b8g+4trvqLd
 laFeNpGMvfieeYMdeJyDXqJ2WaSEFVLGM2U5jG7fWgOGjltPfB+5A9OUQusR4IV91fvtQsKDQXe
 QcPSTA9nQdtv4xmNb84kaACLkXNWM/xBuRvDp/cRQYIqe7uK8vzSncbVOifBLNRkeJxxCuMFH59
 NsP+1Cgd59iHAhCXl1olb8Jxr43i/n/+E+MLjHZEU2jwxJ7poXT7P7H1NsBqEjT4OC2mJc9o9K6
 g+A7IQrG4QUb6WCHf5g==
X-Proofpoint-ORIG-GUID: a3_fdrsRipFb98FOtjJAuvzTtBPy5Gka
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080d01 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0SHhRi3bvSNplQcU8zEA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

Add Cypress CYPD6129/CYPD6229 Type-C PD controller support for the
Shikra CQM/CQS/IQS platforms (patch 1), and CC orientation-gpios for
IQS's usb1 port, which is the SuperSpeed-capable port (patch 2).

Link to v4: https://lore.kernel.org/all/20261123122857.2424213-1-akash.kumar@oss.qualcomm.com/
Link to v3: https://lore.kernel.org/all/20261012094835.647882-1-akash.kumar@oss.qualcomm.com/
Link to v2: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/
Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/

Link to Driver and DT-binding change:
https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726

Changes in v5:
- Split into a 2-patch series: patch 1 is the base controller support
  (previously posted as v1-v4 as a single patch), patch 2 adds
  orientation-gpios for IQS's usb1 port (the SS-capable port), using
  the ucsi_ccg CC-orientation series linked above.
- IQS: fixed vbus_boost_5v to regulator-always-on instead of
  regulator-boot-on, and dropped vbus-supply from both connectors.
  Neither ucsi_ccg nor the typec core ever requests a connector's
  vbus-supply, so the v4 form (regulator-fixed wired via vbus-supply)
  was left with a permanent zero use-count and got disabled by
  regulator_late_cleanup() shortly after boot, cutting VBUS to both
  IQS ports.

Changes in v4:
- Rewrote the commit message: this is a single patch, not a series;
  clarified that usb_2 is HS-only and usb_1 carries HS+SS.
- Dropped the unused ccg_typec_con0/ccg_typec_con1 connector labels.
- Replaced the re-declared `port { usb_2_dwc3_hs: endpoint {...} }`
  overrides with direct &usb_2_dwc3_hs overrides, since that label
  already exists (empty) in shikra.dtsi.
- IQS: converted the vbus_boost_5v GPIO hog into a regulator-fixed
  node and wired it to both connectors via vbus-supply.
- Kept `dr_mode = "otg"` on &usb_2 (and, for IQS, &usb_1): a separate
  commit (9b8dc188ffa6) already sets dr_mode = "peripheral" on these
  nodes generically for all EVK boards, so dropping it here would
  silently leave the ports in peripheral-only mode and break Type-C
  role switching.

Akash Kumar (2):
  arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller
    support
  arm64: dts: qcom: shikra-iqs-evk: Add CC orientation-gpios for usb1
    port

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  55 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 107 ++++++++++++++++++++
 3 files changed, 217 insertions(+)

-- 
2.43.0

