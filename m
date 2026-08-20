Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2095352037
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236282; cv=none; b=oW3nQ8Hn4dl4dHUK1f1tY+R+9D48vv9La/m5O63PJ8SviwRZTSEaAF1HqIFQ9xmH/SyE7/SvK5z9w2OX1bOuxFaeNSjLAp/NgCo1PqKXFSmQMUiNzMlv9ade0eE8mm++OIuD6KouTLWjxn85naSGWRL829gQQcIbk7+2JLkf16Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236282; c=relaxed/simple;
	bh=ciwHRYjQuEd3C8uscy3buW66CO8Rv1fx4UFqivYmwyI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UzHvyeWkD9gWsYoQ3I9yL3n33ARhs3goLhZIWTomSWYzLELmNyI5/oYWiGUPiF3+DU2dp+4DshV0SZX2hva0WETIalos/saFlSISkczBm3tArgFfdbkl43CqLlRd52pXMK9Fdui4DF/6zYzgTJs/MGo8zPUmNW77NjXpbu2yTHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKos8eij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZOx5xVV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKos8eij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZOx5xVV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7hRi3234845
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MW9JEteA9muiYxcGdyLndH
	i/JmVW1xLrRy/23aBzD8U=; b=KKos8eijqIXxBxTIYFTSnmdxG1kjcUaMvdAMmU
	MM0HKQlHmhgfDPKPYHSkscuGiCuQuwbpv9Qmvw7omEZoH4tXKEQDiKi0VMMe6uUm
	TWtAfUIRkwL+FMqNS4g0syvf8JfUIMP+tXOxBmH+8ySS3bIFCfSJCnDOZbYjwNWE
	pBic1/QCDw+1q/KcdtPEIaRDas/9wIx5ZDTykHBi704uNUn7CNetnH/5Zs7W0cVA
	w/ZIeR6DEnT9VwX+7wxHx2hh+wbmMXOVUHaUZdZ6PFBXbTn+0WeEVwlGPUf5Fo8o
	sKyMc+xKxofXgijPFQSLpoLhJCFXdozXojNdb19IUyfDBJnA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv9bvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930b571432fso114599585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787236277; x=1787841077; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MW9JEteA9muiYxcGdyLndHi/JmVW1xLrRy/23aBzD8U=;
        b=LZOx5xVVGAjm1z+p5PqqNMzqTJtn8Q4w2UnB92zZVlaDDA5NV6vaBdURMCSsuMtcVR
         j290+piZ/w7V2eODNNTGpwxeRG93wD7MYihekGCwfFNtEC1Vuvz++UQVZmqhmeMVFnaf
         +GsxuwqhRwccsZ4dh0I7T/XVY10EsLwdRgf54zvSLfv0Id/0uvLX6IQuuto/X+RcIOWp
         V9lrEEmVFEufk/O6Q19LVxHcB1lo7sOLJoqolgVmDiwzLp3aOK2S4q/eUZkrWAFVgUNO
         R4A5ZzcVVAjZu369mNVrWu3F9ip/6HwJ66IGnlnvHw7lrttbpvoVy5TABdCZ5GSFQ5+n
         ZEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236277; x=1787841077;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MW9JEteA9muiYxcGdyLndHi/JmVW1xLrRy/23aBzD8U=;
        b=XdzotsxA8aB6bNosajkUEyYLndsN3wiNB4PhHnyRYPFX5aP4UbhYk22tze3SGXZH8t
         3RpvSJassH2LKLhTSBntDGs0IrNfmSWMo7F+kYZlEuNpDDEAhfEyp5Zyp5zkg7FJQVUt
         7HgglfM1jB8IN5HAb4xUJZx+OcKVrJDu15Wlx/rmkLicgw5uO36PpTSdibQQ+5fxdMtA
         7QMGpweoUzh1kT+wUQAbSq2vGWw8rogmwcqtIb0EEQc/RdoM3JALBXV+VGU5ozjMAO8S
         WDkMeJJwZuCaheeoXCo5BicObLmOGri9Z/CbJmFehZXVgvt7l+l4hTTwl0Gjr2rTZkS5
         JyNw==
X-Gm-Message-State: AOJu0Yzc/JX+2v7BNfcNdvTffVeEC9MNKsGdtOGjOzBcqTMIERFblMgg
	0dEhDYqC42/1peLlecsA0UXmCWZkXKiFsnuNdRwJOnPf0YMqaYurQSR402LmfPmH/gLSZ0SpVz4
	LIjwwNUlzBbiHhCD/Tr7c/gi9H3gKHFRdoNsh4ORI029Pz7fjX8H60GNYtCUkZ+uDJTmk
X-Gm-Gg: AR+sD12u2eXOl/3esxkY34ozaIzXEtlgKF94c4BDu8JW52HoGLQE8iR6iFcJUG0yLqA
	EHU8BMG2WVayLI4vfzDwejZgFMv5pVU3mvVeIAje6OBPjwFfFeGhqE04DIC9sD6OAxM+QbStRLx
	x6zV48XkmUM3vKEfEfTdU0wwJweK4V5ky2HFeiI3/xkrrtiLqj6rRxfEHkvjftwpA3rSDRsoCVR
	DuHH3eKx8hmlFQGgjfsz38N7Q1iFXRBW3xl4O/NoE8owFbhTEAa4JaqKx68gk+sLwO4YWrvZJod
	D0PbwImGZKk0E18t/QC/R9O4fBYm8zMA/UKV4qS6pe+pdjwZhjGwQ3UrCGFqPqm6KzlxJkZmxDj
	E9MTxKFlMc2KhpDQ7KTzLK7GJLCOH+csuVa/j
