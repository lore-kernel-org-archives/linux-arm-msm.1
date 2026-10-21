Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597411;
	b=kvdOLYyvFbTtU2PBUF8l0/xx61Uh1Xf2U5CKVuSuwTIn8fOV+hAHJzr4eCHP4yCzlkPs
	 zxQnZChcapONA74K26SS8YUXjmUD8B90hGqVFUd46rXriVIffVuyhZJBHOkQSYnaKLI8w
	 LdiC4lM969N1FFjnKjLCQHdOnqf2rvsG5pnk0Ttyfk5FWNqKeSs/4E3oyUrwX9Usmfsty
	 SL0WjKBbYYYYRNtQpnAPfO4x292HIypp73Rljomqx7md+5Lnas/AH5MsFBqC0hN2kjjRY
	 K3Yj98tyHSNFgMxcj8T8et8zP44OOI95TDLqmvKbRGqOgKiOtCrz8JtZMFNAJmmLDoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OsgokzbRwDMcoDaL2XCATM4Rc4G+bTJ2AfnLyP/Jpt0=;
	b=fl1jRvGxwJCuBO36qy2CRhRHs4Uec8Fg+bRyI3ceOw1YKUG1UK5r7ZENya7vBLtL6KKX
	 d8REYOq2utUdXDO/FLui3hZqephhgkfWFmNl0ooyQrSe/yyyzqdRA80DaF1dLhM4peH19
	 UIIJnl0bM7KQPXXtjW/3mfVHjFkg8b+GNMkyxWpwqF9qJGDy5LgfQ6tCw6ijWVyq2nyqs
	 ZIGh+cFMbkYalllqtTSsBLm2Atj9t2CKB6mNGvMDUhmBW5AZjcK3ebsF1rKD5lR+5LhOn
	 bv1e8AIWAwep8dmsB8ilmDlX4ujhJ96Hvq4dSZYRaXMJSlZT+5HLiTOyKlpvbD4FlFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N7uIaIrF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CrEbv59z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECA460A2616
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ECA460A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N7uIaIrF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CrEbv59z
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTxic1481037
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OsgokzbRwDMcoDaL2XCATM
	4Rc4G+bTJ2AfnLyP/Jpt0=; b=N7uIaIrFZmqFsyEPzm8aAunfH0UjtfnSpF+zRD
	h46/qOIEs7MHA9JRpCZ4M9bCDAM2YW6NbXUzFmAuuH3yLRZfN9u+zDx7YCwQEPxs
	9wWpc/kTtsAJ4JvZG7+RhcuTeJo/Su8SBWr8u6qIyE8CqfLp4SubkBx+XrODtAc0
	ftKFLqRiPfAxhr03yfgSBZ6XHBBeKqYkwgcQDLouxq/OAQi1MOkO56qofYukOIHr
	Xh++zZZExLZFFx+n80YzpEHs+OyiWjCBp1qTinGVwbCND7d0fiNh1l3wriwOWdkD
	9Oo8SLWdBTkC4XjO/UAx8Nq7o+9GdCzdVWKm9PeEFt8W/EUA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs0400c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:43:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso1548106c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792597407; x=1793202207; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OsgokzbRwDMcoDaL2XCATM4Rc4G+bTJ2AfnLyP/Jpt0=;
        b=CrEbv59zuRz1wtUBRdjbFgumpQwO8VsxJR0FalsoPvBCC/9XPFQOKXsJDgizT7cQ3U
         Z7zflqcNWdw3ijHcXUBlXmfUTyI34bf0j9CmqVMJmFkW3IhUEd4OPNyA/DYNm+cLP/Br
         +YXXsUGWfEhXK85RO6p6w50cKEt2SdF4uZPIPUTfPou7CuCRpV4CzmZptXZY2ohJxNId
         HZRII47mNJlITGMvGbxW+qUGw+AZqZGbNw9FxIE6qk+walftgWorsks16eSxG/I99JpT
         qLZ6Ur0ZcYxHrKt0rfNAKgEgup86Zgp0WuSFG/DrTks0m7jlkLV1xVUEXlJz7ZoYJ3Y1
         VVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597407; x=1793202207;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OsgokzbRwDMcoDaL2XCATM4Rc4G+bTJ2AfnLyP/Jpt0=;
        b=LVa5TabAgo8Na+PlmEYOIaDWC6rFa39GGxQ9KXQI6zTBhGH7ls1mdc+POy5DEah3mz
         q1p6WNUc+/cb33Un7ATt0bEf5pmNm39FX8RSFUCUprI+ZKoUIFPtEfuM+rMSY5IQw5FK
         86cuokHsZPnwNgn1P3hJsy27w8J3wvUocFOApKfN6cgjurfw7APErqrWlbtTZ4WJtwEW
         eqV/bag4DxvYykVwpABq2JhEp12TXnshpTVGNn1Tmc2MKw1kCtmwHzCGELdevRk1FCpa
         0hvXzJzyiEy3hn/5UjQS2bd9wk6cjMa74wWbEM0j2Hc0bUwXfqnmfzmwvuit7IZdmNg3
         9A5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzfRVyy5+CCj1aew9AETTAIQG+J9SaNZXQX9oG8jYI/AOh+Z0VZnPZ0+rVVUqruhqK//Jn5OXW6o5aYfzVy@vger.kernel.org
