Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298855;
	b=tUjJ2asUMxnHW1pxkPzTCOaL3LYUv/CgUkvbQYxVw/DOhyNSeabfCKTfT8Yu8BniqrTS
	 eizZx6w2jM8/90KHqs3mm8AUlAH9Eby1R+FmsigpJvU/rrEJqncmeU/o6LN7/l6+Gos+9
	 JI+bn3D/eY5zKIsd9f5M0WLKvY2PIVm+zHO4ofVZrYgmV1w/s0gGM+JByjEtV0B0yljbk
	 2TkDd5mzhQlmSKb1o+CzMNZbnifv3eRvPaAyPx2Xsu1h9BpNlblQnqsTKZtRdabWWDBKo
	 bWPvMJfUpzCbHWO7jjmP2z+yCCdPt02kIvRoxNV9PN9tvaplkcAMOICNTevxWRw74Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wNFQNiHHy598GSstSddLXyS+E1B69m3x+sFkpb+CF7U=;
	b=lfVnURP4q6uI9/YHoMe+Y3UZxDu5AazDT8CWCBNEdPhRrI0W0RvqxsZasweQcpFDXsCd
	 EXvgNf8h6XpfQI5Rhjr8v09gk1+WQKuiSkYPEn5pj0EgXV+RDNEhPE4gUxuXRfc4PPSnH
	 g7Ry33N+wfGMFn8YtfN5ho1o8ErkfB5HgjUQ0tnRJQOyqXNsaS/e103jra3sld2ctNNme
	 OkoHt69AsQn6/e0LC9kB1JGY7+QoJ30R4oZXN74Yb9DtOzDixqQjcWh8L1DxPLwItjkry
	 9uFoWwMKjxzFbkfAXDJGc512JUJwUVnoBjHqre7y8Ow0iUqM22W1P0Tc1VwUncZaTog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHwkIn4B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgnQg1xT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B70606A322
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B70606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHwkIn4B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgnQg1xT
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDXDr3234241
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNFQNiHHy598GSstSddLXyS+E1B69m3x+sFkpb+CF7U=; b=aHwkIn4BUiWww/ES
	rRb0w8vGah3Kr3xjIPpp9gCYDMJ4JXolfA1BemYnClwWwglgqTVIDiUNXyUOIWyE
	d7/S/Sfu54v3SQzH4sXDg2/8A061xIe1oA8+sJB+/dzjHDLvzf0x3OfeG8Ykpzz7
	LAOuqOgx6JkqV8yaYagY/W4GO7QwwI/9aNSJ9l9KW9+28ZQqfLV/YTSxM1Q1PoOB
	g+DlzNnEyoqiIDuLfrQljMygFnMnAJZDsRKZScLNqeoy/UkUIebf9YXTAnfLVuaV
	SyI2b1vrzLjMV7It+AewtuQ1qJ3ROAoYKkVZae0OTZqNk/PR+ET/MratsfUhYRef
	P9TwDw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b2hkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so3441247eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 11:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298853; x=1793903653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNFQNiHHy598GSstSddLXyS+E1B69m3x+sFkpb+CF7U=;
        b=ZgnQg1xT3p3rrqn7JgctH3yaPvLiPEzEnlOf33Yq5CqDLvfltSghAUlJf4X6X0aFJp
         qAp74icA98aHeWeGNzdJRIkrFVAYhmYerNySSzenuHzXE5iTkpfOKycnS5opWsIrN+rg
         b3LXmypuLlw60IZReS0g1oB6zw3pSbPMB2gSujYjFJIMNiUJLNYpajymCJpPWUiQ3qpN
         2sKyLjmlVXIG4QkQLKjtg95T/7ldaWPN/XiG6xUg8EiNGoCm44AyHSRi0Jggk0dIvIQk
         qRHRoe9KSnARAubxLXAXhjxqnARxzWMxpQ/1IzaTqe8dUX69dIektRJzXuVQTUkCraiF
         31DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298853; x=1793903653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNFQNiHHy598GSstSddLXyS+E1B69m3x+sFkpb+CF7U=;
        b=zPEU/7L3OckIyJSR/kgBGJugBsVAeEtc8/x+WANlnjudIs0kdKtk3+7EfKF/nzHUG9
         27ZoBG0DSKq47utmq56gbOsQYy0me5mE2GfdRCaD1ffI8KXrFLI3y1az1wPGMj0tpkM2
         ORYkXoXLxVwbTM/sBjnRiiZ8ikM312tK1KDPHbQi8NZLgz2wPHjT8D145lzcLFQbN+2Y
         lrwu2dYPTVzh2qJdnmL28yrLCOlVaKpx2B1bBc6P051jMTsKmij3JvcnKJuxaIOneKRc
         A+QDwLqa9a0cruBhMgqcu8W5YTFfr4nBZ+wicjkcc7NjVACZORqRnK17+pViKTc9/f3D
         pX6A==
