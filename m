Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769395;
	b=Pz6SZOZ55jLlAGC5Dh7/cR34Hb15mTrhmav76eZhfIhw7z1wyGlm/uG7KJPedTU6+yhj
	 od7O2Pr7lnUkobIWFm1MBuKgvAcu/R91SYVR3FvaJK9N55dh39TK+aK8ecALbHa4WT4JD
	 KTD4K2CgWCTiL918prXsAolXv98mqtNlpWRYs6lthedphPI5dRVeDQu6UAqiU1FNvEr37
	 W9/ys8o7hZcvfUpnig55ljFcxWF89vcHmfYzrBSQq2td0lsGfdShz/3b+Bud+UibVafLd
	 D7oKN+nIyz/xRN11YltZAa5/q1gJjK/cRPifJZevrFMdsd+Pba0dgKhL6oxpNB2KZ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
	b=e/S2jJ4EiHxw7eHu7mXxNPLks3vbOlmTlSK1GmoPFgB9nQsNNKwc8GPBunJXdhCxRc9I
	 5BtCTx/iNLx4ah6iXrmq3lSd2jq7KNynuM4/7qUJTSv8pwS10B/5rtJCbIPOsHfNgckIh
	 32765pwH04z4PIgxBKjouYM8id7cGLibuxFhTFPpZ0UnwplI2vj5STE9ODPHWmGMc3sKm
	 ny/L179rMDwUWVdA82Ugk+Qu9DnBGa7fI5XmXZ7tWgWYWYm2YSv2/kqJBai80AtOWrrPu
	 Zs3cDauYj6bvERByfOMDr468jErKxAXMfyUPRmaUwjKhcRskn1JWu571SMTitCNwQNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E3KkDh8K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2uVrMKB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B35260A263E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B35260A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E3KkDh8K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2uVrMKB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7HvYT3118096
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=; b=E3KkDh8Kv8+fEIH+
	UCG+LFrtxkEQWCdVW1J64XarWIJvApM+yo7SEzI/Bh7VE97IsIu9BZ59bu9t/xlg
	pnw/Tl0b1U/07AR175T1RkPCuPf/6Tx3Ob7lGb9yHQkXrE9/W7UIu5ZhwFJKVDbk
	0jwjdJyvPGz05/GtQnBYItYBHimZjhlnwvP1Z8ZVu2DL14Loef90v+aaeZKLr7Xj
	E6ztXA4KML253nuH3RgcyC0dGgTwWEsxrjaz3h04OoB1Oz536Te0LmTuYoTWJBA8
	l/dxONWQ+7bBXyGAlqNTvhDrRpQ+UUr0vYZ//PqDXEmpCYZKJh2iVHjCs9TvMWxl
	T+UmMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh8s4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:49:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f053ce0234so8886645ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 00:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769393; x=1796374193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
        b=E2uVrMKBQ6BMDr3jJyGWJdftIBpLANmbXbZvJU3hkRbUSjmQQfu+KOooral3oWIVfN
         sVNg2N0F9x4GLSnxqMAzkJXKC2tq+ALLv56OHo4a6xZ/RTCPtJE8KXIsJcTJ3yuSe3ft
         8iJPAMC9y2KRkPTpawS9Kqf67Fe5/vzUsJAsTM/OZtl5YKmt7CzLSNO6iZgyGzk/HDsf
         9GWe7ujd0Wk9QRXVCoKukolCVdMwc9ktHeKV2oPZjNIT4E+cF+3jl3yExEbRnajtdJGl
         AT4PySH6f5FLhPygD+dWoFrI/c+LDI+n6ERNF6KYfBqovFJJJRbSTlfQeIyH8b7RzAyQ
         yA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769393; x=1796374193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
        b=cXW126lzvWkWxUScBk3fn10Gf1jXLEO6Aq//lFS/g9UXCNbyLt02r8xv1SQZPM9HYQ
         63eyVkS0JQSqZEk1B2+Y5Zl64fxNOZ2SBUVx04HADCpiQFMWNm9LtygycWs2xk+9ASVk
         NVxUMT7oA63ixTF51sS+MKL1HDFSla3vSMOgSxMPA84bWsxccbaBCrORzCGQ3aaNPtmW
         2oMTxnowV2c98JukI4M89Y+D4QXDi2epBFcKc3k1F7EdKoqR/0om3Xk9V6S7ZVbw5zGd
         UHecncGx0PofC/NO/TmWdSCgOJMvucv7V0kh7Fd/ZJsyRqnmxRuKCvaOlbijOijcTWyn
         SvWw==
X-Gm-Message-State: APuU4Z8ZOnRmzt4uKxX30g6mQJjtF2XJUX2JXtmI+EEUU1vvtkOSmwa/
	4NEyRNn8gMdNRxCKK0ZrXoysze6L2gxmfbXcktQR+BhyJpTvziVVmGWdPQha8UgKMApaKirVyh0
	T82xgyRLJJlVWWQpDAPU3/iVRBPw2u+p01cJihU4sDLlqxnbTYVrtsR1Dxy8otArGCHKz
