Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739747A0B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466040; cv=none; b=h5+l/lAvRfaIC9643gvcLVA87KbBtKPreJTRPZUVg46WIzUf346NHIqgMKBMdo88IzUSO0RtkmONQFu5JRka2dhD9wfl3WSzQNIj4kv8fOtcAl3sg5WV+4SA/arZsVARhgeRE6JLGU9r0vHLx4CqP4pA1vx+s1SMdtW2PU/CP9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466040; c=relaxed/simple;
	bh=5oBfPJ+x239lYmq8/4KXIZAlWyktSzNaDIv3WrYRGOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxbM/bdySpaGi+rSEgzcdova1z0s9Zxhi5ZLZ2bYpcsNN6tTBFMVZWQ+n24hHPX0PN/y+iFPsSLN1+zsnh/EfetIuDfHqcdu+KYtJHTWP0OQoO02G8Ha/pU8uBRLVZ7RLye/CZ1DSAad3O34glKzW0KAjoi7ZYxkmi+eGVhx4s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLK2liwT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b9LkO7eT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLK2liwT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b9LkO7eT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h15E3415605
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pF/QF/hhxoHrOKiHFcOtOanP
	8OYOtIshKOaIzZ6HLNg=; b=KLK2liwT8BmNgKS33FVJjQLjLmDLdquSsUYoHrqq
	hrg3EOqWjk3mJv4Gm/qPyKVJAo0/oWHqTNmKLSpCuKkYmbeSDZucfHMwYGZnL0GI
	jD69y2mBQdXOcg8geyyJBqNB5PD0p98bqHlfTL6kq7n8fDwlod2R14f9D9uAxg/i
	Y1YqCDk0wYBfOtO0zdRDWA59X/7Qg2FxLUxQezMGrtgXGQqNtBOv+dapzgPRKxT2
	ntMOiww9EcP6OSDIMIGzae61y29M1pXgIaG5ijroRsjokQBaowPa/7IJMRo/7dDv
	9JMAKdCQrJgs6mivmcFBDh4nlhCYZn6NXxuIBMn5PTaICQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc02vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:53:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939d6c515deso865368185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 02:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466037; x=1790070837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pF/QF/hhxoHrOKiHFcOtOanP8OYOtIshKOaIzZ6HLNg=;
        b=b9LkO7eTe6o9YWFTbO773Nx99yK11qDErE4UDsGxTxd7wSzobPOoh0ObNSDvm6ay5n
         jp2RaWOh3hbHFuJ8HLYQQxdliB4pk3R1iK9064uDOR+r3Xiz2g2t/tVcfIzekyW4NrEr
         zjj0AESATdBxFtM9lM0dVrVwUYFMTW5BReA0Fg7WOGAKJk1gJ6F+IXItNeByYOtqaXpd
         0a8hFvUiCnEsvE70pvIXIywzDQVab1/jcff/SWxEtbvqyR9YYYoK42md3wRAC6kbDdjU
         5N1ZC2RY7W+6g1YhbPgIrLvx/ffWTGB7J/n8eydMrbhqt9xCk4H/MQM6gusT1KcaPqye
         8IuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466037; x=1790070837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pF/QF/hhxoHrOKiHFcOtOanP8OYOtIshKOaIzZ6HLNg=;
        b=0QZGqzpxYhFsr1T3oP7tYJ7ivfIMltPNHTwaiNoAEuwq366YKdTuOUDNcDvZcYKs6c
         BW3RnwFbRWeeEBUp+A6KxGF+XAXpySTsMMgboj5OoMzAwxDJPHXoN7xxlHraacKaz6sv
         OS1XhGRPJKQX23x1+/X7p7VLhL+iY/H0hAzhmv492KYsLMrnH7IJ5YXVjK7mSFZO6WP4
         mlBflkit71FrX4R13P2nPTxrvtLVpsIxRn2ZXgFZClciitfX2fceK6BmSsX5I/C1O7kz
         503KkPnvSbrrtZWvzVyvnUOoZCKClfZP3kcwr4cLJV/TRaNl/SHU5rR4y0yw9JrdL5aE
         91VA==
