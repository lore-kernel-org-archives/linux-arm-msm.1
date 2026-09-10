Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7D23E5585
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033649; cv=none; b=BXgYGwu5EOPDaEJakfon67d51aycNtYgJDvRQJmYDF2aUT5TwU0kU9qRS5xMo4m6kbRFevhF4KGrkCxZidyx7ye6pq96DZzftLKO8RPvuxmRBXSILv/92WV58FrghQ0ZZMYvmfdg0RhmFmqJtVD9D3XOghFhKeT0V4q6QAByAcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033649; c=relaxed/simple;
	bh=Y3Q30/XDZYkT4BsqAnWiL3C7rPGluprH6psQ4WloVLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cz4qPwq/r6Pgaagei2TVS/J4B2SNYMTXQBBulgkJOQ4KKjAXQ+eJq+rwFfSdN95mvv0NtsfF8lGu5ICWBTRBHhLmH2b05Ymp4K5yp9+As14QWKfXfZzdnX3Kl4FIAMF3FEPo3BQFAZ6HBj57dnJYW8hAdCd+AQCnsoemGyo7mrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EodX352s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GcNntscF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EodX352s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GcNntscF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8prPM475031
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1FN3QsPJsWFGmnxwmYa+KilZ7mX3aZKpokGyVEBQQ8=; b=EodX352sSXLNv9cg
	v8awHzUtPhjntR+J0HnsRZsWGfF6uO6PCoQGGkH0bNL/alL27I1dBJ3f2t3weDhq
	G040jouvqpawnK7F+mgePFbCaR01KPumgQ0VXbAOWACKGoazjBukCRIioEunnRUS
	Gen7vF6yHOl9m/DRzk51wExuMKle7c7XBCuBRAkTPVR47rTeTqQL9dGUOQTHEbs+
	ONLSU8uUc4xaAdK70cvHMfMxeKWEdF//bVaSCvn7n7P8gnO4LzQnWAo0idvQUpST
	1uTsWFeL5UOTpJZ65+xEUYLBJHjPHgd9LB4+zRvepqnPe7UIQXsjIZU1BV70LL/Z
	2/FGIw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygu7cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:47:26 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1b6df25efso7239590eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033645; x=1789638445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1FN3QsPJsWFGmnxwmYa+KilZ7mX3aZKpokGyVEBQQ8=;
        b=GcNntscFv2rXNrXF5kUDbkHIgKg0uZ6Zth1aFUozJwhd/tMm4byk70s3x427p9Ptt+
         0r+w5rgp5vzTH1OktllUTei/W4VA75nKRZzT77enxvrSs3r/sMnWnLEG33irWtg0X4op
         MQl4u8LsUBsaTw03LzRCWmXZavipYSgPmNyMKbcktjG+YKK5DRB98es7akufap3j4GSg
         blcr5uSSCxL74T7GM9ZtxtdVhvYOG59KempZZ770yexY7Poxrrf2BIN0eQf+c4c7eACZ
         cGCkOM+42Fy0CvqjqtCxdj82CFwOTy9H/Vbj3rJ9uMX/cnfv/lkHAHBhZasKUd2zfISm
         f4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033645; x=1789638445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1FN3QsPJsWFGmnxwmYa+KilZ7mX3aZKpokGyVEBQQ8=;
        b=Z415iyqgAEF4h3ENGUmDQ/9ap0AZYegZ2Z4gIqRTOCgnPyHf2DnPM7xNY5ftBrjxgm
         HFB9R8EiSFHG+Y5yOQstS5BsUOgRWOcwXXx1O6j3l0uMg3pAfLeh83iUfb92AOEjootn
         qDIQzST/H5gSgXBcwEbckQPTA9bPncP06lgoJj+/X3NZ+MrxQKl6SXsrb9SErHmg0A07
         eCpg1I7OqcKCL/0fRnlqnI3Zgo3X+TTcGQoT3aB1R/XUs0JprLGas9Doh8/IudmwGcik
         JTmJ1EIkHs/eU88INwwsTMJXrU8VGRPXGvQlRpvWbwm3H0QkeXMyVRWatntncwk9gVtJ
         BDUQ==
X-Forwarded-Encrypted: i=1; AKwUvByUNjmdbfWxIxAgKEo+oHg1+ImTVtEncdBJEzPGOZkKQR7ws7Ir9D1blbwph+rN0ZSGFDCIn+QfVwD1Yj+L@vger.kernel.org
X-Gm-Message-State: AFuF++mfq/4mMU9kA5y9cnyMD1Zyju4RZvZbfPNpCKiS7x1T/mVFNSyJ
	bDsfrBZ16asqdZN3u0ze3L2wXX3G4G3oZrfDAmIOio0cEPy0fpLqvlu/PGbfo8uIJMjoaM90Nlg
	GciUT39xXQdKax1b1YnOv7m/QCsBVxuI9/4nlxKUy62IN6Zp9eGXDORnxFqAVR12BgA3D
