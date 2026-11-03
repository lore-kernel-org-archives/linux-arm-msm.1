Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747946;
	b=M/xOI4A3PEtIzl2kgOB5VVzhv3I0t28xGoz/iS5f/IhrSLaBY1lM74pF0w0ORQsKtmRt
	 NlinBVqwMk+tsWKKGy2LLjN5NDcCI3E4A85/7MAZxkQ8M2JuRdclN0jTIunJWIAkvr1AB
	 sDL/5+kz1HD1tm7ZgBlaH813QbsuyahMaWDtWQjLnUhodIe6GhV4etmF2pxaNm2GCiC4Q
	 TL7MyfkkycEmxQSrG2JMeMZJVTwZBM4uJ2V7suNzAHfkGZqDBi0bSI5smbpz93jfOibTq
	 1YSQr8SxZwHBs6H2dkvdfQDSSXFoP9OgMhcWCzgCjMchh/MwLMPyg+8Iyl4Yd5lcfAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Yu+UuFD/WjiOEoLie6jGRMxfHMmEcnLeHN5yHd+Id0=;
	b=5fJbat/LkiyzUX/fcj6WentTrGsC8WUhq/AV9tTrAUgP/i1KFq2R604D63w31UMy+34v
	 fe3e7fL8uPILxe+i04mO6VTHO7HtcBopluyTEUHi0nQuFiYezP3U9Y2L/6lJlog3zM2bE
	 ce9Nl4V+vUklaEQZOudkwllQKULYL5MPMepLcUHkvXHB3ARX7Dp5Zm9E121PWHZHPbA0k
	 PaHW6X2kVrvtQc9jCUbVJAceYp8aG0W6iR/8Wz3rv965rowJcdVb+jz9cqIrIgNPQ5mMF
	 U/6F4jDPl0i0Hq/H4FxuZNvCp44je11b5R70d2BNrc+xhhcIoPvxPUnua/Vwi9Gr+4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TE48tcIA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MLYcH8xX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52064606D828
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 23:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52064606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TE48tcIA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MLYcH8xX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKwoD3065660
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 23:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4Yu+UuFD/Wj
	iOEoLie6jGRMxfHMmEcnLeHN5yHd+Id0=; b=TE48tcIAvHvRqRR9E2KJ4z8RqGQ
	SgqFO3i1MlTELD4gNTbHzsYKIFI1mP2BW7xfhwkNLndSpEkaGR5CfmITdE0xPk71
	e4DBeQgFCfXuJJwCdV6t/z5qP760WNSMxJRIUyByDd33HDFpk0LIw5n0VxCUI+m+
	BIs0a1+gsi4IkMuoT2w7lk6CbnuakYNwrDFjbqIG0Rw8IBBH+/wcn/5P68QVawKp
	7AUutbsxFMSOlZ0SWmPKsuHfqMjWkmFXqw4yDNCKxNqcBxMx6cPYIk2tQixKV1FX
	h6U7bdem9vyt77rHhIXrXTwKftlCEPO7qwjYN1i9k1TBkmUDJV2cjU6ToYg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bt7fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:18:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06da65d92so100282b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 15:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747939; x=1794352739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Yu+UuFD/WjiOEoLie6jGRMxfHMmEcnLeHN5yHd+Id0=;
        b=MLYcH8xXfFr6/CNtNBHISqLOO63CTZAXXV4fcz3jNmHN180rbaS2Vrfmhpswx+bjfR
         i4Wq6X4NdzTpouVdYL5hjtEcm5UqSbCWIFPwZCzaoAxY67b83BWZO3qP1zUQmLFcnm7m
         VKb17qh6g/myTSLfu1RD4F1NLTP4NzVa8wdi8RqxTpuik8Cv028juyVp3HvBbIHCmcRS
         Jix0cBOWTm90oXSR++ruDts4ddRWA8qqw7bhAlUNfoBcH600ynBl7CV0RGAGSz5WOxfu
         CV27R61PnjLbvGSdym1jlZfsiAJHit+TvR+lE43gN02WOnHRDZJMJrovw9PbJ9hC34Cu
         Ilhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747939; x=1794352739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Yu+UuFD/WjiOEoLie6jGRMxfHMmEcnLeHN5yHd+Id0=;
        b=ymqgSi6Q3gQF3EFHU+1frj2YSYwi3fr5OqLewa+FnYRZDYdjNrc/sBBp23xkG0FYh4
         5VT1X4j1RRGBsP6PdgHQ3rIndS8GkGJhknhvYz2JbFzbDrTaPnmZUdVkiI3lwZzpLJ7N
         0UzET00Elki9YoY8eVDT+1Eh6EC4VU0CDEsn+K+97koa9vEujYpx/+5jbz+/3fqv5Pip
         793WKIQ6SCxv/NoQmFaWIQjBajklUyDvTJYeY5180nGwBvgPiCHEn5wORNl5KtAdHIm5
         aqT4QQavmP0TBh24LCYD3L3JsNYawIcTVLFsIKGLiueClfacEQxF3DHlCmtyZxytM5Yt
         vz0w==
X-Gm-Message-State: APuU4Z8c85m1fEjp94W3cPRCjwRGgCriNRfEV3A5ivN8UIgPCJLuyyCD
	1SfCcGDgqs28mrwz0A5AFQHvoeVxU+Fn/OcJSg31+UbYi6IYeG2Az6IS4PODypejIPjhBvh4hSt
	IH5X+8cQYu5jl8LE1ghLtzMb88hZV49f6xJ53Ct97k/V2pT9QYSRqNlS4WM68TehioyHp
