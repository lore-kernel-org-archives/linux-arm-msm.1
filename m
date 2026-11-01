Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555218;
	b=OOHZNaby1Cvy5YMoO//GdvnwxwTozTZlcWt5U7mzBqDQlubzL4BBGzdAhwXITkNxtYER
	 87aopWqcWXeSz4UWmDfSI+6FO9/euksmToys8YJBX1pzNwlaCU7xQbI9oZ/Sw3OWGcTzI
	 /U3CresFLrT1HMGYboJm615k8UJ0glsI6dpukrWKlNl8AHPpXs98ydIj8uMs4Xa5gTTKK
	 3BIqvWcKmDo5XNksE1pvnURSQ4HLPNZPxBoHW+hbCN8smzip8uG6FQxS69XvchsFyLJpn
	 /sU+k7uKMNbQ2AedKS+csJLweO/Jf01sTXf5PrKuW02COBWUvRjRn3x+vf5V4YQBxxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rxoPTuCm5jnMt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=;
	b=n+MEtLItzZG18/g5gF0S1/1bQFN9A23Xa81VDDytWy92q+tDUD4GLepQTGwgA/LrFgcw
	 E+JwGfxzQCwo/pHNc8Ew8ZF9444Ve8kdtdpBZAbLBiIuDZZJ2Uqck5SyBU0yr9f/bGfOf
	 vF0rchm1j5TjQo1FbjJzen6IU/yQ0XUnqKelPVpoxNuVjk4EmqLUEHr5vOHqrk8dSCOt9
	 hbLL9hTK2tZKeUMOfoPUFqSUgkUqQgejqTQ1zPm1+l3D2bJ0DGBWxet8Hsjfmdg08bbhA
	 Y0cZuTBzK5HkjnGsk8zEaxPtlpZGC1ZZWjZTsHnfNyQeOigFSRuDPbVeYxR0LkdVM4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TvnYnr/j";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7CMFDaH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB34606A338
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 17:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB34606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TvnYnr/j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7CMFDaH
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQ8ie1099024
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 17:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rxoPTuCm5jn
	Mt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=; b=TvnYnr/jScdaUcXnfFxUXJQZc+v
	Uarw1ebjlVOFEmTIn/HVkonGPRcHPLZv4m3fFrFDyHF58yHuzK96URKITSeOU6wE
	V0BWUp0sKxVocg/iu6EVGdVkPDwhuRpjFAigAouruPpvZv6KK9iBVactzumgKG3p
	y4GDeak6+QoOEH9dMV+N9S9tKmpmzQE6nvjBYoHtuqmM0J1EEDptfOAee3PywLBH
	y8sC2OAo3Yeg11Kz1iJqAnXv0f58A5WLZhtG+Hp8mZHCNdYTd3QbdNOrHtzaSxsu
	WEQbGBpWjgHthv4/1kqI07oMheIOnXlO4BOlNxFatVmhjcC9L0/qi2oK0+Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfuyd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 17:46:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea446ea8c9so25625235ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 09:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555216; x=1794160016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxoPTuCm5jnMt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=;
        b=R7CMFDaHMdNW54lqa8A0XZwThCwKzs02omhbKBn4wkRwPCAuzO+DTuBdGaU5cduEez
         +Ur7fKb/rrWpCrXHI4VxGFqsHg/Lrk46XJuzn8Cpuu4VL+3l7J5ypiRZtkilwpCxTGIC
         1/n22wOxevB/wPUzq/hbIfHiSlx6w/1c75ni1RXgL+BVSX/LEHyROfiB5+1GsfRS8f56
         THd+J7/ZKudLR2tcD7+wNWGSlZpx9SUW2AMx9x4J5gIhxYIHVxfaBXVM6rCd9SEZzAHS
         hf5fec85Ai2nK7NukTT3P4vv55VF6A+EMZbNvRJ/icQp3qjbFV796m4S7mGQ5/kgdtAD
         LyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555216; x=1794160016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxoPTuCm5jnMt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=;
        b=aMJqYfHGwjJ4hUAZtVSXytOD+FnRjyuHpwdXO20FXI//Qb4hq4992OnOBty9D7Go39
         XYwlwa2ParEmqJtej9lNWEBId1kKaZVt0KfRTcjcRzhedY4HS4VZz6Y5aCFx28cVtgGr
         h38bjEqAKlqAZY8KjBUu+Wyv6Ehj0RJfi+nD897uO9SqreUW9bASFZ4suQ9fMBog66nm
         3c8cCiXr37tCf2Fk9HTMsxVaPYNh56XRjQ9Nkgqpwr5c+IQHFuKVNtE5VYzbyRBsO1dk
         n/6xH2AyD2QCrn7P5RdXMNp9x9qVclz1oyQFN545bu7TZIXQXzYk2xS7ST79yRX/S7XI
         HzPg==
