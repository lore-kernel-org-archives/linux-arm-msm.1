Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315481;
	b=ul5D1ypI41IK8iqX2j5uCoUz95d/1aOSVAhjt6zOaQBVg8HtZQW6KO2QLscBy6qseuGB
	 KRU/DB9Cnelhnsim1jIlHTz/WSvmX6/QF5itbouNM3ohpfrKVNfU3AVrm7Ud0VkkfgnJS
	 LXtoexSwOMnrIK6JMSpxbh2KT/0hKHAraj1V8LCviIe0L1zHGFJJcWGfCMd3m5+FLIVx0
	 rZXwSY2a/oEM+EQkdbJfEr6dvyNupJFcV3LYI9fYqGRW++0R5gleBc75r0bRy8n/EkkoI
	 fcvSrkIl/bzv4yawyvtp0xF0T7Re9mir8nCZAjiFy4EjpjLKkESDzQMoEpU9SLSu/MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H+mwwfBgfHGTRg9UaddozXfFfAVGCo+7WdhMoWki75U=;
	b=FlQtLp7Udq2l+B73wm1uOLtQbmTE+DfHD8M+LyMTuJ/obRexavF3k6n4G2l1mm/WXzI0
	 DY9eKGNx1Hinio7v0thCyg2VWmmBlRVOnQJO9sNYtlBDz6MzmZIAs5u8gS2qt4e8Xkqms
	 bxqnktre9weBV8TQsFdycS/4anpmJ7KUbF6Ws1d5Ro9U6f8iNBm8R7LbByQ0A4OZk8IFD
	 mb4ZLUEacqHKlw4DUrixQ3Od0vg7dM303CvHbkBvTBVoIQPNjE0JYir8Vdz9UkHnbnHH3
	 s1eDmcveA/sYEMXCiCDZSDcN3mxksFYvMNvEtrlQz1cQAtLhWchdaTqtH9irecjgdlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lJ3TAB2F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C90BvSwe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16F2606B2DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 12:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D16F2606B2DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lJ3TAB2F;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C90BvSwe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABATsx4187453
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 12:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H+mwwfBgfHGTRg9UaddozX
	fFfAVGCo+7WdhMoWki75U=; b=lJ3TAB2FoTFuUj/1kD/GeyLffEzjID6ZEaHA5B
	gaD9NaS4tbNL7wLxiLV6FqeeggxnTy7Kw5QvsNyKv1lcPFe1XRN4vxxbHripYmL0
	A7bO0h73eE/Sqy3C4GgzM0ruU3+bbLeoN9vZxdagX3BC6IEJu9zKOtQ/98Sxg0Z6
	SaM0SVELxxwTE0pAKPDSSYDCRZUgMPtbWtiUrKNSM/YLJbqOIWOlZ5444oEGV2Gg
	UEipX1nEfdH16mXR9BzyAMXq15punf2QZtEFWAasFSzB6rraF24H1HhsG/lrA38u
	YVwc90aPIiDnVgfPSyB6rIDiP8YhwtN2+ww83bOxlCy3y0kQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwgvfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 12:57:59 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2d60dcf2aso1639886137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794315479; x=1794920279; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H+mwwfBgfHGTRg9UaddozXfFfAVGCo+7WdhMoWki75U=;
        b=C90BvSwe7f5A/NR1qO6eAZxHl0FtnLKpMqWq0dqz1fVTzg7rIPC18rZ8NEt+iMUx2k
         Ujgpfqj+RvkLr1t5wHfOzXrr4nEZ2FqiGmvHtFn+BZcgN25Fr4gcTEehzez1cRqU/A1E
         FUhf/futHYwzkfdYNpI6wv6PbhrxlHLkwZGBadXtomeIwXbOUbmUPg1QqJpBShBL/WLZ
         oAeD2dbprPcyEY88sv2SblY/3LeWgTyjf2H1VD+ICvQ1g35cu4L7TPjqWN/0tZ0xUzG8
         maqRaSw4JTX0riX4sWFMMS2Rhh7t2a6sxeTFyBqiFKWG0FyEDQyf+3mtanlXgeh2RE4D
         KPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315479; x=1794920279;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H+mwwfBgfHGTRg9UaddozXfFfAVGCo+7WdhMoWki75U=;
        b=AtUjISOgLjNr7ykrEuK5+cYXOo7i3c2igYud/ylnxRfOCxHnwJdqMUiuleQ/RdyQPC
         RcyPL8n5pHPLFYH0gWqKrpDa/zu1huFaNTO9uWo1Qoo0VTFyV7ifg1+gflkrlurMKnt0
         97p1PYoT3lwkwnK2+S/ZrIkRiSaVq1Owl2cOPtbdEjtIzqXLwBIzMHXfbKlHNpaJapCL
         6HohbyMolv6q7oZlVP7DEdi2LBvgo0wB1F8u13CiyDf8sv143rPkFhLSUYQLSuSnYO9J
         UXBO+notXGbtSQPe5169V/CleqaqrfgVcW6C4sGp32M1aCB3vo0Nk3KTLgnxZM24NFLy
         8cBQ==
