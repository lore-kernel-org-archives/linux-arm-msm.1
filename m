Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603938;
	b=X98ZXSQgGtK5ZMdAmWFHmaWSZqewRju14Qjkt0e9Bm3/OyD4QvIcvsECrOPPRQ2MudYC
	 tz5bhr03omVkwNbHrS8gkJBxxaH6g2qqWcYYAqT11vhWX9CVnl+3MPokpHHlT0lmU2Huu
	 3eID/jM+QbteQu0omO9YcaLG3EiOgF55Ele0/fcK1mIsY/4/EbCmxckXCapMb2C0nHSw9
	 Hnh8nrcsen0VgjWQ9grkD6Jj8UsSg0uuPmSbKsQ0Kxs/R7GcrPvmeK4blqej6MAnbOg5q
	 x2woyK/eKScuxoMVWiH07pX/vsq3YKk+7byXbaJqRLz3sluGdut2MLSR5rpF+hFWpZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NpIVie6xF9j8ExIQhEKGfRaZrPU75x2Pjf04bW71EhI=;
	b=OB/ktIGVLSXkazdORbnL04WmItF+5VtjVxT9j5ivxW6UAU4XB3PNgQqSasVwJitaBYWu
	 +0rI31iHdCY3zoxDvk7h+KCFDUnYhB3Ntz9O6AnHouIl7UOiWUj9GyIZf3BEReDW9fLtA
	 CH2P4cAEJff+JH2eIn5HhrBzJ/7sZ6M989i/otCyTcdhD35SXTitzv8AFFqTfU2xCngXq
	 I6ehzM6grFmutCAYbOV3CCgwZ3Lk81qdwEcymaXsFPaxTFx2FPR8bdSsknU7ngnqZHY9T
	 Dpvm9uxxCuGvffLIq4/21P+GLNr3UXNNBNZjSaDb5h4nHcWoYmuAGByeZbT9kRMcG/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kgLoo7Nm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1FHtjHj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D1E606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 07:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D1E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kgLoo7Nm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1FHtjHj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26plYZ3121149
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 07:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NpIVie6xF9j8ExIQhEKGfRaZ
	rPU75x2Pjf04bW71EhI=; b=kgLoo7NmGPUMf79aclnVC7a+EIDKD553uM/du1vM
	C8z9NHnE0PmvA7RUiIoeAoA1VN9msGaoTz3e3JI0C97bzFgV1l9efDDOJwKHs5GN
	Wh1vHgwqEPVhr5F5O8jlzZgSVtBGzehKrIxKaXaf1Dq6IynXubHXgW3Z8N1Fc0Ga
	y6P2BlqNcQMLMmOUM6g+EmZF2nopEf3xuSEkZmwbdAMr/8jOeKiJjMCUEPfbrGo3
	WmfksX+LjCuKm9rMTTpFGYZgmwgQqqHL8ytDKI8YK6PQklT1XpQUH8m18s2gTpMu
	aCfpWCdOgKJKbjptp2ehl3Munn5TBMt9KCR7TO9fATRlWQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmer326-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:18:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so3793587a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 23:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793603936; x=1794208736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpIVie6xF9j8ExIQhEKGfRaZrPU75x2Pjf04bW71EhI=;
        b=j1FHtjHjOqSNLuVzO4AR+CGjBnQFQk5OOVq7NAVmtK0hpIhIYwdStT6or/T4EtlBY1
         jn+3xEqKoo+O9fvVXxBHwXI6fWU1jK3Wfloo91ZrViV3V0LL2HD+nELbPbdFT4JH+2Jg
         r0dPkwWK1ywcqv4m5ivMGwzMmu7ujO0Vd2LIpDYSllKXJ3t2FJlK/1tO79JUGsh1Fwb6
         FAGtgUKoZH0CQeFEejk7X2D+TsXb1q6tlN/fOw0OsCCikF0bs4WBF2NMc0A9IwrX0MQq
         MOUQjDxT6P3/qR2SoqgbZecX8wbes3uyDGdri46waQ+6+O2R2eyThvaAdW67Led/llCt
         NzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793603936; x=1794208736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpIVie6xF9j8ExIQhEKGfRaZrPU75x2Pjf04bW71EhI=;
        b=L2KJU3JBawTWssaQfNA2l7tl97bNZeaqU+EEfJcEH3+2td3cIxj9wsjNdi35T0B3gF
         PTba3Pf3Va68z3kUK6k1WGw55zMRlrLfqrwIGw7qTEdFg1+uiU1PMe0nRyjqKKN01I99
         lHi5H9jUmCPDfG3FY+chTpPWiNDp7etfJ6f5+J2hO+ldbN5WlBzGT6OSr9Hi6ti+tLKM
         NHf4qERMcwVZ7D4S8zdTusZ2/g8aKsetlBJMa6rA1sdOdy9v4vOCvw7atEM4fFhdGhLF
         EgdA8AcU4Dl/+he1h7b7IbhM2kuAedo1hWXSnnHfLG9H9xMkdiMm59YmISnhcLZJi5Z1
         O/TA==
