Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679243E2747
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752549; cv=none; b=Q+rELTG0WxLxGfIt5SceUjQ/R/ti5b8YjPCcoQsuapQqKI1pCCpg2X6XW1CFzZ8FQZjbNj0aGfcHUPQQjx3IFpIiBVmG8KVFcd3/wEPWA0mIeNvOeTXoARziA7L1MT/dng63Mr9sFm9YyXw6aX63GFHE/r1wnXYlOF2KfncjKcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752549; c=relaxed/simple;
	bh=5wPjaxtMp1EHMGKTxlI06Ij5iAmSt2E0j+sKRMrOd5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBT6eg8sZjFCg2WSdd+DlNkhCYcA8RjirziumHiQS1OCTPtoczvW67dxBf4onWd28d3CF5b43mUZ/5ZQoiYoZ47EGzk3a6+a2t3TjqUNSME7BiaYPMuRi+R4JHz/lduI6M8Cxx51SLgj3gMsvwrpyIrhqc6sReU9e1kS9CUPZWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrBvDCsE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8cfmfJX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrBvDCsE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8cfmfJX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCJrM374915
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UQO1dGe3cg8EAKayarH9DjqZHYpySqBTnoI
	XACsELTw=; b=UrBvDCsEQlaa8965zjpCp7JLorVgE23f6gC/PYVNep7GlZCGFiS
	2KkMw4aba9FsBzQ0aFqGODeJgwY56b1cXrYbZpNB9/+CE4RThAN6/x1NqOCb5WQV
	9KdCCoSzWZfEC920A1qhlIa8andQPtGGmLRtMawXT3zKnI7l2xeT1SLbMZHPTlJp
	wvVD8vBftmx3tWt+Z9uCqFBudz9Bq088x5ur+ZW08GvpxipnNfMBHwJsdRJ5hR0R
	n4lEJQCyl0fKFcefLlVpw9nUku7JKB5NTQ76WmJBCxvM+2Tya5EmVuTuqW89Vd/w
	9cbm5fAgo6WjogcUA4y/bg5sSIiOjEjt32g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxa40s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:55:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so1850961a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 06:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787752545; x=1788357345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQO1dGe3cg8EAKayarH9DjqZHYpySqBTnoIXACsELTw=;
        b=X8cfmfJXtr6EOlxNYNX195IzYsC9vD0NyCLGJGISOmBdGYrMTSTQ9wyf4mU8h5+px5
         5cmOBCerONeLYkk3XPx/lQhUZwoQXoH/bJ9+YYhJ+kNbOsDv3Glwkl5TY1qU79kn2xjR
         77a/RjmtCMfszlmcgAVDbEs0NanbM1ue+ZrLtNGW1/mdZ4ApQZSEwur64qWYEHLhcrSB
         ml6u1hJrr3n28dnYcVFJdwUAytCepz8kVa3MEaqZFvHvEdN0tn+EpBCI72AjqhG6PEMr
         iSMYf6keu3QNLIe6rA9Ih35oTdUTfr9/TlileHTb1Z7/xraUn+c8cs4GuJ3DlMfdaNNI
         TAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752545; x=1788357345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQO1dGe3cg8EAKayarH9DjqZHYpySqBTnoIXACsELTw=;
        b=WRYREGXXSPzWI5AypKjoxZBV4MHqN8T6VsvY+jECnBJNxzaTGrPcESlnDdv67GUBab
         zDwH2qgtxs8nONcXCHXRpLQI5s2Pl+znoSMwe23/A2ylhRwMJMA0r5j8yehVEZhby3Yu
         CKECQfbst7w5qqw2+IwxoTRLF8LdFKuior6opXHCtNklenOIQduIQeLBCOP0zNz1n8Xc
         9NuBURbyJrPKvXqeIXZhqJkLgKaM66TFDjmtAHKfZxqKha8JFRSEAAuM4f6vCCEFn935
         brDHYwGgiDvHZUmLD7KRBSt1/voILMgyu2eN2MGQgsZPYKjnE6LyR/JAkO4SJIBWSBX2
         UQBA==
