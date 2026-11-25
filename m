Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593610;
	b=l3LcbPDY6DQfHshtcY6dXyv+NEs1lHsxFZ24Z43Vcxr2ak6V3iLvF7IUiNEh/LCCqWsN
	 7Ihh0bovn10BFMRD/2rPoT+wYlyMJkA3SuCD7LV/4FIF32OWYlYWkyOp4iuptQ6wxxEdy
	 wLQaG5XMtBE4zU1ZpKhp0EPkT2mZx1y0gVBYk1J/I8Ou58uHqSDsD0bPjKWlfrrj/WXNK
	 3haSOiWbgJ8mR7RlaEZI1btzKuubjlu92borWho4cOjoa6QtCQx7YS2Sk18l+2XKKH/e2
	 jCWPo09jgMpaKqc/tqJB4cd/h6MgLgHwfEzBoB4g8KTw+bXernHmrKq8eBawC88ryOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593610;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=v9qLar3b+SydWdWexRGCprqWqRoQsA4zYv8n8hgu3fM=;
	b=gsMeXL3VN/egD4U+cFjMvsIozkkOJMPS4HC7lKm5JSpqzwdPEdpcKDKkYIqrsg6Lloom
	 JMo1o3mw2VkYpLjp3kn9l0/FPewrhrwFecvVgfgIANv5cEWgHSPUk48++aA9FQn6K0D5A
	 dJDFREAehM7vmXQ5sEWRRTh91Io7i9FSi/DSroXwLuQpKuqxz6Fg8qgbLefsKEKbEi7Ur
	 2aKEpXYY8EQVh/mwomzgztMybDoNmWEDWqAkxoXuMpmK9J17ybrgXfDQ+e3PTbfY77Btx
	 uXEOGOPkCDBVd2anoouqNSgz4O1fzJrxkzTvVM8lO0Ehz0JKmKCMW07xdCU27Cr1G1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjPomrRB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE6D606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE6D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjPomrRB
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69TvU3809048
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=v9qLar3b+SydWdWexRGCprqWqRoQsA4zYv8
	n8hgu3fM=; b=FjPomrRB8AjiZ8edcXTPJNA95sTObrpb+AUdf3dLrf5hUjXKfkN
	9ZgN0S66E9tgFqPTRJTAGGV/MKgz2H+GyMO1WxOA+GZBWAdP0/GWuUxSZ7l6IUiP
	3SlBXbDXCPJhmGWK7Bf7xUIoP3HvMoi5FlGpKsumdsoUuxJvdmjrAS8QYK2nzotk
	lfNcO7cRm+l5I2EO0TJNkxRVJ84p5GE7Jixlx+AEN0q4LC7/NrZsrZDDbk/Jaz7/
	+ju/KVwjyTNsC0u+oA6NgPU4oP7zasLr9tfiMHtNhYnEHwdzXGjxG+uw5IZywEd9
	8KHEh80JQ52W6Np0ilD4YBPPgOMXEzMRbbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkbm3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so1029168285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593608; x=1796198408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9qLar3b+SydWdWexRGCprqWqRoQsA4zYv8n8hgu3fM=;
        b=eR/DhWFGuP9I4+44edrobyS+f+WcVpMpiY7yNKMAnPXI26ZE2y0THsiWRT+oNvCRly
         hBnMzHQBWEkYpOcun+SrF4zjMaNXXeekAwgq6fKZTpAWzskKMo5iEMDgDc3xHIMgpQzw
         dd7+6nSkgogGUdbgsZuQGlUAwex7MgZLBfT56XDjpe8De6MNGOMjAWxNNLbDZWjahqBv
         i+vDSzrlOceTDxZFp5kZkarxFrtvotYPLog42KC+SGuEp/T6BNjPlBXCn3eu2egn9Fmr
         K6fk91xY7jsUD8Ar3t3QK6UCRuPCC6I3686jRMT3DQlwBnKQ7ryd91x9rpDB+15YHTwy
         rhlQ==
