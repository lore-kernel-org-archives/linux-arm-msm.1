Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BE0346E5D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321345; cv=none; b=Hjem4cKzH6K5YTKwdrS2szkG/71NWweIw4GEaRPyJYpZyoG77xUMqbtmpdtJe1l/PumdxHWEVJEgvpZ8vw34bkfEYCeCUqzndBUr1MuNQAWgVcfpZQ4DY8GGXaNxYjpREQAxR5HTo59gsFEjhBGwcVhzrd4PuwNQK7FVBQ81k7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321345; c=relaxed/simple;
	bh=GxZFku0kvsa3uEnAi/89TufUaclwCvO3NT6bp6hwH68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDGhZVD9SV9RpLccwgVs1Jfsi9HhtbTUOVf8lmwRos6HrwnchTFEWpMUtFMhECX+UUoUjo3fG6243fPVLVBEiJ/mt/4dY+xLGMMrcbVBrQOkyaum7TYvy3h+y3J32nwj3f3HhgnP7aB9axLDGn1tZr50+wtI/d4RwcVE7BQQsa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPwoP/H3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KR/SJjii; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPwoP/H3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KR/SJjii"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtaRo3901635
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6DIg0hlu8qf
	HUQoWpRSk0/2wgFEbxEIf2WTCugbqRdk=; b=DPwoP/H3ufNRn+Fl9blicbA6v56
	zh8FQw+VWMQbbn1ixbGniXIrBG3RtMHYj7jkOWIgH3fxAUCQWqLRRUekRUzktYBq
	oG2akPAGgtX6E10yRLFQaL2nIoeZUpqSl7jO3YhcteDs7Pwp64hrLUGNKoeo9SjQ
	jdxMeMxxqySY9Hca7/gD5It7E76IjBUAGMjFx8a9PTRS85QLbfxH00NPZ7ZsK69E
	vuyrUYmT9tKlWcHv03xreoztgA49JpA1WPetKmf/mVklKpY+Twyruq3uWJ5ltNGG
	oEy+8sfSZNxuMDbfTrPBRZmHnwmT5LdqExDObrwUOVI4SC/uKwCObBEPIyA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffqvf90by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccbb61893fso174034275ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321342; x=1784926142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DIg0hlu8qfHUQoWpRSk0/2wgFEbxEIf2WTCugbqRdk=;
        b=KR/SJjiik71uqg3SHZgoWgh1xwAcs8qYtVSQe3VqBFTNpwMCNx1jyEy91xItRFpxCo
         hqb88zIzrSXCjY8QrpHaHa07unBzICrLy+G5gvB1rC848I77Rn8V+INJpgwzp063eny5
         /IXJVubuLbrwjmm/FWZAD/PM4zHx1foahEShwmFHaSkMkGX6nnGPA/ELPJoJ2v2YZyxK
         yHrRBgxWG6aBT1mnpqEP6KpgPJyLVK6zkM11sifrsUdpBzB5c3Ms2OjjUtI5G4ldquHt
         y2huggKc5vEmRNAw5b0lP/Reu+FbVEbdgO2Hvp9NC3sq+a29AC7pQdFH6t8qY81hfANT
         0GpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321342; x=1784926142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DIg0hlu8qfHUQoWpRSk0/2wgFEbxEIf2WTCugbqRdk=;
        b=MgYUUWrTYyT/jeOljxbzlZSjX7Ef8Z0fHgSsDEqRxvtfrxyQrLylaImJv8genb/+ER
         B6oyenAqkYmHK0wBWLHHllAgmuy8+E42xOLsr80Ssv57CGKH1wy2ek6Voz5AnHZVRtHY
         zHkANb4miw5Z/AGSdc4/0b08wSP/qqUsACBj8JIGhRgpKX9paAuAJQ5rzAnZId4I3YRa
         m98xsbDxrAN0bAKYZ6Yl4VvNwHwNY8QZSDwqBccIAlWwVIsFWoJ2uijOPrLyBISoTFdL
         zMjXagMU7rdtmD9gsF0OECa0Kq+PyvqTTUBtXjRZG2gmoCFrvJcBN/qaotIwrx+30eOb
         71yg==
X-Gm-Message-State: AOJu0Yy/HSt0q1t5FN9zI0Fvb+hNgk18UCLRNQVaIvfeHgnIcCLTeIUH
	fVF1zDP1cdVzzc+X1V58NYEPQKn3e2mu9YraNFFidHv7F+m/MdKRM4w05cH4xAhDpvzrIVl+F6+
	k9fKQOHXc+rHLhLgA5p6v6tPBgHer0WJn2gl7wy2tj+MyASpUtDmDYI4aFstmQ3NHRgl/
