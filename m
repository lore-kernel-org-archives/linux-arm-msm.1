Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2073BFE3E
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740062; cv=none; b=N9ma1qxTfYxBarCWLYR06DgBiDu12cDKAbJBGl7zQROC4hM3XruIxhVIglR8rwTvp6TUC9g+S+CEji+hpeoFP652PbR3EoR8k6pU4201BtDp94RdLSJI6TgZi3a5KjNvbxOFOPst+3luY7ph/Bujpyhx8uhDQt+/fteOnI/qfcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740062; c=relaxed/simple;
	bh=KLIlR+koIz0OfzI6bzUVYKFw5N6U8gqdkPJ1VJ8XM2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dgh2+1rrfkv0rLgThLxw+dBorx4eTTQOZkKz8Msz8MdWVSiUegLsQA0W+3TduBfkTX5n8761Lo7jZZIoNQ7vOWwE0c4AeuG4H36lY7VQr92IQ9XKRj8fNKmHJxT6vBQt6J+1K7d6jGUtEtiBpjyU+MtJEbDb1iml8ElAzNsf1YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+Q+4SpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbDz6f0f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+Q+4SpV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbDz6f0f"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGf8e017354
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4Hs
	sXxqokMA=; b=W+Q+4SpVqz9ejYQlSvt5l7ukSyfc5ROPRWIcw/r6+1/zD+VHomr
	yPU1pRVgMjR4iwz3+fCSC6EV3osKC2qgMO7rOIObmiUTMQuGtnLutiLi95NO5A68
	eN/7W8z7h15krKQEtgA0LpHI8/mnqPnduJAtIPUbOMHYvd3vNPsXzxQlgS9I3WGd
	Vkr7BXW5p23g+xrt+tarXk/6hEaZjGuk0GkbUiCR10S7NkLek6vwDNqR26jjEvdi
	BXUIC2KCg2bb29mgBHpsnEdIARdSh0/LMKi7D4JKDCk2I1sWNFkX60R3j1aLET9Y
	tMzUAmvjhKY4Kq+aNfIfdoCDiXqTjorQntA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn3duk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:27:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936d067836eso62315785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740057; x=1788344857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4HssXxqokMA=;
        b=PbDz6f0fD6T7aDLWbO0LZ4H+ixLBr4ZpDnO9X3e/PC4UbNh+UzNEqvuRzknBg1vgUa
         wlSg7tS86/bHRGPQ3wmvHycv+RZ//4Yh0QoSF+AStqV8P0D8Oh6nw84M8SDIfgO6zk16
         zxiJuahDTufayshoODRLKikPZxAKZgCIZL4sXX/tGjOmsv1tW5lT5UfXcgtA8Ov7WY5e
         vsF/N2AluMMWGt6EUMPzFbCSeapF4GRjQPylMaRCB3uja4hq7V4jm6yKEkZ/9cUy3YGz
         7SC87HVAKj3PYSt5T8ABKycscnpY3eKzX8DJM1sbprBOnEWjeuMjLVR0TMgqWEeJLkSh
         9kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740057; x=1788344857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4HssXxqokMA=;
        b=a2EfP6IgtEYATd+0eTK4ixGigsDtZPuaQdf9YQHFN1qM0rOavZDAf7TlkcmNmJnyhT
         gEHW+fXSRAYYWuVpEOTq8mRFAVTj3rww5HMF6HlwITzmx+HXTSLSgqjoTn64NENdzuHz
         J5xFkp7OHgYrFX/VYBZ3wu/aOsRBUUqZrSpYHvjtUy3Cn92YjMJq+d1ZlQG3Rp8hlNYf
         8SUeyBba0rRqpMhgYlp9eDbaooxJTrLxiq6FLPyDXyOFn/D6I73uh4MsanXTer+ssQKK
         LREjoh27JSliVVMtB3cd52dKgXBmOdTdvgl5NXx2O8yC7OcOGbB75e7lxE9+y6K+A5+U
         6x1g==
X-Forwarded-Encrypted: i=1; AHgh+RoZT2Aga1k18bh/NWDfeVm57FkxK0DGYQbso0URm2hSllmAbIXzwhiNCVXipvubniRjsjiIqnP0VlSTu2Z2@vger.kernel.org
X-Gm-Message-State: AFuF++m9BBgwLqgzLmp64X9GvfUR7qsQTL0xuI3mZHJ+w8s6PaSpeUj8
	E2TUd5sI4ou+CIxZ1B1xdrm3p04tO8QLD9uPvbxLeWGPlfwgFt/aSg/u2gj01hUWQ3a6SmwEiDJ
	GvM4bIV3/WaVOm4lxjflokaL6fPuZQS+zwgNgZlY14q0hdHDnpfO2zLKPF0E34kbdyEFgHwxD8I
	V3