X-Gm-Gg: AZFdTZcOkBe+thNjWLq4aJQRlepS3hot5RAm7eCZBw1cs4f02m3JGpBxhzN0uXhDXkp
	zA9B1C51SyTvsecw9z9nJHCzZ4LBbBWtFT52qat9xyhAqV/434HAhqt9MTtYEOX3tcWFxq2SVwL
	rWIHdjlcXDdnf4/ruON1WEIZz23sbGPmJgMU2P2lFftBwjmNRv3aZ9llSE25iGtDnHDfPHzBpFa
	cXiC6PpwE51YcOOSwcR2F+HCTlsA2h5Tj3Ua0GIz52EmGqvSaaXlBuMMrf8W8PkhSCISdzJEHJb
	6fDSR+hSPBtyQiJ90Vf//lVYv4r1SQYLtYNTsLGt0X4VxJfZ1HqrqrrzicW1zB/E2HjQdZfDZ/F
	ul62VFKQ7NVFpdDy6NN6JeL7RKciPAEYy70AtSl35b3cC7nGMrFDAacS4XCZqA431Vfd+crczbO
	uTmuBVgTubf/6nMLOQh8mfjqV6YWTrkKhw38Vk2Bmgtt9Hty5yMnWMEgCgGvp3iPPs+XNWYTKde
	F+wX3+1SxOFSGQ6HvqtUoh43DKqlA==
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr373538505ad.0.1795769393098;
        Fri, 27 Nov 2026 00:49:53 -0800 (PST)
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr373538175ad.0.1795769392692;
        Fri, 27 Nov 2026 00:49:52 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:52 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:25 +0530
Subject: [PATCH 3/7] dt-bindings: leds: qcom-lpg: Add PM7550 PWM compatible
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
Message-Id: <20261127-eliza_disp_all-v1-3-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=968;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=td6QK7QkN9RdMGuNpRMBkvBsbxEVpka2RCJEN8QUWSE=;
 b=nqIn1yBnMRkPS85K1WKxZXXJYyHpSwtecI770QSW4rbu2xlg02bRk6lSpqsyDLejO1ZElnfZp
 PoRcejJxhjVBerkKVpJWrllXzJQlVNSK+T8iWspoPucUjkmijwcm4J7
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXy2b4WlXhD5Qp
 IsWDAn2Fsh0Rt/CXhg923prJb5nsDft4MCn/JvEodSRN70VQNZYDT8trM9Gkw2s9zb5HzDOLy4Q
 Gj2/mlCD/ZNBdFgFr73TndK+B67Jc1b6PwLhPL76na1N2x3SA7iHS9F5AU0UKHKs/x3MvRilYZF
 unoyu5pv6AlklFHr9ICGHF21ABMzi1YSAByO+OU1DAy3/evnE23gpjqEEl4yo4oDCWsq89XTq9v
 sXg2fobFjbZNQ9XhLo5yzqlUmNuMW31L95DxqfXnTF5HZbfoeWRx+68qZbrJ+n62ZRR78Oypul6
 x92u/vF5+rYJv2Z1G+HtuZ3iV4tN+46YFiDtgWZpBJUvS9jkdRgmrSo55/ssLCc5XBC/syKZN3I
 5Kp334P8rzQq6zxGRqHfP5IzEk2zemN85hC0F8+F8d73SSLi8AzRQdyKXBENaAIp9tG7Fxo/031
 PMrZB0WIoTZygmU3wOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXzHIXlLF50SHr
 CfbSEKKsJQmUZ1Zck+3HxnnD0OoErrwmC0rGGI+bseEDLqT4GFlPoSfOcl0tLdwjqhS7oLfnDFQ
 lzrNscpMCQiSj7PZsb1QEutx8cNm4Aw=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b094432 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0GMz1rgL7QW-eojhWosA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: fC8T7RZVfiZbcjIv3vATI5BJUB-7x9MO
X-Proofpoint-ORIG-GUID: fC8T7RZVfiZbcjIv3vATI5BJUB-7x9MO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270034

PM7550 provides an LPG block that can be used as a PWM controller for
display backlight control on Qualcomm Eliza EVK boards.

Add the PM7550 PWM compatible with the PM8350C PWM fallback so board DTs
can describe the controller.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 3da0fe532e74..cf2c78f7f6c5 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -42,6 +42,7 @@ properties:
           - const: qcom,pm8150l-lpg
       - items:
           - enum:
+              - qcom,pm7550-pwm
               - qcom,pm8550-pwm
               - qcom,pmh0101-pwm
           - const: qcom,pm8350c-pwm

-- 
2.34.1

