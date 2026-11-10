Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286606;
	b=f0YMxyhd/vmA1PV5lmp6v0Z1v4R36Rq2fKp2LF1guNU1pvVitUJ6LlMrpAfcXXr/Edmm
	 rCBrge+N5NqUizUwJX8F9BhZYeL/PTh2MygdQLeGCWbE+G/IggQYWG77YaB55zJcS0JXN
	 3/qpsAbDEHDFWuM/TSIkXDUAxUORDRz/BNQIQPpOd/HjcYgs6H/sABeFVdyzjfnyms4bi
	 BselPdGnTolbThewT/9LbXK26Gyf4zmgMVmONYaBB+3yd6cHvuC4SMDt8tbMgyxhuNBiJ
	 6MSNKrOindPzxVVGqeA7GIvQcLRCfWYIGfQRAQng8ibDmHupyOhoJZ3SVgjhCw+AdhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286606;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bLZhGhd54Eh6JFGUE7YuY2ODMIuxGuZYuXSHcnw4ktM=;
	b=MmV/lXqJsL+0b5poDqv17B4/+Sl8eJ+ikNXEzLOBkE/bh0HwHND8d8FGKdjUeP4CzT4G
	 myUWY5U1MDdiFCLogG0jk7hRXjg+bPMuFK9Qt4EcOoM4YrrzGqBM3ffUNtGZXCDg32HYE
	 LObu9IMQaEUvkNu0S6KnW5JpuIZDYCTFdbpsJFLq6XO9VuJo4xc8XWLQF76TYiXnYasvB
	 /eMpuP2onWh0oO9IypiTGnRmL8/h9DEY+yQU2w9vvlwQce3NqZAqgb+8JWxRnkTA5x0WQ
	 EM5VwyCAaM9VvQmYALKhaz/d+a8C73n5QkP7/gzFQpqAJtbNAk7g03v2/dqLlRNRcEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxdhQ6Xk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F76liToW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62D60A3838
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F62D60A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxdhQ6Xk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F76liToW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A7Mh2297920
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bLZhGhd54Eh6JFGUE7YuY2ODMIuxGuZYuXSHcnw4ktM=; b=WxdhQ6XkDhcOOeSE
	P17r5CQhmNPkhAroiEynqNkL91aSHU5Tu18tnWXsvO2f97MTyAGGzrqaFYGIw8WL
	maO/Xl5TvTxkW1RATLyqfrEabizXvX3WYZKBGMfAdCmqwAV3AJ6cmxposD/uklv/
	Yxw5e6E9r3rbGYvQgVYoZkI5byUo6y/YciR1q9AfLhkzoOyHYR4ucbU1yRlfbM8z
	6Uv0n1U/9AYoLXAJlRq30VleSNxYkNuG95UTKZSX79o9ZVd4PU8Ccv7rWqdK2wKh
	yYPVFgt5Eklzl/xnKRkFB4PRSB9ECtiHGF9+4epk/SpHNtRp4898wVBHuAF7YFa4
	IeLXsQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2n0pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so338772985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286605; x=1794891405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLZhGhd54Eh6JFGUE7YuY2ODMIuxGuZYuXSHcnw4ktM=;
        b=F76liToWAyfNBWY8Usf5d9RXF/n5iaQ2M0fCcaNwaU5nT+ty2fMUT4c/Y3Mw3ponmH
         ssMBQZECHljc60m/Cdc7HuSjupwNRC+k7NTpuxhQrSROkISb+3NrO+z2lvfyftpvzYVt
         lpqK3s3LNWh8iqVhYL8tnSn5OfcYdK9v3jO3TQ5S6KTqRxyHJVPBXgiw11d3o0g1d5Og
         +SgujrCdUUs0TQDFlN9gFqDQmjaSjWGtlX3gg2hvEBOPzq1ZY6MP5BhCrT90X3EQzPN4
         5qVmIIcv7q1+om49rgYlImxxgWz+imU08VBQYnCA4oO+GjahpFCRLBJEp8a7Zm4DS5KI
         20NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286605; x=1794891405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLZhGhd54Eh6JFGUE7YuY2ODMIuxGuZYuXSHcnw4ktM=;
        b=LgCnSr8MjbywIlWRT8lcXoN1Nars3Q8bVIwpbN+iuEGL3tqfJDfF4qpgewmod/v7qh
         H1j/NZfc7I8Xeo0UIuooa8P3wF3bDVGhORsuw+U5Fvn1v5fOcz1Ex1g4JFjBmCpRYFer
         kWmtz1qjAt7UZ56xFI0wllelanw8bCSyer4wjKv8mrXYFHwZuNOXJ3eq/PFbKbBk7HL4
         4wcJj7fyqIxGRth6j2Exhc+kJs/EOBIf7X8BDPsUyC60nni2rQolmzBUgO0Ybnjp74FG
         8WBTPMoEyS3C356LZXCwb1J38aVmZ6AXTQ6ppmieTR3/K2mJDdQbzFIWx3J/Gbtqc3n1
         ffHA==
