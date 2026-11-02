Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613410;
	b=5ryJEWFZftBguCzEEVWrNexBbSHNjQTugDeYSrgPM7GWypN+hdv8D+RApiaZT5/10fTS
	 8MKwerwMvjVK54II8Z/LA26x3h36WMaEOTUJeYfiv/Hdz2Iyy/cLglg2SSqlP/Hn90h+m
	 F1WuWC0DovAivN98WrlLURQOuqgbR+GCWFa89MRRSUfYGKohDTOatrar9YHUGKUD3mr3w
	 sNxvGuEHKF69hP1GRTvM20IUn/fbf3xH/Zzve9sacjYLayEpjBNOp3yo+zoRRiUeXW7bP
	 VokUcmVWrVQNgillkiEG38HgtmnSWYRDypL48dlqfHs8b0S5jAVc4s1OV0IBpgdVK9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fSEJYomxVT5C4R68mRDSvCPQQWerQtUgHd1oP8Jric0=;
	b=MpVREULviacQ6AGYL+HKxn5S8qfSzU/RbvfqC9ENWldlkL5/wG4HH4Yb4I8zBKrBviSd
	 Yj2uw3YS/wyRDzRloLIghb31QQvqavHNJYH+To5hUoRfs8KfRSSut9a6HBXTtQ06Hij6Y
	 lwaaTVWvvt4+BxPj5zCB3ZVb4zPcge00JSs/TrCZha9mbfCNw5roQMx7yvSWfMdVt6TIC
	 dycVVXTKRkqGZyO+RH3OWdjUMG898DTIHyl518TCCkbSrp9XsCp4OK4e4siuM2yy9Jnmc
	 zyhssw3JGLf2IznCnut6hKCuvxSHsSHB1SLrCOzMlPt5uHY05GhvprGwydf36LdbTAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SHUGRsnz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XXL97qC3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB10606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB10606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SHUGRsnz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XXL97qC3
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMkP1821213
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fSEJYomxVT5C4R68mRDSvCPQ
	QWerQtUgHd1oP8Jric0=; b=SHUGRsnzaCIZ3CjE1mv7LUTZlJPgud6ICwQ3ILFy
	d5/PVrH1MQdwuNXM+pK4dQMcEC+A47qdMlSrhu29GMjTBW4qwXAkTKpngIlJK1ug
	MtmJUQMs0mDpB6oV5gDOUcbAOBku9RZw2m6vumC0yPbK8SamG3vsN9W1H+v18LNs
	VqaFv2Gy6hZt3pjk0K+/5bwv6JzDwGe5xOp0StqkwNnAvi9b91PXrfSlCb596Fp5
	RLhbrp6DiGfPoz1NrqyPdPksmzxPRCedff6gXqQIlnOEP5C7161tNtsYhiXgmyis
	QeUw+FGJj6Oq7DKFVmdZmXoQawcXQ1ckNwzEE+WWxQ796A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h3ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:56:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c70349f65so60703616d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793613408; x=1794218208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fSEJYomxVT5C4R68mRDSvCPQQWerQtUgHd1oP8Jric0=;
        b=XXL97qC33R5aDolMDH3FGpTNnlxW/0OHZ/94DKyYvZgFVrgmg61DYKum/MOTCMfrVE
         6apeHan3WDrERH1u7YwxcN4zizUL71O+XPiYZTw/yFjZOvhCQAvIpKdycznctxbVueLE
         Jtzh178amXDzj9wgQkGW8Vshsjp67I44eifObiyOfPhema/vxIAVmKETlDQ30opUcIXf
         8cQbkt7/qqen4P71Gjir0g5fWOm9NmUFk2Xj7iX1NGUhm0TEyaRvmPgv+6x2lhOuMJjB
         A4kuunoxNss88C1PSTaYFSMRnDptgctUeaL6ExhSGg3tddEzk/4/ykbcRvg0RIgXXMk9
         iG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613408; x=1794218208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSEJYomxVT5C4R68mRDSvCPQQWerQtUgHd1oP8Jric0=;
        b=jRnUMHDQP+ffQYcwj8GWJPnfy8uFm9hoZ7AR5VXm7+Mc3LgEsOYCo6KyeMXL+FjLyM
         bOFFDp4AHShi4dTgN4ADk93s44dqkBllwe233o/wmCb1+M9UyJuCrCzbx68ho3cLMzVR
         fig5oqd1Q+ygiKkbezEpHvME8nWRsq5ZWEg3EcgQTY7+c4RuNRO4nOct0z+v6kjqqeIW
         hlJyohSFS2xod2VBnF8QcqPjg6eKD6Zp2Dz3tEe7f5UsdpNzN+XqBwVCN5geQVFLTRvV
         HZQDr5lvlCsbWKm/Qh4GJkZTuaXXNuyv2OvviyeJpLlR8pQ2KPiyMiKzNdIROXdhhjo0
         0gHA==
X-Forwarded-Encrypted: i=1; AKwUvBxtWvfYWvtBvrBcjRumbVHWESlQI3CWUY/RDiJTm5sq5jOIUq2kSafO3LnRyQAddCguy8gzjf6FNI+As8rN@vger.kernel.org
X-Gm-Message-State: AFq9FYL5eMrXJSjhyLMF4tLwO/W316qsW+dFpIv7CZGNZ00av2MY/es/
	RMfyWUFJ2/BX2WdDKP6xtr7knSByBtU6Bc78l/uvq5uzzruBuYYgm5anItQCJ3oH7wbeiecJa7Y
	DOLf0Cw1nsIoVWC6NZFSgn4EoDK4AlbCYxJqgFqXIlYbKZIUrIiqCFEhvBoyPWel5nMEu
