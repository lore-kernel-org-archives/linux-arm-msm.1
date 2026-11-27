Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764067;
	b=lno85oJjmBuXlfaoK4kvwfzIhmQQpuwi45Z7/HIzQKQzxbtpRa6VZs7BhL7uybnd5G/O
	 l4Lo56QRu+Fgxdkxd2jG9DreOUzaDQlauxEc43WG9tChGXUwtJoVKUVZfFVMB39k4Pv9l
	 yoq8Ec93TX5+fnwEVw6h1Pz/AkbYoxH0pOGe80Z+TtWCib9jEJSi2vXDohBsGWUuZpP1A
	 75O7VtSPSqDIH29OF6O0/j88rQ9p1i4ce7lpTp9xnxyLJ3TrJYnGlDMuKRSRRMH5PikTK
	 11Qf092pt2j7W3OtfkvbOSxKgCBPTsE/PLUjfZELTliZET/265yxPEPnGz+H8SGUSCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N3VLZRTg7atUql7jaIGh5aZOxd3g/n+lT3J7hkQbOcA=;
	b=QlJIxMov0NXbz1CrKSbSfMp3/T1bzr1sBiCV2ArgYzlTQGvIdmNn2IuHm0LRd7ScP3R6
	 3F+27nCilfPfRDUzPCZj/9EQ44Zm/KOwLZ+Y/cLWb+0qRsp3b7BI7uceu8Yp2FJDzNxQo
	 3zxiR5wzIU7cbPHJ1MQUMQCd77m34Vdy1xlq+4T+jq1PdlDRS+x/704zLmGKcdhe0MyE9
	 +gCUnLp02VHNywn6U5lVurAslqPv5ISB7iroY0mP/UBOD4Z2d+xk8qlm7x/J0Ry16kclD
	 ctNt1EJLB0VLgtPn1gk/OELkHZdPQ8yC9FN9zRjbXNNs63MFHeXOCR75FYj3S2jozPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Uxgz6/6p";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtVdThmU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A919D606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 07:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A919D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uxgz6/6p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtVdThmU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GbwW3983840
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 07:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N3VLZRTg7atUql7jaIGh5aZOxd3g/n+lT3J
	7hkQbOcA=; b=Uxgz6/6pnNeKE67TDKi364JDz/B+3zojGUUYDXMGM2XQxJXf6IU
	CMa/C3fHW4w5Qs6peXQMgZP/CbNKI85e1jnpBwx94OCnOGNigvfs/Cqs+2YRlSgH
	e5KPlbXfI/Qaoohu8nygcMOftwiocECvRhc/Fj9DN1Qz0XBz/CvqPiNLliyRUzDd
	wYKlBSj87DMD0M6Z8biq/f0oXISh/n+T+bTpaP91GyGxvJEv7lwKlwkWln8JNEjl
	YDRJx+8SL1FEEdhotWQOcHMOc40TN3xknZlab0mmPGgU3rRIDRtk+bH+pIqyy0T0
	M3ZDQmxrxaEs2rSqVEa54tkBQUDNzTq5ymw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u499s37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 07:21:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b847ab3fd3so7774372b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 23:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795764065; x=1796368865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3VLZRTg7atUql7jaIGh5aZOxd3g/n+lT3J7hkQbOcA=;
        b=OtVdThmUwYUEg4cHkEkTblKpouSUM+9kNPMStReXfNcO5N2RboVN9au0lr5t6F88MK
         oasd1Ypkses6Nh44BoXjHPqNeWX8X4iujLpCtIeflnTY0Lq6ba5KUuNfThMq1a29Xgrq
         +YaUoLq6aTfOT1K50CVYe9LbfCpAI31nyDwyrV4+3Rn+TFJ511uDgSlC0yoqkkOoIbrJ
         IVwfM0g9ogSzhi6TacVWhCBw8MapeBNEt9rVzvYxQn8e5N+ob7PeLT68Ld/oMrQOtImv
         HIa7C2VvQcjXOtV0nqdfGshA1ga5b+KwDTHRwv1HGy/B7/V2RlFSvQZDmAHtuTm0br7m
         5+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795764065; x=1796368865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3VLZRTg7atUql7jaIGh5aZOxd3g/n+lT3J7hkQbOcA=;
        b=tvA3Mi1cIR0oxJ3vQO6b/BV2xO0bX0Z/BONEGJ/10XUHw66ZjhJ0c6GvfUVmin6IR7
         FokEbuqUv0iJP0k+/oRPumUQG9xa/d3USOhNLBogDllxGVI/pbdqrYCEACQ+QO50T89o
         KaEC+ELX7LOOlm2IUPRRFcOu8Et49FhT3TWxKtwvVEU4ABt8JUp+2FrH9ueSialstIJQ
         tKHfDcEJD6Q6dgITqcuFRM4BztEIT74WEjF5ZTsOzXhGaNtoYOKq28Jf/bdeNZ0aQTOQ
         OBIx92o1zb6bgxWLqnf+cu8Nz5yr4VeQC5wJGe6/HCcrJEgeR7OGMYqKam9XLvsMWCRj
         gErQ==
