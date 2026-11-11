Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420275;
	b=aqHzjJV2TEPArRwh1BEmFnIwftVE+lGurv8p3UJV15i/Lg0b6Ps/HYYPpUSxGswch8Sp
	 fLoNMFnA9OwUO98mRS1pW2kVkbbjInRRcyBgkTJmKO22DV5JCkRYqKOHNcXM2C1q6MhKf
	 D+sXMasziOt7AM90hs9QrdO/qVP0+YKGhEY2+yu8zhemXh28k0K5PjUlRkFWBs9Wi90eh
	 vcLpokFIOyjBoEMghnTVP8xR9djpAf/uA2dzdVVnv2ltvgvCFLeqgQz4k5Y5fzxTGQLM4
	 mQY6T10R7V7905ruabWnT0sz3nSxRiv0gvB1j78blaY2zyAmDv+TSg9TkDqO5U0BzUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yMzNv0aTJrSt8UYD2LUVyq/F8tblmivrrCSb6+nO2Ts=;
	b=Y1+PoJBQ5dE+7eOiPNs4j8sVrsZqUSs0zz6HYRlOv8+pogTr9UxXuUOK8yDDaLrKrN+M
	 TgFhDa1DuZ8w9oLMrC3z1LW9E++XtUDY4P/d8b+bgKYjkhGsFUHLdXW+6xpiYq3fzwkoN
	 8HTexBDw2o2V3lheCNOo18vOqUNfNj184tc2vjz8YMPmOqANybFZvu/4YUgQbwbPDkVFd
	 ZfeJnGjZvJGTElUedTP40m3KTKwPo3XfO3q/80CdWmjfbGi6xNFydF4ycVU5IVreHVCbu
	 jcRXz1B10W/d2YUWIG0NW+vrMAmE0pIyqCyKQxB8A7l2t9GwR2BJFdtKn77PgbTzQIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Tg/jxDjT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BdGMCfxW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21896606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21896606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tg/jxDjT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BdGMCfxW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtalF1399988
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yMzNv0aTJrSt8UYD2LUVyq/F
	8tblmivrrCSb6+nO2Ts=; b=Tg/jxDjTx75J68MDIuAo5nCo7HnZ6v19JjFiBW4d
	1q5066SF72hwrQeUo1kEL+D/Vbg36y7iYcH8lEoIYlLioWpOu43iFDFpXKOo1OVW
	DKcYeCb1gtKuzqPcB/K2dgUbUlKhawt1ASywinxrRLQkFxMYQJkYhE8gaB22ftj4
	OITHIfoXK8kD4QNlPhZvIOSGn0CP6BpMh3Zddyzam+pzwDkgQzqkZzrKBUBvEYZs
	3UwpA8UpTMFsZTd06CqAWYu91z1j+YU25Nh4RkzmUUa89yGEkySRUBrpUWKU0kkF
	HlgQKxOaufXnYbur8AZ83pwDuk/C86D9lZh6nvA3e5+RZQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b34uf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:04:34 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac74b0596so2888377e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420273; x=1795025073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yMzNv0aTJrSt8UYD2LUVyq/F8tblmivrrCSb6+nO2Ts=;
        b=BdGMCfxW0qml5/UbPKV7+wMp8pM8vLh/0QBYyuK7eccEQzfzsnWDbqBqam0lMaGvTN
         dqcZn5BCpTsvrF4Y5SdZpKkD+u7WkiBYoLCx/v+elbfidtxob1vgOb2II/8pGKoD+nOL
         tdiRHi0MczRAYGylGuR8/qTc7inizX+d4E8YvcwcgN5k7+91ES4aD1kWKF5ygGjbGFmN
         f/VdvKsiNSoTiQGciuav6CfGy3Jvz+yJmVKepMMmKVlqfEWCKnWFe7VVBYdjzzOQC81b
         g/u/O9PgKE465ONkNizgYHduX+tJN6zfD4i2xHbKod7wXijkZnvPpe/yvEBHJxS0X2zX
         w5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420273; x=1795025073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMzNv0aTJrSt8UYD2LUVyq/F8tblmivrrCSb6+nO2Ts=;
        b=rH6S8z4SPl+WgQw3afmvzI6QjBG4XexH3u79R5/5UExYqkgmF06D6yoaAzLNZrJsMg
         mFlfr/+fiMIEsoSD8OkJzfTESf8CFQdXKRq1Uh+9PgTbaXKDmw9EkfzEKqIkpUW6jgNI
         bTtI8pECdFCT66V1HUlfI82+SLcDhHWmhZjGBGW6zUw8O5XfMxQaxJ6BoD7a9uB/Sc55
         Xa2x4xVoUWXZ3adyhMVqu7uq2K4qGIVQub8TAezZtPpkOE4vy9u7wnXyFMk9EsBN6BZr
         YJ4jq/iQBgoqidWr83x0sTHn/3QJiKHCWsnxVQjFQvxxct9lf4b2f7jU279UTa51Q6lD
         6LmQ==
