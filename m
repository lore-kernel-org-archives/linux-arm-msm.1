Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2634078DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911795; cv=none; b=sWi6rctd/MeXqagVeQPc1jNBobwclry837tPiSkcsaKeqnYMYzWgg1sWi25FYL4PI6cP0hRBpxcj4lsWkhGfPqcs+fsW1YiSkvgi+gy/njLhp9wX+9vhDHShL47wAW6HFUlnK3wOqiDH1YFhNMLJPUQnl2bGSTT4Df6og8ASF4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911795; c=relaxed/simple;
	bh=q9/WUDpjYACV3HQ/MPH2I2FsGG/LC/18uhjOtfrXDQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=n2HKtBOj8nSB1QuL5E/7vKAswgJFC63Fq2emWvhXqOs4JCBpkgDx2eiDE/3k7a1AhUfEWwfhkPhDAbG9a7FS/ze8w29PGIh/ycQjC8bED3CCWMjJ6hdjJuCA6QFBUfmi+ivIHXY45vJ3yU2PHmvK9NbO9poU04Zi5MhZX6LbGqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hauxVAet; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqNNjYpE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hauxVAet";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqNNjYpE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7qts2152710
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qG8w98LlfgwYM7+PXIbKddA2vCkTh9ZYKK0MmdhadGM=; b=hauxVAetb3lsoUN9
	4z2erfwsTb1R6DNRs5BJax+nZqaXWFkvQ8lfPp8BTo6iBf/lWEXmRk/8P3VVh6UE
	n+EJNn5pIQGtXiuXgFKRKzG5SnUgPj9yxxjhaTbcofP395T3ieswL5bkB3PZsX3R
	fdUd97XaobG5nm/pMYCcvxjhdY1domnCsTjNfsHsX8YhNLOMfH2vrOzfpj5MSZ8d
	KabBF9UDrCtFrlCUbGOpCdITlZrHAGLewOx5S6O1C7DkQik8YGYhGmSAd6G+f970
	nR6J1ijYpI2YoOXoY7WkwsBJDhuOCMLUJxpdJFPEEIISeTE3KbjHC0BBtDoOL9OS
	ZFp4AA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r94xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:09:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fbd0f0367so1135871cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787911791; x=1788516591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qG8w98LlfgwYM7+PXIbKddA2vCkTh9ZYKK0MmdhadGM=;
        b=hqNNjYpE4S33+n5+8LvP/I0y/TH8i5HE0gGnM8VllG3xFTFv7CynpJlcwXfHO4QmGN
         KG60guZcGrVQM1/xXE0TtOtSkVdYw9wryQrQmdoh3N8ivcvO/J+FFQMsd5rl2ueKpjn/
         tCmXeJYP4SOnJ0UEhb1K0JivfK9nrPAumvHPRTY2GsZ1kEuD1Z+B6RsCy838D8zS2yZn
         n1o0bae9BYawk0PlCEqvGT1Q4IJ9HsNjy6AznXY6waEfAAuZoxbVUsO5cPepXrUfozoU
         qJDRrUT5YW6sN5Gs8OHH1oIt9WOfVb++vKdgsVFyXRhBvPM4RwsrH03WvGSVEVwucgQh
         ajbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911791; x=1788516591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qG8w98LlfgwYM7+PXIbKddA2vCkTh9ZYKK0MmdhadGM=;
        b=kgJg1lTLKU5K7ygLaNG/amqOE3pof1urLjDWQQr6ksD3vFA7GOgqJJZ+/kNU3r7ZSV
         2JbL9DeIGeeT7XVikG5myyD/Cg3cb6Rm1TQw01EZ4o26fh3Ozjgt907nQyuIjMSAz40H
         6UxdimMHBZ1leOxoLaw6IrsE1cgwZxAXhhV6CGAbC5/Ql5FFojYvBSStK2T9AhQIFCnX
         6CTLvQh2xFMB97znUgfD+mRZRZc3Rg2hrxCUsYZZMvGhFFnuoGHIfjLYHMeSOeydXkN+
         egaT/ccmtkczIQSG0ASJBrY5x/yvAWlcaqEGstf2lvYEuUgjXvocgJYYELhUmtxkYKGi
         8NqA==
