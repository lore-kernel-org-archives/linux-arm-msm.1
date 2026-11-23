Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430889;
	b=EuuLen7uVoifskphp7SH2oO6zRhROEH2pcyjpCSfHs6PbmorSnWmjxT3qxjjjgNXuufH
	 7hCXUoUWO9zLHIxMF5aQ8NrASWfD0mMajrINGebKt8satcL4wFmbLqoo29e88O0jFBna4
	 HEOOMBEyHeqmppaxC7p50IMNcv1QdYaQCL1zlQBO5gLzjyjloTdpAw3VV6fRvJ0NmX1A4
	 47PESuiuBh+bro0ICypR6aIKUIKum7RnDreYC4X25BeQUJmsppE83UfMNYD8MSB4nyoEG
	 va9ti9DJz3ge14FJ/sckU78xmW6RCmYrHkhTZkSqcAvjkBtZyRIbo1K1VkeQ4W2kJ4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e4rxHmb8Mfs2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=;
	b=twsgw/G9SZYbfraQwvnlrp1ejda28bgUdJkTrf2vkC9Q709SQJQAiyxhENOzA1rQXZGo
	 +s3KAKVtiM02mgiB5P67gGPsu00LfO8ywy3s7Se2eZsw/lkIoy6+ay8f41cwqdFmKlfA2
	 ARYOpFBnRvtYO6oCy7oeSJuBU9dAXf8LVvhKebwKF/VAy7KAcXSwyBDomJZpKRqTPZ4MS
	 1Kx6vQv3YYl0dkztkk+Un3IAJu/lJmpQLy9bc84utDSvv4lx3rF70jrpKocmC9GOsW4yj
	 0rOL7bwZi2s1juOSJrL1DtXs3AVcliW76d1QRg812FnBO3dn1g/ykW5zfRMOG1DlXRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Zd/uHTvI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PBWMIW9d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734A0606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 734A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zd/uHTvI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PBWMIW9d
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FuG31427503
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e4rxHmb8Mfs
	2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=; b=Zd/uHTvIdICT+UPLuXyWg2CSkE6
	82I3JHYoho6ZjBGRlAy7vgPsHfLI6PdSg4uz34ZCfwunmd56MRrb4z3SaPovarQT
	p9amf4bbJWW/TgokESA+/G5RA2WmLvUgJiEL/bK4yhnA6YUwDjwMPMnIrvLwxodJ
	MPVDybGz5UtSmb0DKKBFVDPJhS44LJcvmRLci3CbyBf4jNQeETkhEEkaBYzLMn3p
	pgSTmkmWncJFwK+Z9TDbLNWJUtQLohQJEpuu2zw0AAW8urVyPRyxslFXEqknYzJC
	gCBvRaAYMEVLpFznOqaXOapa2Koc3iFn/w8tIqjDr9gvBUK+cKlXWAi/Yjw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyh10r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd77f53db5so1624871a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430887; x=1796035687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4rxHmb8Mfs2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=;
        b=PBWMIW9d8wVVMtc5ke71vIOwqGX9EL2Ohj9DBbwULHGwKI0oYcBQEKEXS0lyliKNxw
         00i+Gc9Eb/K4Jj5IaR//NQs7eqFWQj/dPy/2p+UqzgoCgNSjKKayDfn+DMmlJaVbRzRS
         WbxkE6+CwknrIEziXzuYRyIJ0wtb9+XQxYOpYBS5pXm/jN/pHvz12d3iZOOQaiunQZ6R
         XXA7BFzlIZ97T2xagjxTtXz4+rsgAh7jpAN+9Q2Q6mrkVmxHQjpqh3EMhDRTqQFTKtE6
         onDEvVzA8Ca/ZxYcUmYuw5Gus1drooem/LV7Rsse8mEPvaP6wVuezAQQ6K0r83Gxsx9u
         3VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430887; x=1796035687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4rxHmb8Mfs2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=;
        b=x5JStyGciHoE5It0rR0Xr03Dl5qulA25TChlFYPdhxFf+l8/0je098J4IIH7RDu+R/
         2zVpMt9c08lKyVX9cBxFRJ434KSbeWGISUv4i5/LwwyXShKZmmtwj9RleQiCWhd0uDO6
         UBim658mzubmCLSFbrkgcr52PplgWLCPD/LW50CUcxFcK5ZGT+hzOOomhV8maoBL366p
         i/xeGLt9vlaF74lQPlXrSf7GoCHYyLCJK87tkdw71kZLXlRYSO0CCXct4hDEv+mrhTue
         aq1RKsDGXUkUUtRZnHgcCUh/XjM4gV8D2wlgowWZblVHgYAXIwNPRCnN2NCQLfal0Gt6
         st9A==
