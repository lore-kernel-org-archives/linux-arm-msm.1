Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EDB175A84
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292530; cv=none; b=UaoFYrH8v3HYhG2zladqZPbZjZ8BTEf55Cm14ba4CiwtBB3fVxmPI+qL6MQluo/rbVb9xFn+RDER7n0FTZNeHg+AhNU88uG6hbKbj79fWLlRYMNiKwVyuRWlahJ9oqwL2VhJAtPg05QxL8fTJBeQ7g31D5ZApfMjD829+E/+ptA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292530; c=relaxed/simple;
	bh=A+5TRK9EGz9fRh7GbcDS+rgwOlXWbnjXZFW1ALyzjTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nD7laj7N7emF3GXA+O/AOQTksNjSCXsez4Jne6iVz2/91jheogZejU9S2MELPwN+J4SxDUJ2S2oPDaU3/kGHONwvFw5dVWrzwjaBsxWvVsA8RV8qt6r+tymtViEKpiJQ/cqjyjJ5xeRuiUtTOSDU0yj4k+QzO7KDTOVc6pmvZHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/ptj4gX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPnTv+BG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/ptj4gX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPnTv+BG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1GsFp1463636
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FKM8mzcDPeP
	brNMyncwZRP5amm3MqElucl2ZBJ9iPr8=; b=I/ptj4gXPcChMq/Wb4x/D+rjZyv
	COE85NDSfQvqZ+aA8N3qaFzXNIUroCPK2W4YTplnDHSBjZ0+hOnrkJtd1qtqi/95
	zpyZ/4hsoDlW9L9KvrQL1p+emOhds+1bgKhXuwoIsK1cpri0Ym+KmUVE6o+/2eh3
	riCYEGoObQAyPYBGPq6dJi6c+TJKN3jzMtAaWG6omuavgyARNVEr4ft3VRfZbai4
	5qAvenL8b2goS4MRc/9L8IRAg4qdM7I3Zm60rV1bnyAGW1yV/cK1hEuaMF9auJcp
	HMCrw3+pdsPaDE64KLxRI17eCJdRdv0/RuRCsBCRXnxp13azVz9VgvX960g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvxxkd2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:35:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb733fc5024so580488a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 19:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292528; x=1785897328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=DPnTv+BGlYy9smSg6UgfW0BbFmgBkdd9PNAXFqRuzoyn6+5H/0itNh8NzTz5SSE3ek
         P5RUoznY6XuukClGGd+yAl5p3duToSKV0fgaEeQ4s76+jt2GnZsJ68IZj8FXo/CNH75+
         LMzbMOVFidAvvWoMLbGv4lVwL73uEAYIHwm9Z7dIIC85/slWAtEkJSNYZfQP8IICJ80N
         cgbSHeWx3NlECkWf5mFF0aj/b3A4/Je+7SDobKNnSX+gPP3+hFpuPScbSePyXoOKLOa4
         nv6O6BbQJaUhGQ444MldtOEbn3Tos10jVX3NsgN+3EZTtGbIo1Ri4D3UmjYoSVx9wcml
         v2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292528; x=1785897328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=lOY142ZRJmxRb550bFsYa+xCXBN04OTb8CJKl6ZOFI7GAiYqYURwizUxC0susp+i1O
         QugQ1u4T4V3+gMo3bXK3lp1gl8d28f3rKebGx7SxzryPjZrKEvmXbprZsd1AzKgyMMq8
         JmCIY749mWWbLKXw3nckekH+kWAhzuHLxpD2Ttq+NRnG5yy9TJJZTNjK/pCg/HlMbcDw
         L8MfzEtAuZVWoTU+Bj+UFVguLAwq69iwhWTNanGFjTk13FI77ZRPUGh3xXrvezoeEyNU
         jX91oIBsXADJbxOyC8+AmqwC/wjPEPHDOTlS8TuMysPq0IukimJED5dQefveH3skcbm8
         dTew==
