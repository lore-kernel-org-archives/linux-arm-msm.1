Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968155;
	b=e0KgGApoLVjORszqMfCG142HC8D2ROQaqx7nV0n9bphc5nERLAF3kG5uSJzSDtwcaCMq
	 HgisFf66CYQ4+b3BLfLxLW04dpBkQleTnKzclfBzLm22Nn5EoHgGO7FHI7Tx1Orj7kNdf
	 939RI6MOuHpS3jHEnMPwNFCKPXvIFeIa8sDrclVSs1tvmTGh+LMavOd9y8KgSXD/PrCkY
	 ebyqx1uECm0HC0l5Vv1S0Pyswf5OgLBcvulAnSprxWmG2noGAqf1J0DKu0NvKYSmOUOa9
	 Sx8kAyCQwMIl0pgJi1CRpSJyFSmdpt/z2bmzCWpHN1XaeE06h7bwmZ7PYDHZEw7ISsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cTQ/P55IE3fl7mkbvBy9Aon27LSao1cHBb5tYdZpUE4=;
	b=ZZ1cEIr5XdQ5X4ewu5gQuASFyPC7eQ6seVIAP+Rqzz/g+SVfMLF66bC5xKUV630Nq6Hw
	 Wme6kGIAHwTnmr2LK/ybx1/D3a3TDqa9I8Js/hkMw6f99Q8x4qQnkwyr+lSxneW09I4q6
	 aQF5wKSxWOW87o6jFpA3XoHoIhYcGGalOiX43vP2q1eMqttFwk3I87i6/2LMZXGiueWDb
	 /xMHLEA3LjK7F6xxhqS9MEwt1geWIaDmt2RS+btk3rlQI4FcH929xfJOgKhc6vKCEqA1u
	 86RlT3HWNxkfl1tYzKQ9k56COwpi1Nge8/yeqWrXh0eJVCEweyARWjzMosexGar8pHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9R4ngRU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z+OFH6MU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40555606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 12:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40555606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9R4ngRU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z+OFH6MU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APNcs114833
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 12:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cTQ/P55IE3fl7mkbvBy9Aon27LSao1cHBb5tYdZpUE4=; b=H9R4ngRUG/g+2djk
	gHAA5lg8qaVWW9tyBja1g1wFNgobzGjZCWVMAjcUhV4/x3e/qMWqHlhzk392Wx4R
	vVMNwLNbtJ+OvaSEAn/0ScW2psBHKujdJ976kCrVBtu14Bvgd/Xqow6hVBqVR7cg
	j7VsiOpSxkvJd2VuG2tzjm2yUII/C8r14LfzPeUwN2ijEJjcOlViJ4gGFL2erE4B
	+LpvDmTZx+UxPk+Orz6bKwYGAz+cxA4xI8jBnBCFA4Sn357bkYuQFZ8cIoVDHtZ5
	g4wFLd60ixA8Zza1fx75T4tXsaEeMYG7ATj5/VViT9bWg43JJH4zjKoMVJn6819d
	aY2Cgw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3patr6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 12:29:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so14353485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 04:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968152; x=1794572952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTQ/P55IE3fl7mkbvBy9Aon27LSao1cHBb5tYdZpUE4=;
        b=Z+OFH6MU2mP2J0OGm2Bti45V+InAg2JWcq1zp9FBGcKlvm4Mh4KMRWqyFRobAq9EGn
         CkN949zvakCoBTx0LKdPQIsNFOhG5kjgK6xcUDrbm+aQaYMb20Dhe7KU5KloTu9IJ9PZ
         /ojUfZEorNu1uPW6hi3KWoLUJKj8bERvCUjNV0iVslhU5qlT21/KhitE896G1lHukB5S
         hIDX+7Ef45mbSiTIVXCtdWRJLgCQFVIc35bG3LHMQHZ6S9OYJFuPxxhbiJGvyTG/L42U
         Qb5/AwIgjwhjc4ZwwOHeUPA5sFqSIv2kVfkK2tDxvyDSnBno9K+fQW1IcALbVHOH8VXf
         J3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968152; x=1794572952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTQ/P55IE3fl7mkbvBy9Aon27LSao1cHBb5tYdZpUE4=;
        b=xKLqGKXYd7RHQDXlCcMNMqk9sWHtW0NftIdcNtAhddeg1Mxv1SQoSlAp31PwbuN9MV
         XmVnvhlXi7ggG/qJnS1eDgLoG+YTlxvpfdIK0Dlq78uMfJjucIp7E9+qHSGRBiacrIW/
         PgmMz1qK2jt0b/EpJ8H2m79ygr2EfBCBukh8MmpQf6NZhuYOTDx3EcDlO8mihgFcRVCt
         yP/3Btc7TOeLy0lHlWixNrZFf7hvCMxolNxEznv/gX3oJu8fhQKLUpNWIkUzjyASvzqb
         f2xdRNbJsFj33MqJJHiQ5VPU0MlWGANCN6hJgyZOzKKi7eWbY4paQUhl9iNnMSzs6uzy
         byAw==