X-Forwarded-Encrypted: i=1; AL+hErFr2eDxbHPgd/CoicGNgFzCW3Hp/LI5Wr9HqyYH0P31Ah4XdlBL43U69lnlzmXw9Q47kS4RrkZgmVqxG3op@vger.kernel.org
X-Gm-Message-State: APuU4Z/volqMQEGZPAJT1rLqwDi1usNEvpbYvqOGQCuqxPlVUht/L+xy
	lsNA+XxJ/6hg+7q6OK2kqaIUYzepe5bzQcplvkJCkEK7w6/7rZ7bqzr7Ovw8DqjPkAAk874Fk/b
	RFk/FtnN8ade00EpjkE60NTvyK8LNALEoDaU4M3tbDuY8Zeg7oxKC0lPWDjXwdsKaeEDx
X-Gm-Gg: AYBFou2GU4hTWwsT0ygJZhY8qA7g0xd5J4FJfQ4xkVOncGu+JChW8QyXJy84/Ng7B7h
	RzGzSMwOJNaLoX2lKvkqlp8Dmh0LHM2k1c9TLRSXr9RNxd7FpJTxuU8+XBFmS41Okis1IVMEvnW
	lLgih2M/3rX/pvNLS9m4mxhLK1nT/lstvXoJ3LcnJXWVK6Adn/uI+cozekhflW6ECpWfJD4e+fD
	5MwPPqnpRhMdn2B819KOGLpzlDBECpW5wUWT7OCLFeVV2iRhyc7aeC+3rTAFoQR1xvS1BgUi/Gv
	E5C8uEffaWCmXmuxC/7ayFnzxwSaDhvVo06ufzpKj7t/JypVgFzOXS5idZHpKhBPjNMgsR8L/Ff
	nRyB6NXy5bzvhEPz4bCpjUeT+N85xAgK17nGk0fEwCs7vPLQ6yxAwm1pTNLF411hmtb9dCAQN0G
	KjR1+QQ6g1a3il2sGh22AwW5GUnUsTvRiV8dSOLM6aD90/bLaQesam4V6LZOroWA==
X-Received: by 2002:a05:6122:3c44:b0:5c9:c60e:3a4a with SMTP id 71dfb90a1353d-5ee1c4ae46amr1391429e0c.22.1794420273240;
        Wed, 11 Nov 2026 10:04:33 -0800 (PST)
X-Received: by 2002:a05:6122:3c44:b0:5c9:c60e:3a4a with SMTP id 71dfb90a1353d-5ee1c4ae46amr1391338e0c.22.1794420272673;
        Wed, 11 Nov 2026 10:04:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157baa637sm1056344e87.33.2026.11.11.10.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:04:31 -0800 (PST)
Date: Wed, 11 Nov 2026 20:04:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sa8775p-mdss: Remove
 bouncing Mahadevan
Message-ID: <2gfqgoiyvspgjj246a5go5ij5yrq6kvgw3vv2ttdbn2iobvbqs@bronlyxmhjqh>
References: <20261110130255.134252-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261110130255.134252-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af4ae32 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=euJXWGPXM6RQpXQweeQA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX7yz80ukbRhyT
 RtfmFjiUDpmyIgzOJwAMKzILMkT1YWS7rKMYWBLgIOycJIB7S17Ls965HDrueh2jyZGgDntBBK7
 jAZFRbcJWCW5JxlxeWmtxy0frGvlCxGE/mKnVLrc3joFYY3+84NpEfLvqBtLfVruaYOeO+sp7rW
 MSzKzyqxRh1fmP/tgyIoo+g/0Fxc5/jJF9SkA9mYsfFoIriEtjyeGaFZKxZUfOCgAgmazJ4SJy7
 MS4ER9FAl1EHKDHpUvUt9i3c8/kxE1dPQQFgxqBOXn85OFWbwZyBUtsiNsmO1PY6KTndpVs8/cw
 vH1spKdTEvrbRl7XKWptj6QckiOP0ht0IZeLo2D3o+PfigM9Dxo8Qq5Sy+u6QQOxNbd6jtBClcK
 kik+gTrOIoAVF5CNMsYo5DP3gv80pDEybMj7L43eE6nJn7Ptej19mdiycmxdkdTwJYhxILro2Pb
 4VJFSUuTY/hr02CnXjQ==
X-Proofpoint-GUID: OKRwVpz9lF4ETCvgQJwnWCWfMBZolyNA
X-Proofpoint-ORIG-GUID: OKRwVpz9lF4ETCvgQJwnWCWfMBZolyNA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX3blemCx7NIbm
 9bsNoRoF29orHVDhU/V5yMOOoe3pw7e1Ei7gUK93WRKuSKrNLgXBuoX9dtLWXQJESzzVqKWMWiL
 CbD/ghqolRNSkHh1D8FZeK8dOlah4qI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Tue, Nov 10, 2026 at 02:02:56PM +0100, Krzysztof Kozlowski wrote:
> Emails to Mahadevan bounce permanently (error 550), so change the
> maintainer to DRM MSM maintainers (Dmitry Baryshkov and Rob Clark).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml     | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
