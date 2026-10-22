Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661106;
	b=fw557VN8sMz5i9lqL6z5Z54PrkKSRa4QEig2CJPkZn+QizRpOO5fV1ZMzB5fh4uAJNxR
	 szCSkLTN9aMxcsYVA5C+9OgxAJLcUYZ8hsh2Eewedtz2FCI9FB9BdgAVG8Rj90fOH3Fcw
	 KKeqy+RhmRObdvW8C1JLhuBhAUzfufFO90qtr+RH8NvUcFxnsZ5LpkQnf9SbMIlyLOqL7
	 sSMZMW95eCvcnKGziEWileXqafkxnY4r2Rr69kqlinnH/2wnaq5dVfaiJG4vinYFT4+Bx
	 1v589KmMkEAPX4DpNCCKLTesUSacz3q23kGHy9olB8IJ//wcOjNY37Qcfz1P3hg+YLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=;
	b=XJ75ocubIDoa/GVkIx/aaQk/E/5sfIL1CibTrwfqcWi7r8fV380rRkY/gyKYu1eVAna7
	 iazJlVg25/uKw/9/x5wUC8Mvu1SiHguJ+mupQOWEbBL8wUKXJFTe/B/rXSfJL0/3zL60n
	 aJhzRD/37mjypBE8SXluiu+QwXq5qeVn+B1LMA8fTobPfsHLcjM4wt1zy5dFNsBl/lP9F
	 PLxKZxIZpo/FDpI8EoMJd+088eYZj9Jv3cFj5KNdaHk+f9ro6GHVr1VL536ai09qMAurs
	 24V4iTiZhoQHyXtlJWYzoQKFd8EzxIl5PKOKgz1MNDQnkymQPoKD7CFt1heHlPYmIVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C8DjvWhK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPI5JC5s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C20606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C20606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C8DjvWhK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPI5JC5s
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7chqq3677263
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=; b=C8DjvWhKPSwpRQ4d
	rw41rBEkaPMe6iGTZYzzOuDe6vhj3LT7InylFKVRaI69dK7LIRE7pHBSfA4cQgfm
	kIdyxUmOw2xSwKCP9qw4tGCE8zgDUhpZXlB9xaHe2CbUPL2Xkocv2gHMlth57qjm
	h7MitYMu9ftEQQbwnJHOLSbsXMnpcvDMmzxmdK4Wd8yEHjSy9BbNe0cja0QrQxW0
	Aj3FhUikXyA/L6VoZH1kJhnloIpcFJn+b2AaaKt308Wy/9C76dhE+KTn7cF/teS+
	2TWRa8v8T0bMACCYkm0ww6Hr1xr84m4EY1x33fgiIbfPYZ/WXpHrhjNyTZxBHLVL
	rgGbew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c9mpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:25:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93df7a9466bso18434285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661104; x=1793265904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=;
        b=KPI5JC5seiCV9gjNNzY2sODQ1+/DEOQFOxHxPnXwT0xdcTd+HzA7cXafvJCZ8yPubw
         vKo2tkPqAii5f6BcC6o6p8aunSVg9ERTLSiJLPuzR6Q+oMx4Gf26GXzkP++JX1v8v8rm
         Grv+xclVIC9WpwPHebMG93ACDPlmTeYlIgAmRmkz5z6tlpvqytkdZ9AY3VVnBT5CVXJ3
         SS7BxJvzZCf5tVSUWzJHYYQtQ83PI1jBEle4QLWZWa9CSAGKgUFPF4QTGN1T5xzYiziF
         6EzNqVEnzD7/47TlRH2jhG6d+/XXuRIhDpgc+TrBKah8NsgWAK92tZW3HRbD2ZYu9s2l
         93tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661104; x=1793265904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=;
        b=U6JTgGs/EUsTnaiijMrF6tDra8zK76EmaFaR7ju0l39OF2XnXUOCcNdjCYFlPsbq3m
         LzvJtCMXuHM0G6BddqI2G2cEHWq6xUXZskrmWnHqV1XJ4vOyBadaR82QBtrU9yuhximr
         MywnglM04PPuzNoqgmEJSolg5r+EkOuBuv+Ea2Oju5qHdHcSiL4Rubv+Wz3UTiJAtdt8
         W9LXH2ENS6CA+c912eNlvpvqX5G63u5bGbIIiaEvwlWRCMngs/FCMBzG8KD8BdtpHqUJ
         vb7WzQwGfCPsk/iU6P5zjNX9OKzx7SWaVTezihOhABOqLYvfH9IulEjAmFL7oFeylU35
         3t7g==
