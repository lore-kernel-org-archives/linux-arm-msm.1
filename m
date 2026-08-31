Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3204F3D171C
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169405; cv=none; b=rgxC163w/bnHSjj8qdR5/gex0z1QpI+IqlEPxXy2HnnoKNcc7SiaMsVv5Plpg4OjRNN6YKLMTAxyw5JdA+3USYEmfKVjk1FOcA3ps/BIP7Vwo93Qm+Xrhh1UgtdEFObwySg/ULfDXeZdj2WHwD75UaYzR97tkQ0gcdqhnZe54XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169405; c=relaxed/simple;
	bh=Uz8K52ckdSGPXQ7DIRli6aJZfuZvAmohNlhPwXu3mR8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TSs0kC42jP7ghfyk0F57tc2soeFeNf8EF2F5pg93lsYS1XmPRxUb0dZdSn6LsAcPKzIFX2uqJrlhIrpPYBtjFo0oiDBXGPxb262+u9YaoS56ykp1F52pnzToAefI0blDd7R2D5D2pcSZxC06qwCyDIOSXHcHtr60I+9n2GJO5xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCNrJKHq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIt93nLc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCNrJKHq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIt93nLc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V8t2vr3214792
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R8skzQrcTOFob5OgyU8esN
	NdOJgcF5QRwXdZN6hrzvQ=; b=jCNrJKHqSFy/sVcK+6sqY1TgMZwmOnm/8N3x7e
	LF0D5eWUi5Ca3eRaTQN2bSdKPpaA0J6FD+0LXK3FMMHqchLXP9deRKWjvMdGwRJ0
	OcVlXeYFyH+mqJj558h0Fk58vLC49/P5kpMRn3qOOxZRrmQkN3+ksQA2Gx+kTFiZ
	PwIQmcBiz1FkrXoWsSN/1qWvFlAYVTWww/biv6geJzucRyuMJKmK5wja9m+RV0Cs
	eUExGzQDmOBxkpAw0SxqKs2wFJvvoNY/7zyz4snyLpBTLb+BVs15tXPfVAVhEsww
	dGO4ScAej5p1cU4guswFJqimMwlz5/DWbj9GZNw2QrhBA3YA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h906k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:43:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so5721860a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788169402; x=1788774202; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R8skzQrcTOFob5OgyU8esNNdOJgcF5QRwXdZN6hrzvQ=;
        b=JIt93nLcSWgLvowHi9kL1W6NLA5ubsHmiPobqYzWLbolX7ku0WWTSNaHK2e9hFuFAx
         9sC+If7PvzgpMy4534acTqBEXUGqPEUxWvRrK9rdssIeJffTnHEp3fk3oVIp180rM/x6
         ad7Z+Z3gHH7HnU8Zngc8YRpd+YJNm38T6zf+jGabb1X9uBT/UKF96o6xCGepTaoRfmoy
         udX9F4C6UmNnrtn74eEYC4WfPFbXNBELCFcx0MeRjn/dVx8q8O97mpqP2tNmXR93kRB6
         xG4YFkKNzCycyl0FMAweI/4f1Ot884RNKbuy33QYXylTTa+ZbECBRu5BVgeF5mpl5AvX
         o6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169402; x=1788774202;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R8skzQrcTOFob5OgyU8esNNdOJgcF5QRwXdZN6hrzvQ=;
        b=cKIg0f/aCGUpdF9N9KttJtiJsPjv+0lfdIECfi/V4AEXZvN/2GaBxwBafGeNX3aNL1
         SSCamMn/OTL45Q8jEfarNs2gulHfun+YJ3lDDfi1Y/rsmJHM8nN9f9byQ3n19CXRbWnm
         7mjeqdurqzDfppO0Hi6EItKv6wN7q/AXtaEXbX4E0/lspRhpf2gDYfN/dk+RzyoCYOHS
         4sPNvAAHatTRol3S3Ab9XfJfeMQjQxNlins2ufAYiPCHvTosemIjYKvVZvkfIHOHWcLG
         YT0qHSrtrNAjGzUxPrrZjM0D8hPEvI6uoNuug6VNwsg9i15gZP2XoIgiqwgw5LaElgLg
         CDcA==
X-Gm-Message-State: AFuF++mjmMPnSzgsPbvQYF73zI8cKZxXtUyJalGw+/+VZAjL3nEE8QDU
	JWnfH3h7I5eqx4ReqstLEzclNXrp8Ujc32Ea/res7C2lemxb2z0RwgfMXdDDrFnXYZiiJNWqASf
	/96KPSI+V8IpMj9bbMCJ5lQe5FoJ8csyKd4ci44q/JAZRHSo+DBbtsYegmBac7uPM15J6AqxB20
	OX
