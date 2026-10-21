Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572023;
	b=5Nr0W+C6LhmyOutUdNW31m/bGwxtmXgSfi5Kucqs73azXsajMTBjeoAbgsKuYPc9CvdR
	 IwQ3uB/seJXEaEi2SGWYhWJyC3OSAU+JmzWjdhbytrtfYrmG1O6A26JboM4JjH9vfT1O1
	 ly3uiLIyH9Fu2Q+8I/m8o/AVEIZnJagU6V5TKsZQvXWBMVjqVyuN+QlC7Mp0GNARhiNLX
	 K++MduLbNZDrXH9GisgyImeDFI8MCX1ucT86SLAa+lesJ8gEhut3VqBmdnKp4Qelp4pPj
	 W7CpCGTfLMhXgffgvOR/X5yG539Z8DNjf41xms1srjC/Ug21pjH7HmI1kj0ukMvCqgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C5ZUKiEE5SuzhMb9ieLfubEULIpm0CDUWQRF/Xp4ANM=;
	b=LPZ55MgQjn6zUAh2YFKLK77GTO41ia7F6e70fx29L8NuHIcl6WsWFEutrjEYQYnn+B0a
	 QRxwNHA17lEzmG1qLwRmaQew2c5beUyR8BD4tyCgRTqY+DNss7Qe3QiJT01PtrvTDaPcK
	 z12rglovDltnRzJZy4G8wFZWBASp6836G3J2TVgTtx9W1OnkM7lue1ZAuDrkeYt5cUaIO
	 IRarto/LNIHASFN7mDiaTC70gAlRtK3t3QrK3ZNpKTHkdVD2HjlyhMX7Vzkpiyz5Uko66
	 EOReuikFwv6GIxHjqKfbw63k6zPFSBusELLOUF0v3wnUGYZwsKTLdAosWC2R+X1xIXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5esj9t7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Wgqfeq/1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F3060A6F6A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45F3060A6F6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5esj9t7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wgqfeq/1
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j3s73926605
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C5ZUKiEE5SuzhMb9ieLfubEU
	LIpm0CDUWQRF/Xp4ANM=; b=J5esj9t7OVLPLsmrMXQyNvbhBB3cAqiQdfN0X8Y0
	D2w6UGXfEpSaE8rMoua24Yml2+0nKAsdmE2xWVcMBXybcDjcxE+6vucRhm8gQF4u
	0UfQJKIALSV1ra6rDfpHhX4JxUY30blCRYbq91VoYOOLruNWgF9T3QYeudX3FH8S
	p3bJa1uxMeh/+qkec+3pqWAEAKznxOnuII44P6lJ9irwEtBV2a7cAyNAoofr4lnx
	9N2PAnIGXlIVaJ4HM5y6ALPFKN/APvlh+YJn35sNHdTuzawozcYEoWmdwuj1sX3m
	81ciQd8p13o5vkiCSkDbRmPVEPaMDzIdP+YWwvNwm6Aa8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2chcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:40:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso90781085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572020; x=1793176820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C5ZUKiEE5SuzhMb9ieLfubEULIpm0CDUWQRF/Xp4ANM=;
        b=Wgqfeq/1lmH9if0teOjeKkxp8HNLVVcG4ba7M+lrkYxzTB07oV8zYhoqT2dMMblU6b
         6iEbDuYqRgG21zebPceNPOWBJJIyPJLx951ElLnS1Squ2Yk+lMmKa6E6Qkr4/G5zCn5y
         mXFlrVrYB/1+F8TESX9pnJg+zXB3EyH7LWFgO+M3XEpktWnLcX9rMy6hGtvns0PDgvSo
         50ayF3u0DlvIdQwbzPYAAV3HXRlbl+ch/7pJIhS5KlBWCHfAZok/if5QHcR8TCSOb2e4
         8u2DrDawluIjNDcxLUmmqvJMg1+qk6EHKzESbIDKe5LQbnMMautCvsEZIr7/qidSdlYr
         hC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572020; x=1793176820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5ZUKiEE5SuzhMb9ieLfubEULIpm0CDUWQRF/Xp4ANM=;
        b=bFvhljpIbJnMqy3qZASYTjH0mBCfWHd8oO7ZeJwaWAXDqhlaggsbyjaTGlDiOoTVs/
         H3dWfhGLzeOLD3u7v6lrtfK5dgpQv7lxoaavGq4lr75yDnSVKlViFHkXbUMXrO5AtBrO
         oLKdLSE246odi8um+EcNnX+N8yJy4eH3kvwupewmbn8wlu4J3/Btgy7krO1deEGrtpvb
         hSpUp0d9JPm7Zbqah2DeGc9rYxmud0NGMQfk5LTH4CNAHAwzlA19UsPpb0Ng82MGwSz2
         i8csDiGyAFDk3LiS2UKXgLXvKNNhLwSyB0B3P2jQo454QA2aGb7F2Qz0P8jzoI/BsYFT
         IFWg==
