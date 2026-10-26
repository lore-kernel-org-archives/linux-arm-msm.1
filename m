Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006535;
	b=V4hmRKFgGbfVnWzP6qspzzYIp0P58d6nVvN8ROD2vGCAeouM8JK1UAM+lu9Sgknn4Z9y
	 OFyp1MIJwc/VwujJUidmbYXxcWtacMvmK1dqr30F9vVbF+R6QM/gWUVaCkVgnsOPGg1m0
	 C/ZHxSniAS4p9JFd1v35hxJgg7nWX0CPk2CTEp9j+jCc7PjRJnUeUgZLPNN48PwrRNPvV
	 85ukNDJkISOefkkDpX11Zp919tn32a8C9JK3y+DriogHRxWk3KjET+ZNKdwBvU6TVWOK1
	 2UN0r4UGGEI3eb3scgTWmm1v5f3bBVbp1nbROCwDFKh2N0P4vRAIxIX4bcQ06sclNWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iBHz0YV3YdiXGolaXXLrTp8rFrwcwAaKpHWy6zk0/rM=;
	b=n8fK6rVUccAif3v0WGeYn2m0Qbf0zmp7luJw9VAFe7//cOZTh0q0Lk5v6qAR7hqErWTF
	 EG5cTjsiDN+YUQhZkZ//3i4aWtoOs/J8lL9bnlcax3VxVLZ/W7fU61qGyYS4V+8OjlZMQ
	 hAgwHhX2r6PgwNlSN0AhuzGIzgrd7GLQOCutQk4TPUEBYX5c6ohN8a+expog9tygeVyul
	 vZ/5FpC5kMGOb+6Fub1FffiTONmxNC8B8jQKmxofmihSl7cQSCBlAsx0ZvgsQjLZhaUMX
	 H0pLxUcV+8WUfNVd2bWzX26QKD2PbasGWZ1ucSKRfs3WW2E01UFM8G5OwO1oq5lwsHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9CCfkDH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XKbFVwqh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA736606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA736606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9CCfkDH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XKbFVwqh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aQui3300591
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBHz0YV3YdiXGolaXXLrTp8rFrwcwAaKpHWy6zk0/rM=; b=m9CCfkDHBtQtvar0
	NYfH7dg81uQPVwzS1po3OITBRmUfqMcPwOo5cWXJyjfvoXUoQNYe3lSx/ObzhQ2e
	Ch7m2dCfokKZPKrkU4GTRz213IWkhyTHfoRcss+h6wVIQIidhaCVk1hZttIpvvIq
	9qoTTtKleoaH7M/pp3UV6nnngrJpyWHrrDyVcG6M3eWd9/aVfKRyAhgnfCzfInNm
	Lfu/Bkog2SmK8A1GZXAsXx7/GSosAqAkK9PfLmoRy0exxp1BgtM9zDzdqw8XIeAJ
	VsN6RIFgHALZX3oIeQgiDBjmCLRzdSfznhVGLf4J94QEs5/0K82TaWyoTtKTEw9t
	C6AARw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpspvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:22:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c008df17fso8486006d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006533; x=1793611333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBHz0YV3YdiXGolaXXLrTp8rFrwcwAaKpHWy6zk0/rM=;
        b=XKbFVwqhA56HghU2BNW5hlrXHlB7ACKyymL6H03I9HpoHsIpRDaAGrYEsBHp6Rai/d
         H5x2oDx3Sszc7Q5Bl4Kn0PwWTgPmSkIiKm6z3qAx7IQWZ52AHYceMQkKLKjkbKgxVubn
         mJNuw8sVl36J+SpOYl+yexWVYoSoTw1U795hj7ZzOyGFQid4/ccz7ijtszkKhS/cXjIg
         qNUOwm5J3Wm/mHzeTME7o9e+jNZrz7d1gGb0ZCi4XErtRw9QDfom9gcLiuUYwND4R4qn
         2cp8tTnQYuoNZeEo7XV1wEBuR5kvNSTLvpWvlzoaIhhyxhAdAhfQG06oh2mIvw+G85jD
         w58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006533; x=1793611333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBHz0YV3YdiXGolaXXLrTp8rFrwcwAaKpHWy6zk0/rM=;
        b=G+0E6B5dETlNyZDGMLXTyYtRRlP7II3wl2rIICYZdacXv/xqdUwNJ6Kbm7vca3hS/V
         rIkqYa82EWtdQZBAC+/Ur35BwXEXLZoLxBgXrdi21c2xxLmBsV4PCtCO1WdetF/+yvjC
         nZHYxHo1l8vFw1i4mmMl74mhRSKBNH9A5+DWvEoc9sIhe9OqNWvS0+gmYxb8WYhLhVAC
         OGLKVi7cR7a7yzf/yTpCShsGH7OdT6LrGkvQ2Js729Q68L6hN+/GfGjXRbnq1sIL0YM0
         JZ9xunXG1kqzlZ8LBifwuKDCCMMM9wPBGskpixGs0OdxMWYszw7mnqFRo6fcRL2Inmz8
         54Ow==
