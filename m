Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE2377545
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 07:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345719; cv=none; b=SDWph6N1Mv9lazyPgPhkVcyyFkv8ZgIJG1uiMrkQDx8yqRxJDv+KJ4e80QFa4GD4cHIBnbnxHZjqx5vDZTrPnecwj2IKh3IfnCVulKXTsKev7XtQHmEDJD6X3XbNMZdneM0m2xDbtUOM2k9SFhPxczI7NKcGpDiz/A2KCuF/quI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345719; c=relaxed/simple;
	bh=rfaqo35UnAQbSuq5negAPuaIjHmCU+E7jJcajSKLFPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhQCnOBUUKTiZ3pGU5W7QSgt3a9RW2WNLckXifbfkL/vg6k6r52mkKm+SHbrLUeMfI8yk0laaL55A+TeyXLM1whRmlr/OzzPjfmXs2yKl7kGZUcp6TxU4bOZOXCgmxgtuEAjnrUZvkc3ItPVzHELybScdm/n4VyiY1NfIOo9N/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ept3EH9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rx14iRE3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ept3EH9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rx14iRE3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pdee4149912
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 07:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yYsHAZ961X2PVc3jLn/xzL3P
	CbmTI61pM3ayjaylxrA=; b=ept3EH9dESBFg4pMsxqwWCJMiiibHBPYDePxnKKA
	Kco8cwZJP6lDxPPK6vE3uEyExlllaAqVgrWXvF1jotglgzAZ9Pk5nhejcz//OoSs
	gS1lvr6c+dDzJYb4HTYtCZUw2hI98eFMt0qySfSsnnumlQdhAuxjaNX7zRsZwr2h
	Ke58Hxtrltpl81Bi3aHBVHBt3iVthPsSp1Os00ywMlRWh0zZMOERyQGWfjXqkM25
	m07tB3ogsWdnlQCE43j5MGkBSV1t0SInYY2HhFuLHpabdTWmOwZIlPCUKU3aoxWe
	brumCSBWzgV5/lIGSRsCHP/9uBQdb3XFrrJ/zQLMYWwolQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v907hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 07:08:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so17311341cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 00:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786345716; x=1786950516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yYsHAZ961X2PVc3jLn/xzL3PCbmTI61pM3ayjaylxrA=;
        b=Rx14iRE3JGtMGnu6kC3cFO3Z4o/RLPxOPgx2iy/Zm9IfD8EW/beokWE/BJn+By+6CN
         mdO+5Pacghxb7CaT8r+MGgf0++BcHrY4kcb3N2A6lF4zDzj0hiDlkhy8t6Lw/2/hg93a
         B5vZ03Hgq/ROj4tBapn5aiF6zADzET1D2PKw57Gk5eMnp2PhtwG/XAIQInUHz9Q7mSWV
         pG8syJiNMriPMxDf4Pl6kFIoQ2+HthrFl/5RY7dxIyUOi1YLVLzs5pwChed+f/1wyvkp
         XSzAsQfOVbkYWNoVdD4kvM25BbliBHwZ+bKUuvoboFx8lITzrWYksAU/m3kYjrXc2y4L
         gX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345716; x=1786950516;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYsHAZ961X2PVc3jLn/xzL3PCbmTI61pM3ayjaylxrA=;
        b=E0NRMFOucB0B4P19ZChdcS08RP+bGjia/gZbv6YB5VIV3g+pmtgNXRlYq0JkDWrf3g
         GqK+AtZVUaEB7cbN1Uye/4iTDN3ox5nYVc2CoofEXB7sEg7MWz6mx3unfSVz7rjnz2T1
         ns/ZmSh6uTodXBNONEeSmKvhEX5oSsQSsBG8DFwrr9CGn91UGtyQcEdO5zzig7aa2IZX
         ZqwussVnYi5J5okqGPwQPAAKv/S+ogRnSQvPX50Snsm+0U8bj9YiRZzSpXMt5Es4OXvF
         r7CTtgYYyX8fr56LGijVR1K2/TPPTmyhb7PxVelLzPre434m8eS7KzdQDMImCbB5pnls
         kOag==
X-Forwarded-Encrypted: i=1; AHgh+RooeGNw0++A7lZQ28vS7waiZnJZjjjNj3oktEiLFdy9iLH98W5kHUD5WERq/EihgUa/dLCfDNFErG8UAtoR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/kFuANsiLAylPZp18Yol8K/iiHAa29NWz4IfK14xqmRWvzjph
	ukAr/8xgAbBBvMzFOgmIW43Yk9DLlLkW/UYtJFk3iFdUx18FWknggspEn9iYlYk/+dCerl+feWK
	Rki7nQXImHBfGKjgAaBWR8NvFFYKn/Wz3lpckjj/FART2SCj/Qij5oVd2t0ArHlWBg7SP
