Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542558;
	b=XoUQkgWuaaBX3u9B2OD7CLZztK2W7lniwQb9Zed6glLzYnb8tmtGTRO0JHC/MGGRsdcS
	 rI2a61NOefB/MKNRn1yMjryyT1++NSrEVEE3QUJXAed/1BpkPmcwytDvxDzXjDqKjabTn
	 BvUH4XYnqGXzo6LiXRg3nJLIDQfqwEpLaw1WcjFSzAryLbAgAsJn1NiZTqNxoe85jJuiD
	 uxKQNAN9CxQHFUaXiio+tKOGtLCklQA5emGc9fX9Z3TjVVE3yyMPaNVKZXLzqO4so4nIK
	 mhhEMy+ZHtDYeuLV8b9EjoDHa+qza6JMTSfbW7HVAjzUnk0mWaC4QjdOThslgXNgaUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vvhyqEHOHCh5YYp+Y8pXJC/Wkab73TO4a8NMGWq8jzs=;
	b=ApbRLbf+6Py46lAaWu/ZaK/0BD1TTvTJwWAWnx55KKTrMHvdfvGJIBcPZ/+xKmKqKLqp
	 3W6rsi3GKsidVIQBVNp8eVOC0ujf21nb0cRZseKQcv3GLZpCcVmNGXeX21W2+yPorGLJz
	 EQHolxQch39YNrFO3heV095ezY52UbACamBMBadEStKZQkyryXBwtCO8GDB9iHirmFzso
	 AGnaHVNt8N2fDqU2WaOCrT9R8iItI04gfVXh0RgDtQyWsts7jZuryUCDias9C98u9F+6u
	 ccvd2WhkZ1nAhUUJIG8nq8TGLtsOPVwEIQWPGE0wxu05oTI71nc8q7ubtOahGI3I5Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I23tXzeX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gHg9r2uY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE048606A69A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE048606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I23tXzeX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gHg9r2uY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOHPEDU980298
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvhyqEHOHCh5YYp+Y8pXJC/Wkab73TO4a8NMGWq8jzs=; b=I23tXzeXPGo4gL1G
	ONfNNJDfXDfarmV2KsFXi1eSzNzuYr9LU0Zf1k4t0Nyxvy/XipkybtUyHmTPhGjK
	BKkqUVvyiiZR0vIf+KhtZiXXWioep9WpfvzmPprMz8+IHwrRYPHmeLk/je/9gZQV
	h8FKmlc2qG96PUuUJ715F53LZneSGxcnQMWG5uAKUisRWOvdBMyAam59T7qS4d30
	mK4FI52vUse4qDKGfSU1rCi/o4m9U/vhBzllTrGp3Q7cdWxrokiNLEQc8tKjgNIU
	bbGL1IyW3tek7jROTOiqs8XOS7n4k2Ln6RuPET+F/WtgFhygyTkgocb7BffQ1Blb
	1Bgz2w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyd83pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:49:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92106c98714so100096296d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542556; x=1796147356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvhyqEHOHCh5YYp+Y8pXJC/Wkab73TO4a8NMGWq8jzs=;
        b=gHg9r2uYIBk8O4s7T8KNDqEt6u7ZTzrpGZOQuxztD5qvbERcgEYKxo1gK+RiOZsY05
         GyNftDOwwaJ3u2zqC3KUl+XDJI+7X16wvrRTkOW0XyBDEqT0yAEqgGlOG/pQbUA8pA/s
         os8Mfg/gbfc0FqCyD0QIxMzPRIffEYSilRjlI2bB2Q9CcVCRX0GxcljYtjmJ/B29tCB4
         rsBmLaKX5ZBHmWBnpSOIOoIvPsWJWlCXLbSiWsv0TnTshlOJlgH7JMbHXBCH7i2PLqq3
         uZynm9bYdU1xZhcYGjmVU1GJ2LQq8hXwlMn1xpOr9/PefeGDkfZB21X2JsJXaBRaI7rX
         Bw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542556; x=1796147356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvhyqEHOHCh5YYp+Y8pXJC/Wkab73TO4a8NMGWq8jzs=;
        b=vNQ+FloncSEXeEeTqzkmqYzYl9/4DW26uNvY95bHXeYYHL9cgFuZhxhNjWtsgrYgkR
         IEj2M3o6u+cP/DpufmA+1lUQaRt4MBJFb1dbOPlS0f/bx93VHbUJVjPMwSv/wo/dWP96
         QWCrqnJ4BVIzgNRcb2/OSoG8zL2Q8M296876ZqoTxPlFPrYphFc6W4+JQ9eTm3l8wQVL
         gKC+dt8nQ0NV2yqH4YoaKdauG6WJWb48xW+O+Oo1PBlmof8YC9x1adZ7ZI0Ty+opUQ+o
         dBUp+ncbiZHOFjN0kUiwaqURbGa6eivLcxFvltNaTp1BY2DdSdsgmv55NH1QoUsAR1Eh
         9lHg==
