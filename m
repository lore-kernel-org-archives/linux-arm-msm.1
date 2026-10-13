Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9F84F4754
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895760; cv=none; b=AQROcEuI3tLLML0wcrTaCDLIWlo+bj6qmHA832WMVEYjEGqKTz8a5twiYtI/8UNnIj9w610oBZuJeSN/GSIZEHHR5k2kAofEBsAt+MF8N0rOSzcJrQjcElL2ckDHDCpznY3PdGXxBHMIAH+tX0n8wGga3EACcUSJyQG2Xu+yB70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895760; c=relaxed/simple;
	bh=gF+HUjSaBikzjJybtnT6fARnlzadENkUSlr7gWZU02s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EX0kboa3DjGcEyiuGdYwFY785qYUyNSGCxTZ5Cb+MrSHny/QyiZCu2qHtjfhHKZO6/TMoNSpW6D0ljKVdNAuJTquthfQEcDghscxL1y75IixXvBkvZKs/JRlZ0kQWixdUBOclSgM+IzzjAZqB3eO9kGUs9YLcEq7HQqkNBA9ijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMCUYw8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZx6GnYK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMCUYw8z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZx6GnYK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9b6FM173399
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZTOf2SvkpjhLo6ewbTR07v
	dO1sWGSsadUYwXzXxKpiQ=; b=UMCUYw8z4omrrplNqCjAqd4YgJj/O4FPWYhcx1
	S5KH/26OLrhWmWiZnGY9UIG/upxGUZkKAjdZ6dCUfMiWSL9G1WlAzz5F+yfvfhFH
	7/Q+zG4QJ+Xqs1p7ivg8KqhHgipBs7Sx/ztBU16YIDyVuUdLChxgZrMSUsetQhud
	TIM/ulTakYokj7AmLAyCsfNIv1yZHiAml99BOtltqYViQYdlFQ0l0PEopYtjFVx3
	lJA5vgAnziRU0Gw2tR6BNWG1lCr30Mf66Ace4vWAGsc7WTj8j44dT7aLpAmnOx3p
	IqyAzIxKgbe42xv92UOdahdQ6Aa3aj66nMbYPWWdiisKib8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqt2a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:49:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46c120dfso311683285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791895757; x=1792500557; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZTOf2SvkpjhLo6ewbTR07vdO1sWGSsadUYwXzXxKpiQ=;
        b=HZx6GnYK68tGfq7Dx7Mc8V1oVh+phD4hZSkeGdPN6o65c/fa5TsdVSZMxHQy0WuViX
         uFQEngvnaRVkhdYOfGqhljZ5B4T/zv3zcZTSlPcOTjsEDKsnVoE+XrAJcVpO7wRLc120
         ehc7hyMdi0DvgktKUU62dw8BVBWX2/fPKtwrOEnAB9SiqSB2pHoVTaK+0NMDZlEJjKPL
         sWFs40nqb1ywIj47ws2Ac32yoEhZ5tjpZUelTxoElC4CnWeb97e78FzbNrr4EEj0g64L
         fVJedRHz1twzLbSTTNBri66B0CyKFfAvV4Q4z5zcGGwhz1sVVzPwqUqCqR0uv40Otcng
         8SyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895757; x=1792500557;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZTOf2SvkpjhLo6ewbTR07vdO1sWGSsadUYwXzXxKpiQ=;
        b=ONUYH/YJQlM6Jobb4RDo26OY7mfxwEbyXowskgwSOnfrseQYfo5h1iVbajtw6M4oJy
         LbzNKXd/Es9FID69A/UrDAT6GbXZ6NxLXZJbeM/OJc9JE55rVY/jUxMlxu5LfKmHINmd
         EKduIn1RWDGL0PXQICjD3IWrqxiNXVk9zLejqzTFofFgTUmvxl0/iSeYKGCqKXdyPU9u
         F3eSTzvW7A70VpenfYHmeVlmCn2kttff5abSET/vlbofEehF6X+p1P50IeNfmlWpqCKw
         4+Ff13Ws41dFAsF814blqanZu/WA27ldNMCaRYPbpWJCYiN8G7wLDUMJ/qTkTEAtF1Aw
         FXBA==
