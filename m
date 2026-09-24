Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF14426694
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235197; cv=none; b=VEq11WRYleTpXCoAEmsX5mlFsrEW+Y064jwSfvLk9L306iqqYtjlNvO1dtsGWkANRSPivwI2hq3LjVebJj0U//KO4xzYTXgn8mNsiAjPoUR7iYHZdQUzJ6JfS+Xk0juNVL4tX1IkHJBR8wGWFnNVuoM/BKT4LL9/tTLvZx6rSFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235197; c=relaxed/simple;
	bh=GzcigBc0rbTXCdNzeexiRkY6jv0CY0+K5WGUqikGLwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBnYrg63PsPmdshiE7Gk2//ycvQnPghH30DF1ivfiVd/2Ek2Dgp74hi++lWoIpXUI17w0yE+9HP/+EP2kHKcsPMKMRR/t8iSmssxWFbtdGaTzp05CEgJwHNt24nLhYFhcZkzDgP5jzsIB/mifAI1XVAsGz7lUQxs0kr0hVFpGUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S20WMevN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtUmkwpy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S20WMevN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtUmkwpy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e6991531617
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9vVNqesri0r
	EOoI8xD9HaZc6ZJPnV9h4oo44NefXgPM=; b=S20WMevNicUwksszgIY4oRrCTOV
	PHdAImwZxs7am4pOBGFf3IK5oPOD8jX+b2xfxQOJgYIJ3cPYtu0zUsSXcEiFStT0
	Jt8N/gIEtAOwNOPnvjrJ/bMxU710/ORYBf2wMqVgdeaY2FvveSOciB3pDheE2kWB
	94Kz+Fvkx4k2WNvDrHaZuTPJlbC0bYVjZvonCq+qo6rn+OdZNXZrTvJxx4U+nKh/
	wimPkCGqHmJ8rYxnY/mdi21Gut/iGrC1Tg2zdVdIhHXdNhl0TQyrmnzc/7trVqT1
	D49nuyfRYsh8PK/7YPAv/wzp8yK81u59FoQJtsImAlX4R31yg8wC9Bs/mJg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgs978-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:33:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32850005b6bso2290973eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 00:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235194; x=1790839994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9vVNqesri0rEOoI8xD9HaZc6ZJPnV9h4oo44NefXgPM=;
        b=YtUmkwpybR1MBdpgAJafuVEeS47yFZCA40QlMc2vSVzsKEFi8VD45JBTI7t4JMSM4S
         iVUfbBj/SOrN1jS1jVr1c8yMGWUZDVqKBcbC8xjlJ28AHq84N50GmxopDjXXx59HTamF
         UxjaXobmfWWszra1JkS4T+RgOss/lea53PdzzGV/hxAOre44l8QXN/LKxuFUrBMRkc//
         wCRSQmyomyLWU18LMh30NrnvjY7o3/iDpIaBEf0srzak97hziHhOI3FTpwgbszmNHPWm
         Ce05YtveSXEJer4TKmwlz86jmnTVVtuyDDqmrNKd4hoa9Hksug0qazj+0qWA+/9UPQjk
         JLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235194; x=1790839994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9vVNqesri0rEOoI8xD9HaZc6ZJPnV9h4oo44NefXgPM=;
        b=rO9z2Er4hfYEaNb5Uvs8LOqO1TD447urhxSFrCfgTngUwZxTRN1Du+e1JC9zm8GkG+
         IVmNuZEvm4VvvLFkw8+ischpfNnc/ihtIQquPprVoaB4WUWIlOPV7hpjVnKhyY0OaDVF
         Ox8bv0CyiTq3fjngER9ZGcdkQGufGJl+zZYc8apyU2pVh4rurUiXxpl1wMpvAx7fUMlP
         12J9O5H0Fyw+O6sLfVGTzfVnE44l/xq0Zaj5riYL9+5z10vjh4Zis06EkyECa73hqNOm
         1KCTG2LBUCJ2v1oSow0LSUfyQgwQaNJ0smaU6dk4Vq/csQbhXXSFE+pi3xCk4X93oS/c
         eDDw==
X-Forwarded-Encrypted: i=1; AKwUvBxsJOr+q0l94MwyA6gas9uMCWLLD59bl9DtD5JdlAGIj0xn8H4fbbRhhJmXonHTbmoX36oknXN2oF4Wrs9W@vger.kernel.org
X-Gm-Message-State: AFuF++l5/XY6fYnxacj7zmD77uYyJXg0oTRs/U1stDmoZryxUnYFquah
	8z224nq0alcJ1bnEUh3Oo1zv7srD84foBrB30L/0dd+9VMhSKP94US6oINV09ghPDiV7iXWEtLN
	5x7JchXri0F2M6+dzhJXysAMRkn20YiGhwhoT3DRIN4G7SRL2S7Kd4by7ffOOXC4Ar+9K
