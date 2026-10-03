Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159C92931C4
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988428; cv=none; b=J+K7CUp9lNrQudiX2NuE1MH//KPM3pKwA7evKEZH009E5JGSwQtJILR5P6C9D88vkLjIlQFJ8tPqcu34OuvyHgtcSrqS+mxFq0o5L3ilsoaDlj7laI/26evJ4ZpbSRVG2udqn3mZ5Ju+AfW9gKymfcjurN2G7GfefMJW4EKl5/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988428; c=relaxed/simple;
	bh=6+PkwC2FjcXbduh6GZecIumJ8hk5DtjCrVXxYoowenM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DpbhqS1HOiXvft0/KAssbBXH68Z3Z3iuSCqwYtK/rACVQWUrXRlRX+CUAu8ujlFdEy3j5SuodxawoEpYvItRM/31CLlm/P+WemGIaV4iGeo5HjNCxSr2GoiX+Mb+lVZT8rdoRRleWiQj8MmhI78bflp6RO/umc/xODHFE7mIWCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtcAzMFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ci65W6Qo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtcAzMFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ci65W6Qo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeVVH1956799
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	acP/SVCD5qt0mkL6J4sXpOMzffwmRvuVbat3/cHG+e8=; b=LtcAzMFgc1O9Q/VN
	e3feZBVeF/zp6DeArWUbaNRvJgM3YEsex3NWh0sNyUeTAMXxLfEjPc8Jz4eIuwrX
	5YobT13ZouVcY6vxl96Xq32nU9y8/XJj/u7l9lE3Ex0tU93HRmc+7FMeKXsm7Ncy
	PR0bti/ZzrJjIpLt7hEEyuXau5PP3uLDuiWrLL1KEgbHAud2fK9/+y82/cERPdDz
	RvUqO1DYKgufDf+2B+YNyyCP23cYDb7+OWRlDe2AGXaHIY/z9Iia83j//2WDCPi8
	1RvazIoo30yMKz46ZRlS2w2kvkA4C42phfR/dF602/dc2zewkZiDUvrjWX5sbV85
	5oXc8Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2j0ks54g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:46:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbacbb996so20163385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988414; x=1791593214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=acP/SVCD5qt0mkL6J4sXpOMzffwmRvuVbat3/cHG+e8=;
        b=Ci65W6Qo+nZrITm1BEjE5x4VPWA81sbPkULfZAXW2TeMWND69PT42XQPcLOsJbT5Pi
         yf912la3qDv9FRm0PtoCGSEaYNWITV9PEE25AXOF5JF8QvX0HZtGqW+h9SiAIf2z186q
         +7JRKMRmJfWq+6O5JMaHFUQn28wVVhPieX7QdYSDOiQPr3P79jNxvgaYnvwINrYdnayS
         me1S4HpfkBgS3xtyRuyeiiravzG2LD4D5HXaB794UihLfT5ynODX6HMchw2qgJWcTGXR
         tZDD8KS6S3Blv/TuLLCkOHseiP6Jn64uW/bm/unHHLry8EHOXyFqTKvwrq/PQ7FsEQjG
         bqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988414; x=1791593214;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acP/SVCD5qt0mkL6J4sXpOMzffwmRvuVbat3/cHG+e8=;
        b=FVTvkxsM4S6mTDoFPEM/sFHXmZ50iYW+/KfK7YXuYUxNgww7v6EAYyKK23VxG2qjhH
         F4p9fmo1JxaNbmNo9nMSUYVXfwwVtWzA5WAYI6Xlqlh6kE2NWhbphkbrbzpjr7zsqoxq
         KYfbHNlJztNETgFVnX8obVcOR4bGVLCGpU1q4/I5N9tnoJcUdJjtgndx9oip1RELOe6l
         AdrUT/DhociEpIsn+aStoqUmJwTGXDm4XqM6A6x245G0giJnWDomNORvyXVE81L/XXA+
         ihNRkLHtSKprL0kn7Vy0aYvQlTP4YvnAiDeVReugPgTlH5ucfOrJYC1+JsUA1Zu+56Fn
         2bxA==
X-Gm-Message-State: AFuF++mfVfQ/wC2/+B9thlYGybtOjKVJE8qonPu+e+nkj1z7CpweDHC8
	syF6IpBcXkk4G6WQqC5miuZXINk8skUgRMxotcn6CJcrnLfCJc9o42e9Oz/F0E9aQn+4BPlOkPW
	cDHoL9Z6plHM31Lu47DoUFJEow02L9izmWtsYsCx7Zn1iDe3NdiC7GhFXLv74UkF6QXu/
