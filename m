Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665320;
	b=DOj5J8WTgZGaeIgUqNd2ml51/Qb41CI/6W2D4oXEKhoacUhhqW8Tk+3NYMofMxJgBORb
	 cdrhUznvz325BLYp+uVumdny5q3EdvxxblJIecgdfjKuHW/rdeHeSvPsMhBwOj5QEYDm/
	 x1kJfU8lNocWjweZndmLnOPWFqah+qDVBs1odRUmrJdDssO+4024sSqugnAZn+BG6JF5/
	 WTz6/53IpXIc2bbFx6szgm9TnoR8Lr3F9XiK5Bf4GcUnPnY7pKUGxRj5SGPhxnE914eF7
	 Zo+3O6HEqiDZO5kF8S5DOv66Nxx0WXqxIeYXI70KxEKdA8NJuMsGv6QKlRMzMIxFzhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eMMlBkiBglKEFlIFcMpO1HS8+5XdfdFxQcz6LUDiswM=;
	b=VPmxqFMRt1SXw3RCQjZ1OtJWNXpvoA+vt4aI0xztMrftO72XteFS6MzwZXxTVjLF2nhu
	 JBxJLEnxJMqnRF02h6z/13Y1ykCHx+j3MGHQVUzU4xQxdmxdVQsk+gEpmkgGjhg7lPB2l
	 k2AeYvjTs3D8kJqWPDwR4ypD6KBYf1cXjubHkM1bs3NPD7WI0/UA5C4SRdXtzZYdfPGiK
	 PGEUHpNSnF3dZC5PEOYas74YcYkpwDHNHhydmLb1/JIsoTolqo5fT5a5Ya4Omx612J1mK
	 iQdYI4e3JU6tjscg60ylPDx91Ji/Mo6Sb8q4Bkj83Eb8kXkmjLjFECuX8tffKq8iI6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNi5VkQn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJOfSVxV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC7A606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC7A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNi5VkQn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJOfSVxV
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0vAH3430596
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eMMlBkiBglKEFlIFcMpO1HS8
	+5XdfdFxQcz6LUDiswM=; b=JNi5VkQnrtvQpSiIzLwGr1FQui4AhDWIsK2hjoRA
	6GxG1jH527R+2ir5wlhLxQj7vi41bJh2lR3QPYJ4L8NRHg/Tm5AhCHBk0wdRhRJ8
	qxeW/C8CqHzS/2OSDJGBbWMx9/5M6qOYubOtqiJABz1Z/viV3MkaG+76cE8LN4Kk
	qA+GFUO878Ymoyz73H9DYJl1ThUUlffcbOrlOWBvjHnQYFtBwtV6vuzODdfgonpV
	ubFi2KqQVCHq4SaTupEXTiu7ksCPYIXBWjbdaKDIadMWV0UB0J6wQOY84p+MuFlr
	0FZylx9LA8BBdnTRTL87zPf+2LVUl7wcNl4pLaS6iPA7uA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93at2yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:35:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso302329685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665318; x=1793270118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMMlBkiBglKEFlIFcMpO1HS8+5XdfdFxQcz6LUDiswM=;
        b=JJOfSVxV42wRqAx4xZKEN0UI7ltOQZYSX27xRtzPuB21TFGfOdYb9I0DHSohFiboKz
         okcc3YEirS/kSKmkvb7YJ9irNARsL/I1aJ5HnmiPDzDp7WWhSjx465oRSVgxeHFFyHat
         ZKKO/25lL83F0DrWzUAUdaC8sepsoK9suk3A9oRUbT8kr/6fT6I9d2WMpsAcOlAsTTPf
         oEOknIbhNY1hi7hIJJxdNn+xMDsPtGl3deIxk++Zj1leF/0o+k0eWe3kU5NWgNU2YgR8
         rf1j2qeVsqCEXN/yXhbvuip/h5Cq1bXyohJHEgudtM7KIN0dBVP0SOALqcy8NI11FhU9
         S74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665318; x=1793270118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMMlBkiBglKEFlIFcMpO1HS8+5XdfdFxQcz6LUDiswM=;
        b=UEGhfvIPa0OoCSxVmXWxbPKQPuKkyZMAXVxZ1WyQPUouYEaXih2wAECu2HC1brC1vl
         iu1xDS0BvJeWyjukWTqLF45oVywnIkLUBHKGQcM7BodznAbxDB2T3q5kIc49zIpkz3u/
         Bqy+oM/kRs3GNNhV3OLPSvtpRpJXQtb6QdgmP1UT+j8gx9Wx/KRYXMPT9KuAlNdpANFN
         BV4tXONAEYNFWjW5pB3wlsi40jWUobGYeosG0ak78bZ3EpLTXoTefazmxJxEwG6BHMTz
         L9usWJYJXhVPJr5fwqDuI+YVPIgRMPmDYzX7vLNaTLRYLo5suV2ZK2QcbM4jGJJtiY6Z
         A1Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxP2S1Pyr42iPOVi2hHo1mBbsCv0eRdzY7TWUuE9M6/Dh0ybl2rCJRfb47ibZkM6+tEA+5Y2wJmxxDZh7e4@vger.kernel.org