X-Gm-Gg: AYBFou03WHgwpL7Y/HnkqhhYC1Eoka8IZX1RcXquleHLHhvmN2Qk2FsmUJcmRfj0Btl
	4uT4J/DzzHvNJFQS0FHh0lbBLlSUeNEPbz+Z75LlDZe1Rlr+uiSaZt9Nnz6MZMN0HhQqt7+ZMwz
	UvVtNeIaiOy0LjxwXCdzxF6NFMOYgN5gfrGYAlgYrBMnrF4A7t2YYuWHLSRvdxdigMYeojf2UYG
	oPAdOMt9EqitWFh/aYdeUtrLNlm1Pj+cd5JnEY/y0sWQ/Xg3S3FO9dMJejdWzfK0VcVHlB9R1pe
	xXXoB2l/ebJ5xsnYpO5pX2WCeltVu/8gwbfJvoNdvjGCTnsoYUtW49LZTi5ljT+n6U/LzvZ3CO+
	Brjib8UTcg8EfwBt4ttr1ooQ3DOJlpih2aX2j
X-Received: by 2002:a05:6820:3107:b0:6bf:5d5e:5403 with SMTP id 006d021491bc7-6bf5d5e6442mr2124859eaf.69.1789033645265;
        Thu, 10 Sep 2026 02:47:25 -0700 (PDT)
X-Received: by 2002:a05:6820:3107:b0:6bf:5d5e:5403 with SMTP id 006d021491bc7-6bf5d5e6442mr2124836eaf.69.1789033644850;
        Thu, 10 Sep 2026 02:47:24 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:24 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:16:52 +0530
Subject: [PATCH v2 1/6] ASoC: dt-bindings: qcom: Add Shikra RX and VA macro
 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-add_shikra_support-v2-1-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=1664;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=Y3Q30/XDZYkT4BsqAnWiL3C7rPGluprH6psQ4WloVLM=;
 b=r9WKk3NBp3woDrr/YBMoN7xPIif0fuIef0p14R+R1KaSYh2QUnPWZh57D2YQtnbp9hFWs1Cu1
 lbQi19qnp9TCKOpVshnNLQTfcM3lEKWVu63WVbxH50AM9r/SC/V9/UL
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX8v2WKVK872f9
 +xdH5cubb8yiolj7bvAuzl999hqh6gr6UbuQywzqMH0gsvO8VAd33omNvUgaEv7OcoWm5I48M8j
 CEwTAptApu6M1nbglw97jIMshRMj2tzER+uS6scGbSpehwvIdwx/aWH05oOCjaMG5YWHtoqkeKT
 ZV4oxaNa89zEtj1BZX1VWJamCtD6z7aVyOvZn/mEB7psAamEL1/kyZmgOfZod3ec2+ccQP/cO3O
 eK9XP/wz4Y9qQgpft2zeQC6ipCRxzML64DrQaqMZHAhLaU8fh6ToWMF1neq2gfqUtm6NsGGZxWR
 Q5FmrYP7Pj0mVnjCcnORCPC+J7ZbO+ndoCn6Nh1gIXkZQW4jv3PdaG3qCn6wxYGCRFDQJXQ9LW4
 yE8n0898iEsWoG4Psu+91DsZ2WCyb319ic+vylEEUdbU2GpplFTTw+hpMyoB27VUn9OE/+NcUnG
 BBs2zWZYsOqmwZS61tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX/bdUoHjAQ8k2
 MQeYiNsiF1A8Oa9QbmUKsEta2qqSqbYkMOjW4sHl/r1Nu20oHd/nnZdQwr2AwZP1qW6NM3PiPFt
 n+SS4MkSaRY8aj3nXNGM1aM0mF9lJok=
X-Proofpoint-ORIG-GUID: oMZSvHp9ISGyEdW2SmEIwezjz65KLKNq
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa27cae cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lABkJ5illG85_PuKTi0A:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: oMZSvHp9ISGyEdW2SmEIwezjz65KLKNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100111

Add bindings for Qualcomm shikra rx and va macro codec.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6..d2f68b025 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
           - qcom,sc8280xp-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
       - items:
           - enum:
               - qcom,eliza-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbda..23f00de82 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
       - items:
           - enum:
               - qcom,eliza-lpass-va-macro

-- 
2.34.1

