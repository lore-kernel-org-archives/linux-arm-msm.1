Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4EE18E025
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787033776; cv=none; b=llpU+j9/L61B+0g8/Ipf4CfNfr4WC601uKeehSHCmQnG8fIrhM20d9Px6hwtB21tqMAN1UxD/6kLDC0UR1ysfI3hZ+sXLK/OOdxv7IhhcAY4ZLiPB1m1k28xOAL3ojJZT/8NJnF+nbSy4yNDSQbu/Z1ePnWSFvbcVgV3tF4Iumg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787033776; c=relaxed/simple;
	bh=9PHDqN8u2OYdc0o78FTOWtIYPVyg3JoKJ40Dyw5pnvc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kk93ftnY7JOHM0Jgbxh3ViuWWaBzOuQY8AZtYmu4T2TZBYSLDmbtUysabfIvbEEh9ZsOGXAWCcAMy3vQW91lnGLPQzv7uM4n1/ReR6lDN6q6svREf442LHXdItSXTkX4rBQJg6L8vrIuAhFC728CcXSaVsHskeB14ZhHPWb41G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVFRqgOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLBN4T4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVFRqgOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLBN4T4x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I28UQN2884789
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=38I388lvL0rpoIh+lBGHzO
	XugNwuZLafMFmaoLyxPv0=; b=UVFRqgObjNkJN4hMcrC0V4PAaCOW6sbn1s8wwm
	1J4CDub55ix2tBOOD+yMPfqJtAvt+ma6c/PPxolSbYEupLVdqIZflcFeWMdafoMX
	PmC17GDEmd7el0TSRAh/wSRtrKaDgAleI7ylEFSK5bDALHUUu/jiLM7oXkhh2ieZ
	jyWuwmeVwSvdMnsBwSfuDrjaqdSYetL+c2s2kORw5oOqRx1edtl5mv6CBZzzovYn
	PrWEn6Y/rRpmFwjNlL//8fvYQZHZsi/+yz9rsFkARVLgjLPeiCyMnsT3PNal5v3x
	AHMAWlzJsdVILC3iJm/1OYT6bir1rEHxbetkdVgh8fqg2KnQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebprxtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:16:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so9534401a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 23:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787033773; x=1787638573; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=38I388lvL0rpoIh+lBGHzOXugNwuZLafMFmaoLyxPv0=;
        b=cLBN4T4xSfd/O7b7RFlPVnYJym4weqMPpzGNsZ8zBoIeNjx8Le7S7uJswTXP+pUqNq
         mj4nT6UX9qkxe1sJ1EG+0D7IERiCPExUh2jdrW50CKH9UdG5q7Bg5r+N/eGsAQEj7fOP
         b86rpZgsWaVpov6kKB35T2BJ5A6xN0rT9QGW/jZUucIrvUMMjYI1iSRF4aVHdVv42DhJ
         n6tDqDHxaFhx8P6ou5ULr4cZ4ZS/7i+1hLTtAJWec+aK1UAvNHriUlp6FMTUe+El9NbT
         A7NtC7KHWFsDvjE4VFR3g+zlEwAo1Gb/qgsCApimoaOcWJ7AjzzcDwRrBaP1ebViV9KA
         JKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787033773; x=1787638573;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=38I388lvL0rpoIh+lBGHzOXugNwuZLafMFmaoLyxPv0=;
        b=gu9ZE/aLWihE0x+hT2tMFt/8YFNc3pn5Bw5pie79BI1NBQmAwUgxQ8rE5EAMsAuU89
         TyUyw9EdzaTmUYzsZO7QJ1ptC7z1ZDcF92296Vy+eRBSQfwUGwTvauUsdEgyM/iAE0zw
         +IxMR+yPQsz8ST7k5Mq4FD6aizPd+vhZ68HbPH882UomGMd/wIQIhxP6rlZNLSoSb6wx
         GRqImAws0KPAQaPr6EeIndCc9iMaEMaiuuakOsozXiLu2uDYxzEyu0kDqhlm+w2CiID3
         iFBiP9gSumEcn+R3/e9GfT96lGsxafDSu8Fb4clv3qsJ362bTFhGPs4yfwfBwGVffsEh
         4mCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdVQWbKn/2hQcKtVmDv7R3NAgYoC67/4DY0LeOpg4ZyvXUPFn2lS4NHAbeaMonSdyv7nyXJHcUnS4Ci6fv@vger.kernel.org
X-Gm-Message-State: AOJu0YzWfp0454RpVKG1aFLucyfG4liIY8KMi79xC7C0XJf/RtiRnPW/
	37MXbpC7nnmVAmC/M9Ec6b7x9qAA4oyz+am5NiQcSCA+EZzBaYpDheqGwAVkStnoOvX7xGINWN3
	aC1EtITi5IjIsEe33RU6vNVZ4lXFk5elAazIUWgBkA9Mt/fcragZ8q+6dAi10ga3Z1i1l
