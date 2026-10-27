Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100728;
	b=LuiGhnEOfK8g2Gw8CSwr9oZ77x2y7TQ8ERPSOqu4Ay5YmqmTRI+iSQqLdneiN7lTnJdp
	 GJZsRin6zKMiJq2WqU6PzTRrDMUE1yfaSQcO7yA/TOejBvFXBpC4HiWGqBc5z89fuvcMh
	 EkKAznaC4kX7IyYL7nr0+a1tK+X91Li0pwA+rqKQ7dG7YTg3rsnkhfzj2aFyx2DghkfME
	 LLCf/Dpjb4d2g4tfeHQiog7P1wwdDRdkYSnU+n+n1piDb8GFXVw5UjnZTAgWeLReJ2lfn
	 F3rbP/3EuvRgbdrPQrjIUww49DSquuOR5Sl2yLPo1ZYmj8byGFFV6pOkwzpV2WszYSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100728;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IeN8FG3BpOeYsxF/bjnET7QOWyn7UaLsIlHvGU5eL90=;
	b=0CGxG+mCEBdEnw1I6b5I6Gc/1MFCTedRNhwmK4psvxRfXy5yOIYbRzlXHqh2J/4xKG05
	 5oeRkcAKVdGko1le6Zgjz7Gu6fGJnO3nYOMqs9FolxIYeCN6RbYHgFb+8ba3Z77vSp8Wc
	 jqf/lo1WXNHOzXin9vPel59gYYGXkZ62zrmz7qb+DQv+reIBbMzxcAZibOd2fkpoHWlw/
	 7PoIkOCIGbDY8pz4tatFlrPszACZufxXARYKEqP0pIxy7u7waDeRvWQl7FNVKx69lNvzI
	 Ds1hhgMs//TqMamFfcs1hGPZj6IiN38DeJXF8h0iHWQRTnHEsW3RopitH+HzJMo8bYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5FpOuWz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxQgofhv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D011F606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D011F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5FpOuWz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxQgofhv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsVq1973270
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IeN8FG3BpOeYsxF/bjnET7QOWyn7UaLsIlHvGU5eL90=; b=g5FpOuWz8vdXEU2N
	Qke6N/ayibqk4AI0fe7XVe81oPxsapqh5vYX2UhEMJVKdQlQPU7N/XxWB8OtwdFs
	flr/zgERQE7KvsRkwx7y/+pEyqKhxbelckvwr8orGpaboLpMfcE0fRIOQYw51xN0
	uXCrDqdE3DtjbxiFUistNQ6SWa+q3uu3FvYoRYzgnf5en7F0oBMfGSw8Uq32kwtW
	RF4/zgwh59QnMONL4mQVAsCcXp43jXtf6GzJRRJIOgzy5d9S0txsLkhe7MQgZ5lO
	WSSdIW5qk8ddnrMb7S/R+TSOQwzX7tle4IjbCqyVXGqy9mnJo1aiuidLVl3On/8V
	0k7p7w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gavp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:32:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so2889776b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100726; x=1793705526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeN8FG3BpOeYsxF/bjnET7QOWyn7UaLsIlHvGU5eL90=;
        b=KxQgofhvm6LAGEhG0C9tFbw3MPtoAYV1GesAzMDkWmJuSHVOR548THKqGyPRrGDU0V
         BONkzDa4A4b9mUxjeC3XZ90DKjw7NeFdV2rDfEVa8ietdk/xMhIPu+cOgq5Psac0IdUE
         al8EHS5piPEOW8NtN8aj0sxgVruN2ZxOsdYAZTESuyUjPvd/RMtEvM6Fc5mYc0M5Dkhn
         AO5Eath7kYAE3yUpwnGdoIaBBc++4zl1X/iPSg52GFfklTUTdYmpQ7keFBg41bzslybc
         Wqb1I8OTmbv+6wDJ5pgzH323XwDIEd8H1F/XAc40cTmzOP+/lwrHXfg4HspEsZX0rm45
         IsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100726; x=1793705526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeN8FG3BpOeYsxF/bjnET7QOWyn7UaLsIlHvGU5eL90=;
        b=M5llp6DpDMYppE/asoAMP6DmZCS/9Llux93gHXSKMhyOZspkBRhEMSN/sVR+OJAuWk
         ukMXjHh/Yx8s5EQ11Dg7Aea+XEJ0mvvLDC0GBNfivQpfySMi6np5xaClmawQ7Sz3oWCJ
         4C8MpOHbPPzGL3QhFZNUG3E9Hzt6Yd/WWSn8EvadqcrXAT+P7RF9LhQvinD6ZVUSjube
         41a8vj+lrF8NoSvH0YeLFzeTWh8/GvXT9huBN5+7XOsrZ+XGmH7WgggGH7i7vhOV2oT/
         0O7yrwEvXDsYsnpU5bMgEbrlFAeuawfRYjZKPcErL8pmBdEiOL3h5zJHt7h6OaAN5Bk1
         wXeg==
