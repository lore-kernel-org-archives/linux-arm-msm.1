Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3031037B016
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220642; cv=none; b=ggnQLO9L5WnHeDik8YH2BzszLYt+V8d3IonqCdithoDYM1Tg1+0WSU5lTYOZEfS/zR19dbIKuFzftoJRvXXZXZDv9VH5HP63dKuzJBgfRl/RQVHkuro84JMwU71Ub38mdnQs29A8FRm9/G3UowDYH7x6QFHOM9Bh94xsUJOWys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220642; c=relaxed/simple;
	bh=AIrGZagZkSN1KB9Br6ijcPQAShpYrbyfyIl3J+RCHps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nFmHahe0vH1Jq7Q/vz9b0/V22aq4cMbw2Wh24NqQJuzUWr1nZfCLT+dLQIQWofJ5w6liBwh6md9Sl2XHsZqnJ5n1S3rAhgTZh6mYtecowsmsmeh1AeMKVJco0xayXXSmPQWG8As9dRgVAJpDBn7+mZxtc0SbnIDXf6ywyyVaM3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqwEmQlz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZD1navKZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqwEmQlz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZD1navKZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678K0Bno463852
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Aug 2026 20:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qktM3bg+Fo2jfrum7AtMzh0cJBEyxVwuka/AHP45cFY=; b=WqwEmQlzgosdyzvA
	Q4hn5jBBp+0bxIn9pARgWUskvzgddlN7UkjQ6RhU5836HaLsbcmJpUbDHAoSOJ6z
	irsOB28GPyVZwEh3kaZEM+K1UUswgCQ9YUZM7l2fve6H0dxUfWJ52Gpf48WA8YMs
	WQ6SJXFl4tNc3oNTSC3qmxN9J0eS4NfMIMpKbx9vWyJd6Q01PCmdi2iaTYS8PFg+
	ZLP8b1niHFCiI4PQiMKPm2CHnzr5EG+PH55zQ/9lKtK8/XWX0Y6LFD6xyWlYrOhV
	Hkl9I0z2IZ0gcLtyo4SoViDTbzDpo3ANeeUnBECjy71Mnl0w9GMdvXL9tHFTKAyu
	Ean+GQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvu8hmf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 20:23:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb7049fa552so513850a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786220639; x=1786825439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qktM3bg+Fo2jfrum7AtMzh0cJBEyxVwuka/AHP45cFY=;
        b=ZD1navKZDEaS5uTNqFGL5wVu/f+bdcqqrsJpP9f+32T2Dtapi9JyP2hhDVeWrsveRF
         Ya95EWzfU2XRSYxMqUHzaGIxZ7DlVlpDFWKNQspADXxGX8sYrbSgOVAqp/3ujglZYoR8
         aE9qDeG1BCa4Zarmqq8X/+BcWkMcJVCMyYMqi5oBi9AM632bct2j2l7qZ6+nY9ySwK5a
         p4NJKHvKRCjNWOxDWzMjPm56uj93RK7SllAMyskS5nwm76YqEj+RujK5ELCLyHmlVXUa
         DWD6LcKYJm/Tyj1Jx2OjwCO1yROUx7XaF8bmWHUNAVxMaO1DFQczjYqkiTv45e3Q+VNM
         wJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786220639; x=1786825439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qktM3bg+Fo2jfrum7AtMzh0cJBEyxVwuka/AHP45cFY=;
        b=cSC/bBwTj0GYPypa/h4MceD+KH0N1u9QkBRvUxFLxnn3LyKzfh/8KkY1XJxZrQJuOj
         LQlbKFSlxc7t15XZNxdyt4MbyxQmM3277EZAkFZeq2JWLKOSOENvy/JIuWKaS94Jiv+1
         lBhriZT2WXmzf2ErQfzj/bjr1KoZ8++RiBWDbOcXKKsoxYDaVNOEkq/TTXrFMXNjOQj0
         5eyP7ssVK9+vGiz4tSaQHkz0187i2RdbWHcR6yFoom03DnTROu9fIAU9qLxv3Se1pcPv
         rq3Zz0Eh1QH7Djr5rvlZAm1ygpOR/OETga2qRqAILZlo7elTXQukiqFEEWRSATMmyPm3
         X5aQ==