X-Gm-Gg: AR+sD10Wkd4CkA6ZCHxMELjE6LqiMttEC05glwKUomzWhKBqPn5PrhdR39EJDXm+aUi
	/rQNAkvXb+GkAQKGI5hgyDRksWBW5t7zga0BqAyPD0ArNXhlYSUBwUQUYmkzr5lIYuXssyXH5Dr
	xkEsAGh+/RJY2oNc5CVFm1TqQ17DPx9t+ExvxjZCLUN7fSRUqqiLIw4sI0/m6VQb+8Nki91+BDy
	EHomA024CfQg4JpLAbnDsRkpyUA9K9oH5c1PFU9SX/XzAsQQw4C+Q4Q3EdtRGCIxh9KVjNAB9UK
	sYCHRKnOOfH1iZKsvY8ANLcMx65pvmmEjIYRI92eY/k9/hH5RrFNrqoTAOsTe2+tEBltdx2P/Vz
	tk2epLRgM876QgDDsNaW2xDmSqxqR8tontGF2BbkjN23cfq7q9Y3ELzjkvThKy8fzdOqr1Vc4sb
	7PWlVaMfI4Jj059FY=
X-Received: by 2002:a05:622a:4a83:b0:52d:cf84:e98 with SMTP id d75a77b69052e-52e423a4a9amr55060941cf.33.1787740056712;
        Wed, 26 Aug 2026 03:27:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4a83:b0:52d:cf84:e98 with SMTP id d75a77b69052e-52e423a4a9amr55060421cf.33.1787740056283;
        Wed, 26 Aug 2026 03:27:36 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:35 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] firmware: arm_scmi: fix module auto-loading
Date: Wed, 26 Aug 2026 12:27:31 +0200
Message-ID: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qwC_Q1c05kRiq2cAWZUaJk2XefjKSCB9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfXwV8zPcvfckdu
 Wa3l+6Keb8UtbOn95WAMbo+jJNm8ToY6mMV9Hz17fZyRJfJMhDlRzcABa8GxuvfhX6/RaYLr+T4
 RYYxkyOcDRCnjDcT76EEq7J2Zftw5XM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfXwgRx0JkTpL1K
 SIz7/YSzgXXhCi9oELNXBDn9C2j6W9g4pmWRdrXf1BRneetJZ1m66ukZbxc37vsYZW8ycU5C2pE
 b9wCaX/4W7cO3dOg+vf0tPRvwEt0W2QSYgeDSwUkpeZafTwbO9QbLaRi0cv9/9G8B3UmVnuSamw
 uQ57md2uuauYacVLXtor94ZCwfcmkt8vg5xNJR6K1P+3oS45vdLKs+k/9ReJgvyJSCXclqGs3Z9
 tc6hTmV8tIu5YNhereIFBuWkF06CzHa6XbvcYk0rXeL7ko4boSj3XtD4k6V7ZtISutGbg7Eog9w
 PvQ1TEVU5/1HIvyJUcdORgkYlaWfDV1FPOKQ1vre3A6ZII8GzTsGpAjO+JolPyno8tJCYo1thV2
 Tce4tGyN4cyvuL2VdrG/+dDZW5LnTPxpk34t6gMLTBjYylI2w8Co3u8VgfwRy2MB9jKmIs/400u
 kMlDlEQDEBv9iXKPcaw==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ebf99 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=7CQSdrXTAAAA:8 a=QYgjaYqrS4LJc6J_j6wA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: qwC_Q1c05kRiq2cAWZUaJk2XefjKSCB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

Hi All,

Here is a patch series fixing arm_scmi module autoloading this combines:

1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. RFC 2/2 from Cristian which pre-populates the scmi { protocol, name }
tupple list with standard protocol info to break the circular dep:
https://patch.msgid.link/20250203100154.140877-2-cristian.marussi@arm.com

1. is not enough by itself because driver module auto-loading requires
the devices to already be created for udev to get the necessary uevents
based on which udev auto-loads modules.

But SCMI devices are only created after their { protocol, name } tupples
have been registered which is done from scmi_driver_register(), creating
a circular dependency.

2. breaks the circular dependency by pre-populating the { protocol, name }
list with the standard protocols. This allows the devices to be created
before the module with the driver is loaded, after which module auto
loading works the same as it does on any other bus.

I've tested this on a T14s Snapdragon laptop with Fedora's kernel config
where scmi_cpufreq is a module. With this series scmi_cpufreq correctly
autoloads even if it is not included in the initramfs.

I've added a 3th patch extending the pre-populating to also include all
the { protocol, name } tupples for the in tree SCMI drivers for IMX
vendor protocols, so that module auto-loading will work for all in tree
drivers.

Out of tree drivers can still register new tupples as before but their
modules will need to be manually loaded (also as before).

Changes in v4:
- Drop unused driver_data member from struct scmi_device_id (Uwe)
- Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
- Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)

Changes in v3:
- v3 is the first series combining Bjorn and Christian's work see above.

Regards,

Hans


Bjorn Andersson (1):
  module: add SCMI device table alias support

Cristian Marussi (1):
  firmware: arm_scmi: Pre-register protocol, name tupples for standard
    protocols

Hans de Goede (1):
  firmware: arm_scmi: Pre-register protocol, name tupples for IMX
    protocols

 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 75 +++++++++++++++++++++++--------
 include/linux/device-id/scmi.h    | 17 +++++++
 include/linux/scmi_protocol.h     |  6 +--
 scripts/mod/devicetable-offsets.c |  5 +++
 scripts/mod/file2alias.c          | 12 +++++
 6 files changed, 93 insertions(+), 23 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0

