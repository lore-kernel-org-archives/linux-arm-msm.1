Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95BE3859FA
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379466; cv=none; b=UE+d5aWXpK1DjfhEU56dVuN/Rkv0uO4aaokHyv731zX56vNShE46p1bTnBncMRkudfA5L4suCQug4jvH9GRaozy3zqzagqdelJELt7eQMn4tb9ocV3KadyRVq7cw/zCiWI0Oc93qfHlzVbz8OvT4jh92PNsxClo3g52Z+FtSHzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379466; c=relaxed/simple;
	bh=xt0dIfbU0BtlsPnwy3/JUQfeGdBD3gUJbPZnDZ4FIF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cDxqdeg2bAe83bqNkQ/nhTsYUiXPgwi5ME3/RWAG6PifTZXSaaKqq4Kknyrb6aJG3n/9EyrTzLW8eiXtHAQqJnUciizCEGG1ZayZCb2Bf7+xgIzH+SdYL2N+9X6OYetUksJ8OSpPb5JsztXL38DMDh6dmSlBpigoBCPFPSeF+o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SwU3NBRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQIdrWuJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwU3NBRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQIdrWuJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHEJf178541
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZd9qdn4jJ+TfuW7atuuCkzu1ujKCTjlDR+NCFpwtEA=; b=SwU3NBRJjJee0W/q
	TJuu7Gm7spZHzHkFoDvJSUhPW8Ty8H9rSc4qqvJCqtCp3v5++9nNxIk7By4KqHGt
	XS4/ElebD9VLxVWcKAgdLNGSVKpaciVIT9K6IK86/iBMUvX2a0sd+nja26sJnxXt
	kB2nvlfYKUKu2eXCgdCw1FiH8NKd1aAF92qsGmjROSFHKAeliDFeqzISVVjzO4lP
	0ssMnn0WsXL30A5UJPcmAaA8sCMTcyKjSyB/TiCCsDb7PLTkU6xLvpQvPGEgS3Oq
	Oh/BmTmIcmlR9Bv9lEmYWzxNhEn0JPQqA1fBz9LaLtuio+O5aCeT7z9kHAZQOwst
	oqt/jA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7rqbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc101287aso10555366a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379464; x=1784984264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZd9qdn4jJ+TfuW7atuuCkzu1ujKCTjlDR+NCFpwtEA=;
        b=CQIdrWuJsvFpXuoFtTG2djHGQxK2wUghP8ysA/7dFw1oWxpi/2pMpDSC0qM2I3ZKSC
         7RdyiVgJ+bFCrrg5p66NVR0tgFOQ2nZuoLUiHtHuo+nfUegVJvGa6WB8oaRUgSyZVQ2D
         UdIDwPT7R+BehIBzVFT7S7JKccF/9Vk3yYqKdxQNWA//+5m/slV9YOpH0+9r3HcO04gR
         fYD9Xgqz9kFytrg1dNwQMDavxAIlbNTY6NkCcSnAWccIpz9XZ2l9T/+wy6xAHEm/tPTa
         NLPCaRy8ysP2WbpHbxZNkw2S/7kqVtLcCHGvMVKq/AiO07mzMRKTAhwOxOiXI+hLz9Bs
         imeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379464; x=1784984264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZd9qdn4jJ+TfuW7atuuCkzu1ujKCTjlDR+NCFpwtEA=;
        b=nSNWd2AUkOzpfUPqOKe+mxBgw/OjpIn94dXR0RwDSSbkZuW5vJXHqJZc+1yr6jYCW0
         GuAj33S9465RaN3qC3NMyv2bvfCgIFeN5FzLzAKlhUAP5+qod6YX5GKJbu2MIXz2h3bP
         2nEWo5OWFLIFydp1OzQ7c4s2cMP1KV1Cm75fcMHs0Jp1AvHimzgAiL5wQ4yCyhPdBauW
         zim/4GCQU4LeFjWv+Mw/hoq5stTI0TsPPfTveUFSEsBo8m8rVQSH+f4V/1pF5lxMqV/+
         770o2bOdd15VF5Vfw1NRZ0O2erfoegEXm+iQXfMg9m+OF2qGJqAnTYfdjaKtq55vAyIY
         ogpw==