X-Forwarded-Encrypted: i=1; AKwUvBzyOfonEKLN7T1hcb7Z0gwsl1/2jEvirvrw+RWr18M+VgYJ3ej/5kGhjmQnCcfptMVK8f/BV8Lb71SGN05C@vger.kernel.org
X-Gm-Message-State: AFq9FYIjlRdvGtfrVSj1j7pxoytQTBI8tTylf8Wz/tDuqw6nW2Kj96nR
	E26Q1RJSFhwjG5dRi5Vn6HEUpFP3/Je/FDS9xRecF8bEJSUB028QLMjInuqSlAZchOp/EkldPRv
	bhP61jfrGUfarc/MqjFFOtpigKwOqYep41bYfDheWekJDYVuqcH4fn9cg+GyWrNMy8XKM
X-Gm-Gg: AYBFou1jaRWC/9eJONwgvaCKrhb1OA2zxTmnPIL6/mly8EbYs3b0EtYLzDtTjZRsLE4
	G1yaKpngTDqQ5Rgfeo79mghwUCwIAOkX/EF6cPmYim8/epnDHmKOE6/nxhZzu/cXA4kaCGUhrg+
	4EG+jMFrQfc19zRF7Iqb+5Z554TB5TI43J2b7pkmm1f4DXxFo/O5mVf7FLqayAzIEIxJSj3hjCI
	Dag/rTiFpqtLhurOgBeCkWbL1XQi3E+L+pI1Mlzlr1qWZJecTXP81Qr5245dnpNCb73fTwtR40n
	9Ygc5bRH6z7CnsTP0MWGSfWVe8BbMvUAu0Tw2QNZV+S0D/Hm3yVjdNLIcoLj+/4qwovy13NS5vC
	5mEO4n+C+
X-Received: by 2002:a05:620a:7018:b0:93e:b7cc:67bb with SMTP id af79cd13be357-93ebd278519mr1938893885a.54.1791895757311;
        Tue, 13 Oct 2026 05:49:17 -0700 (PDT)
X-Received: by 2002:a05:620a:7018:b0:93e:b7cc:67bb with SMTP id af79cd13be357-93ebd278519mr1938884885a.54.1791895755713;
        Tue, 13 Oct 2026 05:49:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab6361sm4351081f8f.32.2026.10.13.05.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:49:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/4] pmdomain: Preserve boot performance constraints until
 sync_state
Date: Tue, 13 Oct 2026 15:48:38 +0300
Message-Id: <20261013-genpd-boot-performance-floor-v1-0-a765dc83e6d7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKYozmoC/yXMTQrCMBAG0KuUWTuQFCziVcRFfr7UiGbCpBWh9
 O5GXb7N26hBMxqdh40Ur9yylA57GCjcXJnBOXbTaMbJGmt4RqmRvcjCFZpEn64EcHqIKJ9cikc
 bJzhvqBdVkfL711+uf7fV3xGW70n7/gHbafHagAAAAA==
