Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310E84562BC
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050252; cv=none; b=bNbz5Kt/gWkxvwZn2h+j1EKMIsdufAz71FnqPl9GAMqefIlEGV8b3P9ZUGzi8Ehd25jAilNA6JSI7R5XB0ArItkItnjproq85agE3+gslAysL1FGzujRd8Nywfkb4/L8QRpfXMTikDWyEqBfWwLRRgoPMabU8uOeLljrhyWCBBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050252; c=relaxed/simple;
	bh=1y79ymj5dd2m8Bm3DANiV+fpQlH4mdx3t+K93XNVtrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+69xUlgd3hijs6Plq6aNN2Jbgj4uN7yDixj5JFjZdpNidRXvolTIOfQCjdFpCr0ww71OQhv3ogTz5/HDiHM3bna5pV3GErnpNbkkaCCTu3wmD3rIUMco6NFcvGhHnieL5AzhK9hvqM8EwZhutdxPL/fxVRlkt3PPewpoPYWucI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OP8p+9C3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Utdlsrzg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OP8p+9C3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Utdlsrzg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABJjs2057047
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2jF0ZOeN1fb5iTAN1T02dkgvczfududo32WGzeSbJ1I=; b=OP8p+9C3f5JMLys9
	Q05SxH46tWGqiNTa3wFJqy/gWSdqaCynz99m3OaerMqn0fRbIMYwVzVpX5S+L+k8
	MV3QpSp0vMmE7jyAoxxhlC9NOZXga8ub+nJUiddMlg48AVBM8xYTQ8xWNMBm6orY
	nyWCS1SqrkfH7maw9gxIq0nmLsiSzSUfOzeG9pdNsSVc2Gnhsvg2FkR1Uhm93SvK
	P7cDapEqICt8dcqAnEdMASWeSSADYFukYQdRAXm0B7y+rECDMr0bAISmp/boGEp2
	y6FGi0w3xZT3JK1JHdpOWPWWmgQdlDhAo1d8ynvl5h5KAKP7scYlpTK0BW4aorDE
	iqU6FQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4frmspea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:50:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93495488976so118415885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787050248; x=1787655048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jF0ZOeN1fb5iTAN1T02dkgvczfududo32WGzeSbJ1I=;
        b=Utdlsrzgg7KD9U5zLphSI70YZA5xsw3OUMgA7GCHtZUs1mB9tOCeaPmWoZDQKidcP0
         /rSP/b6yutQDT6sOPQPoAAEDUH9Pw1T9BlvO+lWiWsMUua1HeWPHzplfyFkmD4wVYNsg
         dKU6lgfycBF0FuDI17jSs1bOf0y6XjXJ3IFbJoHK6HmkPfLyLWbBdkWa+klajghWGHNb
         1mNevP/7oTcPuLtCp/JYacLY4pGiNOMw6auVT20P/p1I5r80t27G6jckjzuFEFOaAPQF
         hN2/oIISQzsmo8A4rrD3njZ5rRSvM7zQgjAApMVwavqr+HVr1emRZq6n/jaZAEpFpjsp
         kd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050248; x=1787655048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jF0ZOeN1fb5iTAN1T02dkgvczfududo32WGzeSbJ1I=;
        b=s6bGEzvK+TdkGOjaVgSdXN2nmaHM42ZBMaPQQ6/9MHiASAKEfV2fSikwvtW7v+WEvO
         T+1ka03kKaGE/RhcFMUnGJKUmLJJq+WsQSj1M41XCaxQ6Cdl79TkebJ27RN/N2UQ74pK
         onT5HB9lky6J1Z9+qkwKnk0VyKiSiTvtOPLY/12cbSLyRxE0XIMelZ+aFWyD54i67jLK
         dXQTvOneNqDaP0MLbhiR/BYGrBQ+4PKDbVpOdcEYlkYBevG9gC/SVsYhlpCxDQ3/jcha
         yUZ+yujKifRNzXu7EImWVlSHHI/5KsrVR7S9cTi38Em+Hf3To54jzkhox6HXy/zweLZP
         FnpA==
X-Forwarded-Encrypted: i=1; AHgh+RpJdBwc9EtgxmWRemvGTpQKDV8/DySCJMtOse086ReesxfmtKk7yp3klD0cGkHrARiVfD55PdgIld2rQbFK@vger.kernel.org
X-Gm-Message-State: AOJu0YxiK6rzSwhN4cDyIyKpO5aF/BOpKc1pr46q/qNB/EXG8+u6Q7Lp
	IYeef/pthc0ai4bd/5raeLvq4s75S5rSZMobirPCWJhpqxF+JQR29/WB/5iBoeHO2Fsl9rF/zDi
	0rZWVwbv9z/dj9tIUcgaZ6s3Y9Tl5pzVTOulpIgQuCpOqMnAPSuBZ+aYQJ2XYiuj5Ve+W
