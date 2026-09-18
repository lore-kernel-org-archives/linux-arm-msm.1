Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8B03AB277
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723798; cv=none; b=TY8z1DPif6CdzqWALy/IqJSDuGB43Op6hDN3Kert+dosjzEWk+EAdIMGaw/W399roFzAhqq9zQQJeIs3QPFoErZ/+I84Ec6EyMn+wEDQ4rh7nFk6POUtZovCLgOmhdixC19TFGk1scNb1TIfr316fmdC4em+R/6tDDdhcK3tjH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723798; c=relaxed/simple;
	bh=X4o6heKdgqyedmdhEI5qR6NAH2RMCo1d01E+qxeNtvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nspItqp0Gxs17CTBr8zJiQcQzl1aazUH5Lgh2+bbbb6cpfNZ86LItuNCEVgHhHOOQe4IDfn1ts9K+gRy+/Sm4b2p3e/jNscYGhYre6hTh69xU2jbQ6cg5aLDgod4xVK7m3AB1iEZTHaSsviUu/BX5fFIBlsehCRdFz2LiDhKJnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fffPpa5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIzbFPyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fffPpa5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIzbFPyG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xpL8910697
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2P
	F/wFYxfI=; b=fffPpa5/8Y+LmheYil3ZBLqczHXazeQzdAFtQsjrGDuA6HpUQg+
	Mz2FbRvF3hISFFd2465/0CRYGiQk/j/iFLbhH4qXOWbtVIpNfBwU5ufS2XPWkBID
	ObYTcOooT+DHaW80RpfwaoxbLZZqoxb3E0+4VqZfJomBBCjrrzKs52yHE/HVoffl
	80FHd4gX1Fyt3SyKqXXVeZy0fRVJW1z5kHhAw5PD6yXnrfKCGdDJAgMQpe7xGvu7
	mhunvHqv3jGo0sik2vkDKXPtmSZxFoeerQ7UHCTXIs5ta9QPNnFDiJd4xbOAfuhD
	Qtky/WnN9FPpPjSDD+uDbcf4GBEwJds04JQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpsyqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:29:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390a2c895bso168540385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723794; x=1790328594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2PF/wFYxfI=;
        b=PIzbFPyG6nQiAoQRlIsU2vS2HQnBhqkKt9WyW7OnHDdiEuq1riJPQS0zwi8SseQnhN
         ChUc4gBKb87NsB/QBCvGh5qsZQ5J1X9jWgdApAZMx1TAsA/4dw724Y+8D0iV3mFRNNIF
         t0dzGiVh32eyRSC5SUuF6TzmJHsOwKOfKy/fkh+Aj4m86kNAoLRhU7Qhmrcl+4Z1/njb
         JnCRGc0YmUKjc/afCKtEexH4D4sRpE9xg1QOjXIcPHFikEKxqUWY2dOBXDTP9vw7t6zr
         reKSoALWNrgFWvzIl7qNk4tD0q3ZQIKbdt7PZdzebVEuSe301jl2Hn/5yKErkasXxGVy
         RoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723794; x=1790328594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2PF/wFYxfI=;
        b=Q8iHUyGZRPUXOHnSESObi55Ash/n+QKvYVw1u5pA1nv4s4H0vOJKnnaB73+4XXzdyS
         mV1LvUHw9p81aqFW0K0mXUc+WR7wqLksSaIVOyr2kjRaHuegoG+iivwxLLyimZ91IekY
         CiDKuVUNsxXJ+nS7zA35z3P8Sk5VSaO9uoslZoFwA2D/w03KrOEuHt+Uf7786Orucor/
         M+C8JqnPo+HbP1rKH9PMLXf6LoNyO4L2Hw2cA/84VDVHx+0n10F+YI4vuth9DxEzwd3s
         91I5JTCIExFOsX24R3X+LKHI71Wxm3C2IqBNa3XtYEwPdzlQ+vy4WxBvxOkcwCuFH5BY
         haYA==
X-Forwarded-Encrypted: i=1; AKwUvBxuc2UK1za2kli8SmxYci3yfA0OMNSr4j5PhqchHdUoRF7Z7+D6S7FK0usTCpkw/PipZUd6ONWIh9OlE6eS@vger.kernel.org
X-Gm-Message-State: AFuF++kd1tafOy/UGJ3Ll7ae9f8PQvkCdRdX3jL+T9zP1Unvy2LcztZ+
	5p1Qs7OaNuYTPOJei/fczrVBbsGzm6q9Ntdw6dnZ0FFO4mcnfjo84sJDkHEeDYHd+0Qu6zzQ8zH
	wAHHYURb0b0T0IxlsmAaDwOrSPDnR/ZwBWkqrn9ZcqHviSs4o+bM5aAJIiwn6lXwfV6iM