X-Change-ID: 20261010-genpd-boot-performance-floor-8afd51d6eab0
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gF+HUjSaBikzjJybtnT6fARnlzadENkUSlr7gWZU02s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqzijAml/2l7elJObgNZS4YjDmq0pM+mZ+SZnUC
 My6+YrsJ/KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas4owAAKCRAbX0TJAJUV
 VqEWD/0U2VU40PoRitj13/NsJCdDOQ/S/ANJmFGlM8rlBdCARZM8sxvlvQXC+aZLFNLx3F56WEL
 eITcpckAEZ2JJ25Q/ysDJRPYrbfF8gY09mdC4VKirMoEp9FKgslV0KnlLKtjdE+HHCX2PWyB/0M
 kwqVmpCBZXJhzlbHPLS0UAjBrH5SpdcjW1iF8DrQ2xjxDf5t6Twi6E91CGeabu8Cei9IZqdTody
 tDU1jaO3D8r0wO9AK5/zWyoBc835bQEFRvsBjzw80i4khI5Bb7uI3YjHreH7zwfzAF0Brjot/Z5
 6JTdzqIv9mrAQZR+rp3YbELx6ZjBMzEQvAVOJiYpMmnf49DAuwSmne5whiksxStqMI//vCuMhkG
 4VTqbn7H7CDIJIOF1U5VO1JRMC4m276mWsrV14uz0ox5UEgLdDVpvMVCijuzAijT4SGv58di9Y6
 Uv6utLPjuLIwFQkmUMRqhBi56VJgSx14iTLhsFQ16whWZypWoGbzYQZMB79nFs2/GKEvlN3DSMb
 PeDHyTOehDHDE6Y/EZtXHjkgQNWKRQoy0fBgCsc/QgrKzobmbS4OuiFdgnuyALhkeBvEWQbYYKs
 bslTwz8bmM9JCMchRjCZ7O3wJatZ8L7gh2knxvUNrqxx/W2pMum2xIgKTuRfUe4Hr3JS+xGTB2K
 KLqw5xSKF+DrLdQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: -WhwkrE_PE6qbIed07bHELziaYg24Pph
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace28ce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LTKF18k292_tN2xtfDkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX4UbMO3f7ViQW
 ji0bU1RWScwPtwS8dKYBU7sxwaBxptedWSZIzQNA3QjUR45Wil1CoYTg8ux9XfCl7Cwe/Ued41j
 VXjS2/eY28oNSDra3m7gcHcM4tr1K+E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX+86uiR5pGcGe
 Ysw3TJiO3aV87+GoRujxlEq/mBQct9zsHfv1Jp2pZLLGgrk46CKmjq+f2GkhWqOI59BtIXpBEGP
 K6arKxkO41Vwa/uqohwmjpg1u295aJzGjbttthM8aLzKTdIGOoVDtoYyQdpbKklExkB2JFy1bcD
 IfB2XJ8Mv7gIBCuOHjOil8EbAxd5U/Eo0PhX7/xfHg2vThyMXOkz+wXSHNePMyYWIXDeEgr/jEL
 yPwNv80ymJ+BilGV3/gMDEay+ZMjOs4JVZIfscurSV4VDYr8x8R+FXHytdm/GV3pwqehvAemo8z
 eXBPIhGzdkSUMbeY4dxnlj+XvKjHryx3jcAqQ5obLVyh9peK5+w7mZGuAh3a5jP0m6RHZA9qiSS
 67/cBjIkpO4jMy0AU/kU2iIF1kUbioH1/5QeRXGQxff+JfUCmvNVcSCWolCNINGRloK2M9Bhnf4
 v/6oKsCEzW1nM3gqFZQ==
X-Proofpoint-ORIG-GUID: -WhwkrE_PE6qbIed07bHELziaYg24Pph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130050

RPM and RPMh providers clamp performance requests until sync_state() to
accommodate hardware configured by firmware. This hides the boot floor
from genpd when aggregating performance requirements towards parents.

Move the floor into genpd, keeping consumer requests separate from the
effective vote. Apply it before runtime power-on and prepare the domain
hierarchy before system suspend. Release it at sync_state() and convert
RPM and RPMh to use the core mechanism.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (4):
      pmdomain: core: Support a boot performance floor until sync_state
      pmdomain: core: Prepare boot performance floors before system suspend
      pmdomain: qcom: rpmhpd: Let genpd enforce the boot performance floor
      pmdomain: qcom: rpmpd: Let genpd enforce the boot performance floor

 drivers/pmdomain/core.c        | 80 ++++++++++++++++++++++++++++++++++++++----
 drivers/pmdomain/qcom/rpmhpd.c | 17 +++++----
 drivers/pmdomain/qcom/rpmpd.c  | 12 +++----
 include/linux/pm_domain.h      |  6 ++++
 4 files changed, 93 insertions(+), 22 deletions(-)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261010-genpd-boot-performance-floor-8afd51d6eab0

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

