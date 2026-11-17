Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900807;
	b=IOsSnTr7p0XFGuKdOFOtbzeEfv8fqyP3jC/N0yepPPHozutqzo87hEiIC++E+1YIf6Py
	 MdcEa3g4rzqqXqjLIhrYgYlNyMjIj6mNCVt0M/n/s/S46ebqZt2eMpYh0XU/aL4zsZMiy
	 SprjuCmYv5fK0V7gqK26BVyExfk3gvG9RCO2F2/Rq0pK9/RXVs6dfcTpKlOdZ8zVTWEaE
	 TYxTvPc72nyrI0fomEKeJfEne1UkaSm0wLb2NnukCK7xBi8h2KrmwI+iExJobMo3cBNO5
	 0vk2LCmoe+qdRTzKPMCG1U8zMS6Sv9bErmVmSrYwdEAORrzJE4ttwu4pdCPHJnUyIpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=R3h3x0biJ+uQQi6ePgSl9Y6oVhuqLjM10bWzaJrPvIU=;
	b=b1iXrxtOOss8NMs2OGvEP5EigTVpMnT6fJsjhyvGAATUV3dqrPbmw/TZf7EpNAefGHfE
	 lwqyFrNqEMOEfx8pZZs0oAxO206Ch0Fty8O4JMsB1FsNU0IrAmMcHKcWgQRMLXW4hMNBK
	 sNfpeINvM7wOipbOQuTZYZPnfzuBq1dx7IusBeA3UTvon9GaIJ4crH4UZTfZblsSle1fi
	 vIsJI7DTlx/GbwaOkLehBdXbONEdENU6bMQQxaQCDNrZu57cHqQhR/O5qC1cSy3jKM9Rt
	 jQMXstf4fMTLmsEBoX49hn3GUsqdNXXaoBR/LKm040cW5G0Jy5age4gy7+jpuSKqPrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIyXP4nm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZXvvhKh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A1E606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A1E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIyXP4nm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZXvvhKh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aFeG200029
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R3h3x0biJ+uQQi6ePgSl9Y
	6oVhuqLjM10bWzaJrPvIU=; b=YIyXP4nmsuKOGgHEzAa8+RAIHm9dxszeLxeHvx
	38LeeJHqnRyeMymoUi9FgvL1NZVul0n57c7DU3USxEKv59GKx/oZyiBuV8XxOFo6
	AlkFf5neFV55iH7mOB5Y7Vqb8J74xchW2SrI9U3HlWc/1rkMxqiAcpPGG5dD8nl0
	8haInwrb/qIKpjm01WCcmefdePo+RVgoyACMzV8XSSSza2ypatnw/NZdDon1x07m
	+XRXmxzQNPfkVWyzgh01v5oJzJZA/v60Wcy9QLXARry7eMbxkWAbCM05D2tiOyg4
	Jjrz5mexHGtfpxNPqNRweOq6wZtdiE3DuhJzSHFiSw5r9xpw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbk0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:26 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b26d8d2498so5148920b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 23:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900805; x=1795505605; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R3h3x0biJ+uQQi6ePgSl9Y6oVhuqLjM10bWzaJrPvIU=;
        b=WZXvvhKhpMPFjHZ3DS2YG1DhEOOrU1eFuaFbByJ4Srvz6me8CgH9ohjV0Gq5H7fbm2
         J4nWoCV8DagZgbSCp2vFUfHlib3nTlQQAFy5XsH+Unhq/Pd0o9AqzH94HU69n3J+XpxF
         kvuYpCYbotPE5MVi1cV8m09JVq198zf1bk+C0F9qs0BlWk522L3ruBsu3onLHX3bCJVb
         RdJ4qC/bc4+12ICNkpaQEplkfs4BE5GMpWRWAWWs9deuO9VUVfCzUYIZfSpo/lk+k2gG
         4Z8jvfuwQM56LpCNhixFkYi9IoWeWHJCmHeWhNuvS8KZrwFlwitJahPmTuklKZm4Ow3q
         tnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900805; x=1795505605;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R3h3x0biJ+uQQi6ePgSl9Y6oVhuqLjM10bWzaJrPvIU=;
        b=I9CiYcoDN2/W/zprOzx6l7hd2DLRkndvrdXETYSCTER/W92uFft7wVXw1dMG+6YZ5P
         QBjVQ5zpwAfdS2qEUQSgcs7hVc5Cn4L1nTZ10Cq7cUMfNICa/ytuBybQlFKuRhRy0jHP
         8u+i3ItW4Cyfoxfm1d0qKs623JE+us8UQ/afOY5BM7Pv7I54vEXgjhCGmMSnkDm62DST
         EnjTuVdfCEnEjMJUqIamSYkm8CoRaZaTKxQQq8GQLCEwwYU5CliW5wC+S+Vv3Mpa0aCl
         WyPwPS3Fefon2JQN4MAHVcBMoGqzo8LODRSMWNgWzab0efnxYQc5Bvd4e8GiO/ZQgXsG
         dzoA==