X-Gm-Message-State: APuU4Z8QYKveww9ev3LIYAtzfolGQcIq4aFTBcCZ7c29kipWn8TxFSNj
	J9cHpD23QzzEfrL63jObgmPKWKQiGftqsjGllMmmkheKLdbAIaqONer8qQ6jS0OKiWq3GGryGh7
	yEXF1lfq81Z12koW1a+L/cf7oG+iz2P2EPVlpCetsQmLatZ2wRXcNPXnDmPauncXaWpTt
X-Gm-Gg: AYBFou0gSEqHEmqhovZ9OmnxdzFuQX6CGM5g9rsqvU6By6SO6s45BBQYBz65iqZncGX
	Dht2uYQNe7igHoll4v3rebcE8i+CqcbRxLyQhvwkNRLZTQbm8O6P6i9pQXJRgEG5oxqhPqzJFaM
	M+Utcx9HqKEj/vJRpDFYsJ1k1KMjeI5b9nPujrFp6bElK6zBPnWjpqyMiL26oiAo9i/WHqve1JV
	Tjnnp3Hq+refl8GUEEF5cwnH9/xMxLFuFY06a9Sv+VSRONcKMrJkCP4NYbKbR0ENOdcZWU7nh5i
	EBLJC0E44wNMPWax2welCtUCWvDQYh7bb0BSHiAbThHBw618nDuQ4vP0U8teD/Na0+2ENNqyu7/
	tZP9MbsmhOMtTMB1ZXjFfeFYQuRaTMK0iwW0NA2f17Ob9wn4WX1YXyznfGswDMM+mdbfDIg==
X-Received: by 2002:a05:6102:2c8d:b0:7a8:15b9:dd34 with SMTP id ada2fe7eead31-7d301ad48abmr861889137.2.1794315478891;
        Tue, 10 Nov 2026 04:57:58 -0800 (PST)
X-Received: by 2002:a05:6102:2c8d:b0:7a8:15b9:dd34 with SMTP id ada2fe7eead31-7d301ad48abmr861866137.2.1794315478372;
        Tue, 10 Nov 2026 04:57:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba35csm58422365e9.1.2026.11.10.04.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:57:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] arm: qcom: display/msm: Require DSI graph endpoint
Date: Tue, 10 Nov 2026 13:57:41 +0100
Message-Id: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1g1MxIr0KqWLOEZNqTpMVBTx7
 p3W5Vv8f4BJVDF4ZAdEWdV0GhPoloHveewEtUmG3OUlETls1MKHdxxswKnFLnLokV1FfPclFXU
 BKQ1RWt3+2+frsi31W/z8e8F5fgHK9GyLeAAAAA==
