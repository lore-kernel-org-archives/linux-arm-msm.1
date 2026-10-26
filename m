Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008055;
	b=kTsjJueEy1Vtoh6xK4WQH11lNp8USHyza5mfnadqrGJLSAcqbc4zU+2L4nSLYBUWA8AR
	 aHhpGid2QWQUtlWKOY5hoF1fdfzUmxAPwIDP+JpByc5ZTPyPyODNBB4DB4MBRPYPWXT87
	 daXQVFGmr6oPF8YrUy3+O0ZpihOBCMqybmZGJRqM4OfJDATFGOeLTZFCScyUPDd0LA4z/
	 hLc6FtJlT0M2lXhTbUhjiNpU+1+O3o0Qefgxc6V/t/ihTkCGWabr4U/zk7sG9jJS9AzDh
	 lCnuBTnkB6tPl/A598anaCEgYvepf7Gg0gY9F6ijzWs8Omsa43afEgCWa0eDRhe2mvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EvvplJFfhyuyl66C9bJB9eiSNKH9CgBX8ofvcWM2oto=;
	b=GMA/YiymCkOeIWZnR3ELQWPrLSx48O7PEmukjEvS5l0nVdzgvRwlJK6BOUgZoVnDvivZ
	 z13LrBlGrRBqIw03csYd9XvJZVcy7BsvJ/BS8Z4d/zeYz3tz2YtF6iNO6C74JOPxqaVzG
	 7yinq9Q4eYPUzxk7n2AjIBGF9rydVA5uGhS2aqYx8h39VhstM/pRzVGvzrmiOtBYFIt6g
	 WUX9YOnaGq+QSiFVcmXesWW/ouy3MqhsladOdzICxNogSPQp2gUHlxIR75h25gnoBI4RG
	 lhhupz6BAYIXDwwUSsMtvUPgtS7IYqGX58IctEZQequxKP0gILrnQRIuWAhNfAoDMAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hYNzNYxN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QG+qJitP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C2D60A2610
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C2D60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hYNzNYxN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QG+qJitP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bHbm718409
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvvplJFfhyuyl66C9bJB9eiSNKH9CgBX8ofvcWM2oto=; b=hYNzNYxNpZUjWKls
	QvHeOhnNOU2Nm+KKSGOdRsMeYRWFtGso4ZLfC5YrZ9wH6VCKfDVSxMyH0Uk9qE0t
	ggJU0bFUFTVsdpWtipYHDtwTmjtXNeSHCCqnCgrYwSc22hB8u0HXH8FFbW9/A5xv
	qPQh2h36K81i2Bxd2AHk4v1W/RI861Olho2RfSPngTiHfaUsDqWAeCtZBMcKEdTO
	3qM/nZtdagc1K2TlsQmg1eJvC+l2scyn5DUbbCMKzJO+y1rWuKEWHkd6cNblT3vP
	ME9ZRLZHWFuI+Tadro4UdwyrGDD4+H4Sk+s/PZz1SXmRoQTKmpfC9QLeevokoGEl
	1uYiqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgssunv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:47:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso42773185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008053; x=1793612853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvvplJFfhyuyl66C9bJB9eiSNKH9CgBX8ofvcWM2oto=;
        b=QG+qJitP858grVQ0VUiOw9QWplLb8jhRSl6LWABCfl5vX6ZR67gW7GhGr4WaOothQ6
         7b4//Ul6Vpk0Tb0g626q05ryOBIxcY1xrCgqFppc9qLUacIgZlblbWyxZ/+DBz0coQNc
         FGo+xnOfgg0+b8A+1sPnNIZrIUgzt/pElQi7gs9ISSljJK+bGOW4d4V9w7sRsoM9ZDih
         Pp+neG5eZFCJSDmOZLCOdcY3admYRdD0P5+l8SSCEVwYmXt8gg18h4lGkkw9yTSHUiMJ
         eHf97KaP3RuIokwq7zm5MnkjBFB5bRboCcZmkrUuo//eEh1I66PJoK/9rMPfnTHOTKDw
         Rylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008053; x=1793612853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvvplJFfhyuyl66C9bJB9eiSNKH9CgBX8ofvcWM2oto=;
        b=J0oZ2Uc0w1HBjDJc7mdvsS2BL1f01JZe/djFAWCk2n0lDxhwMmoJtZKw+Z938IUvxx
         m2cU34cWHHhI+aLCm7wCVuePdJndCB6cyo5DGqgf0w1qxVZja8oipzhzOXrP16vA3hr4
         XZ1MplPZo1e/kcLYbK5e8qE/Ord7HJxtZLcr3pNTZzjEJZ1PMlOUOJbfiKwmrnaqnOup
         23BCMg/3pZdTu3IKBPw6fF8wyZt3JMcULr+xA0FzRS9ePg7SgCKmRpU6W6Z5oYL4903p
         b+uuJKkc6jwnlbfNBFS/Jtt93xZ0vxGD6aepKvmpMxMbbATIB+BcqBQzGDesQVq+tqhq
         p5Aw==