X-Gm-Message-State: APuU4Z/YqDYPzJn7B2o1qfEGzlW48SmCNoP4wDcCvFiDFtCCANTqWeyK
	sBbLol0FSd15p55n4Sicu95Hy5LYjUv2dvKHMZ8f0SDdynvx0lv4pU752PsfnNB3f5na1S9algS
	4zellr8EOYVa34XwYMTFHH2MNs6MDT2bQbZ1Rpw7NenjdTErVYAXok1DT2S8KI/vJVKn0
X-Gm-Gg: AYBFou2PI0ncHVnADuSR4JXoGU3uZ5cbnqTERt+rZSiRGtsJcN6bKfpl1aXjHb4sowA
	wxf0PMfFF6UZ03s4W/zAzClP7nf3FhEeCkTdVk+gCk5Wp1X4vwkylYgq4r8tqBnNJ3OkxSclrCF
	ODPQ+kwV1KAmY+br0KBHg2go42E+OizERgEquAr6Pi/8DhgfMW88guC9qE9AP9XBcKDOJx6wuJG
	O2CLWEmeCgI5n0AXr+N8MraDbR+4aIKZ9rHkE53sIdm8bBvgggeAHMn6IvFc0P7HWjZpE3M6m+v
	+iDj44pACtb16TGmovhJQ0PiITXjjiRWdOAUHUUVuYEFv8pdGGDt6MaKEN2QTi1CJOoXhwGu48D
	pJuaCrfVmZdtOYwj0ubip7X9f+KW3wG+YRLdg999WaOC80HY2oarbyr7tFvnH3o9qvX1btb7XHQ
	CC8Uc2e9yTR3IQjTCLxoxOdQdd3w==
X-Received: by 2002:a05:6808:30a0:b0:574:2ab7:a1c3 with SMTP id 5614622812f47-5742ac6fc64mr5415841b6e.63.1794900805230;
        Mon, 16 Nov 2026 23:33:25 -0800 (PST)
X-Received: by 2002:a05:6808:30a0:b0:574:2ab7:a1c3 with SMTP id 5614622812f47-5742ac6fc64mr5415826b6e.63.1794900804743;
        Mon, 16 Nov 2026 23:33:24 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe228982bsm8593875fac.10.2026.11.16.23.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:24 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v2 0/3] soc: qcom: Add Qualcomm PMIC GIO framework and RTC
 driver using it
