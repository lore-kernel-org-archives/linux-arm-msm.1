Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513844;
	b=U8SXThSVpDXlXoM5FaYmOVAMndMXm+6VgDWMNDN8eIbf+TvloxW9ul0ILCgam6kwe8yI
	 aWTdhoVV76H+dTnjNyEdQiLPyN3R99gzb0GyMZosXvt8vF95Cafj8AgKYCfq6SgP+dax6
	 KAVXZAOG3Rx3waKCFA7BVs9DIBviPLfNpVQggYSlxi36WUlRJ77qxadEIxMOQx+O2KcUv
	 XOE40VwIQHYp3RT/el6qR+EqQRDi/JexF1tjPkWT45SJNeyvAbDBm7JMAZ19bVPkaFZHg
	 mbAjEDGhuNi7F3dfATzIcHCBgTyRYOW/+dqaMuQzLMNsY/0CVXVvnVPU6BL8RUBz7cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rxi6W16GNCxJzqxa7kxMIrrE0rT56lRgfjmgtAS+D90=;
	b=q3IIkUSBa9+kDVX6OlKLhznXqJoa66UxDqlt2RjQD3AFwGillziSY5ikiRxtrSaiMpUz
	 rfL7BBGGQ2QRNYp67c/u5ak2AfRO+WBUS3KyvwCVFw5ZelqdVSYBMk9mkgWgQx/7w2UIK
	 B2WmZ3e8xe7XhlEiw9wBcRqrtyLMNxhBigBkR0a19HhmjzEL2yYPmr0AH3Hms/HS+6LYz
	 DPzxLf9BlBCi2p7iu5B3S9ceAR958ggQ3AAhtIs1MwiIDK6LhK0kuQMjdekDwBJqNv7R6
	 YNpn+heOpSOTV1pkeg2MHf7F+ZuKrB3cErG9fRk9amJpcFtZISNNnAu2799v3wsOojw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIJ7ZpY9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Al/GRjyF";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1CA606A33C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C1CA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIJ7ZpY9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Al/GRjyF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAO9P2214815
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rxi6W16GNCxJzqxa7kxMIrrE0rT56lRgfjmgtAS+D90=; b=KIJ7ZpY9/GZYO5vh
	nbAHnEvozVZCM5/Alvz+UuzmFGMK14rsM4mu+w1I4OgRI6pWBpMlzHwKItFk9bpY
	j/KjQ+dI40CebGkkpfwechxRV3v99ASaBhBRRn2GyaEZnUbRrEwNjtSLVOf+EY2f
	IQAob8W+zRlbgHzKKHCaGTzpJPzbw2gqbc4xeEAV8eCb01ow2WkGQNlPLRM332qf
	YpMvprbEBsKxdEIBwa0d8QNkJlUvnaAU2f6LdvyUzYYZz/Nywny8EHoVwxtnH5mU
	/Mp0i5nDMx74wpgYg/9fWCMblhinCh1uRZdmqye4u2txA5LtQYM74hXN+OdGM1dH
	h8TcXQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nub3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:30:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so8377299eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792513841; x=1793118641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rxi6W16GNCxJzqxa7kxMIrrE0rT56lRgfjmgtAS+D90=;
        b=Al/GRjyFnL8rNEsnbrnS0C9+lH7BFKX4rqwtVDc16SAEoYSubeXcqz4tgUDoFotgQ/
         OxSzEkNycUTf+wuZAt3RUKRCmH6k4spN99RfetZQl4BK5GFNasPFsDQe8G07PYR+9pJm
         N9EMtF8JM/s71rP+kC4dosEDlbQUISy/Z3nuJ95RHxtCIX4HVjTRNG+J6HiJTdeWpfcF
         OHkuVubizb9ShErADL5260f7gLUuVo8W+CODnXqww19Tp9EcO+QOAoQ2nJIGOtADR3T3
         VoSGxWmmGAJ9QnvzzRzj0Bv+CahxwVVIbSLyDjfaU7PjsbGBIMZNAOLV8Tt8PCVziLOR
         8dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513841; x=1793118641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rxi6W16GNCxJzqxa7kxMIrrE0rT56lRgfjmgtAS+D90=;
        b=WDqgswgx3tWcsUVhpVs2uPN9lhQ0OoPQ6MXS2QhL9jhormg53iUj5q8Brwb7gmQ+zN
         5hZCFkb6CBvqzoJpO1FJxkOeyajoX46IKVbWXQ3N0x/30H9++aIpYyrvunZJ8qtCDY+c
         +pV26cY3Dp3nxusUTIa4pLvZe9Ep3XvZaBqqj2PA73l+3fQr6sIUroW/ScofUcjXAaNJ
         6TPSSjy2O4ClrKUA9rpY6pcEenGHF1HOOJ8BLZfBnD6XdlD77VJ+3Ut5/4vMhxLopBHw
         MYJ4lD6SxWkBcbj6zoPICSb2T0577OlwyT/3bDU6RmPcNHi88Ea08PmHaUbMV3CIjJ6r
         aphg==
