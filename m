Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800955;
	b=wCP1xA9Zf65dK7hmTU4BayVL0bXsYygzNlKpRefp7MNXjZYkEJEG0YsYz/HqVdyR79tk
	 WrIbgfKwSJZnNJBmpijqdfdsp1XVF0+NnMQw4gEC9+k/WQeAco3dStvRqPe55qTXKnkVv
	 vuZzTei5R79hFO8LW6394RDg76H5wS62tt4PwCE+cuPgUqR/Fd9pHMdeQ06hJiqQ9HOXk
	 rtsjrPYDBaNCgq8QEY4Y+nbeVQJD4D6vCtLOlNXddSRplvJU3pOC3c8AcJiTz2KyAt4MB
	 s8/w4ieGqlbEtSPxXI2L5eaTL0GbXU1h+iP7kgEgNoRx3jtndYn/1D646+D4ZUmWfFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SA3uMpD+UAvRA0hiOgIQ9xGcmVK/7kFG+LaGoeCIKtA=;
	b=H0YcjojH7a8JIij83gDCP2pECb06UZx+E+/nYtbcYxXGh1wy1Jw+JSa3a4yZU0oD4Ati
	 RZ5iHg/UB+DAZXq6SxOkkhI5zH8JhySTA2Ano9oA8E3pHRc4CoKA0Fnqcy4gvEAKd1gxp
	 6qY4NPeFmb1YB6C7bKqjijXIvohNSjevr+o0mtMbItcLnvBSqS5XdllUITXEWaxfuvbbs
	 9wiePkuxsOH8WruS1L7oydOn8Ybs37+j72H/5Ld3wa6ZIu/NskrvY8eI9dbXTks+JqC74
	 ekaMUziEl7IwueAWEUJ0VLBBFzHXKC5qKtW5RV5jgJw6PN335pfihFYevXaYnf9FYiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LD0zxWQi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="h/3WQkE+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF67606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF67606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LD0zxWQi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h/3WQkE+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L6KX3787469
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SA3uMpD+UAvRA0hiOgIQ9xGcmVK/7kFG+LaGoeCIKtA=; b=LD0zxWQiZDWz+8KV
	3vthWQQtq26MFoUNo5ZHvWFvnbQKXQoZ0KcLIHrxBYq+1xXITnktdPxL2wXhNuy1
	DjcoRdtV9gFBgQ+BHEHjR412dECz5Ot5Uh/vRhxTHPDa7YmR1WiFaEuTmdRslsZT
	cLMD4iLlqlLIFoxlPLSeTnd5YSfkYzwQfDAXBuLWsKpfAeedau6gj7NtTdK94CWd
	K6Sgke3HVCsDY/Y2R4hT4c39YxTTI2yIymNjzDTI7O3pGE4mS1dwdf1utxakUDXP
	IuReBiugvOPIzf24Sw9vmizU/zX7TMGhJ7kC4zOrBkPZH+0wPBk+o4ACbGS6SHx7
	ueqW4w==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwchk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:49:09 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cbf700ddccso1958100b6e.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 19:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794800948; x=1795405748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SA3uMpD+UAvRA0hiOgIQ9xGcmVK/7kFG+LaGoeCIKtA=;
        b=h/3WQkE+oggUIiDTgFhcHOx0VhOegMCKhgwzmuI6QydRRoCxqLzjfRtIpGzGIsVB0R
         E2SVVjS6FU58IDd3NH9O3oSGOmbl2diyO8KFwUflRq4Zd6YmgiuR9S+A1mrxsKhEZm7D
         jL+5yS7bs9Bces54H9cSNpzRDIrLNvSX0oq3W3IkklsT33BUFLxJypkyFjr5xTW65rw2
         qo/3WqPxHQWWI/E0p/xWkuCjpR9aIYsZja4ZrxDnMfg4JKd9Ie7AXCMYLTn2t3GIXKeP
         RSbsFHSjxPp+lTe36QICHgMQRsFcQzT1LQUaa9/NSTMgK/tu1Ke5kcI+sHCFjvXGPPJL
         wj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800948; x=1795405748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SA3uMpD+UAvRA0hiOgIQ9xGcmVK/7kFG+LaGoeCIKtA=;
        b=FHjmMUK51HjzWMaYrKfFpKKEXqXa+jtGudUQrsOeQYrTEuduI8huqTbaP3Pjaet3UJ
         0HyFprCGCwwL26JlVZ7DWael6dD9Qffq2g5evFozT55Tc5baeJho9EJ6nniTjfDEcvil
         DhHcM9Ihl3IrSvVlXAKBlODqDKfADp9hLGxo+zuw3yU0vKwrMOtAR6Kaf+2waVsxbKPg
         rP++GaiScZseT2gZtWmW7Hn6pYjBbfvKcjIHPNt6mIzRSXqvDblov0VDSgDntn2Up8pC
         cmkjYHLqBew9kqcKAnB6H6/TE3UFnoe0XXbrk9bUuBYLg/nTAvy2uVuJ6Qug+71hUMtH
         A+cg==