X-Gm-Gg: AfdE7ckqc9ggu2S6y+oTaD/mBC2v/igcjHi4ok+C0KFQqy2mv54qcsU4bZLds/1I/cZ
	WYg+Mdy9W7GFzSTzkhsJnwB1VQOJ4KHMx+pWF8iiIKljN5bzHtnohrP1foqHKdtCz0V4E8v95sb
	BN+puR03scoREJdY9rNvJ2wlKEvCMC/mjpPzNlYyBsQb5FpPOJHTRZnBZm5rFu2BmfxjRTyHjeE
	KopcRi1PulM6hq5m10go+83Ojl/qTQVHHvEkP8W/onPIk7isAtp6XORc3rwlTvlYgjbj8x0Jc1y
	q9j7s0BrRknCqbL3XCMmxQgiPc2IVv6J8lfV/iII/VAOzpGCv7EHp3ehpMPCvUcijnRIoINInXJ
	C9atpCOMjkva+VmcyxY8Ae1JFm4qOYQ7y7KXAAeHMOqlnr1g=
X-Received: by 2002:a17:903:1b2e:b0:2cf:32bc:9722 with SMTP id d9443c01a7336-2cf349979bamr46951095ad.34.1784321342393;
        Fri, 17 Jul 2026 13:49:02 -0700 (PDT)
X-Received: by 2002:a17:903:1b2e:b0:2cf:32bc:9722 with SMTP id d9443c01a7336-2cf349979bamr46950785ad.34.1784321341975;
        Fri, 17 Jul 2026 13:49:01 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346db036sm17221035ad.46.2026.07.17.13.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:49:01 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 08/16] drm/msm: Add helper to check for per-process pgtables VM
Date: Fri, 17 Jul 2026 13:48:24 -0700
Message-ID: <20260717204841.26120-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
References: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dpXj3X--HTZBqTpZ2UbuRBHY36YOk1W-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX0o+8DSg4r6kf
 5qaUK0BIu9Sj7J6KokJZw4j+VEGAFqm4PS71P8inTSDkFqGU09yw+4iIAqmUmv3g+2OEVFc4yhC
 KYWnRB3fUnBjRrE0TfZT0yv91ikPksv0WEDKWkUOW+8ajqNE/bnCbsxAxgW+rIbkJ/QWjcW4GMj
 GvXotwKTc5R1pglhB2RhPSrxzygnF/K83vFQjCoWLGYCBt1/SUMwBmzUzSfFiLUttTPzGwYvK7k
 aN43tSQ3fCG75ekpu+3t0/0RAj403Sq4ZKlQKaO5HEJBpdVTBKtX8EDpWc7j93LAJxGmGULkeiy
 ZkBP2rsFL9TVOAkhXGdD2VIoZhC2A/IhSWEm//FCfKlijqCouWWh3H2o1yydCWbzg3Qco9Vwa7B
 dZC4NICqPIqhPvFFmt7dsvnRtsfQcoF2oreRE1lwRXuAC9v1fMTSQQ3CQGQ/mJUWPUiutQ9oS3U
 mDHYnN13Zik4k2sXS4g==
X-Proofpoint-ORIG-GUID: dpXj3X--HTZBqTpZ2UbuRBHY36YOk1W-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfXyycsfhRFGs8N
 YcvGTano3IWC5MszbblTdJcuT+XwZMhdJHzq5phCkNIo8SjPoeVkA7TLQzydAHwfkHC5xkPIL8v
 cY+gdNs+tAWMCOZb6sQizMy2fGOM/yE=
X-Authority-Analysis: v=2.4 cv=OPMXGyaB c=1 sm=1 tr=0 ts=6a5a953f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=4aDCzPfTH0uMOhJcsooA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170214

This will simplify a following commit to allow lazy VM creation to fail.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0d54141ff089..5738eac9aebd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -356,6 +356,12 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
+static bool
+valid_per_process_vm(struct msm_gpu *gpu, struct drm_gpuvm *vm)
+{
+	return (vm != gpu->vm);
+}
+
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
@@ -414,12 +420,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = gpu->suspend_count;
 		return 0;
 	case MSM_PARAM_VA_START:
-		if (vm == gpu->vm)
+		if (!valid_per_process_vm(gpu, vm))
 			return UERR(EINVAL, drm, "requires per-process pgtables");
 		*value = vm->mm_start;
 		return 0;
 	case MSM_PARAM_VA_SIZE:
-		if (vm == gpu->vm)
+		if (!valid_per_process_vm(gpu, vm))
 			return UERR(EINVAL, drm, "requires per-process pgtables");
 		*value = vm->mm_range;
 		return 0;
-- 
2.55.0

