Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367728;
	b=xhDZHeJiocb1ZxpcMrLketTyUltaQok1REfaeHBwSP6HXYKH3KMNRgQhd3ecZ1y34dGY
	 gTZPud6VPc76Lqv2k9djNvmc8YAHzyb2cedPHYe5yQOqINLSIVWl8IeQCRppEU8L05jWt
	 ciiJMPLM1wwyoZ84LS3y0CXPquCYbDSOiNBw7VtXNlEHo6audhP5hrfwtydr8i2gx7kjb
	 h1vVSSgr2wWlZqnON+0PAV7kYeyCqgWPMRiW0ReGetf9Mev5pHrQqN88YNWmDEEVFxmn6
	 4jeFFt3s4K+JLJH2/Vvt/RtJpJCAe0W7Tgwz3hKSKtax2JQTk5INPPR26VsXTVEHbcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367728;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UKubwUnXpSsojNF4c02s5LNmPIOEfy8rKaXdovd5TqI=;
	b=kgwuGOsswPeqb3Ps6MHp0pqnIjGXhBcHAtkrGBGtl39MWjaZpvYV3Q09XvGjABTCLesS
	 wKe0UZRwf7W5F4bL1lvXgghHX5WfEB/d/TMLZwaIp+mOZdkKjSFr3zvf25z5ciXcQ91aA
	 FO42jtomE5El/Tx6vXCRCue/ZsFD9YnPXvnqEAYxJM/C7NmrOL6iZ4HdRxIyY2cA50de5
	 PZUoBBX7Mi+q+WSINyph4vIPXi5Ywf1lKwxSgzNEh9HFfl7RPnokqWOMDpGG/V1fdoYEN
	 0Qd1lEXoqwIj0yvttv+ujg8zJ0tAT/3QqTJxNTW8XhrjcEav3NfsylpR0iF1u7xM05A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eGjhjeiD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsPPrihA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512A5606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512A5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eGjhjeiD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsPPrihA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB28vDe449502
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UKubwUnXpSsojNF4c02s5L
	NmPIOEfy8rKaXdovd5TqI=; b=eGjhjeiDqlhEgD0QO0hicpq/voD3ET8egDylRM
	x8bM7rzM/3cD3Ze+I5OPbps+hrouPeT1JDK6ZiqESyK+aWAFUQXb0MPx3Ir+v6Oo
	l3/ZV40XY3bVE2kpvFANsGr9nc3ntaFhbyL/Z8HGqK8Pg2th+Rdu2OfCCRZzNIMH
	CW8DGn5tiKCtYwGUW4FDNSm/60HpcnV0K5h7vEBEoacYbeXt+/U/kMlXyP5H51Gy
	rzw8NakHsY5aLOfWWOmlgGEvLfJoaW2KC/3Me9TFwvANFh9PKZuAOLXd8MYuBW9q
	UqeNXiK360iIB+VOqs5iVYV6gOJ/AaJQq2HeixTRTwnKTqEg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawg870-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:28:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3ae17c536so2998172c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 19:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794367727; x=1794972527; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UKubwUnXpSsojNF4c02s5LNmPIOEfy8rKaXdovd5TqI=;
        b=FsPPrihAI3teM5TJWavZbHCpbhhTrN39QhtdfYtZ9NUwg9J4fc3s+KEbEx+WMXwFh/
         /1ITQmg90r0c2BtgHDr0EEhpcKmtqFDQwSl5IdoBSiNWFzZ/Gj7vsBRbkoe29v06GP3d
         BBD0nm0rGava/UjWc+Eg4Qoyl4T6yI975N/hkgXpp8zpfV2Eyyn74gxiz2V2LIx5iRlu
         ylkopUa/eI40HnbZYc/qoZatknMD1vn/z2JOkWiPh2+oT1q56Bac/TwR7bBXRiXGH2hD
         zHhfSgWgIE8DiFqFB2pf9P27IjPeQPq+oojjqos4lxto4IkuuTW+l02eyqEgNHls6sPm
         xukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367727; x=1794972527;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UKubwUnXpSsojNF4c02s5LNmPIOEfy8rKaXdovd5TqI=;
        b=OHe6hLzj9Hnzh0sK5ih7Qp8A5e56NbleUCBNGVvHwXq8DHax8nkMU04BCbu/IUdWVz
         3gl9mFlGsNDtHfRSCg6ru2c2lGqePTaQ6FdY1rOdjA/MtcryLsXpdpYeSVfv01xA/9Dj
         9x+stuo9qR7P6W+GY6ejj1rMfP6vO4Kz6YfihrkWXkiu7u+KlhuqtU2sK6d81ls5Oj03
         feuPvX71oIZYcxVLgDMWAWTZJiurdmbzC3yIww726lqFVhWGKD9IXu32FCl3ktDx+sHM
         3FrU5KiUFAYDNvlmCUk1jl82npuyXlIhj86Cqf42UMAjdxu3ncwYJP+OfoWsyv+dfxrJ
         m2rQ==
