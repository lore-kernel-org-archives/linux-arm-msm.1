Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0927C2BD11
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786427422; cv=none; b=uxiItRHUiGPcdipZeT/+Pa+T0MSQ+GWe79POsVK04oULZH4HIT2SqZJ+93Y79eLeMB3VR4O//KesC2Xw4OjM6XZIP9hmFq22IiRjwy0O/Oj8oueEzj6liXtqA2u//zdx+GFAb/MsVR0X1A9BH3JwridBreZ/vqqmFPaAjkFLs08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786427422; c=relaxed/simple;
	bh=YxRmzsXwL69qEXZhxMu1pjQ0toXga7vJW3wqY1JbwA8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZlrSflfA4FXDTg2Dn2MtAhi8XIEvTOzCGms97q69OF53sEsVLSjNX0M/FRVZk/f80rrkGPHl1/EdppAaNcf2AqaQuVmhGNT7HMnw74zsTJxH4x2efdjyKXCLKLORGqi5F5VZgNFmc/9wIqDbQDOmfD7ebJNY98+N5e3TAto3dNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edyXknsu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KlTUUbah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edyXknsu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KlTUUbah"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMqROG4158353
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zlCU+1Hoxq1rQXyfHtQVCx
	21WrqoA84d1mAPvKqjLm0=; b=edyXknsu7Ac2Lf5UgRXVSbuPpaXr7ciSk3O+XC
	Tz35O8rSIDzaRsBI6jgoJ9eiBaL5wjpFGAm/84bPkMVSUS0SVLRyMpuZN6o1k+fH
	DMz4M0h2fNTI8BbAmNOR21FdTfeJyHMxUoFA+aitAmsiAJINu4qiOnhYnhW4sLAA
	U6WUj6hSHVwkZZBFa4lFDReufwyCg08tRlqByLBYY2VBE1Cl8smE47RHwcY+KEDU
	ecICVq8gN9zsWiuCkk0dd9Oj44aY4z64IoLUglwJBzEMKg+xSp+7tg7jzuuAZAZ0
	pHBEYIDAhZvn+0N4mOs6I+VVL3+YIrgkCnenvK7kANeSAEvA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyhp8jw7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:50:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so668117a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 22:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786427419; x=1787032219; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zlCU+1Hoxq1rQXyfHtQVCx21WrqoA84d1mAPvKqjLm0=;
        b=KlTUUbahI8gvIi/m/zEzowCWVoQevVOZTw853a6VTX8UYZkLTNfCjSHVBojbLGfqai
         0kSO3OD8b5V1a+HIedM5JfnAeEyUSzxq8l76uXyyRn81xdN7SXWH2o4AbxV3C3B0rBuv
         nzfVpgkpbOYs3j6c8e+/DxZ+QQWHE9HLbgRJe7Qv8mxyi6zS2KSvDsgCj8q1Qtr+wSe9
         CP2OTGZ4WXChbKj1eNbVTznN1YdEIh76J0nf5dRKRok397Wp9mKDFG9QcfaHkSg0UW9O
         1Yu8QBGKDz3Hsj8esvPbUHtnV28m90ZJ4LFjW5bzV76R3kb3JWLKyAJQ+DDn+tDM5lAN
         y5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786427419; x=1787032219;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zlCU+1Hoxq1rQXyfHtQVCx21WrqoA84d1mAPvKqjLm0=;
        b=n0fsKY3Q/iz33lCKQJG2HM8wKwmsvPj/HC4hElb0o+aUxVDyLCb212T31QSlpjnxOP
         dEN567QlE2AN3Wp8wujDZboD4gna4NAnhX+4bpoJoZ+Ic5EebpzYGgNjFLlmo/RbtKEz
         7XGTcOJbJ2GkjvMgb8QpUQabNNcHELA0YPIRjz/n5NHt8Yl3w6lf8UwHx/BJh19PMPmj
         2W4ob7thCDK0+zCWsTBU8k9quGHF47VYKZ/HfZ4fyejUnj9pIQwUFEwYhGG9rGArxa1Y
         pwVHzxL9UCqf4L2pvObh5KlbKtOYMYX/qLleXiwx85LVl6Jw9q89PDd4g9jzzDoKTYUG
         D8cg==
X-Forwarded-Encrypted: i=1; AHgh+Rrt65Au3TGZavO4YmWPl1B5txlONPyRFHnaOajn+JNx89MKBOqIpE3pUfCqlURLa5VSNvVzRLKNrkWFeH3f@vger.kernel.org
X-Gm-Message-State: AOJu0YyOZIuaXB4YVVgukCfVYIrJz/zuGU3BWpxbfs3ZoldzKc4OJ/GS
	bDDFIi3POs5hQWEHSXk14iCmBc2859dRp6oGgYosaSlMPfj5sP7HlW4SD4y/OeL5tV34Q+Z5eGS
	xyeIIJQzYk9V41so2Lb48l2RgCCGg8p1BpmOQPVcPQjnFm1qBX3nkBjm03Xe2p2lCVGeL
X-Gm-Gg: AR+sD10dqiB7PK2YWTxBiIwBFL69n0ccOvupfDJiFQgYRqg39ScLpGuPOKGJmwNwNIO
	9D4PSgdwS4jX5OVew2FEwasMfHSwsRtoJ80dTMtIZmMo2tMq6Usm1X5ZGcG9U97RC2kFQh9yAZ/
	NQyzX4BlnnP7i+oJ0AzBdNbr3eHR1YkFpSlsY/xtfx9asaqQNYAGJGcb6ATft8VuuPzvSYd4TGl
	0Kx4U9r1/fBfnY/NgC/5khOl/+zjGRrn7rkWCZqDrffJ7BfgES3lL78p3bovhYPhcS0aptgeqOf
	buCuM5e3xZHp6reIMwJ30BHPgxrCUffh8czUDTpokMa1+R6c0kLkMH2aWMPimFkSRmH0aZZKSvY
	EhdXxbStzvyN2SpaEGbQuZpn4YlAP
