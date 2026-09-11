Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1399F233134
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107741; cv=none; b=kTrGGD7mVugw9K7NNRGXKmt97PfZZkfmFQAIVLrmBd35NxlitIcqK2cZxWOVhi4hnAzyQhyjK1S04ymRLWxFBkF1YYSM89aPklNy7l+4xvFSjAoMq6r2OIz6ZCfGdTrhRD3ano8kkYUTE//8Sqk+qGYsu29VUzs+ie1h0TFal64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107741; c=relaxed/simple;
	bh=H9iBwKfhPi18IbXoALxIsnCQPr1NPKj3ho0rBzTlZSg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fwl402LbuQE5m+DT9A/Zq5r49cm0b3bWH2iWKYOpjJcDeq46XZ8UtE/XqZTO5OK4Fl5x//Bjle3tKXDzQBG6w9akMF21N05MfgG7uU5XQEZd9OFF2ltcmXvgucr/S8CUlc1FVoJAt/RtdU+KvQ7jPxH/94s7Qh5yAaQ3mAxV6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bR3hKjXE reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bR3hKjXE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B5LPjp3138167
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YHooWfvQ1kj2BAovtS7I/kr0GN45MhJH4EJ
	nv+6jEZ4=; b=bR3hKjXEW8BOtRGZzHgbIYM9jeb64HBl3VJ506vgO/kVNWclhmn
	cUzSLgMnthRLCLAS7FhqalxxMOjfSq3d0DgVFZefnc460ySLRzMfDQsiuZWxqzwH
	SIX1b8GgtR8P0IuwkIErnoBrgsm0CPACN4IfkoznnGq07ZoaKYdc0tOC3CQzTPPV
	2St1OWs359VXu5wKVeWzkUmkF5V6v89ZWLFH7pDAx16qNXhAMpG2wV6IJDIKMhca
	o+zu89ha8n9GDePAhIdMJD/Oz2oXeFyu/uv9lObQP0aU0kCa3yOFtojo9RVj68+2
	uN82PgzY6Mz5Vw8juDp0eI9Rxr39oCxXkVg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr87e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:22:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104c2ce026so13466196d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107738; x=1789712538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHooWfvQ1kj2BAovtS7I/kr0GN45MhJH4EJnv+6jEZ4=;
        b=D7qF77pjkMei7aZ1HreVlrRxE4YnL9Vli91QSbESflASxnvMDgbZCXgEmksqa46MqX
         CDGHdWR+WnVZ3xAiE639l43YclGHzvR3okwHteGXStaSrkhZs+sPPtG8wQrhMsrKSUbJ
         T+Njco9658P68dLXKhZaGtOxspfJWAJOQwX65ucLYuGdPN40dxpfWainc4KRcehc2cnS
         4FwjXX1dgMKzqy4KjXhV2J2YzJ7S9+KjU1anB14lVMdmxQ29S3AqdpdR9lJRFe/314aL
         G46oYAq/RAE0NgRrNEQxXAhGOmrVDgbiUuQEmiofiSI5bkBYT5JescaSGOrFV7//KZmG
         su6g==
X-Forwarded-Encrypted: i=1; AKwUvBxuNQNK2MVMfVMt7sYLPs2VeI9PpDcafMZkQcM7UTSL5mOQrEl9Jaldh7+Hi9kUF2jm61k3wCtVO+PsLGKx@vger.kernel.org
X-Gm-Message-State: AFuF++kOSXlOZ/2iam1/6GY69SHy58e+7Vkaw+cIdEEd1FM3FiQkT2WR
	1FG6FUTqlByF5sipzxOH4Shdsz9XoK0v6Ge3UoRMjVsa7w+GK3MJkN5yTsjfdAioEcdfpf6Kfoa
	X/l9jHSrRjZrnJ9u8t77hCKTLpKuaMeF6+QmCAaI34N5qIxosd4HYzIPTpTZ7RcfELxht
X-Gm-Gg: AYBFou08cARy7rYlxd+p2hAo2Wx+bSGCln2DX6WpGhcziAkiVrfJ9RNpmWgYzToQF4X
	F9dDf6CuxDZMy6z7mNEuVoMenfIEROUO2rLkRh8VbKj2pdpVITx62jp2BkJiv3IYM81pjfedFEE
	S2S+HpKjAaZUdrpfC0nPKC14+km5bB5btKa0YRKTKO+1TfrVNCgv75gADlFgsUt5kracjHh1iJd
	xRJ63HlJOdVpz9ZeF6qsXP+dJc1FDCEWostNKOkl+VylMO5zSG4kLgJ9a3w4RJBABb1GolGEvOW
	OodmyAUgSu5wXW2zcY06tPGkcY0d3Xn6iFB4T8LICJB0Nnf+X6XNM6VchKs=
X-Received: by 2002:a05:620a:a19b:20b0:939:f34e:ab4f with SMTP id af79cd13be357-939f34eee4dmr42701885a.39.1789107738071;
        Thu, 10 Sep 2026 23:22:18 -0700 (PDT)
X-Received: by 2002:a05:620a:a19b:20b0:939:f34e:ab4f with SMTP id af79cd13be357-939f34eee4dmr42699585a.39.1789107737613;
        Thu, 10 Sep 2026 23:22:17 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:16 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API support
