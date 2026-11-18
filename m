Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016258;
	b=g7n6+1AlFEmJO5AwwwFf0GvjFTsVQVfptaGZM9/wK/hgIJWl8xsHWTKyGmnGq6fw0X/I
	 qn/D+zQI5Bzy0aaoBKr/mtF1FhAj9Ry3M4QjWlPmCpMJgH/sYwGqseZJSoMbOZlxaWZxT
	 bz13LyRc1n9AeV+blkupvzve8gzyzSI4VTD3vVgFPHgdNa4vjCBYzSRhy3irCkS6mvpNG
	 eUR/neHsvq2v08BjK6MBBUBLMcjpN+w8Y8VnwU+IdL6lXxEdDbbt2qNlCm219DffH3Izi
	 zYLA3FmUT+FQTtLSW/bI5Q10QNHrtT5OuH1GY9x6KEnBmAyPyLGHPbqzGyPHyftvZ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016258;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E3TVw8XJ6Rg5jWJLudhPiQZ/2xLyIljqKLMLiG7k+vI=;
	b=D2TgVv7YDqx2lv2D44+pbURPhiMY6GZ2lyhvKYfYMk6UVo4BkBm0UNZwojw2LTDozlp1
	 m+L1AZH6aSC43p93M94buQXEw8CuDa9cHz534tl2mfQlimvIlTVMkIot9ozTkXGhOugM9
	 0aCY2r6J4Y4RknWielWhDVBZp6ffLLsme2NR7d2IDsulysWk7wvrPsfFrus+RnBHQeuF4
	 tocb77ELMAAu7Pusb1kNyd6d5jsk5OzlvU7TYclXBp06d0eBg1roGJcZOmVHX0L3CIsXg
	 wqTfrNB4AVXy3/zWzkr0JP8pangQGBZxorXuQ5Sw8nF5kGeJa6zFisaRMwB3wdHf0Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="X/CR0GMr";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMcXPcL0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9A5606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B9A5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X/CR0GMr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMcXPcL0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIEqIXO072321
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E3TVw8XJ6Rg5jWJLudhPiQ
	Z/2xLyIljqKLMLiG7k+vI=; b=X/CR0GMro5+Da6Ax6Osuc6gXXRvITTq8xDucFC
	YBi4kZsTDQUiMgT/0m3sbVbCajChLRpA4N7lD1WN+dkVVPXlF+m0vTZQem6XbMXB
	yUmAB7mnmcWS8INQhLVigfxHU9oW97PbdSWxFgO+5X5p8CO+3FTHmIU/Ytqd/P/R
	ZbCsyCHwtGWiAqqy3U7uDgeLIEabFjLrxiQuWKEPSWrq7ipwCgJTWghD5kmFJQmp
	QNZheCfc8ofLgOJgudyNvCno4ExJsBSjxxSQ8Wfe/hkLZYa1605kvaBFMB0L2lOi
	KRYK/GJqVK8aJO0mEXquzIcb7LCMBVjS93XjOiykPxy9LKTA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qr6pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:37:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9211c1e159dso11086356d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016255; x=1795621055; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E3TVw8XJ6Rg5jWJLudhPiQZ/2xLyIljqKLMLiG7k+vI=;
        b=gMcXPcL0AbAkUDKCs5qkEaRp0EVX6Jzau8tQuK+p89HDqQYRmhwlJpZ0fEQIK8jd1x
         RS1wsKEHyPVw4u4kWYPFHURmnh0Geq0YjVBvYiymG0j2dGOEYdQTmZphKi+vegkT/LZ7
         ZG5AybP+GdWsSngcjXdQgwdoxC3yjhXdNxonRX6nAadk6csKdwVS/Ur+3Ls8up9d8fYW
         YaV3X3C7R7OpXaOVJTZIv2gBT2FT7SDZl51kK+Sroz9IJ6KirJor6jUG7HzzvsGYtLxw
         yM1SQn7xHE8wT2stzd2SCHw/+KXUZqTiNlNi2T/fbeauvTzWh6S830a4kR4+b6hLDtBd
         HgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016255; x=1795621055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3TVw8XJ6Rg5jWJLudhPiQZ/2xLyIljqKLMLiG7k+vI=;
        b=b90fzSK3BIA2ycqCmMXX5ugMr2kQkQBx1Q1aRmYjCh+KV9Pn7f7TkJ49384EhTU9/u
         r3qN2BXGZTyW8pmqG7o8PK7v/SgTFQkT2nW5ZrvPfE/o2yECRdk6BjqtfxNxehohG6yX
         r/3e9RaBV1vydyw5xFBXWUQkq43VWsELM0/ZknT9ODUW7Q0uSUz8Mifdie2K1IzUupUl
         JcBy95c3Ys4NkHN+wwFS0T30ceaiD6JblpkmfbQ3D2gX8vY7r07JAkzmQ7XAAdhdXWAr
         ODHAqfd/j86zYNMhXPEN6L30uo4qeVdWY5WSbCPDjyBlZNIvDt//G/D+BXxLWmqIqWNm
         sQiQ==
X-Gm-Message-State: APuU4Z9dFpLoTHOW7yoJBlfKF45gX8FJo89hFLI0Og/lEHAbdy2QooRQ
	yAkC2xu/K9d6UUClcfSshBKpruhjuYdsPenK3DXGEMx45DToZpfqjyweao9kPkQO4swDd1r/0me
	5JkM1nnljIMgfmrWbG7Jl/+0RnMPMBSiEH3DNOn8BieEwGQ1i+wkiMJKgraVwsghNx4sg
