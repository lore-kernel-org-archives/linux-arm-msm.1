Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298839;
	b=Bog7fYoaGsWTjadogBHHdoKYSEkokcLJd0iThQ/hMuy7kd/0Dyd4JActidG+YNWFa/9g
	 NWUtX9qgmnlIn66V9iLo9idM8dlr0nLH6DuzfwGmrwUA+62wVGMazYyzt333hGjshnKRC
	 8z9kKYSNG8tQBa6AqB9IXp1+/e3M/G8h/My+h3UYkhy6S+UMe6Se4wV+yPs4CV97zhZhY
	 DXMld2iCYyd69yVrAp9LMr23BX8N1tVo2bdyALQayzBgsTBl9gMOwNtNLsIOOhoaBWCwT
	 jJqp29Zn8530JsSWP1P4SMr7li0aknbvzcK0G3EeiLo6Lccho3ynbePGZfJ3VueehVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2CAJyPhpa6QznNIgLhqAIlirscwOU7OV9QJtd2vOwM0=;
	b=VqQ4ZFdqxhJMKL8uJaJZqKzRXLJzC8/J39Em9JL/Cb+I0S40gOU+XhR33KIIjv9eCHLf
	 DmV8lMRFMkGQxERKjrEggVsS4g/W7VfmZolC8lUZiruWeVilm8iQoJ3WNDgj4kbGCnci7
	 5mBitkpaYhwC75EEkvwpPkj9ei5+tVxSI9uH3a054AJ/QvgYMm0lqqUNdvll99mO12Nn1
	 1QKGzKdMJgvsP4PKIjA0fhy7zYJ7lT8hNcoJB5rod/C8+qKllXrcZCzl/Fa+FN5O8nkLG
	 whSEW4r4DIuZJkaKkrG0ai8QfV5/Nus8M+QkD0mSRDPPh2kpK9seuVyA+yfS59LyRfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TVhUESn8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DfiT581k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895B9606A325
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 895B9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TVhUESn8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DfiT581k
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69THDgkr182072
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2CAJyPhpa6QznNIgLhqAIlirscwOU7OV9QJtd2vOwM0=; b=TVhUESn8L5Jztaxo
	vwV0LtXBD+zuV2n1orKBY+J19QD5tCa0jLw9doM4m+nRa/ibYcegEFjunDOXqNw9
	oGz7vkzWS27DmRwzjbNDufVrmCQosUkddjY0khxvCBgyzbDSPPc9bVlK8LXWd1mg
	eTfFUKW4Oxk6huZQbG0p3zTnY0aYfHKOvERqqvmEJUZmE0s/XzfQKqXuLy5d2Dfg
	ZwmXLm3xTV77RXGYu0Qicyx/wYtlaG4ZrvLxGepHnX57e33r5sA8lDbKnQw88wPj
	ny4yB32Pm6LN+HBscvI4CtKuLMGQa/otAlN2kxqQcIqq8QFcWC7Rh6ipskD2G4us
	WCdZQw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmac0rf3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:33:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so3138503eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298837; x=1793903637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CAJyPhpa6QznNIgLhqAIlirscwOU7OV9QJtd2vOwM0=;
        b=DfiT581k8Q36ciNqEU6BCRdU8je3jm74FGalztV3Wx6d/AzzkOFWyCvRRYtQJXYd3N
         NMvLZn21k9py1DE0WAvWuBVA5v/8Fp8q71L5bCUrMzDRan/7KLCLaIUMKqrhsFxGYUum
         J6Jmye2dplBBD0gZB3Fqy6h4FRaat+wNOwbvBPlSJ3zOLPON8BvlLo21RwF2+Br9txNI
         YTbcpEHVEN80eA0+qZr5R0HkTHdMeJtSW7mqramwzCvjc0UGplXaz9ruXDMsMSLZp+Vk
         vene53ao5mqu5UtifSwhcYpOf8t34P3MAK9zYo+Jo6I/vDaeHUoIyw4EKrIq0sIXMMZg
         3njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298837; x=1793903637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CAJyPhpa6QznNIgLhqAIlirscwOU7OV9QJtd2vOwM0=;
        b=nZbBERsQSUe4u+aztEHVVrOHHVU7EL97asetk52jZGd9sNkafLwMuPWAkSzIGYQuGO
         2TU31v1Zov7OeVoBhPsECzYbUrwlg5c+xy1//UD0wNAOnwLpB5nV+dWI2mzYvnF9SfGE
         B7nxIHMS0YPg8kVL7Aeuyaqi6aEwUWzhxB3chaSirpWA/P1V+ssJX1KDzjLNFJuJ0C3x
         OV4YuEdr8eFi9cH1BVjRGem6Mu9/ByIJ6fga9Ngt4+kizbNfrCX7wTWS0bfC/ZmL8cFE
         1PMPpWnXTRBHs4mOVSyHgonWjMCl1fLS8BlBr3JWqjuADEn0v5H2OTL5iO7b/PItG7Xn
         Kw3w==
