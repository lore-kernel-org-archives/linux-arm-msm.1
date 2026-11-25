Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565211;
	b=lKcpuuppF9oDbqNnPi2EAOjyrm/gcLwfzy73iYheOKU1aO813b8Scl0yFM05i7QHMrNj
	 0iEw4jTSbhjDsukXwgRbho+vyW3wxdqnSaDOXyXL3dUwIDDlr6kv6868AaCafSZrOmAf3
	 X14POTPjE1HkByI0fg8OjIAZlLIOhmvVimFszsnHiwe5si3EOHcoi2se6+RPKZWTj/Wbt
	 1DNDWpm/QC0QGRcOi7MN96/kqRs1KvHGgFSaK0gk+R8mN2R8VLkJHO/cABurKP+4m5deY
	 ZDUrLMyPPsEwKPZZ8P76ED0MoLjc54lvkpq7/p9J81Q4NMRGYiL94RhDgGm5DX5wPow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565211;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wYKFLzdeHPvc7kprMqVT1EcCOKLlxOc4BYqtnLQWWuA=;
	b=JdJQoFsToBF4hZoOVIu3ukZJ886f0A8sA6ZdH0YCd5QwLlasjPyWJ7wkHKO3bHIXarCe
	 MjpOsQo3FcgBZumWjOmmiq8y4IFcuYjEDX/srMs0VTy8w89I/tpPVSUVhDxJXhNfRLbT6
	 TYzwS0QqPyQbeSILdzUbgab43xSFZ4bGTKyqiax4hQof+uwxQ1k7yO27gWK81hQMLr0bX
	 Xr0yt1s0JW1Ct5QRCfk/DZOcCUmjpjnr0hFPL1eZyX75N9y43CSufQuJm1fqlYTARE5q8
	 I1uw8b3BevP7KdRHwmztk0JWS+ugH88wzO3QDTwA9uvBWK2U5ywP2oJhuWaTOIVh9mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gwnvt6+C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmyUSpwH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BD2606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48BD2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gwnvt6+C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmyUSpwH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AONvbAt2727249
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wYKFLzdeHPvc7kprMqVT1E
	cCOKLlxOc4BYqtnLQWWuA=; b=Gwnvt6+CnIy4dUzedFrjCud0kA8qrm8m8Hfzg3
	1Mv8sebwr5DbXUWJzU8nabecWX/0KC4hhZKvEWT6Z2d0TZ15cIzF//16vWs4+9um
	H6WmlWE+Pz9syr9jWBMbzr9Mu5z3SSnTUKIRKh6cYQectGS6uLcYloZN2BH9YXkv
	f8qAQd15eKGvKHZbXWQQ9cUqDeRvJqX0sHi3wor5gVjI4yrcrR3As9Jo7lbfAjfb
	JutfCyqN4KVrRRs/cEoVq/23L3hTEWEVealVTr0+FNmCkQGgW4hqMglRN3QuBljG
	SkiZfblVOT+KxpPZCPNZWuGRmDsWvjFcexxhbC4I7bNBu26Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbg105-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:06:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386c3309469so1288199eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795565210; x=1796170010; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wYKFLzdeHPvc7kprMqVT1EcCOKLlxOc4BYqtnLQWWuA=;
        b=KmyUSpwHwgXbxuAdguWu8KM3xhvGpRktCA3E0lB7AK4ufpB2IxcCePTVVfH4Q02miC
         j6c9ekqLEDRG6msj232LZgpmjRcEP5a1rKX9dchj+GkZxPbL5m+VDZepPOai6/yjItXx
         U2IDweLlFgidPMkTFiMh+dNtX9IgAUBScG+dAeCwVtNVclEqwKQeuENjS2okh6K4H9Q+
         tLwYr6BXCzprzPmKZeHgPi3ei9FE/nqnFU1WYfrEnH3udSThCJbMkJ/4J1Wj+uQqcKTv
         ssfgjHCy22tcU7d81ybmOt07ulXL//tZMGM13mI4m9q6/ZRBfh7GN9Aid6VgCjaQcDC6
         BMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565210; x=1796170010;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wYKFLzdeHPvc7kprMqVT1EcCOKLlxOc4BYqtnLQWWuA=;
        b=TEzfknYeS53snZ8QvzTTS4KIDsZueJUGhE/fKCbIAzz6UQens8tP5uvalnF5EtiyJv
         /O3lACZqppndhEBP38KqUNQzPmkyLPEe4PTJcG4a0fdaY7BowxZos/1nxguQ5aaTf6sd
         YgMVAeoF5N7uYqrtwyyK8zLi9p5wbVrlsqU1X8Y/2gxzzKB+rn6959OyYQ9ACi8iwgcA
         NPMyvtUsMniPoNRVro4toxRxVQuizGyVygssnYFqdhVfb/vfZeS69rXYPBiNi5gNtkxd
         MLssXav80+1kiUPjIBs6o709aqhpdtRvP8ZtPRz8L874jjbU9nTufpkDwn4QynD2YGZP
         l2sg==
X-Gm-Message-State: APuU4Z+unLuj68m1P68W0YORVpg50IQAAq5RDpQq8YJm/4qsLNiLTmC3
	EJHfOvprjfXavvZlK+kay9XEyKgCAScinKelyR82IxMiHcTfEvV4IuKLxp+bC2waCYCMhqaGIGv
	3uyONTssjbagqjacPamZfiYFmevmRIB92z1UDGpOlXaeVmW3xgHXBx1aGPcn0FM8MC9aI
