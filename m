Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D33E2FD694
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852599; cv=none; b=qGjkbzjZhqxSecXO+qE1h5JBscJJIAKo3dph1t+5QRq2oLlqAyWWYVxg527zMV78SU/feNJqfxHpZUXLVCJoT4QGgu4rlKIqAOv4anF8ylg43ZBgUrQFMzeDdeVL6NhFpcDMoz/Pqlbdzzb0LImawhRLPDUYXXqavEr5CimYOw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852599; c=relaxed/simple;
	bh=rCkHgUNzH5D5IlD/fepvc6TL+xU2CyAfDB+iAEDgnQc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=foCxjzcVmmRifCCVkqEYQAZ4fD5kNCGrO1OfyO7SMIqWAVCLcvc1com/+UwYrnx/MaIZUq/rQbHJnFZvCWLZ6oTGxNHyZwCKX43D7rsSKiJZc5Yv2ENL/GRewmJa9M/QZeP2FI5YJ7P8QfKCpSuTSq4LuQ8i2ko3mxvmsuywG1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIquDs/S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cWgY/wmB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIquDs/S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cWgY/wmB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xPt52806285
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 11:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QRdRmNwwFb4C3q3OKptwmD
	oUiwXrWNwUfk5/d9yGdI4=; b=gIquDs/S1b8XApmIW/3KT4fJpQvaZZIj+y2rrh
	oZwXhZfU90rbkDIfx4FonZblBaX1RpbEQqrwcm7f+a8nyOB3ksVcI9BFmvV2Ot69
	fQRyX7RbbbP37jSAfdnDpXlv9uJiOMeTwdE++oDChLQGhebfVyX9r/kTa2mX5oSQ
	uPLczGQ8eU/EbJmrAHCLLeO1SRbSz296Fc4gx1l0WyX8SAUT7viwh7LjHANS9Ry+
	Puj5zg9t4Lmr8ZZ/Walwdta2p1M+RnW4ufSGoHrqIMbYAOGeaH4/3Z3zdEmU9Zxt
	EMRGUGIIgY79abLgRxdk+K504AwoF747A6oCyeOFR9V05GXQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkha1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 11:03:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so6710702a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 04:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852581; x=1791457381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QRdRmNwwFb4C3q3OKptwmDoUiwXrWNwUfk5/d9yGdI4=;
        b=cWgY/wmBYhZk6Ctl0YAyJMu4HnXZ6WftGqIqhC5CZ0PI3GpizsbjQUtvuZqBieV9VC
         VtUyfSqFMU2eG5WjpC1g1wttrfI6w71eonFeJ7Ku81mztczVGreGYgRbwY+3JJQEp9QJ
         9EkvJrSwjuNrQYaIthmenJnq9cZJr5InBwaJVC1KDnwAdmzQOqzOAFFpVcDJpDIk7Xnf
         9WABWSUE5OR/4LbVDYNqhCVfll6b+m0ax9l0CBnvPN3Vy1Yj5b/k91eTxVgl93VTPAzW
         BmIc9xdaDqrOM+Sw6fQ2hF7i+Qe+yzp2B+39NednsCdduHtO8vx/ro9ITglho/ws5Fk+
         c85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852581; x=1791457381;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QRdRmNwwFb4C3q3OKptwmDoUiwXrWNwUfk5/d9yGdI4=;
        b=r2qDcaeYvEIZo4xuBLpeOH+bA2SA9ulZt19q/RFDEQ57/o67OEO65JMfAdjHMIY3s5
         UUUsP08yZwXHv6ww7eKhPfWaFaZokHOrkmZ+e5Ftrt7ZD7fht7Eu8gFXN46Umg/t4bnf
         DYkHPvIgYz4iYQjWePT9/SQtOCFiHpJWeg/E7A/A3RwaVHHDT+DR9IkZHCRSHmibzct0
         4lyrMuzDJcxICazIidfWmyXPYg6rIab30ZVjByN1pRMIZ7HY8u8vFEsE31qYFHICtB/2
         8NDdWmIwL2O71syB2tgRiCu76Qu9cdFAWWSfFDmuNI54MltiG81/Z+VqbJj1DCz0d2CA
         hC1A==
X-Forwarded-Encrypted: i=1; AKwUvBwk1UShkLQb5TWNFWPmxwBIJPT7+lMQVdm5hqkCPHUMBzC3WxOUCZZ0untqhdYzCUNE3+HVBf6wO4AKuxCo@vger.kernel.org
X-Gm-Message-State: AFq9FYK8blU80bIltc6n7vj9B5bJLgaaxompRolrJkbAvyPMeQElGNax
	Az3MEg5R16WVifHNYu6jkjvI3vlxHZRfQiLmiMkc5XxzsY9IYtZibKagYJxJsnotDC8qwPz5Td+
	L+pmwNPFsq4XjItIt1ANwuKHuVhpYEPH6FYSpJf9Fsguf4avLsT9A7XdcP4ZPn2zLAvqJ