X-Gm-Gg: AR+sD10mI34KgvSnRut2sZSf697GpTyiAIl1mxoq9RbJAfbVYFKLaMTc9QS8eGptvi8
	j2MUvwlj8P48R/MTl9S3kJp0LwuPWB8xleJcksIdCcdJ7YI9z+3+ZiD0QqQzRzPiTX/ztYFl/2Y
	gfbWSJVatBqCOuHGt/e+ehb1IdKM+F3I9vIp4OBBT80YKZ4cIUiAuWlt9e5CeoeucTtUjEu7cZZ
	Q++VY7kT6DkP0iZR7XJYsoxvaH3eR479laYPLl/jkkmqpnlmu5BgRgPX94prvtn05Z0aZ042dDu
	WtD4/wZydOv6ISrT2PHApX+LpO6IGUwIvwC5Loq1roZwuZIlC6z0xC99NYZaCkDdXi4lwHJwXyX
	KzVt63qhwJJmT9SVf340HNGGw5UH0L4YL4Ea8NbIdHrN+cn64eTFpdb5UDItXQrIUKmg9hnAQpQ
	bhlmpBT1Z4aV2KTg==
X-Received: by 2002:a05:622a:614:b0:51c:164b:b240 with SMTP id d75a77b69052e-52ce5f61c7fmr410327141cf.4.1786345716154;
        Mon, 10 Aug 2026 00:08:36 -0700 (PDT)
X-Received: by 2002:a05:622a:614:b0:51c:164b:b240 with SMTP id d75a77b69052e-52ce5f61c7fmr410326731cf.4.1786345715771;
        Mon, 10 Aug 2026 00:08:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055dec76sm1805559e87.50.2026.08.10.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 00:08:34 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:08:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: kyufie <imkyufie@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add notification LED, vibrator, and
 UART support for Xiaomi Redmi 5A (riva)
Message-ID: <7jkbomybaykrwzikmnvuy67y3dmabzqkuwjm2djtsnt7qdwkpo@tueelmvqam4f>
References: <20260810062611.735673-2-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810062611.735673-2-imkyufie@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA1OSBTYWx0ZWRfX67imc/lyS+fH
 MZ43xydTujYc5a5dDgvFR2I0Sqt/EtMX85o6ZeDcgjZVt9UunzNTIxhzuTLsUjAojJ89ulS2TG4
 RVGTipY//aw/WqJqxbbj3XDU9IAQnc4=
X-Proofpoint-ORIG-GUID: 29-MvXtOwnOmCrowthHwPEqylz7siVlq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA1OSBTYWx0ZWRfX5bykJPi1B1Ga
 GZYkrKFi1FSTEQnhmz1tsR6kMafowrbIpT3S97XyikIk9Hpc9J6VbAj/KKn3XnCfH4vO7dTXs9v
 /1xkd+iwF5pvk3/A5O8jHR1wUNPtGoq5/kxEOrgXSVFbr+dDarZvi9Q4J0Di/SpNOx2FyNzc8GG
 RgGVz9y6VcD3mB1PHBvoLeT3qYE6hhjEwpSDjQxDLVEgy3/K72CT3g8cm0noyNNYwpFwfC/X9zF
 GR/2WTlyskCSep6vDYL+ZNHl2/3LdIkFSe9ndw4BxQeDGRKMS3a2bNMnhfVaDudrKV5SaEvqVxL
 ehYraxt4p0dRH5k2J0UaR1UhYk8dimAkZlM3cpNaeMKRundMg5Gl6PYleYDnR/pSnFtz+QXqlHj
 hl0SjqrnzkiMnvQR1rP5mFB3KOyqGgMpj+ePsxfJuecvSRcw8MGjB12ECfJlXISPrOPJXRyYxG2
 kvmsnaUKJYXhHjpgdQg==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a7978f5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=7Ty-B7y6rTR56lQ-UMcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 29-MvXtOwnOmCrowthHwPEqylz7siVlq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100059

On Mon, Aug 10, 2026 at 01:26:12PM +0700, kyufie wrote:
> This patch adds support for:
> - Controlling the notification LED.
> - Controlling the haptic vibrator.
> - Communicating through serial port exposed as test points at the front and
>   rear side of the phone's PCB.
> 
> Signed-off-by: kyufie <imkyufie@gmail.com>

This should contain your name.

The patch itself LGTM.

> ---
>  .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
-- 
With best wishes
Dmitry
