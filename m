Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631025;
	b=k7myNraLwUOEq2fo9fogdHFA5zp594uz3tUJHoaJpC+DxWGmB3Lu2F7pPhIaqjK6xd5N
	 +WAZJBiq2hlximjCMyj+LQ9IVf57M5z3kwMCX5eJ5wp1qH5u+rUra0lReEMEfPqxkbUKY
	 VJPAETmRq1xQPhhMqS7VKtiOfILgdgpdNCwbg3ywcR8Woywtz/NvQzXbaOgPPy6N6yELK
	 YV9DsSSsHvrpdIb/sWOQ92RjvrM1tDsrKdzFRquxx3ORkQlvA3ZY1ZF1r+qW4HNmpRjVF
	 QZCLXUgb0HN3BZbG6yvu/AZwPhsT0/6cMt6I5MKpTImCw8xzMc5+y62nU2/1JyG+C/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IC4djXm6L2p/iwP9n7CVqinEoxYFhJbTA5LwbAw9uO0=;
	b=ZCdB2A/sN6eZCVveIapaPrdSdNvT2kp1srLHy9YPDmUKDxljjK5Jgr1vOu/56kjN4O8W
	 VE/zd3AMsSfIaXNXX/zslkSv19G1eorkITQHAUjE3hQn1ZSb/Ie1UVOqq6RwlkNTAf3r2
	 SRj1JPb+EzuwS7LylyYIJI5M1cOcmlz3XRGKMsrd4Wuo9qZ5B6ZNCwYlq1fTlEzhlnsTb
	 vW6Fv9JcLIWWJDjit6QYPUiQlh7iPhBzpWs0j4ofLvg8zu3CiEuMAUImkT6q7Q/nVamM5
	 paUlB2HJLW2C+bc/WGS+0gUmRponViolLeYXpXuYZ7UpduFH6KpP52dd5cEw0q0lvug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g+HunghM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jqGy1TUz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEEE606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEEE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g+HunghM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jqGy1TUz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQYtV327046
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IC4djXm6L2p/iwP9n7CVqinEoxYFhJbTA5L
	wbAw9uO0=; b=g+HunghMs3bxPzio1WjQTZriwJ2nUm0DWSCRZd3oaRY7s6HRIb3
	a+dtw+nBHiZNeYSLsuQmwfW1ga23GC5cV6+zwe1w8EQntXvjAun/m3igEufMVFiF
	qxQ4Y6gUsynfa4caDLRnSftnUMI91cxm66E0KMFgHA9cbv7oIGyppatZ8tO79VI9
	9qBmau4hM2TDv9lcC46/PUoppSec3es313lgOkUjk4es5wX7n0tL8taiXUA3QAbE
	FFdc1+fMUOrsGDbY9F3cw43k1TbAJMreRhggIf7gmgRx9OusfKP6yWPpNcIyvFUF
	3wgErypcJqyl9turRXIzWARIG/98vcFiyKA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2c95e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:43 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4d1e90b9eso50251217b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631023; x=1796235823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IC4djXm6L2p/iwP9n7CVqinEoxYFhJbTA5LwbAw9uO0=;
        b=jqGy1TUzbUR4VajLwvZEkLaF7rCqIi7iGVX7kxuq1jyFnx43sBtff02FKQWlqedNoo
         umgIEo6Lv8pAwjbMcIEwf2/gScaTpnEhn+KtQyNm4904WJF53X6GmuKNbJ3dpYdSunuI
         IN4BA6Ou0ROSqPKQOcG7A+umTy+oDHAEdGQ8U5eMh0IcvaFgsh0/Y8ZRpTopMljbaFVj
         3D8725P6i8A+Dy0nVGBzm383rMjDG305ciztQmLcI+NWyMdzOK8rOlYFX47i6NH/4gfl
         aDAR8mmFfOEaPjMkMMY2ROwCfMkdJ9H14Nz3yP0cFB30PSZwjVRywadpg4jJ65k/6m2P
         zo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631023; x=1796235823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IC4djXm6L2p/iwP9n7CVqinEoxYFhJbTA5LwbAw9uO0=;
        b=J6PePMzmsKhimEuKZ/rPmGTPizXExyDQe6kEI/UDd0KJC/zhRY7AodMVo8QnxG8KGQ
         UbclMrF/fiQ2p8BYBWfTb9XxOEZjRIvaIXavMvbs1IWkX2EVOiqKTZaY2iH4pv1uxkGO
         wYvWRmDJUv/c+hfCiIhoJU3LACofRuM1BBkYXej7q/JjaKV62ZOGHR7iTKHWHBVGR+z2
         xgjnUcDAvwiMPjwWCHf/NHL20ueqx99X/buI7UwKvJR5xW1Q3RDWdrn13ynLmXy18EKf
         ocIR9Na+6QoLw22c43s29sd7TkTQvli8h14MpYf2KB+Ert0z3cUKXmkEZNC5n4ZXFPoC
         +PYg==
