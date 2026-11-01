Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563360;
	b=NaWNmKdGsUEadQssn/Kk6z++EBQZ+85IdhGM1ZTQMiMKJ0/3p8VnCnZRAL+v+u09VGS7
	 fdfudMXig7WbPao7YDcL0R5VErwtCmWWgbyhFr8R2cjSfq8SnWGfXkQPTQUuic+85GFfc
	 VIEXfd+4rM6BrD2af8ZLGPYEswJT+ppKypIxEwUQ9LQvUWnkCJQPhVFZVOZr79KRwDDZC
	 eDJ5OkRX76736O77eBGeiBjc1MBtscXlf1pRgSEOiWrKg3UU2e7XPs2SthLWupPgIp5BW
	 pZ7OSPgnH1sJ51X//fCsbmF65Eh3Iff3jPxOcuwkej/rsMF0BcHAl2PssZ3awZ6WuqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r9kXE3edEuG7texiLMa4Fjt3yBbJi3QC7DKXeD2lXPg=;
	b=gzbBqfqUm1gJA2cBb2PXUZOWPOed5+bFK2+pTlComic5wzjsGKlwcz7mb0qxTPxlEr/2
	 bHtRVhhsoNhQJmKBkBdppiLOGw6k/EvrVfmOvEKht2KxwvVMPIOKIzoTvr3eEA1pVKnFP
	 PT5Qujw2EtZlBP2rdtyz8wH9HLdQn3W3NNjv1kMY1Ry2+LM2vvoVB898HImH3WHFEm3yy
	 +8CnS5jP0HnJe5pk/jKVY8sM/LPsWGQGJ1H1bpepYO3y3bWnS5uWSPu9ahd0pmcrv3bOu
	 z1BDji688XUbOPt7LYeDFxbhG8fSg+bqgTeSAIyCtJ9DS8rTFYsLDnm7qNZSTqYbBLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RnrS5jaD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzOF0+TP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C7D606A326
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 20:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9C7D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RnrS5jaD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzOF0+TP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQHcm2020144
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 20:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9kXE3edEuG7texiLMa4Fjt3yBbJi3QC7DKXeD2lXPg=; b=RnrS5jaDMLFh7yHb
	FOvBqHQ6sm9ULkxVT77GWRj2czp81Wf8heSGdy5Ptog9z5cO5T36BxYcY+/0Miuc
	UqguzFzwPRBlVyqdDjlUuyup0qkBKCeuUZwgPmpqsnT9JWPS9jp827eSETH0I6Sv
	lrzdYZ4irG0o2n2HYj4Vc6s39gt1klFRI1dVRyETAARiIetbu8Nrtg/tJLWPf8xX
	28qAUuisyifYubKnhQsSRacC7gS1xzlKjLonJQmQN8OpWfUzHAh8Np0ZkdZlkxIB
	m4id8oYhSwed+zqKxUz63I8JuQVJ86NSujmqBBeN4PpuYLNzsXdnGNJXDs2CME4n
	wZiE4Q==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6m7e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 20:02:38 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8ab3dc2a7adso40567907b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 12:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793563358; x=1794168158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9kXE3edEuG7texiLMa4Fjt3yBbJi3QC7DKXeD2lXPg=;
        b=UzOF0+TPAclUTvLux3kmfar40Ay7f7D0EFJC/28AjBIhRdqKtnL0ZnrYuDtSJO2V5b
         Okb0SKcVZ8CP7NYyA3RJr3GUYI0bXLOKZmWobK2eFM/g6VOyNNgZm8jWJ4lFJqDkRjhW
         GjWgcxiFiVBQPlI9bAqD9AjW/PM5iShEQxBB1bJvwSbglDoBmE9Luf8KR9o144BTZNua
         sPh3sT7eOTSdjE/f6spqYeI0qr872n3fGBVnOSFuLgvx5YsqM1+We9MFmGAXxGfa+x8E
         nwxuCxJf4nFkyJWlUIXhVX3488Bo8+Ld9THs561fE/kUGc6+6Zj6HrTMWn9wvzywnFGc
         xrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563358; x=1794168158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9kXE3edEuG7texiLMa4Fjt3yBbJi3QC7DKXeD2lXPg=;
        b=z4DYji137Nc0FzPdn6z+eBMVbfNu8rEJvd4Ha9NJp2ZVOflsDk/vkLVfdy+Ob+38Lo
         1xrRtzUxFfWCaPL9VO7qwSFImQ01bYgMUWnMqLEP1R8U5S9F14JNxS2PeRA5kAKkmV1A
         gvY4kUqivvObuV6g2qEe8bcmL6xZR0vYsq+PngdtdazxRLRtezhjCjvdQP180mAacUNU
         R/b8D69JxXruFfbWzHAc6M59cS/g+EK4dthRID5DaR5lwmkFed+y9Xz6EeVc7E3D0G1t
         ZN3rb9ic30BW1nalk1MAq9iv7Z4vjQYJ2LhkDzRRAjQmIKs/FsblEfi1DPpQX7kuH5r9
         LAfw==
