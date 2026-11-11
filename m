Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411616;
	b=mM5+B9pyXgYqDWWaHM1boM2yoFtQ+SmwYGTyQVCQRAwsBfSKem/On6jrSUrbcc6XSKX4
	 Z2sA7MoVgYg4uKKp+i4+o4GNH96DU+k+uCnV4ziMbozGdRE8UfgDm21dh1pkmQgZwDhIs
	 JuGi0DZ5WmUu5be/dh2VS0TH2/aG4ec0BsXuHy8uYyWji4wIkbgcmoUncYdVGLXoUSLp/
	 tY85tgBYxgkV+O7m+zM7Lb0LfoEynnedKpitWSYasYlD54/Ntxi2Wvx4BP3U++OfQnIfk
	 wP+WCmsRwNXmZEFzEFS6/Czcft0COmvOWLzR/XkLNZp+40dm3xExUFJ1LC50K1otVEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411616;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yQk6KBaqCt7AnjmjWR01UrzGMS5fFH/wI09BIEpiKSY=;
	b=Bu59nuLXFf6fm9Vn/+QatfeuFJjNKMZABOAj6NHeaU4p16r0a/Z/8/GEqyFD5troHUj9
	 /w5yv7VRyY0UFV9QEZzo65VluHw4rFiT+H8ZPA5OGwqsFxlipSmXAvoTOK2zIOWJePShI
	 VkVpqxk2Mp/rvS1GCG8pSjjryO4CoTC/xwLlMd+LamisGSNj3TY/lTC14Sby4TeanwPLv
	 CBfI1TY5CAtYvU4WkM5MbYdB4HIveJxUxpPd9ufWZ9i8pw8NO2r/Sao1uNHkJ85UlNksY
	 fyuuaBzZSNF0CEeSJE4qyGeQ5QR75nwOYVuUZngKCLS09SKjrSba11PqfdapjMSFGAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOVu76xY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BT8BM0Ek;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05475606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05475606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOVu76xY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BT8BM0Ek
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0HuJ2651043
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQk6KBaqCt7AnjmjWR01UrzG
	MS5fFH/wI09BIEpiKSY=; b=gOVu76xYx+vlF89Wx0tHLkn5HMSA0bxHxNqbsuoM
	sdeK11yjOFoTT6U4HpuTQIGsssZnLbmvN2qjkCxOWytdGOPqdIOwkwLBu7RpZcqy
	fsQRtER+H96Ffj6CNPw84qrmdSDlixRDp9cGFc4rjeyxgP+mtCU64vNpXpg6S07X
	WUiUEggNPylFKO4WU14JL6S/msimrcgDDwouA9ZkQQxbYgYVMm1IeOj2fiITsZcM
	0tVDpz3k5lg5gaugO3/4lhHb6l1/ezYOLE/YLpzf0stOdDPQ+Ls7+4p+Jec8SB0T
	o9oH6RYU1oisEbERgttHNzyStlx1G0Ylr3BKWT66CQEAhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmber9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:40:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so692305185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411613; x=1795016413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQk6KBaqCt7AnjmjWR01UrzGMS5fFH/wI09BIEpiKSY=;
        b=BT8BM0EkvDBvMPi17rKJwrGU9o46nvC3XXQNqhKTWR5I8X7RDaz93B1Jzrme/C4zWb
         QUDGlwCQdnzTj1dIQsR+idtAaSTJ/OqYPveb9I7FQTR84oFHXDJCns+SstzcKre3Ai30
         8Afd7ajO5Ntt6hcejIToZoCTHjfHRjdlo/KDADlghDnO+f6yxEg3kq9+Ef++26mKlKZ1
         dMhZLbXsjj2AZgQfjxE9gMY22OpFBFCrmh7JIRgZUigQBk2zrcvxfM304zrzNJsdcGdh
         M+wlR0+9KA7c83PPK0/18Z0XVnde+WEznu6pG6vUpLyOHPIVX7cj8rCzvOv9st53Rr86
         k7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411613; x=1795016413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQk6KBaqCt7AnjmjWR01UrzGMS5fFH/wI09BIEpiKSY=;
        b=MhnCDJr4IEEclUZU3OvQDFIiRW0R1OCvnVv4DnJdZEBWcqgBPvY9JCjk6oqPEuwZ4M
         /DPxbqzoG3S1hau9/BnDzVxgSCrpLPPeZiHY4la8zYE9MZdhG3fS4mj9YPtrr6O5TBSn
         sWZRk5BqT1Hah/4MYHjDQbHUtJ7QTQaFvPFoG2f2ueuYvIpCUoOCn24er2sC+JO3f5Hi
         vh9E/J1CfaXCM07ItSXlzkaUT50Z2k7On7M4nyVq6wQUVwiqsInNiClMc56+CFc31vev
         yAUutCCz2gtdaI+LW2HwnkTu+zz2cAHuRzVrOeViBZeRfZZICRRSOoUw2M9aW3Iv1Bpt
         byUQ==
X-Forwarded-Encrypted: i=1; AL+hErGwnhN61e2YefdayCn5N2MoPIQF69tUZGZa2nNQ4lCzElPsFasAMBtXBN2K2mWCbameevStzC7MKsKWV6UT@vger.kernel.org
X-Gm-Message-State: APuU4Z94AouvKDzVnplji4opiny5nMUZOqa1HzTfF2nyp1Pm1xGJbpYQ
	vpmSin9gsb/F3Px6rHNqpy3ZgQIzfUh6ztinUROWMOkF3vhE8e5NdmDQDbkbRpxxgvy1cWk9Tm2
	Gx/LXS50rdUAznx2zJo6OMk3cTytUn1H0hDJq4ujcwEx7t4bAjatMJ8LN4w9njNNmfKih