X-Forwarded-Encrypted: i=1; AKwUvBy3V1YrP1RiU17dAqv93QdYcPqe28WKVozww2GBrL2f1rXtPINBwfFLF8QHeFSGzVb9Yoe3YyAAigOMLPkE@vger.kernel.org
X-Gm-Message-State: APuU4Z/zpKgvaGbA4BNdq0PYFSAPf5f+M0SBTNaE3A7PE+ApufMZ4cph
	K1HnqqSR7ueSisaBDhrODZfumrA46IIA21SGfRMVhWMyp9Ax6VdVKBtRDykJ5Qo8u+r+FklWu/v
	Us5Sa3+vUFDrNMYDdwneAwSoTNA0xqdvZPSazQUhpr3lO3ER333PEFmsgSLk9AljzLC19
X-Gm-Gg: AYBFou3XzT90SpRzrTwZ7grR+26GRKCylnJXvPJ+fsy63LQ2/YbU1F9M8qFQxDDdPam
	UfyaJteU1nTLDLGfYsrbY+as6Oq5KbncL9Stpuh4Z0UwvobhBPfJrvMBtM2JSlGWZJIYpRXDz2X
	NDfYdpa0UarDgHmtJOVm8w7ZkSrYLwidHIHGw5jFeStWU5laGwvXjuOTgbxmBgEdxjQUrFu2KpT
	vQw91q71iIMdtArQYr00cwStIPmLKaVM13u5tpX1zkBOcD1ostOYQ7BJx6FtBQJlRXSPBFfNHNK
	QzvGPaE2u4oImVlw5NkDIrXZTgFS/Z7DfVHX53RDYfqAzQ7m3dYNdO0QZLCPxNBAATtOGgoBGS6
	ysOLxhja+D18SacBfnRWOwGYioc6wlXZT9tt9pyLJLkrActH6BpbEhveN/TCv0TRr148Sy0e0g8
	4WTVQ89YyB4VWsyQ==
X-Received: by 2002:a17:90a:d008:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3ae89188f68mr7619724a91.0.1793603936061;
        Sun, 01 Nov 2026 23:18:56 -0800 (PST)
X-Received: by 2002:a17:90a:d008:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3ae89188f68mr7619707a91.0.1793603935564;
        Sun, 01 Nov 2026 23:18:55 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae880b1f71sm7419118a91.4.2026.11.01.23.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:18:54 -0800 (PST)
Date: Mon, 2 Nov 2026 15:18:47 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: arm: qcom: add SA8255p Ride board
Message-ID: <aug5V-E2p5IvZIi4@QCOM-aGQu4IUr3Y>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
 <20261031131042.1200862-6-shengchao.guo@oss.qualcomm.com>
 <e5b53ac2-87f4-45cd-9667-91cbb45fbcb0@kernel.org>
 <auf2FHHbto8lAf47@QCOM-aGQu4IUr3Y>
 <ada2ca7d-8759-4e30-b945-f8d0ca05b74f@kernel.org>
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
In-Reply-To: <ada2ca7d-8759-4e30-b945-f8d0ca05b74f@kernel.org>
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae83961 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=L378qgYTX3ev7UouER0A:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOCBTYWx0ZWRfXwl1xrauXjUWP
 T0BGSVsXsPnUWD+2SHCM7rmSB0c1zLh9UgP0SrwYHkOIZqPVr/TgpPOaw/XnAWfeiWEdo6m+bF3
 LXLY0OR9ewkQcGpGqXu3SzjjLtuh5yX9L8ojN8obxYN5sz9ctyj2A9InjCZVqXuSE+Pztk/clT4
 YmOo8wOovNMMRQLs9e/oMptMdV8TF4rW9T1Fw8ZNZDlzugFAl+VhQ7VjmbMmtNFbaJ3Ct/chAAl
 2HKK3xS7Zu8y3TcRWzyDdYVv3LkvW2qjmGXS/hJY9D93b53PV0xFhp5vzZeGPPll0MdPuypggjX
 NBz6CnvaNZNTYMqAOrdqA/YYVtQ2jSCWkO0WNX1dRbn2AM9fATujX+EN7m8HPndIJBnQ34W0bNU
 rUGJHvE36ptT0YzcyDPg/TWOwszdygGC8cesYoNA0FUrlnJi5IVeFQtg40LH+NFHIyFhvaeFfJ5
 9Xo72H25NunLF/2zjMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOCBTYWx0ZWRfX9JF7JnpHhT1v
 ZtsxFdQdoyS4fyPEA6MK11ZAbnuzFvf6NiN0jg6qwew29XP8qcKj7q6pPD0vMFm/kXV4Yl7noyf
 A4JP1L4FFPVtM57Q5glmFLUkAKzethw=
X-Proofpoint-ORIG-GUID: HWAVyFKpoxXebofLwKaRo330zDD_QqWy
X-Proofpoint-GUID: HWAVyFKpoxXebofLwKaRo330zDD_QqWy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020028

On Mon, Nov 02, 2026 at 08:05:04AM +0100, Krzysztof Kozlowski wrote:
> On 02/11/2026 03:31, Shawn Guo wrote:
> > On Sun, Nov 01, 2026 at 09:28:41PM +0100, Krzysztof Kozlowski wrote:
> >> On 31/10/2026 14:10, Shawn Guo wrote:
> >>> From: Nikunj Kela <quic_nkela@quicinc.com>
> >>>
> >>> Document the SA8255p SoC and its reference board: sa8255p-ride.
> >>>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> >>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> >>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>
> >> Drop. Binding cannot be tested other than build process.
> > 
> > Ok, will do. I thought dt_binding_check could be part of the test.
> 
> Since when running build commands is testing? I commented on this way
> too many times already...

It would be nice if we can update b4 to not pick up Tested-by for
binding patches, when the tag is given on a series.

Shawn