X-Forwarded-Encrypted: i=1; AL+hErH0lFve3Y7F8OzsqFR5c6pjTzziY2UwS1RKbShfnCuqHc5R5/wiNhdyKLaxjDxUdk4iM9PwcrMbjXq9FcGi@vger.kernel.org
X-Gm-Message-State: APuU4Z8/fpCsdAb4uqeCQ7t1DzDOpD5MvB5I+wbX26IW8BWeCGpXY4l1
	PntB74nY0kQ/XMqW1Fwh8ADyoy1D9Dvbk1yJxn7QZBzBmJS4ojn1J/louTVv4b4H9r7l6Kyy14P
	ngTjYxlPRdMG45uO2fvlUgLIZcAzq5jMTpZx0YLd3zOWx5EokB3kL5gM6LTTY9rWedNBA
X-Gm-Gg: AZFdTZd59roko6N6MZR+Bs5PLBCJt57rAEm7TJ0CSwtqTIIs+j+sHoIbkNlbloHVbfh
	D6LbdQlW5EtFIpwjpZ+2iSYRjbxMyMqU5wmeYY8GhrMERG7eUtgUWb6hxNp8U+8Yzhh2xS37oL7
	MPtpRy3NqndBjM6f95D8gUeRrd67FRahYCZJ4lv5y2NdDL/uJDxOV4D3VfCOAum/XHsS2MKw+j6
	qVo/EQdoNxi/aqK0ncW8eSaaxqfCNL3w5juBrUGYi3XgE/yP1qP34XLIcLP7VFElc0PFBF10qqf
	jmM8DOPkBbhLnxGcGjJUAvCzIkFSJGqVqTsA00Rg8uCOee1c4n0d5vSqzqhedQkLfNVUgOvI8fp
	wYoWbWiZZnCuXrUp+bnqvZduFWgWWWK3T
X-Received: by 2002:a05:620a:4724:b0:949:5e26:e92d with SMTP id af79cd13be357-949ba99cc02mr3126823585a.31.1795593607466;
        Wed, 25 Nov 2026 00:00:07 -0800 (PST)
X-Received: by 2002:a05:620a:4724:b0:949:5e26:e92d with SMTP id af79cd13be357-949ba99cc02mr3126816385a.31.1795593606738;
        Wed, 25 Nov 2026 00:00:06 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:05 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 00/12] media: qcom: camss: add V4L2 subdev streams API support
Date: Wed, 25 Nov 2026 09:59:49 +0200
Message-Id: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX1plIVTO18kxF
 tIdljpaYV2Dgagd8cNG5hs9wWj/Zu4XwJx8C5LEDqBQb2jPIcgkPgL4G7BMUEWP4nOAKIMaODfx
 dwFMsjpbBT/Zv5NEZ1mAsf5hGLM7qS/Zmr8nghByAmYW6GGfhGmoIhrdhJpTc2FwKg2p9aUCEP1
 9Ql6DLGGUtnTEn7mwYQYLz3URPYfvwJLNj3ecOIxgd74clPFuYFthX68yVqkXxxOqnUXU6m8M19
 hBDyQuQqxjHeQj2Vz2QqemZyKVqyozyPO/lfbiKT1zTPgbjImkTOgk4GjQ3GANJhWFrPIPhqE/y
 g7EYxUL4nL1e3qum81tcARDCOp+EFr3DqyqQ9cq9dL26pFcFTH5e9zsMMXQfBtUKOkCjZIM+eog
 xgLfzQPWFFKZCuvGM1nu4taH1TJW7sAxOi1yMezqXGtM1vEeFnIHWm0o0PpL8ScbYG5UUwtdpEx
 W/rzD3r95Vk8kFbW03g==
X-Proofpoint-GUID: EUgMCBFglep4Q03azpVMLKgAyptNV7-G
X-Proofpoint-ORIG-GUID: EUgMCBFglep4Q03azpVMLKgAyptNV7-G
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b069588 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Hg6QxvZwkRzbdk84BkYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX14uGgN0sZ+Ul
 A0rdJ233D7QpMsVFRjpfIYIGnMvd9piaQUZFZqbJMbljTUsB1fgcW2/RMrHDdbKq+mbFLaXH4Hj
 Te7r3nK8/X2Zth2u38yloqqCZpzxFcA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

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

