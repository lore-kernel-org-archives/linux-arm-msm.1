Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B23C3DDDB0
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190363; cv=none; b=dnPzissquHDDEn39kyd7PwBI/pN3eeASoPJ9w4Bf8sMAcrAznNLzxdTNDLH4NJNxavzZhYJbekpOu2oTZg1g4Irtn3orNgW256zU9ThwL2g6ogsTvo61hW2dupgFYxGkjx9GdlaqYwor8RxLAnCQAjQ38jN1kKOmpjIT3a3yE2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190363; c=relaxed/simple;
	bh=xJdaMkFW1cVtFVzX2p09Ua3QSXX7bhAva4Yt8G7Mzvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oX8WHsMYqzX+p+HVhSP6TNx4ud80SI6vEypzz+TC29epUOTjK+lzTwq5ydeozKj253aSSUnJHR0vIYd8dg1PbYMlIvVi5hkzZE918RGbDn7rzQHd3FQILPhn8iPXSzK7k7BRrfl65Cs0p1KVqoL2Q9oAS1YISKNAxq35p4JCRiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2cPw2y8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VszcUL+R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2cPw2y8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VszcUL+R"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DNEq2102691
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g7+97sYPHf/REKxCri8Zte
	0tjNuRDeLsOFBDiJ7Adw0=; b=n2cPw2y8EKjHKN4I/UEmKoT2kGagS/XQFTu2Hf
	6ZZ1RzTVt1sNVwjWG16OoY1RD6qGWHZ7zLyFVV1X/XyWPYptkkU1ryBYNRo1vinD
	e+L714fKeChls0SCR9U7x9GmkI4dZ4d7G4h2S/xTuXvtiMA+7TPCbt3D9HW3eKGI
	p7WW7TUK8InzNPM/8d1Oy+QCmNfQ6c7nHlw8ZzwAm0WOMnYFHl32sLgd1PeUFHE5
	hpOKHbrDdymKryN/gaJ71pGY1xvyVohgf4X57K+cULYcwJLLWiUSE3xZxcec2jqG
	tYP4Fvoge3k/UAfbQFcTUaNb26lWHT4L9akP3PDGRDbR2vnA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4w9dkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:25:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cceabd70f5so74120035ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784190357; x=1784795157; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g7+97sYPHf/REKxCri8Zte0tjNuRDeLsOFBDiJ7Adw0=;
        b=VszcUL+RlUr8DWlBfz62NNBhNCRPM3AjsjNKhhJQZq6P1d2HAXAnHAkJl/VS7Q8aHf
         NDSLvp/UQz7s0A7P7koKjX1F3ZrzG5QztSYGl0XElq38VTYH/M85zeASs41RAyeLgTBg
         1iBbwXSz7RJdxWbNYim2tzLNSIV1jZlNBwno7TJxAq7diTZGVmsqbTjeUpMrKFUsp7nA
         3cUlaERrM0iMjXVi9qeHRtDjwnChyhrSicvmpYioBFXfq5nByJlJs4xRPzlAXHrcpVed
         aIjUOcFEDXvW566KKt/2OPYr/b+XNaW/nqJTbY4IrAUJqMCMJhVOKW+l3oYs5Iu6kxuJ
         FZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784190357; x=1784795157;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g7+97sYPHf/REKxCri8Zte0tjNuRDeLsOFBDiJ7Adw0=;
        b=G2xbNAC4AOdH/9q0Kwdp2Z4Uan9CW0dkpUQwBVHMW8o4KrKR4t+4aykDICi1YGXoQn
         C51hsaYrt9RVCQSiac7yRhQQnn/u9QVCrDnZgUAssd6behhbIzg9UzKycpgT6fo6rIt7
         9B2Bi4G66SKPYvOcjahBrsLl2g5KjrYkApATtj/8M0KazUHwVSFtJcvdogxaEXPdYJqg
         vM7hVJ5bKoJcznB7yc2nOytxnUcQEkht9+c0SVCH+r8tGEzWzaHj2L1rVzCEo4N6p27H
         XmQb+6FWQugQ0QH/l3PID5shIuoWS9mlyOTNQtAuCwrK+GS3oaO1VeUX4+uinhb4b2Si
         +v3A==
X-Gm-Message-State: AOJu0YxvoVV6Bs0xWnwPsW1aa8w7U/OxA++PFyhCvL9YUPxVLuTmSqXy
	57JNpAeWFUQtr/1gGQFCcczHybzGOqR/Ite7oY2oGY+XpND8hRiikHwqB6RDhMSjKh07YUw5uRq
	lkBiIiFuRbg9pFUoByIWcvIg44CWbjiRijfOxm+21/KXob0W4Wr/nIKpXZcTzadAG0CLn
X-Gm-Gg: AfdE7cne+DlPsCjC28+UCZtUy0RBTIBN92/ZI1iBLrKdgGRac64kJ77coghAS/QqXwa
	LSFaANJXRzmumspDjrFOpEcxR+X/kGpHG1pfJ+GeS7ycgJg7/16ZjfegRYUwd4qMquoD2etomHi
	Sp4Ir7+plNrvQ7kOdzeh9py3sl6RxAY4yKf8ZqIeKGtgTFSsS2wIpOsmvAAbJFcI61IJtUmL7S+
	w5hMMm2komZxQBODTa0T+xAW1qE4K9AhQHC9Cx9z7Fs78I8ofdSXC/wJzBtt0eB+MXu1rpyhu7U
	Qf0JRJKBD0kUi75LjHt9nspQ+WfbFKP6aD1MpREOFa/LrIk9a58s9nHAEenc+nZ21P4aJ0gLD0u
	3PpzbRbN88mUvImCesqt6ziCN8SC1/s3bTw==
