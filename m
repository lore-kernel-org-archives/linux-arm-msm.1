Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D557844606C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427250; cv=none; b=TAF9S/HGjff8ibuPOtENlKXoFpO1fvX+23pIb0R/DX7ad7kQDBQ7eCWmnVmeFKbERhLLVwY49oNu3JrvqaC7VW7oPxeSNhgeJhI+QORievzk/MXGNqxayM6RHyjnwDqxMD9SZdwCt2s1vLUu8M44snSoCad4z/OEctaRKvGkgwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427250; c=relaxed/simple;
	bh=rFLR77CJJYP1sKLFQ6gl8hLWfcBFJvASp2MjESWcdt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iePG+x5wbJkvqkXkPCoygYP5wQQd7f2CH7zyBCWPZvBat6qsQS0l856+C74YHF+kupD4K1Xwu7RLACq+PUI4MxRcz0aDGMMNZXQIOJCuwOMmbQurO/gbw9qA/W5ip9Nz07BXd65Fu0SFnhkWxNrA57TUtB95E+EqTRAUlnoUZhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dv93W4+k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIOWY5gO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dv93W4+k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIOWY5gO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQrF21145169
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=; b=dv93W4+kq74ezcsn
	PoGGxoSG5/baz/ImVuFoETwH6zagLZ5tCc+ntmZUwNhu9mrDn5l/aWdX+3RqR09k
	+qqDCr4MUFHFy2rPZp8wG4vW3hoQDx59OoBFCBpp69kYIrO8bHxv/0uRi1U5GXdv
	Ugw5LFDYcP/hHdAAxrIGONk2mCitPtV6mJXd0G5bL21EoMh6yhU+rkt+32uAL3GO
	Dx7bQgk3HLRrtq7QxCpVI8QG6nyEWp9k4X+OwJ5slZ3KmwCUAiAv1GCKNM0WAkR7
	cis9ttgsPcKrpB3KBWV4g004u3i7whUdRwaCue7TVmdnnOT+NKRa3xMNbpUtrbcO
	bY0fdg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8k60f46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so23309321cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427247; x=1786032047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=;
        b=YIOWY5gOzu1U/uDhVWwIJmU2+KPPSYcjOiWij/RYVyqK9yat2kV1e8x1y3USYhLEIX
         GQlAbhiOWz6s2GXrhWD9630pPMKKxI2xXWLuk8AIGn5uKINEviPnvXFIbzI2rijvxOZu
         4d9AcdaSk89aB3//sBviWO3jKRtZUXs4eBN8NSkTSrHwiBD/zzEbhTpNOhclQfslP91o
         uxil1kW2UShaxlPUxSwuvBBZpmt5F1Gco13102Io2TYurq/lQWdfc3c+k4REW0jbBnkc
         cHZek+9jBjqqLfRYAC+bCMsguOyU2oEUg0wEM5SXbQndaXJR5riWEW305L+sgdObHmfN
         GbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427247; x=1786032047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=;
        b=ik4G/h/2PCem8Sl3mpVxMqyMPy3HFoYoSluStJptWI7EIic4b5ySd0BQSA9MK7tPaP
         hUWfq7nKseL0Z8EZlcgK+Ev1NbmAXdxkBFo5732fceKqCqtjnc13CgoAHN++U0EvbNiI
         JXXVoEUFz4H7ny5tBp+BymPu8Tv4ys3xv3pxcWfGUCD4y7nZrSNknQbsUk7Jb77SC1g8
         ttew7qiN09JVplA7bkmp6eLjMT2cAL7vP5s0mkeKQqYaxYG1G0XJ+WmUS9eGWWnJlXWf
         3yb82MTlJEYs2Bl7eqkwFHwkTqLXZ2LfrxfBD6DB2o/YCFGtndLsBkH5e2+05do/vkBd
         VjwA==
X-Forwarded-Encrypted: i=1; AHgh+RocXpJsKA1B4X9CrUMJals0RGMPruRhY8lznR4AO6XsNlOnV85SLBXRl6bFs7mPEl+Tgnv/Owz/RoQPy4Z1@vger.kernel.org
X-Gm-Message-State: AOJu0YzI7a7+0bbN2Ax8GUmHCO+KADMk16JpXHNshexpmXqB584ZpXT6
	tLwqXdNmv86IVNrMSPN2NnLhg8cMXFRa5ZUnr/W5Pv3bOJLlz3qcobZrQuOZWq4kXGuvqvwNn7h
	WPSa+grVoDw5R98MstiG4DqEIXEieI8wGi4+EaHSRaGsLsJVBZ9/Z9NJur7PV4Q7gAgpV
