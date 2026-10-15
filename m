Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD2A3E7625
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046300; cv=none; b=fVnuKGaqV+QrIJSStTwZgmVG1j5yG5vkZzpvQUEjpxorTWCGXJd36+cscrqJratUHqHbMAMRjOqunMUaHBcAiDzsLlVoMRP7Wih25vvl2psEyHDmM6uaj4in0Rne+GOyNlOxHsdq4zvYH0dHED9sdzCXOP/WXss5pnJ1GeXaIxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046300; c=relaxed/simple;
	bh=M0bO5pV7rOWhaoU6+z7kLmEATwugnVvfR+Tk3mM83CU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FdzUM+SXXqOzXCssq/acwCFBsHUTQFVVVnCVBATC+U4gD8A0QryulRPZ40r+1g9Mbkh5qfHsCkhdIO72M2hSQysZzjiHzYoVot6CBbsIhWLiBdhfPgYmN/+/mR7NeUQnH90DlbRewos0mw8JXFx7noiFRztC3RtLrdkbh7I7ATQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=giRqNbQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9OGCEqi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="giRqNbQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9OGCEqi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xCVm1640504
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1gwU0tcX13myESEjxMHLTQ
	2r/QSifosTvZ0kTue5VFs=; b=giRqNbQJYawxS/9sjUldbIgXPHx5WjkeK2pjT9
	EKxIer3TV65dvlPftDAG9DzN8PxjrUWphhzBbPzmJewRC1vCWI4RyNXfC/iwC/4B
	x0UoLVdoxw4K3XZDL0TFTLdPt1Jmsixn23tNNEqZLlceS3LdiU5P4IAS71ZJhlkh
	zV5VuW8b3BWePQdthn7RnOXLsJ5nAPDMVHqkxXoE/s9Vn49xViuMvOAvAWhK7il/
	XzdxEqF1qI4dZ/KStJqIaw+45m+EuQmReGFAeVQccB2xPgfRZTibz3gDL1+WsRyt
	gDif+omN/9CFuZJLqTugqCavNFySaE7L2Ymi3rfx0vLOkNqw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhgjaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:38:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab341816f6so4918030a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792046297; x=1792651097; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1gwU0tcX13myESEjxMHLTQ2r/QSifosTvZ0kTue5VFs=;
        b=Z9OGCEqiOjoas2PrkSqxfx19cl/bSy/i4S3bBx+cn3JZi1lVb/H1oOb/ywEUTJQsXl
         35BGjhvZPXagM761L0u7ymQxROSh1YuEDBQ8K8YnZEUxBFKyAU6usiBV0+jqL9w4upBA
         PcWUAejJW2cDQ7opz62OHULN37HvRC/aPOAiRJSS+ebQNaW9pfscsBtHgL+sGIo6pvNZ
         PujtpI+vFPQ9+V4yz8fwCIvuvLhv07imauOT4PUhe+wA5Uhu6cot5uwm9abnxQIBWtyM
         Pon9J3R7bfF/hCGYTvuV3W11W1n6jwmBXBbi+FA1fotf5byPEhZazjOkUieoHX8xsBUJ
         4UQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046297; x=1792651097;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1gwU0tcX13myESEjxMHLTQ2r/QSifosTvZ0kTue5VFs=;
        b=iJh/Lst5ET2T799wSshZDMK96xnaSoCe5R5bpXcnn+uyZaVYoKHZJLqTFt72WRwMlT
         mc35Z/DWz7XmZyWoAnUHaiII+Q3hQredEs8BkvBhgXFiUEqS+KAH1ZNyacCsw257jUZ0
         IEqvK4a/YqIPFErjWbJlO2AAmVVqqCCymCedPVVubch6velP1ArPm0uap7TkAppgtCZK
         MQOerNQSdTkpy5JyNZeGudoEvnJ/ElEstnU8Fk4qq4EEr6zcPY+ULxG8k8Ikzup/ZbJX
         0BLgz4dWHAuaLYErq2JLlSkVLbRlFpeuvHoM7cBgFsOlHEDZvmBjmaOFUcmsS+N9jWnX
         DMOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsbGxgI6bHiW/31gF3S8bt8cZjcE4nhtnFAjqd7QkfYsSZ6C3+SyBYK+Xc6HXfW8dNwEavLD0zjnSJI9Ge@vger.kernel.org
