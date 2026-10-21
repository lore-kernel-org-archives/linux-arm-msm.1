Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579022;
	b=UrEPSPk8memEedO9DS79I5UR1/7tWdcHX23iajcgjkzEKhGtxzemRCUt57Xg0xy4n0bm
	 R9ABWBQ2WECpiYqryiV5dqbpLCrhvqkKHC0uACWEvQ0cJxA5efqX+x/kd98bgloMDkmNc
	 8c9ipz7rMr7bx5V+VMXf7aIIxE6dRTiIasApVAIKfTwBTTHaMjYw3bpxpW63jpQ4Xw1mB
	 wWeNmRZIOCqly5WjP9xxAAOE+J7ETk4Wmup6TN8NVTuZnBIkpzJjNmLXVfYGa1PcFo4EO
	 pik4y4ePGeO65AYFkw6/Rv0XWWvVMCLl19hNmNOp+CymnANn58ws5vHgBrR8W8MLSAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=;
	b=jd59fEIJ55dWVGtOSRgUP+O+O5dviaiGEX+DpzXmZGRbVeQozrJKPFRDMfJ3rKMUF9wU
	 gYnq2/SXwRE8gBJwxQMSwebDp4D8d7+ssMcM9HWWRPEG5hfga4VgnGVKo/bUYWTyZ2NoG
	 ntQjK7+bO5aEma1TrHbvKYYJB2Dma1vUyCDfDPA4t5Q3N0F3HXRSWpbNx/PnNTWtYJiUp
	 OTMg+TZpx+2rvRZ5dtHaXWh2MnPPfXuyNzeBKz0xPZfmwze26+dV6sexrx9xrB46Bi7ns
	 etmEy0JIXd5veMf4nR1GW60xZt4T2kgw8aelHk0voiff9ihOMr5v5mbLxqUDvVh0YZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lYvByqas;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3AhXMHE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E56C606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E56C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lYvByqas;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3AhXMHE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5f5c335202
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=; b=lYvByqasiZYQc+Mw
	9/c0oEbK5E/s858jw6UQLLt5Vxr2aH6UxMfnu5Jx7lJFoQWeVWsbSIwveHZ+lSl9
	BWBY8ScKgyXvQKN7gEW6k6Zbs3JfdemxEcmy8N3PkShAfpI2MfD5ODL3X1w6GLgc
	9hOKQ0ybQDCHAXCu4Urc19lmx2RWHh5Oo+QH5jEudEH0WBbHmu25KygHnESqQQqa
	qA6H3+EhZWQKX1PZ9HAsicRBZvkgmQD5b532sluXsh26oYKyb7qRk3l/xhnTAUv+
	pQGiKyPAsobOXzTYG6NIzoHfKFyrVBVMwtQVShHhHaMnwCcH6RRQnlTMhuW9yM15
	43dK3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj48a73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:37:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso5459985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579021; x=1793183821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=;
        b=B3AhXMHEF/HDQ81BnijAdjSTKZMV9rz7FhK2ZdDoNjtLGQ+CyOr7nyLzXN2/76NaEx
         G7soBe9KLY8Vk9gdg9JWA1hvl8Hi4QV2RpR5bRTOnYc6//AZkgM/2dxrJYfyjTDrz6/3
         Vy+3/yxYElgQIKlnUbDuo3dHxfedBJ4Gp0Zdj5aCvT8tcNrBRt+xIDfclMe6kJ3xKiut
         DZG5wnTNtZeiv7yGCVNZ6TU+3zBoyynylSL70nuAoWqaB8VAQaNow9QBvLlUZZ86DGLN
         0HED3V4oMHUnNiXwF5vXBwrV2YlAGp8D5/LdZ0qml/H5wEckG37aJ9oNgvTpzMNKRDxO
         zxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579021; x=1793183821;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpnBt9NDkA/9k+zs5ZAaN4VDwS58Xsye0Nv0hvpKxiE=;
        b=a25r5M2NgSNbMVHC0cJCVIYWWPvaL69NnwAZLDB9tEITOwj7SoMfCByb7n+u4DDQVj
         hybYfoHEIJn2qrMvN9a7yh11iqEHq+wd1wufKZfAWOIC+bpzcLR/T9/nr0rklY4pZgRA
         oV2RIX7DFrBgk3cReBep9jFLf4tNOnB/JJPP2Sf9SqWz5z5wKEoGX52CKIzKM5G4tuCx
         TfV0Q8fQpvNiuAvFWlhGAyJP17uvsieX72JrdNFp/SRGmdtpkgN+vMT7WMykVuA06W9j
         2mSrYNvi8AFmAlaGCc6h6K5+anBRVABQiUynEM0ChpEvszAyOi1jlhLO76McN3sYIBtv
         vlFw==
