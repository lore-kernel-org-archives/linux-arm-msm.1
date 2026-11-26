Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677349;
	b=nQZrrJScWbjeg0dNxMz3c+kCsq1+R9c/jKLLH6lq32aFoTKU3n55EDLGad9Z/sOL8UXm
	 KCJhf08bVMEDE6JeOaSjwwLUi2mzAMR2Y2tpp0GQ78ffZa73gRIUsyrTREOU2yVVVN9IS
	 KO1mBsR4qlquMIZ9G1NYcYYMLsVujfW2XZayL8jAZPrTTboZQsvLz0Vms6TIufD5EFjL0
	 6uvVEgaTuIYBfg7jZCu9WSZj1hE9cqa443RRMmaiJ8rII4kDsK+ymebsbHZMPfWDmQM6G
	 Yf/ufLA4ee5jETNSem5wgqhsHfy2UJ4NPSatUdqEiqLYTzHt2aTt39Oc+/B7eG50HzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=u11oCqIyG/ivFyMcZHBSlNBie4mmMzkTAfZjgV/WyKc=;
	b=j4Ja0S+cwTKzSj3cWpVUa/KppP4WDyYCUVmDD1FcJEAXPgqLRHZ8T4YiUxkXDXiqY6Y8
	 aRuTdNbC7xykjTv397vryxkVLNlzLXAOxA8SD85DnfeeFCKUI5dQVcWuY/thA8EDKBNG/
	 +AUFFvx1CgND4KZ0Oah3bXkal6jCrk1kV0gLyBijMtM1YV3cF6uDM7SeH4BR5yBDaLO8k
	 jVY0GUs+WRn+qimxJ6DNqXwxeBUTU3MMS6WS/IXailPvSmUQLVnCfLJIETzFZ3Vp7WJvm
	 z79Hos7B4uRjNmabKBMnUGcD+8eJu7Mye6y0XxGT1WzEBsYnnpR9FO2h9BCyoPHA+aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jj0lTIh4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNnT6vjx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05437606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05437606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jj0lTIh4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNnT6vjx
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BClv695327
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u11oCqIyG/ivFyMcZHBSlN
	Bie4mmMzkTAfZjgV/WyKc=; b=Jj0lTIh4XACe/uOSX2TeYKSUr/MyJUXlDu4iGS
	HPo//GpN23LrEkarB39SIBAL/dKQN/dvH9rNj40xkz97gOSUEvNXLnCkMtE8A9ht
	2iObJDblEsFb3VZuCvIhf1p5R8VDmKaBfPXvQpYaLV3Ddlus8kDMDvTGudiWoL32
	JaBlEeFXdVPGr37S57YJe8tv9Apyp8u+FrrMJRn77KVDCmwfkZH7EVXlmMEF1XmU
	UzBcS5aT91le+wn+kH+7MYtn4tcV+l1zcl5GCfUT3QdGM5lBuQbt3wXAA4n/dn+a
	9uVCTDdXv9o4AJ5RPIc2iRWlt71KB7kyj5megYLHHW8NwalA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7r2jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:15:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b5e3b5daffso1560785b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 23:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795677347; x=1796282147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u11oCqIyG/ivFyMcZHBSlNBie4mmMzkTAfZjgV/WyKc=;
        b=WNnT6vjxBqgauKvXF8MVt624Uq172vLssvDu11Zu71TGm5CUPv/RQhwGDjgezPNQF1
         9OCpapfLy9Qem/Dp4wzaDoXdu2crEpGVguu6ypwTKD/lBCVhgCaeiVtpCb3+skAy4jtN
         7oDgXnb9y4u9oGwi2jT0Yux49nOzILUlmc4rQDea6lM3+1uQ/eforGLv8sJqJ0I5rX/O
         CASnIaqy94vYiqxjBwe3TJBwQufFk/DCW8stXjSQDM6/Ub3jf05awRwKKe2FG7m8O+xQ
         fyZsP2jMHQrFU0TJ7r30TFq/N1jlEeUric+BVwNkA859N+gPODoOqOBmJ9tfZXUvgdf3
         o+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677347; x=1796282147;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u11oCqIyG/ivFyMcZHBSlNBie4mmMzkTAfZjgV/WyKc=;
        b=FDcveCqmEaKCOAJq457f43CRhpKloE0lL3ZMpXUB4xwUo9fx50ufFJL2wF1NYKwDp9
         uBDyzdHmprEnAMjr0AYrkrZQDQYSVK72p2p3IrxjnltopZINiUQJ6tPFuoOqt0bghCZu
         dc8IlgFVbFYQPpgDB8VJ10H4r4TXf4gUHldUlNGaljJaVJG2pXNqZj8pj4/sBN8fZcCf
         siE332FlwdZwWC70Yf+iGZXZu0SoQUx4GJeCms3LM0SMtn1J4kDZN3E//H3AB4LEIzzK
         kiExtpy9RIZF8Ym7xk275l003aH+wbG1XtmXK5AjV572LvP1I98LFdzRkQ2VB23/lLCZ
         nbUQ==
