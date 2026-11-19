Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072252;
	b=m1Y8DCvxWJuW9dDh2aSuxUbf5vxiR3c7QJQYi2sP6bP8Ml24/IMXh55NweolVCzAyw6n
	 HDcRyQ6RgkbGH+8TOpn8LoqJ4mj6C0KAHAnWgG4OPwyjNTqWOWyjxavxkQMpH+Rc8aj0c
	 xj+zoPAciJkeE8umguPbfi3qzsw3+3IQjLKjIfH7qKjvoUIr+muYnpSQkOfU/V4hNgl5K
	 EFo+7HENO5aWqq+XAv/pivi6nYzAGdXtj/VO2j/WvqHoHa1H4/F/FMZGUucYHlP+Y1SDJ
	 dh2sSFCHSnPSsKXCM5T1W7v6ziBdbKEMHDaEApKoTTpGVRtxTzPq7NEr5W3CpZzZFgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
	b=arce6jPQQouILFGaaLN4y2grldORWjBz1U5I7irSf5HQi5jPQ3UzI7K/UR9NotKc1ez9
	 +Okscb7NyYERTauUFZLrqG3uudMg6+MmMLYtwi/h0JsysTjrhlPGT11Su+UVfTZhdo2Dt
	 SGGyabRr9zG1GqEivaxFKrfcxP2COVKV9gK2vnfy1fVkn4sgz995ed6AdaMS4mcYILYU6
	 HO8wFPqLuQluGVR/1TRZezT6uqfFHyVW0ij0w6SQ3v1Ts4zZJfhgdpOAUSFD9rL9ISy8v
	 bfSwjmgoZaZq9tsl7selGEKMtVuoSNG0bcVNWmLHTZxDm5SpKfse8hwhmLobK1Ic6JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dfspp45/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JzsZx5qq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F57A60A260D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F57A60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfspp45/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JzsZx5qq
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wJRD1007305
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=; b=dfspp45//kaCSpJR
	huucG6KlrK11LS3QF4C3SBGnGx5Bj7g4o/rkNEzVlhCEibADDql83Mv6a8c8jo4h
	0H/PyAJD4HgdZ09ktS3oURtMeU6ecVZe3mkwvIAwfqFlM+b+4Ol4MKl0dMl33cUe
	QwBXFhjpUx0GuUJT48qe5pne1P6zb5vF9L40eZINaXpon3zqErfPFpKBKq23hiFp
	gxhzbEy6G296xrEtMr/mVNxGIAySbTiT0Xbefyh2zkE7DIXUnC8wWDh/R5fCJ3yI
	rMBa6gYuor/BrtDF5V75I5PYwpt/7w6l22ACBOtUE/3mnuGMwFP1KSx962Ihqv+V
	k7YUNw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etnuec0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:10:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so1760605a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 23:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795072251; x=1795677051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=JzsZx5qqlVHqzvED8zmCg/w05+5WQqbvjhUc0DijfNVurlzfAiiOYkRSuelpVSV7ix
         BAOuiOhy7+eC57OrSScrGlpSd6l0RWOdYHfKBn86OyRzWrBDPY0adOwD5j1Ma78tmdta
         +6kbXzxDQFaX+ccQkvXMX30Bta+hjpJKZNWUOqdffqTEBmzyJyG912HF0BVPXozPvpbo
         pBRG7A+PmzSYvus5ETW7KqegjiNFxh7Fz6Sm7A1M9pn+mAuzZ4Dcfhu2yjqwQYDwjOi8
         OiVY0yYCbq9EJqy5ekRciOn2wVgY6owaKAYr1iDixweKof/KNa8L6Q1dsdQS9gvzJW69
         rZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072251; x=1795677051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=GEfHRz0M/4XO0oG+7LM/tpuG0SRq0wo11jY+LOWpwKTPwj4ha30oGMd0pLmQq1hJVR
         CmXekE5yj48yw3ElbPvIDo37jQLKlUrj0qJmbewvK6j7BuKbmTSP+wjPTHZbM7q5rRYw
         UzPv/yBSuiOh6mFpib+cytsmVPyoXCddgUXH9sq+LGG5hCKH4DIcePc3hjQDYGa+hTRS
         mSnzMgTtCLdyXjWl0ey0uk64cXCbQ6fPZp1Vm+mJ/fUUvGiRtple39G2/1rZBZBEw6lB
         n0LlE2az0Mm5Ngrd+3Rhjjftr9iCRCOwupFr5cP/MAQfdA53kywUkqaFdDuqBzo+/94q
         8NHA==
X-Forwarded-Encrypted: i=1; AL+hErGM4ln+tSMzPhIDhBo+hx3PLMadb/VDlGR5h5CR75i92ZHIPZp63rfxf8x0Ua2+E3kGXsAYuI3nKSVyyUZX@vger.kernel.org
X-Gm-Message-State: APuU4Z9MvlNM2bWht9mGfg0mBidWBGFg6iHQJJgFFwZ0YO8DaWYp94y2
	KA7NsxHGL5AlrA7Ln0ZFftexC+atJsCxRLG3gLHnmSsF0w1U+gsiRd+BBPNIskSTwH/y7JVQFD3
	uEP9WPUyxpLS1fS4S80Z9KAyZE0BXu87sQ8JROp02pcs8UBuwWl5OZ1qjcUVQRyRmcxOu
