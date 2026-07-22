Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9367E30C164
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703579; cv=none; b=SEVj7GlyP7SS5T9WqRpUGDNGWM6XVfTrSVGJoAikYiBrdJOIpQ5fOD1m/r33BycTfqFbwTODQrhO3D2JErv+W1IfLbwuTxxSJuZiYfzs6sbPYcepZKRygDMLKGCUGlGQUFVoyU3d0PmB45cqnbScmeNU0iD3dCMX/OgOqhpRqYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703579; c=relaxed/simple;
	bh=mJwLaHl0XbdPBY/iqlDmGPtITkUtXbqkAghaBDWPdHE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fbCoi1qxAHj/u2E318Qx3//WRBWV8iymctbrvozLaz3v/M7CV4dvk5ne93xVfc+3Oeu2JYX0RqakCYUifc5HgxGpiESnaGijhUfiyH2sle6bJ5iNPLhXJBW4jAwinBCZ82CvxB4geaKHxZCXt/9fXEYiuB4OFiRVZigUC3x/sW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+eSAJel; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UETfheyW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+eSAJel";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UETfheyW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53huG3917558
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KsbDzSYZT8reWZ8gT9o8dl
	pli9OoH32CDxAIlbVUcPs=; b=U+eSAJelUroELrxWtgTgDJ33G7gwfw75p02iJ9
	zSP2eLdTVPkm2DCH6lMdOcz45qb6ds7jJa8Y/uP/zKGnW4ekLpCS3MSsiZNcy+3u
	QgicV1tKWXFRiV1WZvSz8sk5YraYgQF5QAD8upVsYAR/HXpxlFxwq8KmcM7u5Soy
	4+zR1Qfmm5kkid4980Vq/6kN8OXX/H2nyN8nPNq97LDpUXRNe7og+aTL1Eq6LuIg
	TcKB3XTyqsJnsxq1JJK46FEkVHcdhIqCPrF+2uInKMb1DVPKluYOGW5bMcwExiQJ
	QBMa4YfS/IbNeY5m8NgtbWiwrbYcw+WZX29gqFl/cGSRoKFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6aammc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc77a6943eso216292675ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784703575; x=1785308375; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KsbDzSYZT8reWZ8gT9o8dlpli9OoH32CDxAIlbVUcPs=;
        b=UETfheyW+StLhTgu4Jrqs5ERpPNmGnmKbp+KZU5WDr6R6WSVBz1gr1gKEKtO5gYbAH
         UfhgEBHyCi46UMnq5uNgc50EcmP0OBtadTKkZxzbBGpviIuVUYRzl37eovyVIdfagGql
         /UIFCnkwWT5gswxzc9RZ7mfPZc98qGLlYzg+baxz4q46IsvFF0b8OdmFP1NjfUZAY8AF
         tIXbEAOPPUtG2/uWn7usYm1fWylXVb99MDXc+0as08IVicc7kGTAhOyEDUuzGHTrVkCF
         ermJMEi1Qgyu/wrvLN40VbfdwLIaeALZc/HNicwcAYICtnJZgVkEjaPCGDLSoU437iEf
         Yjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784703575; x=1785308375;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KsbDzSYZT8reWZ8gT9o8dlpli9OoH32CDxAIlbVUcPs=;
        b=kf+v5AlqHtwuSsyzqmmPeJgjh2qd/ohi4gMFsck7oSDt2WXIItjIeNslMtfvgLxzEv
         YLRRSX9AJ8HVjNEmr+nUrYoPCVgNDcxP6mizL1N4B2maZGMSz3Rslz0byueDCfoaY2Pk
         xkC6XMJljl09qhrKRY/2/LN6pL5/cO6vsRRg4f9Csg0bLogY0OGW+wErxsqMGV3wJiKK
         P98xt8WiZR6yFsaHWnfmfflXiliXijmxObrq7lYYWqO1RJtWGXgXhUce70IzOW+XpAeO
         H7J1UZFBAjm1tGP+s4yoFVljbUkUCkAR6ftYU6SA/Z+84blQ5fU7XxHYyGCmTuDSdNC4
         gBQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+vRDvZwiu8w8m2ZZJ9IYMNNNEZDD2myOf0+g9DHdoELHap8u9bVJ5VWsLkHt6SGYif5Qapnm9k5bo6XNP@vger.kernel.org
X-Gm-Message-State: AOJu0YzAavP4q/lXkexQMaq1kqSIbCMX048YCww7Go4fVRtHey1D/eV1
	/zBz/udGjwzg71dUXqlWqUC8RN5olEwe4HOb5GmrovUqreqVAsRG4liv+3MPpFExHPkT55coqgq
	3pK6c/oN3x+/f4CjXRw6vC0qpCkAp/DWoYK688SASLvW3h5C4xeRPilSM3zyPEFbbomuGwiqiFi
	hl
