Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D669A41A91B
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114895; cv=none; b=tH7/Uy8Sj0QWVGxSKTTUFC8lBMa2J2Ty++5rW9LuW8CqbPsMBovFM5GgqKxrU0UBC+Yvj0dQTT8WNYq9yJfECdY0VyD0mbZvxteukD/8qxAk5vS1K1xA8W50Hkh8fQPmQqFKM2SCSkK3I1mOyaqziJ75U5gtu6RUJ4bU1E4yM5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114895; c=relaxed/simple;
	bh=/uI/IonCsG0gCA+TuNsimYDR40/idqbcuTaTESIrhQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ukk1FWNcmlVqg+pzOK3H5PlY0ARzouov/Egv/UyZrhw/YisTczxIa7syN0YrjZWlrakem4B8dr9q37OXRO1jX+XEII8l5VRz0gEvoRIFruQTmdzmpKDUqxOVX6ruFB21/QNl04uD0e3wzJnK5sNRqAwDNDhAvGeyMyEt06c9GH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtQuau69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmjxr9qr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtQuau69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmjxr9qr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kfIo423498
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jC//AH8MdM789lRUxzj5I06WPe9fiOoh+LA
	3vnSIH8c=; b=DtQuau69yqAaTJOLGxdFF/nFB9/w+p6GFDhZz97tD7j3eq/IZgy
	OdEKQK2X0y8/eu6AJB91O40cXxLbud5+nhbJfagMzRbrdqK8gOJqY/RnJKxtkjvW
	9+UFI9xjvSiOYuv7FEwy1muLVHJ0XTbvgEJ5sjf4/5bFMVQrYUCXBcxWsEqOgt1p
	Exq3/zKZzfl7z0QvRktEjDcVM26bs5IZQpFpBon0sGhQ9Wfm8XK+/ueb9fryf+iA
	IYj3c7urwV0pVCG0NmTevH1Q1S9y8ZKxiJ+LMwutlcEx75vi8fjQJQMe/xrDOr73
	Cu4X6rRHiRdcCW95AtdK878K0Ywq5rUBOgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8gp5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:21:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9394ad7f64aso90069685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 01:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789114892; x=1789719692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC//AH8MdM789lRUxzj5I06WPe9fiOoh+LA3vnSIH8c=;
        b=gmjxr9qr0T49W3uBMDuaHpwSQUz/7Rhn1icsbhtZAjy1FQ8JJxs8EvBeCClMWoXQ2A
         6fR7IViRmDRmjBmZWQflgpMxZ/73milZYkUwwSE/XtbHApuzjDX503M7xUbniG2skrD7
         nmAPL/Pvu5rQmtLnAom8rMJ7lvw6Stw6kbBZNbLoRfLB37Q2+CwFGgYuTZ+vxS8TRNSs
         uGGBkN1obX2z5LCjLFTcfa+e4ICZDGmEK44eHdOO9UflcLYbU8OTRDsuiukU/qkNisgc
         u56uSqphj/lgMR93AL0nYfsBg3VMDlwnC8x7k/JxEpERS8GQI+P902qLz18S3FC6bU0v
         Goow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114892; x=1789719692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC//AH8MdM789lRUxzj5I06WPe9fiOoh+LA3vnSIH8c=;
        b=iAiqlWJDIxNN5Ff1NdwdA6aevFIl/2DOj8HrM3DZn8mTYHZ6FB9JE/VvGv/Gi30k3H
         wpKhYv0PQHf+2KmwefKXaQTYP7olUMOD3Cxf2/9ovv3KuHHfF/Y1G8ywSmUHZ5trkuDN
         kXBnSKV4aHAs4DJm49bw/bk4CdgqDdlz1uXm/IO6A7+NK8QEuUPrMU/H9nGQKdvQLxsF
         Ph+5s0sgz94TE1fIXL+JQb/CGRZCxtId7KBvPFaUYqEaiAzNjeeqmtuyG0HevrlH+fdU
         4YmgvtNpu4kMkmHr6AxctDOlv1Td7Y+KNNOZYzirpIUwvFztlm2y87nZNq2FFF946VVA
         zRRg==
X-Forwarded-Encrypted: i=1; AKwUvBwRq6wtl2VkK7NKpFiN8pqRKQUecVUuz03Fs93ERxFgJ/X5/s8Brnyvuvfx9c7ZqN3b/CUyC6unSyPeA129@vger.kernel.org
X-Gm-Message-State: AFuF++kH4g0LZWiDrw9J6K4xBoKa3HLr+6H8Y1QytUMdx8g8tiLE8hzW
	vku+D2nHIIxGhJ3N9u7jX5X+bB13jHBFXAFhTM/8Fqz0fKbckhP2nIP5131IhNcJa7oAghatMdb
	+cCbC7XTXyzSIHeC4+cpRxWH1aDvJzMtDdl2ybA+/al4j+75K1o07agWJNzD8mEmft7GE
X-Gm-Gg: AYBFou23ACJioPddQlxhVLcCXwf8rnBywvzfmsW/wtzZDaBZ5uEFYTGXIAsrFgyQwX8
	NVSLTfIm0FFb8UsCl87QXOBxTXFjgtTQ+hIEFPvRtMjkOXztrK/kbFhKxT0O+mv71W9cOolCL8j
	mSY72XDQnZTqE4c5IDc8GBQQFCpoCPH+AtCO2LXLAsO5i10yuVzDI5y12i2oKtq2V40uapXORWe
	rosN8LbwaUaXVVHsBK66W5/a9v0H3APdoB6Xi6Y9jOeIqdaAiSBMhVqQIaBy8ta1R0oCc5bHzn8
	zGK5l+vPXci4GHbzyscGqXwAF9zp6EBINa0r6a2gLAsqsVznGtb+nqbYDHnEMrWlx1WUhLY/jVS
	07HPGoLisza6DhA==
