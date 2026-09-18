Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58C92F83B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733138; cv=none; b=rwa79nJPBaV7sAea6ZsNBcuDx3lEp2Z3sexwrbVNySnHyVwCup2i5RUpTJ8EXsNddSGtw0ZiwDvx2PeeBZxDf5dNA0z8AwcKkZT7QIdQzmGYR7MSREFYg6eKIokSgeCaHXFVBsWAK4U0PLeKCbuHr1lY53DfoLO4lyE5UTdfAtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733138; c=relaxed/simple;
	bh=rbUOszSa6pKBjBFNE8KJKzGBB6kocCM3MHioANGUG3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAsDxatKXr9Ebg2WS0fTGcPLKu5nqVuqBE35Hqt0e3jZdZxc38hVRFjRFTqbSmJVJpD3OH4QhHyrlR3b4xV2g2WPwJp89eC+qtdlERL4wgO4n/E9WZDlry4OySjrXu6FzpnHGwry13s9GnxSkJE+4Vx0uCAh9JudI97sFh9n1SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPcEpqq6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brRMoDEk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPcEpqq6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brRMoDEk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9e2lm139582
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 12:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cI6VxWcYdbS
	4q6nuRTLojc583CcZ2sDeX8I9vTB+9wQ=; b=XPcEpqq6twBEgiKWUqnDAa9d/KL
	E6JaXi6/w6x+P65QAhC3by8n0Faf114Eemv0MxQFZrdAVJvrmib7e0LSLNQBeXWz
	pe+KH/Eb0f9KIY3Hj8JZ5Wx4+/GnGhwWLnPYBpiQau1yTEAwYoCyNk1kt5gnhCD2
	a1rf7gwPPGG1aJjwkDNWJy6rbY2YN2hwUu1yA1wW4myx4Uw2HN9iKS/ZJqP5IkH9
	JPiSMERaVoajvkpPfucCF1HKKpwNj3dO7Yhl/eaEBzx/4lBzZYi7/JE4qaIL3gYd
	TYy91Ow84IHDyrlrR/hMCR/5fLPEO3rFHK1k0xgkRoshJDYBSQyPJQlxGiw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bsj4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 12:05:35 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c683ca769dso151290e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733135; x=1790337935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cI6VxWcYdbS4q6nuRTLojc583CcZ2sDeX8I9vTB+9wQ=;
        b=brRMoDEkj20et4vexagtZPGR/DRUy33FlFU3dU3DrxjpiaMLhuos8f5BQ12dTDeldl
         SqqShXsjuuTRHhXpTDk1tL7w+NH/uUcwm1r4EcIPICkxLcWCJhOZT0AWwRqSMzjk2eip
         oGYpAUpM0RY2eZqflr4mcOlkxyZTWgWV1M5z9pKNtCHP2dz3gh0bFamR5WmIR5qjH3Wn
         pkOzKDbjha+Qyge/odV+F4oyuLyqN9P47TsovywYC9W8czs76iLe0gohgjFgqO2eY7sy
         Cnn7Tgpun/acKhEvyq29yMp6VnQ/DgMF9Cm3FYM6vFYCcjqKpONV+rLcnMeChyeUF0A4
         KhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733135; x=1790337935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cI6VxWcYdbS4q6nuRTLojc583CcZ2sDeX8I9vTB+9wQ=;
        b=t1f2C4LHRbSZawk5wA6j94CP6AlF7Mp2o3he4UtA1rKJrvwHm7WoVOilmH1QoeAy6N
         sc4WYlktySb1R4bCJcfnFt0Y9cCUN5tlcYTOcbJd4z6lArD7oloF01em9GkI88KmRyp4
         oMgujZQ+aAcRA+IODvsTsuBJBMqA5CNgOKD1CtiKUBCNX73wwBG59+AEj7IhHoPHwKrL
         xULsYjnuxPozJF2sIptApITYO7foED9i2EmU1TnnNn0p05e7X6UtfoLLCKsO6oAy3JdT
         dGrLsj9Uxr1sFt6uF2hGgh6yJGuGJmj2oqnw7zxWgrXLsYFNoRXHIGMgsY4ntyhL9BRC
         KiDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnI3CTFylEVkIpILWJGdqOHvyXZs2mO5JTxIausK77e8qY0Tne5jHOsLd05rc9H8nBB/MuJzbz11YfwGFj@vger.kernel.org