X-Gm-Gg: AYBFou3vndVyXuIAyv8OLxrYX98TsPP7fcx3lVTYESb8IHi1NjKsqDF4iPsIE36NZ2M
	zo1JZit7ACSbMPo9zCtWZlKY2V39pHmVxj6AZnXoPyy+tFF3XP4Id4jVrWWhGSyVYY8ovWyAWWy
	S9fRHQc0TKtzVFoq47+WV6kNK7tUwzMyT05nizMfTl1rlNvCmRZUnJQo5ohxLRVOHChFgH0bogx
	7Fmhnt3N/4KFWeKZ/dn7T4tZH7l93+gEQJY/yWfVS3HScfd5nMAPwltnfzaxpU9vlU+xk3zCS7z
	EsjLeAy/n71yjV2wMdXsFvSAWQg3GLhO7Q5VKzNqSRmoBx4OXtNk4OfuHmSqSY5DDSQqRsFmwwU
	U9jJ3vcFERUWPx5sKiT7UYLItsA==
X-Received: by 2002:a17:90b:5101:b0:3a4:71b7:eb63 with SMTP id 98e67ed59e1d1-3a4d14ed8a4mr2545175a91.10.1790852580395;
        Thu, 01 Oct 2026 04:03:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5101:b0:3a4:71b7:eb63 with SMTP id 98e67ed59e1d1-3a4d14ed8a4mr2545134a91.10.1790852579558;
        Thu, 01 Oct 2026 04:02:59 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4371383sm4076810a91.2.2026.10.01.04.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:02:59 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH v3 0/6] Add TEE based client driver for UEFI Secure
 Application
Date: Thu, 01 Oct 2026 16:32:32 +0530
Message-Id: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMk9vmoC/4XNTQqDMBAF4KtI1o0kMf511XuUIjEZNVCNJhpax
 Ls32k0XBTcDb3h8b0UOrAaHrtGKLHjttBlCSC4Rkp0YWsBahYwYYRnhpMCTNH21QKMdSDGOVa9
 bK2ao9v8MgGlSZKXiKRDKUVBGG7qvY+H+CLnTbjb2fQx6un+/dk7yU9tTTHCTpaWsVaoIlzfjX
 Dwt4hkKfRwO2ic8+2EZO2dZYOtCFI2sgTNK/7Dbtn0AovHekSwBAAA=
X-Change-ID: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790852574; l=7438;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=rCkHgUNzH5D5IlD/fepvc6TL+xU2CyAfDB+iAEDgnQc=;
 b=7nX9LIGWYk1iH32OLso01l16H7t7GogmKOIdd6tNot+33kEpBu9tLBU49IQquxLL8s/r+/Xkh
 gOF7SbpV+E1CZIY/BVatdb991kme4b9qlBIXCsyI27E2QnTe4po4T6w
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfXzB8sGGkSG6e9
 PLGBKU5OzonRa7/1IJOn1LOg4rRNTIWGoM+PQummN30d4q0B3kwxFs1GGOv6Nv2Je4fH+DO/xB+
 48wPHL5kvjr9cetxUgYfJEHYC60Lf30=
X-Proofpoint-ORIG-GUID: GYux_qJasxOln_ojj0DLYZd1L2uqGFKN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfXx2Eq7X2xa7Td
 Tjv+bF5CJhQqUNhaqWXlm44xrZtDrNv1dO31FeoF0F3bAV7QRoBfCMN6R1K9yuSBDHwyU+CA7Gn
 I+c/JZ7Ak6IpsF7mjUhhn0G0iIX10jATtg9he9Q6LZXu+OzylV6aJ/2YBO0/U+fQUifXPYQmJuo
 KD6vqcC2ZacDjcUnKcfGJ2e9KbA+fbUyosw2vnfsvIJalFXX1DBQpv8qgIhnJo7Vu+AAT4idXIT
 QZaOBTxjZg2BHJyYLCAPQ0S84Jdh/JV9775qUEVLchBI5FSw4+1VwGU+EA8urmIfjQl4To/3fzz
 OkWFPZoWbCf1oafPU/pgDr/spj3wC7Wm+Ov2lgJUyhCY2Qj0K6rJO2y1Zv9EKhuaPg0mnPrQbc9
 HWRUQoWLPyk3ZljhezJieYpBGEnkaAyW4o/x0NtDRj9/jvA7kdzs3zIoLyip3pjFbMeBNZ89fMq
 w+ig+ZKCQ7162TAsuZA==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abe3dea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=EPKcpx9xAAAA:20 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8
 a=VwQbUJbxAAAA:8 a=_oFDGg79Q7pfAgulZHUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=d3PnA9EDa4IxuAV0gXij:22 a=ZT_8zCgGubuJgGonBfBE:22
