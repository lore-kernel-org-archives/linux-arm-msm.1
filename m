Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993027;
	b=Ys96WVGgCuKMF9mEP0Czs79Y0J33xwJy+9Yxmtgj/jmm1DszGS1NMj7brxay513V35Hf
	 1+QXp0dH+Eld9Yp35g36oZ0N3W7jGsZwSFjUhA2Z8Krd1O71MQCi6IJYNukHu4ddDsuVo
	 gKpE101saugmro8Ui3O425LT8ZkrffZ0oeRKtJM/UIOPWysyykNp70qNXORNpA6eTO4lx
	 GTqvWuswQycVgSbBi/Y9d20CcVmwvdvmvLzfPyRwiJ8fObmKQTorptkNN12nSDTO7IVNG
	 V/GtkWkzh3ARdYLUT15fOVVLkFR+l2ev64ANzSFgv4eA1Qzsu33v2Xd6tAH1HjlY75w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=;
	b=fcp5cEY5jRFmRXdc9P8k7yGS6WpjTIoI9EwYqqMSaoafK3imDUii7WHvTvvO2nCySTCj
	 ndqNvF3Ma+D7wAKIQwUYD2iWVfmEZhGDUrVatvjJBjitkpM8WQ4vEH8Q9x8z0U3cye1zW
	 gca6mqa6z6cQJQILmxge42t2CWQk8DZ6sk9jtyuh1hi+h886at5zoukGb7IGwVvCFU2ja
	 PI2QIWIAVQpmzd86HPB4zhZ7s7yRkYTT9Z9Ou/PokEPHbxHYEUOnvlAIN5gT88PEn/22o
	 93wt03oHkpl3B9FdzkE3uesYJSvgf8KKnuQBCB4KYgAQ/FHbjqzWd5wrwQ+PhXB9zqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMtxz6KY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PJ/PRgjL";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C1E606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C1E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMtxz6KY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJ/PRgjL
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8TW73472530
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=; b=oMtxz6KYWcja31xR
	n1D0Ify7bz6aTMRbYaWu6axyjbD49U8VQDW2KrP5Lz2J+wQXcYlYIk3xtco9gBPH
	d5dcSCS2pdBpAIbpdC1osf2XKPfyADntsSABk0ADS8eDWpuyaNcrJs/cX2rpl+Qr
	gDiGHaW9JvS2bLpml3Lt0IANBI4cGQjal57utEblcSq0OtLkseybe3uSAD3AwnMy
	m1kfsitbs+yCdMszewbqRnujw/JrpD+jVdL6Et1VB62UpCDaxmVlZ802dhEyLXSW
	grB3BxJ9FqCuL7pZnSLWpacVZUOFWLvfG5JnOl/X+J3qLhZLQS9qUcGyPysV9FLI
	LuvCzQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8a6ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:10:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ee184a2474so6961595ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 01:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794993025; x=1795597825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=;
        b=PJ/PRgjLKwWG+QwgfYWeqEAEVpKcM+SNh4xLMDHIbQbXb2ZkRTn3f20aClRfZq/O2S
         +tZQWUMIN/rr3+ummd2yA1JysBo42E5VOT2mrlXdNNBylK70D0sp+rG5hdiDY9BVN8Kn
         ohMICWQ+OC/JgfQEe53LeXrI7HFF4ZW0u21UCfucmHg92CaDRVvyqW7ZjRr4EJh2L69U
         5AfFyHW23UIdWLxgNTE2NSsbicQi6eaKecdLuAAK3VjqLpUitqArXQiYC/x4k1z1M22J
         D2U/1iwv+2Qvv+7FyQOUakYx/yNiKGeq85dnbb9m6JKNgZetuzhPcJfmmafKJ66m3TJ6
         uTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993025; x=1795597825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=;
        b=YxMPz4U+d7NTjCRpcP3CC1MYNEgfSejCubyNbN6mgQt35VofTuQZy95QHhi169dnwC
         mTcFZA6MDluiD1fFVlBQf3c2wR4wGmRM8q6GhY8xGobTPkoNOIm8euGEILj598tA36o3
         WiHQYQo7aCmoIbmsk53E2qjmqyr+r60mE62kTHhtMRhFEbf13IR2IBfLEhYN5oEPNPdF
         JOi3nxz0mvC1wJwxNYFvGPZ9jN4Y3C5hQjWXQqQ6X024scBVLCk6fcaE3naRtxwOYeX0
         AW8Iycli0xJi0IDISsiWKYGyfSdLCQCFrJqu0/MVq1Fnrm9LzvKTOyfRBc085o0LBndR
         YwZw==
X-Gm-Message-State: APuU4Z/b/IUNb3L1MS6mJ+CdFcCvLUn+VCAjfB7ylvLrE4Z2eb/6Tw1m
	Z4eHooPJL2gnmBJNxpDKda9sYn3w6JIYetMRTuNWG3b149wwvRrkOHlnpFpSm8EaQ3/K+y9cxmA
	KYCx+fHdtqfKUdBXf0lEmpOK7SGTAX4vYkNqJHu8+h2W6/9pUYnVmYQcw6lND2UfnRIXX
