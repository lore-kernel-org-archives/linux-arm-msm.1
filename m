Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E02F7EE8
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593663; cv=none; b=C2vG5woGsbOJGFXsshbmf3He+gmnhP1WV6A+f6OQcLZZuA+0fe8j5LZLCOBX/Ph+pBYhKlKqNLpsQtVihY5ljKDmWx+M8HiJwDTAP2CdrF8yxqTCgUhH6btdvSgrFrQ+T5w5NxiP0cPwTaGwmjcBvXn2QRZgpuQx/F+Xh1CjlUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593663; c=relaxed/simple;
	bh=H1XGUYtUyd3naQF5ZZuFdjgNtcnlLUBHlekLIAnHQ2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FiZiZc0HhSYaKEn53c/JsqJwk4GCxMai9iwIQSvSzFyRCgnnV60Nwt1Cwu9wr5cLWYpV9lsSMzd+7tMaJj+v7ccfYlKKZxCKxvejQjncuzCaiqp0AE4i6hzLBS+buDUCSjgaU+wtYtNPh+PiS96OnyALCKoEUCRrCZys30pAzIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cghffBhU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kR9WUl8q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cghffBhU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kR9WUl8q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CaXXi2924940
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 14:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OVcAQSwuRaoO78bIyFzYtvH/FlL9Q0jkjsAlJiCzQpc=; b=cghffBhUet5CHVq/
	Hp2BFj4MnMj+S7QhQwkL835aBl2OI6/PFUXpelCRUeDktQ4MLC8wYLom9nMmS1sC
	Q+mcVIdqhX/O/JkB3tZ0NOvk73Pe6f+7JXyKyDlXgHKCZGyK1RnPYbpweLOHKOmO
	dqXLCEn2tS1zFDQiQ7ZatRfXS+bHYLZyZTFXAe7ogYXB/SaM0csLzMyEKKGQ47jx
	RCaCQdDWhQmN31wnurafxMaA0HlYP/+15ypqppYr/ztaPn0noaMv7gqSwbFVsRhK
	5oCBar241h4pKT1og88e4CSeWImWq59IChGoTy+SzcV4humcPhUiX6q6SAKo9Kx8
	vg6uMQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6h3a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 14:14:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e6d253330so2211117a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785593659; x=1786198459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVcAQSwuRaoO78bIyFzYtvH/FlL9Q0jkjsAlJiCzQpc=;
        b=kR9WUl8q7WRtdTXmuScat20Cz35ZV+E7Fo4mHM6Szka0ZWcPsXxy3V/WVwmjeZLMNX
         5BGLCJs4TW3R0RmgkATJgreKSVuuOsonmoIedYOFzqgVCsglzVbMvb47DqnGFn5/izPL
         7aCJ9pEYfUHk7RdNr7Luk2sHpDQIY7fHW6fG695gro0HCllM7sD9EDiZl5cH9G0Q0YB2
         z7SA2uUraehvuvB6k8oCnmk+h1VuVJAokT0fpgm9xjgUcDfdwc9NJ6YosqGxS0L7vKNB
         UoCWg9O/3ZMD7w++018BTsy0NeBEok+/mFlLIeD3NvgQSDCcGypByoq9FUbF5BS2FWi8
         LvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593659; x=1786198459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVcAQSwuRaoO78bIyFzYtvH/FlL9Q0jkjsAlJiCzQpc=;
        b=BKaBNpkI7Wc5XLX9i6s0xzskaexhaVkgKLWLToQS6nCRf5VhZBYyls2rlZtH/+c2fJ
         rNJXced3vnOBTOIuYkfYs45MY0uFokhknWniEfCKzAbxrXRBOKAZdrityzLhYOo0J3SZ
         sFiRhv+0JTPZ44hvLWA7KE7BcYwOlQQ0UyiUDslXx0lyngyhHRYby5p6IP5gE3dpScoN
         x97mt6vlcGP7zC/WwECuJNmmvb7T/j8fd98k0Tz2ikodkwiG0YTIqiiXEg1ZCn6CDmny
         IxwcJu7/uoZXwE9wOD5Tt/PdsSJGfCUvGfR5G3uW+8feYdyM/KKvo6K1xsiFdafWbXoB
         IOGA==