X-Forwarded-Encrypted: i=1; AKwUvBwM6+taMSdvLVzeHqTHdvxnIwRNCy16Ol3rkqzE/5JR2pZpVaRhQCXByZ26/6KyWibC7T5iWJxEcwZGliUu@vger.kernel.org
X-Gm-Message-State: AFuF++kROfRQAuCGHuLTNdAEMo604k/A9NqO+wSx/zx2u7LUrcBmxkih
	CVxxD4+p6GwtiDxBZL+2xk53rlow2S6OXHI+rs0hJ5pbs3zkC7MMTyKYLyQpmds+HEvuoRFLp73
	fDTA2ApAKVACrNq2OIzxoXjsIN0eWxQaYmbfPowChfUHbQpNfc5vs+CF4eWskZ+2ROEtI
X-Gm-Gg: AYBFou214n0gz033YKgJlCF7HO+09xuAZFv0AEIdZsnUnmoM2hjLiKST1yMqml34LjY
	SOMKVr9IAnJ6kEalQ+xmBHoL5v6V/HgWrTE1v1px/7oM6UUcvvQ6vKiWHt8a655DMgVjBjed+Kj
	Xgm/F97WCr78CycnWO2zI4lrVbzx4N5UFaQF9RfyYl8fWKwe/ouHn64EwuKke/hwRxkkl+S0QY1
	64HbTPelpAlU9pZzgbUF0sufYrfm07Gm5FwOZZEzQ91uAQlJNiTXG7nHQAV3BmceI2Pc8IAduJ+
	hyGQy/x3l3mk4aCOAKiXCWoomrKVQIrYWWyORIb//0n7PnrqIfWou4xjC4QTKr3Q+r3RH01zepK
	qaKX1g4nwl6bVvQ==
X-Received: by 2002:a05:620a:199c:b0:937:6771:e7e7 with SMTP id af79cd13be357-93a299f58c0mr218165985a.30.1789466036482;
        Tue, 15 Sep 2026 02:53:56 -0700 (PDT)
X-Received: by 2002:a05:620a:199c:b0:937:6771:e7e7 with SMTP id af79cd13be357-93a299f58c0mr218157985a.30.1789466035894;
        Tue, 15 Sep 2026 02:53:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e8249e3e8sm4523405e9.12.2026.09.15.02.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:53:54 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:53:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Message-ID: <saph4ecgnjpxd2fxeg277aihe2lnybkfk34ipb2nkg6wamxytw@qpm5cta6cemz>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: u7yx_23rZjtiyoKCRfSkeP-O6_GoGw4M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX+YhEC+Qxl5Yc
 GjjGZVWTQ9v7KV8cRunJXHFSqjyw7h7PaHt84UiU/l6dqUG76hM0qh0CKom8QPDXJ9e9qc6Kody
 8/7b4WyVpWDqpqAjP/StzBrbxmkjogk=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa915b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OUGWfBxzjYAD_LoOebAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX3WC2/RGHH082
 +4JA2gzV4OHBCPluwIuMcQABFY8Abgrki8SvhZMc7ov+zTT6FLY6prWIbZdGKwBOeV8CGigq1LF
 j1feokD/oBaKsZq2fFszecDjnMzsELnTpzmtj+NbH456G+4tRw92HmGo3De1iB6L4FFmQl5zkld
 8vz6nl1IyJqQaB5bUnB/f10JdNtlTzXSBxu4Xm1mpBnBz4m8o/4PtEGjfIQ49F9LRVI2MOgmDZm
 xWthTfbAe8hmUOEa/+JTGYmnmzZpKnZz6DaIvFchp9wuJt36YdZaSFtuEQBATK63NIG/AjIQN/s
 IicQGg56dAP2a6RkU7vSWnTXzFPiqvd5CrLYGOLStYAeOHq5C7rN3CpFITdE2INNZDMZbv2jH6Z
 X4KIaMptGRXI4WuJZbC8wxpuce62qdgKBD/wFNKcnKpJOtr8OoFjLwUGsy7lI6Ww2KjBW7cEjrX
 fDifsZXENas3rH3Iy2Q==
X-Proofpoint-GUID: u7yx_23rZjtiyoKCRfSkeP-O6_GoGw4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150141

On 26-09-15 17:27:50, Yongxing Mou wrote:
> The INT2 GDSC on Kaanapali (SM8850) powers a subset of the DPU
> source pipes (VIG2/VIG3/DMA5). Add it as a second power domain of
> the display-controller (DPU) node, alongside the existing MMCX
> performance-state power domain.
> 
> The MDSS node's CORE_GDSC is unaffected, since it continues to power
> the rest of the MDSS hardware on its own.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
