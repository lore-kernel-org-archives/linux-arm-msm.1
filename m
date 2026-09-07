Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF4046C4CF
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779834; cv=none; b=nSrmSjAtmHH10jQs+sj2ie02q4mM3reccvpRJl8q0Up6WF7IYv7ANBE9xCoy1gRn4hi0t/Ehi7l2RzdRdXtXjXTCTxkGxvAcuyBBxs04PCRCvqxPHRNCbqD4uFIsAN4WMTXClHXxspkAPury4cwNNiLoh+aC9czS9QxLPa+HG2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779834; c=relaxed/simple;
	bh=ragRTD/eSWRr0i7oNZ/f6cbKX7zyeU+DSK6IwJzjDEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h6YJL1mUSvtL437zV4SUkVsYepkGa1kw776OHAtoGwC8TXflbFVlFMZazxEe2FVezzKbXXtPv0th4fQ3x60fRdWNQI7Ncev3Cbbx/QLK/LvBR4RNWXwdmLNwLJR8pu4AUMemzb5zUav5uKaiVIcYpzsNoQa9wMzO7thNHMiY0Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5AytUk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Up4NGJrm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5AytUk0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Up4NGJrm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmrCB2652038
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 11:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hx30CqPRS946wiUAi8sDP3gBPvcgRjJiueb
	cFUrh2Xk=; b=Y5AytUk0zlXvDOnmVDBUjWK0AJOcnJN+7rP8AAkv7byebXjamK7
	E0vQJX0sBX3iZ7uzYlBxHBhG4nUv/TUDG9x3ae6lYJZF5Jvcd2xHcoIhEPUdfZzi
	xUXOr2oc2PP+hdvWMijmpfZenKRDSMd5xATKeqXWNNlA4sPv+T3PFGWV2/V271Km
	je0Q9S7hABWgd28A+9pY0PT95fBQ3ML3+2H3s/dWlouI95zS4NiP9t+g2eeFOz8e
	oZLjgshPA4TeEqXdo7aXlKLK5PxiIlco3oico71PbFtJrdeduMHjbyhAw0v6o+bl
	JJqTKgZ2Gb9RNxCkgNreeU21ml7p26qtc/g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0c9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 11:17:11 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb0a317c4so363561241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 04:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779830; x=1789384630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hx30CqPRS946wiUAi8sDP3gBPvcgRjJiuebcFUrh2Xk=;
        b=Up4NGJrmgWfCbQG2oQHufeRTBqbNBzY3R5oq5Ll3ipCFk66wf8WNZdSun5W3Qg67G6
         Nq2ZOMpcsM83lqi519LbDDm9Nvf9Z7leiP9TQDjgqr3rt0VoYR+cttIaWKCNN7Uzt8IL
         DIGhWX1rUAwg0kvIPPhR0Qnoav2+QLtX8cz5284CTktAt+u+xVJ08PVhDEaA6JVxrapq
         huqs/MsWd7ritbWOeYuO2YvDW6o7w/62Bua0XUWw+nVaTGxr2pK3LFsHBBzuaq47I99x
         BavVTbhmieQBlNvokZU87g9FAM9n/e02TD4DtO+HNeLa7HyI86byFRT0wSCrq8CwRwnl
         2Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779830; x=1789384630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hx30CqPRS946wiUAi8sDP3gBPvcgRjJiuebcFUrh2Xk=;
        b=oFd3ZAbiT+6REjLu3V9eudDReb0JGRTxvyqGbdxdonSAHEnY+j7l9tXRgf2WNW3p5I
         DFiIKXU7Q7RoHAPhyJ0klZ/nWlmdATEmt86PkK3uJZtvysEDXoNAoGO73G52vcsL9s6K
         S7IGIudTu6jgINOX9rVwS4OkSFLIgYMKSghqZWvlTWHI50MtbuC/b8so0WHKZDNnCcEg
         eIdsl1j1wvl88QLYd0vPkd79MaefMWvA+GQmZe9wuUsqWfOnHv7rgTDPayvqz0Gpgikw
         mIL4dNaCkW+hpZekfyY0Quj7vuOJZyPdJ25tYqhaPLSBrpSTHEu796aWMNVaBOgGLCIF
         fEDw==
X-Forwarded-Encrypted: i=1; AKwUvBzRXfuqdNbGF8HddkXr90NEcQ0zSRqFL3vCauxfYZ3skjrk8zTQcR9m8xthET6Kx7dGbhtBC1GHzlgwnaCc@vger.kernel.org
X-Gm-Message-State: AFuF++kDYnYWFz3lHClWFpIxfNWzZjU3DeXGnTBNK9SnGsL62u4SksBA
	lHIIkUfDwGY6MYAEclgO8cCcCGL1D9lm70atQpQEjsApbSN2IUEBO6gNVy6OBp5xh6+XCo4AEwH
	kMT5KYkI72WleSJJ0LB0atKykL62RKDOumeBKkOh1Sj/DT6Qy2H2fgwG8bia97aNo9kDM
