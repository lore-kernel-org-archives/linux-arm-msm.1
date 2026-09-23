Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55437486426
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159305; cv=none; b=fLpKC1GTTGm4dQQHvY/s4bjpOLgS2NFtnPyUwPA+KCvb2KFeBjKkD1WtQc2Mi++9ye0NHoTkNymiEoO8ZYCCsaPwiGaRlBBorr2bmWHNPuSIDVEj+OZSKIesCNTDlVn3hkWFwva3m5Wz8rtJL8VNBJRpaddkLw6LYytO+Kr990Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159305; c=relaxed/simple;
	bh=9Iu2RNmzJyMYp7GrqKtMQuY4sh83/4hGFSK9f1mwzxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BiGhS3ItQ4s4nm8JV4FqXDaoBJBay8VHTLGZnEQZ6yHCwZkhywKIjL1JehacXiGtYCsxTh3tOQJMs7qKbmUctBc2l/fK3GpUL0kn9gJGCauILdHHzKLHhGQ2zPOnhkq2xqKlF/UiNAygPp0McNFKF7pko1qFdbTlIYb2j5TN5ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSo2N114; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyqgDh7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSo2N114";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyqgDh7L"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA31Ba3936290
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJOzJ9srOMosaldHRAHYeJVA1bT1kfaQQ3r/rKqtz88=; b=VSo2N114zfk0G/zm
	OKK8Kylhkp43W3IJph2g78Yt2TMOBvBBiIZAK+hwS7ewDDeLS6LwS5gEI6Kfu0X7
	d5td/98TptysDM1TEjzlYi+jfBDRBTETjzQgRQjp7Psbwjw4bcxtIPXR4RO+HFWU
	Wwf+2HBRGKJzR72Idpqv7GltaUNyAgkeVpKBpbCzu5CjZ6ELKl5D8gfn/x9Mu20t
	mr8DOmzUIQJVpn/3dckoIuKbjSZwrX0MLcdgkPOuU35PLqgD9VvqrC0AJccSsGRN
	dd72pJF8VBWy3+ajYVzqIWb17LDVqka7kZ6dPxltao308DQlxrWiuv0VenW5JJbu
	AWqFBA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428t8at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:28:03 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-144f706e063so544450c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159283; x=1790764083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJOzJ9srOMosaldHRAHYeJVA1bT1kfaQQ3r/rKqtz88=;
        b=dyqgDh7LsxkX/UsiL0fyemUB/WsKevExeObL0wawFcxRrOQuUWFtpX824uxBIKwwka
         76Pwhry0IZ1Px1EMBXUfbCi61PfqyuBDg0+x2NLcoe4xpO6A7McQhlHN0ZZO0yqt0yR8
         F3k7BMD3WR+7nMwTk8BoXWTzU8nQz9TjN9vkJU7dqiGmHL1SyU1p5p/JssDEox/tf1wz
         oMG/1xJ3fCP8/0Z2S9uboi5rawUpLH1BQxb7xKqh8uIRrK29cOwo7do1zm4zbOzAiAGB
         qP+YS54puXh0oGIeU/iGEDUuxJBpnwHqvMTpzqSx651tnGa1FX30eiULnBFKUIVMWCmk
         2aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159283; x=1790764083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJOzJ9srOMosaldHRAHYeJVA1bT1kfaQQ3r/rKqtz88=;
        b=1UM/DJVX9JnQEdlDOm5y5Q6lVKL1qSDqBo5suKBIpLID4EbRwyLYTROXQGP+lquCll
         gFtYMHKsTh7J6mcp8GCdqYxo8gJSWyRBdjIo8NsGMd9NBBEt/2xJ2asqvTS6TFhN+RUa
         D+g32S3op4meqbzLcA5HKDG7FOpd9ZFKMy937c5mWGQpV9E4JIlxuAByHXXPrArLRFs7
         rXvt85SwnYYurlVfvq83gM6LGExDbg+d7SucyUqV1qmMOkDaIQh5ZwTsE4/PFluYPH4B
         mqmeSHF0hScB4ocElrBszc/kQtrNCcdGdMlGPjGNlwGAch6ly/kkj9gRD6iEXDNno7UP
         pd/A==
X-Forwarded-Encrypted: i=1; AKwUvByH0yaS0IJan4dChs60hgnwE8IblM/rp8DgRmoh/a4z7/6XyCwDHKlHpJZqJTuNQh/T7Z5IX2XTKeHGzHl1@vger.kernel.org
X-Gm-Message-State: AFuF++lev8XJ5UWg74AiPCwxZJyzmYy4Z9XUXJJfu2ZxgCMIKY39sqNg
	KrdrqhIBVLiWQZhBZP1q08hlNwoH1mJThqyOCKl6KCk5QvGq83552gpXZsqLZ4zAkOemmSSPfkg
	3JFGkmf27lfJspmkv3hmAlKjFq6YivJ8rk+ie7pEoL+oi+k8vrzVL48K21RdshKE/XMS5