X-Gm-Message-State: AFq9FYKxo5hzQEwwI7fAxrM/EBVgPiCLHtezwAiNhblOHXsRvp/C0mxM
	B1b3LoPsIERuGj/xqn43U7YxAQsJDI/6gzi29g959H8qXjUE83EYTVK8OYptvTjHIlOKftspL1D
	++wFeNL4tkRGG6W9DLQ26dN6O95YbcV+lCN1jmxfPerz3l/6KWm+MIq8dD3rsZVDYFxSc
X-Gm-Gg: AYBFou0N8Y+6VxNIMDtJia4Vq0Hni8UNzLb8fI3tSr+1V2oVUowGu8U8pQulYoVknDM
	7pwNCiZkc0IBoERD9ZeTzt5yRGRJ8XCLhaC5pZZTwFSpW6vLHGR4eyVY4gbqEW7usSQhecCDWTI
	S9bGma3QNLhbdiXOKtJ7rjTc0qhOAtT8QJ3D8yol4Z1xf0raFZHcC6WUnVxEM3DIla9GX4P22gJ
	oHuiDt0Sm60JiVf8xAEbMkHD/EnwFCo00jPGnfvXspLHwFpFOqhZBRyHQBrm1LLZlh5K/gphS5q
	f09qP/EQPTIHOILqO2nIaL6qD1Qf9HspppKfwVmankTDILOhj25n+P8zq+P2CLDo+rVAwrkzi2r
	+2YUy9qHrM1RGyx2Xayi8AhBL9H4HLFRp
X-Received: by 2002:a17:90a:d44d:b0:3aa:f4af:1e17 with SMTP id 98e67ed59e1d1-3ab3a9d6d17mr13213366a91.39.1792046296575;
        Wed, 14 Oct 2026 23:38:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d44d:b0:3aa:f4af:1e17 with SMTP id 98e67ed59e1d1-3ab3a9d6d17mr13213353a91.39.1792046296059;
        Wed, 14 Oct 2026 23:38:16 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac93ff4474sm2844429a91.0.2026.10.14.23.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:38:15 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add TPM support via Qualcomm TEE TPM TA
Date: Thu, 15 Oct 2026 12:07:45 +0530
Message-Id: <20261015-tpm_qcom_driver-v3-0-247c8e50250e@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALt00GoC/3WQwW7DIAyGXyXiPCowBEhOfY9pqkhwWqalSYBEm
 6q++wid1MO2C9Iv7O+zfSMRg8dI2upGAm4++umag3ipSH+x1zNS73ImwEAxIzhN83ha+mk8ueA
 3DNQB7zUw1KIDkrvmgIP/LMTXt0eOa/eOfdoxPxUBlzWr0qPsaWqr4pHM0OJYMytib+f5NPpzs
 AmLOyFSLoxqnKyRcdlucgd3NiLN36NPbeUkb5wyALV2hotB9Z22YFBCJ2rH0A3SOiYM2Ye8+Ji
 m8FWusPEy078Lb5wyqgauBqsakIM9TjEeltV+7OpDfgpygyemYfo3BjJGc6s6rmtw1vyBud/v3
 57Rln+hAQAA
X-Change-ID: 20260831-tpm_qcom_driver-d21c720e73b2
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyNiBTYWx0ZWRfXzWErr3tHs7Oi
 dtAFUG7OYSZJSvWQ4krKhjh2YjvFhLAfMjILkFHpqoCV2dHwqlqibr/0KFW1EGL8DzMde3Rx4MX
 1zIEqLi3+oV9jwphKMEj8wVuesF+1LmmabmBcHMEhEGMmUkj209xc1AQ6dnphl/8jHdNLAD7yAA
 XjN6R/ZlK5xF1R/6jcYgqA3iF1VRPplnl/a7rnPVZKcuYXn6TRb+YqAgPOgM3Qa+K8aTOPPnKv5
 Z6vAXRp+Oibgr5RujeNAOt/zdDzmGnPLufiRgO/doBaCwpwqE7oQjN+oWSxWCX0NKHsNbSA6zxJ
 J/4cQjZhxMEouL5s49v26KtuhQHV3us+Aea310tR678LP2knZz/97SMk7UaJS6kEu0DlzNByqRF
 9/nfMPhfn0ortnYKEY6yKlE6+uZh1rkrJ8dSScjKVwfownmWMlQbUVi/A2XWJwjrN55KZKFH5Ne
 vGZdcicKvfoE3TbdOVg==
