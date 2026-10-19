Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF6D48382F
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401738; cv=none; b=cqL1HOcr3DlIQ/u2Ua4Lg4QGJP+rhVbttGN9IBYmAT3A7yAAC2KV7DMplxO1z1x6QZVxb8+jlFcIQQtF+h4ZwwMKIlA6a3ClLU2WSmBNb8Vc3T0we1p4yhWAKxvdkJiDohrfiaq6c0gaUCVU9Y1N/g/NWblgheGb2Te5EdsBFV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401738; c=relaxed/simple;
	bh=sZfaHMM3n5qSlA534Y36U/L686G77F0urff/+V3Q0fA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nftdSoZ1t2TYE/h0PkjFAu2FPFHn2zqfqhiw6JJoTZcagzJ0XFZ+ZNXuilhtxnTrXpIC64GT0ca8g7vzDquzUXdHPus7NNKjvadVkGhCeV3MQ5GxMpDapQPwNlfHICqx+QbP1djOUxfa2Nsn2H5cWT90izZQYXMpQAXVhsd7hZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WN1XRgXR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EywN0F1t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WN1XRgXR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EywN0F1t"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PCZT2193374
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6Dvi7s/V+FGzGTPgCS3Pqm
	rFxqHvRCvEqGteKv+AEng=; b=WN1XRgXR+1Zrz1gF1B+0zHkKHb7cbWLXtdiXCy
	wQvR383uO5sTAdbmMHwL7fEzs9HWsaob1vmtsH36L/Ncjof4URqknsMyb5jqT22q
	zciX/HSpeiIi3S6lM9AQXJhfovcbcDzhNffa2cWs0PM5hYYDx0QyKm2jp3hiKFMO
	ey2ma+nTi7+vfd8TmvuyxwXEJsagsMum8ksOnSUy3ml9BLN9H5mFsNp0HMGTFu0N
	/cs4U5xXLqQ26uFcEEuZKfw7jJBL+ln29QUZ1GTXNcc+7ZvzBtbJ2P77fgK5Yxl9
	JiSMS/k8aRZU16IT6aFAn1ZKSQY80qHS9Vr4B7jb8yAScSxA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1a0rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:22:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so6007559eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401735; x=1793006535; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Dvi7s/V+FGzGTPgCS3PqmrFxqHvRCvEqGteKv+AEng=;
        b=EywN0F1tVr213LpR58BU6I94cL4WxoVXouuAhwH9hNaYvhuJrWElj52R+aXDlc44ho
         h9EL7X/ZeDsyyrdi4M/AiqBa1SyTB7fD4xwYswA4Y+pR+2KhOw8wfmVG0CY+3yaynd9T
         /eJNQ8px7HOzzscfygJn9BUm7obK38sUxxSmLkoRuP7F2WPxmLyDRjXqT+/3+FrdL17M
         +UYVRzt7C1bdHJ+Y9YpDt85FuuuiI4Qh7GRQv5WPpDgb33kGE4sqYMRE7BUdpPblT/ME
         wXgM+XqUE/aKO63DjDWzMYH5kyBlH5fFQG4MgbKamrxlrZR7b+FbtSuGJRufUcYiIdZ0
         Ua8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401735; x=1793006535;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Dvi7s/V+FGzGTPgCS3PqmrFxqHvRCvEqGteKv+AEng=;
        b=hMxeVmiVc33qrsWrWGeORg4sRL4hWeujq68pjLV9ubSZrPZ1HcPoRaxoRMaf1Pi8zc
         ZKf/Q88wGeD9U5zCRanY4JDmjYZGL2TlzqBT1BsURptynePVdoMFhts0Tta+SWLoxQaU
         pui+oR7FmOTR68jyaLzNP/kapf5FybWITh4lydrbBywpUibTn2kwnYUTl32Xim4hzDk6
         ErWjv/QgyDC1cyPL87Tyz6jSSgwON7ZFllWKDoWjstv83ho6LisrBxdXCwyIlvjpecJ9
         Kc8X7n5gZDHrIaBKur1DSsEqW22MP3aabojtqDxDaR/BMlOsEQ+qNxAxaTSja5GWp+9/
         GtOw==
X-Forwarded-Encrypted: i=1; AKwUvBzjrRifZudJBjkbLN6eFFpulQ/htnalnKFOhKJDgfxGcJ96xg4qiexvqr6MUhEy6qB/BHrIkGXKYr0vWZV7@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8JkGYrX+kVqgh/zFByCL3kvHvRKuPbAwOPqHkdMjiTmSQY/ga
	fGzl/KnfyKE5jKJv2bhquV5h9l+t0MXdmiWIrd2YRhFh4H3Itxlo9oP857GNv1ptiTwD8ymmWzl
	kKwzpNhWaFdaWoQo7pA8aZWNA7CtQ3FFJzXFO/6HEzK/UhpckESJnyGDVxKYViIifh0ew
X-Gm-Gg: AYBFou3wt0EbKEP+JDlHITDpLCVLffGhvrDCMCrchO6zaLr1699UrmMD/lNYALU66Ut
	cz9yMui5+WZG532cR0Whc+M6VIZnJur5B1vhtEo6Pk5fomykS6GBgJEmFD8xtCAP4ky4MGEFLw/
	zhnLUEHa2j6H6NiJAnzmu5BjxBzxuzjmnhzg0VECf/E8o3GelA1L20JQHFsPResphCA7H9DpDJK
	Wr9maoEKIQ1QloxwqW13HcsnBpgXE2D55knxGZNO0Qzd6N0s7vNDTg1/i3rl7UlDtFnlurKGfdK
	rwwrpGuOthdjow7jF5jvq/rQGkTkJqx1NitSNfzs5VwfLdLiS2Yn0rTZLNhdjIUfrpgnBFApsa7
	o0xli64A1reBCAYmFMJSsSB9eJiRq+WW5