Date: Mon, 16 Nov 2026 23:33:16 -0800
Message-Id: <20261116-gio-framework-rtc-driver-2026-10-12-v2-0-b60e6fe33831@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADwD/GoC/42OQQ6CMBBFr0K6dkinIBJX3sOwgDJAVahOATWEu
 9vCBdxM8pKX92cRjtiQE+doEUyzccYOHtQhErorh5bA1J6FkipDiQitsdBw2dPb8h141FCzmYk
 hGIASUEHeqEwjHZM6rYQvPZka89lWrsXObqpupMeQDkZn3Gj5u70xY/D2RfTBfxZnBAmUYpbiK
 cc8KS/Wufg1lQ9t+z72RxTruv4AbDdBpe8AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794900802; l=4730;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Ihgyaz+qc/L2iufPyCHw60RvLV8A5SRMCmm8rB7Bw0Y=;
 b=c6/jH0Om735wddWs5NYKYgARvUS8qFxKFXLM5kpulUySa84+mkawg20LuPrEA08C23RA7I5IU
 5EI5dQoiD6UAkdnTvmsRleen9+3KeNwMHywfQxsQ267ZD7r6601T0mb
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX27EXEWaLtkab
 ATC+X+iYjH4H7eF9tobUv5HD/pYSiLiLYBCZUb7m6uvWIl+RAu2/zQp2PM48DXZlIkDCyfMd1R4
 /ortagHq4Ak14C5IYQSRr57qhOyyoPYf+hEEc1zU5QEg/uvXxQf1iQUVnKeK8IbkVP6qtEOIT7a
 fgAXTNIJ4OIjFMvdJJjvNCvo4Vr9bTIJFPZAeNGOdt3dyKLtLwVcxfkSF8pWxGnRHN+8+mWRBVT
 C2lvD1J9GSORJxI2ZbH5lkfnqa3vT6dvAJ53ZzvJvqmep8jlPpSZuLHg17bS7VZ3gj/MSgxJe3f
 bjGGGH97MecRVcS70Wz1p49diXZKTvuzph9YSTe0mstk9iBm+h6i/E/oP4oesQhZ6FO2t/Sk7Uw
 ZS8i2yl2m2HOcEaoZSvXT7bmwxv243+wgv1Cw5e0O+E3x9uVAqptXzgJNuqMD0QWMF/I6MX4pGN
 3ZlWNjAQUGeWNiOZUWA==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc0346 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=MAm0shQKp9Nsj77vp2AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: MhjvjTbdPXswKv2g40WT7PJJ6sBLXJYE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX0PKc3VdK+ZPF
 owvmlOjLeoluO/0C6XUMbrOtEvBBGIwYpJC9VErE2ar06DXCNDdNmf0ofmEM2zbghR0EOalS4bY
 z0bsJmylraAqgc8FVdFNJ2F5tDjGI/4=
X-Proofpoint-GUID: MhjvjTbdPXswKv2g40WT7PJJ6sBLXJYE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029

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
Changes in v2:

- Fixes issues reported by Sashiko
  1. Updated to use devm_auxiliary_device_create() for consumer creation
    to ensure the auxiliary device remains valid until its final device
    reference is released. Also, updated to use the API when creating the
    RTC auxiliary device.
  2. Marked the USB-C UCSI message-output register blocks as writable.
  3. Made transaction preparation atomic with service and removal state checks,
    preventing teardown from missing a newly armed transaction and causing a
    timeout.
  4. Clear pending transaction opcode and buffer state before signaling completion,
    preventing PDR teardown or duplicate firmware responses from corrupting a
    completed transaction’s result.
  5. Moved the GLINK client allocation ahead of GIO/regmap registration so
    regmap and debugfs users are drained before the client is released during
    unbind.

- Fixed an issue reported by Jeff Roach:
  1. PMIC Glink GIO alert enabling was removed, as it would switch all
    notifications to the GIO channel, and the clients are using PMIC Glink
    OPCODE would not be functional.

- Link to v1: https://patch.msgid.link/20261110-gio-framework-rtc-driver-2026-10-12-v1-0-e4164178183a@oss.qualcomm.com

---
Fenglin Wu (3):
      soc: qcom: Add pmic-gio GIO framework driver
      soc: qcom: pmic_glink: Add GIO pmic_glink instance
      rtc: Add Qualcomm GIO RTC driver

 drivers/rtc/Kconfig                    |  11 +
 drivers/rtc/Makefile                   |   1 +
 drivers/rtc/rtc-qcom-gio.c             | 153 ++++++++
 drivers/soc/qcom/Kconfig               |  29 ++
 drivers/soc/qcom/Makefile              |   2 +
 drivers/soc/qcom/pmic_gio.c            | 672 +++++++++++++++++++++++++++++++++
 drivers/soc/qcom/pmic_glink.c          |  25 +-
 drivers/soc/qcom/pmic_glink_gio.c      | 558 +++++++++++++++++++++++++++
 include/linux/soc/qcom/pmic_gio.h      | 153 ++++++++
 include/linux/soc/qcom/pmic_gio_regs.h | 239 ++++++++++++
 include/linux/soc/qcom/pmic_glink.h    |   1 +
 11 files changed, 1842 insertions(+), 2 deletions(-)
---
base-commit: ef922b721a5e99348fc1f5801fdeb427ee14ee9f
change-id: 20261011-gio-framework-rtc-driver-2026-10-12-8f26c1e53d4b

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