X-Gm-Gg: AYBFou3pdd8EtpFW1C653oocn5IrDw9eI+GISIV9vxfXGkXYDNngOSdAlhrZyIllXLK
	qmJQKnH4R423eMBztT2JBtUJlUfO2wyoXgJv0SMbszRSI1zwinTJCUzsyzxm6QFsH6MfL6MMe3g
	/1yCR3gRob7rwzhXasMSvAvWiGee8jvbr05DhNQeiI3fk9bFaP02qtCF/pGSJgy6a1VoNnpdZ6G
	A5p4uuLaZNaTPaT11bKqSagTz80y0zZQCdAXQHrqm1sYhgRVXNAxgg9h9U2YftFLGZ0DDM8GOIa
	PuSA9K9Sxbi+lq7rC8VXs5j/9Iwp6rPR2byCIInX1MJjoXawOxy3hoyg1ON9UP/TKCT8JdtAfKc
	e49eCPUShfVNJv9fWOjwG0cg=
X-Received: by 2002:a05:7022:b051:10b0:144:dc45:91a2 with SMTP id a92af1059eb24-144ef1fee35mr2380582c88.23.1790159282493;
        Wed, 23 Sep 2026 03:28:02 -0700 (PDT)
X-Received: by 2002:a05:7022:b051:10b0:144:dc45:91a2 with SMTP id a92af1059eb24-144ef1fee35mr2380549c88.23.1790159281883;
        Wed, 23 Sep 2026 03:28:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:28:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:55 +0530
Subject: [PATCH 15/15] arm64: dts: qcom: maili-mtp: Enable GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-15-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=777;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=eKiUsBNhuhpANIu3zPjDmXfBzq8uzmsYtvGThaw8i9g=;
 b=oTucU2pHz+0kJn0XJLB2P55JznrHw4kc2XiOpgWY9Y4niLKlf9mz/lMqhVAoHQaqpkO+RLoRC
 V7ojlwv33lUBSe1R5puE980u2yX89hfBmI9gLIGacE3GYVLxIQRfgtr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3a9b3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bOBbJXBpTyr2JeYZIkIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: pnJgfP-s75FDE_e7oLRqFJZ0cicoLp1h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfXz5dsrVLg4gtF
 qpprnDVyQnh5mhRVeBa77wDrbEW35yMVBxv20mJX8tyWeAozlAYxh6fvSK/D4Rh2E3r1G6c+C5l
 Pzw0McPWJ2XmZAhQjnbRzsL3IichvQyJ25uQc3rEqDXHeioiiWckvNucQwnY1ufhyzmd4FZ3Sw/
 7h8fY7oH7I3FJXz65AB7iKWYKfraxWOrqwBytnTACMyPBqdEtsgJaiinqK23dVCUIYKjxxE0PrS
 +wcp9HcgT2iuuu/tc0Lzg7jHaDU0AX3LDCtxnWk26p8S7HbasIeysZMP69ciq3dUYSuU3C5E6rK
 2xx4En6nnIFlA2RYE8bYvn45VAdSZ9/Hz1Vk2PCoKOQXkERA6lELkaF65iYVzsVxj3N4MXKYp4h
 OyQggwIiiXc7B6ehmrE8mQEwM9UbjpwkUD9/bxAruPglxZPdsue4Ir0m/2V1JBMXB3Dx8vsQwKF
 jOty0Vn1tIOxC8gD/yQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX7yniYxn7QGTx
 6VmcilYZWJRfjRcv5JxJ1gloncABg4R5Hurb4CkxVrhI98pbhHSXOv4BkVvQgNYctzshueT/rIc
 rxN8Pqw3AVBWRU91phKHW3vctRsbrBA=
X-Proofpoint-GUID: pnJgfP-s75FDE_e7oLRqFJZ0cicoLp1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230041

From: Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>

Add the secure firmware name property and enable GPU support on
Maili MTP device.

Signed-off-by: Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 1fdc91e03271..27facd4b2a13 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -908,6 +908,14 @@ &tlmm {
 			       <211 1>; /* NFC Secure IO */
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/maili/gen81100_zap.mbn";
+};
+
 &uart7 {
 	status = "okay";
 };

-- 
2.55.0