X-Forwarded-Encrypted: i=1; AL+hErFgmz+/4uK+Q9ttFzGuN0PiQ1GJ5wsyiToNlmjQseeIcJN5UFlz6/2A+kNXGWpahjkvwsskNoc4AbAtHIu4@vger.kernel.org
X-Gm-Message-State: APuU4Z/zKRG3rENgyk+nveW/X9oRJMqtynhlRAl0sGT1Bk8+pEQ4VbEU
	LUCxsg/QYAj66xHqIIt3nVUjN8K36+rL5FUHnOyW4saXnyVIoLHmYpbsT2ig5rS9pByiK6UQXQj
	3Ubef+JUAPlQu/Tx3wpTDNqRJlqZn/KnEwkfnRaI3yA6KaU7371KN5HNwUy1lCVKAe7d7QL1z6N
	92UpM=
X-Gm-Gg: AZFdTZfSvV1bxN4+CAWC+YL5tK0gXk7pLcMpJsgSjHAct2hNN1UrhTrx7qupObEvTeL
	kMb1TJZJAs8ZIsQdd9jhqab+gVyIvbiZeMULmXmXwHnJbGy7boSWAygZaYUiEkE9cI018Q+ENBv
	JpnEVr6khlqoyR+wJmFofl2TkXcod7m0+LJZJtk8vaYD+VQaKGsM3SgNJ16IwCJaPwAYQWeXf0c
	eLQbTG4JenRMOL7RCJGuQ6ykRIlenAcR69pqoriJ6QhYAqaU9CaQmpmXkN0Wdh8yPcDvtXvZbVc
	7my5M3XGLGkzLJQAp+3BTOMB/COgg6AZCSxmytYsy/l9+Qti3uUWpxl5uL1Y428hE0sER5SHE3t
	e1pOm0eMM5KxNXAr/xtMjeFYuH/sV+pv2dbIgXeqk70pgrJuzlPMvs3Q3BMNipPwIrSVaxUjqUA
	bZw85q
X-Received: by 2002:a05:690c:c86:b0:8b3:4deb:7ce1 with SMTP id 00721157ae682-8b5204403c4mr101680737b3.14.1795631022316;
        Wed, 25 Nov 2026 10:23:42 -0800 (PST)
X-Received: by 2002:a05:690c:c86:b0:8b3:4deb:7ce1 with SMTP id 00721157ae682-8b5204403c4mr101680607b3.14.1795631021566;
        Wed, 25 Nov 2026 10:23:41 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:40 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 00/12] media: qcom: camss: add V4L2 subdev streams API support
Date: Wed, 25 Nov 2026 20:23:14 +0200
Message-Id: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b0727af cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=E6DQNbHbvE415lZ9EzgA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: X_KQD7uQD02Zq4n7eAQ6U3tpcw4tVXeH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX6fr/hhCtOBTG
 mPLdYpJ+F2K22zuaK4YuH8ehSWzF9XQsGM5DnlKeq5ja3YrNdlcZRUp19UF5tJvcQHd0l9v5Yz1
 qJoPu2KlTlt5eArVwzAaHnrztsHuVRQtryASShYHTBpvk44JPjKHmSegHcVshYvKkVYOp1k+ZcP
 TJnrszoGbXIAsAFb5dHtBr2kmsVylgj4mQEIjp9SPJ1SkLa+1VyCNbxGskFyUyW4sC4+MFGTtM9
 WUwDr9eRWzgh23Yw5+CuXGV537Fpb63Sr3wdCg+qmtAdIjPxuUZ/vD38rrolxmi8cmqMHOUAKmg
 WM6IfWbN6wq39nOLXPc4SIFKgE0JeCjfSK55R7SuhiRKGcbty4fL3vLS7wfnbl9gD6aELxrUJHm
 JdPqBXvcrIecfkE+ox8Ky/J16HNbaxgz2OE21GDyVkO+TumAUANQqyqfg8pTu5Sq00/nOBZ3Xmz
 uLzjyG5XNTKX6y3kxCg==
X-Proofpoint-ORIG-GUID: X_KQD7uQD02Zq4n7eAQ6U3tpcw4tVXeH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX652hXuhRX3Ax
 8Z3js66L2TmtL7dGq0bRvFNupYSly6omGMsoJBvKGaUMQBoFd8RjtWMRW1W56l2awHK83ESkmyj
 WZc/hu56vNsoDl/x9QaBJ39QderMdMg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250073

This series adds V4L2 subdev streams API support to the CAMSS driver.

Each subdevice gains streams-aware enable_streams/disable_streams pad
ops alongside the existing legacy (non-streams) subdev ops, guarded by
a new per-instance streams_enable resource flag.