X-Gm-Message-State: AFuF++mGvptJSlYIvXt76s/YhmnUu0c/B4ffdfVTmywPgWTtJpZRaIxG
	sA4TvTWe7rQMRmzKhb8qD6hyxWQt0UnSM8j1IBXpdfS3y8sJ2YSgsGMOco8DnVbQiX48vFh4suT
	E6iHnBR35L4yg2ug23x70KK/aKUvrU/jxsNTRo4pWcaAa5bT4wSZBwWH3z2EMkkWrXnUU
X-Gm-Gg: AYBFou0rEbnNHD2KLlkh9MeKhsr2DkBIft+kKIjJoq5mVEuLnn8zWRr91ADwAnZzG6q
	T5+iSbtTrpBmwNmUWOBzwHGCtWRGygxJpZ7c7SbXo1V/Aoq8JtDtdwEW9XU7nNosLCjdi/0wADX
	x7jd8vGmZ0iN8J9ScfZCJXGoS1G5WclqQnR4fPXoH2qUSLfQw8O8cPcS1+UQ+Sx7w+IBJ+OiGHN
	E+xQVTNkGaNgBVRSnTbw8bSYAQLPRXzfNltVrMJIa7mGivWmPCWC4RqYn8eb43cvOKncDYQ5Juc
	h14uwEJD5cN0LOmGSkkt9dBKtte1M+r0saqxxIVgzUYG+32hTbN9G0c1mG3L61CSys17jidyumo
	Zt6LFe36wGoXFNQ==
X-Received: by 2002:a05:6122:1822:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5c9b59cc79bmr888359e0c.14.1789733134577;
        Fri, 18 Sep 2026 05:05:34 -0700 (PDT)
X-Received: by 2002:a05:6122:1822:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5c9b59cc79bmr888323e0c.14.1789733134156;
        Fri, 18 Sep 2026 05:05:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3ae49sm3917584f8f.10.2026.09.18.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:05:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
Date: Fri, 18 Sep 2026 13:05:13 +0100
Message-ID: <20260918120515.595782-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfXyuX6z6qhN5FU
 g0mCoSq8EWfeJw5PfZlLOjEdejh2aSzyNToDhRp/oApcCp2ptzOheHxrhI8mN3RziiZ7hIghucL
 93mLJ/Q+B99rvziarklhIC9siR4HiA1nb86cJbPGcZ/js7EovmuG2lVs6c5Yu25ZCFMbn2qjhXG
 Br5CZG9oxllqPkSdMPmhAX+ZNPg/aFL7CJEdjcV2PQidJY2+kqZOyWJ51/qmp+ld5sbVbxhQkuP
 /4xGnjED3RejLq+0zxCTJjdfqv5V4Zszrngalvp73nwiIBhZIGP3/UTWpZApIwearEAnpIi9ARL
 IW9+lAPG1qIbp61AAfiZ+2jePdQDQuOsInOfj9Yt3/Yr5VKeDbnjLMuldb+B+1JRdrgYG2c9hPJ
 oTxLNrmCML8mxD1hKd6C77LgglfzdiXjf9afKjZquVLUlZpuN8lib3d7KeFcGIuscQv2qxxzwu0
 78ggRM8k1pfMrb6n7LA==
X-Proofpoint-GUID: VOI3WAFPnSPjMi6U8BJnFxEZHNR02RJM
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad290f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=MSM6P-WPhp0LPykjVWQA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfX2rTFJZJ8y+Fp
 3UQrscaYP7vtwwA8BGvO+RGR86CnFNJKjBZg0CcN49TXvx+blP/swqAls2Ysqm7c1M5ONxGIcb9
 o9OMx7G7HloBSK/f4YX2WKfbW2MeRBA=
X-Proofpoint-ORIG-GUID: VOI3WAFPnSPjMi6U8BJnFxEZHNR02RJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180170

Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
processors).

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index cf9d940f7371..92326e0e7feb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -188,6 +188,13 @@ properties:
               - qcom,mahua-crd
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - lenovo,thinkpad-t14s-gen7-lcd
+              - lenovo,thinkpad-t14s-gen7-oled
+          - const: lenovo,thinkpad-t14s-gen7
+          - const: qcom,mahua
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548
-- 
2.53.0