X-Forwarded-Encrypted: i=1; AL+hErH6OoNNl7zvq0+kBJAN3OXQ3XrwYxTMrZTCwxLhEnfSs7CLMcO6rD95ZOZSiavD+BxW7x6jdg0Fr914p22y@vger.kernel.org
X-Gm-Message-State: APuU4Z8Px9qdaSYb9iokAQ13Oy4tMRU3z1U2w+QpBdldM7FdQ7MyYkw3
	GTPAc+HI40O2PGMjrciU56ItT+9Pii3Ul8qEHSb/UFTy7zlJHbIedfto7PFrXcP+mH151dCQZT4
	I7Rkv3/MsrNv8KFmTdcxr8DXNhU7vqqftPakU0uvWBkjSMis4q0AWpSdcq/616ob7BH+T
X-Gm-Gg: AZFdTZdHFrw9yRSvW2FCX9Es3nD9DrPk8O5EWPAaRTR5wfA5EhYsd6SixjHhGxPsYYy
	k9ymSijJQsT1ZVobJgUZSbivi3Br3RgJrbHnrOXdXZ41PXV4/M6CxC6nBPuqu7yrT/9h51AOlVf
	k6Zk+55Qre6jhvfLqWAIQkMYV0SsJRAE6u2IQ/q+LDhUwyE5qeQmXTVLzB0Eq6JqYzYnOYJOH7V
	Qqk+ltV6LjwbKEqulT0RFAFt+qa2iUgVE8j8ISHXPJjjCOuDIJCDhchAD98OTLI4YZ3ISTo6+/M
	a8AjCSQBoHWertOTP3y00LZWUYzJhqjdJDtg62ZDQleR0nNNYJTEEKMNxPOO3sz6D3Aa0a2uNzR
	xWIHk1sUEX6Nf/DwC2HfTxW/fyJDhNNL/nyPg4bQ2AubTJyQikvSItd6XcgmFtBVwjSH/5aRUj0
	wk1x6bAA==
X-Received: by 2002:a05:6a00:3403:b0:8a0:3307:c46c with SMTP id d2e1a72fcca58-8c87cb4678fmr9206464b3a.36.1795430887528;
        Mon, 23 Nov 2026 02:48:07 -0800 (PST)
X-Received: by 2002:a05:6a00:3403:b0:8a0:3307:c46c with SMTP id d2e1a72fcca58-8c87cb4678fmr9206445b3a.36.1795430886923;
        Mon, 23 Nov 2026 02:48:06 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:06 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 05/11] usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
Date: Mon, 23 Nov 2026 16:17:20 +0530
Message-Id: <20261123104727.1539149-6-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=NM1AaE6g c=1 sm=1 tr=0 ts=6b0419e8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=A6Vjp3zFaTA1NjdqV2IA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX5/2+WYwgLcUH
 xPWoECHYT7U7LAnkHGZ9mc68AMDyUPbSL05E892aunl74Da8tNtUj7kjS/CMrzLm88uuW3wWyKH
 XtqEDBD9o/WbQt0Z58Vi+crhOGIgz70=
X-Proofpoint-ORIG-GUID: V4-GRhaFLjeGncLHKMacT5GLWiwX50Pg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX1E87s3OrfAtR
 4ZuE8t8LzhuCHaBydaFuuqy0LGmWE0zi0AAYnjvTssnCOLBkygwFfhs14P74ZbIrl0F88/84SAu
 sEFdJY/HAvVEEMfqL+3wKusbczE7VD0SbZC6kFzUOurBvZe6EyKi3JeupNTHSqAxOyk0GOmot7Z
 yLyJhNj1rDB67UEnvz8gbsLd/tkpvkG//lvtPWNKYE7f/KkKTHM7mtZJzy4vZ4yWx34BzL8ZM8Q
 VYz9FxHW3G4vgU+LGiWIfL0geTK9U77PtSs0dNPMuomGq0N1y8l6xMPo4EMZ/w6H8mmx4JJ9ENE
 5ilxPRTjugdQ7KH8Bi+583h+Fyhyi3o1MspXDCBs8dedJX4moXDQKTsCBNL+vjGT9zyaQfppM25
 1TGrM3Kry9gotkcUitBF3dLJG6ZriVzg/e8ilG5/mSOrHjmLXSmmIff6Q+hLEYfcRzqdE+1vf/g
 PvvScWdxwTBt3OzADxg==
X-Proofpoint-GUID: V4-GRhaFLjeGncLHKMacT5GLWiwX50Pg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

When the USB controller loses power during PM suspend (as occurs
on targets like SA8255P that fully power off the controller),
it generates a Host Controller Error (HCE) on resume requiring
full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
quirk (introduced upstream in 8b328f8002bc).

Read the "xhci-reset-on-resume-quirk" device property to set
XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
to enable the quirk via software nodes.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..0093ed24ac3f 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
+			xhci->quirks |= XHCI_RESET_ON_RESUME;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 		device_property_read_u16(tmpdev, "num-hc-interrupters",
-- 
2.34.1