X-Proofpoint-GUID: GYux_qJasxOln_ojj0DLYZd1L2uqGFKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010043

On Qualcomm SoC based platforms, UEFI stores EFI variables within the
Replay Protected Memory Block (RPMB) located within either the UFS,
eMMC or SPI-NOR storage. The RPMB key which is one-time programmed into
the storage controller to allow authentication of the RPMB frames is
generated by and only available to the Qualcomm Trusted Execution
Environment (QTEE). Thus, only QTEE can prepare the RPMB frames which
will be accepted by the storage controller.

The legacy QSEECOM protocol used for communicating with the QTEE is
deprecated and replaced with the use-case agnostic SMCInvoke protocol
starting with the Qualcomm SM8x50 series. On platforms where the QSEECOM
protocol still works (the QSEECOM driver probes) the driver does not
support a listener interface with QTEE to enable writing of non-volatile
EFI variables (via listener requests to Linux from QTEE) to the RPMB
for UFS and eMMC storage. (Qualcomm Compute platforms with SPI-NOR storage
are an exception to this and work with QSEECOM, see the NOTE below)

Therefore on such platforms, a TEE client driver (which communicates with
QTEE via the SMCInvoke protocol implemented by the QCOMTEE driver
registered with the TEE subsystem) must be used to update such EFI variables
through the RPMB service hosted in the QTEE supplicant user-space daemon
[1] which forwards RPMB packets to the RPMB device.

This series introduces such a uefisecapp TEE client driver for the
aforementioned Qualcomm platforms which installs efi-var operations _if_
the QCOMTEE driver registers support for an object-IPC based uefisecapp
service on the TEE bus during its probe. Only new QTEE firmware versions
available at [2] provide access to the uefisecapp service via the SMCInvoke
protocol.

Thus, QCOMTEE now maintains a static list of always-available object-IPC
based secure services exposed by QTEE. These services are implemented either
within the QTEE kernel or within a pre-loaded Trusted Application (TA)
usually loaded by the bootloader. The uefisecapp TA is an example of a
preloaded TA loaded by UEFI. A static list is required since QTEE does not
yet expose any way to dynamically query and enumerate the services exposed
by it.

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

NOTE: Since Compute platforms do not have a firmware running on their SPI-NOR
storage controller which must be programmed with a RPMB key, QTEE has a
SPI-NOR driver which holds the key, and so the QSEECOM driver can be used
for updating EFI variables on these platforms because QTEE never makes a
listener request to Linux (QTEE doesn't need the Linux SPI-NOR driver).
Such platforms are outlined in the following static list [5].

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
[5] https://elixir.bootlin.com/linux/v7.3-rc5/source/drivers/firmware/qcom/qcom_scm.c#L2302

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Changes in v3:
- Updated the cover letter and commit messages to highlight the following:
  1. Only QTEE has the ability to prepare RPMB frames since it generates and
     holds the RPMB key.
  2. The QSEECOM protocol is deprecated on new platforms and so this series
     migrates the uefisecapp to SMCInvoke which is a use-case agnostic, transport
     focused and easier to maintain protocol.
- Use single if statement to update both flags and addr/uaddr.
- Remove redundant use of new error variable in qcomtee_get_qtee_feature_list().
- Minor fixes such as concise error prints and use of better error codes.
- Fix a double free in qtee_enumerate_service().
- Re-org the qcomtee_enumerate_services() function to re-use the same oic and
  client_env object.
- Remove depends on !QCOM_QSEECOM_UEFISECAPP from Kconfig since both drivers
  can co-exist even on platforms that support both QSEECOM and SMCInvoke protocols.
- Update the Kconfig description to better help the user understand when to enable
  the TEE based uefisecapp driver.
- Removed qcom_tee_uefisecapp.h file and inline the header in qcom_tee_uefisecapp.c
- Rebased patch series onto the latest linux next tag: next-20260930.
- Link to v2: https://lore.kernel.org/r/20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com

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

 MAINTAINERS                                 |   6 +
 arch/arm64/configs/defconfig                |   1 +
 drivers/firmware/qcom/Kconfig               |  31 ++
 drivers/firmware/qcom/Makefile              |   1 +
 drivers/firmware/qcom/qcom_tee_uefisecapp.c | 636 ++++++++++++++++++++++++++++
 drivers/tee/qcomtee/call.c                  | 206 ++++++++-
 drivers/tee/qcomtee/core.c                  |   9 +-
 drivers/tee/qcomtee/qcomtee.h               |  12 +
 drivers/tee/qcomtee/qcomtee_msg.h           |   1 +
 drivers/tee/qcomtee/qcomtee_object.h        |  16 +-
 drivers/tee/tee_core.c                      |  24 +-
 include/linux/tee_core.h                    |  23 +-
 include/linux/tee_drv.h                     |  18 +-
 13 files changed, 952 insertions(+), 32 deletions(-)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>