X-Gm-Message-State: AFq9FYL5LKMSyWuhTFo5MFQBN/68KLUOsQssedutqEr4PX9TsspbCQTL
	QkIGcCMpaP92phWqzOs9VAcRJD/EqMDpvjoQ2X5AKzG2rqkGVGfXTzxTqKNMS6nfirIwKc5jo/i
	RdTio2rnITw76saRA+4Vx4sL5zyxTKCk7i1mG56b1SXfKj6Q7v7lzSvMz6wp47MwTPxsZ
X-Gm-Gg: AYBFou2XWBxq+cYC8c4Q5U2aU52NfDF1+3JnQX1m6fwnhNsFU5xLq0cDqc3OwVipz1V
	k6zB/5qXBhG6c5NkRzRnzEFgDDXYhd+TzUucgXE7Ty1c6D4CzAa8ahTpfgDl+7Jn4agxB/UvV0/
	+uiw7bjAutU/n7Gm1KJ6wgZGIBkZZcaRnwdddpfoIyolDB039Ipi41ew/wmsyY8/suT5DT6DYhJ
	esfRqnQUccWgI+MaZk8Bymcpge4GQyP5x0VqR9uNCfza2eeGFrfozGZnVpIOsRpbsMUnTdJLpF+
	6/jvnygGQ//SHlwZ9tRLLhZE916/a/x2wGxb5tSq0OAEi9fuyxsYk15fgbBLc5hjEpggKdRTHU8
	HgaCe32YAPeug6UKRKOpRtlXphC9m50jRfwKGgCm1oNmHkTpMXXxXkSVFlNUdU7iuYKsCPdJp6j
	l1VpLewPftA6Sm
X-Received: by 2002:a05:620a:1a1a:b0:93f:2aa8:c555 with SMTP id af79cd13be357-93f57fad39dmr836390985a.57.1792665318321;
        Thu, 22 Oct 2026 03:35:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:93f:2aa8:c555 with SMTP id af79cd13be357-93f57fad39dmr836387985a.57.1792665317902;
        Thu, 22 Oct 2026 03:35:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f563b9csm7087601fa.21.2026.10.22.03.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:35:16 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:35:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: add DisplayPort audio
 playback support
Message-ID: <u7odzamh4yvuw6c4o3arswpxf3g4uf422pjhioryqxjpsempeq@u3pulod5wuel>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfXx+JTJ3rpY5qL
 Bx2DLcApFctn6kyiLeEErHamsvc9cskIENxXklXWi81vpTfkFmKb0EHmH3bHRwZdJGE06jfc+mJ
 glyXedQCz8DleYDeH4Et9hP8ozDj1VJWZLB8Ac5Br9DUO4FFVnHcvBhycX2n+JUT4cAmi0iiZrH
 S94xry2CnGne1I6k3iSGOgiKpB6RL3UngpDTuGTqbS97xQj0awHJZepuk8OlbS/Gdndm11lZq5A
 4lNck37QsOF/7iAsZ3XFUSCn0gE+uPOEz016wUbXPrkk8lvaimRUfoDHAlJiHoU58tFTk5QnwNj
 P1O5FbWlFAQF5mQIwlG0RIWNo397XQu9DNPWLnCWfYFQQkYEy5gppIXj+vW2IZvNW3KaZ7rHIqx
 Rmc3yk/x0R0ftei2LxZBsEJ7BPiyVraznDCMNTTMqYgk3H57Zab8tHw7LcZycelpvfjA55s6Dfu
 d9n6sArV8D3ncfFHyHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX8uR38wZuPo7P
 ULZST8uMpwD3quRrRbjbCAbwpy1AZu6yrKfLUz+RRZunXiDoxJm9//qLtJWCt+HBdT0LY28e5BI
 jMX6oA/OOQs4ZVkfjVyhoUB0WVgCrLI=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9e6e6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: azyhSkbECW89TKVvAYxkg9QwSZYoAC9F
X-Proofpoint-ORIG-GUID: azyhSkbECW89TKVvAYxkg9QwSZYoAC9F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:25AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