X-Forwarded-Encrypted: i=1; AKwUvBy0MWCXHJ7kamGds4+pgmkb0QXHYyZZLWWpRpDSMd9pMH2SfuF20MJEienml2lF/nX8GwIindSMtrPedhqi@vger.kernel.org
X-Gm-Message-State: AFq9FYI2XK5rDvtjsZte38Fees2/9mvnr6eEo9VCEwcE1wjZfBHq+I0g
	R5+n4xkMhfO6jwsNvDJWZTeqDHd6XPyrTA4+xcDsMPWVq9417bbnkUUjrUmmgVNpEenJwjDT8Zp
	YHNSPxYiaNoYcl27JkyK3jq8BNzYbtk6b2NXL3RMiwbqakRHz4eEAT80yG2uFBKcs3yZs
X-Gm-Gg: AYBFou237i8c1hCa4WZi9SOBKF0f54IJSoAUAR6pzV6nCDbCHj9dYR2XgFVAWV79eJJ
	RMWXc6T1zXRH0taaXHGx0LKIvz7cGjT6F4U5Dnt1ytj195fKG3ZvS2r6MoR712dCk1C/dXOcFUj
	wgmagYr92P2QBuKNn6I76sr6fFzuLt202skPyK630IubwWzMdgg2andXKKdaDRL6PlFlPEHvo/I
	JTI6rue48Sppfb157AbgmfH75v0wVB2nunLridKLrtPU5DHHbcCUQE9+2b6HR8vN2pxf+MB+0lE
	CxBHafAgVNaBJXJWvvkKSbitkiaVWh1Kt/EnMQw5a9fyzfPmtMF95q/elnMvkGTtROwseXepxID
	5ahYjZElK/8XVjln7NklThQ==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr417908885a.1.1792579020812;
        Wed, 21 Oct 2026 03:37:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr417904585a.1.1792579020322;
        Wed, 21 Oct 2026 03:37:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dadecsm673656a12.11.2026.10.21.03.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:36:59 -0700 (PDT)
Message-ID: <14992ec8-cd5d-4245-997d-4b5ac93d0c46@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:36:56 +0200
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: motorola-dubai: Add sound card with
 aw88261 speakers
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016073157.611956-1-val@packett.cool>
 <20261016073157.611956-6-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016073157.611956-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rHfbL5trLXI4yKY1hDFxJPGQpqvhpLli
X-Proofpoint-GUID: rHfbL5trLXI4yKY1hDFxJPGQpqvhpLli
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad895cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Uo9H-UCNI7IvtxD39T0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX56l3taLphO4w
 3xFw/ksqal/g22uTnX+4CaqMtyXsytHe2nb0WhtI2SGW7H3JEMkwThLyTIvXuWPr18IdRQlWS+W
 Omb+zXqQyna7zF1IrwxRzekj6QnZ2UvWP4ZFUVpO3FjkppL7Ikm34TizSFpVt/7RL+wKssReE24
 8lD7QK8asqONNpO0+kKkLPp1guXRp32y/f53b6dw1CM3waHH9V3j3aY4EtY41e46xYvUI1IroCN
 zOUyxVHQdf2Iozzui1Taw+V8W1HrNDvO56Jy39Yn36oLPanO+R3HxlrYHn48zOAIp1Kpk+hpg0X
 JaWR96BtrKF2kJKxxLMkRKp/L59B04QXbRigFYtGou4AKxP8cKnjQxI/3/wWfmpZtnSxcmI6kQ9
 YTRWGjrTUItGOX8A42xVw0Ohdm8oKy4X24qtkWW9A0XShjnRvgMpdrBSIShrDur9haUKTSw7tb7
 v2BHjD+E3Arfa0vcxpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX45Cs4bRseEUU
 AEPDfEtIzRqxQ+5O/nED+HmiPicSu8uUKi/TYuVdQL4sCOV4ctbkUVMqXauw4ZVCu/RaO/MNOej
 NiVeUBD2sE+gfMTKaSujsQgcfrdupoU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/16/26 9:31 AM, Val Packett wrote:
> Enable the sndcard node with three MultiMedia frontends, a USB offload
> RX link, and two Awinic AW88261 speaker amps on senary MI2S.
> 
> While here, use the correct compatible for audiocc for this phone,
> and remove references to power-domains from a 'reserved' node.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
