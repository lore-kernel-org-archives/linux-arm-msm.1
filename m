Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380185;
	b=wkHAAwLELvU7j87HEr3dWX0VuZXLVEjoqv3NFx23D4c53qynpGXiWOKLvC3E9guFxgHN
	 vauHhEqR2lTCJHe1G3EPAyPTqEAppibfae3beohOqloH8vApPWkjSXOnkFqgdMM+l9w5Y
	 aoQIjf38qpimw7DnsgVEjmX0Y3DwvXC8/StL9LH+kRufIC6UzoMn/UB9ttiM1QS/SJN/t
	 Su/ptA+hafKkWDrcqWO71kauQsrqvytsZkniCS57cRhIEaZ62yekHSZJ9CD9ErsS9JLNf
	 yxIZFhjHuBLZzM5cW4azqC1CoLmV0qcvoJY1jHDIEZb83QmYZ11apHikz41txKo2K0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+pKgN+iyHM+dHZqnvSBYkvdG14OZA8VI6MFzP84UyBw=;
	b=zRJ5lBwVXAEnOxVEQ6XCQrtWIwKtFRYXhAQmkWUfd/rBuDg1qKzsJCpIKK/zuFsRYqTu
	 wOcyBvq3cdOK/w7Wc7l70TvDKhvo7cGAc8odUTFqEyYSt6Nn+ClJ+FmsTYwKWd9oPOqYd
	 06KY58IrKhMzOIFVv7tZsrf2fVekD8OtnwFfSCrw2VBdDUUHZLrFPrN9vqsdZItOom6E4
	 eVyuvEyAP9ZNecypg1tm9WS4gYzCksUQUaK5O24PAIRwZNoi4aiTUCEGo8XETpSJ6CGlH
	 Z1iVGqRTb+ELvTc1czdqdJ5WS+fSlheQnj/S0gjpQ7Q1mQucQUUPwijLKASak+6mIjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m6ZHmLGN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5UbC7Ou;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BB2606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43BB2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m6ZHmLGN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5UbC7Ou
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERCi33564383
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+pKgN+iyHM+dHZqnvSBYkvdG14OZA8VI6MFzP84UyBw=; b=m6ZHmLGNyJ2nn+bg
	VkIEbxDtWdCFX6ztB5uVioliUHo8SAtnClaeB2ibGq7wRxB2d3jXgL+rSP5L55rx
	elj12CqNDZc7gyXU+XVw8tM5ABEYXNBgHcp7cgC9WIVZTZjMpSI7K9bD3M6hcBjJ
	xtpgcX7DOq4siAz8cF2KIU1b928saqkRAH3fS21c6Zf01gr4Y9GAVH6Ztig7Vly/
	0ZD2cz5n5+T8k+d2kUZedYtUKRYh6vQ9HnFj2nXS9f4kh6FuCm6ErGfi/xWzuxe/
	v9brjGt7KSACuO6pZleB40og2HSIMpyixdMsvwLPu1k/80FC8ANWZd/SgxGVgqrn
	bdRLCw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm41r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:09:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so972171c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380183; x=1793984983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+pKgN+iyHM+dHZqnvSBYkvdG14OZA8VI6MFzP84UyBw=;
        b=T5UbC7OuhQXZUhHXXTyy4XlXAVhHF4r2++Lynjqdh+VR9HCCn5UfYL6Zz4No8JNyb8
         JW0upRXKJyvqkQvN/mw3wgBixJsbFrvT/dk92UdVNX5jNt+03ovb32zZ7mvv42TfDtFt
         MP91oHDfOpNr3EMMRJxbk9hkPwiGYTB8aj1kkUnxwWzkjLD08pcaLI/g44VM2nRHr4Ug
         pcyDjc59Lns/isRtLQL6k7EZlGM/gGV7amZLy/qExIARs9/vDRH3N3vdgG8lt7jHEgt6
         whKifhN8/c8JyhhK4wx1ExKsNDWa1KZiXQV4HlJU92ENdoP7guEk/xiKXtuYkqhV9Fow
         CbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380183; x=1793984983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+pKgN+iyHM+dHZqnvSBYkvdG14OZA8VI6MFzP84UyBw=;
        b=veefvUmqq9wVybesIRN++hcZqlgLCam5mTgH9Hb/3nojwL5OzM5czM0Ka2YBigyfHZ
         akL0yIle6PbTOONGgmSAK7Sn1WGZLq7QJHIE+0r8mXk1vkKGS2VcHjzqSvcPXekTnSC/
         oviFYGqTxzkwRhkdjkNXUxrOzvhSHBIibTZDxYOlnA3wKq0OOCKhIHJuZSib7ODRFkZF
         yrdTmwk9hVwZN1VFLVvsPqS3ysBcuCiZS09cPmV/TnpJGXBVB8iTeAV3M3fqiUlIdL/M
         XuLe59b1X870QRWM3pXvZI7QCoLyY2vv3+7Oa4TEuqBp7udQ620fF7+vjsxBFd/pbSnv
         rXJQ==
X-Gm-Message-State: AFq9FYKUwOY5AGlpkZDJu3CrLudrfOu3bHMNKRU1RxKrwScsFf+ZpwmI
	lpLnNmffqsDLR6diN0Vse+O6PJWYQO9aFI8zskK8cKoEo5UOrwZSfH3Zskv6R69VgfPtzqaIjXV
	z/sV6Y4lcEyyz5gfhsTVcGDgAVdW2XZ4svoMWJG9DdOCzbDYpm2GGQgzCMfkp7UF8IEKK
