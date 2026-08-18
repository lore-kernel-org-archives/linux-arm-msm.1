Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90214263C7F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787033779; cv=none; b=FzguQqRrrlv3l+W0QJ+Pfw6kea7TyjTsgSrMusUL/Pyz2SSnndeC1C6VhO3T6CYP5PBk/EqvSUwOLIfqlVm5Zq0/K5fvKMiKiXlnS7TyZeeo/Vxk98RpimwKHwazjlmk021VCK6wlyPALEG3D0mgUQGU/MW9uaH2izZy8Agxg/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787033779; c=relaxed/simple;
	bh=/is5SgytrkIHdFXe06oiFMuIPo8NyNLeFkAO6WO9tVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0smcDDmh87iP34gLldENCSqvJ9ZG//nmiwAEpFtYBfC1PF43ma4sQlwtD8f5GCpkEgodRffF4/wLBE7Nx+BxLaYG2tfWbkW1ED3YUBMrOrhPmdWHKmnItCs4g9KDqDAJ4f/EhVMLm27odnPJTBhvBm5IudlCiIQ6w6m5xgBwFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXbccHd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JXfKiy/U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXbccHd8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JXfKiy/U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I28V7A2884794
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wnwKj/cpjqzP2EkjJrznRodw4/AjM4xdBiQY4QDGF+8=; b=SXbccHd8ACFqUp1q
	wvv4hg+5bzjHMwsUcAcW/fXQo4WBWFiRRbkK71EO24hiGWXTOJV5RMlQw3iNd6wp
	r5Nt0UxhjnA9zSlOtlliphWID/4J8vEuLDmSrX5RGDtS8e0YCPB2TutPGlvtY5ki
	7O4CUwujK52Q2ib4QV3FBCEnI5e9LuM5qCiP7eC8Vn3M4lyMard2EUfbenlTovZd
	QiaM76w9k/sIjKSPJOWrWuCu4lFKrA3BnG2163WY+cH+bwckyqKXTmrTDIWFTdXx
	OaqPWOVY7a+erf7Le92GtKSk2rKBL3yKgXXU8xIpMZxmIB6xxq3+gACgA4Dea1ly
	orda2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebprxu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:16:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so59589755ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 23:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787033775; x=1787638575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnwKj/cpjqzP2EkjJrznRodw4/AjM4xdBiQY4QDGF+8=;
        b=JXfKiy/UE/9qFI8PzaSx0zL4JcC2ycAuBFQGDG1RstiFXipNMnPeohW1kidAv4zBsd
         L8ZzNYqtrb+HZkiJ7SX/CPrQD8L069pS/ypbqRKjPOsXFyKAyVX6yDVilGe8ZGfssHDR
         awbMfveeQGyMlq04yWKUv3ZZcTtEi/sgXG/EC0/ABNyjA5FABRrhomVELZVH/G9SGVWd
         MTh60Htht0DQSxqFwkjsr0RPzRBgd2V6sOqr4ECSJ8rviy30x8X7hZQ8lFxHHTs4PleV
         oRBQ3fzJyclamYokHJ2YTJEeHmSrYJunhsIlZXKPsM9WpnSsTfMtplrdyhL/ISSHGW93
         +7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787033775; x=1787638575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnwKj/cpjqzP2EkjJrznRodw4/AjM4xdBiQY4QDGF+8=;
        b=aARkP5dRiQ6NO5b9oj2RceDQxaJTNwDWGbXeNUUpdrYwbwS6q/7PRdGOrIoU+vPlgA
         UXibHSHcmaLtYfxIAI9WHRxKass1g2xh65Pbvf1C7hfngjyhdTk1VkiNWYc3c/4Z+15y
         U98ffTS8c/w49P7295D2MSxdrNzBzL1Vrs3mSLd0iiYhwK7vgc+/9OH7Lqn/banShFqA
         WkKXZ5MDMPI82d2dSamwV8LZvoSSnK99mkZPH2k2ikIgahU+iv7DKuufEm3CxqIvS1AB
         KKp8lrMdP0pma+OLQkrSyhsiZj0lZJWDyAmoF2Jy/zuyT3tOaX+FftE3+TS610UFhHyb
         ngHw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/SccCzXPNrbpwaO7yvrNtJX0hDzg40R/ccdPZ5TdX2UzVauWFUo2Bd1rl4MfQhsnyLX+KA7UIfSE9wDdI@vger.kernel.org
X-Gm-Message-State: AOJu0YytdjdBLY1OW2vhyu7H8xrFzji71h69cxDRWl01j6u8NHnAYVzS
	2nM/u0llZfVPNTdR4/z9cTOJB49S+3F3Wn3W+azoQmnGydiTdLrAZRUJzXSqNBHZoHEsK/3T8AO
	kUralzK4eap0DXWrqr4leSrVatTLKDfSJ8F+BzNJEc0ACaER6ta8P9y5QosEWeINKMmCl