X-Gm-Gg: AYBFou2d96JVFchAuV7/IjFY45DSijnNgQmJjaJeOnC4VPOUHyup1t59DCTHrbFnyj9
	7ovR1pkmME16wTIJazpQr83uvnMjvvVJo3m7DnDOiqCeHc259rgK0RvlHBF4cFkcenTJVvedn9j
	Cgy1nv1IZ7YUec0LYmxaCMjasjC9sZX43PqCKRtTHdgGDQDcC4Yf0TgQk4IgLOfrpRrmSMPSIK6
	UNbubfi6zORhQxuta/nn3CLNVjnQ0gLbUE0rW9HkcP5EmXX6EXJWnGY1ptk1hMIB021hglB2iB9
	2qoWXScixcgOJviqS2ukm/RFrW31n1B+GxMhqp6rojnEazuIKbM+o0vWzoDyOalHEuXlUsV1huX
	+kDQ1TlsXn4hq9acbUFOYUPQqykQ1sng/3A==
X-Received: by 2002:a17:90b:5443:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-396d100313fmr38943825a91.16.1788169401987;
        Mon, 31 Aug 2026 02:43:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5443:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-396d100313fmr38943775a91.16.1788169401471;
        Mon, 31 Aug 2026 02:43:21 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm40782983c88.0.2026.08.31.02.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:43:21 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Add TPM support via Qualcomm TEE TPM TA
Date: Mon, 31 Aug 2026 15:12:59 +0530
Message-Id: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKRMlWoC/0WN26rCMBREf6Xk+QR2Lra1vyJScplqDlRrkhZB/
 HdjFHzaLPbMrAdLiAGJDc2DRWwhheulgPhrmDubywk8+MJMkmypV4LnZR5v7jqPPoYNkXspXCc
 JnbKSldYSMYV7XTwcP5xW+w+X3zPfRMRtLar8if1MQ1M9mnpeHWvZSnBmWcY5nKLJqO4McKH6d
 u/1DiT0sFW1NQm8vOeQh2ZSaJUi303Q0krSZqKdkd66treq24OMF+Ww4/P5AksywzAGAQAA
X-Change-ID: 20260831-tpm_qcom_driver-d21c720e73b2
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a954cba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EAapQlX8VUJyPtJC71QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 4kca4hsFlKR4guQjjEZRucVajyAd-Pu4
X-Proofpoint-GUID: 4kca4hsFlKR4guQjjEZRucVajyAd-Pu4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4MyBTYWx0ZWRfXwv3tR3zQUJPa
 JNnrAvJJb04idzLdkGDAG4fxnQ++FzHOKF/X3jIndBE26i59bAux27mfuFB73pn9mp7PYaHcAEA
 1hihw0zkMjzTiBSGzhT4y7ASKefAueQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4MyBTYWx0ZWRfXwma1T8nU9d7J
 M4oCzCeqMMFAlzdIfpze69CcOEibEqZZ5qD1/fknnLPXxuaG2gr1+XjMVcTH2RNtkyLir3NLXDA
 UMGm1zJvIU8WPjjPMo5ZuwnW8vD1Al071ZThPl2n295B3RBr6aaMD1MzlZH1R2AWWDts3F/P0gI
 Rwpuz+R8ni6uuOCjzB4WF5qIN4CrG+8AQk5TOSh5GfGsog4N5678qoebOSwVsk4EdGd40lNhJcl
 cMeua4+p/MNxJWdFBPXzDxgt6GBRTqoUC1h9kk/zY68bUmplooF5XEAwx0MvLEpLzg9pu9vprkc
 v8ey3QOBDm56x8xfKnAdkWlI6Iw571VzrgG/vgqLYuDb0AmXThY6L/7/yroK/O0v3fx8Hbt6OfV
 qEWGznpTKq5d+R0ZSKwFowKgXBx77Ra6DuRxWreB9S7uDCDjq+CZvGLoPlJF4wSdimDoPU8hY3h
 NokvsTETmzoU0JuGv6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310083

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

This patch series functionally depends on below(patch 5/6 specifically)
for qtee service discovery.
- https://lore.kernel.org/lkml/20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com/

Tested on Glymur-crd target with tpm2-tools utility.

Validations:
- Get capabilities
- Random number generator
- RSA key creation, encryption and decryption.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      tee: qcomtee: Register qcom.tz.tpm service for discovery
      firmware: tpm: Introduce tpm-qcom driver

 MAINTAINERS                       |   7 +
 drivers/char/tpm/Kconfig          |   9 +
 drivers/char/tpm/Makefile         |   1 +
 drivers/char/tpm/tpm_qcom.c       | 371 ++++++++++++++++++++++++++++++++++++++
 drivers/char/tpm/tpm_qcom.h       |  82 +++++++++
 drivers/tee/qcomtee/call.c        |   4 +-
 drivers/tee/qcomtee/qcomtee_msg.h |   2 +
 7 files changed, 475 insertions(+), 1 deletion(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260831-tpm_qcom_driver-d21c720e73b2
prerequisite-change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014:v2
prerequisite-patch-id: 4dc81445c9baf36f420da8c2e2bed96e71b31a5b
prerequisite-patch-id: b487dfe2fbc076f4815dc6c73b9e68b0b78c961f
prerequisite-patch-id: c5df2b3696520a96f95b2d3535ed84cdc21cc315
prerequisite-patch-id: bbdd5327c15aeaa99ce9b74bab324a98f084ed48
prerequisite-patch-id: 07d9c4e9fe9fd61f60e3f35b30b9d81716f0734c
prerequisite-patch-id: 10ff88d87586f21f3cff3f72dbd21c27adbfbbcc

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

