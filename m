Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705791;
	b=0wS3MSP8kCO2ZfVntOJssZXMb+CnGGm1fyGq9/Uv8TjX0oD5n/A4lowQZMpNJ5NwOt8v
	 B9TuF1RjFRB6WeLF6UaCeCU7MaKmHmm4kq0rdDzcCLbNpAyIOG1QbcFJNdqgvuWtUzWIf
	 eVcjxyCcAtWxzVEwCsVierR91aO2KrUqCpHpHbY/X35rTpp7d28HeQtcR/roYsUb/SY1k
	 o7rOskLuUTJCgUQdxTL9dbZ0kv0lgjzG0sdy6XFlZSMffFXF2Fy/eiUzlApmvIZoE1ss0
	 LGOxi24ODZplAFlp9XXuRdKXKQ/7YnRU1LITXDnzc9W9SWk4WTsuKyiPI/xTdGS/qWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rZ/601LWddKHMRgUDrwkuLM8pPkuLsinigUnQn8yf+E=;
	b=c2FgKzhpR78msHW0/qYGRHvdY4r8kwYxCC7suyHAD+vwps3hRzEQt2uzNW2MutkSUdTP
	 Wf43gJw+neQM3fc85qDkbYfKRp8PHiVC/5AI5uFBpjo9KLEovRsCRAHOv1Nd4g7YssgpL
	 nWBWgb23z12jlBJp+6EbPFaumJgbEviuFClwtwZIT0XSdxAeRqgQhUQUriBWzN34KL0fN
	 V2amBpdW996AKf0YtRnKj7XX7Dmcv4ASuQFj5C9ZPWW2kpTOUDznhIpoP8a+1lid6Ygkz
	 6/ldazjmUoRyIbh9xHYTemcuqGtfeSukv9GcSCifNO/yn9HXzUpeGsj4lHtv1hG+byw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KHMplylt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LX8BspfE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7C6606D831
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 11:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E7C6606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KHMplylt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LX8BspfE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAC7u3161605
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 11:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZ/601LWddKHMRgUDrwkuLM8pPkuLsinigUnQn8yf+E=; b=KHMplylt4qd2nDjQ
	XOXksdjHd5gcy0dypge2wbhnRkW9tI3lPh0gz7q+5BxoJ6tsve5QpTfz/9vsD9JG
	JDjcL9M94cWFthloiMLCzyUisqxd222ClNjt4LfOmQuEQ24YnQxR+Cij0js1F3Ll
	57pZ9QMOeZ0m9FIsuNPCE27TIF3+YypbCGnpwMVDLxrDIY2h3dPJzm2F1HDKSJx6
	/5GdyroFIOruTALi6gyGIMbJY7tDfz1qivYe0/WCo/g9ow/8OrbRSnACMVJLbnEq
	b1jJQyIYHCfidwrbh478gFQY0Tc5gbDmjiciQqFvu0ZWsQ66lVYl0h7PFZlXpBkN
	sWWHJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9a10t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 11:36:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb1091fffso44317185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 03:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705788; x=1794310588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZ/601LWddKHMRgUDrwkuLM8pPkuLsinigUnQn8yf+E=;
        b=LX8BspfEjstCwuPIloY5vTF70jOiDKYaW8jew3uDui9uZ8Y5ac2LSgkiVEyQsPpWoF
         hPY78adtTfe+u+9dGTOSBlwzyGxqPEn0U5nD5L+gSiMQGCkYq0FshxAbMdLd+lb354aK
         iGRO4tDDoEY3t3f9PFC51cUKcGo5hxN8OjbebB/YzyqhhHNUng5zwhuVXzWZsJjiftAS
         gba0TLNlwb5poybpVXO6nVca0kfCuzwFAEellCo4TqzE372lhSlR+IE7UkQqaX8qSI1m
         DkSkq9msv6jJB7eLm6bwWzfbV0fx9/Ool9ZJ/p+VC6F5zrgwhJm8mV8KPZ66JEKKk3oY
         9Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705788; x=1794310588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZ/601LWddKHMRgUDrwkuLM8pPkuLsinigUnQn8yf+E=;
        b=RcsfBZ9QM9I37TwpMs7ilZb/WTqjf9AidyFQAn6fFmjRM+LkkVJJjHPbg/4wBBCv+U
         iDoiahGNpz8tLnMoE5B52MK9mWGHE5bbr3NLZzmC1drUEF4AiNUSLJ2+nom30Bvn+E1M
         Qil1RX94KC7372dpt5pvzOymX55Ggops20sQStiIWi96NHtf/JLhB//YmaFz33f9zkjK
         kEOwNhIIU98us9UDih54FOVdh2ZC+MwCRB1BkUgh8ycxagMqZb+Rl5+dIAMk57sB3Zam
         wZ6EoAcXmWTWgOTayMzl2esI9uDIbSp/kP8ae/4nhqd9vczVAyX+vNsqPtHmXQf+NM2o
         W05g==
