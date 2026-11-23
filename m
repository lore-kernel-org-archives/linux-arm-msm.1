Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445307;
	b=lkyMyPdRtVZ9FMEB1rN7LjlmHjwH5/JaXsoTTOItjHKKjfWYAuL1G/Ka9gaBQnDmrPhB
	 TmYLWX+v3WX34JETRKeMUFKT/LilNdeE66NCPYR1r05etMQaWUlsa6hT4m9vEVuGBHX5R
	 caD653iex2f2wcUOJYfRZgCGpU5uGWEc/GuTLysRKYkmp3yRcOpDiATP8CHgNunjLGELD
	 DVOPNr1ElUa/2SRqP0mPo5Ja72XY1nv0IfR6Sl7mMD1P8wz5ohu+nRrgj8LENTEXOR+/H
	 nKXBs28Ub0T2ko0Jnje40uoAL0KFe3GsOcXbMS+bE26RwhOPp/0AuurVypNaCH6tHdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Eu+cH4uPMWBhMmw0S3F7yLKighdWO6siTUwvMK2W7tk=;
	b=dDYRtghOB+2YHhd2/hwT3tw6SZrhUUSr8TZOzAMBxL80go+jd8fRpA4ykzzowqzDCYPn
	 CvBxeUsOTS0Y3xWOxrzxI+DoCm3ZwOKpxFSXGIzXLbjgV0qsXBbONv6JdDq244c20QSty
	 bx146d68LU5u9uhFuRquoUl9lhzp1pkUEjsiRNTmT+6h8uMtdXvl3nykklzAE+fwPXagH
	 U1b5xgZcwRvLFkx05bS9sUmKrym9CI48Ns8OdXCq48osVoTfn/lSzCOiY+5306c48/94R
	 G4NjT7atZO4PuSCxfag9qhiwhEeuc1hc4m++wZxMr0FjX42HIuvDoESFCcB4Gn8ZlWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MvH5RKys;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FW2U334l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E51B606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E51B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MvH5RKys;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FW2U334l
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLbxc446764
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eu+cH4uPMWBhMmw0S3F7yLKighdWO6siTUwvMK2W7tk=; b=MvH5RKysmrWlK11d
	8UbI6gta+ylAn1NGUqHnrK4KENgiFR96bvT3t2QGOefJjsb6vf1C5/YkJ0mED1l7
	H33QXL/HSHyJ1LO0YYxePnwyuaIL74M0l7oMsSO6fHm2nHlaZTS+/nLCxyJnw/02
	pTjYML9pSsrpWN6IApxcgrt1y6iqKBTRQ3k5u4DWKbBWYB9XTSERUxsMgqfwFGPJ
	X5Reu/9/TApnZPnGvdg7fmZPhNYRm3oT5TCWTo7Gt9LX9X9maP5sd8JCM5l0/+OA
	ydyOUwA5pwHiRNWdhYUOp5QYvm8JL6dMzqO8QBgA45AdLPHv9p3yIdfogRVuj7sl
	20raEQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g741v71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:48:25 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5edc82ecc78so97887e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445305; x=1796050105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eu+cH4uPMWBhMmw0S3F7yLKighdWO6siTUwvMK2W7tk=;
        b=FW2U334l+ZiyMCjU/QRoKPlAuCBuNC54mLe6nucEPKk6NMTI2lc/KdyCSPyW2XaguA
         83aSLX7m47t6UzFtBCTFI3nzlC9u9PylcMb5cS1w4xKYDaerGm7sQDfGEWs+zfnuGhpm
         8cfU2UUg2+6iuGEm6zHwwVmGZmyIOy9HDA7JIIUz6BKuJXfgXX/8+hYqI/qak8/C8Lnt
         zX5X0ZvJnvgIw9KKzJmT0WjmIbQ3/zOyoGXPXSDU4Nr5aG6lJhI3HuJUu5TA0US3yP/P
         7DT0+9HY0mm6F1k38F7GtwmehzZYn4xVGSq6Y0uux5XLZVz+8Uh5EzZguQDgWX04ZQ+I
         Nx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445305; x=1796050105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eu+cH4uPMWBhMmw0S3F7yLKighdWO6siTUwvMK2W7tk=;
        b=Z1UgZmmxZv8S96pTOiS7e+3eQxCLV5syiJ8jQHlMO25Wg+6Jd26kvuNYyGERcai4g8
         j6DJ7zdmvVlLDLm+iClRv2XvinKWbEoV7BhYegnp5PX+paW5rVP7uQqSLnMbSfACicTv
         QyPio2MrLlyKpmArCX7qMxDjEoliOC+yhc4YzzYxPOxoEbykOOOtyjepgX8E95FECuvj
         ndwE1yWCcLm5M3v8fHMJZKicdiV0VOVYtztPId/RdJqR7mvnDZDG0T7ttei6fGX67kBd
         dQaSodXqmn7qQbl1XkrdHiDOIUtvGMhZm2mnV9q8TnPcX8X/q/aD3veGibGbkhdVs6gC
         lAAw==