X-Gm-Gg: AYBFou10wsnaF5Owh+cPP/glsoDvWNivi9TI97Ig+39iY1dfW3EXG1cNypXP6vh2NfL
	bvj5h5p8QmxNtFMKt+yE6nDKUSzlenY5cSsavLPS2lsgpLtY+2J87vF8OIdQYqPwMem4VRr5jR2
	DxA9MdZSOSudqfs7FL2K6VaIIBZEuXG57LG/Ta4CeR7Q6zHYkeZZGjuAMTs7TXbTRb+WBuceUzS
	8UNWKPTjns9w8ggGfwHDT1/0xEilOrXANCzyli6IryNPKWJ/4ZaDy1XJd9So+8YDwdwvHc0dnp9
	ZcTU22Us/omBOUbfIUnVoLpVfo/VEiTQEGDJqhSpKzP1xRivwu5WbClV4fNT7Bv68W1VV3R1Rs1
	WkdwxuJaSwXNMipupDCcPY5U2xlmil1mUQg+G1upViyn+Y4IWFJPCQwo/B1njB0s9GFZ+biXTkq
	lpC1aQ3E4Gq1to8Vb324oUiyqAT+kLBWtv5QsNm0NkCvw6xX2Z07DsIB7UQRo=
X-Received: by 2002:a05:6a00:10c3:b0:878:3538:8f7d with SMTP id d2e1a72fcca58-8a9bffd0f9emr12878360b3a.43.1793747939042;
        Tue, 03 Nov 2026 15:18:59 -0800 (PST)
X-Received: by 2002:a05:6a00:10c3:b0:878:3538:8f7d with SMTP id d2e1a72fcca58-8a9bffd0f9emr12878328b3a.43.1793747938577;
        Tue, 03 Nov 2026 15:18:58 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af918f2sm144319b3a.23.2026.11.03.15.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:18:57 -0800 (PST)
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
Subject: [PATCH v4 2/6] drm/msm: Resume perfcntrs after hw_init
Date: Tue,  3 Nov 2026 15:18:41 -0800
Message-ID: <20261103231850.17493-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
References: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX2QMtJpCu0xrf
 fcCzg3wOkfdtaP+MgPxPPP8oQum3s/YUe1azyE/aON1xVrizt6xHarjkMxsG2ytqKmWq2bjYg+x
 cECA/fkhbBIV6kQIgaVkbuvmyX+NNCk=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea6be4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZcLbcdItcj5UGiXMI0wA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: fQIwYZ73U_lp8SQl-6SbqBiwEZfHPeKc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX7fJ8pPHnXSvs
 s36fJ2WQl4iSOgheQ//ZuBPfihoDXixW00GUtCQTuTLOUK4Tylg2vHRAIAfL1s6A4jjKQKjEAeB
 5EVa1VzQYudCVho+pbut8w+K8K3APWMA8tJUd/mye/fQG29dUdyytPrL4oGTMrbtoOqwbU7ezsn
 +fFN3K7/ayPtgI9180F5jHP2zc7e2edF0paCiNdaQRDHB10XgXYTGKXHc9dvxhRzelM5xEQbzUg
 6f+jRkydgKNiTkoK/J7RnS+Yj4qowk+FW3gqkMJI7B8vm+uY84U4Ws5BwfLz5reHGte8+wTiinq
 RkX6tU+6o03tr+qf43Fxi7ISy0GUBjligzpAA1I5i3H7SUx3P6ymBKC8cFizCoArRcIy104hk0H
 FRPEOUcDJArjbOx8zsX6UdCoSun7xTCK7Zf+qvjZG6gZ9csTLjCCGPHgKWSxZ1ucU6sdbX6ok4S
 UzulMzSxBhxZNJ8SsdQ==
X-Proofpoint-GUID: fQIwYZ73U_lp8SQl-6SbqBiwEZfHPeKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030092

It isn't really useful to start sampling counters before hw_init().  And
the next commit will require IFPC OOB request to come after hw_init().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 1 -
 drivers/gpu/drm/msm/msm_gpu.c              | 4 +++-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7108d4aa59b5..749269843e42 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -309,10 +309,7 @@ MODULE_DEVICE_TABLE(of, dt_match);
 static int adreno_runtime_resume(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
-	int ret = gpu->funcs->pm_resume(gpu);
-	if (!ret)
-		ret = msm_perfcntr_resume(gpu);
-	return ret;
+	return gpu->funcs->pm_resume(gpu);
 }
 
 static int adreno_runtime_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 6db6cb7eb287..d074f4df78f6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -720,7 +720,6 @@ void adreno_recover(struct msm_gpu *gpu)
 	msm_perfcntr_suspend(gpu);
 	gpu->funcs->pm_suspend(gpu);
 	gpu->funcs->pm_resume(gpu);
-	msm_perfcntr_resume(gpu);
 
 	ret = msm_gpu_hw_init(gpu);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fb07803f5aba..ca21b3bf20df 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -168,8 +168,10 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
 
 	disable_irq(gpu->irq);
 	ret = gpu->funcs->hw_init(gpu);
-	if (!ret)
+	if (!ret) {
+		msm_perfcntr_resume(gpu);
 		gpu->needs_hw_init = false;
+	}
 	enable_irq(gpu->irq);
 
 	return ret;
-- 
2.56.0