X-Gm-Message-State: AFq9FYKo03x6xVejzN9zgWBNzbECVM2uyJDp7R67vlRPNJA37d2SKtlR
	LO9R1/TKPtnlefLgeLNseOCYpJW/akx38p49L3dPapA8QV3nJSprBZlfG91tv27DcGsCEUq5LcF
	xnX9+p0LvetF9y0OodVckCLj9u78i5WXL0ujMcOko7ArmSfdmhMP4CfiDGHbfYrljbSLY
X-Gm-Gg: AYBFou1SONWO0sW6GBTuy5sV1C5FdjGlyAI+5zl0tBweh4dJVbXUqGhRL9kxMOkkHlD
	P6tPsJyGkbA//ZkJDCvYPxpZHFXRMazoaz+NBBTeGmQzdVYFGmSkrajUCYAF41MnhYP0C9NrGwZ
	gFiL3mpxC92aMcqr9k9XRS03vLJT8qTggQTSzFUA0ZnsEgSx0nDAw8toPAqtlfLRew8w83/CE9i
	EsiQDJrK1hbuXE0rnXG9Vu6oj8gDgafo8Wtj6DIbfks6UsvVs2w4JkpFKc0csFXYiEWY7CLchiu
	eCs4IMH3ov4q6KiE2J0IjOXx1wsk2iEWYL9ZT+mxTbBp4MMa1jdSWUDe76HWOhc1kgOurRmC9O5
	5w1u7VuSikOov82IE5Mx9IopV
X-Received: by 2002:a05:7022:1715:b0:18b:ca6a:5e70 with SMTP id a92af1059eb24-190a0428c8bmr2011278c88.6.1792597406852;
        Wed, 21 Oct 2026 08:43:26 -0700 (PDT)
X-Received: by 2002:a05:7022:1715:b0:18b:ca6a:5e70 with SMTP id a92af1059eb24-190a0428c8bmr2011231c88.6.1792597405969;
        Wed, 21 Oct 2026 08:43:25 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1902f96dc4bsm7937768c88.0.2026.10.21.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:43:25 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH 0/5] Add support for a TEE agnostic Inline Crypto Engine
 service
Date: Wed, 21 Oct 2026 21:13:06 +0530
Message-Id: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIrd2GoC/x3MOwqAMBBF0a3I1A6YiAHdiliE8alT+CEREUL2b
 rA8xb2JIoIi0lAlCng06nkUmLoi2fyxgnUuJttYZxprWAW86xr8Db4Bjo+w72R2fdd7tI5KeQU
 s+v7Xccr5A8s/HX9lAAAA
X-Change-ID: 20261021-ice-migrate-tee-svc-a5cd6959ae36
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792597401; l=3080;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=TqA5QywZy39ISB88OCbEFOFyAshkmR9jiy1pUVRDiFg=;
 b=Qka6Kp4DJqzvVn1Xvt08pcN7UqBDMqNuYV69QEUE4yRIdKP7epI7w+nupFNyK0NzDLMPA2R3e
 BNY3TqyHmjrDo5Q72PR9B1jv3KOihg7odXqtp7VNq7ZzdRHPZ88gAmb
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8dda1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=_EMmJvYMAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4CWejXOLIFnvMk5dGHAA:9 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=emCv1hD2LFd8cNRmW21v:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfX684M5j+CzKT+
 kppJtjhnMgnswil7O7czcC093agrtsPxEKMcrZUoZH1ztVz0d1wkUvyUp8GMlBHdI2CGvWUQWDx
 U/ezCLmifGmYSE1Z8appVwj1DG6DThsJPwqWnxvnhIuUr6ZeFhWw6+LgyUETjCQl1++vyGwOfyk
 mcSjvKSpJBGw9D1+aJUVHsR0jVQxgOl5ArNCwmB3+E6/vCTuzmzGCGIsB5ia5t1KmvOx1UZt33t
 tU7WPc8UjrUSj1cSVMoPaRO+0qqNGdfGGP3VBfUXeXEA5qQ8o7uaQ4Vvc3n/GRmJ11iqgNUhWaw
 01wdS//R58ElqWU1s+DSyWVC6GKOLesF2YneLDVq466QRvVxP4dddlTn1mI+l9UF9AESzUFe4SG
 FpgimFItuYfV1LMuGg3yWJsiElCvPeviu3lTusP3RVJZ3SsjA3iFus2u9IV2NfWhqrvP9tiUqG3
 3YTFlt0tM7x5hk3r9uw==