X-Gm-Message-State: APuU4Z/c//abA1xGUy1f4CpW/IHXcrIEiMKQ9FA8yVXEOlrsLMl+/CDI
	WzzO8wuqZnEVl8wgijEWr90C8H5R7a3JtiKlcMN16bAQCyfgNM7s6eMUcaUtV6vmOUWuSOLDX3J
	xLjmo0ooh0AwYAQp7OUzJFEdcVsl5jeV9byGvzFa7fImM0D/NpgV4yRjNnKdkT40vlCrZ
X-Gm-Gg: AYBFou178Hl6R4x01kMe9ObwDKVI6oH5HevW7dxe4tGL0VX5osFPCosgkCgYctmxqgH
	YeOI6hqXLMg8lrNaQaP5EG/sUd9mF0vnT+ImemnGPBUSqE9OuypKUcwudlcB5TKGfqCvcrpk1vB
	8lU8ee+LLfqdPnRZzF8EaZf2lNk0Av8ZTLmu7quDXqPlrUv0ynsNU5A/3aUSbSTddJ5oF/ke9qS
	dEA3Sp1PIqPulINUbSfRuk/0UdL3f4Q2+v8q42RhdEus9EfEpN4FABGMOnIe63JyYT+ZIFi6uiP
	R/1G+PeD/zxJtXw5vN8fZTTHMg++DrNN5tzoQPHmbJvQu2lsfd1v+5qysRlxM2C4ze7e22+o/Ra
	P/dss34JB6MSCVZ1MUkeIkoS8MuOGhd9rjDCB6DHxnzgeQ16J809+XwwtkVLDHJ/GmQ==
X-Received: by 2002:a05:690c:ee:b0:8b0:a957:80d4 with SMTP id 00721157ae682-8b2b66eccf9mr38371497b3.20.1793563358328;
        Sun, 01 Nov 2026 12:02:38 -0800 (PST)
X-Received: by 2002:a05:690c:ee:b0:8b0:a957:80d4 with SMTP id 00721157ae682-8b2b66eccf9mr38371387b3.20.1793563357976;
        Sun, 01 Nov 2026 12:02:37 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7198c65sm41034807b3.36.2026.11.01.12.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:02:37 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 01 Nov 2026 12:02:34 -0800
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: add HP OmniBook Ultra
 14-kg0xxx
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
Message-Id: <20261101-hp-omnibook-v2-v2-1-1b99767deda0@oss.qualcomm.com>
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
In-Reply-To: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: fodQzfxYmXdn5ltvePJiGj8RasyVo5u9
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae79ade cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ryRoqLvdJD4GBdKZh0kA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: fodQzfxYmXdn5ltvePJiGj8RasyVo5u9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfXyOa0aISHstUo
 PaN6CKiv/lpVkOJ6LrVl/5qPrl0HzPhlB7pWLbG1U0pkl1NMyKcrKE6umJ4RfY7kTlFjpXZcyQZ
 Nx0dHBzByzXod5x1tWaNSPoeNvSDcM4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfX+99T3xBhJ+cM
 /j2sfgrvgjL7FVbD9qiXqvqzDaMUbiijzEvHPGCAKHsXf/n8YbiS6HdpmU3vAEjALukWMlVIiBV
 YCsUSdXc4AzAIs+sgwN5YNlEeO06xEIdVcfp8KH9oILnndelRoXXrkRsf1avrEpMhfdxoGhJ3l9
 psD6iBGYjNnw8UhxGGqrITYAlIDvsTYx/IzktzHeCHDLfjfgj0dh8HFvi+JinkWs1HwCBCLq+Jr
 b+vYB2ukkcgWFNoDcFqm34G4dBe1yBbTjNeit8v46z8JqNsS8HAMVZHcZrTm5T+tmIy/fKSYyk+
 7evtFL+a4V4s6etLMtktVj4LNiR085OibCeUKulkU8/BeJJ29iEyIt0qPY44rahaE8Uwo4D1MB6
 xQzKpWsrrPubESgOrpdK/bE8xPbpd7KfiHJdrD35ejpJh+sXm2kMmY4Do8+Qt4kbCSoN/Fd8Jp2
 ojAa0uReJdwGJwzYbvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010079

Document compatible for the HP OmniBook Ultra Laptop 14-kg0xxx, a
Snapdragon X2 Elite (Glymur) laptop.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..ff30fb4a91cb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -89,6 +89,7 @@ properties:
               - asus,zenbook-a14-ux3407na
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q
+              - hp,omnibook-ultra-kg0xxx
               - lenovo,yoga-slim7x-gen11
               - qcom,glymur-crd
               - qcom,glymur-qcb

-- 
2.47.3