X-Gm-Gg: AR+sD12adCK//T3AOXJc7wfAF5FaTsFiQPJJns8iFbv6VLBNdtA3nUN2xiT/Z5He4eU
	+yx2cd8N2senzCK5QZEXuY7bhbbuJKZsUoyFCEQEOL6Z1y7uREKo1JXVF4U9kRf72ZaoXWvTi+x
	xFdXl6ubdMKq3EsCM28A7eWd/DzTawaE0BhGus3ucDsEfDdhlVFiiU2RDdKJ6p0VnGAoJIKEVb3
	BzxwslWMUG7Pyj/UJJogy1GiYi0Bqd2sg+4jViLpg6ZSshagl6RslOSfDgcLamung2KH8iYcOEv
	Z4z4Y9pl3x8LJ0s7wvX/A8P0sl3Ng2eWt733BXFm2tPMYhQgzhHx3RnMj0gbclakIAjUKd+fWw4
	6+Zllk3tO92huhDuRX2zdGuTc
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2268341885a.0.1787050248428;
        Tue, 18 Aug 2026 03:50:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2268340285a.0.1787050248073;
        Tue, 18 Aug 2026 03:50:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe7bf4fsm166717066b.5.2026.08.18.03.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:50:47 -0700 (PDT)
Message-ID: <cf3935fb-2aaa-4944-b879-9d7ef4927bf0@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:50:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: sdm845-oneplus-fajita: Enable
 speaker codec
To: david@ixit.cz, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260802-tfa98xx-upstream-v1-0-4dd55cdd658a@ixit.cz>
 <20260802-tfa98xx-upstream-v1-3-4dd55cdd658a@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802-tfa98xx-upstream-v1-3-4dd55cdd658a@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfX9EgrA6KhVQDb
 /JD6OLOhfhFFrprdSLIlBzotTJPDz7r5OlTGeFo7crRAT1OcA1tStXY7vQ/b9VKYVLJv8L4w8nA
 xCKZC8a10w/itRY11JCBIl/e2+dFpr99rG31z424ApeK2sE1xgcXwQcAhnm0xAn05FdMNhS4Xp7
 D2ca0Zlo4jmBaPYts/UAzq86TwbwAwNd0uVOyarZYzlMLM7iAmJFRtrBDmyL+jDzI6CgeWqkJgP
 hwra8l4MxcY2PSRvSVpY6tjv9j5md5Lma0bX/Vx0g+9yEl2rnxpApxAnfTGlliU/5yVE2f3hhSi
 TDJS+k6ee3XZpyNzTUu8UfQTrbYvT/vbuVb4w+0Qj6ALzPivdYhRegnEskLxUyVwFT5GBW9y+Q7
 kBAexxaqbb575qpLzzahH4ELnDHnGFy+sq0EEyFGtiU8ZMeUjC600xQCmXVkTlftz3dBmNJs3/7
 GK/hqLxDqxUBTVVW28A==
X-Proofpoint-GUID: saaDLsgV6o3FD-CueqHVd1qdypY5sp4K
X-Proofpoint-ORIG-GUID: saaDLsgV6o3FD-CueqHVd1qdypY5sp4K
X-Authority-Analysis: v=2.4 cv=GtlyPE1C c=1 sm=1 tr=0 ts=6a843909 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=xXM3z9AiURNY_ivmdoUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfX9K/g8nhuwhuQ
 FEWJMh2KSruWT3si1hy7S8uSFzc4To8RKhTfbR/2K1YJ0soqbZPHKEGwFj7WPXz5P+TQKvQ5+/J
 IAcFSk61i5UzsuPS2SpbnMAUMRJOa3U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180079

On 8/2/26 2:42 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> OnePlus 6 uses NXP TFA9894 audio codec. Enable it.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> -/*
> - * The TFA9894 codec is currently unsupported.
> - * We need to delete the node to allow the soundcard
> - * to probe for headphones/earpiece.
> - */
> -/delete-node/ &speaker_playback_dai;
> +&speaker_playback_dai {
> +	codec {

I'd rather you take a direct label to speaker_playback_dai_codec here

Konrad