X-Forwarded-Encrypted: i=1; AKwUvBwjSgH1r4rt+dwye8qzxsuyIi3nJSPE9oAQTBhj5p/A9r6M5+V/entuQNRYJtHV4+MJ84RlD5b/CmIwEzFq@vger.kernel.org
X-Gm-Message-State: AFq9FYK7HOsCAERs8Og3/6LikAafpD0Q+tRHjvM7CCqp8Md4ISn/L9Ia
	R8cOsfOpIfx6+bZdp10oMd9S4K6R2sSD3298xFXY3paR1FruJfNtzQMYF+3tqX0iRO9g70ulAdT
	bJKtP4KZefQFwTjIB3ORHhXD+sR2mxexPYwH1n1s7cg2xGHXBIAIgD4VqTggYm4JJtfvi
X-Gm-Gg: AYBFou19JoWZ4azXMjV8RN2JKaZ+30v809i9F88vWHsxvOnMO6+etfco7Rnb68qe7vi
	vY13yAD93zDEq+cXBzYswqXrvIg5h+dd2K4LYsN40PTCib4eDlSOaJOQbOTAI8ZwidyobwJYxdF
	Gxn+IL/7GmCoAOJ2G+3p48ozZSdRSGptvHr9kcVB21CmbNyQXsdy4sD1NMDAbvlUpk1ecIvVx4Z
	vP5jWpISfRbHZtPmrnLMd7rvkeUpdj2/5MoOOkrjB4FTVWHd19QE/JZrSqaPPHD2YzVFtMwdvq2
	S3FXnzKj4Y2F4D5eN0dDkC/ZCVBhNwvnzhtOmKBrtZAGNMhkTSnlU1zSzIjBSO07YVEk5Eg3qOc
	ts7Z01hMJ5vkLeA6m
X-Received: by 2002:a05:620a:261d:b0:93e:fd69:9a93 with SMTP id af79cd13be357-93f57f84f2fmr278266085a.31.1792572020332;
        Wed, 21 Oct 2026 01:40:20 -0700 (PDT)
X-Received: by 2002:a05:620a:261d:b0:93e:fd69:9a93 with SMTP id af79cd13be357-93f57f84f2fmr278262385a.31.1792572019672;
        Wed, 21 Oct 2026 01:40:19 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d41c8asm134142735e9.8.2026.10.21.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:40:18 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:40:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sushmit Singh Rathore <sushmit718@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: qcom: camcc-sm8450: Retain flops across
 camera GDSC collapse
Message-ID: <lhszemddes3ettau7brxfaiqe7srrqy4mfb4coxtlclxsavbg3@jk5c2s235wkj>
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-3-sushmit718@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020142157.1749-3-sushmit718@gmail.com>
X-Proofpoint-GUID: D1vfA0PVPRMSgpEcnTRYIfriGBoxE6uc
X-Proofpoint-ORIG-GUID: D1vfA0PVPRMSgpEcnTRYIfriGBoxE6uc
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad87a75 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cLpk0Fc0Ve9Y1kKZFIQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX6ZAqmZCmtwJs
 hdF3mF0FsGGzW+ipG5xhcOrp+ggpu/BuFXUV3HMJ8RMci255PphrZDGeOhWyBzSlOtmyD0ri8aN
 yGOco0Uf9/5QSyNJgyFPmIK2i0Wi0p8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX6jJ7XuiPiu99
 p4S7GCdksHKW5RCYuNea0Gsgjj6J+9aQyKWNJXPlLL+59nRy30z4mlX0eoWntBb/OMaIFFGIeWT
 0m5uz4G7piTU+z8u7KGsyurHumDcxpZUW9TK9B389jzntc1aCVNMj4e2KCI7iGIPRpwe0C4wQa2
 bC1ni4jUWSsGkxO7oL6plEWlZwevh70kEZy0wyI9r1hbMHaYNhLYBlkF/EAhtI3/vLlMA5zo+V2
 mLVxV+URPKMM9GSLOZZS6Lb5D66nLZtP4V9eQk/vnUX3Zd0vlJXafKTM3lm6/ccZEPWh6yJ5IES
 ShXEqyZ+2hd99ye/XLROK9pKpU+dY3iJRIaxKtYgdPsoFwXUrYh88AOPRgWyiXtBrBmZeIptMIS
 Y4PZsc8L5Bgjc1bb6Qg2rvIbWujDyOE3tXrIkLr3BNJuNqfrfEh00Uf27M+/AyOdBkAl67eW1eT
 Hbg13u6JuFUcA6fCLSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 26-10-20 14:21:30, Sushmit Singh Rathore wrote:
> The camera GDSCs are collapsed between camera sessions. Without flop
> retention and with the default clock-disable wait, the IFE GDSC can
> stay stuck off when it is powered up for the next session.
> 
> Program the same wait values and set RETAIN_FF_ENABLE as camcc-sm8550
> and the downstream camera clock controller driver do for these GDSCs.
> 
> Tested on the Nothing Phone (2) (SM8475) by running repeated camera
> sessions.
> 
> Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