X-Gm-Gg: AR+sD10RrXcTIQ4Gihpl+ZoaLBxgGG5i7uzuSh7ZI8rvDGBlEOIwC1kWxIMhgLF1Aky
	jciqU5sWjX6XsgK/syogIcyvhCErU+AJK9GBQW2BfdEjS+LD7xKw4vpTZOLgKk/hHgMzEynBN1O
	xFTyB0rcz80jK1qzZpMRjw7AsWGAsQEP47TQS9nFrcVJx/Y4sV+izhfshmwkBxLuqrO2Nfz6A4S
	HqV3j/u9Oz9DSIVEsccQOOvDlk+wwAhKPPKRytYzUIEh0OGbUaHIPZ7qaUaxsV623Hl9WvZTQIt
	NX7kNliNjYRmMQkNKFpO8R0zvrAUPifjnew1Ziw0ZWHqwCkNk0djlkEexLXoq/97Iagugpb/s1Z
	HQ5V6xaolCyfVKvQXr8elSIMM+W8xNqPhe+U9zHk0zXyPp1NfoMs=
X-Received: by 2002:a17:903:19eb:b0:2c8:1f58:55dd with SMTP id d9443c01a7336-2d5c4f3d45cmr77390115ad.9.1787033775554;
        Mon, 17 Aug 2026 23:16:15 -0700 (PDT)
X-Received: by 2002:a17:903:19eb:b0:2c8:1f58:55dd with SMTP id d9443c01a7336-2d5c4f3d45cmr77389475ad.9.1787033775127;
        Mon, 17 Aug 2026 23:16:15 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499d7bsm13719685ad.3.2026.08.17.23.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:16:14 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 23:16:06 -0700
Subject: [PATCH v2 2/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add Maili QMP Phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-maili-usb-v2-2-97d7317f64b3@oss.qualcomm.com>
References: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
In-Reply-To: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787033771; l=1065;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=KztRx0ikqSziac1/mJYrT1Hz98BWoCR2B3clcv6ptyU=;
 b=vLCyx49Zwam5PzdPiUf7rV9nET3lcI6r9nE3Rzm9e4pHmlUHfSyRJP9cpOhGf15E9V/ZSwYZe
 Hg4gHt+6t3LDjNPMqwgN3bGerEusqohcv4OPMWmTL/6u5juI+iTsLJB
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: J_3jd_d13y1i6jiqJs7QmGwjPTcsCuJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0NSBTYWx0ZWRfX++ZoC1YifJ6j
 cckrMChJiukMSxAX6I5ev5he/WqpD1WSV9s8jt9upmrNLvjDpkHfiFBoABFEWF6mD2iwbJ8x2mA
 Qh5AegXY7v7y677QSYzO1Vrv1XysQDL2i5wyW0yqh+9G6Ljbt9KdG9wtqZQE8PFPjhTC4jIUNNh
 KPHQ3wu886Y54NXfbDHyDafvwJzjQvgQN5fbayQhxYlwIipdSv03bItEYS0UTqXIGEm6+hbJhDX
 BVFMGVfXw73zN+8xE6qKrTgdBme8omC2tab5MOk0ocu7kLQj29pOaJ67FPawkPq+Tvq8j1rDPOc
 e2soEYfM/NZgmYXtxnYwFyazET5QFZfD7GEerzHiGDlJuHLVDjVbE6gywGOcg++NNE59xE9Iz9T
 T8ikKZFexXL0G/z9WjSCNcKdiaqhanqCOP3b9oCiin9PrNllu7dxs0saeZ8GwCbYRTGTpi/utKN
 9K4thSaTOewHCWn2ogg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0NSBTYWx0ZWRfX7GsMbxxYsk4m
 0z9XDVhzfwxZD6LlbQ9ShhF9R3iUfu5LS5lPXASZ0y1I041gHJ05IuQ+B530EPbhPunoiD9a3kJ
 PKMOQBWNS3PSEtrJDU3IKYxKEt1wUOA=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a83f8b0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=c48FE4Zzs7BoiMeBshYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: J_3jd_d13y1i6jiqJs7QmGwjPTcsCuJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180045

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Document the QMP PHY for Maili which handles the USB3 path. Use fallback
to indicate the compatibility of the QMP PHY on Maili with that on Hawi.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 8adfc78108fe..1c6e8e9b9a7e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,10 @@ description:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - qcom,maili-qmp-usb3-dp-phy
+          - const: qcom,hawi-qmp-usb3-dp-phy
       - items:
           - enum:
               - qcom,eliza-qmp-usb3-dp-phy

-- 
2.34.1