X-Gm-Message-State: AFq9FYKdctXGb7GAYJsCFenKNMNACnW9CyAkOfc4CLgJkbkFdRozHDcu
	+rXaUcwMpbroFrkXDfhyxF0J+mRq2ft/1WMT4XZUA3W6Z7qMt7MKZoIbr1/3/Uu3/5DCVo/DWCj
	gynLNZNGDSw6VtuZ6ttOIGpVmdAD3FVLLwXwF3HHxWPdwr7epZorZgbSZpTHec/QE7WQr
X-Gm-Gg: AYBFou3uv68bdLm8c2EmULWa82K+iIGJPCSkWwfhRwO8aOiSqHDf2YJqYkIRnt8Vs9K
	ZhJ8SrQWXXYduh1VxoaTyDclW2E9NbBHl6RuYG5/lIL5AZuTKu8dTLKVSUfu9EVLPo5nk5Tw5v2
	C2sT/NpNOOe56PDJxGxJpwF7fFzl+gQFjYUNfJ/xUrZHTnRN0HzdIHlBVOW81j7TPO4Q8dExyWw
	qOcg7N8ZTnzz42aubJb6V01zCc2ayRgAX1Un95vGOaPzwBD9jLnWOANZkRZL2X7cHgTbGQYyZoG
	Oy/go4XT6v+DgDG+c1gXQmhj8ytHODstfueU6C2LgSXe8Lj//weJevXxYL8UvbfYH8uP6XDRhI+
	BgufUx3k/muwrGO718ByW21VHmfQSFzW9EpbEpgdO9SQBkuqr+zkgexN+EXO29LSIV28qmjifvp
	EqGWi6VXOs94+zxe0vm/zQn5tPwffGsnCe6wwzckl8vg==
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr306334eec.18.1793298837232;
        Thu, 29 Oct 2026 11:33:57 -0700 (PDT)
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr306294eec.18.1793298836638;
        Thu, 29 Oct 2026 11:33:56 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:33:56 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:38 +0530
Subject: [PATCH 1/6] arm64: dts: qcom: sdx75: Mark USB controller as DMA
 coherent
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
Message-Id: <20261030-usb-dma-coherent-v1-1-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=631;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=+OqbijMYtB+KJcNcCbpkz9lazAOGznYVUp++9xMNG2c=;
 b=9s0X3JikLumPl54K9hWE1koPi6+pdA8ibImxbvvhC53MzYP/a4TgARzycgn5PFqWVEndKy4ov
 RTIJYtgoBLoDCIQmONddfH35efLW1NjjvgGG993SPVYluLj30jSNKOD
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: Eg6Lq7M_se-KO5NXh9yfCB6Xh-3WTTwC
X-Proofpoint-GUID: Eg6Lq7M_se-KO5NXh9yfCB6Xh-3WTTwC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX0UzC4qnX2FGT
 6O/XwiJs9CD1ulFCEesyi3NGanFotZ4FT523kh+kH2R3IhBMD0SxWM9voKcRsekd8agnSrMWJPK
 croX8tYSj05TT/a7RBnDjJ3o6TqJiak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX8UzE/kqjrhCz
 tRjwuIzwhUSGD/JzxMgplNYjsdsZ/QX0qOJI7b+MX5K86mytPG92DAMHyglNaRuC1KsTT6AC3R+
 vflUTlKV+KOJZ8pB3XO2/+OR3lSN1HGIsHCbv6TH+KiHUhIM2V20jgKgPN2PG6L5M4dT3fDQYa1
 e06DLdggWmxjPSySCLav+MZMJVo1oOGvdp1qH8kinLUkCeHywJYJ+ZeyGBs/vLkQvmRNrsLN5sW
 Nmm5mp75eEVins53kqpwSo0Jzxjhs43CwLC44MRNm0Rf9miaSCUoKyjVGyhlacZ4iaGDhREbdnl
 zQxRMTfnBiTN3+1dx1smk4VBWYsq5p15hyW9yN2UkJGd3ObUMwW2ccqKtaTUPVcFwfUCOt8/sMC
 DJygBjeu/5RIxTvd6x25EAZ3GbBlnX7Zc8POiimvhJlKL3pZLrj9crpc9vlo+4RSz87wxdPtQW2
 F/eU/ascbFP89yTfKAw==
X-Authority-Analysis: v=2.4 cv=I6/w19gg c=1 sm=1 tr=0 ts=6ae39196 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XGKAOdI6-ny3jh5XtK8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

The USB controller on SDX75 is DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index c66f7bd9bf9a..0ba8d45a3930 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1075,6 +1075,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					     "apps-usb";
 
 			usb-role-switch;
+			dma-coherent;
 
 			status = "disabled";
 

-- 
2.34.1