X-Gm-Gg: AYBFou3ikNPtRiOBGZ7WNiqOIaF+vNJnzTLMcYjPJs6D1XwmyM3fGy88YNmCmCZvqF7
	WT/yAcLSCjseN9w5GKhgy0pwFL8XJbgU8RnNn6vEWbBKQHTfjUuuhO5eLOVBAHfqiE6vcAqzK4k
	O/uZtPhs68WzvpzsJEFyul9yM/2MJ+NmKbVG5570sRHAz8r34a76YuI3F79TRTlnmPbmamgU0PA
	MGR6YlW0ZmB9E4GW76QJNZpQXTd+uyo22c21IyP1wzKvU89eQw7o2MOgDbb6dOs3MSM19A/5Uol
	IcpkP7hkQo1dFejxKiS2B8EXnBpGnIR5nJ6UVRTNQ1uvSjBSjXjBI4bmFzapcXeF3dszeHt66D7
	940718TwaAc5VIs2wsosn0sNbiMK8AmStN0x1gGACfGmmFHIm6CO1IG0msrzImWgt6u1djitBCw
	n5h7C5K2AO6CS/O93AGKZFcN1Sse0J4liiF7PlYlO2shZ6QWBCKMA5tATpqmWmlw==
X-Received: by 2002:a05:620a:8016:b0:93f:1789:8359 with SMTP id af79cd13be357-947ae88a471mr518126985a.31.1794411612947;
        Wed, 11 Nov 2026 07:40:12 -0800 (PST)
X-Received: by 2002:a05:620a:8016:b0:93f:1789:8359 with SMTP id af79cd13be357-947ae88a471mr518121185a.31.1794411612413;
        Wed, 11 Nov 2026 07:40:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092293b0sm11877221fa.17.2026.11.11.07.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:11 -0800 (PST)
Date: Wed, 11 Nov 2026 17:40:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: avoid pinning the command buffer on every
 transfer
Message-ID: <6m4cssgagnpvm2wawyj62veoqbglxv62rcqgxzaxvjynhn3dts@tlkaxvd6ph3n>
References: <179422752570.88190.13452031230666113805.msm-dsi-pin-leak@michaelmcallister.org>
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
In-Reply-To: <179422752570.88190.13452031230666113805.msm-dsi-pin-leak@michaelmcallister.org>
X-Proofpoint-ORIG-GUID: R4JVuRfZ2rE5uKZ-fu4hNFBabRm__RSl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX+cwfiW1pKiIR
 6xbsOyK52I1D7DuunuimYKYsru9UgA4a4w91Nh53uKGYpyjQcyoGW+Dnb3jTZUDViV1UVZapy1r
 sekrNN4HLEt0Cmy4idnNsr4zPAMopSQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXyA5R2O5SQ6K1
 mXM8yQrFAVuobxcCbLcWB+OgqfvnhFjJsjN1iXUFNQmTw0aPFgvG8sZIMG/P5YCwwQSfFBe5AdO
 DE/i3a3o0CPp94vddpm8bc05gp8JJotz0lwvQdplkcxCreXM26HeJ6gNo1HzM6+gQJLMfWCrYF2
 dSo7BLTxWzSG3ZTI2PvYDkxkIRoS7qYmDTnM30v5TX1Sa2R3JiOY9oSuJgmPJzFSFW3d2p7wrAC
 tzDoe7KQjBkfsRr27rvwwdAiEU+hAP4UFxaJ9QoFK8vbnl+6D6shck0CHdzLX1PG/HOsfhOUpAE
 2Sq7L2m8DDdeu9osecCP5hhbxkPsbFYbM6PgCxy9oYPYy4iJwOrfVzhMGx2ERAd+rFgaFFLCyHo
 qiRAG97ZBo63JbUHC3rfrN5lZ1bg1J5r/vmCbt1fewgqll2j+SkYk40xT+OBqi10KAyROvyx+Yv
 kKUvXzdIs3abo/ImVbw==
X-Proofpoint-GUID: R4JVuRfZ2rE5uKZ-fu4hNFBabRm__RSl
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af48c5d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=JwJ85b4fAAAA:8
 a=pLk9kBtbcEIJPp8lWhkA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Mon, Nov 09, 2026 at 12:32:05PM +0000, Michael McAllister wrote:
> The command buffer is already pinned by msm_gem_kernel_new() when it is
> allocated. Calling msm_gem_get_and_pin_iova() to fetch its DMA address
> adds another pin for each transfer, while teardown only drops the
> allocation's lifetime pin. This leaves outstanding pins on the buffer.
> 
> Use msm_gem_get_iova() to retrieve the address without taking another
> pin. The allocation's existing pin keeps the mapping valid until
> msm_gem_kernel_put() releases the buffer.
> 
> Fixes: 7ad0e8cf6317 ("drm/msm: Count how many times iova memory is pinned")
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---
> Hi,
> 
> I ran into this while testing display teardown on the Moto G10. The DSI
> command buffer is already pinned for its lifetime, so this avoids taking
> another pin every time we fetch its DMA address.
> 
> I tested this as part of the G10 display fixes on 7.2.9, including display
> power cycling, suspend/resume and teardown with the compositor stopped.

Sashiko reports a double-free and I think I'd tend to believe it.

-- 
With best wishes
Dmitry
