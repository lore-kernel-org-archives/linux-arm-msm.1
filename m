Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501337;
	b=p+V2yoGPjiMgyolMr81zHLdlFIYx0oIaLU6y39gpov/n6szMYVfc3iIYMZTudSv/+JYy
	 mKYrmseTLe4q6zISqX3gLdiMpqklTJgrE10/vI/ZsSwbvBR0s1mAZ0FWZrQ5lKyO/jrVa
	 eskFTVLXFpkBqimkW0+lHZnaRlfsaRO5+qEifKJzEHLO6zNzcw5FNQqQHV2B2MR1iMAr7
	 c0Sn6zD9HK5lmkoVimpPMU4Qm5ITNKRYxYZZBB67F8J0+IgSpYVnHdD0l+APtxCH5St/m
	 FxR2VRKLusYHWBb2Ys+QpRQtQ5n2+lhXr0beTB6fdNWIf1N/beAV8Vr1Sx2godHoq7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E9+isAu1JUaOE8ta5xXFojt04qILV/+xKrOOocJ3ry4=;
	b=5MBprUm6jAIgpExXl9VIF4z7HNAZLQxEA26Xy1cq6ccdO9pFC/cemHIkmo1g0xBEYoUe
	 ux9pmtQfUGLYOlpV9fs+IgSdQRxks/1rN1s2fojia2o40GX/1jiRHH+ffMN8cR8xMjcM6
	 S6LGuWcNijK5MPyuk6r4mpPy1qQjdLPOOy89BnMXPUy7yr+A+uVfQUGpV+vP6o1kiwRxl
	 HnADJOjrGjnSZBbvIpl4w7yhdYZyGs/KkRIpOFtLOIcxmKF0xiiwT+/3CUxWi3ZR6ysJy
	 wCqQ8yps+9e8BRruO4AxdCLmdPYctCkAHKY/Iwfo/0jmJm7KPyVPooDsUNi736QtVMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Myij8ayj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeA81JMX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1738606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1738606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Myij8ayj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeA81JMX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxA8D419924
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E9+isAu1JUaOE8ta5xXFojt0
	4qILV/+xKrOOocJ3ry4=; b=Myij8ayjac/6exWWxw46Sl9cnKLQku9yE5/PRtLy
	al4LpuZucmwHA1anuwyfVkGZaVjBFA8zz1PzXqbsKlxGSiPNa2a0Ow0Bs3QkRox1
	tE+S3d0TtvGHTkVSfSVVKs+5xlBb6cIdRsEAKwsJRSHFNNkF4i0NCMUdSfEMi6Uz
	/4TzF+Hp9KahFPH92mcXbqQW4yDVq8pcyuvnhXfnWi1IffWkoeBbJPkRpsJQ0oNU
	k+fEFjb/oYxdin1jmH81hZXPvrAMNtD4e9i9mKbVvhUndgYSy21UrzxkIcfLcI8S
	klOy1q1vGwQ0H0f/LHRfxJWvSsBVX1q1Lt2VL+rMdHYhjA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stgt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:02:15 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eae356241fso68295e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501335; x=1793106135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E9+isAu1JUaOE8ta5xXFojt04qILV/+xKrOOocJ3ry4=;
        b=ZeA81JMXfFBJCIJNKiBUMkJ/T88B+giGRg6DVIaA92gvpnTZcmfMss6/DXCOd3ALPN
         +v7BZS2iIwtgpqKs9iBpJxEZuKcQTGTUKstyvTdlM3PORGTW/LxdikhxZtibeDvndlLI
         LggNJ/sFhTeF+O5OJU3yuxnzehNzeGwFvxJ810DjzRrmuP7/5w2Hn3CxXRx3AtruSz5U
         RHGrfS1+13LlQu3O6HWCalqZLEL+1lfSaGzun+mo7LmkzYTwGsKQmfQ+ifqrWtnL/7qB
         7nT5jekIPrl3kq3OZLG5vXv0TTRoMgJGgQyiADGe6gSKdbNurvohx4gbdubJonwDwXMU
         XV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501335; x=1793106135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9+isAu1JUaOE8ta5xXFojt04qILV/+xKrOOocJ3ry4=;
        b=ql5OA4KIy9953z9ND5OrFcAYse38eIEMEhJHP7IyBAMef7eSKCc45/Q/fqal1ooVyM
         93bJwKAq35Lf8v9eRl5UGxGWdfmohhYk+lNVD9itc8z/ewJjFyHpGLrrVaNfbQwoGRsV
         2k2aBMeXuHxELPkjcGQhx+XfPi/KneAdHBiv6PJ9CPVhzzTA21aQkZrZqV3eR7d+8DND
         q40/k+WrHXt0OEnS0Oh3qPPfIwHWqfEve4quLYzA/BPhAmuYaHfWyb3gZtcs2squ6YlL
         QZY8puzgVkXnY+5hHXLDlr9qhB+NhENIAGr9sbrm8+U5l/ZffWRlXgAVDpwV/9hBA4va
         uwvA==
X-Forwarded-Encrypted: i=1; AKwUvBz5Uxs1Ue9RI8ziKZxO295CQz4wfU2wtneOAM/o0hclnGk402z9Y4zwg4A7BSuK4SaiXOTIOB/BL97wyv92@vger.kernel.org
X-Gm-Message-State: AFq9FYIBY+64ZVI0NyVqnz9WunP57+n2pPIP7jyTTKFqvbWC7nQBZn0X
	/qEX5gpL6QjK9ohr46jUlYykCkYY3wUcc1BIQbO+tY3wxxfWwyJQbI2zwy2jxMr42K8vRz8TO7T
	2tRbg/rvM70lo9cEHOweYVS9wiBFw5JHPY5HcRD127Gx4b0DbGBUBrO84yrbVlTdlOLMV