Patch 1 is a standalone bug fix on CSID gen3, found during RB8 multi-VC
testing: CSID reset used to program CSID_BUF_DONE_IRQ_MASK with one
write per enabled VC instead of accumulating the bits into a single
write.

Patch 2 factors a pad-to-port helper out of csid_get_sof_seq(), used by
later patches.

Patches 3-9 add the CSIPHY/CSID/TPG/VFE/camss-video mechanism:
 - CSIPHY: passthrough routing and shared D-PHY lane enable/disable
   gated on stream-count transitions, dispatching between the generic
   PHY framework and the legacy PHY backend.
 - CSID: configure_stream() is reworked to take a port_mask and a
   per-port {vc, dt} config array shared by all six CSID backends
   (gen2, gen3, 340, 4-1, 4-7, 680), then the CSID subdev itself gains
   per-source-pad routing (a single sink stream propagated to every
   source pad by default, remappable for multi-VC sensors) and VC/DT
   discovery via get_frame_desc.
 - TPG: the single fmt field becomes a per-stream array, so the
   generator can drive several concurrent virtual channels, with one
   get_frame_desc entry per active route.
 - VFE: streams-aware pad ops. VFE lines are inherently single-consumer
   (vfe_link_setup() enforces one link per pad), so no refcounting is
   needed there.
 - camss-video: the video device pipeline walk now checks, via
   v4l2_subdev_has_op(), whether the directly-connected subdev supports
   enable_streams/disable_streams; if so it issues a single top-level
   call instead of manually walking the pipeline one subdev at a time
   with .s_stream(). Falls back to the existing legacy path unchanged
   when the remote subdev doesn't support the streams API, so no other
   platform is affected.

Patches 10-12 set streams_enable per SoC: SM8250, SA8775P, and SC7280
(dispatched through the legacy PHY backend on SC7280, since it has no
camss child node named "phy", so camss_detect_legacy_phy() puts it in
legacy PHY mode). Every other platform keeps using the legacy
non-streams subdev ops, so these are a no-op everywhere else.

A practical benefit of the CSID routing change (patch 6) is routing
flexibility for multi-VC sensors: the CSID's routing table maps sink
streams to source pads/streams via userspace-configurable
v4l2_subdev_route entries instead of a fixed pad<->VC assignment, so a
sensor emitting multiple virtual channels can have each VC directed to
a different RDI output (and thus a different VFE line/video node)
with a set_routing call, rather than being constrained to whatever
fixed mapping the driver hardcodes.

When a sink stream is shared by multiple source pads/streams, CSID
only enables the corresponding upstream CSIPHY stream on the first
source stream that needs it, and only disables it once the last
remaining source stream using it is disabled. Enabling or disabling
additional consumers of an already-active shared stream is a no-op
upstream, so no consumer can double-enable or prematurely disable a
stream still in use by another. This also avoids ever hitting v4l2
core's own -EALREADY re-enable gate.

Verified on RB8/SA8775P hardware, driving the CSID test-pattern
generator directly (no sensor), for 1, 2 and 3 concurrent virtual
channels through CSID to separate VFE RDI lines. Entity/video node
names below are resolved via `media-ctl -d /dev/media0 -e <entity>`.

NOTE: the V4L2 subdev streams API is disabled by default with the
static bool v4l2_subdev_enable_streams_api in
drivers/media/v4l2-core/v4l2-subdev.c. it must be set to true to
use the stream API and reproduce the testing below:

1 VC:
  media-ctl -d /dev/media0 --reset
  media-ctl -d /dev/media0 -l '"msm_tpg0":0->"msm_csid0":0[1]'
  media-ctl -d /dev/media0 -R '"msm_csid0"[0/0->1/0[1]]'
  media-ctl -d /dev/media0 -V '"msm_tpg0":0/0[fmt:SBGGR8/1920x1080]'
  media-ctl -d /dev/media0 -V '"msm_csid0":0/0[fmt:SBGGR8/1920x1080]'
  media-ctl -d /dev/media0 -V '"msm_csid0":1/0[fmt:SBGGR8/1920x1080]'
  media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
  media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SBGGR8/1920x1080]'
  v4l2-ctl -d <tpg-subdev> --set-ctrl=test_pattern=9
  v4l2-ctl -d <rdi0-video> --set-fmt-video=width=1920,height=1080,\
    pixelformat=BA81 --stream-mmap=5 --stream-count=20 \
    --stream-to=vc0.raw