X-Gm-Message-State: APuU4Z+JSGKT2/g1T6rZn6x97d9nQ2nGBkvVYovuhG7P8HXWmfBDjR0v
	LzBc5dvGOBt2XbYFcMWPbf24C4IqPFljGnl6mWjzFyZ0Snv/2d7/7nSkE7I7781ek5VCGYnEZWX
	HktjlLGgfVWXLyYVTgdktENqAHQVdwTQ6gdOAoDWL/6Qs1uZX5tP+09ZAZaBHV52E2vP9tOqFeC
	sF
X-Gm-Gg: AYBFou0kQEtlxNFh8bz8sCcYTpxzV0o5TH1cjTUyiIUPlOijruxWh+5m567l9ST0l7j
	DMijl8Ofl2xIYpXfwvPNMkvfqkI5Yzq6fYjjvNqvSdzCRfZ3VebgrnDCCL/CxatorsH6bhfXwNe
	ppGyhDZ62XBcg/ZIn2uDVlv1sNKjVh6+zlyuuDzFCmdUxB/6STOR3k6Mw8DITxEmNlB32SWtPtk
	5uqPrXyiGWPbmJuuRcGR5Bl3FzMVuBCaO8qZTvippj4q8X+WVkZwgQF7coNiTdhUiFCfl7kj4Kd
	LFdvAM6WiYShalF6NLZGnnlLMvyxamTDQccKakPbIuQLkBGN5KV2B+H/TVMbgeIePtXtGCURjcy
	syf1AVFAijAocRmrhdvE8WTNTA6+LQeyB3qAIsSOXjdIlvxkhCMNyk8G5KXvApM5/UAviGEm5hZ
	CTrHIu0haySYiaOcV4HuMhl4fk
X-Received: by 2002:a05:7022:f90e:b0:190:596:4071 with SMTP id a92af1059eb24-1b3c033484bmr1198033c88.11.1794367726710;
        Tue, 10 Nov 2026 19:28:46 -0800 (PST)
X-Received: by 2002:a05:7022:f90e:b0:190:596:4071 with SMTP id a92af1059eb24-1b3c033484bmr1197997c88.11.1794367725971;
        Tue, 10 Nov 2026 19:28:45 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm10261800c88.0.2026.11.10.19.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:28:45 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/3] soc: qcom: Add Qualcomm PMIC GIO framework and RTC
 driver using it
Date: Tue, 10 Nov 2026 19:28:15 -0800
Message-Id: <20261110-gio-framework-rtc-driver-2026-10-12-v1-0-e4164178183a@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/g82oC/yXNywqDMBCF4VeRWXcgE1spvkrpQpOJnRZNmXgpi
 O9utMsPDv9ZIbEKJ6iLFZRnSRKHDLoU4F7N0DGKzwZrbEWGCDuJGLTpeYn6QR0depWZFY8FkkG
 yeA+2csS30l9byKWvcpDf+fJ4/p2m9s1uPNKwbTuUsT0NhwAAAA==
X-Change-ID: 20261011-gio-framework-rtc-driver-2026-10-12-8f26c1e53d4b
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794367724; l=3445;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=gYURsT4EB13XYEWtnH6o8S5v7vmAE2KhatW1p7v6K/E=;
 b=9E/VnFfx6BOlCD1VHnKAKViV6LTFMfwtag5LO8t1w0Do6mSwozdC1L5qRX5fL41bRtPLndJVV
 11qyp0FKcVMBdyuVIUjQkMaM3p/TXADA8AO511tP2mFT3ayOjYE9i5d
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX0LHyOInawz3U
 Q2cCAcSIyRbQBmHrNF0kCmRqOfIvSGdNI6cjI7K6UAOQWCA2s/GNNbJVi/karW2CmIwj1M09yI6
 UsyUYr1PRK1CKfBZw2oRwDPzczfiGHM=