X-Gm-Message-State: APuU4Z+A0sVmxl2p7N69Np/cp2DRNhHAay2LoSYk3AowcbGEVqmTWKZE
	UxEGzu8v3oVpraA+AS0ww5ZPTOjn7tShe6PJ9Mk0gUJnhduY2bXX15lWP6eagDzzHw7YRJWHjv0
	kgYo/4Mit9W9h15Dg2qqdJvwChIeEycdaVnbdPk0updXJh5PfcbRc45QdFKdvkhrAWure
X-Gm-Gg: AYBFou3+3kU4PrFUJXAjJIZLr35vZqlPBYaxvQi8AXGCiuceRmB2jjtEzal1OEZJvX+
	NN7rMYaDT9olyEqye6cdV5ThpBn3fhcth5xUMVaK5i6XFuq+J2cQOkBc7+bNzkNhzymvJKk165P
	qnr+xp0SfZgXQkH+Qe3VxaicI+2TVUJpWyZ5MlnqHc0tFTG524yBTdjmMlLI9J8vm1otLSqZU3J
	4vsyNzNwt3JWG2p9YbQk8sTJTZ/kNOJvufrQWh93X0KLzXAPP6gf0neuRS1uwo6xNvcUElkAGUN
	vtHlx3J+jGXvwXymySFfzMJEoe1I6w3DkrP7UmkkqlvV7IW6NFdrppTeS3xFLOTAJl3ZnhuMFHj
	aDTvJunu16Tzz6z9E5hTlA3pEzf8EC/uBJpNN91kBINBu/qVadsMZpTgyHe8pk3KdT5E=
X-Received: by 2002:a05:6808:50a5:b0:573:30a5:f24d with SMTP id 5614622812f47-57330a5fa5amr3799661b6e.17.1794800948506;
        Sun, 15 Nov 2026 19:49:08 -0800 (PST)