X-Gm-Message-State: APuU4Z83f3eQ+JLJ8ac5oL/iPh+SaJ9QlefxJg+IAf923RtWzvkYtnep
	oHUWcTrkOIsxrYaDTNwuyTvVfiTGwg0cgMbVq5LjKhQTrGcHT5d7NU7Taz0s1bdeNBfI4ABiVJS
	SFl5I6KMDvNkzDSyGgYqsYqeZdR0hQbEu/iAkjVVYZpGqMn6d3UNrybEDySMqCD/5CYt5
X-Gm-Gg: AYBFou3dX/pDcjm2uJkomOFKBvM/52PB51+3dCq8CybEnuFRP8LKsYxbHRE/8EhhkHG
	kIPhXm3+OMzsvbV6aGQg5GfdTW3q85OE4VSWOSi+AW9UeYgZj+JWj4Ag11/6ESjwr9igsuMYnjH
	ZWqIN1rNNzf2vGRFSFSaPSf2cn6I6Sp3n28r6y3U27LQeK15EX0F90s86DUtsG1Iew1lV6SYUpo
	aUM2m/W5vi6CfLSMS/x0xzOs130c/JpqHz+yXxGROMf93HsT6xyKXsvzJ8LSwVCuzjRGvcJPup8
	YIJEsMqmrVVbj+iuflA9l5VvRwpSB+YzH0kBKQEG9CtL6UYGfgcjCGv/fstXZISQ3KRQUIb+aSI
	JKWGCiofgY/MxpQNixk0J6/2odbzqc6c03MUZxrOxkUQvFlhot0W/UB1uqLz/MNg0YCCj+4NXMZ
	bEaQLiHRvCvd3zkWxeK9uDiadraV5gg7tC/8Jc
X-Received: by 2002:a05:620a:4610:b0:93f:565f:e40 with SMTP id af79cd13be357-9479f31a225mr262558085a.65.1794286604730;
        Mon, 09 Nov 2026 20:56:44 -0800 (PST)
X-Received: by 2002:a05:620a:4610:b0:93f:565f:e40 with SMTP id af79cd13be357-9479f31a225mr262554485a.65.1794286604262;
        Mon, 09 Nov 2026 20:56:44 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:43 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:48 +0800
Subject: [PATCH v8 27/29] drm/msm/dp: ignore IRQ HPD latched together with
 an unplug
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
Message-Id: <20261110-msm-dp-mst-v8-27-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=1164;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=bfFHW5pac45fv2G/tLtozJ4WL3CywVJbvdGmDCdZZ9g=;
 b=9cbHRITB8rdqKvOioGVspyl8NOFunJMJu9syJCGcN6BNUDfuVhjXb/O6LBqe871chXyLkpnlx
 nRDi1g01szgBfSLz7Ia7qm/D0i4Fex+Cr0K8P7UCZ5sH5GHWQRIbFai
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af2a40d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=GWmhsmQFvB3G8ctGRoAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX9i9MhDO7LQhF
 3/SUjaCgG9cE5O9PEB1Lgy+LhCfw78p1ujnPl130idPDU+R3MdzYNZOer8gPHSERDrVyOLCmEeB
 xaDDLSSwckEutd9SSuNXLzJvmGWi30vyciQ2rvdsg9vkx/EN+NX5GdT4UgDL3jjgOvRfiJftxSP
 NUtFjuBu9NNGLbQBniSF9x1qQxm/C1nV2iSiKx1kx5ATbZe0YVtHKxfVQpp2peiQIZz6w/03xwP
 OBU4pIe7TFXjc5iS8iyvxxd7AXmf+OLGFENbYJG70xgz3alo6XB1FhcDrJck42RxiSqZw2OG34a
 tuy6RqzU/oD1mgM8NDlW+0rpCwLuSWkeTNwWcEKShYzdZwpotvxop8Pd5APBQurA1ixVnIv+6JM
 hAj29O4TGnHCEda1a7zi+5ZICh7aILlQr91rJR8F3YWaLid4oEz+zajUBkOA2KJqr9uxN9r56ou
 L438dcmO5nVxSdm7m9Q==
X-Proofpoint-GUID: TrrfyvmJuLN19Hp4TlZG2bUgT2lNHQMF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXxOdd0isHMUdZ
 nBFP9Wld/k9JOme0eppFFbMgPkY0JIjOZZLClFTkxbe3uiE52Q6Kawn4/wQ5TbTDM3YcpAcXXOV
 LpDVRPHVx1fnUdv2JMbZh5ubZfWEVHg=
X-Proofpoint-ORIG-GUID: TrrfyvmJuLN19Hp4TlZG2bUgT2lNHQMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

IRQ HPD can be reported with a plug or unplug event.

For unplug + IRQ HPD, ignore the IRQ because the link is being torn
down and the IRQ may be stale.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 40b2f6e120cf..8e30420a017f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1131,7 +1131,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+	/* Do not access a link torn down by an unplug latched after an IRQ. */
+	if ((hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) &&
+	    (!(hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK) ||
+	     (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)))
 		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
 					    connector_status_connected,
 					    DRM_CONNECTOR_DP_IRQ_HPD);

-- 
2.43.0

