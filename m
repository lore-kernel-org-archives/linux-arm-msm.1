Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D06374745
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577350; cv=none; b=rsYrGys53pCjPCuuvNz7QmubC3mbVbfHQZ7vjzc6YzNTMdCFDJPZ7HGFh+N7x7lcYDgk6vSjH1SMHLDWsgpyZAPiLp/XqQMuJRKDQFtyKQ3L5DKS3wcfRie2GG5zLxW37GLoplOl/YtkzzdBJSUB7ILUsx71c6UKvYFxFFhALhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577350; c=relaxed/simple;
	bh=uOKVJQXxMhmZTqrWS32Tj5Y81pjCbfm9ytVKKPAUFAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+91hr6E40Bt5Czuo7XoWKSGJqZt/KejZy3oOgbo7RUI1w4TuCsA4LcyjU7upTH/i0/HUirTVOpWtJVdP7h2ab3P0JIhlwVKPKIj8inWRd6Uvv4g6OQaqBO0nQkDDhnD9bECQ+/oVLhAn/sc9ubzpENkttipJmEcB6BCxWLMVnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhICT3HH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Px1r6f6A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhICT3HH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Px1r6f6A"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvCkI3613735
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFyU3mWvGyLTGThD9sv/hYIL2x60Kcu9mNScGO/gTbM=; b=WhICT3HHIExyzCtV
	yAy9/JcDQdv/ppry5xEJz8pokJqN4it4ImK4E7TBYrW49PJTKbYCRlpRpfpgstBP
	GxelFVEYqNMCEqtLU1giG5iankqt2tUQfbqOrRkgCEJYGOQNrqCCxg18ITPfycIT
	k5YmTK7CiOqIAOFdWqoXY8Xgs1IrOPPDf0S2l4uSijTwoOfJKxnG/kt9y4B+9uUc
	VY7BKZ921WlkaKIbXdnZdD+TTvpopik6e3/HzerWSffdGnI72OdetV6NlGi7B65x
	syX4yn7EVIXjE6KBqtD8bZyAR+TBxWfwbfjm8pe5qUsKOymDfYtRuFzD36Oo5tVG
	ohGYlg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk192y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:15:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-77969cb40dcso55147137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787577348; x=1788182148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFyU3mWvGyLTGThD9sv/hYIL2x60Kcu9mNScGO/gTbM=;
        b=Px1r6f6AOI7C3GVgAkjstecf1JqLerUuufWd6JcQbo+XaoIueieCKu0AbACEzC9Y9k
         BM/Mci/V15f3El3enxXPsQPnZ/9ylLmxQ5QAMYM5AvRBFTWJJCttFzsfsZX29WAo0iNA
         DVXaVl7JyfLzxRSJ7x+1CEiBPFxrilDXC82c3gl/TiWJioCmPv5chXoZ/khwqLm8K7Kn
         cYTZtSrPsl3I38v5CrbKQArzgN8PYhZdHHuAMR2Szh24kheAhW/Fs0J8IIdsMo7wLatH
         xkaLuMqUqzbJeI0oTabVSlp3NYtOxRdbO5Pw3LPPjl/YZbyIveJmFrvtWJ1Nd8bppP6R
         8ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787577348; x=1788182148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFyU3mWvGyLTGThD9sv/hYIL2x60Kcu9mNScGO/gTbM=;
        b=nUKoqM6ap8PT4N2x22OlfHQc7ChPApORpy0R3mh0/Umk1MPeCisez+6kIFH74/lbe+
         YWBSf11g99W8+abI9eDm6VdlzyHAgRAdjkeiQBcK6uhYjx5mJ5M0hnjq+6eRea8tc4sI
         ncYYSigVnVhZsRZ1AKr2CcW1HEltaSG8UKGdALRJyIWjZi1D4RegSVQ8GKItqDx3F3Bd
         HMKGQNA52wTunQlSjZIf3dTLWbzvXOVxVfeX3qgoOvY6TWCERFpqQEzzeK5T/4jeZNj3
         cMDlHO+MSfxGNkmY/wQGTsmkauvPYnYT/CnnNqx2VkjdnfPo2HtFZ3pBa/a4CeZLokR6
         6/zQ==