X-Forwarded-Encrypted: i=1; AHgh+RpgneHtCiIdEombp+0MzEm+Fm4qdnfm8aVAMHytx9LASbtCn/uQzWJ7IuzWdQmV+RykehmuKCOIzKFvpnIv@vger.kernel.org
X-Gm-Message-State: AFuF++kP0NDflcb+sCqdD38GNNB5B2It/IiYFpGzQFmzNrX2rbLsXLVe
	BMDRdV+fFCGSOI7Ktf5/PiyAEPJ23bo26EHgxUhzoXz62uklvcDS85rq8vYpfLEGgVrLKI1Q36v
	1z6MqLRWzJ/xF/G0SK13rR+VTVkYDn4aJKv0HY7o6umpFgYK8C1RLXYjOL6XkFgpgweP1
X-Gm-Gg: AR+sD13sZbALoa+hcwmH1Jyl8VBzOSIBnd3tw/k4/6G/pdvzcTZIiKkwAdF7x00T9+q
	gfGy040ZDmLZixKVpYhG80WnKDwweNHYDTPwRVKpP/0YVCkcOGwt8sWgxaxDyb9k8LZ5EvqYSr3
	eat6+LjZ42NEeijxzeAMzIh8AfFmLVV8FC5ONAaEjpEOmHrmPgASqanDgCRLl/do9/Cmv79cSG2
	oZYCyXflcrX9weeaLlziA6hjMY8Ps0sTiwC081s2B1OeWs/haGr1KrO3m5U5NZ4qVDtc2RFIBG4
	EfU06zxjPrJOm8b8FeSm1r6F0W30aoD16puj0pfVtE6JB1h3M1I6PMCjKXKgZl6Ebcwt+QWvHXH
	XhOxpxoFYFKZD1NuET81KHrL7KeW17afOaxkknpey3knNzMN17MTaBlE5vY5g
X-Received: by 2002:a17:90a:d2cb:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-3966d36df78mr15644624a91.2.1787752545455;
        Wed, 26 Aug 2026 06:55:45 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cb:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-3966d36df78mr15644505a91.2.1787752544964;
        Wed, 26 Aug 2026 06:55:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a573a1sm4347911a91.14.2026.08.26.06.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:55:44 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
Date: Wed, 26 Aug 2026 21:54:52 +0800
Message-ID: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ef062 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Y7D3pg133TmPf0Y34y0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 1SkDARmXs1BoXvWfpEEeam729nVEfapY
X-Proofpoint-ORIG-GUID: 1SkDARmXs1BoXvWfpEEeam729nVEfapY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfX2aASD4QEn2Ui
 +Q72r0N78bWrV+RfWW63j0mzkVSD7g4g432hfCwU6Ix2yqTlLEWBhCXXNI4aAOKA3uONDztAL/B
 TBpqtdT2DOB4Zcxa3Kj1z3vjIe5yc4PAOLCHHoT4yPI6bRUNwww+2/ZP0TPoBlvL+I2YjlpJUY/
 dp75ZPXlCvZtGTvRXb1F1R891WfoxRsabj5bSe0FGP8mF7ffrIfWma+87D5bFyuNHmyXwzq2zPk
 O291n5eiBr8pPM1QAPjvt2ghNGqcrkIG5zcKNNe9G4FWjCHlDhntiTH+ui1k2eQDhIONuZsAiJm
 nJA9TmG7iz5c5XqaQtmwukzC2bPU9mALyouyA0GcGQ+F419TykoI7lbloBCWWMqob/XNEDXsgQL
 3Qu7/pHI8/iCC+Nxe/JJSnxoliLJTYOzBPapVh/t+5rk3F1+nLUh5YUb5JZzresQoVaxso5rNKg
 uhORdrEBAg/+//H7WOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfXxiNatSkzVf/S
 mzVhGvrY2+q+MfgNBBTLcRv/vgieqrd9PTNJINx31Ts9161fwRVYefruiWPTZAwhX9/TuopT9Pb
 SMDrlJRBAGUOTsYOECy5+m4ziSzHX60=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260115

The Nord CDSP subsystems do not take their memory rail from the shared
MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
resource. Add the nmxc.lvl RPMh resource and register it in the Nord
power domain table.

Changes for v2:
- Drop remoteproc changes since "mx" of remoteproc is just the name of
  memory rail input which can be wired up to NMXC power domain in DT
- Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-shengchao.guo@oss.qualcomm.com/

Anurag Pateriya (2):
  dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
  pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord

 drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
 include/dt-bindings/power/qcom,rpmhpd.h | 1 +
 2 files changed, 7 insertions(+)

-- 
2.43.0

