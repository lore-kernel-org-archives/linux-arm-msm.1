Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E185D47CC62
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261292; cv=none; b=Igu74JXVlq370yhfTYYqJ3RsvaHPJhRiuYJKGYXCjbYr9CBecKllF0pDunaYD5suYSzkkA82HGAb406TjGkDeUhWXUIkBdT+Cubs2w8Iz4YxT45YygIfEUauUEHopvTw7W3K8vr09EONalVDz0GLqqEbXX4Yx34nC+/SldwAxK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261292; c=relaxed/simple;
	bh=e3wE+BNi8M3SeW7jiB0cUvZsdn4K20sSqmTCnupwXu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MlwM3XtbrBAdkg2Hfte+/gPf8nO3T8JXHco2MSV6ysGr02qb6hywz+yGy+/dQygCzh2gZM+Fph15ygUem5x6tfVnOnS3Pj0SoRk7K4EzQYj3ot4EtSOr5kMN9J4XT0V69CHdgv5lJ/HteUk3/ngVRcoIFQeakY/nAKWlqt23F50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvUjuT5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GO5mooND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvUjuT5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GO5mooND"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJpxQ2752324
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 11:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7MrluA5bkbeiGOCaNAU/2soekLgfCwotYkX
	EEyAJ+Z4=; b=WvUjuT5j9O9In+1uCfnTxeQXglqvDe2asBOYuOSCjov7R7k2fyH
	EjiDrCgdbBmgMu7ZhI50tOl3EPNlxyGKbz0pHbVAjBPfbSCV+83BBk4BDDzw4fGp
	ql4XRmadbi3Wo7W/nPe5ywg1aq6ZImMTfMxiW2VTjFY3Cqf345jDhCvOLpEEk49l
	yOLE/WWeu0W88kaxpNt0GzCbaqa9rZB744DzKzZa7MpE50PoywUAkbdgaRzejVVG
	P9TmIrjr241ldmzE/rzf3TInHL3uCBFj2GZOnWjILyMb4RAPFD2Oh5v8xpah6hue
	NuVJAFAdJRn5WhFDglQYozsRNXqBRd1OQEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchbmfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 11:14:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so172056885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261289; x=1788866089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7MrluA5bkbeiGOCaNAU/2soekLgfCwotYkXEEyAJ+Z4=;
        b=GO5mooNDRE7IObt64qKYYEhM4EqBdmqY4rCexYBXij3D6xkkZJMn5kFhfNNEJENe+d
         kRpofsCqgxsBl56IJRPAnvt9+1/Z4FZgmiTMkfuAXkXN7GV25sQT0wd6QGQcc/wUdvBn
         /gVoWo3Ih3Ck5uM+IB2TTRFfEQLBaQ8Yjk/XHv012OZ3V7MNCNUZoyTKHV0WSZVl+gEP
         p/qUlHr+Pzq8WE+9eUrytk66R1sXMncy5uRUBLfRoUJs4s9jQYvk3F7X5I4VS6zDt9SF
         MdSvEdgu2t/+0ErqiDUoYqXJePsigx9TDhULr4lZZgo3aZ8xXSMJrXPQ8ijLtjbVO4rf
         kyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261289; x=1788866089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MrluA5bkbeiGOCaNAU/2soekLgfCwotYkXEEyAJ+Z4=;
        b=iPywVayS/FdwD3jFL0Tj4oSbh9WYjBegYJ1RDiho0rwLBqItLLAsvkNQwvGf3dHq3h
         OyhhENhZnAUzJAL67eOUEW+tHSElI4o5GYBwAdGGd1zG2lIWyhAWDlifQWgicOE2j8P7
         VGereCB8of1kU3NLlkWB6KwjUfTHOVFMwXomFlfMa8/xNAsaXEW7i2Fnw7NmWBEToRJM
         jildJxNfWE0YMOJhzsz8Nveod/bu2eo24NFeYz7b1BU6Vlfe03toRwpS4U6PHoq24jEs
         q7cqHyxLG0FftuiBoWOMA/xiFLzscNOJZcZ81q00vKb2e23fra1JbXTxds4rsKMdo+cr
         2ZvA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7TFu3FOsyG26CEMq956WAS85k/gDeLbVazNEx1Fh8OS9HPKGQOsJ07tTxQ4jI+dnoA5kH0gijywnazXmu@vger.kernel.org
X-Gm-Message-State: AFuF++mmZd0TDdnjC09BfJtIuZcAcdJfhzZ+mxbEXyfxfWJVbEozI89K
	0Y3Q9AFgUnGif5sRW2fO/6Q+LWTEuZYrcJDTZSc63BW1UVEeYqB3wRy4K60tiazZV8jA2o2UF8y
	1aBt1rgRi46HFNCMAfJU8PPjogYAFCIS8s26Tia45MsGry/T8+aeHJ06PkzG2v8K/1bp9
