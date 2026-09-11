Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68144F55C
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122604; cv=none; b=VCKkEf4w9APooA/8wX7W6iKzg9iRXga5UNjmLL2KshyLjnhvc8Lp2119z4hipj9gyLDFjR8hjhMNmkG9g/jPcgDOFUlLSjUHZdfcyoTM7d3r1TyqjWUGasJvwVZcU0aMFpLViLoW3PvGFRT2B4CTvt6S+3Jyfqb6XXtXt6kU3n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122604; c=relaxed/simple;
	bh=pt+Rkw+jgQanPwhA/NuvAa5qnlnZ01yZY+rh1utI0Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FOhsn8eOLdRMnlY4Z5y5Pv5qmI3Bq4R/MoPFlSNb+OmAzSHUea8F8BM4EywUU0WGXLK5Is+h5BlSfNHjnOZpFBQld89Lck12XxfqUZhSyVDL1v7xJ8p92hDHSOCnBOmEwUD3q9qkZVJmRYCbj54TeoNNTIo+m2l7U4f9A6h31Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqEc/AEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvarjNo/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqEc/AEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvarjNo/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7l1Ui2802264
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfXCR8WLAG7aE7tsDiN6RRiR4IoTNhMtx0emBbiNuls=; b=VqEc/AEuTF7PpT3X
	olhkf2h9Bdq61NedwcggjM/bzc29Dqz8ssNS2ZdN1ZiCfLeSmWhxSzcXQdH4I3+o
	yzKEeScTa4eqLab3dXzV3JdHeElrraduNIQWSjE4Odv4OIFTL6Rcf9sVq7MQZwjQ
	GKAf5oooGSPR5hmf5/S7Jc/n5wLAICX+iB6rEnd1B3UonuOR6/UCMyMC/QhxPrtO
	x1I+5DxSKopjcWAvKpBbdir7T4WmIXWYl7f23ld7zJ8tBdeftMI1bMdL3VkNpe0B
	GiUZOF+//fEg2XroqxH30WeGrhan++NEkZTcIp9lGTyLO4orabT+NdHadu5cR2E8
	AGI/Hg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729j45y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:30:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9396e0515dcso54986785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 03:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122600; x=1789727400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfXCR8WLAG7aE7tsDiN6RRiR4IoTNhMtx0emBbiNuls=;
        b=KvarjNo/I/QhG3yczcFPHUYO3YME1aVGDz06zIE/2SUyg9MaJr2xLBEnySYdvU4iL4
         2R+t9BsaN1ONfXRMnNiFi0aZreH19dpHE7kfLC+GnWGKNFRlHsZawBVimJRoXJnVLXfz
         eq0W5FSkJF/LuUc74fwuBpjmp4gaCM89sfOeUj4MXQx6B8WrI+5/LVqcEHSN2ogmRZe0
         5nTOAKaKLkUVGjF//n0JXoFtCx8HNc4QhUI0gv4v5SSWOQlfUH3EwE0P8g5pgPUNOSd0
         RKXY1sE8cKti1nZTnrcTozyvLkpXFsU68jFEcmGeFgSeKRTLloczAo9Qt8wP4RGBUYbi
         HOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122600; x=1789727400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfXCR8WLAG7aE7tsDiN6RRiR4IoTNhMtx0emBbiNuls=;
        b=MF1PYCyokvP9LFIXfbAfsRSgxbFGtXSYdU3bTy9xgx4f4iK7oNHgZWJXoVgwhZw6M2
         eyOSnGJEQybZBF1bFGeC1AcQQYhohaV2LcfzJCTk+8qJWjt4ec1sMF0prriojWtksSMm
         BKO+40bkIsRjiZIdu7Wkq1bk0syHEHPr2dV8cQdXmGJnMYeFMj5ilwvNxhSgwgLkM7Pq
         d3vMC3z2yjmtz1lLElqOQxgrwx8Zw8eSvprxax7x9pfOmGXpJYEYQ/4xq1Zezivx96ID
         lyiqPg80AMwF7Rhur1PYpHBZ0w/BSQBWnWdb13VWAcTCUf2DLxzoBfl0q+KSu20gStNs
         6L6g==
X-Gm-Message-State: AFuF++kUONVlKhnjrbt6vl5mzE3lcPwwvm+zLfqPAQAF/ha0gOmmIiOW
	G5A6wnStPfUZ25Pj6aVgRpiID3Dy0T5iGI1wFiEVeNq4Hh45UJOSSyUPda1kuPHyZVF2m7/HmIn
	86lNlpXNBEUsX2v8gnA48FpmtkoBWQN1xQJN+NPZQ//H1gIijT5Lew5oFqK8Kup8AHKFG
X-Gm-Gg: AYBFou3CPbK6iHkn12rSuJr2k7F5NJ6CKf7lRVEIxLlLdzyqNoo1vEoUIDetp0cxDbm
	EcGNZXVL0YZ8DCHhODwakWdo0L8cynoVDFxLSnRQkQzACSbwuZsCIqXY1Vrn8clo74/+gllh6ph
	03CHjhmU+bkjTeHxLXAXLdklhSR3BX6zLhap3Yqff/L/dO4qZSIu+EBWNdUJZVnbo2DmLAMnpEs
	y+JvFjqH/wsPy8Tf/Kn8MVgAzsdaQv9H62cYuzbp9ruEbtNsvY3zL8bdUfRHq2jb6A6E6VAQYOv
	KRABH6hpwXhAIUOECuJ1eI8/4IEgvPJ9miqne8Yrup9l7HLM1OtJ2xDOj1KhEYdhjBJb2WLvNuq
	S1q1HH8QemWac7yntQqw0bmw=