X-Gm-Gg: AYBFou3Z3+sa7WUHX2HQfjE+kd9R6bPF9aewEKmiUPSql33hesa2QAKwZPYuPZADxLD
	CB7y1r7KeHUVSn3cnhYAJZe4hZMkQMB0knr4yV7LnSyR9+RTdOSj0dz9K5eZI/OEBTLJ6VYGEHm
	6eUmsNlv5i0I+baEcXJTf3/KyIQbvJp8/ewDA6ui2BHjiZ46L/NUn0KQYVJfZWgutiI1bZaid1W
	5sxHpP2hiOXDUlIiJpYkIOdrl86mSKH/4b7J7Y348B0vlI7Wz7Bum/lU5TSYqlpg/y7c4rT+yML
	TOWG3gRtHxT4Zvuo3/oSMomQgcWh/U/BfRrmar/ZqP+pSqUzsKkFqCZIF70W1B8ue+h/VAhb6Xi
	9Y9fjfrU4uwyrA9WWPJF4qaB2ckx+cxBZUJV1jnvVixgw3kKX0x+TMTLac/4qir1QtRV49GVf8H
	Z8M+0T001bqKM=
X-Received: by 2002:a05:620a:700a:b0:934:946d:599d with SMTP id af79cd13be357-93bdc704c80mr245525985a.33.1789723793810;
        Fri, 18 Sep 2026 02:29:53 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:934:946d:599d with SMTP id af79cd13be357-93bdc704c80mr245524085a.33.1789723793406;
        Fri, 18 Sep 2026 02:29:53 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6bc0sm36796166b.60.2026.09.18.02.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:29:52 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] firmware: arm_scmi: fix module auto-loading
Date: Fri, 18 Sep 2026 11:29:49 +0200
Message-ID: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX+ZW5Q9P+Sug2
 yLTZQbutN5oZyg2goT4h9N+QuTqTb+iRhNRg8awNBn7qGt3vFmaPYLu970nyHMe2eu5Q20MUatf
 sJkPEYCOQZl518vYm3vk39/WU0NUks5jLu7aOVXEwCwzDGvT55E3T8/HlqPtGu1VdRVFM7VN6HM
 UxUzx7OKVzIQce0bS/kZkJYCR8L5BXc7ITNNgUzr2xws9peAf8s1JWUJKJu/YcJTUazHvFfrkgE
 pKd+IQRZqcbXrJHB9kJa4jZDqN+L5nsMo6xs05LCUjCTIKlQib/yD2sCFf+9Jkv64IUGlzsXcgf
 zitxXEcez2HvIA1PPG0FQIsa42a0myFMp4OhZqpLQNQTvcd26HF+VqYS5UXOgJnjLQVD7I1AcTA
 AQjEKHntxEFXJxE4lSc9nKYf6xFtJaIkRBpqjAFchVW0utd3BtQpy9ixQ4FV7l/0NZPNI0O7beS
 JRyTc5iO5SsIH7HaynA==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad0492 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X-UiWFXO2YgWyHAQv0wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfXyI9UX8JVIJWI
 c6auj/NYy9EYdd4ICf1+7Rw7fLkL8HlcysdNAnzll6j+eJb2CnXkfZ+zAr83bhnkE7qiSj3ZdWn
 GdJ6ontylHTWCNkFuy2u2rnaA2XcZF8=
X-Proofpoint-ORIG-GUID: eah3kMEORF_SuYc9ceCEPbTlb3EW4XX-
X-Proofpoint-GUID: eah3kMEORF_SuYc9ceCEPbTlb3EW4XX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180131

Hi All,

Here is v7 of the patch series fixing arm_scmi module autoloading this
combines:

1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. A new patch 2/2 to always create devices for standard protocols,
replacing Cristian's patch to pre-register the standard protocol device-ids
from v4.

1. is not enough by itself because driver module auto-loading requires
the devices to already be created for udev to get the necessary uevents
based on which udev auto-loads modules.

But SCMI devices are only created after their { protocol, name } device-id
has been registered which is done from scmi_driver_register(), creating
a circular dependency.

2. breaks the circular dependency by always creating devices for standard
protocols without relying on the requested-devices list. This creates
devices before the module with the driver is loaded, after which module
auto loading works the same as it does on any other bus.

I've tested this on a T14s Snapdragon laptop with Fedora's kernel config
where scmi_cpufreq is a module. With this series scmi_cpufreq correctly
autoloads even if it is not included in the initramfs.

Changes in v7:
- Rebase on top of v7.3-rc3
- Drop:
  "firmware: arm_scmi: Fix scmi_protocol_table_register() error handling"
  "firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race"
  these issues are already fixed through other patches in v7.3-rc3

Changes in v6:
- New: "firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race"
- Add Fixes tags to the bug-fix patches
- Replace the if (!phead) return NULL; early exit with return scmi_dev;
  Since a standard protocol device may have been created at this point
  (from local Shashiko run)

Changes in v5:
- New patch: "firmware: arm_scmi: Fix scmi_protocol_table_register()
  error handling"
- Replace "Pre-register protocol, name tupples for standard protocol" with
  "Always create devices for standard protocols" pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
- Drop "Pre-register protocol, name tupples for IMX protocols" patch.
  Shashiko rightfully turns out this will cause problems if other vendors
  also use the same vendor protocol-id space values, e.g. 0x80, 0x81 are
  likely to also be used by other vendors.

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

Hans de Goede (1):
  firmware: arm_scmi: Always create devices for standard protocols

 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 71 +++++++++++++++++++++++++------
 include/linux/device-id/scmi.h    | 17 ++++++++
 include/linux/scmi_protocol.h     |  6 +--
 scripts/mod/devicetable-offsets.c |  5 +++
 scripts/mod/file2alias.c          | 12 ++++++
 6 files changed, 93 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0