X-Gm-Gg: AYBFou3AC1KS103wzAIYIgf/1rAZ0BeZ/Xtoa7xeQfIGaoaL7d+PzdQ7I4r8E1LpHKZ
	EJx8jFDKWMk8Cef3SmJIokk2JjIkIEKyueN5ssCPnr4/uVLruVxosSk01mnQN7v4WKTW+IrkItQ
	e8q8pNeYHepgaAytq++eS6qVzntB0gdOtgRchGDuLsgXqfZKP0NV7yM3/jwGltojdxXEBTsZFdN
	uggdPhgby+k94pNxbDkpZ7IQI+VNZsfYZBiU6ZlOIjapkeqNnwaf57wtUKO4c1liwAghb5CPX4D
	DkcIxz9N0Bojkd8t67M5baSd/4xcQupn6WgKbkBBW/bVOPCxUZsXBbucmEBMdwT+U3Zv2TYlrV1
	2jj2h37cz4Axw7cuUxdK9NceCpEr5zEEnz1AB0rKUDznYD2bbMMwlhIPiwbjwb7g7bgD8HnPA5a
	dFRC2DpPolOYiR
X-Received: by 2002:a05:620a:319d:b0:92e:76a1:96cd with SMTP id af79cd13be357-93ce94ed6camr814412385a.13.1790988414233;
        Fri, 02 Oct 2026 17:46:54 -0700 (PDT)
X-Received: by 2002:a05:620a:319d:b0:92e:76a1:96cd with SMTP id af79cd13be357-93ce94ed6camr814407185a.13.1790988413562;
        Fri, 02 Oct 2026 17:46:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:46:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/mdp5: drop cursor pipe for msm8x76
Date: Sat,  3 Oct 2026 03:46:50 +0300
Message-ID: <179098834080.3641559.9462474422543913351.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914-mdp5-fix-cursor-v1-1-9fba3ace6cb9@oss.qualcomm.com>
References: <20260914-mdp5-fix-cursor-v1-1-9fba3ace6cb9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfXwadNQ4hMCWlX
 UFX9GatFQbKRgoSLFJfSpaTB1C3YRY6S3qMen0naiCfTAy/Z/ViRpdGWYcgdSKKTpEVBIQ18bJZ
 W4F1SdllQXksDsI9Tfbw/eexA0i3hBixY92rxCkeYvYqTgl2KSBoalva0EN+t3adq67WBvOlZAX
 1RwXQtDQDTM++142NAnwrNeS+lZj3+dA32YHKFYQsEo08agje8l7sdttKzIi6UCrVqGcfIFmi1T
 WDzbrRvv6/1HV2wDV2C+j4TUvkPHyxB4rnsLBNN38PoLjTS8n9TapX9apOCeixlNV5/BuN6SKzm
 efOMYch6ozMXmXswZGvNC7W8k+r+yR3l+UcfP7Rg5mu1DofHbhfR2UL6vFpw0Aw8GQGbYBbKBhO
 SQvdo32q/rDBI7MH1HFXJQgZ3yLQPH1ALwuuOiD3twhHXrqz1huoxUGm+VSTG6A4/pQBw84uinf
 xadQu0Ro0egfS9RJT6w==
X-Proofpoint-GUID: kGhxN2RB7uauFUAcwcFE8IGLut88qMbA
X-Authority-Analysis: v=2.4 cv=Z8B5j3RA c=1 sm=1 tr=0 ts=6ac0507e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=VSGBqGf-xlBxKiEaLwYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX1jsxHkWy6oti
 fQZ6TuDpKyoFzxpRY9btVboY6SZ2Y09cJl6polXOcSNLkqwIQyWOWOFUJX2AKVE5B1D4W1du9I3
 x2Me3yq7tqJhlq8nRa7zJAlwzz1d8Do=
X-Proofpoint-ORIG-GUID: kGhxN2RB7uauFUAcwcFE8IGLut88qMbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030002

On Mon, 14 Sep 2026 02:24:24 +0300, Dmitry Baryshkov wrote:
> The MSM8976/56 family of platforms doe't have a separate cursor plane.
> Instead the cursor is a part of the LM block. Drop the erroneously added
> pipe configuration, letting LM to provide a legacy cursor instead.

Applied to ttt, thanks!

[1/1] drm/msm/mdp5: drop cursor pipe for msm8x76
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c33cee4c07f1

Best regards,
-- 
With best wishes
Dmitry