X-Forwarded-Encrypted: i=1; AHgh+RrgnQhuvi4TDKYl96coyBHKTNLYOjjf5+nTkAOmHdy2tcuHFRjFOQm9WdqL4wCsA0E2GbfMJQVNniyfi4U8@vger.kernel.org
X-Gm-Message-State: AOJu0YzK468MzvDDjNDtYo4KeKLMbIEhdrr9Uy/EEVGbjjjizeIfB8wT
	Yvb7WFiXjtLBtFS+QPvLzZXOxTcHuTFi8FSyAnUE+xxDdK3K5JSTPAzL9kvOtb+j4WG9SOTslIh
	b5pNif2ZM257L3NPZnCPYh5pT1kkHNTEJn+PU0nDXenyUkKTRLE3E6OO6MEpkjw8SYKWr
X-Gm-Gg: AR+sD108FtFcCDDlsuzGZQecNgnJsR0K5E2hmnSXXJSGPIKaaPL7TIsiUuc7lESUPul
	2eYUjOPhBIH9GbH58GCgrdqGEGWDlBfwxm1pCaQZunpH4nF3kG8jN86neDX/lQZlAWpQvrr37IF
	FkFJXq2mzOEmrTa2/u7MEkz2BKFVU5b4XvswSwOtUHzNA854+NlFGB4NCJ988dbb8DBmWGbNg99
	t+1BjfT5dULXJWcfxzLEUVZI57lEwl9/tzOZ1FNldy4ciXZQHnj0hpttIonl5Qqt/BEQplDmhUz
	BO4a9GWuSDo21T1heH1zN0O4ap/96xerb5lbkRLpgxDpZvkXhoD0HuDvvcPOSLh1Sn/erWLz+I8
	MxzZuC8EIeFhi5yyQLuB9NWY+
X-Received: by 2002:a17:90b:580f:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-38fb247446bmr5868637a91.8.1785593659532;
        Sat, 01 Aug 2026 07:14:19 -0700 (PDT)
X-Received: by 2002:a17:90b:580f:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-38fb247446bmr5868618a91.8.1785593659075;
        Sat, 01 Aug 2026 07:14:19 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm13570696c88.13.2026.08.01.07.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:14:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 19:43:54 +0530
Subject: [PATCH v2 3/6] dt-bindings: clock: qcom: Add video clock
 controller on Nord SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-nord_videocc_camcc-v2-3-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
In-Reply-To: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfXwfLB9z7BZeMC
 pKLvwyFap6iO02x17eMCD8JLHpfkjtSP/gzU3y7cxXFEsN7IemYRDVTvF8re7Jw40qzAEp8xAmX
 phaA7uNBmp6hK85kYH/1wmsQbgGWLiA=
X-Proofpoint-GUID: rhpk0u2DHQfTFKvGSLwGEXyzgtRD2u04
X-Proofpoint-ORIG-GUID: rhpk0u2DHQfTFKvGSLwGEXyzgtRD2u04
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX/Gf0peWuCr5L
 udpX8ubb+U468ltPwrrcg+IgsBGe8nfsj3Wp0FWbUcobXACX2LH744Qd+8gl/SUIA61fFBUyBtt
 CKUMsITAtX6g1yX38tNxVOayWifDQ8LAdbZ6MNv1+WSK8oO4Fnaa+3QSDm+rb09mmMe+pDt+FK0
 zU6cEQ6KXcGsemPO2RC7rCyXUSFWkAJNzuXX9Cwc5MFZHgnZRcpnrRQRNQQmEi7iK0cV5cRY4VD
 UsyPFhAtzvPeXu6OMxTxjZ0q4YczZspZyz/jEQ67t2reW1bYW2PkQ4cfqa2WrX9nQw4UV6MWx/g
 HF/MK/9AciuKmxboZGYuDYpMyLcKHtlL5rcigm/5xr0i85tb4sXATD7xPJqYk8D5AsVOSTU50HG
 33enwdEvw+PzIywUEe5k1iX5rd4nIvZHo9WM7UhfVjEZWjs/m8v+iMqw62q4U3CGM5JhP30Yu5P
 4PZeppldf48HfXEcIwA==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6dff3c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=b-Tosh5mKKyvZrgmVFQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010114

Add compatible string for Nord video clock controller and the bindings
for Nord Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 1e1fec1cd7ce96f103348baf85341e775fac690a..65620a656600ff61afdfc22b6675f5a46651bd26 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -18,6 +18,7 @@ description: |
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
+    include/dt-bindings/clock/qcom,nord-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -29,6 +30,7 @@ properties:
       - qcom,glymur-videocc
       - qcom,hawi-videocc
       - qcom,kaanapali-videocc
+      - qcom,nord-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc

-- 
2.34.1

