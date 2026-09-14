Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E033E5A0E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371259; cv=none; b=gKZnbgxfLWRkpN1GtE40oqzalkIuFywospWmuEMd52kX3MoDhqeqtlzjhzCpx4psjRZZG7QrbTiEClxil3vWHXkmfB/SLNtyrNEKhi+n4+hEonlCtXdD7kyRUyOYtIVpwwCN4/7OfHDorEoj3sr5rZ+0N0MvyeAjq7VAtc8w3dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371259; c=relaxed/simple;
	bh=1ey+7BuuywOfPmHLIz/6UMXpAWTAVAah4dLipk9yDGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qawgio69Hlny5njbicIHrVB5PcqqiE1R+54FQVJ/6e8iMnShsDvPYc5pxhRD56QbNOmcrsBhhVta0rbqQLYeuBzirPVIqjnEOGjJFwEG3vlO7rNA+IBXtEHooJZgdiPBqeS3rkxdJiGregqSP8WLysTCwm+C/3ojvBpMWALm7RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PA2vsX75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWhir8oB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PA2vsX75";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWhir8oB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jKGm3842723
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bJ0LnXcfs2eCKZrtoDG+orKK
	jrb0m3XGM63JVNK8OTI=; b=PA2vsX75z1gcXpghMbiHotqxgTQDNnDbIsHtHarI
	T7SqbpFbUFX8pXO81QdcRCdey2Ab/gzWuCCBSPDoE07/1yUzVasxgAA+inrPNizL
	trZQCMAIpAomS50ABkai0L8lVVlPq7T3GKTLute9cmz+TrPTlixL1TgjDcMIYDZH
	ejuaCoFEUWLxZsnDES9mlg/qtdsha/m2D9gzlG9NaDDyNFXKHEGPAl9y75nYmn0D
	2cMBHE7XzGOzPVyMufcSGX2OmP4tk1ie84AQPzzfCMM7qy2FZoewgsOysasLj/ez
	BrUXzuRj5x9w1NY6C1yaXZvIJcpBY3ezZpeYVlxGKm8WUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5j4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:34:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0050a554so470049285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371255; x=1789976055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJ0LnXcfs2eCKZrtoDG+orKKjrb0m3XGM63JVNK8OTI=;
        b=EWhir8oBcpBB9HwQvs19m84Lx8xJ/hKYIVV3jo+aZs3k1cSfuWO0bOyMMT2bLkZESq
         evoBakU1+OCTc0YnNmnN70l2JlX0fX6vktLyuqMFj9TzbW3HZFNstEAiD/1g5oS8J/cJ
         IITA0qCYg7nz0tq0Nrs0PHcLTljPvQb3BGuhKJLpQpZPMuXJb4Zv5ESqs0TeAFBZ+nsq
         FMaJdM1D4VphEiVTCiPI2YlpQCuGmH+MtDkPbcztOeTBh/hrKb0ptCKvoEvXyT8TRGqY
         lHQLoYdCRJ35Bhi+UyL2bBd0eQN22ce7E7L0G8nQWZ7JuXiWQMLBSMeHtdPsjXXtMge7
         ljPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371255; x=1789976055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJ0LnXcfs2eCKZrtoDG+orKKjrb0m3XGM63JVNK8OTI=;
        b=N4nkdsBBwLx6rqteG/JmqLoPeqjOU0C8Mt2mNMyZIq0arSzzZd3DOnKV8AKMOzCQMM
         VmObrNk7yGsig/NPT5mt64DTi7ebG6SiKDklBPQJX3GaPwdyG+v3TZydD8hhX23TIUTO
         U1DDgB1TWoKRcYovdiFjLfvmHaadssn8vPT7Y7ap0H7HhwX1PH5JLJdE2RBWWNXbr6JQ
         +LqfEU5be1kxt6C0ML34pF+/rgxAEWNebY5aIgKSCE+DLTwuuY5iLWPm9awjQGVpK6bq
         NuRR0wtfc9nKSpC539tBJJ5/ibePXqPg3lkbLFjpA9flrz0PQt1rzPWhaHf4Fd/BqcPk
         Jw6w==
