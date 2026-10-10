Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6563164AA
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639514; cv=none; b=osyNmFsf8rRDn+LdRw8kgjfWXJUv6ADPOjsW/zi35jiTB5N+lmC4z0uhzvc4U+m4Afjy3EHYOJolqNPlpLeiioJdJizKlUkbQe0jqJNbuiGU+HTsLrvAwcvg43hhD/XNToQtAotU4qhuZ3swksdfN0Fg2Ev+/FslN9MbkE4hS8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639514; c=relaxed/simple;
	bh=+/FOiGAdA0/Ch5DAKflPF64XRT4LzaHU3EryfBCxt7c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hf1MG8d3ftbxNS0s+vwb0YNcK6oV8/LG9m3WqN+iX0wRfw4yE6cMdbMb6K0GTnpd8A/haCh6SPMe6KEbSWVx6itQHPQEZN5TlUKIYupkSQydXVRHNp0knnNHi6n3PKtGcpstVspqMOc1cBgDjWCBv4v2y90xLKoLoI31awUMAyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O56HNSyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNznDqUK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O56HNSyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNznDqUK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACVDuf289296
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 13:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kXeit6qoeff5Pm79BGKCnh
	U5l8BDS7L4aPTjGtWaCVM=; b=O56HNSyEDVnUnwvKi5erEg9n+U/2ywhqZgCjuO
	FcOfBL7a3zbeEdTgR+78ipRciP+pEpJ5UvSgAo6OP+ucMzVjJXiTnZaKsLs45n81
	LCXGwSdiw1F4NZUkjZSZr/1RuH1FgZ611yWJqqS66C/dGp2NmZUUQi/K7Xonz1W6
	O8HQJoKQyRWq++LLQlaSGoO+nKU5RnNJffGlcHgilp9K9mZqY05S2OyVPaQG7Zwv
	zR9b32nLFyLBqkv7O4tGk98JVw0gcWaNnH8a3W4JEfIMIii51HmTQg9aUk/ivN+X
	h/INrmSh2IpI8NtgeoUOLRi9YjUQOw9xUIDgyYbQjJ50Nvig==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cpgh70x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 13:38:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so1249189eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 06:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791639510; x=1792244310; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kXeit6qoeff5Pm79BGKCnhU5l8BDS7L4aPTjGtWaCVM=;
        b=HNznDqUK9Cv3wCuYKUWdPGV0gPXn3kBma5ZAiW6GNtit+Uwr9Yc5AkfaZyf8wgMtXi
         WgBR2zPT1PAOq0+kDo5FsIGIQwH6E0KKCyXBLreaTTMFvjzTX/eyGHZBgTS9UKDxwQHn
         boFZ9g5KuFhrbIiCDCJ38Mb5eF+oJpbqxS3vH6pQISuZTtJrxWso6OHUI8y20nDemBdR
         Sd3cm22viXSUc7QEHMVB1gSXZe0w+sK6N8PZpa2R8vfFhxw+w/US0immW/haLx90DiOv
         5ufgMAx6R/u5Li4RN+xii0YzT7v8kdRbTjzvAJM0ZyEe5cqCCQPqJuQ+FtK8E6hp6it2
         KnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639510; x=1792244310;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kXeit6qoeff5Pm79BGKCnhU5l8BDS7L4aPTjGtWaCVM=;
        b=SHpybjdvmZrJhVvqCh4oGpkwfAXForgaXY1othO2CtPOdhEo+zZ74AnRHaYNmprehP
         adCNG8GvPnBHOaLirpEuqwHee06PclS9j1xwYbaFLr5D2mr7dmWJjnEUPKjTg8oQCmZM
         pTILhA7Cb6209kowt0BVk0H/pfpWo3Ng73v4Ys2xaaQKplUCIx7eIL0ICzovBSQUniyY
         4T+J5UdHCQCLFzrUQiD0pUqtZy119pLRulL4ixqGZhCpKQ3BS+zQQkN9agZSK8IG+MG4
         8H1YdI6BjzZkJz8g5kWUqCXnK/L2ZKLrBCJOsCCX/mjgofMtrC+EpNaFpumIVP2ejvY7
         4uag==
X-Gm-Message-State: AFq9FYIB2q727ZBgeQLAgGN0+rNhVV81hQtc3t/7IHm5ZmCM30pf68/a
	7O3Niztbu6ZovwparLNaeXy/+/pzurE2k+BF6atJcHUShQphDyI7F/nJ8moxJCy+IhMuC849+8D
	xPSvafS3vpi3pahRHvdtY0HVK9nXqrJItXeOTowxvsNmxk6aFRqlbtwOctepJLVHUaMYX