X-Gm-Gg: AZFdTZcmIy/x9esgYjTRqMxvYDmXAzEfExM4E7TYFM/ohOEFbbmZ9+zeulTF1czJhAC
	mY9Fl8g+wRGttBA5hV0ejQXJ0HRa5c4tHKSaDwAIGSw6RxuuOs2cznRrhZJ5Gslk1cVrMRnn9/f
	hNykw336FOCqTme4FAnywcmPMxw9IlINLOBxwUxTwsr9fmSrUslHZCQ3r+Kym+zWGa74ucfrEN4
	OBt90zngBOLc2MSpIoUqlMRjU1fYc8+k878KiRHVVqAwUHXQ8JH+l2+LQ+v1MQMlMAy4H8TbpBr
	RPynA1xpbrF2loumkjkx5QQ/Di70elj39+T/rg08gvcIuOex7jBQtyt+KLBId9lE7zCSexSOksq
	/k8bbfhNAlyMH24/5OECQhuoGMh0w7edJtEu9fFb6DDJpjAIM//97xGPEwsqEmwBZMgDuZxwYya
	qcdT8+JkXOqjQR7+a1eodlvJMg5gAV4S+7E+Xi46pMeNA/pgpSp/7J0UYfUqJi
X-Received: by 2002:ad4:5de3:0:b0:91c:5fd1:b334 with SMTP id 6a1803df08f44-92114e9e201mr45357716d6.54.1795016255261;
        Wed, 18 Nov 2026 07:37:35 -0800 (PST)
X-Received: by 2002:ad4:5de3:0:b0:91c:5fd1:b334 with SMTP id 6a1803df08f44-92114e9e201mr45357196d6.54.1795016254790;
        Wed, 18 Nov 2026 07:37:34 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:34 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add Glymur OOBMSS support
Date: Wed, 18 Nov 2026 21:06:41 +0530
Message-Id: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAnG/WoC/22Nyw6DIBQFf6VhXQwPUemq/9F0gTyURsWCkhrjv
 xftpgs3N5nk3JkVBO2tDuB2WYHX0QbrhgT0egGyFUOjoVWJAUGkQJxQ6FwNwzyOzk+w6ZZ+9lB
 wnjPBKKlqCdLj6LWxn0P6eP44zPVLy2k37YvWhsn55ahGvO+OAEaInwUihgjyQsrKGCm1oncXQ
 vaeRSdd32fpgL0TyZ8Js1MTSaYSs5wyw4hS5Ylp27YvcjrRIRcBAAA=
X-Change-ID: 20260923-oob-support-glymur-a9945a5328bc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=4276;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=sFemIgyzO9lvPSe4UIL08ftNFBoZLUN3QQqRlbQQp5Y=;
 b=1ozoYVmO6bY6Fs5ARJ2bx6yNupGqbXe3ZChbQtawMvzHdate8Qoq2G9NXzPPzUhKVBuSETj1W
 xHSEBnMjKtxB5Dn3azS9pgjEhQ+mQZRin/da7Gghg90WhXw2L2XU9Ep
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: av8gHw7PqA-8xZqjELnaLZ4ETaUl2Eq9
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afdc640 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=cAW_sDYG8GF9HDSd8bgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfXyJFw4scQHv3T
 +QDpWqqLMNb4m8pDpyY8LHA7AAHeJC48qXDHgrtRNYfSLdUjgC35MGKC/x/0ZNW3rhJzo9k0ww1
 i4HPdZzhYBYdB5jVq/5WChEcUUPE2YQ=
X-Proofpoint-GUID: av8gHw7PqA-8xZqjELnaLZ4ETaUl2Eq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX6kU+FxH/4FxH
 K7GvbqkgbBgByc4xOENssRdtO62Xx2wVFKPzpMixEgMIftCilGFdBEtGztQ0Ub+4nQOqtsfWZN7
 xVLKcT+VZtFwV3k8WE1ACrHgV50yBK4j1EZQAWDOrMOq6eFPFa+RzhDZCYDe/zU5DjMRAV3w3Su
 zQjYAECnnNNF3Pt3ej3vzpXk+l5wn2Q35M+/gT5SY/SPWfMpVFb4mEOaIWq3qATHWv4XDa/wWSX
 7vwHPBc3JQUyzi6n5v3cRODFuFgF7bvGnWIJWvBi4gCgN620KM0oxBJR7TiCR0P7YYFrKdO33sw
 cC4hkKQY5vougEcwFbV9LxGKcO240+MHTXdl6AASrG3ivPGtB0bRHpdcFXnWFvOB5YcGCTMD7OZ
 Iji4SDuNCRgP3pJuTmmI22i3AVwIgEr6nfmvd7UQrt8NfzCGageZ68KR2bsLXxwHy/wQJqLQSJQ
 EJzsAoXEXsZnNI7X2WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180062

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

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Anvesh Jain P (4):
      dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS
      remoteproc: qcom: pas: Support secondary images
      remoteproc: qcom: pas: Add coredump support for secondary processors
      remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters

 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 358 +++++++++++++++++++--
 2 files changed, 477 insertions(+), 35 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20260923-oob-support-glymur-a9945a5328bc

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