X-Gm-Gg: AR+sD105aDOtoDkYfwVDtdlEinfjiq3JIEilV74M5xfENVObMziP/F86mCE2X+o3TcM
	9V0NA6uDe0jXensCCmC7wZzQKPGaAWg5DDqH8LNl/jSGAgSxZBqcsOK1ugznMeJPr2x6wcqB111
	kE98cdznVbnOSGs/R3bQlbykmuqwRFMY/XxwvzsVNr9pQYhecBq7wlk7Ge+H3Jjoa4KK1Uj4Kf/
	iFZ8NakbCFWJzDRLh5whpHiIbLhFJJ8YItSgI+ehBJfM5ec+hDFLazFPBHxJelBVFfVHvnRxPMS
	JJI/WvtbVIhiiaIGMgu/8Gb206VbkCC+C+mFhyLnmEwDAf04+02IBK3isAIeB28bou17agBYEV5
	iszogujzujE6tN2jq1wZ+sC+d7a0uO/8mVQk6RfzeVYZ0CqxUJwU=
X-Received: by 2002:a17:902:d4cf:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d3b080bb30mr318045775ad.3.1787033772867;
        Mon, 17 Aug 2026 23:16:12 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d3b080bb30mr318045115ad.3.1787033772332;
        Mon, 17 Aug 2026 23:16:12 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499d7bsm13719685ad.3.2026.08.17.23.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:16:11 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] phy: qcom: Introduce USB support for Maili
Date: Mon, 17 Aug 2026 23:16:04 -0700
Message-Id: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKT4g2oC/02NQQqDMBBFryJZN+LEWKWr3qO4SOLYBNTYTJWKe
 PcmdtPNwIP33+yMMDgkdst2FnB15PwUQVwyZqyanshdF5mJQlyLBmo+Kjc4vpDmtZFYaQVKomT
 RnwP27nO2Hm1krQi5DmoyNhXSOmnW0duH7fy4QpJ/8RrKv/hsN74CL3gpmqpTAD3I5u6J8teiB
 uPHMY+HtcdxfAF/E7pXxAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787033771; l=967;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=9PHDqN8u2OYdc0o78FTOWtIYPVyg3JoKJ40Dyw5pnvc=;
 b=1N07JMvOyS3tl2rq13jUtsxI4iryR+lWKIT7Qtw4nFphBoacHUJkvFgMF2v9EBEb72Mm1WKfY
 4+Wi7YIKlWBAKUiM4eRSOohPg4EYsDPzXY/rdH1G9BSZf7lkdS09CDR
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: ulRhtRgHt_0DDw68nb7NqLqg2-49rHyr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0NSBTYWx0ZWRfXwR+HKjRysxqu
 RrY608attOYdmpPtMV2zJPUOcd7Zsiit7tpWphEG2Hqw798eGR8e1SZ39oWDvNzhLDW1dFgNc66
 +2lfCnSrongcBxuXg9cB4iOLU9nzdEHYkACEYE7af+V80t07P4zdb47tJJnIJ6U8SJPdX9/zUXC
 XdGKzjM260B+WzXHXUK93/Inf4GhXdcql6u/9Z3qN+NJvdt5xvJSsrfcs0v6yjMQMgOeWr7CRSr
 1EowIXCNU22TJMjLfypeqbJ02d0t4Eb9QjuCpnjAiup1UbwJ9QEMzC9mNHI9rqumf0UYfBkm+Fi
 K7h7nqkMNW5rqgoMgqCi4socKWvZaZl2fiFHfaIyRUBwtBylBLksY/WqzyzZFCoDWiBJ83mrMcp
 xDbQmH/k7SklRUrotDkbHQaSd0koPzWr2KySPe+TNu3Lz6VXa9CwCVSqw8+2gPapSDKJcOneuuI
 Yt/PvYwGlgvEGtSB9SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0NSBTYWx0ZWRfX6/6j9lVFlkMI
 zbVwohlRiynUpVr3JHsOXwK6uMkWrdKbdXJblNCwdJPAVhNeipvMnCtj39DUalZ9kyJ7fRhEdkK
 sh+s79kRjUufHcsiswCwysHMbmEw8dg=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a83f8ad cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tkoM0K3omCSXhoJk5dcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ulRhtRgHt_0DDw68nb7NqLqg2-49rHyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180045

Add USB PHY support for the Maili SoC. It documents the QMP USB3-DP combo
PHY and M31 eUSB2 PHY bindings and uses Hawi and SM8750 as respective
fallbacks.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- fix binding order
- rebase on latest linux-next tag to remove b4 dependency
- Link to v1: https://lore.kernel.org/r/20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com

---
Krishna Kurapati (2):
      dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Maili
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Maili QMP Phy

 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml         | 1 +
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
 2 files changed, 5 insertions(+)
---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260817-maili-usb-7c4e5ba1a4e4

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

