Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706040;
	b=ZBLwRjWy1wQ2zhiG07Yck+UN0fH4Z1j6d1Cur8jZCLXffW1lXoWYyXg3X6y8Cb4lHh5f
	 2qJipNG8rjjsoyAvpvCu+PsyOijIEnssUpLpx4LWF7oJ1FU8k8Vv9yzoUWh/IXqmKVA3p
	 15vOJy9DHfEvm4im5R5Vkk1KsTCdKogdsrXdt13996HDbgyGMRMztydb7fOXaNcWO/82Y
	 54M5eZNo927z9NGCReCoCEJcBJV3QJa+qOyCGMc2Wc2gZZP/BTUS8bKTpZtjlaIb6ellP
	 oHp/WzFPOBpT0twuc2COcNDN+L9UOach1Wtz2VqWW5QaoNozQ738Kq/TSHlylagiMpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D/FO6YpKaEZyuI+tOQ5hSqOHGNnCb5sKIIH3PegRd3c=;
	b=QTtT4EpBNMX2Qe9N6OE/Z4QR3hKGQt3/Gfu5iL+IP1vYDLWLPa9i7g/+MSjN6nIS+bP1
	 xm/fvYMW6ardNQZRP6WTiKOml7SLftTcFyCYCd/GHrLjMLnzes202bOGzkwmtLGyRG+NJ
	 EfNGLNyquZSVA0YgF8K8cy+0P7YFKvo4Xwn4j+m3wfkqTEZaF54CWdP2zivMei892euab
	 9w0SnyireFq6bksLH7OsQwOwwZILKG/2kfPq2ywomq+gJ/8yEPRLdoeQqJx7upNOd3VM4
	 pQc39VcIPIxetFGxY+421YhyfhX2yEfygD+JTbMEFb8+6iPlKjYLcC+t3IZ7sa5zIbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FiogIaaP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRPYdIEV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A32606A32F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 11:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A32606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FiogIaaP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRPYdIEV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAF6n1476090
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 11:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/FO6YpKaEZyuI+tOQ5hSqOHGNnCb5sKIIH3PegRd3c=; b=FiogIaaPYpXXIDum
	pitbsoBx7M1oAzx4YFWUUWzflsdBDarJmI/IoIR6QOi6bVlLDcctGiIVzccDincc
	O33Dw91buL66saAR6Tnxa6xwSxSUDCNxB0KxREl/Wzweny65VyY3gcFkKQppjvIl
	thoQuscmRvHsYGl9//oS+drgX0uJeDF/R9cS5Sjt/XT4B6BneYEx3W6s1sZpXQ0I
	DPcmODvUnQPX+DnGf79YkA4spKXkYDvFqlqMwQduXanP7zwz0JNC/g2TGMqUfGHP
	sjpMPMihRr3KCNv6jeomr/NlYIfgsuAbtt2Dk2p0rrIvYk6WKUE1pvgRIpPabsBc
	VdfTOA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5hk08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 11:40:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536708d1a3eso7287621cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 03:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793706038; x=1794310838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/FO6YpKaEZyuI+tOQ5hSqOHGNnCb5sKIIH3PegRd3c=;
        b=GRPYdIEVP2IieXb7TEmu+aKb64NGQsNFAvNsFqKYdY49HxkUVhlkauBT9VcThSHaUS
         eR1lWCQPN4HTY+E5lIFjYmswKyzujadgUWhA/GWHVByJV5AKdbxSQgkpAnCGMqNAVfQ+
         iEtGKKI3S756hvPiBENlQyeGNmwjm9k6/dmn+gZ8akX43k8lmqnC4sqIDnPHPMvgqaLp
         l7rqncgKx2s6KdZQ7A904zjYRSxLOQLoT4hdhLY2Tkgi7be4zHjtb9ORowBsk+6rxHYg
         6+zAWrrX3SmYlNh7WVfakGH3CMjwhbVM/rgnrfalN9bAALzPOkNcqMFWXn/J3qwXF2vd
         lnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706038; x=1794310838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/FO6YpKaEZyuI+tOQ5hSqOHGNnCb5sKIIH3PegRd3c=;
        b=aAQSBar/CEs9RVehGyxfMt4eap0YOiWit3CoHFRT4YaY/5z+XuvMXYMgsk+nycEGPK
         2AxoxNc6AdTRM4c8EsMnAu8OB03KXg+0IHMGsx069/TUrDX0cfAwOmHd2pfrLbstbxpx
         ZtgcNDIJzvHx1YUsbaWgiKJl1/1zsV5qO5XlHblwNFoDr+oHGVxjLwPR4aNMmStldBMn
         vHnkJ4GAHnWwa4IhesDnL5pqaAyPEt23zn1FrM1mTFBm416MNlolpCeWo16AFS0HNT5g
         Zjc3m/O1DGkdUxOI1Ad0V8FbxC8R0Wr5+n4pGo/fsSVdNV/5Xt68k11VQdBaR3IcEUj/
         rl1g==