2 VCs (vc1 added in parallel):
  media-ctl -d /dev/media0 --reset
  media-ctl -d /dev/media0 -l '"msm_tpg0":0->"msm_csid0":0[1]'
  media-ctl -d /dev/media0 -R '"msm_csid0"[0/0->1/0[1],0/1->2/0[1]]'
  media-ctl -d /dev/media0 -V '"msm_tpg0":0/0[fmt:SBGGR8/1920x1080]'
  media-ctl -d /dev/media0 -V '"msm_tpg0":0/1[fmt:SBGGR8/1920x1080]'
  media-ctl -d /dev/media0 -V '"msm_csid0":0/0[fmt:SBGGR8/1920x1080]'
  media-ctl -d /dev/media0 -V '"msm_csid0":0/1[fmt:SBGGR8/1920x1080]'
  media-ctl -d /dev/media0 -V '"msm_csid0":1/0[fmt:SBGGR8/1920x1080]'
  media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
  media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SBGGR8/1920x1080]'
  media-ctl -d /dev/media0 -V '"msm_csid0":2/0[fmt:SBGGR8/1920x1080]'
  media-ctl -d /dev/media0 -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
  media-ctl -d /dev/media0 -V '"msm_vfe0_rdi1":0[fmt:SBGGR8/1920x1080]'
  v4l2-ctl -d <tpg-subdev> --set-ctrl=test_pattern=9
  v4l2-ctl -d <rdi0-video> --set-fmt-video=width=1920,height=1080,\
    pixelformat=BA81 --stream-mmap=5 --stream-count=20 \
    --stream-to=vc0.raw &
  v4l2-ctl -d <rdi1-video> --set-fmt-video=width=1920,height=1080,\
    pixelformat=BA81 --stream-mmap=5 --stream-count=20 \
    --stream-to=vc1.raw &
  wait

3 VCs: same as the 2 VC case, plus a third route
'0/2->3/0[1]' from "msm_csid0":3 to "msm_vfe0_rdi2", and a third,
concurrently-started v4l2-ctl capture on that line's video node
(vc2.raw).

All three cases captured the expected, exact frame byte count on
every VC with no dmesg Oops/BUG/WARNING/overflow output. Additional
early-stop and staggered-start variants of the 3 VC case (one VC
starting/stopping while the others keep streaming) were also run and
passed.

These changes apply on top of v7.4-rc1.

Changes since v1:
- Incorporate Loic comment for csid and extend configure_stream
  instead of adding new enable/disable stream api.
- Incorporate Bryan comment for moving stream_enable in per SoC
  resources.
- Add Hitesh changes for SC7280
- Drop the fix for csid to each vfe link. It is part of another
  series:
  Link: https://lore.kernel.org/all/20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org/
- Incorporate Bryan comment and remove csid lite check for port
  mapping and add route to each port. Although not functional for
  full VFE/IFEs, this is more likely to be fixed in the near future.

Depends-on:https://lore.kernel.org/all/20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org/

Gjorgji Rosikopulos (11):
  media: qcom: camss: csid_gen3: Fix multi-VC buf-done IRQ mask
  media: qcom: camss: Add csid pad to port helper
  media: qcom: camss: Add streams enable field to camss resources
  media: qcom: camss: Add streams API support for CSIPHY
  media: qcom: camss: Add per-port config to CSID configure_stream
  media: qcom: camss: Add streams API support in CSID subdevice
  media: qcom: camss: Add streams API support in tpg subdev
  media: qcom: camss: Add streams API support for VFE
  media: qcom: camss: Add streams API support in camss-video
  media: qcom: camss: Enable streams API on SM8250
  media: qcom: camss: Enable streams API on SA8775P

Hitesh Patel (1):
  media: qcom: camss: Enable streams API on SC7280

 .../platform/qcom/camss/camss-csid-340.c      |   5 +-
 .../platform/qcom/camss/camss-csid-4-1.c      |   3 +-
 .../platform/qcom/camss/camss-csid-4-7.c      |   3 +-
 .../platform/qcom/camss/camss-csid-680.c      |   7 +-
 .../platform/qcom/camss/camss-csid-gen2.c     |  54 +-
 .../platform/qcom/camss/camss-csid-gen3.c     |  51 +-
 .../media/platform/qcom/camss/camss-csid.c    | 521 +++++++++++++++++-
 .../media/platform/qcom/camss/camss-csid.h    |  22 +-
 .../media/platform/qcom/camss/camss-csiphy.c  | 249 ++++++++-
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 .../platform/qcom/camss/camss-tpg-gen1.c      |  63 ++-
 drivers/media/platform/qcom/camss/camss-tpg.c | 179 +++++-
 drivers/media/platform/qcom/camss/camss-tpg.h |   6 +-
 drivers/media/platform/qcom/camss/camss-vfe.c | 119 +++-
 .../media/platform/qcom/camss/camss-video.c   | 119 +++-
 drivers/media/platform/qcom/camss/camss.c     |   3 +
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 17 files changed, 1273 insertions(+), 133 deletions(-)

-- 
2.34.1

