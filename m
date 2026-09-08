Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65E53AAF76
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 07:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851476; cv=none; b=VsHAEymlqL03aGAbSH604bVonZVJiKvUxdFZAAW34lwOabL3RECfjps0pbzALssba5DROtsaneg2KFTQDvZjCnk99i0+/u87HB0sPtb8K/OWM3fNCIvsT2v7l3x7lK50+0kJ3j1INGNA6a0KH/CLnDvlT488mx0spj6FMK3HX5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851476; c=relaxed/simple;
	bh=dxt0nRLMlCSOHXCt5GgWA+SbZAKlsIeSxAesz/KABiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPlGiziqiy+DmM284Vs+mA1KpQWCwG4TN2gLdW9Og7ZMSTi7G7Hu+gNn+rgltYMFsT7n5MvM21ct3BKY25bc0T4tI1oGFPyWLjVaoNhKheOol8IV42uX0Rsqs3yi200q5JJLxDWEP7ldV7LN3NU110W4CaNoK6d/ZiagejaX7W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GtPmM1f3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CF2YLa+e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GtPmM1f3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CF2YLa+e"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lk2k3299414
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 07:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=; b=GtPmM1f3isY+uh8N
	pdBqgLuXJb7JBeJA2dPIzkM5geLG5/9uRvpMY4lKxfNVf3A023aLEFZBiajDFqLl
	6tiNTA9BqFC7NIKScvsugAmQKsTjBZ972F96fbAR3n5BTtwAHcSHmxIdkK8EFJ7u
	LqNRRc+luSSfnFXauixOh0q8LJu4IWf13TwYiicrPlM9tmc7BjV332qE5DM8UHXk
	4VFPDOMgCvr4NU0DP5A899uOKOjxij1QyoUaE1K8DGhcP87PjMoyUk9s9VHrjP1R
	vxF1ycJBzQ4KE/SsQGxGVPNz6MO6MSP6ppYTFHOjfixcXaIjTp30kla+yfL1oHR7
	6Egv9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p8mx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:11:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939694871aaso681241585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 00:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851473; x=1789456273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=;
        b=CF2YLa+euET/dcVYtIRJgEN07kgQUnxBjpMiYhy7phpgJaM5Ur4BZ0C6lOAG5HF3ME
         GHLz6ygxVAkbjD17WbqsUF9JIR9razmm4TDGMa32wf4yDOxMiR6j6b/1R86FdTSFMYxm
         ZeI6C19h4pSGWdR4azOPEm8ihffB5sxFiT+1Niiiar2PvXWM5jY+F/J5MWR3bnacygy0
         Om2o5Lxy+zEq2W6zSZyRehKnTSGaxTa3V1WCnotJl233fJAMSblRHY8KIkfolTmHHx9T
         /OHTfbEvSZQmUPIa27bF6G+mpc5rMKSdwVsqaLM/bd5mx5AY2b6Ipmhu0FlXUStDuW7s
         pnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851473; x=1789456273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Zxd143ASUomJNNgHPeOAeQIGghuC3wI/sji5Dtl2sM=;
        b=LT0PqNSu/vDWa0VPlWf4oRf26EbvR/4uUrHNb3+XPl9UCxOJB0Spkz5Ilmi8r6TVEg
         1vmwTJ1Hq0wsAmzY+DGXgI3S/V4Tn5UdNpbPgNTo074MnVpE/iTefOsR7U3MW/zJtBpM
         lslQ/cuJYrQKPUxVMZxDX4DLZl96zFAqtVdWMYQVVLRtmoEo8tg+YO96Fc4W9SQvDJzA
         847uC8YTN2qfNY8Gd2rCgVZT8++Ja2ytHbGl79yP9JV0BaSvlcNDfQy+cS1Ht0+JviPQ
         n9B0JzL9TvwRSSGS+2Ee6uKJJjVhR4oKil6cv8EAkQhwpGqs2nJ4El8ofxlVltiupjM/
         D+uw==
X-Gm-Message-State: AFuF++kR7tyJeMTUuMgFz/l4YBWdGJnYDfMeuMLE1bAhqiOI84P0LJhR
	Z8DYdl7bMo4ungkOXwJpUGg80EYWJ85jwoKc9pZcIAf/yk8zqLdXLqY9NOPvRQrxUQA1cn1GIDQ
	lzP0lyUIbnyGTxxmeLct6fG9WTKOTiPCqQS01S3YF3eYdsUwFNhW4PZwnRVtvo+f/9Ndf
X-Gm-Gg: AYBFou3nKJc4P0+z02oUqTY2AZWYxg5+iX8oF6RN1CuyqV9O9MKrL0ehzdZVriKkv0h
	cjoFtTYmIbm0XqrywAvY4a+poV1NfaTGADXxDMjqKlTvuvvdcl+dGIkMiWxhKEzg8Hl69t01aqb
	69z42bwMeKMLu4gxIZcEkCl6F581QgWPS0naf3+cBagqngNHa80HE42OijaALch7eB9Q6zP/Ji2
	K0QDTVrYTylcDgeeP9EMe5BYXwnyExBciB94zitbpQtZKTD7/5lX6pziuVIyizBdDHDns1cJ7bQ
	Zx90dihNty/gYX9EYH865qqZiakuN9YgeXRe4ss7cBqmdildv7W2lJmdJZoz++2cccOfQiwpPUq
	OAzB90vhFRYf/FTEhQb2pkvc=