X-Gm-Message-State: AOJu0YyITvVuL0SXOlxK9ryQtlDJMmna8ZQ8Q86Ia02vZ8OVLP1vlKYD
	DWIYiyhjt/2xeMnUypFDGQhWZ6PEjp8hbdr/chYsu7Yi6D/K+pNV8DJUB0zG3BBZo4FFSDH+Pnl
	rzj10CrHY9U+l6M4oy0vFN8qWurgK/CvoKIcFIOvD7B/DIpIjWVMxAGXEuoGWfx/PTrNd
X-Gm-Gg: AR+sD10G68/zVqJTH1OUaqjsI+aZA6HZNg2ew777FpgjrRH0BQSx5i4oZ3mjxsY35g+
	b4PEfpTDrto6zZjAHBQeavuqmzkUi8CRwN4HmObqz5d/fjnSmB2JjH7PEUZNWWBzMTfQA1HicqW
	cjGlyAxTu/01HYsSEn0VqtnMCFLEdKcGewzYwaAdPsu/lrduIQR/3Ul+/bNdUOeLvvJnjIuatYr
	DBU+hMYWupdez1a4LZhiNg7QtnjhCyN54wkWAbSYfqun6+QXM8+gL3tADiuUIoUYdXiICTf7Mtx
	4OMOUrunbYcMmHP2MlOP+v2HnBiM4l1kSZ5kDCF+2XWXfKcmBdj7mVUh2HgHprh6fCaaGYLX2QT
	MrU2gUPUI4u+s8P4NZN4/zCU3
X-Received: by 2002:a17:90a:d444:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-3909d79f918mr19339663a91.2.1786220638981;
        Sat, 08 Aug 2026 13:23:58 -0700 (PDT)
X-Received: by 2002:a17:90a:d444:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-3909d79f918mr19339634a91.2.1786220638575;
        Sat, 08 Aug 2026 13:23:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm26357417eec.5.2026.08.08.13.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 13:23:58 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 01:53:12 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: sm8750-mtp: Enable Adreno 830 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-pakala-gpu-v1-5-207ad1fac1c7@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786220595; l=733;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OK0v79oZSQHdaHg/pOomVxs9pgnobkHsr+WBjfo/kZM=;
 b=RjaCXcVM3ar/WnN6FGWeHvktn/E16JNiRWlh9YiXqyKUmSFUXvz/gDUwVD79g8/ThXAqCMbc1
 jR2Bc9hpXDrBu7wn8CbD8DULmGK9qloyCUbIktuOL4wu48LVJQDCD+7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 2mSkbmHQv7a_dOJa-4I1ET1YQTzYWIFV
X-Authority-Analysis: v=2.4 cv=M8p97Sws c=1 sm=1 tr=0 ts=6a77905f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 2mSkbmHQv7a_dOJa-4I1ET1YQTzYWIFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfXz6Fp1bw6bVFC
 uCtvleXHteRHF4TPgTLKo2H8zZGvmJUJHMvKUjBTJ+u0bnuNj0iS230EX8S3xRyoEiycv3dXdfk
 wKcyOQieqbgxOWMct5bcjWQq2b4/f1y6yJ3gpd9vO1u47Mn1ZqEZfEkmYuBCwvlj8+TjUgNiOzi
 9NYgYlSUZtrO9yfZRZpaqsPtoHqrTdYRcrDQbefNhANr/qK81j/BAZ8OcpqnbZLW6oznd9/GlFd
 LYdaAbEyNhtWCQjzz0DoHkfnRd0u4XbOSnL3W4zFkEZeLArfWeGLJEfQVytpybgie+4XHeSNIGi
 RME8yFBYlXQVTY+/gDdP+7kmwe+OSJTrUClKIS+xWhnMn2aXupYV7VigjQ6HCp3Xj8Xo2vPyA0O
 TrRkpR4D+hU1CY7PyIAdXflFHJerT8KzNKMvcuv+lybk5/6ha5Mi75mhb+tfkTsn8kNFtsmr7a7
 l1hBd6Ik+2FKkieXSlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX9TViWy4xZVv3
 zE+pXq3X4b/hcTgNeqkSHWA1HczTyvhAQbfM7rYUr9EFGM+BnJZnB/bOSW7rBooYBU7y/F4cqhg
 L+SOtek+Kv1k322I95abbwY4Pzj3veE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608080176

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Enable GPU for sm8750-mtp platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 9b5fbc004df4..b665d7a3af42 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -935,6 +935,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8750/gen80000_zap.mbn";
+};
+
 &i2c3 {
 	status = "okay";
 

-- 
2.54.0

