Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705308;
	b=DBzfCGeg40CDUa7uZd7FakyQXz6c6MZBHsevXcz9y9vbw0k4OeLrsEW5L2PK7/1zsOyA
	 xGT2eKfotlhcxefVahCvXm9KuM98neKPafMgSayROvHwsxRx+z354j3u+b/GS35m0lb15
	 QhqzCqv2ZrhXLcuTrBl0Qpegsb92RTlJWr7n51AznkDWi8sRY9X3CBTs7xhKuVGIa15r4
	 WCBLnJBepN0tqiOgM+WTzPaUUUhnp8+l+yC8De7+c7Jgxk/T1VqFRkpMljgMz/HCn+pYy
	 YySbNBtdEg2dXgV6e9RhvpuZZFxR1ReTcw+OLzHjD+D0KKMznFua/dZhbugErociFZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n1K8gFpZzIXklkm69VHcUMsC/cRmRqUO7+6aC1hGQj0=;
	b=3E/VEC32C5dntrw1afjqDDaJDiTT7dEA//deRREOJ2xH+L8zRXGGgBjJywF4qOLmVO1A
	 j4iisUzHvHMR42Qtl67fDyCyunS+KPJZ816i2As6Geyzt4igvr8VxTJQdCADHmKpRMq2C
	 AseRrsuwUm3wPKD9E2oh3SjKwe0KVKvqncluqTN+iaZG7h9LsacgF1hG5Vf4BWnluW61G
	 40t1qC42okRtTN3ZRS41tutyuldEjKDsHQFvjcb90/wxXK7vbNyKNpcePm6dRwxo5E/eG
	 VNYP/7vsu8FpsPqxLF8G9ZeI3IH9eIGDswrQWa8PBxOApAJMFiC8eiUbziZ8n9vhcFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KnupJP/F";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0uxnspA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0378606A800
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 11:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0378606A800
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KnupJP/F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0uxnspA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAE0D1476068
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 11:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1K8gFpZzIXklkm69VHcUMsC/cRmRqUO7+6aC1hGQj0=; b=KnupJP/FW7mAWCsw
	aU1LVx4SL4IT8JWOW0VVn4IyZX9XVtf5/TByL67nDPHKbTxpTx/L/Pq5o+oMgFpf
	eUeUBFomC4sTkPQAoex78wyVeicqkBABHA1VgFCue47OdNE1T3BWBivoqbV5p6rW
	8BwSsRErapGQxFRxvMtw5q2reXZpnsAF5VYqXCH83hl3OMcAb4ph2qyxSdmsgSYg
	QRpYlHr3DA/PrOVZvweFt1Yx4hM1o3F13M/T/fsZsc9EAy9atUnOU0G71nnkZK7B
	/f4L9E/tvhYcQoZV+tdrMILWnn5oa+OfanSUWPfauXWQaEsZfm8DkEua2/wyAAjL
	TalODA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5hhm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 11:28:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943fffbc5dbso65963685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 03:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705306; x=1794310106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1K8gFpZzIXklkm69VHcUMsC/cRmRqUO7+6aC1hGQj0=;
        b=O0uxnspA/wos0Znj/TX1s2wyZcvF2X55bbuMbGegwatHE+Ojb7JufjEQ/iMYNfGPZ9
         36MC866H2qYr8RinQxsYwOWHzbcrlPhmD04gT4rFJ/Awe7+sPDp4Faxa29UKxCTQ3WS+
         jg5dlxEnUoANgfqWaLTvM8W8qtIrgHtR6evb48eCqMSANIL6WT6QimgP8vTaYUxjF3YJ
         g+RiDJa0VELe6xcelbQ1dguLjAmF3OTqQJyRbUFowC4jFleaFN4eOKLCOK/QRfeEKYWm
         ZRME5M1fe5BuUUT99lac7QFInazMwkLXzGyc7vV0xfVvDPims6o7TCSVPxbinOQyJRcQ
         cCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705306; x=1794310106;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1K8gFpZzIXklkm69VHcUMsC/cRmRqUO7+6aC1hGQj0=;
        b=axtn8qDDW98im3os0tdn59BvrcAgxqLoeGn+I5YrFGsWZrl0XlLxNmJRldPMVN+iix
         HDjxFi61qER+JPuQ34PyZxq/10eB92wlgmetZBaxlW7PSxdOvhGOvlX847by+BjYhI3D
         5ZJdShkFOt+X4WD0AfaqxXlc8xl4qm20BGTYbwjzpckjbLKo5tvLyaMn0VDAaL7BPuWA
         DNktGIXGrLlHiAceglidcqAtuCp6BtnXGoMHqYWkI9b9njDycS83NdD3zG8eEEhYyBzq
         czLpO35WeqzJ6qV0MZpzo+taRdA0DXuTJuxwWx/0Up2pHj3hjhHDdeUhYl8LU6q6D+vZ
         4Ivw==