X-Gm-Gg: AYBFou0M6VIJ8zuZgDJpryV35kEzJwh8cUbxL5+yUhC3mb5lzajQzYCc1yPYhGsEYNJ
	FK1SDYNJcR63nPekYtgzgnyZoVwiuIFye0OmbYs496k0X+NTBcJQaFUja+mu/1z3zLn5DVAn53/
	m+X+FM3ejxKbKV0x6BqJ9XwJck7pFx7TusraJ59foxByy4L8MaCbF5ffIswbEj5wyC0iTgv4kAT
	ZRZbgY7trCx+Yjqyzoa2zbvUtEorO8J5ma80QBBox1fRyakD7kt3KH9ZElyuxGQQgovZFE0mh+N
	Zm4LpN4+TXM00Qekq4fP1V2CO1sDvrS8AYGsTFNy9HaXuaHaSW8k8eIJbHKux9MYErF4Q2efPw6
	e+DZt6jH6l1+0MPVb5YBQaJto7w==
X-Received: by 2002:a05:7301:1442:b0:351:7ebf:210b with SMTP id 5a478bee46e88-3537e08b08bmr5879775eec.17.1791639509794;
        Sat, 10 Oct 2026 06:38:29 -0700 (PDT)
X-Received: by 2002:a05:7301:1442:b0:351:7ebf:210b with SMTP id 5a478bee46e88-3537e08b08bmr5879745eec.17.1791639509052;
        Sat, 10 Oct 2026 06:38:29 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm15232827eec.4.2026.10.10.06.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:38:28 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/msm/dpu: fix pipe ordering for source-split planes
Date: Sat, 10 Oct 2026 19:08:20 +0530
Message-Id: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMw/ymoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwNL3YLMgtT4/KKU1CJdC/NEC2NzQ/PEZJNkJaCGgqLUtMwKsGHRsbW
 1APYTD25cAAAA
X-Change-ID: 20261009-pipe_order-87a83717ac4c
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791639504; l=1510;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=+/FOiGAdA0/Ch5DAKflPF64XRT4LzaHU3EryfBCxt7c=;
 b=eAovf+M6Z/mGAQY0MPkZVpqdKdse630wZTZRfk/l2ybq5iki0zN4kJaWAgzhbiY34bix8HspX
 7NfzCPS73l0CANTCF9V02OpH5SqIt5OmZP8sFY4dREx8f/G8Et+Mf2M
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfXy41/wRLIP/MN
 2VfkzfNXFBu/qUHevN/icEF36gIVuMm5W0/2XNX9vAfeU518v9Nu4uU2JlBQHk2XTsjIgu8z2IH
 DLuU4+7JEZJfog3cFsE53jyODxk9CH0=
X-Authority-Analysis: v=2.4 cv=StoFe/O0 c=1 sm=1 tr=0 ts=6aca3fd7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=56ZRaVNax5G-77lkfSYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Q0Vd-QpblVBDnnpoG0ZXxGFs93VatKMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX6DwFolPulmL3
 0XGb+KyhG47DAfCn+4f+ox5Fimm9BlMqeTG5AgYvOlsVc6AunS+vC1BbAGzltwp6eyBPwg+kRE9
 m9vW+uuQsj2ToX2rp6KpguGjIIoI2xpPce/piOLXw/ZLYBXprYbHBXVMe5T+mjoHj9gseS7Y5Fk
 vwkN1owm5/VYAIhaJy+wYPM5DFyxPwFnS8WrKZmg6erJxhY8lbJs94gf28Z6MbHYBMGFjqsJ0AN
 QuSGywlwPm2R8w9Z5MIpvLvV51HsX7Fuhl05HXFWeXltNxw+0AcupPTSD75vsva0+OFK8MhYYqM
 hWmBD6GuPuRjPBaYK4cv42QBjWF5hz1xqTsV6kZecwydKuH4lk/evfB3vPM0bwfeal/h3lNSVCC
 56lN4DPMLMSEaJn9EvDkTgbxjJiNVx691vjqercGAsYTEhF+CLfe2e6DZqvlkIUuj3l4LRiGIuN
 GqdwUORkAOEhFTsudhQ==
X-Proofpoint-GUID: Q0Vd-QpblVBDnnpoG0ZXxGFs93VatKMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100054

Virtual planes can use two SSPPs when a plane exceeds the single-pipe
width or clock limit and parallel multirect cannot be used. The pair
can contain different SSPP types, depending on resource availability.

This series handles source split ordering for those pairs:

1. Keep the higher priority SSPP on the left before DPU 5.0.
2. Add the SRC_SPLIT_ORDER operation for DPU 5.0 through 12.x.
3. Program the order from the destination X positions, clearing the bit
   for the left source and sources without a sibling.
4. Add the operation for the DPU 13.x SSPP rectangle banks.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Mahadevan P (4):
      drm/msm/dpu: keep SSPP priority order for split planes on DPU < 5.0
      drm/msm/dpu: add SSPP op to program the source split order
      drm/msm/dpu: program the source split order for split planes
      drm/msm/dpu: add source split order op for DPU 13.x

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c        | 19 ++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c     | 35 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h     | 11 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 14 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c       |  4 +++
 5 files changed, 83 insertions(+)
---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261009-pipe_order-87a83717ac4c

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>