X-Gm-Gg: AYBFou1f8ywbxcDz9aRVwRgDGxiO91pIxzlssExbu4LG49L6c06J+tJvhzZwk4bucW2
	5j1qxkSz8LOcq7pDRk+Ry8Lf0hLA2l1MZ5UMRV+jf5qHgOpJ2IW6S7ACuj8gFvt5/sRllpB2Xk4
	N1BoNK+cVhqeHjNOh/YoFimk5clJ1/JI+ZVziGDnpzsUOGkoC8Rumpg3D6kZy5SEmNaEYd7YVU3
	ylgLoNaAP6GEWEPFOsvWzK4VLGZdHUXAtm8Hd0fHK9U231kaMZ+VIA7rmCpiszIYgBp7ncQZLlc
	5SJpmVmiiNjrTY0VwuvhioNqINJ3Daz7TChE3EACREWaddpN2XveR8i61eyHYWkiXiisr+CksWE
	PAfKpPeM6IY7ZQ2dD
X-Received: by 2002:a05:6122:2225:b0:5ea:bbd9:e33a with SMTP id 71dfb90a1353d-5eabbd9e95amr2468878e0c.11.1792501334712;
        Tue, 20 Oct 2026 06:02:14 -0700 (PDT)
X-Received: by 2002:a05:6122:2225:b0:5ea:bbd9:e33a with SMTP id 71dfb90a1353d-5eabbd9e95amr2468571e0c.11.1792501332538;
        Tue, 20 Oct 2026 06:02:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fdbbsm6393833f8f.17.2026.10.20.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:02:11 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:02:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add support for Xiaomi 17 Ultra
 phones
Message-ID: <xg74bfkwbpdqvo6roqpnufcffeidgghtnenghmvmyq5ugd4i23@oyl27c746qre>
References: <20261019-nezha-v4-0-19c1e31eb255@mentallysanemainliners.org>
 <20261019-nezha-v4-2-19c1e31eb255@mentallysanemainliners.org>
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
In-Reply-To: <20261019-nezha-v4-2-19c1e31eb255@mentallysanemainliners.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX9wEVK11D8nCN
 h5h5mWAPk9lEl9vxF+xdKTWzn9Xavit4Im/35Bm81YQBTyjALC2/IVa3nDezVClYoOmXEV+ZOgc
 kQTRAxH/AZ8wGX8s0g5YBIDQuQT5YoTAQtmc621p4L92rNm8juhF5ycvBhP1ApfwdSVR3LN5bAF
 FU3ZuUNnwJ4d3rmy8VsU9oYA3iBnekYWvyOcUtxPhRXRLCCt2WqxX5mZkJuzTfh9glSzSx7NfFX
 I5u4ZVd1LOrRBmrdcZB1Ujxiv66D7Zc7G/MzUPm3CeA94O5izVhwi5YUHwLE6ZSg3NPQlI9LNBf
 /q6qo05RoeDxm301YQerDtc3CNbCx7+7F77gcNZ3jZj9z+CpS4cBQPqOpUR314Dpi1LMKrJe44S
 cqas2+Iv3qlUAJ0d73o4ZnBDxDMQRa3OTdMLH3Tr5PaYPge6BkWXRXVtWdN9y1kNK32dxwLoUSh
 nS9ZI5zBf7cyUPd+flg==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad76657 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=4I5MClDQAAAA:8 a=EUspDBNiAAAA:8 a=qo6UdcItuGezONPPF9wA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=1V3rjZ7Gd4_ILS_TCx9Q:22
X-Proofpoint-GUID: npngvZLq1rb-Nq5vrzchBilSrPT6po19
X-Proofpoint-ORIG-GUID: npngvZLq1rb-Nq5vrzchBilSrPT6po19
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX+YrR8SxPqhww
 EQHHg8zeYFFUaL7nT3zjHWyPmTv3vPn5T1lavi+GQ8WLKWJU+rKF6Kwnt/EMDgpL8wYSC70FbCB
 WZp9RWuk3uRfjEM2c+C0Iz8oIb35OhU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-10-19 17:47:23, Igor Belwon wrote:
> The Xiaomi 17 Ultra device, codenamed 'nezha', is a flagship mobile
> phone released by Xiaomi in 2025 (China)/2026 (EEA). It uses the
> Qualcomm Kaanapali SoC.
> 
> This device's configuration is based on the 'MTP' from Qualcomm,
> as is also referenced in the downstream sources. Apart from the
> usual differences (i.e. codecs, panel), it also uses the newer
> WCN7860 (peach) connectivity chip, which is why WiFi/BT are not
> brought up.
> 
> The difference between the EEA and the Chinese model is the battery
> capacity, notably, the EEA model has a smaller 6000 mAh battery when
> compared to the CN 6800 mAh SiC battery.
> 
> Currently implemented features are:
>  - Booting
>  - Power and volume keys
>  - Storage (UFS)
>  - USB-C Peripheral and Host modes
>  - GPU
>  - Fuel gauge
>  - ADSP, CDSP, SoCCP remote processors
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