X-Proofpoint-ORIG-GUID: PFoW12aTi0LgEVC35bO0aeZ67AylVg1J
X-Proofpoint-GUID: PFoW12aTi0LgEVC35bO0aeZ67AylVg1J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX/IVSCB3L4d65
 SSvODwb34nyyza0CeFeDGcf3+7ilIE74HdsYwy/WYI/MvyiYgRK9AVEgCXYBiuHQ/eKGarYR1t3
 KmXTzxIc6An8C8+03YzLJAS5iUa26EoSqcf8BiQwwfMV6y0btU15e0nhx6SV9R4RjWJVIpSmbSh
 WjGXtzxiLg5kLcgtn2YUatBwEZel7uu4wvY/geZ7TtlZ30duoQC1R2PmXbaVTqdCyh7+pF3idd7
 MT1tYlvkD0vp7fh87AM45Naez5UdwkE/tK2Kd4qXVc52iIPZViex0LnfxBVVvNsIIXTYRzqJEAP
 rVaP6Qj2zrwQHtHW5OYYEfhbd9bi+TEkbcwrM2oZfPeLTJqExV591IyOWpiIqjeflxxI20u9qoI
 PFb9QK4Wft6b2prN5mpwTutE/4lJivpfbmnrkqyE1jyx8e0GT4a+4h+XgDdkIsvmcW9BbbYreaz
 Am9LlVHl+mirI5XT9Ng==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af3e0ef cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_-7pcJMw-8RhaTVf9fsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110013

Qualcomm SoCCP battery-management firmware on the Glymur platform
introduces a General I/O (GIO) interface. GIO exposes firmware
functionality through fixed-size register blocks grouped into
virtual peripherals, including core, battery, USB-C, service,
settings, debug, and OEM, etc. These blocks require block-aligned
transactions, while asynchronous firmware events are reported
as alerts identified by peripheral and alert IDs.

This series introduces a transport-agnostic PMIC GIO framework that
exposes the register space through regmap, tracks transport
availability, and routes alerts through a virtual IRQ domain.
It also provides managed interfaces for registering transports,
state notifiers, IRQ mappings, and auxiliary consumer devices.

It then adds a PMIC GLINK transport instance that converts GIO
block read/write transactions and alert notifications exchanged
over RPMSG into regmap accesses and IRQ delivery, and updated Glymur
to instantiate this GIO client while retaining the existing pmic_glink
clients.

Also, add a new RTC driver based on GIO interface to demonstrate
GIO usage, by accessing the firmware TAD real-time register block
for reading and setting the system time through the GIO regmap.

This also addresses a concern on the Glymur platform, where no
writable RTC device is available to retain the system time during
device reboot.

The battery manager, UCSI, and USB-C altmode functions currently
provided by dedicated PMIC GLINK clients can also be implemented
using the GIO interface. Changes have been made in qcom_battmgr/
ucsi_glink/pmic_glink_altmode drivers and tested on Glymur CRD
device by using the new GIO interface, including SSR scenarios.

This primarily helped validate the function and API sanity of
routing GIO alert messages through virtual interrupts, which
could not be done in the RTC driver because it does not need to
handle alert messages.

However, these client changes are not included in this series to
reduce the risk of introducing the GIO framework while migrating
all existing functionalities at the same time. They could be posted
to migrate these client drivers to their corresponding GIO auxiliary
devices and remove the legacy clients from Glymur once the GIO
implementations have been independently reviewed and accepted.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

---
Fenglin Wu (3):
      soc: qcom: Add pmic-gio GIO framework driver
      soc: qcom: pmic_glink: Add GIO pmic_glink instance
      rtc: Add Qualcomm GIO RTC driver

 drivers/rtc/Kconfig                    |  11 +
 drivers/rtc/Makefile                   |   1 +
 drivers/rtc/rtc-qcom-gio.c             | 153 +++++++
 drivers/soc/qcom/Kconfig               |  29 ++
 drivers/soc/qcom/Makefile              |   2 +
 drivers/soc/qcom/pmic_gio.c            | 707 +++++++++++++++++++++++++++++++++
 drivers/soc/qcom/pmic_glink.c          |  26 +-
 drivers/soc/qcom/pmic_glink_gio.c      | 571 ++++++++++++++++++++++++++
 include/linux/soc/qcom/pmic_gio.h      | 154 +++++++
 include/linux/soc/qcom/pmic_gio_regs.h | 239 +++++++++++
 include/linux/soc/qcom/pmic_glink.h    |   1 +
 11 files changed, 1892 insertions(+), 2 deletions(-)
---
base-commit: 14825c9204bad7f4e0bd3a528cbf4a7e24e757d0
change-id: 20261011-gio-framework-rtc-driver-2026-10-12-8f26c1e53d4b

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