X-Gm-Message-State: AFq9FYLcxdKsTJ81PXQthzkJEdVd0srZZGcjv8W2hpwh+idV7nr6jX4n
	8DtJ67B1D7Aibv2K+WxLhpXklr8ONpWgqqJh9dR6qlR/yWIrl1LPBBjd+a++VDwIpNcJOYK29W/
	9qEgQvaOSzM6e5V3V+AkArQw9utp/mksOdFcInBf+3sjvsWlUHLA50da01uHITzD1mYzX
X-Gm-Gg: AYBFou2v8TKAa9etxykDFu9fJ5LK5ywTOyrl4q9Kk5yA1EEV+7dzhCwH2DExYsHY7GI
	mJyqFOgotFkt5+/zjwSmQCOhXV4yJSQZxfW4CG2n7PJcd78HNLf0YZamX/2jSRL6l2YM8jMEGlv
	nK7qCRhEUm/xQ3xL6y3sWAkC5tBkfoviVzR3HwaeF17DdzfJswsL6ivVj7dBH57HMdpOWnkZPuB
	pfPJLBbeGkNgxvVEbR8LuSAAT6m+IW4jBQeZo37MdpsnI3Y6bdhkSq/iefzPkYg+Syl3IumNoPy
	8KNvz0icffx0noCDxZo4Ju7AJE9YyITrWjQE80e/j5XnjI1QRPcav417b0sf1Syy55/aOvvl64Q
	SmKeDCpOHAK3oLFxb//mv0N0OfH4m34KqxiYbCNfrWECDMyoSEVTnSXOBuzEaJebO0mikuTMQED
	eyUMndXA6EIF9syj74STLOclQL8UfuHLXPEoc=
X-Received: by 2002:a05:7022:1706:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-18514729a89mr14433995c88.42.1792513841073;
        Tue, 20 Oct 2026 09:30:41 -0700 (PDT)
X-Received: by 2002:a05:7022:1706:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-18514729a89mr14433959c88.42.1792513840461;
        Tue, 20 Oct 2026 09:30:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm33473794c88.14.2026.10.20.09.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:30:39 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 22:00:26 +0530
Subject: [PATCH v2 1/2] dt-bindings: cache: qcom,llcc: Add IPQ9650
 compatible
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
Message-Id: <20261020-ipq9650_llcc-v2-1-e4c492acc8b2@oss.qualcomm.com>
References: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
In-Reply-To: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX4c3kfTyhF+VX
 Bw93+jy4jeQApeSPlpPgeVWoHLXpuaTtClcZP9mGdXhieVayQCchGdm/VornY/RnrcXFx0l3kfq
 gvrm/WL6UUGVHxNowEWjXyLqW/V0g3M=
X-Proofpoint-GUID: lGlVx-7H8cUD5ufRZo6gCItPZ8qBHzoW
X-Proofpoint-ORIG-GUID: lGlVx-7H8cUD5ufRZo6gCItPZ8qBHzoW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX5R4CKo2qQCBD
 Rj4Mp5eMKqFHPeoHS80LN2PN8Yv3/lwIIS4dxvYEPXS0d4U2CgYO0UIUd/O34iI/C1HWC3eUfvS
 F0s3Dd9N5BN+VBTGZNyYBFbLJOfw9yiLc81gCyTPHGrO0gBVY+FSwFVpLVl/JlMqI/4cgnYTeqo
 MpzW7MVxHmTMEHGjsjO8bMutPmCEdx3owYw89zSedVAAr47smaMKjd6AvsEh/RpJbIZBycNW8xr
 mh8/X9lyN2GSRHmh7i1+8LZDKsBIuibxDo3RrK7Fp7zm6gS5OY4X+IKUN4uMpqFqUf3kMRBHWw0
 NfPIYzKdmrHwwjshQbeEg25pT3LBQ8zvm2yZY1w+yGt0zHGt52j60nsCEDnT/3fhyGGi5KxX+Yc
 pl3BIFouFamxvQZ0aU6Eeichn1nPQqCsuIZxxcWeyvD/1aBqd0P1AUN1trfcJLKdqzJrqwou5rn
 0GX4GbB+bx2BWSQZpEg==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad79732 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OsHVNsnzEVu89lbPO3AA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200065

Document the Last Level Cache Controller on IPQ9650. Similar to IPQ5424,
IPQ9650 does not have a broadcast region, since there is only one
instance of LLCC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 2141e5d4de63..3efe68b08d58 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,glymur-llcc
           - qcom,hawi-llcc
           - qcom,ipq5424-llcc
+          - qcom,ipq9650-llcc
           - qcom,kaanapali-llcc
           - qcom,nord-llcc
           - qcom,qcs615-llcc
@@ -91,6 +92,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq5424-llcc
+              - qcom,ipq9650-llcc
     then:
       properties:
         reg:

-- 
2.34.1