X-Forwarded-Encrypted: i=1; AL+hErGiv9p1+m2Q8ymwNEuGAR7xLfGgrblTvh+A9Kyc8tjNi4YK0AZ6HraLsntqmMJoTC5vS9Ttsjn5ZkdoYgBl@vger.kernel.org
X-Gm-Message-State: APuU4Z8UX5esaRrSScc59kYt4xeAJdK+blY8IskPm6oGDHbzYjwTydp5
	oFBBKH0XuftqxlbG4QPFJ8mCX9q2oL01/yg5Q1BP9NTYJfhhhTaLgzjm5Tdx8WYEgnOXWZ2IsKW
	hSqLxL/X8fzWon8gIC5UiOsiz4il40xxw5UAWFM8+fTSxkEVtsNtS3RIqVupiTSYhgHgm
X-Gm-Gg: AZFdTZcPbmXxo8G6/e05oJAdg69E8ZJbfSIZq2Y9XBA4b515D4b0ZLVIh9fwvcH99v2
	53PHjheaJVbsL/PSAYPy7Obr08d7DXcARLd+jXjHT/RhhJkl2PcibviqTFZ3y0KEScRmaDqEbsY
	j4b6whDdWS9I0dYXTU5XorXFWKjEeTd9JbBFLGobxpGj/KxTUfnhxsFp76epGNCefld6BXyimvT
	4eK+ph48dyOb+L2Dvz5BbJ8PSOfc0nTVCZFVfVPDQQhXPnOHPkFROyX0UBEJrdAA4U5TKn6zhaO
	dERDLjvIFyIdM88sHozS6clLW/NKfNUsfyL6Yje9B42sBtsAnZBCfrsbYG5/bOVIRW/DjALmndi
	elP4pjNwNzdpiGcjWaULGiMM3/OFNPRUKNv1EqWtuaZugSln61jF3ooe4rdI5MP0sq8JE969UM2
	Nq+DL8RqP9Wo/4PngE87iXZnhdNp+y8wM+6y8h9deEsS1z0XHQDXeo8pU5gm+M
X-Received: by 2002:a05:6a00:1253:b0:8b5:7fc8:8679 with SMTP id d2e1a72fcca58-8c87bcb7868mr18843481b3a.21.1795677346837;
        Wed, 25 Nov 2026 23:15:46 -0800 (PST)
X-Received: by 2002:a05:6a00:1253:b0:8b5:7fc8:8679 with SMTP id d2e1a72fcca58-8c87bcb7868mr18843458b3a.21.1795677346410;
        Wed, 25 Nov 2026 23:15:46 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm10050690b3a.26.2026.11.25.23.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:15:45 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add Glymur OOBMSS support
Date: Thu, 26 Nov 2026 12:43:53 +0530
Message-Id: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADHcB2sC/3XNQQ6CMBAF0KuYri1ppxSpK+9hXMC01Rqx2ALRE
 O5uwYUucDPJT/68P5JogjOR7DcjCWZw0fl7Cvl2Q/BS3c+GOp0yAQYFUyCo9zWNfdv60NHz7dX
 0gVZK5bKSAsoaSXpsg7HuuaDH0yfHvr4a7GZpblxc7Hx4LasDn3vLAGdMrQ0MnDKqCsTSWkSjx
 cHHmD366oa+abJ0yLwzwI/E5aoESdpxmQtpJWi9+yOJr8R5uSqJJAHW2hpgpZbFijRN0xsSuX3
 uYQEAAA==