X-Received: by 2002:a17:903:4b2d:b0:2c9:ceb9:865b with SMTP id d9443c01a7336-2ce9eab3aeemr181247805ad.21.1784190357160;
        Thu, 16 Jul 2026 01:25:57 -0700 (PDT)
X-Received: by 2002:a17:903:4b2d:b0:2c9:ceb9:865b with SMTP id d9443c01a7336-2ce9eab3aeemr181247525ad.21.1784190356618;
        Thu, 16 Jul 2026 01:25:56 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf10701ab0sm16004655ad.77.2026.07.16.01.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 01:25:56 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 13:55:45 +0530
Subject: [PATCH] spi: geni-qcom: Fix sticky ret causing wrong return value
 on invalid proto
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-fix_return_error_code-v1-1-3295003aacd5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIiVWGoC/yXMUQqDMBCE4avIPjeQBInUq5QSNBnb9SEpGxVBv
 Ltp+/jBzH9QgTAK9c1Bgo0L51Rhbg2F95BeUByryWrrdGecmnj3gmWV5CGSxYccoaIZunvrrI5
 6ovr9COrw1308/y7rOCMs3xid5wX+eG5jeQAAAA==
X-Change-ID: 20260716-fix_return_error_code-d1a794620d0f
To: Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784190353; l=1782;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=xJdaMkFW1cVtFVzX2p09Ua3QSXX7bhAva4Yt8G7Mzvc=;
 b=1hiq+J0QFWo69KapXa0xDO3G5FfGitWMZFPsf+7QFi8atjrXvweHdU4WjTx/FWVx2Cz9mEj/l
 JhqBzXvuLu3BtBw988eSKYPerZdVT1yQb0kV0TGXx26y1XKLWsxKgdr
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a589595 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=bNqgN5VNr5uoykOApbYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: anrQLpuIQTdUWnxauXPSiIWeevPBvrwh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4NSBTYWx0ZWRfX6t31bHZ2Ym0B
 B04DidDP/Xq6Zyqe2trd0jEMLqFKY2wxbq0VEU2v4kD09WoOWfJdLhplsY89WWB1+buSB25BvPU
 uV6GyPRv2430aplWuXh3dcJ03AWVFUQ=
X-Proofpoint-ORIG-GUID: anrQLpuIQTdUWnxauXPSiIWeevPBvrwh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4NSBTYWx0ZWRfX+PIHOWkMT7oQ
 2UJe3/MowEOC80fVUkrvDZynsTpbRfh3WHcpJevGtrRM2KT9z/RsM5G+Kg3E0VCf3q5zxrT9DWB
 DnJnAfzVJ6kgqxDEjNmp4TCvk7lW4uNII4DXAkkyAbhgiQ2yT1OJZwt0mfIDUHs1YHXcNXVz3fv
 RkrYXH7qVwjTGjTYz/CLdYfiRPIsqyfDfB1RQcwmKTgNQMNjTNKr31iIJR77fu6kyXKy1roBlgN
 7w6HTLE9Zph+ZGAjoicYXoWFLUUpiUxVMNlwSZHhsgpsSUqeZNuqS8DPE88CgDIoQnv0Daf7ZPZ
 yspjQKcXMNxey3dSTCEvl7Cmna2USsnsXyFMnq5EodxzjKHCBS9lJS9OfgHi9d5872gYssK5lNl
 Gh5gKX5dtpXYiRJIsCM3ha8s5sLUi0c39+A/mV/byJx47i+UEmZwUYegdTWBNwU2i39MYPVldV0
 yaXPXh3OpyGZVGnfftQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160085

spi_geni_init() reuses 'ret' after it has already been set by the
runtime PM acquire check earlier in the function. When an invalid
protocol is later detected, the function returns this stale 'ret'
value instead of a proper error code, so it can end up returning 0
(or some other non-error value) even though the protocol check
failed.

Fix this by returning -EINVAL directly on both invalid-proto paths.

Fixes: d8e9ea989acb ("spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202607122241.qzP3QAXF-lkp@intel.com/
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 2914d781dbf5..d262206ed663 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -634,7 +634,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
 	if (spi->target) {
 		if (proto != GENI_SE_SPI_SLAVE) {
 			dev_err(mas->dev, "Invalid proto %d\n", proto);
-			return ret;
+			return -EINVAL;
 		}
 		spi_slv_setup(mas);
 	} else if (proto == GENI_SE_INVALID_PROTO) {
@@ -645,7 +645,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
 		}
 	} else if (proto != GENI_SE_SPI) {
 		dev_err(mas->dev, "Invalid proto %d\n", proto);
-		return ret;
+		return -EINVAL;
 	}
 	mas->tx_fifo_depth = geni_se_get_tx_fifo_depth(se);
 

---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260716-fix_return_error_code-d1a794620d0f

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