X-Change-ID: 20261110-display-msm-of-graph-a081a5c614b4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2992;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/tEHBo/1L53Cz1wvKQP13TTvfSMPe/VgE4L7czNBqRQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq8xTNYKySglQ0J6E+qNdJThU9Din5uwEj+/k6q
 YSmAOg6wn6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavMUzQAKCRDBN2bmhouD
 16DtEACW7kLeMUKsxhWZScVcuTXcpHcht89n+bbmV6jkN+byb9WiQTXqrUZXRyrbKvUXQeVS21Q
 q/D3M5SPkoGVpO6hFmTPNPCxD/PDAQAVuz1XM+S0dWofbJNUQTAQReOcXrRifj5e+MpJ14MSi1t
 3prdLR4aF5bcvS2bE+M8JQtPT2O0JfO+Hup5OXvropkXYMU3uWqadvvHKPEpCBnt0h2LgyYaV6D
 TQKBhtmjEZn1xc9yoPWEAPvXTOUm1YnXtr2xHhR3GF9tdHUX1juGSCD2LlXSBl3qr4jwlnW8FPp
 C0ORUwPgbmvEAbyV4kYf5MLAGzHA/pMLdPu0aIGuAaNUBtauUFIzeM58bYp8qZLg1wvmEpgRXy7
 1bSkDOAWnS+RfHFO4yOdsWG63Hl/+TER3zaiCMe1s3U54oTM8lGUdFQRZZaD5Dz3jrMw5VBdiPR
 8Or7fD7Ow7MC2ge0fFy1rsbufmQJgByoayi04EP4AYu3mmn96IY6IUIQIzRwcuNaBGPshLvrYA7
 H9cQKQMvdzk/X6j5NvKSaES9TgCdLR62ItvJHmjR0pvXd2axnKJ6DtFDhkKqU4KFMnur8gqyMEv
 Wo1FAHi7CfBEogL163vFaYb1+eG5J2YrXhQVVqeuzliNzN5i5qtxFc2fO+rG5ys2XmOyGg7qeTm
 T7IU0bHdRtlr4lg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 6r4tSRxGZd7ECeY4w2wPbqJwJP7eslQX
X-Proofpoint-ORIG-GUID: 6r4tSRxGZd7ECeY4w2wPbqJwJP7eslQX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX2hCxofC2qJBQ
 olk/mjlNQ+6a2XeteUmnPUaJ7aD3H0Fz8jhm4kdmsmczIdAuRKQwCSnP52xYCbO7pKNq9HeobfM
 8KadtKTcmydfSltcaK3T+v3wxXcUNfE=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af314d8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=569UQr4CCCqzOnBEreAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfXzKuJ8cXJJ2DJ
 +37npaVPSFkis6hqPB7Uqd8v2Aggn0YcYaRykQjey9SJy+aI3K6VF9ioVWjHIt5iz6M+ScQd/nc
 cqztSnWursfCWTLHJmiOWsWvuerLAY1VM/TChNH+63pyLF5T/troQF8tdnau1VTvRdVfENkW4hJ
 b5qEumYcaCet+BSrh0RAMNRqfveTkAITcihskXiEPw3YMebLc/3D2LnG3zs9lPQBTgvcpzjvgGM
 5Qd9XL7hckZOssVOpoNuYNe9awgsYsyV0Pv6x4QrFYpDBfr49sxL1vGqxfCpHCZNzuK8oYDSFdD
 5c+KvwtE4A3GZ6BkfJOlivDlC+vdNjoUenzk92c9OlppHZp6fp73/ZYjjlZvVTZtYsA8WI6SkKK
 d1R31FwXKYue1vPuzRDLmyJAUa6ejmjokJPCH/2QuEKo9ntOG4iH0h0+PBC9f6dtR+V/lPerr85
 8EtdJ5iU++1LJeVbrfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100051

Qualcomm DSI display drivers won't work without proper endpoint, so be
explicit about this in the bindings, so we can validate the DTS
properly.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: msm8916: Disable disconnected DSI
      arm64: dts: qcom: msm8996-oneplus: Disable disconnected DSI
      dt-bindings: display/msm: Require DSI graph endpoint

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts              | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts                | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts                 | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts            | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                             | 4 ++++
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi              | 2 --
 31 files changed, 76 insertions(+), 5 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261110-display-msm-of-graph-a081a5c614b4

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