X-Proofpoint-GUID: heqyCKDAQBl-wzZqbI7rpLAipGICUYUJ
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad074d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=9jRdOu3wAAAA:8
 a=b45o4kL6AAAA:8 a=xG2GeFPYwsRGK1jMldgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22 a=ZE6KLimJVUuLrTuGpvhn:22
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyNiBTYWx0ZWRfX492fEzrlSXjz
 +GyKmgl4z70ffRQO/2Z1DpLvJrtjozSLyuBB3Oh6UcQhcwcrCzZOiUyEUtMKxx+/S+BPKn7zvlp
 ORrH8ZEIwW9S42CatqYFidUAn/RXMQQ=
X-Proofpoint-ORIG-GUID: heqyCKDAQBl-wzZqbI7rpLAipGICUYUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150026

Qualcomm platforms with a discrete TPM (dTPM) talked to it directly over
a non-secure SPI channel from the kernel. Arm's Base Boot Security
Requirements (BBSR) v1.4 require that access to go through TrustZone
instead, so on affected Qualcomm platforms the TPM 2.0 instance is now
fronted by a Trusted Application (TA) running inside Qualcomm's Trusted
Execution Environment (QTEE), which talks to the dTPM (or implements an
fTPM) on the kernel's behalf.

This series adds a kernel driver for that TA, built on the QCOMTEE
object-IPC transport (drivers/tee/qcomtee/) already used to reach other
QTEE services.

This patch series functionally depends on below(first 5 changes specially)
for qtee service discovery.
- https://lore.kernel.org/lkml/20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com/

Tested on Glymur-crd target with tpm2-tools utility.

Validations:
- Get capabilities
- Random number generator
- RSA key creation, encryption and decryption.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v3:
- Merge tpm_qcom.h into tpm_qcom.c(Amir comments)
- Update return values of functions and drop certain error prints.
- Define locality_arg as default value.
- Add Jarrko's tag on all but drop from 2/3 as significant changes done.
- Link to v2: https://patch.msgid.link/20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com

Changes in v2:
- Use QCOMTEE_TPM_UID as 81 for service discovery in patch 1.
- Use FIELD_GET, zero initialised array and log improvement (Konrad)
- Improve commit title and other fixes (Jarkko)
- Split MAINTAINERS entry as separate patch.
- Link to v1: https://patch.msgid.link/20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com

To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
To: Peter Huewe <peterhuewe@gmx.de>
To: Jarkko Sakkinen <jarkko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: op-tee@lists.trustedfirmware.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-integrity@vger.kernel.org

---
Kuldeep Singh (3):
      tee: qcomtee: Register qcom.tz.tpm service for discovery
      tpm: Introduce Qualcomm TPM driver
      MAINTAINERS: Add Qualcomm TPM driver entry

 MAINTAINERS                       |   6 +
 drivers/char/tpm/Kconfig          |   9 +
 drivers/char/tpm/Makefile         |   1 +
 drivers/char/tpm/tpm_qcom.c       | 413 ++++++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/call.c        |   4 +-
 drivers/tee/qcomtee/qcomtee_msg.h |   2 +
 6 files changed, 434 insertions(+), 1 deletion(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20260831-tpm_qcom_driver-d21c720e73b2
prerequisite-change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014:v4
prerequisite-patch-id: faf4520d818abf0d7533f71d9c8b9a8aade34626
prerequisite-patch-id: b487dfe2fbc076f4815dc6c73b9e68b0b78c961f
prerequisite-patch-id: aef7dba7d7662f87cb06bbf5cabca93304843f02
prerequisite-patch-id: bbdd5327c15aeaa99ce9b74bab324a98f084ed48
prerequisite-patch-id: 6263a8a3b40df5cce7fbe4b119f4b9d67a4c06b4
prerequisite-patch-id: 0c1a650a54014eb20f7ab9ec20038b49e42680e1
prerequisite-patch-id: 7be993abea2ca36057d9352381a5890f50996dda

Best regards,
--  
Kuldeep Singh <kuldsing@qti.qualcomm.com>