Date: Fri, 11 Sep 2026 09:22:05 +0300
Message-Id: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: skXGCP58_3Gpieo4T8s45KBy3lJzEPsk
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa39e1a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=md27zeyySlhtWRGOWm0A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: skXGCP58_3Gpieo4T8s45KBy3lJzEPsk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX3yzf6QEVvvEo
 YW1PZ2Mr1MkQjB9dB8qcnFM6swxKy4D+OwE2C33aM8C3hGxDQUgBMtbeAUR2sCfNIzN7TMbTPDh
 KuIB6d+g0x7lNJfTpu6ci5W/Qysh9jQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX3Ns/EeL7dEuK
 tiMRi4QGmAX711ntk5kpQW3vx8iw/LWF8YVH5MM/rfbMj1sLaYFONbMSE0y91vylHlBAnhf797L
 BjRvlOvOx1rZcJkX/qXz7Wx6JgLFgxQytk3GkxEIGSuBG+BMWPrMfg0OW6Avv8dQM7eJjsMR2sM
 Vmu0/IwBVvngG/E3TpgVg7WNZiVasG5Sh5YMyTRexqRdmD2R+aKJ2da4Yvlvqyil1/rL04wZ1MJ
 iBKSk3BhB0fu6MRL8yteeEn+/rQRDSnDZ+VZYXJ/miaIshNBGNN0Wpb/fPqv7isXL2dF2ZrOHRZ
 YPxQM51H/QcyQcJDniP7dA9G8ExQjqEQaOfUqbBjrqA0vtEC6CZpLRKcF4aC0h4KZuoijR3iMw3
 kFRflC4JHJVcCKoyLQ/21o1naFIojOcQbZborXDaAL2goUhkBsf0YYsKkifw7ASKQs9lY3vNeNu
 spOUhWSYt9QXWj+lnDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

This series adds V4L2 subdev streams API support to the CAMSS driver.

Each subdevice gains streams-aware enable_streams/disable_streams pad
ops alongside the existing legacy (non-streams) subdev ops, guarded by
a new per-instance streams_enable resource flag.

Patches 1-4 add the CSIPHY/CSID mechanism:
 - CSIPHY: passthrough routing, NO_STREAM_MIX/NO_N_TO_1 validation, and
   shared D-PHY lane enable/disable gated on stream-count transitions.
 - CSID: per-source-pad routing (a single sink stream propagated to
   every source pad by default, remappable for multi-VC sensors),
   VC/DT discovery via get_frame_desc, and new hw_ops
   (configure_rx/enable_stream/disable_stream) with a gen2 backend
   implementation.

Patch 5 is a standalone bug fix, independent of the streams API:
camss_link_entities() used to create an all-to-all CSID-to-VFE
crossbar, but SM8250's hardware wiring is a fixed 1:1 pairing
(csid[i] <-> vfe[i]). Enabling a mismatched link (e.g. csid0 -> vfe1)
exposed a media link with no real hardware datapath. Fixed via an
opt-in csid_vfe_fixed_pairing flag, set only for sm8250_resources.

Patches 6-8 complete the mechanism and turn it on for real hardware:
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
 - SM8250: streams_enable is set true on every CSIPHY, CSID, and VFE
   line resource entry, turning the mechanism on for real hardware.
   Every other platform keeps using the legacy non-streams subdev ops,
   so this is a no-op everywhere else.

A practical benefit of the CSID routing change (patch 4) is routing
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

Verified clean with checkpatch --strict. Built, flashed, and tested on
RB5/SM8250 hardware; ran the no-routing capture verification test
across all four CSID/VFE RDI pairs (csid0->vfe0, csid1->vfe1,
csid2->vfe2, csid3->vfe3) at 4056x3040 - all four passed with
correctly-sized frame captures.

Gjorgji Rosikopulos (8):
  media: qcom: camss: Add streams API support for CSIPHY
  media: qcom: camss: Add streams API hw_ops to CSID interface
  media: qcom: camss: Implement CSID streams API hw_ops for gen2
  media: qcom: camss: Add streams API support in CSID subdevice
  media: qcom: camss: Fix CSID-to-VFE all-to-all link crossbar on sm8250
  media: qcom: camss: add streams API support for VFE
  media: qcom: camss: add streams API support in camss-video
  media: qcom: camss: enable streams API on SM8250

 .../platform/qcom/camss/camss-csid-gen2.c     |  59 ++-
 .../media/platform/qcom/camss/camss-csid.c    | 494 +++++++++++++++++-
 .../media/platform/qcom/camss/camss-csid.h    |  45 ++
 .../media/platform/qcom/camss/camss-csiphy.c  | 223 +++++++-
 .../media/platform/qcom/camss/camss-csiphy.h  |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c | 119 ++++-
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 .../media/platform/qcom/camss/camss-video.c   | 119 ++++-
 drivers/media/platform/qcom/camss/camss.c     |  21 +-
 drivers/media/platform/qcom/camss/camss.h     |   7 +
 10 files changed, 1046 insertions(+), 44 deletions(-)

-- 
2.34.1