X-Gm-Message-State: APuU4Z/B72n1P1LSMo/2UDLIhL9VlDPnAcNWKSue79cvmOBGaRsO2MGK
	jgQn/QaGOkjGskT1swXStSmIeCMd2FMYsLAmiFVmDFY5RxQbis1lU0lB0VfE2Dfc8Bb5LE9/X9x
	xRiGzkQ1w8F62VpV0Z7ufVp75u1TkQCBwDnHfCAh9gBbiw/nxVgWd+U3O+pJ0eEJHuif+
X-Gm-Gg: AYBFou1ysbZNXnjCYIsJE7bls7Fsw5BEsN6jT9BkLxP95JOBmSU2oNRE5vYvD9+Y6Qt
	vUVe62Cuh5Jrpz53JZNEcW5D/jOF88/MSjzT6AC3+7CdY8psCnzKo/IdRhHqnINDktqw1JEZ6wW
	xiH37tWrmhmS2+peJ63MxDwM9uiVZVD+uRagjsctYyHn54+Yy0FvMYHa8Oc2WV/eCuBP1JbaQQU
	6sfFLtzg2b61MgXOxDz8cxny4PvgAEAgz7lJ3tQQdX/1qI4FjtMl8z197Oi8X6FuwAPV26Hy4D4
	W10VnPiCIwxrpqvxraGc9CMbKBgvFI7vOM3ZJVJ3O5+sRERPFThxNtSlBUFrOjmWCFiqAeLu5XT
	4eJR0eQPtqFw9JV1Fw9sSeNTHOXG8WeWKM1GbAE5HCY4E4rHLxuhbPJHrvWhD7varrzM54Q==
X-Received: by 2002:a05:620a:a994:20b0:939:8148:1e3d with SMTP id af79cd13be357-945f33c0c23mr325506985a.2.1793968152557;
        Fri, 06 Nov 2026 04:29:12 -0800 (PST)
X-Received: by 2002:a05:620a:a994:20b0:939:8148:1e3d with SMTP id af79cd13be357-945f33c0c23mr325502185a.2.1793968152022;
        Fri, 06 Nov 2026 04:29:12 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac249sm78001466b.5.2026.11.06.04.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 04:29:11 -0800 (PST)
Message-ID: <be2c9147-1c19-4dba-a56a-aae47b838cf4@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 13:29:08 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8150-microsoft-surface-duo: fix
 da7280 pinctrl state name
To: ivanverbovoy@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103-a1-duo-da7280-pinctrl-v1-1-be1a6dd10f20@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103-a1-duo-da7280-pinctrl-v1-1-be1a6dd10f20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXyaipS4fX4hHY
 iLbMb5Ytr17OWdylIc7HTdBmBtUUXFC1hJG2dCF39meelmfmNMZBawnK+ah2lS3I+XX6kAdS2eZ
 90opLGT6/Rr72oYtet6syp8n89Pa/RFn8860Lu1ZOWV0oj3mV0yHIAUfJ4V7wpdiUNYRNO21abX
 ArGSPnR4QFOQVMg08pDLBoRUqxXSF6wnMHfKU37I6LxjVVqwyBv1R7R3J2P+7BqhiI220q/2jcb
 12tJRy8ACIEMzIpSNLTLwhfECgsC164Q90GDLh3GIRyn9vg6isd3x4ydWox28y5EL73ob4QHJqA
 +wuZZnEGT/5vU7fRL6LFXxbYdCOBbLiKBpDK89qOfFKitQmtFWj9nR20ZzMln9B3M34l6TE48ac
 qMhQNcJiaKWsM1iOkqh4kSSm7s6esRVlK1XFFA9CULQRgx2Hl/7svD4QtN8w3jwTN8/2cdIFc6L
 fnkundqwKjSbz1LPFGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX2PIaYErmRV/b
 6VAd4qw+8gzDXsvNm9ATRLXptMCdC77RNOTpkjzHz/mv+BAmHLyeAnAnJsI2hOK6tG1rnSldiFC
 Mtd1+D6Zm4p9tfin3tZOW8DGojyR+/Q=
X-Proofpoint-GUID: Kcxti6-_7WufGVZm4RzHmAaUb7vfkSJI
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aedc819 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2dXNOmNVTs6F5e4hHE8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Kcxti6-_7WufGVZm4RzHmAaUb7vfkSJI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060049

On 11/3/26 8:27 PM, Ivan Verbovoy via B4 Relay wrote:
> From: Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> The pinctrl core applies a device's "default" state by itself and the
> da7280 driver requests no state of its own, so the state named
> "da7280_default" is never selected: gpio42 stays as the firmware left it
> and its pull-up is not applied. The interrupt line is open-drain and
> level-low; after a suspend/resume cycle it stays low and the threaded
> handler runs continuously (about 2900 times a second) with no event in
> the chip, which slows the whole system down.
> 
> Name the state "default" so it is applied at probe.
> 
> Fixes: d1f781db47a8 ("arm64: dts: qcom: add initial device-tree for Microsoft Surface Duo")
> Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
