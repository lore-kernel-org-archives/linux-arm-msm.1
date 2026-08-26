Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B01346AFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752562; cv=none; b=T0WA6ED/Hstl9nP/dK+anatvo0FSDxUPc6RaIviAGCPZ9ZRYVzg0/K08GNf4bNQKfjrmoezcp9/NeBReQmto3+I1yrp52xhzMMe15rpboZoJ2PECNrHMfyXTuz8NBux7/dn5fA9xwQdikTI3naHai9mYZ2dSRz2jYFqJPUyHM9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752562; c=relaxed/simple;
	bh=Fuk5n0D0xHvMhCw4oobLuLcYYMG2iZyU2fYgQ3JvG78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVs5T4PBo38vT2u4xfqRyqUCq+cf2bSheZ1fumweCfI8QEqmDzze5RXTVm5llifxVUSANRYOxPbdt1FVu5icNAxvd8b0EAyoB5eWi4cUjbWeACqsCd1PN71irNPtzDs4M09yJ6psx6A2O5g4BHwqn6R2FAlRGI9upiD2DDUvlzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNzIsZgY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OATq09f1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNzIsZgY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OATq09f1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBjvs1909029
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GvF3M2opMH+
	9skTu0SBBPHHkzkOh1jenzvfxkr9qQpo=; b=GNzIsZgYoZ+Cp0Ialf+Ep1+MYXo
	Qq3p8AtunjfmGxaWwc5GMV7+vGictha0tVDGoJJxTEn4VChALWuARR2xxiZeZ0kh
	/xo9R0wFcu/RXAuRfF7v6HbAXJTNPg3BjF6vR7WpI6SGARmAXQZi9MG6qHvPr/Ep
	aGNZCtMfXQspnnq3yBm6sd5gf5/qnc33BTvFpP3mbQ/bEiujZLtxQIVKBCAxzodU
	LgMfLRWvnq3cXnLknCmapMz018HzpMcCg//TseSIQNv2drRnhsnwnG+0aTEM3JUU
	IRzRL2VqKFuqXTnGI1XbW9DGIQFKtfr3WZzZlHvEZKK7EwGhJRtH7+m/f1Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1sja1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:56:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39640eebc57so2248872a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 06:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787752560; x=1788357360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvF3M2opMH+9skTu0SBBPHHkzkOh1jenzvfxkr9qQpo=;
        b=OATq09f1MWGBl3aKoXjrba6WGCa9wCoPqjbCoYCivbAtxXLVW0msBTJGtRjXtIZ309
         AD6Qw9ENRFP3P7AqTF01fLgV8tqd+gcEomeQqonX4kuILBb5SCp6qM6NDwqfiuIzS0YP
         ZfhhyZ5F9aBQgAcRVccmpF02PtDxF8L4sEMroSfa4fkFBej8wvCl1X5BhFgMs2Il2g+X
         3oEMWUG6UtOUyscbD7x/BnNu5aVWGIsznYtiGAzwoMTPkfFuYrQkoNJp+aWAHg1O570K
         YMb2v6Gm8NDNJIxHFivfF5/8IIYYHkMLnlIZ6Q74V8CUuODX7crTFhwrvc3AaOskgr+4
         3crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752560; x=1788357360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GvF3M2opMH+9skTu0SBBPHHkzkOh1jenzvfxkr9qQpo=;
        b=WM42bsDFIKFwBuWtwHMsJY8mJVjq5li5cDs9B+oS37+bBvEHT5w3yRxUxtAJwfTews
         jQdObmrN8FoAn2op7+MmHFTE7w0tKOuhglOjrvSJG9jcv/flTAO9rbpZwXifpej3AKxu
         6qih31+JvYpPFJ3kETs2y6Yh8lh5DxL5JgKxR5rhqjGdki8jbThHemUub8LJu347HP0m
         JzWs0AwATRojWSg/v1oVECJcKdyMj59ty7DBlv+iZHgMg460yAHvp5iPxBYn5kuyF3dg
         uWBUPVEMZVXOmWct1b2L95aer6eBMBfqvxUQiV5qWd+48d6OGwYD4w/lw7VcBSXflLY/
         D7VQ==
X-Forwarded-Encrypted: i=1; AHgh+RqefFwK8mxlmY4seVcfx90g9fiWTRgsrkV0T9vXgJXbjuuGY7wrXsZxQwWFarzaWs/QuLNMHiMe72/D7RHS@vger.kernel.org
X-Gm-Message-State: AFuF++nPWWOjS5meAX3wFoAy0ir3TyNqpgbEiyegyYk8SsiA6JvpBPi2
	FzLZhx4fn16Y+TQKamFHEZVPcoUIKzVATQe2m9kfOz77si2anhS/Ujj6K4EOO0MPoT+0JWHeYlq
	jIWjBoWXZSrOQHknR4Kc/7ZX+IAoPmaPWlnSyT8t0cK30Oxqt4kDyRFt0PFprAYiUyrvc