X-Gm-Gg: AYBFou0Gl4JThf0P6QPCXeRKYYvLAU2ETxTUFu5GYmeZLt8XCPvyM2+aD+D4ajyrMM9
	3Zffebyc/Yp9+uNignbguUmjANIby9PPbCw4acNrEaPUNgjT/iX1/wRQ14tyyz7OApYOb31CN5j
	odaXs4pxsW6/7ZaXCucBrWHXzCi5o5VAoK2g7b4wd848VVGsV6xyjcEafDppHxM3Nco6/NQFupZ
	weraA/kIWzMoHJKVoxBPIjq3wxXlOS8fLi3OhH/Yquj3DqSc9nQ7V9Kyz3P6lMPVzgsmFa91ZxW
	bMCVCyRlbacng9pl2MbUJKy6vL3EJVAa4Xs//YAOOEaEpmWlTYw4fSaEYBcr3dPZCWZHyJvnW6q
	gf/7s8sYYH+Miu5o0AAXGaNBmN4drYRDcKTNcaRI2BDbq0TVnAReFefBj7HG5RQ9l6Njy33k9IQ
	==
X-Received: by 2002:a05:701b:4586:10b0:147:a685:912d with SMTP id a92af1059eb24-1ac5bda418dmr3749236c88.29.1793380182930;
        Fri, 30 Oct 2026 10:09:42 -0700 (PDT)
X-Received: by 2002:a05:701b:4586:10b0:147:a685:912d with SMTP id a92af1059eb24-1ac5bda418dmr3749206c88.29.1793380182465;
        Fri, 30 Oct 2026 10:09:42 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm9481168c88.13.2026.10.30.10.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:09:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:39:22 +0530
Subject: [PATCH v2 1/8] drm/msm/adreno: Fix invalid drvdata typecast in
 adreno_remove()
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
Message-Id: <20261030-gmu-sync-state-fix-v2-1-89d3082d97af@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793380168; l=1507;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=cUPrmtdLtvyA8qWNZ70NP04TMjj4fezEiP2SX4BUv2M=;
 b=SbxIO+Tep6mZX6zixBFP60UBj2aAFuVRJTvvFmYsQYCr1b6bBt1cRMncdsoIVf2mN4XV3DRSU
 2Opr0S+GriNC3mU0WnPNGK7zjNo5vrlVCOLvV3dyux89GC9O1NQJQB6
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: nSvCeB5TqqcKpw1ILBPPD_1RqAoAP3rG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX2zI5IGFqMe12
 +WUjzGYAeSfO0wxv5K1WgGENAIeyabpRvpe5nGT7zKXvA677MrpOfyZ/igGqR/6v2Z1lAx6mQsp
 HSLjWJPdh2izSND5MHM8RU7qzg2nelo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX4s9X7OZKh/6R
 mzL9qVKCjD71RCpsdSNvS45i/llJyN4EKIw2LSTnKgVhNxhDB+8zU6rA0TZh3sSJIxy7xUzVPjO
 M5nbUOU9vVT0jRtYxQjO9OPpknpQLR9mP8Nrlht21I7EDmQISsw0LsoGe4E9rwNXSQZ6Cbr0DSw
 MZVARuUpY9uv96wohtlpemFcYsB19uuxpi4zUtBYHDmAXHF/CDE5Ms/pVggbMVc1TbcPfSZFnMD
 svAXptL4oEQMaYeok23TYzMaF5gxP/U8wkrOlecNNorwU+Vc0u6XY5RaH188wY1H3RrTDwfWuEV
 CIjS/ecrTN7PNoPEcSUQXhuI+k2gb0UTeVj3cKiZ4uDEI0yb1hHgoFJeJBeAiG1EYSsJuEajvnf
 A1+kCWbLBc+MzUIiWU3VwSWCVYR7hmNKy2SUjE+eqZ3NNokF50Ir3NVbhGkT7NJ90PXz72cGjqN
 kW5I8x649LccqWuk1DA==
X-Proofpoint-ORIG-GUID: nSvCeB5TqqcKpw1ILBPPD_1RqAoAP3rG
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4cf58 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=K84Zv5WaSeujtAAFOroA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300068

adreno_remove() decides between component_del() and msm_gpu_remove()
based on platform_get_drvdata(pdev), interpreted as a struct
msm_drm_private *. That dereference is wrong because msm_gpu_init()
overwrites the GPU pdev's drvdata with adreno_smmu_priv pointer.
Use an alternate check similar to adreno_probe() that avoids this.

Fixes: 643515a9cd09 ("drm/msm: rework binding of Imageon GPUs")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7108d4aa59b5..1798bb12805a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -282,12 +282,13 @@ static int adreno_probe(struct platform_device *pdev)
 
 static void adreno_remove(struct platform_device *pdev)
 {
-	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
 
-	if (priv->kms_init)
-		component_del(&pdev->dev, &a3xx_ops);
-	else
+	if (of_device_is_compatible(node, "amd,imageon") ||
+	    (msm_separate_gpu_kms_components() && adreno_has_gpu(node)))
 		msm_gpu_remove(pdev, &a3xx_ops);
+	else
+		component_del(&pdev->dev, &a3xx_ops);
 }
 
 static void adreno_shutdown(struct platform_device *pdev)

-- 
2.55.0

