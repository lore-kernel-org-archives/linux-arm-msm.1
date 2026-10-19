Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0CE597F2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420769; cv=none; b=YWmMQJlJ1xdW3gEpiOzp+Q2qISLZ1WtmzfxBbAzArAjioDCidjZAEqMWrpIaEEYnYRVr9hqYVaA5P0MZNJfV3u+jnq78kikcuiOBzWXN9MCEPb3Wbnd1bSalBCNxrBqRQkzBwvZh6B8NFnM8BoFCGBTGbueEBW6igEJKKLROxT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420769; c=relaxed/simple;
	bh=BK0a94vpBIqq+Gxmo6AjIyQcf/Pq7YHz9PAFVnNn7/w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CRR2kOxWU27bIQg02c3SauvUPGWbRIpJqlkLGvnw/QlPSDRtK6iCZdQg9/3ofCiY8SmWw0OhimFHsHYLO8Dx2IQRzsvdzdcig8jOML/Qo9N2qOYl+I7nqf1NX5r0eYPQ80oye2db+Bix4lKwEb0MhI81JjZFAW4WOwbN2VNM3do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Roc6lFKI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4YaDF3y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Roc6lFKI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4YaDF3y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0oUZ1457420
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XPPtczvSoEHhQY+cig7W/K
	qPdn1W/lyGMJa9A5JB7s8=; b=Roc6lFKIzuPtgF+hMjzXBapJDNv107XVjqlzWj
	st58SXh6HtsKbg+/fw6Gb/buLevJbduJxFMNpGi0/RZ4bCCUBRV2niW/SMuG5por
	9mQ3ssw6JJzlUhvhdPZxs174rGQUlH7EnQMnmX8dsNNEZmWYimAOZiEuC1k6gWIZ
	LbyzrRUhLCd7kM36F99i3EvubRGQyxGXNl7E9ZAkDjYiDOiThU7m5ALEnqGuJ8LC
	47sHCXccLZcGgiW+rTdJ63hXcZqAyByIDpLzP6H750wTAWbN+06WTluLBJoB871g
	sXC0Yor3CwbhnFYa79LtdD5XoJ9JoOMtAkPBDQTNnUla4P/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65hp5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:39:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso524468985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420766; x=1793025566; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XPPtczvSoEHhQY+cig7W/KqPdn1W/lyGMJa9A5JB7s8=;
        b=M4YaDF3yxzfyp+LNjzm0ReH7RHXeyoJ2iVKUB36nIa+KwZkd7cR7yNGwVbojggncoo
         VutC/aE6pYOucBbVX8S7l/i1mqy1epL+hPUO3Dx+70lf4NEQKQVrxSzilvH/slS+LR6R
         d5tPgk8M9vA7rqUItSS1EvrMoz5JXXdmMXU85iItGlosaRNPkgBn52Vj6eGiZxJ7hAao
         bawFl1ytqV5WlhMrftuwUlaRpjS6Utoa0DkBTu9BCI1eZIj+4Rbw/33NOtTqoE9XL1Of
         etnVFV5Ks65TKZrsqicnzq3wVPNRd/HWSbhtTjW221ABX7DdQsaAtsMimD7feFpsTLCV
         SDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420766; x=1793025566;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XPPtczvSoEHhQY+cig7W/KqPdn1W/lyGMJa9A5JB7s8=;
        b=o4p+beaimd6XM+K0mfemWyQEIujUrohjr9Nek7WrgUEnbLfQH7XiZi9AhHYMn+3xqX
         ElxB3Zjja2Yj+ReUeqi9a9AkQbRYsh49V4tel6Q77BDcE9VwRrRZuQSzwUrSkzoMv+RS
         Uh4bzGVmiJhCvu9wnPIHGoMwZuquW40CCYAY65fFcAnJ9K3Y54YDWgxV0nq3KgGIKsE1
         nlKyLcS8igQ01kfWsXk8VPQE8V4j3/rVotVDmom/jTnIzOv84a+3p3DpNv1wUfbUMvEa
         muaGJre8zH8deGAmyEMG41w/cwADUbeqIhVSSNk7oYyEWjtnOgI2EjU21DaSdldmoqex
         dpMQ==
X-Gm-Message-State: AFq9FYKhsDRMi4tpNwUnRQEZNlHONhQhzhpPmEOGRaYxCRgrnpqXz1e/
	UcOLr8T3YN7TjcQj5Kfx7/oJ0Eh4iNROvgr72J8lu0/MCErXDM+jUTwIOR0pSsy8eG+HpS7WpEH
	JiKsTc53V6ZRGqgLDzVkBupMRUxjlSzPzCCbnN294WpFOAc3mIMq5l6qNMBOabcmL/shU