X-Forwarded-Encrypted: i=1; AHgh+Rqu1MxkFifjElMoIRs9o4LJa219wZH0tXtINLwHNLIBNOviwcVdCljPuU0UnV8ZduXbk19YmBUhh/ED6U2+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxid8IA8Vt6YxgbImRq0MAdG23GHxZ36jZAFVBGkS7uiVxpi9PZ
	xlMzsmCA3GJFunMwI8V6DminESBpqh8oxBmADUNysw++SO5RtWLUMxP12vooPGgAzvKnqg3RrEK
	vvr7U8ZfXFBZCVpjKPR90Uoe2K2jSuhDLW7+HHdw18Y6sc8X082IhCg2Qg96+euUIpqtq
X-Gm-Gg: AR+sD13kEoEipCl2LSLVKbzjBfOK/QupV7C712aXXDyXHqHynJHbenLPS6d6yVLVmQY
	C8rhvgP36/Kl+9EP8AfSoiyDKAyUNN+yjM88zXHaRJ7SLXl7/liGmxi1yhLoljGOHfoS0bnhfti
	OxB/IbfcZLqhob0+6nN5jUxUDkst4ajx5om5SzFJ8O72Ho3JrGaxt+es5FoMP6xbZDJf/Yzj0uY
	PXudAE9hcbw+QRClyVFPiwal+D/kKFaKDzFcRoMpjR69Ouxg3Qbm6n0l+eqpxDjfsLIqZi+JW3F
	u69oG1YJt1306xHWxndqZB0p+8BQuysMFNFUWZCPi8ESGqQLhfLmly2YTZTt7Bzahxp4mZ+nXp+
	vobH8gdltZMFqtNIUvuwUIukhUhNV38g4bNnWUT2QaBdGQJxgvVbQiGu4IW5B
X-Received: by 2002:a05:6a21:3a86:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3c8aaf7b0ddmr5848086637.8.1785292528099;
        Tue, 28 Jul 2026 19:35:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a86:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3c8aaf7b0ddmr5848057637.8.1785292527609;
        Tue, 28 Jul 2026 19:35:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265be48sm3899837c88.8.2026.07.28.19.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:35:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Wed, 29 Jul 2026 10:35:06 +0800
Message-ID: <20260729023508.879752-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
References: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX7uffpFxi4ZTM
 4Wxn+RyVQfen7fpwLhUN40HTlG/+ONBKjl9j1GW2PUmzYZiDaCSiDHyOmYM+I0gSPMnbUPDLyFL
 6Yb2S6gR4lscYDXwwmspthOJEh4T/zeeuA65K0aFMXHQsqCuq3bVFt3LzIlwbovfDJwuHfGbkDt
 iYnmycvobHpoV/rpR/efwqWKe+jAvTRuQTTuS89zlo6CJQn0ja1nGFFLUEVRE+ZgmzGmgEUc93w
 UpVinDMzCVxdKyiEKFeFJWreN7H75z+yOwi4ju3KOAMntWJkC2Fu/fC5BK7W+doPe2QBA9bTOUW
 8soYKWvOwwZetrSecT1owuzExyFCVEVslmmXVFvfLaVnVYIS3SXaaMIXgZlPaQcnuF9S6cGdyxK
 sN7qMi4ETK8bDTRFYzPnjNi89nagAvZdo6qsExY1IKV5TCwZQywjscf+44xT7rO+BEU3n41cEsJ
 GGNMoNv+84Xcc4uosHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX0gtXfnXjjyXh
 Kj0qmaZg5AO/8n9LJpDl6zFP5Ggu4ETuCgpCTuoaKk80CQHIjC0VfQW58+Ru55fjZuYHJ8DwuGO
 gt2fiVhFf1d/NQRltAls/70kXwP3BQA=
X-Proofpoint-GUID: jzhs9c2hvRz-2T7DY_ol3KeDQ4AnZ-lt
X-Proofpoint-ORIG-GUID: jzhs9c2hvRz-2T7DY_ol3KeDQ4AnZ-lt
X-Authority-Analysis: v=2.4 cv=PeDPQChd c=1 sm=1 tr=0 ts=6a6966f0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ubaIkse6WMRjXItqsd4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290018

Document Always-on Subsystem side channel on Qualcomm Nord SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 9f9d9bcb66c4..d2ae2ae87a95 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,kaanapali-aoss-qmp
           - qcom,maili-aoss-qmp
           - qcom,milos-aoss-qmp
+          - qcom,nord-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp
-- 
2.43.0

