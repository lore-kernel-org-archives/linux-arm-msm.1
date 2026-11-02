Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617630;
	b=lK+wipiLqoCcrTi3b0lr40pdBlG+WG0Fkie+nJlrDjFPurUSLwPovi6GLvVITu5tAMfX
	 fR4nKrNu4soPmAwe4NuhmPP7g02Sm/VjZpQEI0H58w6Lt4lhp02PcF9BJe6mYMGFh7+LA
	 T/pXvzvr7HcUxKWBkhHl+X28Ix8ZfN6MqHd0hXgVYVSuyjis8EseXCJXFw3TJ4NQ6Ad6a
	 b4g8pqKfealJ70hgVPLwHmhzsYxairTkcXFjGxOULkgWZwViZAEbPLbjGw636SAS8zVVh
	 aAAQucS33U8kBHuB6RJw7RYVkhyK1yhmu2e+T+CklzoW5f8U0J0hzf+MjGBKMpgVc9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=us+y4KpJBze+sBMisIIItx/0Q9rWzDs7/LBvnzrOOkg=;
	b=n1Z5RAtGO2hl4lKUZQfackfWxBDwS8SUuilmITERvbEmtzXHI6a+zhnYGqn7PYHmOZTG
	 355Zk3WcqrdkyfuxU4LqAvDAfOovSBKr9Fk+hGKP2bbNCHhI1wkiDiCMoNhKiKwLOWPVn
	 rA4yaimFd0dr/GJLd/rG6sn/iZ/cYOy7PWIFJG0me7YyBsPPRuhWyaUk9Pw2nAjNUWqOV
	 gh63BnPpj1+SVV+eW5Yf16iUsjsApii40u/n1qSaMmBbnjclqdUFFaXXGGvMpSetrFkyK
	 qG3txJkwYxeGMWWDdrksXxLRn0Bd9UxLxT36VMZZm15KLTuTnMPhNPhnplenDmzz57g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YSJI50GD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYqsu5jN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DD4606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3DD4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YSJI50GD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYqsu5jN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AJRk2880820
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	us+y4KpJBze+sBMisIIItx/0Q9rWzDs7/LBvnzrOOkg=; b=YSJI50GD0pv74wxx
	f3/5v2zO5MQ7f+HswW7GkMNtUAIAS52RHsRHKgHOK7SddPmYtKZRYA7+iBjkCL2U
	QIds5uoQwO0TOUn881hDy/+sp0EnCGWHqkTo/NAi5v0AMGpfUQcUdFtDB2B7G1D8
	2oyeFFT5OFExLZIoN3YVgeanM6vmkHkgXe5dnw1spnaCmpG2rRMO8A4d1acazYt0
	Nm1/UxRaOsM/fK6JA/QJUDtTFjUEpT84WpaOqAScgwqRwfAkYE5Qvl/D/xfGYE6F
	cOPzWSBch+fpF7NRs9Ewqtryj1q/jEDMD/QyzmS1bWUAJVuI4PfK9OY7jboP0eNr
	uUzKcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrggxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:07:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so49077985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617628; x=1794222428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=us+y4KpJBze+sBMisIIItx/0Q9rWzDs7/LBvnzrOOkg=;
        b=WYqsu5jNhJ8fgCVb/t7fuIkPZCtVJ5IJT1VeMOZThBG552xUHeV/8syk5edxtvU8Yt
         B5bLIJDDww4qIqk82MbRNG2W5LFCWoBmL+/4MPPspUpLDlBj2ry7KbHGkC1IPQ76h5Um
         bK4NeMCa2nlhzA3Hzp6AswyJMyf9Yy5hENPlBd2GzYUjmrYPZNsSJHqIRI2ayVufHE0y
         m1WfINKSrnGQ7lw9T/xy40K4xf/UFepjntZUu3oVg/SOFcJBuxokeStJ/piIt16sLJjy
         3W/3SleTTFaUPd5F868wm1GFxYw5xe7ZuuSXiJX/PGIQ4GtRquiXGxdY2uz6U+jHAc26
         9Rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617628; x=1794222428;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=us+y4KpJBze+sBMisIIItx/0Q9rWzDs7/LBvnzrOOkg=;
        b=W3YnInlEwVnUchzyJrWJRfEX2tLNWrNojUR4xTEXyz7gYXO1xO6VItpvj7/L0zF/hv
         voq4etDh1W5xNXEhr8uZL8xrKuOaWSHH6QuFmbTggJiVJ64AInlcVgeEBNAAk+3YFX6T
         lCmfrOEXVyaznh2AemP9n0DNer7qXvr4iAU7E8qEzUmss1ION8dftEjGC2EsFQdTeRWn
         qB25OiIrkTsbRhS/dwco4tZsfCwjKtFpYGLDpZps1bDcBRdJq1T+Y+UmWbUy6OnzpjdA
         t8Bd/8vRZehABbvwKRQU1JxEed7vBJw80Sek5WXdLWeoOant9NMDX0kWj8w2782gOZcr
         dk6Q==