X-Received: by 2002:a05:620a:710d:b0:939:5c30:fcb8 with SMTP id af79cd13be357-939ea0e6e28mr448599985a.6.1789122600586;
        Fri, 11 Sep 2026 03:30:00 -0700 (PDT)
X-Received: by 2002:a05:620a:710d:b0:939:5c30:fcb8 with SMTP id af79cd13be357-939ea0e6e28mr448595185a.6.1789122600092;
        Fri, 11 Sep 2026 03:30:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:29:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:38 +0200
Subject: [PATCH v4 5/7] drm/msm: Properly handle msm_ioremap() without name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pt+Rkw+jgQanPwhA/NuvAa5qnlnZ01yZY+rh1utI0Qg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gU0RExYusnudZ0OMSrcweBZUWjDZMb+M8pu
 xhoxU79/VWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYFAAKCRDBN2bmhouD
 13VaEACFaCKDETdpPto0n8tND9AnmPJrBouZ3DiV5VMplFHEEzVYq79foQF2rjqKv263AU9zq+3
 JIWOx+5BF73BcsRrq5QIvQ7blWqANQTHgHriYqXprcy5baVa0he5oIynANoIZGXzLWLj54C08yK
 DpFvI7aOZpAchp0JCUbOtgLMdFHZI2j6EdqSJYa5xOKIvokL26l0WkT/lA8fQ4ZQPCcMUUhzxYT
 iMYAc8UDbse3YaQUCjHZS3SLsQcKQoYSgHE20MN7beFK5f55ru558QjCN/lWb9wluhSw6V7jgyk
 b5h+6TifujFZL3ipkLiEEBDx8Sncin3+oDzNqgKc+5t+WBWSAOIO7+/Y2pwulk3+PDd9y0MSjAW
 QR2gmN27rQ/a62pMIJEDJEH42LjUjGUESrCUWrhKWxhgvmrdZDpttf1Hdf+6PdXyA45f5jiMwJ2
 IC5/13KIi+FWip/HxEMPIurxCj7mKgKAdyqpVmgcuBk1nnvxa3I16OcBy8nMqA2r+LBFet0gfUq
 XPB77l7QlFmKPKqFiAB7H6Ik3As0cPkYgkf0tiRrNG4L6z7zbELYeppwyVslAZTimh1eOGeYF/8
 TbTVKCmSzSeT7WEHoe6FY3Qu+ITbN5AJCECIuR7C50IHN3ul+Sp2Bfg/rfOKUwUg9Kc3RMCiRk1
 Jw/7z7tye3JvP2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX4XYApUtToNQD
 Ky7T4eMG3qfJ3n0GlCV7s1agEWv0gO6LNfsC1gCaLk9SFfvuJ55EMWgO811RCH3GSAoSxiaQVso
 VwD1orYZH1SrnboYz7PleAong9RgK2o=
X-Proofpoint-GUID: bWxwjx39R3DwPVrcxrSH-qFsd_Bd1-pR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX7m1Zfi4OvQgd
 4fT9mh3j5R0IEeVp3BZfQsrplq1/7cillrkT09+G77+OiIC6GWrM+jppXMD7g1G7wp95jPggKxI
 JtI82qMCIgqdZsWFN95E27cXq6e+ROCMC8zpeqSISkysbL2doSNZm7nhox1AgxKxoXp6UFoRJNt
 V6d5KYKK6RcRLhYfadfvxrjRzR1uC7ybv4DxsZvDB3jiCUJrcFrO1isAQFFR2lp3M8yj8SbhSHM
 9dbfpj3q4lo0Nblg2AG0jcGwFtCsNiYEaEmIZ4fCXW/BLX4WAs4liQJqLPLFTdGdWiHMJd94VXM
 Ktg59MKTULuOwb9zwFtZqT+HowapMAestiCL7EUmqLRSKBglS/lHG0w/pFR0S0JkuVW6h4piVzr
 7e6QaaTgOZrZTPRYxzJEJynWkXLSURcwjQ6h9QcwJmQ8oh/hbraqm4oI25CpmQhfIQv+rQL6s7I
 35tcjbmMBX58O6cqpfQ==
X-Proofpoint-ORIG-GUID: bWxwjx39R3DwPVrcxrSH-qFsd_Bd1-pR
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa3d829 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=or9nyMeYumr6D7LEzWYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110146

msm_ioremap() accepts being called without name of the region to map and
in such case maps by index 0.  However error paths still use the name in
error message.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index a6efe1eac271..99221b0d7e3f 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 
 	if (!res) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
+				      (name ?: "#0"));
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 	ptr = devm_ioremap(&pdev->dev, res->start, size);
 	if (!ptr) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
+				      (name ?: "#0"));
 		return ERR_PTR(-ENOMEM);
 	}
 

-- 
2.53.0