X-Gm-Message-State: AFq9FYJ2qvorXPTBSjJKBl5q6VmaaqGL4wcUji35e8C6RKb+1YPeyb//
	y6q4wkffcTfRaXxFKmPMnFg++KZvXWdMY6nf9xOxSbTUNKhhbv81i0wg1sZijlPSwWlkop5hUGj
	6Y+wzfOIy5nYw6VZ77DFd2JuTd9EYO8UgGEygHCHVi9lr7hVhbntEbD5ZYCDwHzCF23wb
X-Gm-Gg: AYBFou0cgi3Y+DjO159aueaDHuDski5W9RdCEaL470mqr7zIq0+npjs2V8LNGHNDrVN
	SuvidNN5haLTNleCOwZg8w1ZUwxFdLfxzNnHQaJo42KpmpN3ZC1fE5ESneEqegUaa8vz3gvWiQ9
	YDbW3EfeB9Si6RGQJCHVG+b8ljLZxqSi0bC35EQxtsI2tWfCY8Ajk9lIGnUQvHN2a61GQfyXlhl
	WM7tByQzvCZ1aW2gWyzWJYxEQJG7z4m3/9o/2cJ4HqJXFh6U2QC+b+HeFD96YO/S0juzcN7qhzI
	hzd/iabPWTLE+tnnOGUuLJs8pFvG7hkFyMzLJS+mzQhf05reZmR/oVULlPkwg6/B5welgvsuBUE
	C7A3FrSHX1d1ge9kffEgRaA==
X-Received: by 2002:a05:620a:26e4:b0:93e:6d87:4f69 with SMTP id af79cd13be357-940ef8ec03dmr1009173285a.3.1793008052833;
        Mon, 26 Oct 2026 02:47:32 -0700 (PDT)
X-Received: by 2002:a05:620a:26e4:b0:93e:6d87:4f69 with SMTP id af79cd13be357-940ef8ec03dmr1009170885a.3.1793008052401;
        Mon, 26 Oct 2026 02:47:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd64f8b6sm295595766b.48.2026.10.26.02.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:47:31 -0700 (PDT)
Message-ID: <48d378b8-ca15-4e80-9c99-d4610f6657fb@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:47:28 +0100
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
Subject: Re: [PATCH 2/8] drm/msm/a6xx: Fix GMU shutdown idle check
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>, stable@vger.kernel.org
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
 <20261024-assorted-fixes-oct-v1-2-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-2-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfXwl6jWtNPEoZ9
 eIeyO585Sq5B3PtyxSrd6zNDb/Q+GKYqAvzmeYFF4dVtjC9OzRx9IyUr+NXI95owBe66pErGgaF
 Y3SiZ8IwRU06hYCkDhvtSwr3KdqnNV0=
X-Proofpoint-GUID: Z6bvnt4e5MKY-VofguOTQeujTZBRqV-p
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf21b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TPaDMEC0OJE0i2k_fPcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Z6bvnt4e5MKY-VofguOTQeujTZBRqV-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX/ecXlQyTbMU4
 yqwRLqmj5kcnTQpAgG+v/2RJKpinqnxRrKWCUsxwkUKz2RmSTqwbx7VwMC+ALWB5PkH4lpIQx2L
 G2iEGh3M0W5c3m44Ew4nBUYEwucOL6HViEh5l5n3w35wm6o4YQ3EoZ9efzj1LhQE9fVDIcBd60+
 nziS4s+C1xr7HFo9vkYqznqJMPAj5zoYL1ykHtEMKjhKynb8KuPyNHxDPX8B05Si4lXbBY6J4LX
 fe0lz2EbbXLNKUnVcWsnG1lZbIBmebIPlonX7RVkSbXxqQt6kIZ8NrNg0eWFE58d+OqoOnHl3KI
 bFe5cIzfg3+6igPfnFzbhdwtIk4LLbdRqSTuIqjOmo9HxqMy+yHUz0WttBg029rk2D2lsXkbwdU
 2qkKk3bsKMx7snvK/M3NDtQ6agHlbLq5REbxcmCcGv1nDjizURh9JOfYMZsyquw77NUQkW5arLE
 btPuOHcQWRv0UnTi7Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260038

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> GPUBUSYIGNAHB only indicates GPU hardware busy status and does not cover
> the whole GPU subsystem. Use CXGXCPUBUSYIGNAHB instead so GMU shutdown
> waits until CX/GX/CPU busy activity is cleared.
> 
> Also, increase the timeout to 100ms to match the downstream driver.
> 
> Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