X-Received: by 2002:a05:693c:6311:b0:360:73dc:1e13 with SMTP id 5a478bee46e88-361a196004cmr11484956eec.17.1792401735196;
        Mon, 19 Oct 2026 02:22:15 -0700 (PDT)
X-Received: by 2002:a05:693c:6311:b0:360:73dc:1e13 with SMTP id 5a478bee46e88-361a196004cmr11484921eec.17.1792401734445;
        Mon, 19 Oct 2026 02:22:14 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm56225094eec.24.2026.10.19.02.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:22:13 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add TPM support via Qualcomm TEE TPM TA
Date: Mon, 19 Oct 2026 14:51:45 +0530
Message-Id: <20261019-tpm_qcom_driver-v4-0-6889b9804ba7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACvh1WoC/3XQUWvDIBAH8K9SfJ5FL0ZNn/o9yijGnK1jaRI1Y
 aP0u8/YscJKX4TD8/e/80oiBo+R7DZXEnDx0Q+XXIi3DbFnczkh9V2uCTCQTFecprE/Tnboj13
 wCwbaAbcKGKqqBZJfjQGd/yri4f1ex7n9QJtW5rcj4DTnqHRveyTtNiVHME1LxpytiNaM47H3p
 2ASluyESHmlZdOJGhkXu6Ve4dZEpPm69ylD6FplOHfcGNFBZ0HXDkFqZq0BsG3jFDgpyDrk2cc
 0hO/yCwsvM71ceOGUUem4dEY2IJzZDzFup9l8rtHbfBRygQfTMPXMQGYUN7LlqobO6BdM9cdwx
 utnpsoMCGU11gxqhvsp+X/M7Xb7AeMikvPoAQAA
X-Change-ID: 20260831-tpm_qcom_driver-d21c720e73b2
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfXysjFm8lYBFOA
 v0TGWjcq5FOEwndLKuJmReDjVuPYZmAoy0ASVK12fCxaD7ZAdBESZ6hBBgBwYKj6XzWDLjcEXIx
 IsrF2DU+ViuYXTrWNMWYaSwlrva1ubI=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5e148 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=9jRdOu3wAAAA:8
 a=b45o4kL6AAAA:8 a=xG2GeFPYwsRGK1jMldgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22 a=ZE6KLimJVUuLrTuGpvhn:22
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfXziUYwrjodw5H
 t89HEwZLhwfLgThYxTg8KorcrRl5ESpbPKS5moRlRScc3byGu//Ce3IxxmnKGlU6aNrxLQuORCV
 axRidYHDzPERtk724AK6JFfXfCB4Eg+Sbr2aj9pxJ4CH7RDZLrJYa/YwmY3nBYB/cq6RkbuGkuC
 C+4avfzDIkf48hbGAY29KpSpFlouvWNPMX3ptDgrusvTZztC392wf6e7WKoQApaaxwZlmLTc+mK
 15WYwoH3phktv9caku1LCcOTzkGA8YKZU6WqiunokfnHdScHbBAg1UPtuPnVHsUB8N5gFoRCptB
 /gHSNf6AH1eSKaVxAvJv15Gy/G2lALL0YjAG+MYa26iHDVEO3VlTp7WlswAcH1PvjnX0GQ+cBDy
 vvgyvobR48OIT1J3YuhJfLRvJ1ZEPZ4LxVRgGPD9GE5VvchAHk2YUV55yh8kYDZIibdCWd9T/4e
 VfUiMw8NR/gJnIqjFvQ==
X-Proofpoint-ORIG-GUID: E5XMfUCZKpT3luewQHwP50lJ3makNy1x
X-Proofpoint-GUID: E5XMfUCZKpT3luewQHwP50lJ3makNy1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190037

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
- https://lore.kernel.org/lkml/20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com/

Tested on Glymur-crd target with tpm2-tools utility.

Validations:
- Get capabilities
- Random number generator
- RSA key creation, encryption and decryption.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v4:
- Add new line before goto label(Jarkko).
- Link to v3: https://patch.msgid.link/20261015-tpm_qcom_driver-v3-0-247c8e50250e@qti.qualcomm.com

Changes in v3:
- Merge tpm_qcom.h into tpm_qcom.c(Amir comments)
- Update return values of functions and drop certain error prints.
- Define locality_arg as default value.
- Add Jarkko's tag on all but drop from 2/3 as significant changes done.
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
 drivers/char/tpm/tpm_qcom.c       | 414 ++++++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/call.c        |   4 +-
 drivers/tee/qcomtee/qcomtee_msg.h |   2 +
 6 files changed, 435 insertions(+), 1 deletion(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260831-tpm_qcom_driver-d21c720e73b2
prerequisite-change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014:v5
prerequisite-patch-id: faf4520d818abf0d7533f71d9c8b9a8aade34626
prerequisite-patch-id: b487dfe2fbc076f4815dc6c73b9e68b0b78c961f
prerequisite-patch-id: 9f2c4ee37ba173bdc860f253d44974379f2cf125
prerequisite-patch-id: e86905ac6289821db30fd9a17f73e276e0a88363
prerequisite-patch-id: 8777bfa2ef8344715bf972d049acb0a6ef49b136
prerequisite-patch-id: 1c7f946e770a1cbc1599f9571282c9265a6af9cd
prerequisite-patch-id: 7be993abea2ca36057d9352381a5890f50996dda

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