X-Forwarded-Encrypted: i=1; AHgh+RrKISMAiOIjioWU2o/DX76YosDtVbvePZbAtKXNqYoCyruKGDJSkp/2ZPQWAdVVlrO5zdU4FGne/Emz6QrQ@vger.kernel.org
X-Gm-Message-State: AFuF++nOV8Ss2zmO+tjVH/h1KKd7kJyB9/HhLpdzIse4A8/mNKy4qZC2
	l5AHPdg1WAxq0jL6Ux2VI5cNKj2+XZ3rvuLoo9tjoEjogm17kDX+ejfRHh0qho+zmD7/X8Xz716
	QehKtODdCel3TNL5o4ITM92qJDyGsPOTWCtxqZAPxeL177ZnwUkpMV+FV4NFWG8HfBDwWOnBs+M
	/C
X-Gm-Gg: AR+sD10Jvjb+nVVUTCjZKzIxXNG3Ys7R1zE/ZoyS6eEL8/m6jTDEnjg6Cr87+hX0sSx
	lD1YvN3hHPB2EXcXDK9p9QYcdCEguS/DQGeTPf/RF7BMAHFK7w8wFoAzcvTH4hdMQuQBallue+T
	CV1QnIh+9KCBNFEhf4TlY+TJ9ohncpRRjbNjiGU0YddCfbE5RiKSLWU3TRmVflnrFloGfKdkN9v
	nsV+sr3HN1pv2diKwnhgC9i5wQZlRDI466bXvUasoK9KuQcQbPjlSqVEpW2NhxmZjCiduz/q7N6
	1gS/HNdQb+8hSYC+hzoDKT4unRJ+fE9X6ARuITJSsMumdkLT7uxB+4uLKsGbE+iVvTiP7YjtR0j
	JsWAF4Xc8iTiL2BU9QBgIP8c=
X-Received: by 2002:ac8:59d5:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52fb9667fb6mr42774581cf.4.1787911786626;
        Fri, 28 Aug 2026 03:09:46 -0700 (PDT)
X-Received: by 2002:ac8:59d5:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52fb9667fb6mr42774201cf.4.1787911786266;
        Fri, 28 Aug 2026 03:09:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c389aasm389350a12.14.2026.08.28.03.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 03:09:45 -0700 (PDT)
Message-ID: <3cc7897a-deda-471f-abce-d3e2fb6ba171@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 12:09:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Drop redundant
 status=okay
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tYDQln3W6_ajYPVbIAp-v1Bk0nhpMVeP
X-Proofpoint-ORIG-GUID: tYDQln3W6_ajYPVbIAp-v1Bk0nhpMVeP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX6VHUkQlQ3giY
 +XdOkP7BQZ7oYrFj+zronLZTvQOqZFxIhWwlE+Vn9Y50++sf2dxMbMGIW0+816nPd7Zrk9P0pU3
 2OhjlCOk0lMapmMT5/dY8u7CvlGs54ZPvOKsyaC3IUWUcLxzcO0rAn1L0YOrDR3zXmEdj/EP5V+
 RJypVKgER3edZoxqsR20zQPL+FDiwEiGn4tTgYVZy8M5BZBMAdZKtk0vM6RSX7CaS13cc92IvNy
 qAVKzvB0xwI+yxeWAia7qXo1gq94wcSDWg4jj+EgMtlS/2SsKVmXcVELGFBPvdZu+ZNX3cvaa9h
 yTYK86Xz/w7Pvw17wSd/kaOZGvFY8v47o35LXYBazreM58hhGqBLsVsdifX8cUg6Jpuqr+YxUTM
 F43RhuNPQJUmE73Nya0y+tV9hHLYudbqyR4Cexl6EknWapWChsPzK+6xKD+AKEYndgSmaWqBzNn
 z3Se5OwWfwKcBZs004Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX4udy19f3YKVH
 6VqgYt6XVN3ryscj8qJU2DnkebW6kxycERtsPQC7DY4M0IcJLD43QfQTKZe3PfKC3RQeBweTxqi
 zkP3sKiLAecQVPx2CgjoOwD+dZMQbds=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a915e70 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZOeRlPTctedjAYETTS4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280086

On 8/27/26 11:50 PM, Krzysztof Kozlowski wrote:
> New nodes does not need to set the status as "okay", so drop one from
> fuel gauge.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