X-Gm-Message-State: AFq9FYIsSdqHgevf5jFdnAM8hnmkquqknI8M69kX8fpY5WQweuRi/z4k
	ryd3AW0gSnA7vE6BFNKjTnIesvDTD26Ytp+M8wcgRl1CaHY2Esbm6Gc/6SS9g1b4CTxBkzCE5jL
	c9WF/n/X5ilf7qYaG0HAsXXPpBc/SgGKYLN85Sme/8aLt6DBApwbLQraSniFOUXBo4UJveBZRjd
	QK
X-Gm-Gg: AYBFou2w/jFM/YNo5+M+3Vhtp17Fm/R4MMpG/Isd/E0sIKkTLq97ZEYkTEQConArcjm
	ja1zymZpnvJ4WrWs+LKy2OXFo6L+9nv9iKrd1Xz5by4/h9TZfX9cLzNbwqD2QCyV/04BEvel92r
	4TPVLuOX81qAgrKMXaYo2l5bbwDMszO3DUvCeUUGF8+bloMRaZmp7XGaWl8E+m9+YUM8lbK/gYp
	MbeIrJjAJUO8U1yuFU045fOr9deNWAwhWsfFhqcTDsorLEhvsoOTgalE4jZvXUEdGEsvQWP5h17
	ZdILwugENthXiBcszrFTz3biHeRt8rVVPOrK7AjXGZQoFaZ3Tw706C3Zst6BA4pOgOEIqKW0p2c
	v0sTzO7hun3j+D9PC5d95
X-Received: by 2002:a05:6a00:1394:b0:886:5938:cddb with SMTP id d2e1a72fcca58-8a3665a8f56mr7429144b3a.20.1793100726470;
        Tue, 27 Oct 2026 04:32:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:1394:b0:886:5938:cddb with SMTP id d2e1a72fcca58-8a3665a8f56mr7429123b3a.20.1793100725965;
        Tue, 27 Oct 2026 04:32:05 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fefa3sm2143836b3a.51.2026.10.27.04.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:05 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:01:55 +0530
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
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
Message-Id: <20261027-talos-lyra-evk-v2-v3-1-658fd5a7ec99@oss.qualcomm.com>
References: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
In-Reply-To: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae08bb7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pcj_qY4RVFpoKUdRnfIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 0T-1honQBhrd8kzozRMOlCZBvnSqAtLs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX0WmqNriML5t2
 Wpk6DAktADm6+xD/G+yQl6YE//Va8o0K4ChdyYFfEtx+ARoMHfvemVIwWvvuJsi00+bZM+sD9Pz
 emakhqY8Xxpn7XaMge6kCVyeAqtXyM4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX50CgvHbgF7qW
 x226S4HoOrZWLgww5WRXoakpS6mKV605gCeo0Zw3XMC/n/jE8H7ZJvCxNX7itK6ErO5BJpAWhEJ
 W0HFA19dYoqgs02t2p3vA/cWGvL2Hf2cU5/NIR3FpHf5oRzN+egQFEbvLnf8/oN1E07j3/gN4Zu
 Wsd0XDmu5gE9G+TyTmTH0XHS80Hl/FTepvkgefKR8L4SXvd64TwilmJXS6VnfyWEZ4q8MfdNi9O
 /BtnIPo27fero5B7vmiYB6VJkUXjw0YnwX62GnQmlJXwNKLKTNh8lOMg9K2Qc5AcfkDxstEVhn+
 z24o6gdBq/tQLRRmEuxsj6ouO/quTxWqyB4HxctAsQSuPyvgQ/D0mjtQADtyOdmrhfZKd1NmWro
 a2cP2NptEeNXiyWGT4BcaDW0Pcxs1jfY2PZPEZu56qCBZLk+60ajh/MhBvnnutlOTDoRAv+QTwK
 r2QzpWMLeCC+pNlGqpQ==
X-Proofpoint-GUID: 0T-1honQBhrd8kzozRMOlCZBvnSqAtLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
board. The Talos Lyra EVK pairs the Talos Lyra SoM with a carrier board.
The SoM uses the same QCS615/SM6150 SoC as the existing Talos EVK, so
qcom,talos-lyra-evk is grouped under the existing talos-evk block rather
than introducing a SoM-specific compatible.

Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..d0e30d6c1d4c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1089,6 +1089,7 @@ properties:
           - enum:
               - qcom,qcs615-ride
               - qcom,talos-evk
+              - qcom,talos-lyra-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 

-- 
2.43.0