X-Gm-Message-State: APuU4Z9TMGL0RxMkSluvUgiuqH7CTYCGEIONq8sP7MDEL1fvAiesSRzu
	Kq8f9jLeE8oIq3jNc3a6wdfMTCmwB7BSLAQdZO4o7hnPrHxSIG3H7/q8c5qMd3yqJ4G1ERTF/0d
	EdTe77wmJzUfRHKVNULl6PsT9pqZ1sAvrlD86ZUQh7lF0/NmKIXve1e2thWk1nQ2TXnF/
X-Gm-Gg: AZFdTZcv8Xqgolb+TnEd28FW4huI3LH0O5gSkFPpnEv2s8HY943XOVrg9PpcTGcPbar
	qknnhtLnnZMLVxcBwy2oO5jhYuUfXL6RRXqbT01uxYOe6NlojzZ474z3qdzUuRu/Pmj4D6uVnEy
	WNIjiThW4m2ESvVpNZmPcx+pG72oE6szujiR4ZH6C9hEo8mVzn+naKjX+znGmTRwSta88+aNjoD
	gyGKz1pSDNtq75TNvHd/0QDWp5XhxflK3QUaSyYwTQ3huO4VSqK6mD3gwGdNJluz65qvXVjDsbP
	03OThptEaiMfCkkYC0VnpxIbRmSytDszFIT7pkVG2l5pNtFjV84M6w1A08VE95hLl7qt8IMQ38J
	fEYlCne0IUE8mSgcQAlh0pkvjLF7WK8OWtCHl1Gbbp02gE8tG3csjziQwwX/A7tcoTaN/eBM=
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr6070366e0c.1.1795445304783;
        Mon, 23 Nov 2026 06:48:24 -0800 (PST)
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr6070262e0c.1.1795445303485;
        Mon, 23 Nov 2026 06:48:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba9b131d3bsm2631486a12.34.2026.11.23.06.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:48:22 -0800 (PST)
Message-ID: <e9e41899-9eaf-454a-a035-05f40eddcce3@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:48:21 +0100
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
Subject: Re: [PATCH v2 4/4] clk: qcom: Consistently handle MSM8996 and
 SAR2130P
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-4-fe56c8fd15bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-kconfig-unify-v2-4-fe56c8fd15bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oHj1siy1kFeP48Oy-aCoYxvy4AQ-1ITO
X-Proofpoint-ORIG-GUID: oHj1siy1kFeP48Oy-aCoYxvy4AQ-1ITO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX+anYS8Mt1ohj
 WPBS/5mCodze5yhLoqaCjB/XBp/1GDoMg1s3f6w7YhhtL0Oj9LVbieQWWnRMoI53sGlXgl9ZJd8
 PA7egfA1+Vufr8DF+YhGhzBttfeO6dM=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b045239 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DDBEoBgM7bPF29UhCjUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfXxMIxsYN/ZvL8
 gVGzqYqCDeRa13vsmE30I2XkGenvDET+igWoCv5hnMwCHvalvx/Zt9/bca0caWir+qNuUWOLofo
 DEprPWsLKOwh/T4NXonEWuYe4+Z3K/kU55vvm94iRNxuRMefUGMzt2jzBfb694H6eF+f++lzC7V
 yWv6Q92JPffZku1VqGM+Te4mVV1aX8i+gWTl/qqa2s2HltX1rX6LdHWmfpF6xXNEUgkf/Jc8CoN
 j8OWVo9ydjloEQeTLx1RLl1Ap/w8Fqg0s/MHVMpwqjSQMZGOA0ySPWC/OsoPmOCuZs9sy6RpRUM
 m2mRUUg+8SoKkNLarq6tlsuJSIJ6swE02TGjTisQnMLXEk+Wp2s25RPXKCePyTl/GO8pculm6k5
 VaxPPuGaC0omRA5G/13dhy8lLUFpJTDLBmGIm6lhdvKRcviy3Kb2/7Z1XzGhn8KPV1woTwIuVpl
 jOLQ+XIWAngI4zBVDpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230058

On 11/23/26 8:38 AM, Krzysztof Kozlowski wrote:
> Restrict Qualcomm SoC clock controller drivers to ARM64 in a consistent
> way with other critical drivers (pin controllers,
> interconnects):
> 
> 1. SAR2130P SoC has only ARM64 DTS user and other drivers are
>    already restricted to ARM64 only.
> 
> 2. MSM8996 APCC driver selects QCOM_KRYO_L2_ACCESSORS, which is
>    available only for ARM64, thus reasonably this platform won't be ever
>    used on ARM 32-bit builds.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