X-Gm-Message-State: AFuF++kk+ohNbj28tIL8CI8rFblJEfz8vdwC7aHdIEtmihHW+UV0Sh7E
	0rL7wemvq3dk6Qh020coaE/TYUy31EXkaug3jHg8Wxk1tj7xfXGlPbELioNH6yDEhA5603VfPEr
	L2W6DcbX6jnaAYf2AskYBDknAT7hxN0YsvxZ06gIGxS0IUBDL4p1wl2Y9mURlhFTwnn88
X-Gm-Gg: AR+sD104mVBM2TCkXCjWoOj0b3+86Eec5TIToC/zMu5Ur+5r8TxDds1pYs8XDeMmLqb
	yZu+Mamu8esByC50sMffR8N0T28PoscST4Aj1OOnxMVDTAY520jCEimHbsOvh/MvyqH1huGiNfl
	oURN3Kv9ZfxJdOCPALPzkMrQcOKAv+JpUvQJRdFkHAeTvZFZhx7PeiHTLZLtHG/o2JYQGUpR31p
	hs4qK/bDSQ+SPJnvGOIRErWHoVHQ2fcScNCAr8mmW7R0tGH6r6CJ9I9X4HmJ3YDyCOOcE6gGNFN
	yGrU/pK7T/g594Z/dhc3bfzA4NUtxPgLhD8QUaEp3HIvI3ZOK2DjvHjunD9Vospwn6Bm6XHFA+L
	U9OlZgD9kkSbPi+QgGcpRXhUK
X-Received: by 2002:a05:6102:d8e:b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-77a5f8ee1f7mr3817894137.0.1787577347813;
        Mon, 24 Aug 2026 06:15:47 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-77a5f8ee1f7mr3817872137.0.1787577347380;
        Mon, 24 Aug 2026 06:15:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48cda2b20sm1739539e87.25.2026.08.24.06.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:15:46 -0700 (PDT)
Message-ID: <315db50d-6553-412d-8fca-a4b4441f881b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:15:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/dp: skip LTTPR init when no LTTPRs are
 present
To: Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
 <20260824-qcom-dp-typec-reconnect-fixes-v1-3-2825e5bf8a96@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-dp-typec-reconnect-fixes-v1-3-2825e5bf8a96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ENtejmKZYkXv-yz47WmKC4c2Ovh_43re
X-Proofpoint-GUID: ENtejmKZYkXv-yz47WmKC4c2Ovh_43re
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExMSBTYWx0ZWRfXwU8kH13ME13n
 aSJrcQ5TFENSjLvTXbbS0ETEu8vYJt1SXgP5P/sMco2AUYFcuAxEeMFNrEjVVdxOxheDpxY7qTn
 2xl7WIIzt4B63WDyhCK/nDLP4I5ARR8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExMSBTYWx0ZWRfX2eVV5OkisZz0
 FLTHrVy218c2B1/oqJxeAoQaF9CC4ddN3UmHDOGIOhvggvr9VjPesf1gx5nIG/vPIkanjeMqPt8
 1ov1vhipi5anphUrwXacXcAwzbA/y6CFqqQ6lYzY611R0J3KJvS0Vpcn4EeYaqQPKUZ7Y/s9fss
 m6AVK1o5OeppZ3VzeJDdQHBVjgUgRultPTr5MRii9QZARsPrBxnVGvjwiorgyPDK4baCbsGuuTH
 TxDeA29/AulT4csgM54NX7HEArP1SSaUXwVIgUt1+Wd9gI7/iCg9jLbCkRTSSYzUbmA0k7Qcdv+
 wzatKfcP2PqryaXKuT9BQw2vmNik2HNeFtNGv8L8QBWH86SBJpd+kqbJ8BC0Zpcxo9J6UaAmrgl
 TlzvssyqaVrTmx5C35PqCkS1Meoscxqd9AO9fmUx/T7v3m6yzCyk7kv9+a29DH3dVEVXciCUJEU
 ngdRgEXpfIwK/h97Ecw==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c4404 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=HlmmvPtyU3BZVRE9FHQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240111

On 8/24/26 1:28 PM, Saurabh Anand wrote:
> drm_dp_lttpr_count() returns 0 when no LTTPRs are detected and a
> negative value on error. The previous code passed the result directly
> to drm_dp_lttpr_init() without checking, which would call into the
> LTTPR transparency-mode setup with a zero or negative repeater count.
> 
> Add an early return for lttpr_count <= 0 to skip the init entirely
> when there are no repeaters in the link, matching the expected usage
> of drm_dp_lttpr_init().

Reading the body of that function, I'm not sure your statement is true

Konrad