X-Proofpoint-ORIG-GUID: L3hIaC0hAJ5M9e0SQkVcNkEXff50TVYW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfX5EitwLd10Pe5
 4A/bhuJBEjGMTOBmp2ItUFdzI1bix1o1j50RTN4g6cXGDv18vH+7q5YyFV3egmMYdVZfIqqYRQz
 BMe3sSV0W/bweGOqUStZdVSd5lsL/BY=
X-Proofpoint-GUID: L3hIaC0hAJ5M9e0SQkVcNkEXff50TVYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210062

Qualcomm platforms such as the IQ-9075 EVK now boot with both Qualcomm
Trusted Execution Environment (QTEE) and OP-TEE [1]. However, the Qualcomm
Inline Crypto Engine (ICE) driver currently only makes SCM calls into QTEE.
With the arrival of ICE support on OPTEE [2,3] for Qualcomm platforms,
there is a need for a generic layer which re-directs the call to the correct
TEE at runtime.
    
This patch series adds a generic ICE service which provides TEE agnostic
APIs to the ICE driver for requesting secure services from either QTEE
or OP-TEE depending on whether an SCM driver back-end or a TEE driver
back-end is registered with it at runtime. This series is logically similar
to the one introduced for Peripheral Authentication Service (PAS) [3]
which was recently merged to provide a generic PAS service for both QTEE
and OP-TEE.

The TEE bus based client driver introduced in this series which registers
with the ICE service has an ABI with OP-TEE that is 1-1 identical with the
SCM driver's ICE ABI with QTEE. This is because both TEEs implement logically
similar drivers with the exception that OP-TEE currently does not have
Hardware Key Manager v2 support and so the inline encryption functionality
with OP-TEE is currently limited to Qualcomm platforms with only Hardware
Key Manager v1.

Validation:
This series has been validated on a LeMans IQ-9075 EVK device by attempting
file system encryption via the fscrypt tool.

Merge Strategy:
All patches in this series touch Qualcomm firmware and soc drivers. Hence,
it should go via the QCOM-SoC tree.

[1] https://ldts.github.io/qcom-buildroot/index.html
[2] https://github.com/OP-TEE/optee_os/pull/7906 (In review)
[3] https://github.com/OP-TEE/optee_os/pull/8137 (Draft, depends on PR#7906)
[4] https://lore.kernel.org/all/20260702115835.167602-1-sumit.garg@kernel.org/

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Harshal Dev (5):
      firmware: qcom: Add a generic ICE service
      firmware: qcom_scm: Transition to the generic ICE service
      firmware: qcom: Add an TEE bus based ICE back-end
      soc: qcom: ice: Migrate to the generic ICE service
      firmware: qcom: scm: Drop exported ICE wrapper functions

 MAINTAINERS                            |  10 +
 drivers/firmware/qcom/Kconfig          |  19 ++
 drivers/firmware/qcom/Makefile         |   2 +
 drivers/firmware/qcom/qcom_ice.c       | 125 +++++++++++
 drivers/firmware/qcom/qcom_ice.h       |  51 +++++
 drivers/firmware/qcom/qcom_ice_tee.c   | 384 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c       |  83 ++++---
 drivers/soc/qcom/Kconfig               |   2 +-
 drivers/soc/qcom/ice.c                 |  30 +--
 include/linux/firmware/qcom/qcom_ice.h |  32 +++
 include/linux/firmware/qcom/qcom_scm.h |  20 --
 11 files changed, 690 insertions(+), 68 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-ice-migrate-tee-svc-a5cd6959ae36

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>