X-Gm-Gg: AR+sD113kuDTx/bHABQRtND1cRRctfxzmSOCU/gyfbgkj3mByEbBDaEd5Tc3tQAOcH5
	9VgX+URd5ESRE9lJ6ENz2EcjLwYfSSho20yj5970CTWl8npcPatUk5PDaEiSrkW9Fx+I0/+A/6x
	gqUaECt2PCWJvLqStXR8NBEcsn1sVBY/6rMpbR1mfNKsA01iHl5yrSyeX8JXnK/TqunzgYruYmH
	Ipm6OdkQpKlrHxrXH6hDCBEQDiiIit/8T7k48CSZl1H1CTfvJjakuYT8rMGpCujD3c3a87Q3XDk
	iSU6ADrB5KhWHAPxKteWcxm4Kw+szdupIolHKcLynJGW9K3WqPQL8m6wH9x4zgQWO3Rk19qdWwj
	xUSjHY34ZLepm5K+wWfh8Qup/OA==
X-Received: by 2002:a17:902:d590:b0:2ca:b89:7bcf with SMTP id d9443c01a7336-2cf3494b178mr230269985ad.22.1784703575012;
        Tue, 21 Jul 2026 23:59:35 -0700 (PDT)
X-Received: by 2002:a17:902:d590:b0:2ca:b89:7bcf with SMTP id d9443c01a7336-2cf3494b178mr230269785ad.22.1784703574520;
        Tue, 21 Jul 2026 23:59:34 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd88f7sm9428935ad.22.2026.07.21.23.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:59:33 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Add TEE based client driver for UEFI Secure
 Application
Date: Wed, 22 Jul 2026 12:29:11 +0530
Message-Id: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD9qYGoC/4WNWwqDMBREtyL5buTGxle/uo8ikiZXDVSjuSot4
 t4b7QL6M3CG4czGCL1FYrdoYx5XS9YNAZJLxHSnhha5NYFZAkkGEgo+adfXCzaWUKtxrHvbejV
 jffQzIhfXIiuNTBGEZMEy+rB9nw+PKnBnaXb+cx6u4mh/7hzyv+5VcOBNlpb6aVIDUt8dUTwt6
 hUGfRyCVfu+fwEARk6X1QAAAA==
X-Change-ID: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784703569; l=5231;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=mJwLaHl0XbdPBY/iqlDmGPtITkUtXbqkAghaBDWPdHE=;
 b=qUq1qoBHpI3+QPSh6KMqTSrLcV8U8ZAJea+9Y332ADeHbE0w82N+tQQW1LrkIblFQHRKSMdmB
 jHcP+GLvKCuCMiQVCVwnkywAWxzPFB/Nfi0JkIemtqR5TlZlyBaK0rZ
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX4ntMMGJdlj6W
 3nQ1ZldqyuwZXhkPo9XQrHcL4CPnrwpx9kZlslUSJNz8KN0CK62z70u0iszBuq49RANbqMaE59H
 8nU43s73NqVhkAijvUIK3RrOgLv+fYE9lk3AqoiWwGt5uK4FYb2z8ch6IFnO8ZO2rdibOL5/2/M
 DuICNhAS1rwzzPIH9PF+dlzAclJ0lB31PBqNuaL53yssGpJ6/5uns384rF+ut3gOqANjUE9IUjt
 43V1QCCg3wiNLZ3FAaubMbyzmSpH6yVKOt+oodB34BzqHqrQfteYyholZ0oOpgpgNLUjsgHNNlM
 n/wICxO+A0e4bl8WKxKw3hKM6zcADbgBxsx/ZWA5CO4qWmfl+PD+k5NBdqUb9exRoRr5Gpf2fue
 VNBgnaYoQsP4Hy2B9AHG99Rp7pkRs5hyXhjpwiNYsR9fRc3a8324gt/fbj9KywloiPxujWBAI86
 N/BkfC5z+LMiWympv2Q==
X-Proofpoint-GUID: MsaEOjKfGroZrPpbn-bG-hYQw1LwWMAA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX6lcdu9SS5/zp
 IOjTHZYDbtu3XEmCEuYtM9Vr4Nam+gIOp/C73WBsVrkQOdBvFUSR6N+bXRyofRdD+EHaXxNpmfd
 OyyM7yJRTYS+WVPOKzhU+ryr4Thtdbc=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a606a58 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=EPKcpx9xAAAA:20 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=BhHARkrmHK2z0SOGQHEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=ZT_8zCgGubuJgGonBfBE:22
X-Proofpoint-ORIG-GUID: MsaEOjKfGroZrPpbn-bG-hYQw1LwWMAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220063