X-Received: by 2002:a05:620a:4386:b0:939:ab43:77a1 with SMTP id af79cd13be357-939ab437868mr1036812485a.6.1788851473063;
        Tue, 08 Sep 2026 00:11:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4386:b0:939:ab43:77a1 with SMTP id af79cd13be357-939ab437868mr1036808385a.6.1788851472658;
        Tue, 08 Sep 2026 00:11:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm453173805e9.1.2026.09.08.00.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:11:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 09:10:47 +0200
Subject: [PATCH v3 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-7-dcf8956878ca@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
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
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dxt0nRLMlCSOHXCt5GgWA+SbZAKlsIeSxAesz/KABiI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqn7T9MnI6ATGiwoaT3dl5k4X9A1cAjL6JxfQxT
 tHgqDDpmN+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap+0/QAKCRDBN2bmhouD
 1159D/wJEN5EBolsu3UWPjUjuiwXYqvL7bczKzQULBtpg205n35tDaTi75OTlxy1e9JEgIRrQam
 /+VQ4dojOQuXB7Rm5XKKYkAM96q+S4z7JWRi8GD4roaJbPWlxLAOkFjsLfQR7okQW0L6Jae5b56
 qg5t4gmct2lyrOVYZ4n3m4EGz1vjf+AttIjwKxdaXOFFBVfDsz8X9n/ZwoyhwhhvlfpuRa0yqzZ
 /GQiVg3TlnQIGlHh+MGoN57q6aDjdD2pDf9gtS8uBlSCIJOWsN/REIMM9ydibPl81DivKDnFPkw
 11nuWJDSKkdiJFXMoqKW9IPeDJ9RtCnpJzqkj5Xuq7W/kb+jQXHZDkn+wuK5U35YU59B6TGicQJ
 gOh0HlYFeIww10cex+Ag2zFis1gMzJL+8n4CVL2CbCyn0EAQ/Z/6+876Tbs3p5ZZqeVSztP5Afl
 QbRkVOQdrawJGCrQMi4atnXequexJkSOi8Wl/F6Z1ttC+aQGxJAGz+59+ef81QiH8jrlgZC1ile
 U7g/lj2XMEvhTUtvHDK0aAqIMGBffTNeOiRe84i2z2twEuM+KUBSCMPOEEHJw222BiltuPKGtgT
 RVJlLPUj+P3zm0XsUhuesMJeHN8lesO1hrMGrDWW3GYMWwML2nuqLSVXcM4B4SBtLjFXqkKiWbr
 FzBPqMDD17Y6ZYw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 3IpJkGV6LXLzvOnf5FJhVAku0VaC1vjq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX/t+iL9Pq7mAl
 DnlJx6+EyqoIjSsONTjOOagMUCDYSHPnIAmDukVBb0Fb3DEFwIa+Zf5arD/UVqMLuAPnYywIRpo
 ySkaQs91kVolTQ27iM5w+JIV9lPBrdY=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9fb511 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LSMMCDwwRte7x3nqQVUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 3IpJkGV6LXLzvOnf5FJhVAku0VaC1vjq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfXwZmY69xeW2UK
 oMq6G9K/4QihGGZ1ayarTDaOSEpn7vCWabR5ZS9WZRyUOVHV8NYkMFcmHlS4x5TwvG3zVZv3Eso
 GxKrMBS4/7XOpZ8h++uYlwKu+PD7vIDpcAUkm8bOicja9dohPMP7ulGmJYVrnaXM3W/vnos8Eky
 hcARV6K36qmrkH3L6EyR4Ma8L8M/LJaBGAMAs11g9R6S+ET3NNZeiWIpdFBoekfKVa7mKSmkQs/
 rWIFZWtNPc/YiX59qMJMnHFI7B6HXD6f5AR3ucUMl86In/yiPDSLu3PhBwZf/nAlbiAAdB5O6LA
 CVwtdkLNBag06IyiVC/W01yJ0IJOHLWH7BQOPT3N05U10CPSLWdEKYjRbLXfzxQmW5A1v2v+9lQ
 Jcbwh+CnOSVZg4Cd76ocRw7+jiBLw29qm2NOfrvsLW6PRZIg/C5HTyPN6OpssUJbaYbCW7JM+JA
 NFcCx7MMlVuMsxM+Ddg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080072

There are no properties in DTS or Linux drivers called
"core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
wanted "-supply" properties instead.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index dfec6c3480f3..02d27ccad024 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -113,7 +113,7 @@ allOf:
             - const: core
             - const: master_iface
             - const: slave_iface
-        core-vcc-supplies: false
+        core-vcc-supply: false
 
   - if:
       properties:
@@ -136,7 +136,7 @@ allOf:
             - const: core
             - const: alt_iface
             - const: extp
-        hdmi-mux-supplies: false
+        hdmi-mux-supply: false
 
   - if:
       properties:

-- 
2.53.0