X-Gm-Message-State: APuU4Z8M95uYZihvACN+Q5Nbq05P/yu0HzkQ+tlP0d2xr6lAI8Hr7CER
	PDwvy5z2Ko3edL/nIZTQl+Q6NEPSDhQgz9cgmdnos7C2P2mBnmM5hQlSDIAq6dsmCk4sadT8rPi
	d5WvAnIg3KnlHrq8K9BDWUmLvnB9voqdNBEgUZ/XaxNZ1PLVWMM+8/FblTinrfZx/FBrs
X-Gm-Gg: AYBFou3zDbIHqkdLslnT7QO97Q7aa2mRyr6L9H8rWedbOZ0/ZKNuUHt4y/FCBbwAXXj
	eqQnXogC/DfLR9liPj1IShlE3b+S0LbwzRgC7tUMSKraKiwyYyl2plL/LFMF7C5txpQa6MJ5oAm
	6Eclgjhcatj3ElcdAMX4UzVdVqkiYkqT98J3PyrO3ccWDYU+UmaUQXg70Ps7QVbJdQTltO3Ve6y
	+a6HjtRdgQNTZhye1jnZ4KgE2Zd3SSC/5p8f+ntfduQMPOczu91IHET/MkVGi1gzSUTPzKUkjse
	qe3czPXyNaIqjVzGO18t4PeB+aV9aR4joQmTk4OzojPvDA20zQY2bHx57rzbXJM1Oyz33zGuq1i
	Fu0PvqTYSItEKQI+5GWBKiTyPm+89+SrtTjHW3daLT0MKEWtgZdhdy895S3a40DV2a3W2OSwDHo
	517nKrsDsDmZqJMI1SlO5keQ==
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr4535974a91.26.1793555215652;
        Sun, 01 Nov 2026 09:46:55 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr4535959a91.26.1793555215136;
        Sun, 01 Nov 2026 09:46:55 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb91e5sm6133348a91.0.2026.11.01.09.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:46:54 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/4] drm/msm: Add cleanup help for disabling IFPC
Date: Sun,  1 Nov 2026 09:46:26 -0800
Message-ID: <20261101174631.23637-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
References: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX4+MCiXQJN2Yb
 okvIm0xXu7VbkzqW2gH3RPapdDSAFdblQ/UUlVFcf3mINbN5ugZr0vLS0DgTsSeKIL0TPwmaTb5
 tec/2WDHPpE8xi/pQ5jbj3RoIlYPyWg=
X-Proofpoint-GUID: bY9DLQ_JUtdCurJmvyFDI3EYEDCGlq2Q
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae77b10 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=vTD2gfctXtM-Q-VHBdUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: bY9DLQ_JUtdCurJmvyFDI3EYEDCGlq2Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX4WRx7C111bJl
 Y19i2Sibwkikj7nTmcdR2OeLvu3ueXPYAbwLjq0WYT2jo4XFllbcDFPxXRWePlWf3BJ5ievdOPp
 3uP/zcIpV+SYA+nAOLpDriLxI/7iSGVj1mjuLwB0/pFp7V+HlbwSoQ0A+tiYc6N6EbHHu3t9xIU
 v88WnIDhhqBzrk2PdfFC4MFNQFKj45y12nWvHr+Ag597hMUlOpKCRXMhf5A9hmHYMsogW8LIDkc
 XOzHQsFKAYLmnHJqiqtJc52fqWyzJTKyjfQgkIZxfJdrCYCZkgkMkCZ+Bv4t+O47BLdHy8rjx+y
 bbKT4zCe1zSFjVdmLraVvNX5Sd2EoLuDGI+p9e96Bz9a3kmDNuHD3bQgE+AvS69gsFyGB7MsP7X
 8rx15Ykygvt4ZNiI3r3Sd/JdleKCAQWHgRRIt5RgE/J5vrb+lgeml1dZvnMuPiT0vEjE1T/+AAh
 ENpiYELR8L/xMga1TOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

Simplify error path cleanup for IFPC-disable critical sections.

Note that this moves where we re-enable IFPC until after the
wake_up_all(), but that is harmless.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h      | 4 ++++
 drivers/gpu/drm/msm/msm_perfcntr.c | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0334a0f604ac..e7912d2180a5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -399,6 +399,10 @@ msm_gpu_disable_ifpc_put(struct msm_gpu *gpu)
 		gpu->funcs->ifpc_update(gpu);
 }
 
+DEFINE_GUARD(ifpc_disable, struct msm_gpu *,
+	     msm_gpu_disable_ifpc_get(_T),
+	     msm_gpu_disable_ifpc_put(_T))
+
 /*
  * The number of priority levels provided by drm gpu scheduler.  The
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index 867dd476ed88..995857273aca 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -259,7 +259,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	msm_gpu_disable_ifpc_get(gpu);
+	guard(ifpc_disable)(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -295,9 +295,6 @@ sample_worker(struct kthread_work *work)
 		}
 	}
 
-	/* Re-enable IFPC: */
-	msm_gpu_disable_ifpc_put(gpu);
-
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
 }
-- 
2.56.0