X-Received: by 2002:a17:90b:274b:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-392ec71cae0mr893338a91.21.1786427419512;
        Mon, 10 Aug 2026 22:50:19 -0700 (PDT)
X-Received: by 2002:a17:90b:274b:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-392ec71cae0mr893298a91.21.1786427419032;
        Mon, 10 Aug 2026 22:50:19 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d534ab78sm2062289a91.12.2026.08.10.22.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:50:18 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH 0/2] cpuidle/pmdomain: Correctly track state of excluded
 CPU clusters
Date: Tue, 11 Aug 2026 11:20:00 +0530
Message-Id: <20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAi4emoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0ND3ZT83MTMvPj8tLT44mJj3eRUM1NDc8NkQxNDMyWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgAd7Bs8cgAAAA==
X-Change-ID: 20260811-domain_off_ss3-ce65171c1416
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786427414; l=2479;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=YxRmzsXwL69qEXZhxMu1pjQ0toXga7vJW3wqY1JbwA8=;
 b=9ZpJsh5hzZn3fUVFYXRZSERpLh4cMMRBFjL4WlJuVSsfwTk6lKhZFtRrDgvrTe/CEzzVvYLdW
 z3jyM5yNswhCeEgvyVIM7qj0PgYMJB4uTzzNHqEBrDgY+FomgR2ZDh5
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA0NiBTYWx0ZWRfX4ULCNH7Ds94i
 R9QHh088qbal7DDJcW5dnvhr+oHtUB4N8ki2CwZ3QHKlIupglGwT5QMuKPm6g24UDvfWYnBl+dL
 NRsMoeA0GujOckwNlAYRx8EnRBjbFLE=
X-Proofpoint-GUID: JWgBsSMLPA9Mi48LA6hYFqW_PWed4AXB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA0NiBTYWx0ZWRfX5tgAuSPzqQrX
 cZER10xR4f9QNT1EkBPsis/Ni2L0peYNN+yw1I7ef5qiLRQakYJDnvygqd64PkfrpBR3PjkIeZZ
 +tgGyLPK3BbTTA5QPSpmGgfZhdnqiLCpGxkABR/2tzYd9xScyQKDulp0PMUSJQYDrZRHrflfDFW
 Dgz063m+xgyJKMtIO98BebkIZlP12G3LQ2Vnzf4A+ZyogYFknNpZXaK1HBeqyZDhC7oPmFEXGDo
 lmFT5BjOQ3PJE6vUuVj4xRf3aCNKV81kXr0gv31kDOIXF0ZO/8RXpq1Sf4iYloweFpHdvQmOlHu
 oxHmfkWpNteAZA01EfhlKLmSIf/jcUcZ4JX+ZTY1CbVBn27Ar+FVbr0rAGpC4c2WQLqqKYtgfQY
 5OimtY8x2Q0Xex79lfqZBOi7rjo9ztJjDlhDeJC0HA9ofsvWloP7GuDQNFqDzI1gn2Jr1TFys2N
 FbQZ7oWbJ962BhsC67w==
X-Authority-Analysis: v=2.4 cv=RM+D2Yi+ c=1 sm=1 tr=0 ts=6a7ab81c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=D9W73uoA5fEuy_YkFGwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: JWgBsSMLPA9Mi48LA6hYFqW_PWed4AXB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110046

When CPUs in a cluster are excluded at boot (e.g. via maxcpus=N), their
CPU-cluster genpd is never really powered off, and its reported
idle-state index never reflects the deepest state either. Both issues
independently prevent the parent domain from ever powering off, even
though the excluded clusters never ran any CPU.

Patch 1 addresses the domain status: psci_pd_init() always calls
pm_genpd_init() with is_off=false, so a CPU-cluster genpd is marked ON
at creation regardless of whether any CPU in it has actually powered it
on. For clusters whose CPUs never come online, nothing ever transitions
the domain to OFF afterwards, so it is stuck reporting ON forever. This
patch starts the domain OFF at creation when OSI is in use, since
dt_idle_attach_cpu() and the cpuhp callbacks already power it on
correctly for any CPU that is or becomes online.

Patch 2 addresses the idle-state index for domains that start OFF: even
after patch 1, a domain that starts OFF without ever going through an
actual power-off sequence is left with state_idx=0 (its kzalloc'd
value), i.e. reported as parked at its shallowest idle state instead of
its deepest one. genpd_power_off()/genpd_sync_power_off() gate parent
power-off on every child being at its deepest state index, so these
domains still block the parent from powering off, even though they are
genuinely off. This patch sets state_idx to the deepest state whenever
a domain is initialised OFF, addressing the root cause for every
is_off=true caller of pm_genpd_init(), not just PSCI CPU clusters.

Together, these two patches let the parent domain power off normally
on systems such as hamoa when booted with maxcpus=N, allowing the
deepest system-level low-power mode (SS3) to be entered.

The two patches address independent gaps and have no hard dependency
on each other; either can be merged on its own or in either order.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Maulik Shah (2):
      cpuidle: psci: Start CPU-cluster pmdomain OFF when OSI is used
      pmdomain: core: Initialize state_idx to deepest state for OFF domains

 drivers/cpuidle/cpuidle-psci-domain.c | 14 +++++++++++++-
 drivers/pmdomain/core.c               |  2 ++
 2 files changed, 15 insertions(+), 1 deletion(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260811-domain_off_ss3-ce65171c1416

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