On Qualcomm SoC based platforms, UEFI stores EFI variables within the
Replay Protected Memory Block (RPMB) which is only accessible by the
Qualcomm Trusted Execution Environment (QTEE).

For Qualcomm platforms without emulated RPMB support, specifically
platforms where RPMB is not located within SPI-NOR storage and instead
located on UFS/EMMC storage, non-volatile EFI variables can only be set via
a callback request from the UEFI Secure Application to the RPMB service
running in user-space (within the QTEE supplicant [1]).

Unlike the QCOM-TEE driver, the QSEECOM driver (used by the current
QSEECOM based uefisecapp) does not support callback requests. And on
certain Qualcomm platforms such as the RB3Gen2, attempts to access the
QSEECOM interface fail due to lack of support within Qualcomm TEE.
On these platforms, a TEE based uefisecapp client driver is required to:
1. Access cached & volatile EFI variables stored in uefisecapp's memory.
2. Ensure persistence of non-volatile EFI variables via writes through
the RPMB service hosted in the QTEE supplicant.

This series introduces such a uefisecapp TEE client driver for the
aforementioned Qualcomm platforms which installs efi-var operations _if_
the QCOMTEE driver registers support for an object-IPC based uefisecapp
service on the TEE bus during its probe. Only new QTEE firmware versions
available at [2] provide this support.

Thus, QCOMTEE now maintains a static list of always-available object-IPC
based secure services exposed by QTEE. These services are implemented either
within the QTEE kernel or within a pre-loaded Trusted Application (TA)
usually loaded by the bootloader. The uefisecapp TA is an example of a
preloaded TA loaded by UEFI. A static list is required since QTEE does not
yet expose any way to dynamically query and enumerate the services exposed by
it.

To facilitate object-IPC interactions from the kernel-space, this
series also introduces a tee_client_object_invoke_func() to allow
invocation of TEE objects similar to the existing tee_client_invoke_func()
API exported by the TEE subsystem which allows invocation of TEE functions.
Some suporting changes are also introduced to track and handle operations
for TEE contexts opened from the kernel-space in the back-end QCOM-TEE
driver.

Finally and as previously mentioned, access to the object-IPC based uefisecapp
service is restricted on older QTEE firmware versions. A new QTEE firmware
release must be picked up from QArtifactory [2] for all upstream supported
Qualcomm SoCs to enable access to uefisecapp service via the TEE client
driver.

This patch series has been validated on Kodiak RB3Gen2 platform with UFS
storage by attempting to read/write EFI variables via the efivar tool [3]
after mounting the efivarfs filesystem. See [4] for an example.

Merge Strategy:

This patch series could either be taken from the OP-TEE tree or the
QCOM soc tree. I would prefer it to be picked by the OP-TEE tree since
all except the uefisecapp TEE client driver patch in this series make
changes relevant to the TEE subsystem. It would be great if the QCOM soc
tree maintainers can Ack the uefisecapp driver patch.

[1] https://github.com/qualcomm/minkipc
[2] https://shorturl.at/zQU07
[3] https://github.com/rhboot/efivar
[4] https://docs.qualcomm.com/doc/80-70020-27/topic/manage_uefi_environment_variables_using_efivar_tool.html

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Changes in v2:
- Drop using MSB of the object_id to distingush kernel and user object invoke contexts.
- Introduce enum tee_object_invoke_origin to check the context of object invocation.
- Link to v1: https://lore.kernel.org/r/20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com

---
Amirreza Zarrabi (2):
      tee: Add kernel client object invoke helper
      tee: qcomtee: Allow object invokes from kernel clients

Harshal Dev (4):
      tee: qcomtee: Track the object invocation context
      tee: Export uuidv5 generation for TEE backends
      tee: qcomtee: Add support for registering QTEE services on TEE bus
      firmware: qcom: Add support for TEE based EFI-var client driver

 MAINTAINERS                                 |   7 +
 drivers/firmware/qcom/Kconfig               |  24 ++
 drivers/firmware/qcom/Makefile              |   1 +
 drivers/firmware/qcom/qcom_tee_uefisecapp.c | 525 ++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_tee_uefisecapp.h | 120 +++++++
 drivers/tee/qcomtee/call.c                  | 205 ++++++++++-
 drivers/tee/qcomtee/core.c                  |   9 +-
 drivers/tee/qcomtee/qcomtee.h               |  12 +
 drivers/tee/qcomtee/qcomtee_msg.h           |   1 +
 drivers/tee/qcomtee/qcomtee_object.h        |  16 +-
 drivers/tee/tee_core.c                      |  24 +-
 include/linux/tee_core.h                    |  23 +-
 include/linux/tee_drv.h                     |  18 +-
 13 files changed, 952 insertions(+), 33 deletions(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>