X-Forwarded-Encrypted: i=1; AHgh+RpSWZMhb0GR/dPL1TB363hTcC6Jjpnhb4wsDfdQdwBX8V8wPUTkASlgmU1L4IsUBfbXkCZGhGFbCUt3tKRb@vger.kernel.org
X-Gm-Message-State: AOJu0YxiVCxsHWzgNc3TmIMTtdMIwWCXM95+K9E7t5t43MVZ0Mh2LD8y
	SqPEYBUMOSSdJnh5vetaa0YYCTjiShWechX2GZCs+HA50x8yeWmn+VYAYOMDZQPUv6TDpjYAvMs
	Jf503nEB6JUdhQRkkNH1nNdsKW/Ry7dd3ENodTb7V0BNKZLaVYVQEY7H7AWA3uYlAwCqL
X-Gm-Gg: AfdE7ckTTeSewmF8ZXz8OFr41nZ4Iv4cQJqdT0+GrxVZT1s9ZrCMMhrv7fqsonuDt5L
	J0I/UZw+elg6G0MocHiABm02rZH5CGR2DBYqR7UwAw1IQoXEhtkfJ3Ej8F2E7Mv+3ALO+8Krsby
	IEblYwnW/LWyl7VaHfxDas4tZJkP1COefAAZXT7A5B6DE2kCIL/XIPGTMnNzMPJsWjxxXoi2WTR
	MBfFxX7u3rGEUCy4sp63WlAGby5LMe1Jo9ZJz1c1MAMbnZQLI6q7iMfnBq0POZRcH2SMsuJKbTY
	VIVv5QvCPJe4g6X7mEf/XTfXImlzyFqTJVPTPmbQkeovvolo2Lnzpku74jBxLmRPtGkvQnqKzuP
	AGMcPOwJpRwtn9rV+SMgg/Tmr0MPHYYI=
X-Received: by 2002:a17:90b:5908:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38e4b448c32mr7467125a91.15.1784379464464;
        Sat, 18 Jul 2026 05:57:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5908:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38e4b448c32mr7467084a91.15.1784379463998;
        Sat, 18 Jul 2026 05:57:43 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:43 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:20 +0530
Subject: [PATCH v6 13/16] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-13-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX5RxCrprBPAcW
 y+5DtH4g7WQ+S3LyNdDYCunU6PRSNGX2bLd21fjjJRxMasW1MbcVVAJ4FPYEbtt21rf5DRN6taD
 o92KVT+jRuTfa+8nWslkEZxj7/+4H3jEBeS2g4p87JYeKzJhlzNtSEvxN2KfyFRVwtoNC/xeJpQ
 h39sSS0nTzOCRDKDOtwcFZohTCNolQIZZC40a1lAVXBy89Sal59mkEUswZbXuhu06dKrsL/n+4e
 hyScdxa0+wJPFkupUIf0PVt48Wrk0bGsSzkGEZOlowuGA8jNGjdQKnxU03hDivjQZEyAPmeZfXs
 2zuQ+f55P5EbDzuUeWjo6e8E4zeTLFKvNP4mMKznIU110vnkxIUVIaU3Jql8bAER1svN5GMKBsA
 mxKGFpajQSesn2lPQTBg7I8z+eOknhf5MZAhVbQ91exMuWiRqja7Iff0V07XsB+PhaNeOitjxQt
 h9vsFDcIuFhUHa31nrw==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5b7849 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zFVXnba82tZ0OxNrzBkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: FJCd1cG72q9IfXoEzFvihrFQziObuSIP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX4DnVP1xM9dZf
 tLkrW1CpnPfAeZjOYw9M1GQzBQ8BTyh8q0nKzcyjUfSM6yPkweM7HoiYPGK1fQQSKrS9JkvgioL
 atMrGi0BylplkFKJsQUWzH34KzWsd00=
X-Proofpoint-GUID: FJCd1cG72q9IfXoEzFvihrFQziObuSIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

The Qualcomm Shikra Display clock controller has clocks same as QCM2290.
Hence, add support to use the QCM2290 DISPCC compatible as fallback for
Shikra DISPCC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index e9c2326adfd285444257b96f5adc68e27213281f..8d4f53c8a6cbf9ae89475381ef6ce6e7b61b006d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,7 +17,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
     items:

-- 
2.34.1