X-Gm-Message-State: APuU4Z/4EtorH9c7BnOjQBANt47zNkmFBsCwP79aKE05TNkvjL9l2hkn
	JVGK2YyjmQc3eowBFIME4W3A2h+QlaVBJ62lZZwbHFAsADsZW92iHA887bgTQf0+9InmrzPZ9GK
	v4paUiZUU1a3mZKeKhNsaUwBp86GT7WwYtRsOpBd5v7LkvXv00/qxOczA3I8k2W/p8DYP
X-Gm-Gg: AYBFou2c6awPyMLHiWmW/Zj8ZqbM+MFpeBUZ8SsZN7uvTsoYdMCgBSwTGKC0cmumoqM
	E61ekwMER9cfyDA4XU3bgXCMLZ7glC+V4paiWqSGpzuFIQI5tPif/Sh4Yw6EEM3Vol/s9NyNUit
	JigD9vr29Fj/2B8j9sY0FWTlZOW2VMG8VUDqmLfihxZtzbJhBG/q4qLNPVsfWqt7F4stCl45Xfs
	jdHYMc5lobSjfbSZZzOm4stjO21Xxw6zgQZvONVDlicmUZFvdR4okHzocPkDNYdYZ4Kxv0oLY5E
	A7BbMo1pm809+V6nMWkHU6UvGw9gn+2wCFvdDk/QZ41/z8IPPNHYeXOo6bOAODSoqkvaq2Zt8Qo
	+7glG3NvuGWKKBdWeplc/xyNtiqer6/io1ivKXKZi6fAlk1o8ILl0pxkVi2SDaFpGRgZumg==
X-Received: by 2002:a05:622a:8447:20b0:543:18d7:1823 with SMTP id d75a77b69052e-54318d75457mr190129901cf.4.1793706037793;
        Tue, 03 Nov 2026 03:40:37 -0800 (PST)
X-Received: by 2002:a05:622a:8447:20b0:543:18d7:1823 with SMTP id d75a77b69052e-54318d75457mr190129551cf.4.1793706037206;
        Tue, 03 Nov 2026 03:40:37 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf2ef54sm75777466b.47.2026.11.03.03.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:40:36 -0800 (PST)
Message-ID: <e8075b30-3407-480e-9c83-320b15001f2d@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:40:33 +0100
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
Subject: Re: [PATCH v3 3/4] drm/msm/gem: Decrement loop idx if handle lookup
 fails
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
 <20261102172001.508440-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102172001.508440-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tg7c9gb9JhrAyq3YJgBPi4LPlZkYuEFR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX/nryTp254+QM
 MgXIiEO9jvLnhTq0akYGkfE76np5ktJyF9sprc7epU2EDzVru81Fub8+XxOXI/bayQGV6d9JPuu
 UmS9GRWvxYRfWLR12uZHqzBlerBgzm0=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9c836 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Tg7c9gb9JhrAyq3YJgBPi4LPlZkYuEFR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX6adRrkNNwta8
 S25GL8rCGIA4wIlCkyMR+E6lFuQvdDds1D7Ls2+an+Av6WiEXlHZdrwLhT+6iHaI7wYdZpWfHDd
 aiwxDtRxcVc9zThHUt3tobBoyOW3Xwy/qlN5x4OeFIb/5kYbRStHmB8FHQV4NfrgM4xiZx7WB7d
 kJbAgiSqRJtSkYW6cpIjCBP20kTkgXusO6t8NVcyc+CJpcS6070tTn1+you6nB19QUzLpoF8XUc
 QuFznMDj7I+fwRDKRc/uv88mh0aVtz1PckS/o7Bs96UXOOEFQp3hGY8U3PgXY6BGFIqQNBkpO90
 157eoFQ4SfnGUzWahf5rwFuLCqHL/+2hLRBxZHShy5OmsHAna4E6iQuzFa7QKl7aV64hI9mQJCP
 nGwWKB0+Ewyxb8KbthRxXN+cccoMu3/mID2QEngtfiV55Ylg5At/hnyOHTySN/ncIfQX3iSurBc
 celH3fymQP9o5Ci2flQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030046

On 11/2/26 6:19 PM, Rob Clark wrote:
> In the out_unlock unlock loop, we should skip the op which still has the
> gem handle instead of gem obj ptr.
> 
> Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