X-Gm-Gg: AR+sD13I/kZ4cZkLwQNFaXxVyPiFSfV1za2vXjV1TJNiKX2rP/GWZ09qN7vz9hF0Ih9
	Rxe2E9WywPToevaxIj7ZZKkU4EdEAreG9AxNrXUU8AYB25q8qRtzkcB9PzqlTUkT+56ajnqW9Rb
	1qz1BxjoaG3tH4KnbNLTpxzmTH07w2JXY5PZMOu9ntfEquP0qRtZa2V8JaVmCz56NGIEwUGf1og
	QVkFurSBiZmIrVh8vR+I9VDB9EeAUTI9tRoAyGGCdyq2b0bhbT/l/JAI6yRkmRfsEJ7hKmkgbmR
	LPdSJE6/ff/eC9JcdjN4Xm9BcEwmrqFSHq7wtQPH+h5Rl5jhKgQitCPhDR3+4FfMgiEdZ3V3X9d
	uSuC4a8GMCIeHGKsLVP+BP0+WMZxg3gdfuDgZPGfvWG4l39tBVH1ekH69ddT4mCpxEdrl+hAapI
	+7iZcGKO0NZdBEgC7A8m10YRl08FB5VMAKjF4w5xovz3NSj/aJN0lv
X-Received: by 2002:a05:622a:511:b0:527:6d4a:192d with SMTP id d75a77b69052e-52b42cba100mr8220481cf.68.1785427246043;
        Thu, 30 Jul 2026 09:00:46 -0700 (PDT)
X-Received: by 2002:a05:622a:511:b0:527:6d4a:192d with SMTP id d75a77b69052e-52b42cba100mr8218291cf.68.1785427244656;
        Thu, 30 Jul 2026 09:00:44 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:43 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:32 +0200
Subject: [PATCH v9 02/10] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-2-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: PeeX_RKXCkT9gl5Svx3y3cy1giHoNJqn
X-Proofpoint-ORIG-GUID: PeeX_RKXCkT9gl5Svx3y3cy1giHoNJqn
X-Authority-Analysis: v=2.4 cv=Wqgb99fv c=1 sm=1 tr=0 ts=6a6b752f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Xy7nGJaRzBGhkMsTZAMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfXwJoo2v89Gym2
 MaDdewwtQwrKIHsMslnmRqCucUn6Nj+4VeAQwvQfnWNpinexGZpLaJxMcuszoH/6xW1aCOYcKdP
 boyRrgNadekq/mHec6uH5hO4D3vdeXiIgmm+2GpkEHtfOg+IlM4Gs4Ga/9ixQW39CvbojIJp/jq
 EA4PhUS7XThE4fMhaFh7yTKkonhEUL879nJvNyeWaHEsGfzA3sjlYx+Ccs4jpZvy86OANu0PUMv
 QYm5//REXzWD3Hu5Qbkv6DFqtdCY0ECzQ48A+0eoULJ2YWYJA53+rQw2VHavI2sfwyLKhp824VL
 XE5XTvad/KlPleBwzpSgr6OKqIVTpuedyRGW3QNQ3p9Bu4iJsUqCh74eTIrTU/zP8H/o4eU5Fss
 lMTWhS4LDj6be44fv+CYLKQ660jxUpfxYCmhF8pxeSwSyj6oP1umlOwY6LtCq7GPzGQVS+H/D32
 SUPGpgQePwXY9zRLi5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfXzPTdQTNQCDL9
 5mpLMvfYxGf/iQmhz7PMM225LggfIzssOgjUVbo3LRIZ7m5H6wt5MyYatjJH9SE2goZuYY34Gki
 rmEsB0WxfVzxc07bKh9LUvAh4RQBD9M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120

Document the NVMEM cells supported by the ath10k driver, the
mac-address, pre-calibration data, and calibration data.

Since such data may also originate from chipset OTP or be supplied
via other device tree structures. All of these cells are optional
and can be provided independently, in any combination.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index d4f4d72ee0d388f43437fc5a3047f90b464a5274..7f9d16cb7c14330e11ce7d567d585b5e47793bd8 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,22 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    minItems: 1
+    maxItems: 3
+    description:
+      References to nvmem cells for MAC address and/or calibration data.
+      Supported cell names are mac-address, calibration, and pre-calibration.
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      enum:
+        - mac-address
+        - calibration
+        - pre-calibration
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1