X-Gm-Gg: AR+sD13Bph3kJZRFKXXGfa633k7CiFuuvqXebAWmE7o9UjADb/YkiGLtUmj/Loc+zuz
	mi/p6drLajEly1zZdcSRF8rjg6KrFKPJbyk1fjam6gT5FDOS/kSbYdvjBYwAmpTYuHiukd6S8I4
	Ws6M3B47UXn0fsj+DpslMoz6v69+v23T5eb4K1N19fN0k3/JoJc0Muwc7YNHlL/FBBpkexFapfX
	V3jVWAcA45FlpTbMt1g7ZcjdKgy2mQr4fISpAzxKAqBJhgLXEcpNxNrQUex9ozTsyBR9VCVRmMD
	hZdKQDVFWaTPlyq71urTDg+F6vM+KbtZFERCoX/rnvYJrY1R42239WRoRg/q0Fjt5u/Tq8Iez61
	zfYQvOn+R29m4YHuX8wJS5IHGbkCDMEWUEwMo5RoLQ3h+weZ0aAabpsteYQ==
X-Received: by 2002:a05:620a:bc5:b0:939:28b6:86dc with SMTP id af79cd13be357-9394bcff0f4mr452462985a.17.1788261289196;
        Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
X-Received: by 2002:a05:620a:bc5:b0:939:28b6:86dc with SMTP id af79cd13be357-9394bcff0f4mr452456685a.17.1788261288648;
        Tue, 01 Sep 2026 04:14:48 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:47 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Subject: [PATCH v2 0/5] pmdomain/cpuidle-psci: Fix behaviours for CPU PM domains
Date: Tue,  1 Sep 2026 13:14:03 +0200
Message-ID: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dXlfGWVhf-aOhBJFujRzzr0PvXyqcu4g
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96b3a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yh3ps83G6N8KMOvRL6AA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: dXlfGWVhf-aOhBJFujRzzr0PvXyqcu4g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX/MmDnB8eXbpj
 DsCfklM0Ac/W66C0EKxEBcenHIEycG4rP6qkXQWyfGk7Ud5J51Gb6dtIIr4wF/cPCmcvLt4NIuy
 5yTmbaRdv/fOu580f4uCWV9kFz5cvb4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX30Mx321swrxH
 StG/c/pMHttpvtCBZWyEK1YwmoMCrSuIfL/RsuztCflqpkRsM/P81dybmuWBNweXoIw9o8H/Cy6
 2g7wQcVFotHKhQdzyTqWb7X/Ub1vd4EROkYPVJxj4ge0exq5uZRdQ1dzl/IJFKw97BEsXocPwgT
 t1qiD9KN6mqOBt0yLF+io7EZh9umVLNvOss5o0yI3xR+pARCmfakErmVlHcaq8qfvobasJf+Kl1
 y+3IUrcNhN7wwM3qWH+jhWdP/IPP5dZei09uCu6yw6Q13EF/95l50bONqzDAoxQsMmSDAER8IWO
 j2/OhFoCVG3uA3Jf20KN3JFTj8BPEcfIUlwOPcKThuTRzaf/Rwkcc9C0nrjoq8aqsCK5OMV3CFC
 XoRHzHmGsFHykDXA6fQdx2T93OjUruKteAt83M5GdDfNwwoS9iXJVGaz0Dq65sLNrh+mAItTKZ2
 mNg79AmOB0MTKoJurYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010099

From: Ulf Hansson <ulfh@kernel.org>

This series fixes a couple of different, but highly related problems, when
dealing with CPU PM domains. More details are available in the commit messages
for each patch.

Note that, this series is a follow up to fix problems that have been pointed
out in a series [1] from Yuanfang Zhang (Qcom), to add support for new
components for the arm coresight subsystem.

Changes in v2:
	- Dropped the RFC.
	- See updates in the changelog for each patch.

Kind regards
Uffe

[1]
[PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
https://lore.kernel.org/all/20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com/#r


Ulf Hansson (5):
  pmdomain: core: Rename genpd_status_on()
  pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power
    on
  pmdomain: core: Add a genpd config to support unknown initial status
  cpuidle: psci: Initialize the PM domains in powered off state for OSI
  cpuidle: psci: Move initialization a bit earlier in the boot sequence

 drivers/cpuidle/cpuidle-psci-domain.c |   5 +-
 drivers/cpuidle/cpuidle-psci.c        |   2 +-
 drivers/pmdomain/core.c               | 111 +++++++++++++++++++++-----
 include/linux/pm_domain.h             |   9 +++
 4 files changed, 106 insertions(+), 21 deletions(-)

-- 
2.43.0