X-Gm-Gg: AYBFou1tWkpo6BLFcGyimdJVCnb7KrI1MYoKJu6MGiIYUkgAvtDDXxny/8ZpbCwBzx5
	1rCz/U13SiWd6COEZ3S4O2quN1VkbdD/0Yuy4MDyGwfBMvx3i5mk+kf+d3qLl9D5pPGyS4VqHXx
	k2VMkEAF+WQO2p/qA9Ki19/YOqji8tyWir7nchiAX0T8kG5jLwDymQ9THZ2eMq0ZLAfaRCe0xPz
	N4f0OSIM4VNQaOXp7Mtz746QB7nCIFPoP+ncUMetLOkb/tXf5Md1ssceW8X59zE0qZ/ajp4twMd
	wvv8dxWYhrZZWoiGbL8ujr94LIq9vBDwvfM1fmRmTG9Oi5TAqFwCPeFq4gEvp2r3dvyXq6FKHJu
	HuqUstaOj4yfVRyHQw0kntSVdwbQpCGo6wOSKqBCYlGRBidhrVKP55A2GN8WUeimWPgtF6q+i4Y
	DxNJkF+p6juoa3/S2Fz1aCptGybXrJIfVbBCss61mkQq4iys9zXuQ5JGOkyd7l
X-Received: by 2002:a05:620a:2989:b0:93f:5e6d:880f with SMTP id af79cd13be357-944217a1992mr1658098385a.74.1793613407854;
        Mon, 02 Nov 2026 01:56:47 -0800 (PST)
X-Received: by 2002:a05:620a:2989:b0:93f:5e6d:880f with SMTP id af79cd13be357-944217a1992mr1658095585a.74.1793613407338;
        Mon, 02 Nov 2026 01:56:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e5e6sm1554344e87.57.2026.11.02.01.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:56:46 -0800 (PST)
Date: Mon, 2 Nov 2026 11:56:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a5xx: Write CP_RB_WPTR under the ring's
 preempt_lock
Message-ID: <bdtzw5qvdtsgeiqcr4dkvmrcnn7l7cznz2iqs72vjvabtvdbzg@ajqpgwwmmosc>
References: <20261031-a5xx-wptr-lock-v1-1-fa7d7b9a7fbe@gmail.com>
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
In-Reply-To: <20261031-a5xx-wptr-lock-v1-1-fa7d7b9a7fbe@gmail.com>
X-Proofpoint-ORIG-GUID: nMs3Wy4brS03cWVU49AUcWovpat4CT78
X-Proofpoint-GUID: nMs3Wy4brS03cWVU49AUcWovpat4CT78
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX2jChObY+f/gu
 BzNxjpVl9/68ey+0DbZ5oFGiZcge2Q/RlwHOTgQnu6UlGNgaXn7RpMagcKqJXU4x1E5RjD6Dxsn
 gsZzfFKdi+EMaUXV2qiBuNKVxGBeONw=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae85e60 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=-lvlwEyg7s3_QBC--IIA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfXzb0M3hrmOd/3
 KT3Ce9yukC/4Fa7UISRVJzn7Izm95SmIqKlR4mgv8lIQ3TD4qwgpqbMDr13limOmz88FKecNT49
 3i2Nc7KeLFsr41YrVZin0qxrWKHPi1jMQAPiBLOtXuO2VsCHMsdm4jYCOY6WYF6p+Rb6W6cNwOv
 UsCRJBYUCuPY4LjOpPur0Xu4xd6zFcgHOBNbb2goJSQPzsCjYOsIclp8drS4YfztdpP+jzQc7RN
 1BUX5QXbXHaQuc/I1t2y2o+ahhjp29Cxg1aQYmgqHPh1vXQqhZ+wFz65Wn0L6BB2Dyxyzv0ckSc
 3qruRvVTb6Jd/IE3BBtQCYJMUH7Ez3obfe8MJiFx78yejWprBNHefWnXPQVWRSNgRsEdFLGdysE
 7PlFqumzMsHINpkkfSXFKJ8qFhuZdVzGae+KC1DHnsmte6w7HUzB6e9+FZh4FglEw3hC8HDBi9K
 fJUMpvXn42Mg7LUguuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020039

On Sat, Oct 31, 2026 at 11:30:55PM -0300, Fabricio Akio wrote:
> CP_RB_WPTR tells the CP how far the ring has been filled. Two functions
> write it: a5xx_flush(), after a submit is added to the ring, and
> update_wptr(), which a5xx_preempt_trigger() calls from the IRQ handler
> each time a submit completes, whenever there is more than one ring,
> even when no ring switch follows. Both read the ring's wptr holding
> ring->preempt_lock, but write the register after releasing it, so the
> two writes can land in the wrong order:
> 
>   CPU A, IRQ:   update_wptr() reads wptr N
>   CPU B, flush: a5xx_flush() reads wptr N+1, writes N+1
>   CPU A, IRQ:   update_wptr() writes N
> 
> CP_RB_WPTR then points behind the last submit. If the CP has already
> read past N, it treats the ring as nearly full and executes the
> commands left over from its previous pass through the ring. This shows
> up as CP opcode errors, and the old submits write old fences, so the
> fence in memptrs goes backwards. Recovery then finds no submit to
> blame and does not reset the GPU, which stays hung until reboot.
> 
> Write the register before releasing the lock in both places, so the
> last value written is always the newest, as a6xx_flush() does.
> 
> Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on A508 (SDM630), with piglit's texelfetch tests run in
> parallel: CP opcode errors in each of seven one-minute runs, the
> seventh ending in a hang that never recovers; with this, none in 25.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # a530, a540


-- 
With best wishes
Dmitry