X-Gm-Message-State: APuU4Z9IToVa/ZTFp91nRYub7sFWJhQrmuV5FC0piyjSg4Bz6g7jAS1M
	qZSJoWb7fk0YnUcxxub2uvTgtX6jJitiGcydNvPbVspDp3OeoM2S3YeBBJJR0jsaj8YS7yTijfY
	Emg7jtU/u/7zejIyMRFkYzMRPAS6UcwOoLz/8SWSnrlm1zHxmuAQ55Dtohvj+AQLb1zK5
X-Gm-Gg: AYBFou0XZMBsojbEfcL82A7+cZ9Fqg3AGp5tVuwN5mlF00hQ0Yql89aoGqOEfwYQy3W
	aStLQaBmvKCdyhLrdfbhwY0dG7O2BMs8ZiJUEW0u1JSGwamMqIrIHuit4XSsH6XQaf74iVtc7Ze
	PBZEkKzuPpURnbEPip9V9K1FtD1BTRBgWHsq004UzUtXJo7RyKSR/JDyDApGRWviNP3vALzPVo+
	o25cm/ltZgMzNtJKIhzoZclwzSj0DUksIB9XvEeiqHCOLeF8XoGfFdLG+DOn/9u66KrBQNZ4fpr
	xDx9Bd+kLn7wY19DBVja7KbTLRfPDTVxpDvcjvOqn3OdTnIT5s7yJVgYjEOd9nOz5WC07n0V8+v
	i7/ub/xP/5cgJOKJTmEpPgQPzvGfcTCGmwRMMnnG+WW+HjBDiP6KdpMtFgPNvH5BiaV8zIA==
X-Received: by 2002:a05:620a:4d0e:b0:939:8148:1e3d with SMTP id af79cd13be357-944215b76dbmr2400377785a.2.1793705788445;
        Tue, 03 Nov 2026 03:36:28 -0800 (PST)
X-Received: by 2002:a05:620a:4d0e:b0:939:8148:1e3d with SMTP id af79cd13be357-944215b76dbmr2400373085a.2.1793705787957;
        Tue, 03 Nov 2026 03:36:27 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf44eb1sm77475666b.59.2026.11.03.03.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:36:26 -0800 (PST)
Message-ID: <a7070853-1e44-4102-8593-857ddb4cfcb8@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:36:24 +0100
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
Subject: Re: [PATCH v3 2/4] drm/msm/gem: Disallow nr_bos for VM_BIND contexts
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
 <20261102172001.508440-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102172001.508440-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NnU7FII5tZXcTF4bp8rAiB9K2tCdFdcw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX+F5tBx6bU/he
 zjfI8NQ0l/ic67Zew3JUJ8T9xEVdJ/+9WXB72wOM0K9M3F0qcruyICc3R9sz78an10L3Y6eZ3RO
 KT0RgbL4g+2rkdJ4LneRcSdDvMjcobc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX3DC/kU/EZ4xr
 bvax0RnbkNLuQ/lj7f430vr8+02jwiEh8QtN/Y3E2XG7MEu/1LA62/safOq4l5/wMICOd4yC3xS
 Tnqun2NiXvdortTiw45+axYmkyKHsoUaqwxVaSalNzRjelVivmCzag8lKfMAwymY9N2lhXMRV1n
 LoST9Cf1odsYnZ0ySZwGFWSLxNdlOlWm48P2wEqf963T7220y1mLUl9aOTZQRdSxQ0bJxOIvHzJ
 iLSCy6MvzCklcOCS6XzlXwdgNYAzlbbMPqIJEvKBaYIeDWzM0UuH8OuXFeqO+CudqyO7g/jRsL5
 8nuPYQ4DWFdPu4J71AoMDiypX0HHghHmjM8raP1zvHPUr0qBds5cJKo8vwU7Ye4wI5j8roJ3zI0
 LJjJ8jgC9JAmzXQMGca4Ou3lZJxrPBxCqAaUYjvSga3SdxG37wEDR/TaWiz/C9ItJOYIO63w+tN
 zfLuxRI29uR50ogWVsA==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9c73d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Mlro_P0Azzi2O7fenn4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: NnU7FII5tZXcTF4bp8rAiB9K2tCdFdcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030046

On 11/2/26 6:19 PM, Rob Clark wrote:
> If using VM_BIND, it is invalid to attach BOs to a GEM_SUBMIT ioctl.
> Only the VM_BIND ioctl should be used for binding objects.
> 
> Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
