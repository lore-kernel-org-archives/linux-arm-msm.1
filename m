Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293555D873
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994790; cv=none; b=Q5BkXmVWeN4Qj9L5tr99oxNToWSepDUYZn6rtprFR+WT/JODN8fra++KNnET0XXquTIo28tWKClnhyDxx32oqVTa5d5GKkLJkk2fFdozOzNMj9UDwNkBLGKsAPic8klc4WkbmfO5R0/e4672Fh3wMwINoI87sB4iKlXfWZV/VRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994790; c=relaxed/simple;
	bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZ18DT1p3+v6mA3/tJuvYH7CRXALaAZallae611/+LkInPhDScUZiY0S9LLbcBbd2mYUW7BMNKsfgzWQfQOrbQX2+4d8vecyo++kRPP5STum2sS/z+Fg9Nyu4D+P4M7jlsH2OAUPRmJUTpTrkzlpI4eAnpSyC7vH9g4x8asOTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZyOJRqI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grK5mhDs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZyOJRqI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grK5mhDs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbRBp3813086
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=; b=ZZyOJRqIYjFAd7S9
	dr/0WglLBWaRAH8j+8R5jKtyzsdd0bstAetyP4LOuG/xgaQ9mbi1VhfZdf2+tYET
	HUjHSOFOkMD+09dIX2ftCeM3clRebEU5t0FB81gFpOk9XnaFIy7T9tMobUT4aXqO
	1lvHtuix28sn6JEUKinpqGdjr3vjQZxHJsQXG4XrEgv0YvJG9m57BpmpgIDIPn/5
	PW6TtUdR7Jlewbdy21yz7Y7R4jz7n3esc2iLQEJsh5o4maLwrwHrA36GMNVhNzi6
	1jrK1bZOYyk54T05VpIv1C1wxUKOLn8EnmetzChmL6VZX5rRSFyFzhWsHseBFdXy
	UmOnjQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u2g48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:19:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b7e90fef1so61890486d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994785; x=1792599585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=grK5mhDslRh8w+R8Mwp4NvPrcmUdc7BUxJeD1lv4SxhUUmB8V8QLiBvsRbEO+GkoD0
         tGDilTNcuMp7laiN7CsSEu/SwluI3NjjSXq/7qg0Xn6FY1zivMQDyJmnenMUVXspIE1s
         6cS+JwGYHT0GYfRhNNLcz9iCdRcl14DW356X1XGBFFXk+CaeD5aONmIx2ulBOEG+DfxR
         25TeM+WgbsVe+NrVhbluqEZahbyrDs50ciWGZqZiRPBLaPDkPTHandKwOLR+QanqqQda
         HoqRLp2WKUCkE7+t+MMPMxzBrlxhcsKozDrg6qEel7bz83+zFy1EqC7s6mrG0/zRhhLI
         0v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994785; x=1792599585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=ubfOKAp683ymbfi97IQ/zBJshTCOXboTxCR9K86tW9ZLQ5cO++j0HDfyIeTNEwf41n
         o7g0DfeVrf45tzK+sPxHqrzMpQWAPYs3HBtkn17LRAKorCo/vUT5qCgdUlMiGRUwNJpV
         wRWL7ZEg6yw6Ictcuo1bCAzHxxgI3phGvP4+s6RRfVlfZ7hfcftUpCvoVYCQYYUaTvDu
         soE2jSp5oaE/P86qRXkjBoz8dyAMDqYi7f3M9I6rpcOErpuw0GrOoPYmguI0/hRn0k+r
         typSbXtivmkVSkTLx9XIKFhvjm0VtVVoqA2UAdRtkTQJCh7y3fTf3UUFfEjKKigy91lV
         lBvg==
X-Gm-Message-State: AFq9FYKgt0tfcbcZmhty3H03H47nl7DwDTZZ41/Zl0r232fkmqJA5BkT
	pcD0olQMth8wNqY2wN/mN0OD3l+Ho9fBBoSetDZVuc8Rdz//7OQxO70mInabWBR0dmQlgntTXBm
	HsOGMQVQOpaYrjevL+olYyyCsGeKTl3B29f0QBvndDGFf2oJtoIELCb+vebbri7Bir58Y