X-Gm-Gg: AZFdTZexy9Y+Zy5vzscMADNlAp0Xz4dl/O0qQeo2MOhgZw8i7HJy5GaCTcXOOD7xavG
	9xnD0IAPNHGBxT+2pwv4qHE+aH1W+5NLlYXeOro6sSGB0ZESQOx72GdTuyhAo9M/sUnz5RnFN7j
	zM3DWdY1csCKQ4mgsTkkXBDY+Mxo7p7upP6K5ZaPCbX7coSPEp3DH3HmEP51VNFtSVMksUtMqCz
	djhCxqZ04bt1/8GO4PHcyQ2UV5oGx2vd5rFsf4nZm4VYj1IrfgS/c7kyRVYk3l3mbmrRNmm65RU
	yihH9CQNxfAZre+2vU0J4viDoamUyUfWz4wSdc50RtLr2Mk7pnXMrYSk1oD82W4ug9VyAnwaAMu
	4hWDuIDKioFyDnoL0LOQt2TOMOYJgpgRPNfFg9ONYCwUAJqmp8fQX9vgh/Ns+6EwYSnbYP89cot
	2tvi5WChZXlQ==
X-Received: by 2002:a17:90b:4490:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3b3d07656f3mr5176732a91.34.1795072250641;
        Wed, 18 Nov 2026 23:10:50 -0800 (PST)
X-Received: by 2002:a17:90b:4490:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3b3d07656f3mr5176704a91.34.1795072250005;
        Wed, 18 Nov 2026 23:10:50 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm746348a91.7.2026.11.18.23.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:10:49 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 12:40:12 +0530
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
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
Message-Id: <20261119-lemans-draco-final-changes-bringup-v3-1-db08f12f0cd5@oss.qualcomm.com>
References: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
In-Reply-To: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795072239; l=1219;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=J11m6SiF1xvvFn7gQOySTxQ2FArKpUmIzJhDjDucqOA=;
 b=UI7Icu9B2hyFZ0Or791SCaVxL1Mj1EMf+ZP50u+Wua5lXmjjJXMrRtIzH7/1MtGxAl+OwBc3o
 JSbf3jvT6AqAOaY1bppb4hNO1dw8luWlkGYf1SkU6OWki+Epwx5N/vk
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afea0fb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jgbjWhLY81TnJwHp3GQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: HqY0HvutbWiJFNVyuhmwNuFgz62KpNec
X-Proofpoint-ORIG-GUID: HqY0HvutbWiJFNVyuhmwNuFgz62KpNec
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX0pYflcotiDKA
 veLHjN74KRwpZf2LLqyqBb5VBbTBjY94jvX3MGVee+GUVXtmO3esQYorqeXLbfS5FHCF1MkmZgV
 y7A/7kn8rdguVINADVu3ZxKRy8l1lrw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX7AYoTRTxoMHe
 bhWXrPhGAEMRt5U0r8dG+J1ipT2z7LUwmPmlC5BCTtVQIIIOYZ2lejALNfTx542Wndj0odo+ovk
 uFz2MBMLyZJRAk/k2nea6qAzxt9xWOlwo24q9f8KRDqWd550r1/weB+0t9XdLJ16B3h9Yqe6p1C
 Q3s3U9aqivRzuu+6n534VdyNlOJOlzle1y8eik6u45C6JuE89OFB2VQ4g37slMCiZDrOqimT9TX
 j6ueU19VTj797WfDKQcA/JjHyc8o+JmhVFhjWvlj4TCLGak7LEGgv54wAEXOsx1bpfukSm9pKcg
 1Z9i3z+Sm9z+HW8fth+MhIpUXrBZMo5E4E0sXeriK7/6+W9qdW/Nf6uqOJGoknG5AILqbfIlpk6
 mHk/exRccP4X3uZWeun6N/r8omHuybS+OTjY8hVTKx3QyU2rhPev26hC78rSbWm53jNcJsKKEEB
 sg7VG85DgOU/tqMKafw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190028

Add compatible strings for the LeMans Draco EVK, an evaluation board
based on the SA8775P/QCS9100 SoC family.

The platform uses a two-board design: the LeMans Draco SoM carrying
the SA8775P/QCS9100 SoC and core connectivity, paired with the Draco
carrier board providing application-specific peripherals.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..3d63e797cf60 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -545,6 +545,13 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,lemans-draco-evk
+          - const: qcom,lemans-draco-som
+          - const: qcom,qcs9100
+          - const: qcom,sa8775p
+
       - description: Qualcomm AR2 Gen1 platform
         items:
           - enum:

-- 
2.43.0