X-Received: by 2002:a05:620a:268f:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-9372858eaaemr724732485a.21.1787236276743;
        Thu, 20 Aug 2026 07:31:16 -0700 (PDT)
X-Received: by 2002:a05:620a:268f:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-9372858eaaemr724696385a.21.1787236274752;
        Thu, 20 Aug 2026 07:31:14 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b145c9d7sm15226618f8f.15.2026.08.20.07.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:31:12 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Fix endian, overflow, and write-protection bugs in
 SE firmware loading
Date: Thu, 20 Aug 2026 20:00:57 +0530
Message-Id: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKIPh2oC/5WOwQ6CMBBEf8X07BLaKoIn/8NwKGUrNUB1W0BC+
 HcLfoGXSd5kdmYX5pEsenY9LIxwtN66PoI4HphuVP9AsHVkJlKRpTkvwNgPTGQDQnBAqGpwfTt
 Hm7pJEUI1GIMEstDqkssTSp6yWPYijJf70L38sR+qJ+qwtW+JxvrgaN4/GfmW+3t05MChwjw7S
 2GQC3Fz3ifvQbXadV0ShZXrun4BEAf7HPUAAAA=
X-Change-ID: 20260819-fix-write-to-read-only-firmware-buffer-39ca7834e310
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787236268; l=2071;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=ciwHRYjQuEd3C8uscy3buW66CO8Rv1fx4UFqivYmwyI=;
 b=vHO/Ikmrwnx0ik1NavaLPPk/gDouDK9U4oE/6qfPIHO0SYMl6+hsfmyO1tNxdwDl+zt+MjWGz
 C2591qjY6vIBHfJ6o1/K3HdoNlRNzME1YFBtQUB1lJ3+dDuEblIC25Y
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a870fb5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=XQMRRsFmXZ0RbJubXJcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwOSBTYWx0ZWRfXykomJwXbJ6sQ
 uaRclt5c6XPuiah9ViJCJ1wE2xty7fzeh1OXToEex/zIYb7kSU4t5qR4iEzk2prLJdyDSPkxVav
 +WbrvaZF1pbTaEAzEQGVLRD9PD4Hx0Po1ikuBUf1eBEiGF2QIkAAaJNNQsDC5c2rVrtgqAYTYdj
 iha7Bf7Z/0kvCOXQELnPQGlnseNxXV4UFt4cZRXwDi5xa0ReOK+EjkVaKvDG016c2eBdV+Yv5MR
 7H3ufdYwQ2aZF152vCvzUDmWKWFImz+vxrkoCG/o9Hgb7rS+xw3aMXUd+RhIoQyAgyow9TLt2mK
 P2WIOeT7CEOAKLwG12rauQcZT8xkgwEaZfght5d5OuLTeLfDgD6nDe657hkEUuWbzURFlQiRwZh
 0yDP/R+kFFBNW0gJnNM0s11ujKls4GG0FvygVClY6cN47UuDVbBc/k3xhswrpMsO5kIjJ4wkTDT
 AET6V5L3qPBpg4jHNwg==
X-Proofpoint-GUID: JLGzKRkx_DWCT4LpcjHEbiqL0xSHhgLp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwOSBTYWx0ZWRfX2MnqtfvMXn0t
 AIG4yH8mWBR0OoiSZlnuMt6hbQrJ+5oV7s0D+3qH/mPLoKrjpazA/Xr68Iw824W6rIF2oieIMg9
 bOD1CpFDwe0l+nQHEhv+/hiZ7GeWROE=
X-Proofpoint-ORIG-GUID: JLGzKRkx_DWCT4LpcjHEbiqL0xSHhgLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200109

This series fixes four issues in geni_find_protocol_fw() and
geni_load_se_fw(), all introduced by commit d4bf06592ad6 ("soc: qcom:
geni-se: Add support to load QUP SE Firmware via Linux subsystem").

The most critical issue (patch 4/4) causes a level-3 permission fault
and crashes the kernel during QUP firmware load on CentOS; writing through
a non-const cast into a read-only firmware mapping is undefined behavior
regardless of whether the fault is raised.

The remaining three patches fix related issues that were uncovered while
addressing the above:

- The fw_end bounds check was computed from the unrounded fw_size,
  allowing an odd-word-count segment to pass validation but trigger an
  out-of-bounds read during the subsequent memcpy_toio() (patch 3/4).

- fw_size was stored as u16; incrementing 0xffff silently wraps to 0,
  bypassing the MAX_GENI_CFG_RAMn_CNT check and permitting an
  arbitrarily large copy into SE RAM (patch 2/4).

- serial_protocol is __le16 but was decoded with le32_to_cpu(), causing
  the protocol match to always fail on big-endian systems and preventing
  any firmware from loading (patch 1/4).

---
Changes in v2:
- Split into four atomic patches (one fix per commit) for easier review and bisection.
- Link to v1: https://patch.msgid.link/20260819-fix-write-to-read-only-firmware-buffer-v1-1-be86532fe122@oss.qualcomm.com

---
Viken Dadhaniya (4):
      soc: qcom: geni-se: Fix endian conversion for serial_protocol comparison
      soc: qcom: geni-se: Widen fw_size to u32 to prevent wrap-around
      soc: qcom: geni-se: Fix fw_end computed before round-up; propagate size to caller
      soc: qcom: geni-se: Fix write to read-only firmware buffer

 drivers/soc/qcom/qcom-geni-se.c | 45 ++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 21 deletions(-)
---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260819-fix-write-to-read-only-firmware-buffer-39ca7834e310

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