X-Received: by 2002:a05:6808:50a5:b0:573:30a5:f24d with SMTP id 5614622812f47-57330a5fa5amr3799638b6e.17.1794800948044;
        Sun, 15 Nov 2026 19:49:08 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7024673csm8903234b6e.8.2026.11.15.19.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:49:07 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:48:59 -0600
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add ASUS Ascent QN10
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
Message-Id: <20261115-qn10-v2-1-19b11603e776@oss.qualcomm.com>
References: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
In-Reply-To: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=LUWA1HxXrR4NPKGT5Y/u/ot3irTb5NEAz6BiEJu48H0=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq+n0xY05qmExd8wbQEyvvv4X34w2ppHVBaOW4s
 hROyvKz4reJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavp9MRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWZLA//fO4O2BuVsvU8yTvSij+l70cgBmCck2rJ1YBT0zr
 /ft984VBjLiWUTElvfvnZ72luCHCTd7mTLWWvKgunLQ2jwcy9IC7/fiG8NtCCu0Wa01TvSdPwFm
 yXjz1+IB5vzGjGCOyO//49Jy7gEn/M6unM231jSSTBWfUuejpXe1Byw3FIeVHky7BDa9ue+ubba
 wiS1K8A8LwlWALxqIVfAuZdCHIsgtGfxrP8zvA6W/9lIn1zc0MFlK7h7A7TzFGSZNILgdqEtjXk
 clUHcftyMW0Sd/n88kp7UlFDO2+cmFelgYFspKMMrPrWDw54xK8mqV9L5mu6v6Kw2Y8dL+IlPgi
 /Dgaju4vss5YUf2oqZIII//POrzIUTVA7JAv49erg6DbCUzR9qfMgm0jNraN1Jziitn3uzXx1oL
 JKgxuqCLfdi0bU9pCJGynn5aVYluDQpeb+9uYdKk17FP6DbQtNXbAKi5TVPnrTJ4AL3DAGwelFL
 ol9KdwFDG/G7VwV+SKXo/mjMH+dDPNG0zonqlY8mczxWpJ3ogsxWGAoqtJYlcn+iBLPoYvd+nxy
 dfF0k7hpKbnU3Nyy0ZulqZOyrTt9duzKm8Sdv6qyuh0B9q281fl29XIQgbzOT+trOi+FzLH6PME
 tUVvGD0O1O8sVPdMj5lILZ/uvGE9eroanfOT0xTHW67E=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfXzT9AdVfuPimK
 RArf9slGHiDx6EZ45+7fHEJ0BgjSjFSAktoTHcfm1UQ4VkcbY1BYevdqvIyIscWfXdC65j5R+G5
 wIMj4SNL0QoCWsPTVZC5Gk5j5P8Fo7smEmzuj29th2ZUXw//8X9X0pJVHfJ3oQ9O1xsus0a28sO
 qjUN2xOKTp94vSEiB+/a9FUkfZaicpOPTBKdR+Dojw2X/xO0SeQljE0Wlbf1gzFNWhkht0+fv6+
 Jt+sa931BLfG+nf7OCMdFLRBZCdVGnnlNsmCen3l8xn26bYqWHT6Q0pjJDvFDf09+6f3mKwOQXG
 KRx33yrq2wf3fZODYKVZK8UuCNzDFaQLcGFWdNopf1AZSlxLhEgiqi1eYmL0g64uuhD5mmlGkxG
 0sdZzrL0SehMjcmwmO4y/lhJjULZWDHmy9NuYAVpCcKLBOx2j9WmeHiukV0mMNvXV8IMElsX8ID
 jfu7nMMa/NeN+J9xUKw==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6afa7d35 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VllWacnbf50EjFFOaB8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: 90adsWMYEgjIweD67HUE01oloP3Jp9YE
X-Proofpoint-ORIG-GUID: 90adsWMYEgjIweD67HUE01oloP3Jp9YE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX1AgnDcWSiFeP
 15SaUVDoPfpUf8ouOnmbc7/ZO0C83zWkQD4boQMIV4WryDMHieUlOvnoh74kw610EWCOAqyXHNb
 1IS/TLHjM21PY1LDaxoVR3NTeWVB4KM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160014

The ASUS Ascent QN10 is a compact desktop computer based on the Qualcomm
Snapdragon X2 Elite (Glymur) platform, featuring an 18-core Oryon
CPU, Adreno X2-90 GPU, and Hexagon NPU. The system comes with 16 or 32GB
of LPDDR5x memory, two M.2 NVMe SSDs slots, Wi-Fi 7, Bluetooth 6.0, 2.5Gb
Ethernet, three USB Type-C ports, four USB Type-A port, and HDMI output.

Add a compatible for the device.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..a7157795870c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -96,6 +96,7 @@ properties:
 
       - items:
           - enum:
+              - asus,ascent-qn10
               - asus,zenbook-a14-ux3407na
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q

-- 
2.55.0