X-Gm-Message-State: AFq9FYI8yDG2IKABu7A+VTfBq1Q02J9HosnsYa3fRq+2rLO+95MNrFLP
	u2wnvN8muAQ4W83V+YHXKCHhP0EldHdH/2cLd8lILdJxMpU6UmHl33CkqoovACeLvw0hvhOHfqs
	92IYIubiyi24ZPV+c2SXgF6jPVkwFMvgVdu4xHXdbP9ntN0I1hyfaTPzJaI1OdURzHF78
X-Gm-Gg: AYBFou3xM7r3XH/U7hs8gK+h0IZfxRyMVTWlDN8cFy6X8iwrXCcle6ugP98ePKJeI4L
	T2wjO4hUWGfkaHkkEQolydAH6Oy1Iy01z2BPAa4ZKlHvpndwLKrYNflMSTGa9zvNvsEcgCQ4uL+
	os73clb0wsSPLsDH5lRjFWQip0e3zDNZG4StoeW1FhhrK1bA/6jhPIgZSzqtueobTtlDBsn1TkV
	CoxSLbK5cTt9tBwpMCN/nXZBybtn5ySvyZCSlR1rzjhFyHnoT9iTuetNzqf9W+Mr7pwumaWKAsr
	ScQ4pvxPR/clFy0B++wHrVpbi1kVKZp+e24jaL+emLuf0aaZZWR18CBG2oRsdTtWfxDNLhWv6FL
	QeuAzH66SyHR9/Q2FshIjZEjtUsYuVPx5Bupa222AYE5QVBMLjB8CgRhYkMchcD3Xi7HxmaEKQd
	aq59fGJW9DBOca9Dl1OWfHZ9iVPm9aSZIKOgweAfsQXQ==
X-Received: by 2002:a05:7300:22dd:b0:36a:1c46:275f with SMTP id 5a478bee46e88-36a4244c248mr298734eec.21.1793298853421;
        Thu, 29 Oct 2026 11:34:13 -0700 (PDT)
X-Received: by 2002:a05:7300:22dd:b0:36a:1c46:275f with SMTP id 5a478bee46e88-36a4244c248mr298682eec.21.1793298852836;
        Thu, 29 Oct 2026 11:34:12 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:12 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:42 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: kodiak: Mark USB controllers as DMA
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
Message-Id: <20261030-usb-dma-coherent-v1-5-3147b8f7aa64@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=882;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=LDViqDps+gY5QGZh6wRwg12ChAW39TTNsdfn/yvqIEo=;
 b=bdO16iJMaKFPsmggJlsJXyAJfM+tP/adZF4InmvAazAB0QpJWs1nsfuIq8QOhXQNC25J9Ez/O
 t/4uG3/qLZsDtR8DUByyRTO53O2K2UOYjEpjmWYXse2XjTE9uSjp3m1
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX6Kcn1Bo/vynH
 71SVh2nacXUsp1dty73PQb+BA9M2SiPLCrYJVZt+eAy//7BYyczI8V+XiwzvPcquSdlMvc0/Juf
 l1IA8yT+mpGRL/5tu8wRmSfLd5Mn9SU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX6R03O/FgaqOm
 FLWX6uQ88Omc7peEAQhx+8dhUeb40BeLffMxDCRSn8T8w0GFiEQFqAWIPPD+XBQzr8DF2lKIDgy
 Tny4zdWh7sU3cEAdlUaEQHvnd4jicSdEvwVCRJEFLU8q9E5dvGO3jnpVxMUXkPSxdldRcJIGSIH
 XSXydwukB/hzmS0pniGBbQzAhxWd1F/FfjhlmS65WDkS6o92UxFaj8jBn9/SrNjYUBxgD9Llddv
 nP50yeQ+p66ZseHxBPS8RfhwHEMxFFjYEbR3wd93hIm7vYkR9cyLDzZecb1jVJ6FrM3f4cdVVsR
 ZTMGn/U61T2nW0F/b6S9qFIbtCoOmAPhTbd20qUTr9ckruQ84GaYPgJw/fYJ1z1AAZow1TlltrA
 UMHBQNpEn4IEdiBnjwwn0bPWPbepg0nseioyMMToj3BuBH7pXeLWdUK6AJ0jXCH7GqcCf6fEzpD
 z9/qqyKYc570OfSvgRA==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae391a6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_R9ktDxRehPmGBbURfwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 6StM6THWyJTD906HztGcLmp3qqqxG878
X-Proofpoint-ORIG-GUID: 6StM6THWyJTD906HztGcLmp3qqqxG878
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

Both USB controllers on Kodiak are DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..f8008ae3680f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4434,6 +4434,7 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
+			dma-coherent;
 
 			port {
 				usb2_role_switch: endpoint {
@@ -4993,6 +4994,7 @@ usb_1: usb@a600000 {
 			phy-names = "usb2-phy", "usb3-phy";
 			maximum-speed = "super-speed";
 			usb-role-switch;
+			dma-coherent;
 
 			ports {
 				#address-cells = <1>;

-- 
2.34.1