X-Gm-Gg: AYBFou3BKaHRtPHlLGcFNgUNsnyuxaFs3PccUjGPaIGyqqRoBX5jNsSpMTh4C/tnzqP
	AzF9LYPB+FEix1fK4f8Bkm9s4quvVWdVw9eKyFz7OodHEGqgL5iZdD3rrEBsbNWNovC6OqVUm4q
	Iko4YpPhypRDlwRcTxIQb50xc/0uPdKLepJXWiF3PAemKjFoGb3lJIB5uCFa9Rc9H10lQyV/KYA
	lcxzHHZ/AFiY539esWAAoqUBmKpEQcA4baED+BEluAvq3/5OIdt4309irO8zB1ZzAAX1wVxSWkv
	na+uMckPr+7HB39aT0KXcKhffYMHxlBgIq7V+WkEYhPuDRt4Ph24l1bf64O3hAmU8IFIqlz2gz2
	JkreNTuD9dQspLcfJ4ElVUHziXXQVUrC3rZYaeanZBiy4OrS/jPfhq/1kX/AUJaWCME6tFUtZhb
	NZlLjUyeTpDqhz
X-Received: by 2002:a05:620a:4010:b0:93e:e1f9:4c2e with SMTP id af79cd13be357-93ee1f94f88mr1408418485a.5.1791994784890;
        Wed, 14 Oct 2026 09:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:93e:e1f9:4c2e with SMTP id af79cd13be357-93ee1f94f88mr1408413885a.5.1791994784400;
        Wed, 14 Oct 2026 09:19:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d7d0f6sm740187e87.38.2026.10.14.09.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:19:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 19:19:18 +0300
Subject: [PATCH v2 3/5] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sdm845-hdk-v2-3-6d0b4b42f267@oss.qualcomm.com>
References: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
In-Reply-To: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqz6uHJJ7m6faoZhSn2B4QgkaU3xA4uixppdDOo
 qz9u9klJLOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCas+rhwAKCRCLPIo+Aiko
 1TX4B/9Zj+v7JOjDrwahfYekeT1LMY5X+HCPT314urp97pY7q1yWMbNC8QLpJv5rirx7PMkd0cw
 w5HlO9Ujt4PvUxWm1x1TpEZuRwsz7s/RfKP7/Ckoi6CrfSgMn12t3o5OmPi2XUhRLHlaDM5p+el
 EBClZ0ZMOIGO/N4aXP/hIJEAX2YXX+pkXWGU9gE5lU0H1oV8QgxWKuBwETEUSRJKubpkQbSst8+
 g+mHxx2pnPgRqVvVCMjqXwwsT5HjM6QNQ8hVpHxdWLV7+QEH8QKU6+Lix8zmBEq6MtmKUrX9Vou
 1Sk7e/bhS+l2qvWOZu1nMEmfUMR0GoUPMtTS98n2LHeY/i8O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX3lAltx/KcS3y
 OQHNeBlUdrxr0pYHziQQ5cxIwQcKjujW6S32EcHUV3jj+a0P7Lq8+1lvv1hhBx2m8GenXpAjBSl
 S2GZchNRktLqnfHFIYy1I5tl0Sb5Rbg=
X-Proofpoint-GUID: QXX9BUfnd1IfCB7OPXE2lxrXYwJO1cVz
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acfaba1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=9nMZPvWkDyzw5AdY2PIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX1XOniEBCP+lz
 dYGYmjIqs9IwnuCzv5MeN/HY+bJjbJTBJnz0p46GZZHYOfS+icuQg/Wj0g/YoJJ8dBAso2quo3M
 pqaES1zd6phBlVjY3jWLGlsh/kvEj4LTX1kkfj2IQq+fLX1ia21TvRZMGIJyaaslnz5AOILzUBq
 tceo0Kl88KOQt1wvzN0hEsCita6A7RNsSUtM3gLgMjHEi6wZZlRnnAgmeD3I6VrgP6bJOpAc30O
 XpqLsF2W/GbFn5rh3Q5yjkoWxgw/ocDD4LMV2bbUUcn22akBjGspJvKx/vv4UPV/j4zmDMd/fXm
 madWB+MX7ONnZnw8xXxBbVp/Ikh+mi4mA4H/2feBFk01PwiXzlbBVeHa13AELRFvJ9O7ZDiiFIc
 JJOpDosLponYBwf9AvU/i/2SuQspcgizWpu5jVc2eai994lSSdj/IYu9pVeNmynZ6MpzcNWpwQU
 bu/POxVrXAJwRNZzsKA==
X-Proofpoint-ORIG-GUID: QXX9BUfnd1IfCB7OPXE2lxrXYwJO1cVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140064

Document the mobile HDK for the Qualcomm SDM845 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..dec58f8818df 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1003,6 +1003,7 @@ properties:
               - lg,judyp
               - oneplus,enchilada
               - oneplus,fajita
+              - qcom,sdm845-hdk
               - qcom,sdm845-mtp
               - shift,axolotl
               - samsung,starqltechn

-- 
2.47.3

