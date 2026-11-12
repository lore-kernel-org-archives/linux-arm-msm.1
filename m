Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487905;
	b=RpYXymk3lysrUcR3Sqj6Tpg7MGJbLThKnfIswd/6wBHU4ucnam9hGkaLyDWC7DzddVar
	 zoINus6HmptQ52Dtpe4UlZ7S9BuwEU6xqJSmnJ/7JliCFGqL7XatGv8KZoYZo5PxOLtGy
	 wvYb/JvygmYVM2N5JzZaGHKiDOlRsD1jN+Ur29DLriSgrFDvSM45zwhlsbQc2lMMP13N2
	 1XUukhuoxYPZeaXABnuijPtBRiVJO7zLv3DMaKxvuLUJcTwiW/jeHctEDJZFRvgVJCbMc
	 xxXxMDokUFNgdfbuVNtRZLucX/G+0pIfk8Q78gm5HQRCshPKhOyh8oa1/Jleokwt9xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4KzwRoG5YP+rqPaS1TInFPrQ2vlnjrd/coRwFuyNkx0=;
	b=Ec1ECndYgFZdIK1o2ARd8Qqkxhm951P8iEp7sDoLVSf9k5wYQLgiN2W6ACXTuE1hxh77
	 hAnlWQ1+rbrkqr64YEdpniljQocPB412GTetHFP0MRPbmq9f9LX5QmEQc7mJtT+rVCc5W
	 JMp/uyVwlFPkzvwwyCS9spi6b/GqjfXLUpm/nLrjds/4K3/jeerWsOKzFmdubH4F4BYSg
	 KhqWlDlKHeaQSB/gVxE2kn0aJpS4zNClJNGyZiFUlmCzUlhuAd9F64/PPwgcpLMoR0UhX
	 swduU4WNbkf2fE+HvMSMQ5Kp42zverZQ87YiR70HigZ5QDrbEuBmqem0FHzVzL++f/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AimTuc2Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHL1JtWx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D68606A333
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D68606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AimTuc2Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHL1JtWx
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAUdBq1629246
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KzwRoG5YP+rqPaS1TInFPrQ2vlnjrd/coRwFuyNkx0=; b=AimTuc2Yo9yJik+V
	+PM6lUNbKSS30/q+gCO4oJLZRjVqDRk3xFpQPxLuGGu5XzKf3gDfyyWjn0L3TB7O
	1dzsDAGOhNkftxBUeWAn1mxEtV9EXRx4jEzUBVhtPjnqDZL1uR7H1Pjs5WZUGb4T
	tLVs0jA6laI41zLrqaTCAjIL9xSBV5J1u/QofStmX4fshJUw0rJzBrYratRr6pcK
	tXyJ721YUIe1K+CGhzPxY1zBM3/u8ajzDDUKcUIhYBLLSK4BrkxdTOAsJDuXaGIp
	l2oQLVuMDwmbqdQGO2xNdnrutq/3sv9lT4qb1ME6mQFMtRkZ9LBcfrkivVvzXtOH
	DNOB7A==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs00ews-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:51:44 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8490253aeb6so3915416a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487904; x=1795092704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KzwRoG5YP+rqPaS1TInFPrQ2vlnjrd/coRwFuyNkx0=;
        b=WHL1JtWxsFZoY6QW+h724nFvARRjE/mCmVTP+TlGS41IAcp9Ypq0gjnWASBB8umgB0
         yAya+eq/mc0ZahVrVUcAItpQO77pbxgxir9VT2frV48kTql1XpC+Xb5aYYGILN3iMDGi
         nJwAAkJRWK67IEDobXVJGPG232XVE96QS3BLuE3mmZ0Tjw7PRfwpWzuJcjuZ7l2nPb0i
         VG5JF05pzO7ouzIehPBEoUvUG/uoW6zjiiSjEjWcufsXpra+qOsb6rvn9DYUVbRE6DKz
         raqdNqg8SeM9okhDPf3fHi9UL/E2Duc2ATBvMcu9gtf9Sw4ouExuUG6lt6hSybJs+gTB
         TMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487904; x=1795092704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KzwRoG5YP+rqPaS1TInFPrQ2vlnjrd/coRwFuyNkx0=;
        b=DcKzTqic666b7OzQHF8UW9PSizVWjLYiWBqSelHxbYAcBvqt1T2BLNIrtv231AJKLN
         2DINcdRxJ/qWaVVgYcYj51+dd5Ib8mFVtc+jUJgv//9b0B4LnjOZyLFnC1kI3LhpyMJ5
         UpTSzmbWYLMJlsBNu2GCWPcF3auZomUEToSibYX9a+2w2U7E+I17EzVy/nXKnzwF9rOj
         PO3x2rUk60pEqILPf7YbE/YAmRqPfJsjf8A1KBMZ5bl9xsf3ytbNwIpdFuRxADfhryXW
         JiowwpUXHPhOsshdzL5em/4u6jn7y6gk+aXg2jJdWXefIH8bks62+5PZq67UIgMbi560
         TaNg==