X-Forwarded-Encrypted: i=1; AKwUvBy9el53o4mrkxRppfr6RNU70bMT+JeHRuAbZcAonC8q/AvRla3YtjZ1d8fNIyGx4NF5je/tzr1BH3u4Ys5d@vger.kernel.org
X-Gm-Message-State: AFq9FYIx+m6o6OkfLylz0gdoydOief0wgh0v/sQkRgzG7C8vY9+rftmw
	3E2hID4Rdnm0KlrgFrIjXF2EPE1mnGtmdILG4JZFAgVG3K9p6t89rhUejQzFYoChWJXy9puvLKl
	JxsKxRLGa5asErpsvg9pDHIn/YQFb4pz4I4e/mEqNy68IItYvh74foYoee3AX18ekPP3k
X-Gm-Gg: AYBFou15Kr0/5wlsAceNrI9N/ut2k3kuTLR+SXU080zIFLM5o75MKPgM+AaVLuknGoq
	yGw4cTWzBr7VlHcM3pk5Ot5gLfQZ9/1fUitamBGfcucWiK+TJn6uqLkaJVyRLoP/95nNWqkgfw/
	HPi4tu/dqrdWP6FpYIqBmZv7FPtJf6bG+IPyHH/AUs1/kZ/iW39rT2N4BbQD35yC4/rQJeWlhJ8
	MN86CqlgXn4zDkN0x9/o3OeFMD+Ipa/rR4J/KbVuvp38iv3j0Vw1s2Qpx5kB2biy+udY9z233G4
	eoCtG4wYS/4565X0qBpT2xYpstcLo5kRlwS7946+12LQyMy3DqwAHxwPcWLPcUMDLwF9v970rUI
	ujqI+JQCPsSgnbL6W7VuuJQ==
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr986884885a.0.1792661104196;
        Thu, 22 Oct 2026 02:25:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr986881885a.0.1792661103736;
        Thu, 22 Oct 2026 02:25:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130703sm1601567a12.24.2026.10.22.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:25:03 -0700 (PDT)
Message-ID: <91fd4f3c-ae73-4a51-8349-6c75b99a588f@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:24:56 +0200
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
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
 <20261019-kebab_dts-v4-2-bb6db87ff15f@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-kebab_dts-v4-2-bb6db87ff15f@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXyssKEU8d//2N
 eNOv4PMG4/V5SA7/uY/3s4R6qyPlgEg1zc/4AXCnHQAHaojq9PJ+JCBcMIzuxDNHWbO3paHgeR1
 G17iDRGp+RwDgWOmdDvD9zXwRVIifH8=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9d670 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=EUspDBNiAAAA:8 a=RDJzJV41rLCqGB0F5dMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=6aV5INxNnvWGCTbEtcBN:22
X-Proofpoint-GUID: aqxOnv9LYoaxS9_2hM-YWUHGJSUXFOvg
X-Proofpoint-ORIG-GUID: aqxOnv9LYoaxS9_2hM-YWUHGJSUXFOvg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXwZO3tInRQ3D9
 RQ3riJCn0071OldgT3a31vIc84ZG5zcW8g1BB9eIsrhl6H7g6tIsKaw8U+ooTbH5bGPoZ6aMxJC
 hgUapOHbo59HGQd79rn8B4MsLoeI8b7C0vz9Vq0MVYv9BRKI8cVc8VD0x3TGIQGzljrWSKjJ32g
 XCKv80SocKwEvfXJ7kXoSlL4MXVi3JYcWucR7s7NabREBhpMVCuXgqoV3RL/+21dWdrciEB/KtP
 EOCPI7VSPNNUhfnE3niOjCh3oU9Ezf2w8CtiFBqAXkOqZ2CsgwDWwFN7hHRWdBY71fOmuBIvo9t
 XbzUknAVh4OMPpE5QgiOU7NXgIFRQO0k/fSevwjt9jC7DWSn3bUq3OviwA6QYJMuBnkZvUg82lo
 Y6fjp4vnwIATcA0OYpHtR2G+sSVq4/2pFB6l7oG/R3rMVb/Wdes0ND+EGn6rIVNFb/LYSdTZkKw
 8/sg3ggFbRKeTA9SM1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/19/26 12:18 PM, Frieder Hannenheim wrote:
> This file contains common properties shared by all OnePlus devices using
> the Qualcomm sm8250 chipset.
> 
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