X-Gm-Gg: AYBFou0PXT5C+Ui6wgVmYUCYQMQxme7jpR8k+iSJcThIDvx53LYeV0+dsQKm+gWw0ox
	hEm5r4+/pcIuZPZn3ZfIwnxQAN21PPQASP/o1JyyMv16wSQr+jnfuf3PyRmszzH4G72lzVs9RXp
	2h1Dm6esmyK2nGX6FS7utF1pj+fdBYHVt74XOROPGd7uM7+f1Q4FpN/Tn0aiw29V6tZ9QC60vX0
	Tb/2Ruq9XvVyLSyO/GtS1ndvPptH4Ky2VYp2QtZ42go4rj37ApffTnhYvtRqEE/kxSiHo8Na+7I
	9PhTMhk8oK1IJEpeC+x9CG7HPLtRlFRodLIRU9sNymRvkYg0hSK0JK8lx4ODPcS5h0WLFjvS5WL
	AZ1frJiS2SgB7nrMmHasghLKsKIsJJiA/sAHeaxcSWI/tfUhP9BhOjtRDX9U=
X-Received: by 2002:a05:693c:8802:20b0:340:7a8b:7286 with SMTP id 5a478bee46e88-3407a8b7623mr559846eec.25.1790235193829;
        Thu, 24 Sep 2026 00:33:13 -0700 (PDT)
X-Received: by 2002:a05:693c:8802:20b0:340:7a8b:7286 with SMTP id 5a478bee46e88-3407a8b7623mr559814eec.25.1790235193146;
        Thu, 24 Sep 2026 00:33:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm11052635eec.2.2026.09.24.00.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:33:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Pushpendra Singh <pussin@qti.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: interconnect: qcom-bwmon: add nord cpu-bwmon compatible
Date: Thu, 24 Sep 2026 15:32:21 +0800
Message-ID: <20260924073222.1000666-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com>
References: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab4d23a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=0xkv8-iTUpmfRSWBdI0A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: zkss-vv4y1tJMaQeM3XiXJtlP9VrazoM
X-Proofpoint-GUID: zkss-vv4y1tJMaQeM3XiXJtlP9VrazoM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX8bnoduhrFwY/
 UiDOBTR1bdMoGD2lTPSrYVcfC9d30jLxB6aoDMg23g0r6wegZUV3w5T2E6DsudvXNJQYuucxeRf
 dc4gBhYdV4OWUpGdmtKt2jZu4j56rPs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX6FjMOfDYMs8J
 rMJ3qIh9W+pq6eifoxk7ng2qV5qCwItAoaheQIZnc0TPIGLgh5QRoBxai+EGsOe9x+D46e5Or6j
 HOsCUyl1UjBBaQ1mV3o3ILyZsLZhIjHr8J2CBUyl/l+LmF3CFuU39vAbj3Jp12Njh4fnZQkHXg3
 N2bNqjqMBwraP8BnlH2oMYwbiTx/nLjOpodZ+aCWY9m6DmzRsVrEjCE5qzP4K9CPSALl12kOTfY
 NaoTeaZ6AG5ytOk42x8iH3os1p/5WCA4+fvbYXoZsCsQvqtC3lb3GYiOn0BeAptzDQbKZUzMJr8
 4rlvI/rPQRzdN/OLsniizXMxf6wO7a1Illd4IILTErQlflxfcRivksakBShtFcZA5jbZtLdjQpM
 PyoNDDJwMBxwKaJp4d96yLJ/WW/hzUafIdib7kUCGaZvyiNosgHwVEnrchGLKfdvreKl2vSQ8ZJ
 Z3ym4yNgi72BYnsnxvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240031

From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Document the qcom,nord-cpu-bwmon fallback compatible used by the
CPU bandwidth monitors on Nord.

Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Georgi Djakov <djakov@kernel.org>
---
 .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index f6969910bded..3db61c38e2e7 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -30,6 +30,7 @@ properties:
               - qcom,hawi-cpu-bwmon
               - qcom,kaanapali-cpu-bwmon
               - qcom,maili-cpu-bwmon
+              - qcom,nord-cpu-bwmon
               - qcom,qcm2290-cpu-bwmon
               - qcom,qcs615-cpu-bwmon
               - qcom,qcs8300-cpu-bwmon
-- 
2.43.0