X-Gm-Gg: AR+sD11N8JirQSrdPC9TbvXSyPQ7w9tDVO8lzjwIm5raQ/RtlcOykJTMB1mvFoCfMVA
	zDEMFaJ/bAQaqlAKN/k4FxSj1Iw/z8dgg+VZiIzU1iojmYZhFpdVxWQUTQ7ilKqWetdCS3Ecf1N
	yvRbUcS472iCxeivB48FVTfvzKHUikOUDpiiHkfu8QYzlS7/f6aPq7ohOSfk64iidT/r4fBGP/g
	CpeWSAyoIiiwzunl2KXqY1rso6Qt5I+Vz6suzv4+2aRTTKLGiRYFVpGU9JSIw653e+r1Gc2ZF8P
	DrHFKm3pNZtSfaL5nOKN4qSk8ZSh/shK8K18HSMiL1HYLnljOzeiSOJ8Ilr/dtsGXC+RCWpjnVz
	9O5k9JeDDTDla9y4PbK8T0BFiI+CFJsp/H0V3hOVBpM0CEKlMjInl+ONPNzPD
X-Received: by 2002:a17:90b:268b:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3966d73212emr15756299a91.13.1787752559632;
        Wed, 26 Aug 2026 06:55:59 -0700 (PDT)
X-Received: by 2002:a17:90b:268b:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3966d73212emr15756154a91.13.1787752559073;
        Wed, 26 Aug 2026 06:55:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a573a1sm4347911a91.14.2026.08.26.06.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:55:58 -0700 (PDT)
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
Subject: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
Date: Wed, 26 Aug 2026 21:54:54 +0800
Message-ID: <20260826135454.658615-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l8PePsqNV1rcU8svPK1wJPEasZMDv7e5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfXyFZCHYJzD78P
 RYk+s7HdJiJgw4M4oHsC3dMK+/5Oyg09ALD5hgsZIDEYY0fvBxB3Ys7q76eQWYKJk1c6sLph/sq
 FSh+ms13Xlx7niBfoXR5do5WpCmeHU9oaQfr02IxAhkM/afWPVW6Zte0Vogll2+fQw5NqdO0fL1
 L66gBG7S/QrPsbVrvBOJgr584GCEfJwdZ5qnbuy5HuY47GxqxG1eOg2VcDj8NPvIQirzDh1WAwx
 6Qjo2MR3UIkeqwzGn+NiY6K3qACZlRgtuy+sOKLg49bTJENP59eveJEjewVb6Ci53+FXXd1UKml
 R+ScNo7MZfCh0Rf578/DtM1Q37ocsRtOU2T0qjUjP7X2Cb4XjK2PB27p5SoUQbJOivn/f+Q5Qha
 PtneD17qq2VcW9HWS1p86aKwq5+8jIWlVOvssmV1V7yK27of0lGbq/sju07UmzHSVwikiD48hwl
 x2lYzk0gajzR/7Zd3AA==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8ef070 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lHabChWoiVafOPoG-uEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: l8PePsqNV1rcU8svPK1wJPEasZMDv7e5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExNSBTYWx0ZWRfXxVrtNMaVW5yA
 m1EvY4aiYP87QJMrfbj8zEOYvgQphZ7qhxiV2EpFUlU52W8WPu9gGm880cXRGE3ZvEqWGWHVx2v
 vDuVKcfXBbozNl/1xkm/j7haqRyIBFI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260115

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Add the nmxc.lvl RPMh resource and register it in the Nord power domain
table. Nord supplies the NSP memory rail from this dedicated resource
rather than from the shared MX rail, so consumers need it exposed as its
own power domain.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5a14..717c44d1c39a 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao = {
 	.res_name = "mxc.lvl",
 };
 
+static struct rpmhpd nmxc = {
+	.pd = { .name = "nmxc", },
+	.res_name = "nmxc.lvl",
+};
+
 static struct rpmhpd nsp = {
 	.pd = { .name = "nsp", },
 	.res_name = "nsp.lvl",
@@ -331,6 +336,7 @@ static struct rpmhpd *nord_rpmhpds[] = {
 	[RPMHPD_MX_AO] = &mx_ao,
 	[RPMHPD_MXC] = &mxc,
 	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_NMXC] = &nmxc,
 	[RPMHPD_NSP0] = &nsp0,
 	[RPMHPD_NSP1] = &nsp1,
 	[RPMHPD_NSP2] = &nsp2,
-- 
2.43.0