X-Gm-Message-State: APuU4Z8JJKB0vcphflXKefNKRvQj92bqw1mXCV7HVP5K1eUGUQNlBgET
	7DcrUygm2iPGZqrqs/wjZP0PogBuzgnEl1NiYdzCBpM4lym9/g3B5o0tRxr5Ub3b4lY++dd5ols
	YvCrbxufy3E0XIV57V2yTVms42uA7XMyk+1Vy8y5k2Bhl70SscXpmUxYJuCYYbL6BrlzC
X-Gm-Gg: AZFdTZfTGoWNYnxrVqchPPEGUIXr4Ct+hKnio1E1tNkOdQ+NrHVgFDUNwooCFKCjWeK
	pHZL3e55YpO6hNlulenm1x8Zmgw1RJgNmdtaN8Dcy3XQEyMhuNO8547gS4SFodVd8xGsruWd3Do
	UA7flfe79K+sfubROGEUDuDalSr90mL8tWZlHN1yY+Kre/0a92mtu/qiDn1L+Un8BttiAZQrZLA
	BP7aEm/dh49QkgQ2bhfGH6iKyIdFKoUOh/PLiJea2CX01JnKPK5BRTL3RTcXS9aoF14w71xWTo7
	uEBnZWovyEjsWFNqRzH6U0jM9SjUHggGIFxOgpJVHwZehRWTyuZl+9prVsou1HxZInN6kmhab8+
	QhI1jGlHPazWI9SgBqM092Idwdsj/FUlk1DyipAPbDUKAb26+tlxCY+fWaBLIArEMrw6yjvCELr
	YytFlep7eDJoNt
X-Received: by 2002:a05:620a:6c15:b0:946:c54c:f8be with SMTP id af79cd13be357-949ba823485mr2275871385a.8.1795542556121;
        Tue, 24 Nov 2026 09:49:16 -0800 (PST)
X-Received: by 2002:a05:620a:6c15:b0:946:c54c:f8be with SMTP id af79cd13be357-949ba823485mr2275866685a.8.1795542555570;
        Tue, 24 Nov 2026 09:49:15 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm6899678a12.14.2026.11.24.09.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:49:14 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:48:53 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: qrb2210-arduino-imola: enable the
 EUD
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
Message-Id: <20261124-qcm2290-eud-dts-v3-3-b3e5af3701e7@oss.qualcomm.com>
References: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX6pVMsTt8nlwt
 1EhvzB7lW/pGkcw+xftukrFpoXvgsqPrqp885Jbm4f/r3x/R4JM87QPAZrn6vvhMMqyPlET9GvZ
 ZpzeL19kT867qvEhWeQz00J/VjXcOJ8=
X-Proofpoint-ORIG-GUID: M-nWix3h-_5aqM96UecPDCs5n187ye_m
X-Proofpoint-GUID: M-nWix3h-_5aqM96UecPDCs5n187ye_m
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b05ce1d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pvBjvzZ7d9aESBAnF-kA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX9zLL4QVdKwXY
 4aAjv6th1/nW/OmypdQO9H24m/hkglhSrS2OlJFBUETUvdIT8k1FHjg4J36lER/d62kNGiWkjbm
 yruYCFG8iE9UfTNjHFeJJKVibdXW1oE0XLgzetmzPzWV4gswgzMsWG73lUHjm+9lp49Rcrxf8RO
 toZiYaD3jOEelVKN6fHaN7mvHK1xL+qRdyp7a/kQEtLbZMEL7W/AV+a3MYtMqdxuQOmGlsQiEqN
 L/rQ74ThjwDqeGD7dEj+e7OuqY0s2xxuJrqIkEwvn7nncDs4EjsEVtNb9GuNvSGoI5sIv3ZKYFj
 HZRkgvaLXZ7YEyLqug6b9COKW6O9GoKDMTSNCW4hWrlYaO77gF9AxHImyiVRYWl1VKHEzkrGKOi
 eb9tU4RLQkUHdW/9c0rkalVYD+X8Tk0mOOvyPKBO050Cra1ULm5yiex557wHpkShflB3wEyRHM5
 7Qdxbg5+jL6lBZZF8Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240069

The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
adapter uses to debug the SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..a1af2caa5bfc 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -226,6 +226,10 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.53.0