X-Gm-Gg: AZFdTZe4Wig6tkLU83FxcZaQBVxLL5x6j7/eAxhmNcrMvWGQxc2QaZtJB9jdIYWgPBT
	EucCVCytJS/YbcD/Oh8Kl9cxfH8zXjPDIEqN6bKtKaxW40ST0F/Tsgq20DdG0i14Eu+PnrNTy48
	Hg6mlFJdYLd7XsssUTUSFYbPzynf1EycWPEn2alRZzG/TesrfMfgK8eMZAcrDn+JyTplv28Wt1y
	Uodd367tZiZXRj6OpBplDYXoGLpoioz2tXypxUcMcSdoGAR97fcoeygPnYNdTTXEDbnQgkJYT27
	xlMrphGEH8d1Gut096FuRF01GYiGJb/Ibo9odukTBhPACLMDR3gcUOopM8fTJlSoUNK6jPr1dVD
	PT17nbSPXECQtnd9xU2D6wummCHDFmg3FVnXuacPFTn7WryNjuqeHfpm/qA==
X-Received: by 2002:a05:7300:f496:b0:385:551d:854a with SMTP id 5a478bee46e88-38570845477mr15682268eec.28.1795565209615;
        Tue, 24 Nov 2026 16:06:49 -0800 (PST)
X-Received: by 2002:a05:7300:f496:b0:385:551d:854a with SMTP id 5a478bee46e88-38570845477mr15682238eec.28.1795565209009;
        Tue, 24 Nov 2026 16:06:49 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm47494708eec.23.2026.11.24.16.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:06:48 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Subject: [PATCH 0/4] misc: fastrpc: add HPASS domain support
Date: Wed, 25 Nov 2026 05:36:40 +0530
Message-Id: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJAmBmsC/yXMTQqDQAxA4atI1gacAa30KsXF/MQaFxqSsRTEu
 3faLr/FeycYKZPBvTlB6cXG+1bh2gbSErYnIedq8J0fnPM9zsGKSsJFghnaIbJrwZjjONAYXZ9
 vUFtRmvn9+z6mv+2IK6XyncF1fQBulXT0eQAAAA==
X-Change-ID: 20261125-fastrpc-hpass-support-bdb86e8b15d7
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfX+i3gAcYNERAM
 LG46QBW09Td7t0mjsi+sqQpZNH+kZY6XGNIjJogX4RVB33BCzHsPo1I1mJDCSCiz3LfUGq58TZt
 oGDUj+a2SSDRVQGAxUf6iAqt5gQCQpE=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06269a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yezPJc07dsF5jmqqbk4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfXyZlaxVdCLlET
 aP8Obi+R1qHgYERDaUuBxGJ1A52DIHCz/UND8GhSlSAzp7a+SJn/8Ld2HkjXr57l5ZGeyTyw6qW
 PxJLglsQ0ZXYnFouTKb1Zdlghm6ClOzdTl93bG/702WQd4zPahDNYF2HlehWxJCHtTMuXsTCH7Z
 o2ixK9cMNF5t35+0CN7CasenyMwMwUBf108DRlNQtgkU8mYYEF8UxKsEovO6NUz1jHjjI28aaTg
 BMoimOjyxgAoyVorOzsdXUpTk/TilAwPHlethqGuWJCGH3pyXGh6rZDybcSdHqrOjhfKLd6FvW0
 9RWqf0B86nxdX+jf5R8NMu/xe+9mGTZbAP2OySxHIiSmFlFj93jPJmzis5GzJRzUasnLAdHQt1k
 w4BaFppFYh603bZTRsLSFGpfYt8gQYxjzafliEDDgntqh7YDT5BPrxJy2PNWkHNBdEFD1Vdf3m5
 n/S5lKeOAFA0pU109zQ==
X-Proofpoint-ORIG-GUID: 48yKgnfDNSEOqgJfdoNjsN_b6xrOr9o1
X-Proofpoint-GUID: 48yKgnfDNSEOqgJfdoNjsN_b6xrOr9o1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250000

HPASS (High Performance Audio Subsystem) is a distinct audio
hardware block from the LPASS-class ADSP used on earlier targets,
with its own shared resources, audio interface block, and additional
integrated processing hardware such as HVX (Hexagon Vector
eXtensions). It is described in the devicetree with its own "hpass"
label, following the existing fastrpc convention of distinguishing
DSP domains by label (adsp/cdsp/sdsp/gdsp0/gdsp1/...).

Depending on the firmware image it loads, an HPASS domain can run
either an audio image or a compute image. An audio image only needs
the existing secure fastrpc node, while a compute image additionally
offloads user compute workloads and needs a non-secure node for
unsigned PD support.

Which image is loaded is only knowable by querying the DSP's
capability attributes. This series moves that query from userspace's
first FASTRPC_IOCTL_GET_DSP_INFO call to probe time, so the device
nodes registered at probe already reflect the DSP's actual
capabilities instead of being created from the domain id alone. The
query runs on a per-channel workqueue so a slow or silent DSP domain
does not block probe() or delay other channels probing concurrently.

Patch 1 adds the "hpass" devicetree label. Patch 2 adds the
corresponding HPASS_DOMAIN_ID to the driver. Patch 3 moves the
capability query to probe time. Patch 4 uses the queried capability to
register the unsigned PD node for a compute-capable HPASS domain.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
Anandu Krishnan E (4):
      dt-bindings: misc: qcom,fastrpc: add hpass label
      misc: fastrpc: add HPASS domain
      misc: fastrpc: query the dsp capabilities during probe time
      misc: fastrpc: expose unsigned PD node for compute-capable HPASS

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |   1 +
 drivers/misc/fastrpc.c                             | 259 ++++++++++++++++-----
 2 files changed, 207 insertions(+), 53 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-fastrpc-hpass-support-bdb86e8b15d7

Best regards,
--  
Anandu Krishnan E <anandu.e@oss.qualcomm.com>