X-Gm-Message-State: APuU4Z+k/dAbyn/9xMfC+iLtLiwUIYhasQ91IZdJiR8faF67qGthpRId
	eZ0WLcOpkvghHqMfAelCenwFSc9Tpby/gaQo77rtZSZ6fZrN/R2qvbB+zbNwq0O/4DvPmQ4X9GZ
	lMpLmey1d5Dm4BEIv22Z8zBF3OOeWXosyokc1rVkjxveI0a1JMc+MR5Uif1klLnvStnWW
X-Gm-Gg: AYBFou3gaQDATfzvNxr58h3lMCz2QpQtb6J+DrQGBuV0yVUwrz17F0bygAVG0sSc0bH
	jRbl5k0ctqIrJU7oetNdJHtf23ic+M3Ok4HkIpSxucBjQGX83+Pe8VSG+ksb64wCHbtGGXAv1xG
	iiR+PrcdT1QuSx1nrJBCbdXHgDZiFW5BxYSjqGdA4aLidVb2ky2ajOefi22IddA7NsPHrBmhuBH
	0Qt6k/ssGa+ZYVbtNfC/uHpD3Zawu1mPq87IjOJdd7yGWCmfPTb+R4F+3fQA2JFyd+QBB9VJxd2
	u4M3WwIIkPIfw/C7tR1SC30umrBefi52ZPHxpONm2jYjrZ1p4fKixwRyFLTa7KPTHbXdxIe7s92
	098KhrzpZlbpmy1rc0QYbOndKlR79u4IR1ymbDXi0XO86XFoE4pV+IrkmLQmCoJKWVCcLag==
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr2278427385a.3.1793705306124;
        Tue, 03 Nov 2026 03:28:26 -0800 (PST)
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr2278423685a.3.1793705305627;
        Tue, 03 Nov 2026 03:28:25 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca214fdsm3956570a12.36.2026.11.03.03.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:28:24 -0800 (PST)
Message-ID: <337e7d96-d45a-48a1-9530-909a00c0d610@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:28:22 +0100
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
Subject: Re: [PATCH v2 4/4] drm/msm: Inhibit IFPC for state snapshot
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-5-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102190010.720443-5-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n2wQlAwXIQZQauD2Y7Ob1L4eLMCQYSMJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfXx8yKJf8oKsXz
 KXtOrJ3hVWjn7hAZpsvX8XsVOro2gs5uwzE8bV+/spL5GCKvLRxfmGhvJwm/gHKcRHaIaR1exNX
 UUK/oCJLk/sVzwBbF4CxOSJKf3yBFW4=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9c55a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: n2wQlAwXIQZQauD2Y7Ob1L4eLMCQYSMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX/MgSAKBaP4H9
 mwfzcMaeMHoaQJIuvikHc6jqWHk8RZSQAEqMEIEJg+78WhkQqZw0ChYvWCi7BecrRw7oFOymtde
 b6CwwfM7fpn17EbpgKvIaAHQJomN03nLI5BjKBOiZEAOQpgWokKAv8CA0xE9aOPrvngT+Z1/dVc
 aalRqOkah7e6kS1x//U4cmhrsIBQcwF6eOnXqwbw8/vzExaSX9gMusXW/XxNeq4Ev5yfNu+gC0Q
 n3Muey3W2DAE5jN7t3DxBkkezExmNAq5OwNWsSiy+oB1nvRbG7YfZnWXN8N/132MVJARDPQ3tQM
 qSiCRL7H5PfjW5cb8ydHNi/KCQF74YESuvbp7kGhOYlL6CV6Rg8tcjnp/d2Pm7hfM8N7eLyKjhF
 DsE3GFEs6jDmKxc7POkKLkllitvy5A9T/hMsbrQSSGDh51BQVC5MeuGDc6J5AFjxFVTiUzzgJ5v
 Bg75lPAuKGlp8vZmJUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045

On 11/2/26 8:00 PM, Rob Clark wrote:
> We need the GPU to stay awake for this.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