X-Forwarded-Encrypted: i=1; AL+hErGNMjkdF4l52qOdJwUlV7jrS9q9RCJ33dKE55lR2RA6+GijeYbQB3WaFShy0zeAI9FsxIbz2RsCRGGOkKrz@vger.kernel.org
X-Gm-Message-State: APuU4Z+zmAFpYygTYgbTNVbvN13oYxjbXbvvqMI3OcFs7PBvdwAWuJfl
	Ita8VFJn879Mi3o1kB0gQnklU3zIDu+T1gkJ07E6WBfND7WhHKhuLccxeAipSzw6xCWQexS9Pt8
	LAAHexc6ozyP+OYnieH7Hhdptqnxu2HcWJbndpbodYvdF+j2d2RmItEg8LAgpBfN8qAEF
X-Gm-Gg: AZFdTZd302iXV75sLkKQmvVl4H1KMj9yNYodQ8r/FhkiBZlH32ZF9JVfkEfeQxBZnyh
	0NVt9cwVzjOUldPzhZsZJCqUrRrcuNmYROeirNuiSUyli3DI6/0w2Ntm1BH9jSRUf7dlzDkip+R
	r68TE+MgRiX04tf4/hTF7Jd8OVc4vF1hDS/2h5p6HIVCsLpPBzwh/SdH1/fwVKpPmu3P6gd3LiA
	k4WsZagqe+KTvfWDBDPWD4RLtYK1GahQ2Uxl/pu8o+mDXKZiOa4mwfev4gTfOK8vZ0LMXXMlWl1
	Rin3P/f7uQ42vfMT7OSaFOvKW+DMTK5COWa4hy7suymVK+AeCINxX+266SJDK6GZs24KXKHJ+dD
	Y3JgHwBrgieMtNovzG381w+T4AhDMwbldrQRWj7ylbmlvkd6KbB4kSILDIpA2zV5jXdx1h3PqQQ
	==
X-Received: by 2002:a05:6a00:39a6:b0:89e:f8e9:205f with SMTP id d2e1a72fcca58-8c87c76a3d2mr22911768b3a.32.1795764065160;
        Thu, 26 Nov 2026 23:21:05 -0800 (PST)
X-Received: by 2002:a05:6a00:39a6:b0:89e:f8e9:205f with SMTP id d2e1a72fcca58-8c87c76a3d2mr22911748b3a.32.1795764064687;
        Thu, 26 Nov 2026 23:21:04 -0800 (PST)
Received: from hu-vnama-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f83dsm12028947b3a.39.2026.11.26.23.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:21:04 -0800 (PST)
From: naidu nama <naidu.nama@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch
Cc: naidu nama <naidu.nama@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_mkuntuma@quicinc.com,
        mahadevan.p@oss.qualcomm.com, saurabh.anand@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: [PATCH] drm/msm/dp: Skip IRQ_HPD handling when PHY is off
Date: Fri, 27 Nov 2026 12:50:52 +0530
Message-ID: <20261127072055.2144407-1-naidu.nama@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: ShwCZYzXEao24DpkhaLssZKtk9oTHzrV
X-Proofpoint-ORIG-GUID: ShwCZYzXEao24DpkhaLssZKtk9oTHzrV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyOSBTYWx0ZWRfXxCw5yFqCE6dJ
 fD8opaSGkrQK9w2gRNzOonrBWGQ9nUswRLce9lNDiivnkR2i+LMb2uK8KZqFSdDLFIJaDKmwX93
 JK3SKs34x/x9Epv5Idhffsss2LWYBO4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyOSBTYWx0ZWRfX6M+Sa7UaDZbr
 EJCFRfxYnQgAsFvZBa4CDV9C31ZWuFsKqR0nab6SYkSWuTTS08hTF46XhbRaCJwg/PvV+v1pY6u
 wPfDvjsiQU4lc7ki2MJrqrbXV7IGamRjSaFR+mIiYLpZWm6DjtfoadVE09ATYtYc6rIDRE4ScRf
 hQHRRZRE2MrRMMgFmG0fCmuYaCu8b6wJHJKDuJSAX9cIC3AQ3dZJOVNO4wCe9YGxjxcwot/SIoD
 KSZYukxkweeA4HMra+6eZdZ83bQdpyN2m4GtvUGXpdPl9q8NJ8IKmIbVmTLkySGnuaxlm2W7Kda
 FhyDvxbc7007VkeXsZ3YKpBPdnHWsPKwvnlkyCqB3Qj5JdySW22rHKW2NBGgdpbBETTfQw7/WF7
 4ASPJIKWcrOBVEInRZlIbpHkwyGEqt86SDVdFoMZ9k9gvhfarHhnB0ZEeSRRYVJtBbYZ+pLfaPa
 CmV+uftC4lPGt9cR7Dw==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b092f61 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=oFY2QqT7UXJjKgy5amEA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270029

When DP is plugged, IRQ_HPD is delivered when PHY is in uninitialized
state, In this case avoid runtime-resuming the controller and
attempting AUX access for an already-plugged, while the
PHY is uninitialized state.

Signed-off-by: naidu nama <naidu.nama@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c0c150e2c575..79169c1f95a5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1607,6 +1607,11 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 	u32 hpd_link_status = 0;
 
+	if (dp->plugged && !dp->phy_initialized) {
+		drm_dbg_dp(dp->drm_dev, "skipping IRQ_HPD in an inactive state\n");
+		return;
+	}
+
 	if (pm_runtime_resume_and_get(&msm_dp_display->pdev->dev)) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return;
-- 
2.43.0