X-Gm-Gg: AYBFou1DF6IFTqrIDa89kD/5vF5ompnTpHrU8zOGn25M76Ea8oMW/BYH2ikMR1Sv094
	PCygl/XTQNA1C+wqBuHi/t3bI8Nt3CTH0pntMe8015JOHpoWvuJ61jL8QyME1eQDyRXAmJUbRLO
	24hnZxlkHRvfnNQyxwhr9Mfla710QKctazcLe4MMG8GfV1NjBCZL9zwbWTuANm4J2431vp/1Ivk
	T/agpKesXOW5FZH8U2ZIKCuGP3+qQEdS2Em2OuycArECbWoYZrodfmju1zRDalP+2HQjXh9+9oF
	fkJUI4hKw0T8iw2wtNPTcv0Bi2Ql9Tbdo7fnfP5GFPWYei3K6pyrrhKUBTLUIFwkzc8eNxYF88y
	FHYlZAPFMnk0PpEZ3RP/0S3PckIkgvyloO+wcVThj5O+dKt5Cr5F2ePZPOQ==
X-Received: by 2002:a05:6102:943:b0:77a:d089:3dd8 with SMTP id ada2fe7eead31-78a4aa5a199mr6766453137.12.1788779830428;
        Mon, 07 Sep 2026 04:17:10 -0700 (PDT)
X-Received: by 2002:a05:6102:943:b0:77a:d089:3dd8 with SMTP id ada2fe7eead31-78a4aa5a199mr6766432137.12.1788779829944;
        Mon, 07 Sep 2026 04:17:09 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm456120066b.59.2026.09.07.04.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:17:08 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Dhruva Gole <goledhruva@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Subject: [PATCH v3 0/5] pmdomain/cpuidle-psci: Fix behaviours for CPU PM domains
Date: Mon,  7 Sep 2026 13:16:50 +0200
Message-ID: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9e9d37 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yh3ps83G6N8KMOvRL6AA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: DN51E_V3YoPxuejzb6edtWI4TyXKpLsE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfXxFeQkC1srs2X
 gelFCI1fAUSqgNaYx3JTNQy30yIZhf+EUJR3ryANpKHOebvTqRTINISY0FJGXrbl7k6+8uyWdv0
 OGn8D9a3U6oNPdu39+T3y/BiOQFeOP0=
X-Proofpoint-GUID: DN51E_V3YoPxuejzb6edtWI4TyXKpLsE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX1TWJcjfskTIw
 S2mtZL+Flha41r4hjmXdGKrOxMka2qvnJVpO/cmj7hrYnSz9RllgnC7DMjjUXD3AUPn/c8fh9JD
 +0o2PPJRnGStPb7oSKn/82eDuv0ra7s18XEOdj2zhfXjla8OzQeLzJrZGfjnIbfkWepjHTv4fGT
 o9D8EV3DXWhVinIKr6c9Z4KBoNxUSKKltMxNhK88SpiuOI4+2Pnv9wgxB6Ozz7NLD9vjWD4Ew+z
 5o+TlAEf0Qd8zlVdZMxZBMbY2+djju+ZUwCeAvHhDTI1eCsjfPYbAZTCNkSLMXa2rb2WhkregPA
 0xy9QvLcq/upAl7NttMjL72gH1lDY+HoIVr/FHDQVFNce4zIKC5LAAbEeekgUfFtVgLgCpo3QMl
 5MS223Rc3PmPVbqM/tLzUx/pQvCYv/ERL3RuUUhsaZ2J1g0S9nJgVE94witNzMG1WRVOjnu1PT7
 Ats7iUZu86iFPfzRl0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070124

From: Ulf Hansson <ulfh@kernel.org>

This series fixes a couple of different, but highly related problems, when
dealing with CPU PM domains. More details are available in the commit messages
for each patch.

Note that, this series is a follow up to fix problems that have been pointed
out in a series [1] from Yuanfang Zhang (Qcom), to add support for new
components for the arm coresight subsystem.

Changes in v3:
	- Minor updates to patch1 and patch2.
	- Added tested/reviewed-by tags.

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
 drivers/pmdomain/core.c               | 112 +++++++++++++++++++++-----
 include/linux/pm_domain.h             |   9 +++
 4 files changed, 106 insertions(+), 22 deletions(-)

-- 
2.43.0