X-Received: by 2002:a05:620a:19a6:b0:930:987d:9cd7 with SMTP id af79cd13be357-939ea0e3700mr387707685a.11.1789114891884;
        Fri, 11 Sep 2026 01:21:31 -0700 (PDT)
X-Received: by 2002:a05:620a:19a6:b0:930:987d:9cd7 with SMTP id af79cd13be357-939ea0e3700mr387705185a.11.1789114891489;
        Fri, 11 Sep 2026 01:21:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm4488880f8f.23.2026.09.11.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:21:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/3] soundwire: qcom: add multi-master support
Date: Fri, 11 Sep 2026 09:21:08 +0100
Message-ID: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TznvaQ8ySwZyTsMQbfcdICaLXEGc5M1R
X-Proofpoint-ORIG-GUID: TznvaQ8ySwZyTsMQbfcdICaLXEGc5M1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExNSBTYWx0ZWRfX0u8Ew38ihSSK
 nzC+oi0PuheQKJEf1qozazO+yxwVwyti2pwcZC7r/cJot7SNqBOhJHhqPbxWeVUW7wv7q1HgFhk
 onRzdtjDKLeN1gcztXb64aOrq4fiRnTEbnxV0fd0sk/wG+R1eH5D8Hd+5MSfjH9CM2HvLtrKFco
 fjq9BYgR0bN4Hd85RWsViQr7Dvnbktlv3mXnaMpeN8F7hpHMr9jCC0AQXr98upRleLoMxuXYvbo
 7b9xbbHy7XCBZx0YYh23bpi4FLBfbgfDI68Yhy8icGJPL6QxxzbiiKxT67pa+4+jHW31yrnT8pV
 yB4kW6bQ9SP5q8ykd/OhxqA9WRG8hCQR1mhN2moM6vXxRP6+haTaWqDx+O96MCWNaLtUDJQUnZx
 CNbUSGGtWO9a/rMsJRvKy3HILgMptar+xi7d2VL6RJcMUsFX4E/5Gg/4/LzZ3bzJ8kMcqrjTHi3
 GaTVT3u4tUWyDKBXkCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExNSBTYWx0ZWRfX0xUphZywrW5A
 wzFCC81bvIkyGJ1BgSaJAXvLHd9WLHpkm8/Y02byj6shRfKlt2Mykws1ZQjops4vZ5vhft4uDBw
 +zaEwAqgREfkmTZFv5E99e5PVgPxO84=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa3ba0d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=ra76rZe8w0pY-zNsRq0A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110115

This patch series adds support to the multi-master in existing soundwire
controller driver.

On Qualcomm Glymur SoC, both TX and RX soundwire controllers are wired
up in multi master mode connecting to an SDCA compliant Tambora codec.

One of the two controllers (tx,rx) act as primary controller in this
instance its tx which provides clock and control and some data lines and
other controller instance in this case rx act as dependent controller
providing extra data lanes to primary controller. This is called multi
master mode in Qualcomm Soundwire controller.

Multi Master mode allows synchronous transport across two independent
soundwire masters. This includes synchronized clock-stop, clock-resume,
clock scaling and bank switch between both masters, the Primary master
will ensure that.

From the slave's point of view there is still one SoundWire bus with
one clock and one control lane; the extra DATA lanes just come from
a different pad on the SoC.

Currently the bindings are added in a way that its possible to add more
than one dependent, however to keep things simple the driver only
supports single dependent for now.

Topology (2+2 lane example):

     Primary IP                          Dependent IP
     +-----------------+                 +-----------------+
     |  MM_SYNC  <=====+=================+=====>  MM_SYNC  |
     |                 |                 |                 |
     |  SWR_CLK  ---+  |                 |                 |
     |  CTRL     ---+  |                 |                 |
     |  DATA0    ---+  |                 |  DATA0  ---+    |
     |  DATA1    ---+  |                 |  DATA1  ---+    |
     +--------------|--+                 +------------|----+
                    |                                 |
                    v                                 v
        +-----------+-----------+           +---------+---------+
        |  SWR_CLK, CTRL,       |           |  bus DATA2,       |
        |  bus DATA0, DATA1     |           |      DATA3        |
        +-----------+-----------+           +---------+---------+
                    |                                 |
                    +----------------+----------------+
                                     |
                                     v
                              +--------------+
                              |    Slave     |
                              +--------------+

This series adds multi-master support.

Patch 1 adds two new DT properties qcom,multi-master-mode and
qcom,multi-master-peer for describing the pair.

Patch 2 wires up the primary and dependent roles in the driver.

Patch 3 programs SWRM_V3_MM_SYNC_CONFIG on both sides so their frame
generators lock to a single SWR_CLK.

Tested on Glymur (SC8480XP) CRD with WCD9378 in compute mode. HPH
playback and mic capture both work.

Srinivas Kandagatla (3):
  dt-bindings: soundwire: qcom: describe multi-master
  soundwire: qcom: add multi-master support
  soundwire: qcom: program MM_SYNC for multi-master

 .../bindings/soundwire/qcom,soundwire.yaml    | 109 ++++++++-
 drivers/soundwire/qcom.c                      | 218 ++++++++++++++++--
 2 files changed, 303 insertions(+), 24 deletions(-)

-- 
2.53.0