X-Gm-Message-State: AFq9FYKUecws/SYnEkQgBREO+5LvlZIkiegN7c5UKILoUnd5QwpdWIRq
	6kTBxcdntMpiQlb6T1xH716XtFciHPYnj1H5YsK34uWqGeD9L27YJwNGH3I54nk8fYnOKn0mJLh
	ZPauhFLQaOAdGQl7vxijH9FpgaowuPTo6FGBQcKkOzn38Ptdv1JV/fQLJGusoURJglWTw
X-Gm-Gg: AYBFou0I7lJLpBRi46rwpfVjKDBDhjOUm8pQQzOQrwWFIp1rzPnWikTyw5jjkUzBuaA
	9OiszzXsMuHS6JurakrDhDVe9W3/E9SuatcP2FuQqE5YSe9gw6ybxGk834XoHM4LQeTUb+f4AF/
	gesomuHc81QFaiAM59Vr+VT8T8tKP+63axf4xtmeyOsiXI8RyfvMBymRttc+s1ijVUd0gpO70lN
	s/6leBnLQPoLeO1vfMbaW6dx+RRCJ/OvnU3b30xa/Sw+KE+kWMmNnSl5SGZdUTuCO3bEb8g56qy
	x9ScWcNPS5GBJFCNYslrQm7PrQHVaEmkn63bBrROxW4Z6w+ISqUjnX8hsWZNuDhJb4zvE0Vijra
	CvvLaDZ506WsvUZw/FGamgA==
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr947657685a.1.1793006532728;
        Mon, 26 Oct 2026 02:22:12 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr947656285a.1.1793006532304;
        Mon, 26 Oct 2026 02:22:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4992141068sm76044666b.60.2026.10.26.02.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:22:11 -0700 (PDT)
Message-ID: <a2905078-a7ca-4241-92f1-d4d2b0de3984@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:22:08 +0100
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
Subject: Re: [PATCH v3 02/14] drm/msm/mdp5: forget the hardware blocks of a
 previous bind
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-2-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-2-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX0W+RNHaQNFDg
 0YcPpL+TlO2kxSCu/GGowgupsYxis25vWPsGcxN1pOkm/bHGrpVbQWH2eMce8qK2ENeRIn+8Suc
 Tq1E2jfqG32Ccw0XJWVFF11WbpZQIhE=
X-Proofpoint-GUID: mXp0XCdZA1LgCd2-DjQEGUqy7qGoJes-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfXzU8L603R5zs1
 mqkJZyJ6Vkja21Pp17HDdjGR0Kl/aUoaUMXWm1PjJjsyG1fra0G4CI/gbflXeLE4omtL2euVak3
 U4YM1Vq0D/WKMe/bauC8wQy4j8KWRjDCQeuW5NEfd88TGAyKIUxJjx/vwCdPkOzGaIbGJ0KpYpn
 V61PDPvPEEYjdKKIXn/MeaSqBYHBadAj+9i+2lgvE9oie/LPkD/MIn/WobXc1QCmMVZS2WR1R0b
 MfkOjw1K2xJYY12G6qSKTLrfY6IBkYhz2xVy+UCg8lishJC6WWzgbQfPo1hUGAtdkTLXCCHEMds
 ow7MgocvP4TLHkm53FzoXGWUq9b51xsGoa9ZXDyuaOOY3Wt3ggS6G6PFuTxZXK2QWq4G4C4kmtd
 X4nMhyNjYeE7yHaGiAzQbmFcS/ESQtrFB0JqIMx3npnnOtBmGxHtF47P/XomIM6ZGPc+1O5BpTb
 fyDcq/PQyHVIiCEFNQA==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf1bc5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sdshgxurkjS-ratPg-cA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: mXp0XCdZA1LgCd2-DjQEGUqy7qGoJes-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260037

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> Binding the MDP5 driver again, after an unbind or after a failed bind,
> corrupts struct mdp5_kms. On DB820c, binding it after a failed bind
> oopses in hwmixer_init():
> 
>   Unable to handle kernel paging request at virtual address ffff0004d411f9d8
>   pc : mdp5_kms_init+0x264/0x7f8
> 
> Since mdp5_kms is allocated in mdp5_dev_probe(), it outlives the bind,
> but hwpipe_init(), hwmixer_init() and interface_init() still run on
> each bind and append to the hwpipes[], hwmixers[] and intfs[] arrays
> without resetting their counts. The second bind writes past the end of
> hwpipes[] into the fields which follow it.
> 
> Reset the counts when the hardware blocks are torn down. The blocks
> themselves are devm-allocated on the MDP5 device on each bind and are
> only freed when it is unbound; that leak is left for a separate change.
> 
> Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