X-Gm-Gg: AYBFou1BBu8orju4mdW4RQKb5i4vR/mChjLIITV4HWzSC+Wd1c1s5ZSPE4g7U15RcJ6
	f7pw41JpYlFbEpRpRbIVia2pJbUXxEXj95o41UDgJwliJZeeGo8z+h6DtOcnq14cmm21Nd6ctaj
	1dNG0mYT/RAzbOKcvMaeeoz3vyRBQkPCgXp+DHxot+0VkMywlqFcdm1keXI3zF3Ak+QABwB8Vrg
	4Wa0/Ui/9Jt+y4qsA7kukEz8pSVkNqaankSdSUiuVUHhbA48zUFaPXgHon2HJU4/NpGgk1nECKS
	FnehgYyhnYWsb4SeOiiozPmVTdO5sdM3ql4+dACM0aRk/Em9fIhh6bGvExt08lFMgE/YlVITYPz
	5XBZZSIcuc+AHoY4HRxlXte8TVvvUhbo69HL5nH1e/ZBHKrEQDn5woGoVrOHWANBcuETeqSgon9
	d/Sojzu4OSG00K
X-Received: by 2002:a05:620a:460d:b0:93e:c12c:9b6c with SMTP id af79cd13be357-93f29dcd9eemr1253703885a.71.1792420766182;
        Mon, 19 Oct 2026 07:39:26 -0700 (PDT)
X-Received: by 2002:a05:620a:460d:b0:93e:c12c:9b6c with SMTP id af79cd13be357-93f29dcd9eemr1253697085a.71.1792420765536;
        Mon, 19 Oct 2026 07:39:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63aa17sm2033436e87.69.2026.10.19.07.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:39:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] soc: qcom: several fixes for SAW handling
Date: Mon, 19 Oct 2026 17:39:18 +0300
Message-Id: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcr1moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NL3bTMCt3C5Pxc3eLEct1Uc6M0S+NUEwNLS0MloJaColSgPNi46Fg
 Iv7g0KSs1uQRkhlJtLQAhVRrecAAAAA==
X-Change-ID: 20261019-fix-qcom-saw-e72f93e40991
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=890;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BK0a94vpBIqq+Gxmo6AjIyQcf/Pq7YHz9PAFVnNn7/w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iuYzRVL0ke5C33T1RCmCyShLjhc6mUBz32Aq
 ewKg4KUL3KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYrmAAKCRCLPIo+Aiko
 1QnoB/9eg0scekKTAPMUeSZCqAnsQL/zdctCrGvIJVOBndJQU/FgISZGKU5P4+frLT8ziSGDmts
 3vvrXdyce5JBeYB3ykwL0JxVROy3a+mONoFoa15ayN3wh+Kv8N92dU6UikOYqszgSOjSyVMBbtz
 rJEEqvquWyfsHIooInqpg/8g09xaATcAMnejw8EecsddLjbquUdliCxjD6LRvz9QD1d6EgAH1VW
 6AHI5FZ/Q+EUmA0tUPZ1iFumCZ92chlzlSPnlVfMlbCnp/5WS4q0kK4F0R6T5cVefas0b97jshI
 KyQwK4A5x2ce16mgKUys+S5cdYYo8wBMHJDDGZC42KM1bmdP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX5LTs43GpGsqB
 +xXAmMUXHLsrXs9MDnnHg6AT5eOp0WF+ABA74mLfd1EN2MwAxs5Hw+20YefRSdn0izUof6dGZ4T
 76q669w4Y9FWc0jAe+UoeJ3ZDsskSsk=
X-Proofpoint-ORIG-GUID: XPpXy9oKuwR4BPb0a0mgIXm1pVJgOKpw
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad62b9f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Tsnwx_13wjLmqCL3704A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX+kTMwwU3WDk0
 tlbRv/tfgiDWr89bD/5mxhuS6IdZ6FG0JsPi8YXs46hobGzzG4mU8tojzEyJoOidXiYZhGH8c8M
 GwRL8Znho98ycPZv0LzhM65kMzUqNKAhSpFJXExs4khcOeGmmTViTViYRwGJdRtmhSGlQevM5jN
 x30ThY44SxaFrP9ug5YYhMm189Dd2sMF2rhcxrvmY6eSkU+KiSyA9RvN9a4GPeuMPkDXtfmQXQO
 wg7iWx9EfcU//HCllF8VrkNHVXrgh9crHpyP92vJRhHa0ITDxIxl3Zmr3auNwJGij9GGauPLtn5
 TgPobbtZPIbSpebJ5CRxahRdwWem+LLy6ASZwZbbXenlqbQ/kK02yt9WNJ7e79dYsIOQ0Oe9OL0
 dq8luELTCE43KAhpfRngd2i22sqMkhfWfJFmZZLhNLwsMG5awHgL/6Y+COcaDhGji/It72cOyYH
 kQYixsxavugtimfXA0w==
X-Proofpoint-GUID: XPpXy9oKuwR4BPb0a0mgIXm1pVJgOKpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190058

The Qualcomm MSM8996 / MSM8998 / SDM660 platforms use SPM / SAW core to
handle lower-power modes and to program core voltage regulators. Apply
several small fixes to drivers for that core.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      soc: qcom: spm: fix the SDM660 silver L2 AVS control value
      soc: qcom: spm: don't clobber the SAW control registers
      regulator: qcom_spmi: don't take a sleeping lock in the SAW IPI

 drivers/regulator/Kconfig               |  1 +
 drivers/regulator/qcom_spmi-regulator.c | 35 +++++++++++++++++++++++++--------
 drivers/soc/qcom/spm.c                  | 10 ++++++----
 3 files changed, 34 insertions(+), 12 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-fix-qcom-saw-e72f93e40991

Best regards,
--  
With best wishes
Dmitry