X-Change-ID: 20260923-oob-support-glymur-a9945a5328bc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795677341; l=4254;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=0hayMi2ePz5Wnp8iOQqLdAIxXv7N34pLc8cg8te4NU0=;
 b=VMApR360+JhZW2V9+I3VI4uFr3dKZCCHnDfD2nM7xCwCKNx4U5MorfbKwsKEDzPKUvMC9hk7h
 tZ2aFIYwxOpB3qrgwmi77ICbrUpLob7k94Q01VGrZUtROjnWZJAKMyA
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX0ku/xXvXc90O
 0enQCG2Fu+d7LD7aSJfmG+cfZdkvxBkB9PS8Mhn8aVREHrDuVQlq82e7yvCqHQouehIKiqqlzqT
 /c9EzukQ0EpW9STmgM2O1wGQwoqkMrM=
X-Proofpoint-GUID: lD9G-r7ltUXyUAj17QTLP61k6p-hvlnn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfXyGbhX4WHy15x
 lH5IXWZltNFX+yy53bV4NpvFd+JYz91clDvFXDFjs46VIwEIh2kwmBG2axo4rQefpTc5L0xvSe8
 eYzFAZNS21cQxZtNQAYyPRsPcjlIlKehbYQGK1WEAW8RloiAoAvUT9j5Lxmno+upQv1U63iqxFm
 e5dkR0sW3ccLylgHdy0H3QtKtaVJs4ZsqEjxArUve4/C6XRYLaDjf1Ov1hWjF4ic7zdZUmWXXU3
 D+oqjFbOuqNxUBHNbVlAs64HdSrHVMstQeIdJzJGTv6qaXRMDX/foecJ+lxpr5WfWvxScjzsTMB
 0nPhLTMtO0/ceUmKsLdH/qjc8hnxbv2AVJKzD6FMGKEfzocaU/dZcTTZWpsw1ZHMd3ROY/Gxltv
 vovdAAPp36xEzkd6vG3u07DnzeJSLPgIua5L5mUtbhavAtfXQQauP/Ev0eVzUBBufVyBX/mm/E1
 egdlOTYEq3dWPCR2uOA==
X-Proofpoint-ORIG-GUID: lD9G-r7ltUXyUAj17QTLP61k6p-hvlnn
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b07dca3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=cAW_sDYG8GF9HDSd8bgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260027

Out-of-Band Management Subsystem (OOBMSS) is managed by a common remote
processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

The series adds the OOBMSS device-tree binding, generic support for
secondary images, Glymur-specific PAS parameters, and coredump support
for PAS remoteprocs with secondary processors.

The OOB diagnostic path also requires Diag Router support in userspace.
The related open-source work is available at:
https://github.com/linux-msm/diag/pull/26

---
Changes in v4:
- Shut down previously authenticated PASes before unmapping their carveouts.
  skip the image that failed authentication.
- Register secondary dump segments during firmware parsing to prevent
  duplicates on crash recovery, with cleanup on failure.
- Link to v3: https://patch.msgid.link/20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com

Changes in v3:
- Release auxiliary firmware after loading and on start failure paths.
- Shut down the secondary firmware and DTB before the primary firmware and DTB.
- Allocate DTB and secondary PAS contexts independently.
- Continue primary coredump collection if secondary mapping fails.
- Register dump segments from firmware images instead of whole
  carveouts.
- Move secondary dump-segment registration from probe to firmware loading.
- Map PAS regions only during collection and unmap them afterward.
- Place the Glymur OOBMSS PAS entry before the Glymur SOCCP entry.
- Add Reviewed-by tags.
- Rebase on v7.4-rc3
- Link to v2: https://patch.msgid.link/20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com

Changes in v2:
- Drop the redundant “binding” from the subject.
- Rename the binding file to match the compatible.
- Remove the IPCC definitions and invocation from the example.
- Make the coredump commit generic for PAS remoteprocs with secondary
  processors.
- Shut down authenticated auxiliary processors before unmapping carveouts
  on start failure.
- Release TrustZone metadata on all MDT load failure paths.
- Assign secondary PAS IDs only when the corresponding firmware names are
  available.
- Keep PAS carveout mappings active while coredump and debugfs trace
  readers access remoteproc memory, avoiding a use-after-unmap race.
- Support coredumps for relocatable PAS firmware.
- Free registered dump segments when removing the remoteproc.
- Move the Glymur OOBMSS PAS parameters patch to the end of the series.
- Link to v1: https://patch.msgid.link/20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com

---
Anvesh Jain P (4):
      dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS
      remoteproc: qcom: pas: Support secondary images
      remoteproc: qcom: pas: Add coredump support for secondary processors
      remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters

 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 370 +++++++++++++++++++--
 2 files changed, 489 insertions(+), 35 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20260923-oob-support-glymur-a9945a5328bc

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