X-Gm-Gg: AZFdTZc5lRSzy83z1EhqnKDEQpPE89khM6lgj5bzOdEeOT90KnX8G7G89pxeOLyrnuE
	mw71Axir4wKDESuNAyEOcpSZIOnyymsVQ7lADQJ/wcbYmKypTjcbSks4v52D8tpKCZiY8csaEZQ
	5qVB/HRbpdm3JOgfjfgKBC3rYg8hAn+tq6OrOtYYDyvRUpnawi4hwiCXtPfQMiJT9xzc0mBegEB
	G4tQ9ZW4iYzF56VZ1D2kR17ETQ0mVbrxBcqXVDAtVyTfJW+j/DQcArkajmDXmBrH2+U7/eF2J4T
	i7LZt3aokqxEZZuko3Rn8uQqlsUht0TY7NhbZs62o2SUfbCv0Qm+MR16JsYE+nf1ydybo5NKBuI
	p+tubl69XXTzvxCaqvUH379JdEcl6K1P4IEtVgZlwyBBL2Jw4FhMEVK7NhPxq1UzMBrdcAfZEmA
	rnZkp0TF8gSdDm+TXHDbXasTVbr1k9DEs/m5GL2oloagUnjw==
X-Received: by 2002:a17:902:e84c:b0:2e5:4604:c375 with SMTP id d9443c01a7336-2eff75368e5mr20617825ad.48.1794993024429;
        Wed, 18 Nov 2026 01:10:24 -0800 (PST)
X-Received: by 2002:a17:902:e84c:b0:2e5:4604:c375 with SMTP id d9443c01a7336-2eff75368e5mr20617485ad.48.1794993023963;
        Wed, 18 Nov 2026 01:10:23 -0800 (PST)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e1295sm10147735ad.71.2026.11.18.01.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:10:23 -0800 (PST)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:08:53 +0800
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 Glymur support
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
Message-Id: <20261118-glymur_ufs_ice-v2-1-7ef4556eea15@oss.qualcomm.com>
References: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
In-Reply-To: <20261118-glymur_ufs_ice-v2-0-7ef4556eea15@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794993016; l=1009;
 i=wenjia.zhang@oss.qualcomm.com; s=20250717; h=from:subject:message-id;
 bh=d1zDDePFJIPVs+rwiQvZLUWqDZvC4Pb/+gxCqJ3DmHU=;
 b=buaRCjhuEH1IwE/xt2SlTyKymGdd968htbzKbSweircy8bDUw6FMW0PrEjd0nKHgnqg7E8zv8
 pqSE9Nhyg8gAyFGeyA1By5aZ4fHHOhOIiI/ZRlhJWgq324l7pnDp5qG
X-Developer-Key: i=wenjia.zhang@oss.qualcomm.com; a=ed25519;
 pk=Of53/+6KgVgPh1R/xUMTbXVCnBiHTmHby8ySh2ShLtw=
X-Proofpoint-ORIG-GUID: 7ijdnQrKarFkfWLQxaLoK7e7-5h6U3ID
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd6b82 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=B4SCuiGsYTXXqFn_0MoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfXw4Apcs1mgtyN
 d3IjYseiM3c3yELXkr7AP9Iq8pCLFBSyt5BhB9WSeztrimzdr3MkklmGFYGj7Ygg+Oj7R6Va/GK
 Tt8PDAkKKTLgwPmYUrezJw4aUQfGRyTfA+ZFmj1IdS5D4pn3RpzYPobUVtk8mEp35lFcmJ7E74L
 65zGFfVYBejBW0lgJOzoNPjCC0iTWhqX1PVulL8aIwEGh3JRKr6hGuB19O2nws/XIsCuNaC0FJO
 IYilhDhJvT4SUT9e915t/LIqj4FXSabgieSSlGA/jRwbodhftdHl5Iw6CGsN0FIaiq6at4qopiN
 h+vFctkbsTVuDK6nemsxdDfvAs1p8rXdXlvs7hAIxVeFQEg9T6JcBXj/q22FBIGu0h3WFwGTx0O
 kvMigMQmhpqKgH51UFwpLJva9Lpb0NvHuV4bhP9Olv9Jw72qdme6TgLx51ESfFt+Nv1U8NtNhgJ
 H/CsTeCvOxWeEPhjt7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX+SmULq6SahMq
 mmQNFj/t4LCC9tdIyCJToYNkPCCPloJsZ9jZpawl2EY46PiWjpOR23TrAS9jZktJej7XVqXImSu
 2kbySUnTqVAidg9989P5uerU5lWs8Uk=
X-Proofpoint-GUID: 7ijdnQrKarFkfWLQxaLoK7e7-5h6U3ID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180036

Document the compatible string for the Inline Crypto Engine (ICE)
found on the Qualcomm Glymur SoC.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index b98c4c6b77f05a4295b7225007187a7b05387338..01a1a36652d759610e36d5ac3ad56f4b2d45b96b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,glymur-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,ipq5210-inline-crypto-engine
           - qcom,ipq5424-inline-crypto-engine

-- 
2.43.0