X-Gm-Message-State: AFq9FYI9STD70Qb44BmbfIQGIQ275dNhU2peuWmcZyjafeM2hK82ZrSZ
	gYhZGV6qkJhp/SppToZugSBUDOdRwKBwB2gtbFVMwTAhczmfdSWMAOh+BkXAYgiPSO5wO2/9Kcv
	4yAZ4Iej+1rPPP7BvL9D0H8ZFkEiU6/vjh9Co2x4fqYoUlPuWL23udPm7LRmixNWSBkKT
X-Gm-Gg: AYBFou01UeQO7/HsCLrQ/zaNARK+IvRLDsFENWBMKYZ+koX2y9SAStB18EJ7vbSRvRO
	othZ8GY15OssqzDUfBPeG9pWxjDzEiA7aJ7Fm08q2u6/mpq7QYxr1Bt7KXYMRb67/mVOxV81xX7
	UTlQB2XxrmqE13ti+H0FGQIg5vAsc5QAaJebBhywhMtQ66VvhBDCEBhr+s1OcIGbpNNj9IuHvSW
	pWRm69jK1P14+ZdR33QZ35VXqkbPwiC9EAqzbHxLANangb0IhDPEWfaXoyb8CdycD6PzNXc1NIr
	+UwiA+ikzOxDYgIgatMXY3+pemY3+/4k2SaxrDD1riWwE7LKXlBZcRpjN2iWsi7RpzfpO7UM+li
	l7/w5TDNhht4D8CjNrB2wuH2KlwpqhPN8JKNd5tGRNkbYEYI2jh/IG560az3IlxzJc0d8v6A=
X-Received: by 2002:a05:620a:870a:20b0:944:127d:f192 with SMTP id af79cd13be357-9442179be1fmr1537820085a.5.1793617628059;
        Mon, 02 Nov 2026 03:07:08 -0800 (PST)
X-Received: by 2002:a05:620a:870a:20b0:944:127d:f192 with SMTP id af79cd13be357-9442179be1fmr1537815585a.5.1793617627632;
        Mon, 02 Nov 2026 03:07:07 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabecd226sm373928566b.74.2026.11.02.03.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:07:06 -0800 (PST)
Message-ID: <fc32b535-e06d-42b1-8806-3f3a2a9843e0@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:07:02 +0100
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
Subject: Re: [PATCH v4 10/19] drm/msm: Add cleanup help for disabling IFPC
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
 <20261030211928.45761-11-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030211928.45761-11-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae86edd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cWb5AwZ_sP_0w0E8whcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: PwkHkl2RD4rfY75981xbLpRehdAOIjeb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX44aHROHvz4rM
 aF6hW2l2CEC34c5qdJDo1QMCJN+7XWvvJGRKbxBy2QKmG38HoTw/wCcnSN4MD4DCxzrlHnyDFGC
 RrSboOeXlrpbz6rrq7LMrIN2bx2gu1s=
X-Proofpoint-ORIG-GUID: PwkHkl2RD4rfY75981xbLpRehdAOIjeb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXzMTaPjWjCY8M
 5aJ73WfX8P5xemgoqRtXu+2BiOhBwof8VpCceaYmACa8J9Tdw9HXv69XsSUvlumeZndaXWgS4Wb
 aEXNbg2ttu8h8xn2kL3z5KYYHmTtsnS7wb5YJDqf8BENpT061CYKOY4omLprhCWvPRA10FptswV
 vr6AR8eUC9bmAZLz6ZoKkwl+ip1qmJg/uMceeWYZ2cmI0r9PzfDxM5twM5wKfA7SHiJkyky5HRM
 zHDJr09zES/QYVePifHrYAmQdUOxb9ZVMcp04TMNjsAHS6hZ3ZVwZ97/KvUN9hIv7DP+RRdm2Nz
 /68LtKRFg2klnjzrB8SOllT5KzKnZZZrRvYFQg7X7xGyL18k7/jNW771O5+706ftU65IklZ0xj7
 0CdUZiv4+eR85hckasfwxZpGmkWjvImD0hLyYfMR7y+ZrNiJW49IEMuaZpNDMaxZJfgfREA89Gi
 15rtXE3IGKw3inVLwxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020044

On 10/30/26 10:18 PM, Rob Clark wrote:
> Simplify error path cleanup for IFPC-disable critical sections.
> 
> Note that this moves where we re-enable IFPC until after the
> wake_up_all(), but that is harmless.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