X-Forwarded-Encrypted: i=1; AKwUvBwXQZxE4efn+8JqCiLG+ySWgSFWdLx1fTOB5ONTIAWOmDY7ybVKq12nJhlaxsCd+99RC3jgkHRJ1RIoq6nn@vger.kernel.org
X-Gm-Message-State: AFuF++kThd/RAPHflpno5oPvLYMsyfeiiCwj2mRBuwzPNKK7r0zHG3BK
	KzoL5vuRztc+mwI09lvYEWciPCfO3vg1X0H2tURLlsYdOd393Ey8zbhN9z91h0ROoQ/niIvbElH
	7a8LMCBy65izKxgPhAa7XiiAZZYbqrisvy1C8dEvVmV9bCmD6DWTSQ3L5CExTHZtoENz8
X-Gm-Gg: AYBFou2o839W714+/I3BnK72LBHTGhhJAqDU9a3ieTJ91xdwKJPE0nIdoG+l6BQVVpO
	D3+cJaiWyXMb+YTzDYR1gZwv970aCelCOl3CJC2IKpRb2d++vXAAb7d8SMhtJQJD/4xMreSzjeg
	KMrBTkocYgdFLrGAJ7rK6SNMf3FM6en3sZfQZnUGt9rLI7VMUO3e1XwD6dYGXt7CWVfFW2+LnPO
	odqInC5l95Q0vZL83qMR5Ya+hjfqELkVhUEkHVq+u0S/bU9Y6DCFjOjgp3vblt27LJk+Pu5gjWi
	4estFUAtxAgOPWpibb0p90TiriGsbQKF3/fRuPixqyU8WU/66H0mt6rZ6YS8Al9upynli34T8I4
	+hkFBFYRZAIH4uw==
X-Received: by 2002:a05:620a:1788:b0:939:f27c:7433 with SMTP id af79cd13be357-93a29c132f5mr158408285a.50.1789371255035;
        Mon, 14 Sep 2026 00:34:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1788:b0:939:f27c:7433 with SMTP id af79cd13be357-93a29c132f5mr158403485a.50.1789371254520;
        Mon, 14 Sep 2026 00:34:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm24084717f8f.35.2026.09.14.00.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:34:13 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:34:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, sibi.sankar@oss.qualcomm.com
Subject: Re: [PATCH 2/4] drm/panel-edp: add CSOT MNE007QB1-1 entry
Message-ID: <biywo5isdeagqu323ozaleeakngl4sngps4v7ngwqo23ju2sw7@jn53hxxuccff>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913201835.250085-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EekRk9toUJToR_suP0NWe2LYl4e2JYIg
X-Proofpoint-GUID: EekRk9toUJToR_suP0NWe2LYl4e2JYIg
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7a377 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PY3c6-KAFs37oqjDjR4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX5k7EdtZlqOVU
 2rmwdV9jtuS1jVjhWfd9s8m1XjVhzOtDJMhgqySUpa6nt4Wu07Tw24DG0R/uiYOc1hRTaEc5VR/
 ADGaSxnyg3fronEcQuBKIx/wki1vYXt9bIHLgGsS1xTeELb9p9513grBlNkFnoymWliJXAEQG5r
 nAc1g6UUrkn1mRo1HujtBYKjN9ndZCGss0ElOPRCmlcZ1XeOJDkeHcOOF8NesN/o0H2aYzctcol
 wsY3xfiicAdZkFTBCg36NUVzYxI8PZygQseD+IE8eXP54tGeFQ+7o71gjZjDbNCN7JuEhq71oCJ
 c8P8gsfygP4hsoTgzcm61rDM0lKfNJOCTYU5rxDMFkFWMqY6IqtSkODdcmOBOh1wSyC/9QF3Vwj
 wUebXrbtn/8wcvbm0zyPQBPVBuAmgJJIx5aObXMvDhcHY3LubUxAIBr2cxpLRQGYCDXnEtK1p56
 VTsA5RmlD83l3xfOk8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX91AnLJWxOH+T
 2mf7obZyqjTTihSjJT/MvUjcsa3nfP81iug1TajyWpdQuZB4jHU/zccny1mHDgHFbJmwmYpAKQ+
 8gVXXdPigomFko6Psn9SMSOPv60Y6o8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-13 21:18:33, Srinivas Kandagatla wrote:
> 14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
> Panel identifies as CSW 0x1465 over eDP AUX; uses conservative
> delay_200_500_e50 preset in line with sibling MNE007QB/QS panels.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

I think Doug starting asking for EDID dump in the commit message.

The rest looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