X-Forwarded-Encrypted: i=1; AL+hErGHmm3UTvrAhsy8pLfZta1Vj5/cRJ+Ws6t+jOzYNoiqQ8/o+kdeM00mcDeSiLzZSD/iPbEqx78c6J/lPBkG@vger.kernel.org
X-Gm-Message-State: APuU4Z8dYrDNZdc3sl8vCCZ/Tv2ycoXvDcjRdu2LztXxR+OZ5JxHaDoS
	qmlMe+p/jlIMlNvoMvpao6cT2pJF2KMQ3UVZmw2xVn2PIbRiCZqyOLFaPn0PsVs+DfQe6FPSsgG
	m/h1hTpjsTEN6TXrxPicdtcmdO09o1LSsog5ig96EJco4iQH9K9Vicoerc8UE31dfvpZ6biZHrP
	nL
X-Gm-Gg: AYBFou12LmrLUdGpUrTK02GAFS9Baoe4IIi8glKQRu8csirYPPOZY3DSFoCRZoNf/0h
	3NrqRy5f6uaj0lJnqPllCcZZDiSfddtwJBC6f9qm9EEyPaLfnYNpAzowLE7h9TaHfTyb7ese/2r
	OzKkAWVw/+XPwo0KFgVTw2myNBBdA7Dqc2PJuIhFO6dguqJrGsYmW7FYutluJu9LyF8Eso5cZJs
	/pjXPB7LYgxMAdcjtQUMwEqn/qHWpdo4bgrEmBcY1aYvGWkJngsWjsGGLmwtmsSkXyQTWEKGNMA
	HcITnpjh8u6yISxs2S0sc+lmrbzsqGzf4/wEi3ZoHnzL0nXtlRNXRzk3rME88XuKfks6GNtc6+H
	iBJQ5uAip2vIVeyZ9nyCw3jnV52EQI6XfDr4HdgAPCc3x0ObsoKh0Otks9InVlbOnxDLgrR1E9S
	wLnxL4Zg==
X-Received: by 2002:a05:6830:922:b0:861:f4f6:1f81 with SMTP id 46e09a7af769-861f4f620ccmr593994a34.31.1794487903771;
        Thu, 12 Nov 2026 04:51:43 -0800 (PST)
X-Received: by 2002:a05:6830:922:b0:861:f4f6:1f81 with SMTP id 46e09a7af769-861f4f620ccmr593973a34.31.1794487903345;
        Thu, 12 Nov 2026 04:51:43 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbc7eecsm7608191a34.15.2026.11.12.04.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:51:42 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 18:21:07 +0530
Subject: [PATCH v2 1/2] dt-bindings: crypto: Correct Shikra QCE compatible
 hierarchy
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
Message-Id: <20261112-shikra_qce_fix-v2-1-2ce112cc2ccf@oss.qualcomm.com>
References: <20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com>
In-Reply-To: <20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfXz9Fq2YOldu9X
 bj+KZ4orccHya22sJoO7sxerCePwzdW3Kd8eXbd7SiL1q8x99Oo9fdqj9mdhQSc1IAGJ5vHQiuZ
 D0L3bg2L4utCSX8ZT4uyVSiwuysFP3ZsjrpRDLWViaW4s+SnHf4MXP01hbztfDRqgNLnNpQ85PG
 cMZPXmrj8AKqZVm3Fg8iIGigRxkAYcW+NM15PuVqV1w3pluGEoF5KQZnlFKg7Lh/Oj8QLrgPBfG
 PlrBRkFr+5ZBBrA852zxYX9h0swtf1AAXWrmAFbhPg6DSFfKLGP5Y8+DLN3Qgajnx40ldLNCCBf
 pgCbM3oU8fyfWM3wfhIb0nLbHjbJKsRxUiyr2IfztQU8NKrX7Why3pXuuzuuUv6hl4jA3lszr3P
 lIy8XjPurveuvHDBFIBs6VA69oELKWASRNGgrEAiIisl0WPHBbK0wD5gXTvdLACNFoj4ZEDTxLK
 fBfIHWmS/Y5B/TClr7g==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5b660 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BEl7XTdPtaVR2fHMDO0A:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX3Hxnhnj0NjwZ
 yv8y8tuqNhDEt0UEYQeqTUVpG0GqxjjCA3j/pOBXFZWGCd9guuj6FbOBjW99MWXmvWFpu8bEsv1
 tyFEdxTfBqwC7wYwEsvLtUYZRuyucgc=
X-Proofpoint-GUID: vASJQ32n86ElVbQfCPu81LIO-GqMwslP
X-Proofpoint-ORIG-GUID: vASJQ32n86ElVbQfCPu81LIO-GqMwslP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051

Shikra QCE requires an explicit core clock, while the existing
"qcom,sm8150-qce" fallback allows the clock property to be omitted.

Shikra follows the same QCE clock requirements as QRB2210(agatti).
Update the Shikra fallback to "qcom,ipq4019-qce", which requires the
core clock to be specified.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

