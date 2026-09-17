Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AA637E5D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637671; cv=none; b=jj8QRKTLOJZcJ75dlBGChAo1UGHdmUzQ99UYPGZso4PGFgW9Fany0yNAjNno+p9TZ+Qkx/e0u9Kv+YWj7xYJcpSu/ybK4zBUjJiWZR83VaPoYKeltVv7Z0e2BNbt3N8KcBF8S7wFuTcqFeLMzxoqKTcXHgcNXU3MX2XCCqHUxcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637671; c=relaxed/simple;
	bh=TSLSZyuMBa5SVWwas0bnBhlpq8LoE0QvEzp119jes5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huIzNwqR+PYy1HSJxH4J7jPH8+CU9tlKIRrFpQH8UWcwNKRm3eH4OtxAyfWe2tqxvoka+4MgrB546TnvBEMBzl62tCTEWX9PVQFh0Imc2qNWStSYB2JS8/9PmTUx8rmPehHntrboqF8G2LTh7I78ZKa8Ng5Uh63TPlwk5j3aook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJSCnOnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnPvLvHa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJSCnOnu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnPvLvHa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60NRt3702429
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9ImJcDo6K9U71W/J8ldEqrjv
	Rhfj4zEjtObZ2EJ/BYs=; b=oJSCnOnuPUltWD3lMsRbX5u1jF2sDzLxLVmqdln0
	0U1a8AT/ovW1kYGFMXRK5OXPuMRKoVqQlatqeH+5PSoR0MZq523NAQNorW9IcQ8n
	t2ReJz4Q9xbshy0PI7eKxv8Fe9d4bmGfTh6I6VHd1+zxF9ZHABc7xcN/OrotuFaF
	e+3k4w4jzEiHfGizh9RczXew2F4r/JTz7vaO9vCnjT3sItaWTn9GwejmG26o9cmT
	vCXoulNZkPs/QxrX5cpN3IGHtli94oHmKukA3T7EaS5lxe+86skW9ayexsWjRdAc
	qXac7UhR3uMgcHcCq18yykrz6OgnRMXMhqmuaf07/BKklw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc9fph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:34:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86917d18880so1112986b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789637660; x=1790242460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ImJcDo6K9U71W/J8ldEqrjvRhfj4zEjtObZ2EJ/BYs=;
        b=NnPvLvHafgaXfnmgBvTA0qck3WqQVIxnqPl2wVs48e/tLn+g2V3XQuGuIBvJX2jlPG
         JJGNf082yLgNjXgi5L8OHlintcFv4U1AjHp+0sSsG8Q3qGVRtLw6wCijGSg2Dhj4gLR1
         DF8eOJLr/XGI7SuZZbnFgtA4KIRYDgIpcGla9SA8oImwQvGFddJH33BNmNqgoNjsXdMx
         AFfvMBG3z+Yug59SFfNgXnGc9QAzt1QXNzgMnWi+57IIID81cvFBc45GEw2k6sebZ5rR
         nwjmL4l0JQjSbwu36xyC00yvI3bbgxH0Im10wgPtfVrbg51AD2NfJCNuWQpCey7JmHmh
         m+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637660; x=1790242460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ImJcDo6K9U71W/J8ldEqrjvRhfj4zEjtObZ2EJ/BYs=;
        b=KAVSo3dbhDF93BSZVfZSl64yKebhLly0fzFoXGeFfsB0ZvEF24LTza0xTaCcVL9vVW
         iezVVrG/Aa/t1xalA5O+TjEuRzIzxqpSBEqt+uBRml/IfZoGLdjgaBPz1kHWjeEnvJGo
         jY3M8U+MmbXSjfozY3l2X4AwH48yQoui40a6DfkoMAtOeKFU4fHG5D+psU3edWMMgSw2
         7q6SXOmSVgZDRI8u+N61yh7KUFGS1DcYxJfNCl3zA5owwtnD6tjyKD5n+DnehdRsRmFk
         sPmcBJc4KOHCibYqEXQQT2K1bmEPhyxvMgPSBFUui+/Ixt/ZVgbSz19W+R+6xe9GoZdl
         ZBog==
X-Forwarded-Encrypted: i=1; AKwUvBxfly6THLg9+8E0l4JAi0i0/gTrHx+P+NvvkJc3GVrnEmFVeEGMvy1RdwiW5y36irjdQb3ucQR1mKezOB9b@vger.kernel.org
X-Gm-Message-State: AFuF++nZEAI+6Z5LaY9HlupifERAPcvHIB4MFcuodmiQ5BdpWKRCR1EA
	7Ia5yXIlQCE25heJjbqR5y2hhX2X4MS9vNw9QCn+bF+pkH8nbIoTT0PyFfmI3CihlUL81I4uC5F
	rw48zw07lPH5RbYkH7XhH0SkrcrujKih9q0MXE33GwN9rKcQRBJHOEg342Ayqd1S0FCJ0
X-Gm-Gg: AYBFou1VPESBWZe/0UyWNHg+LajGBK94gqv+ghYlNEUzTX3ehh1+nMw8FeAcZ2ZQl4t
	x1mTCwvd0dQE3sxBge3OlQSIY0i/KDEXBNOb8LGtFEYN1fbEKCMIhXE2gDcDXGBjMZDUNXARg85
	EVzTb0LChWcgDKWGVHDlpXHRvf1GvN4x+SL+3FTwi2zzGJGBh4AjbZV8B54zxpX7Di1JFWWFebX
	J4KgL3Kceqfx15LiiiZE+lxHoNH9D8yN0boBUbkTSvhIBBfUYrN/XRp/M8G02LQbVt/o2RPSIJV
	ntLf0gyZLrim1hQN2oGgAcXpPapXg8tJZ6ElJKZqPDnjxdfai+9QHNywaZCknI39dDRrTuOf8Id
	qNZYOWNKGGQuWD/P9tqjoy/7EIGMDDB82HRQChyXI4RI=
X-Received: by 2002:a05:6a21:310c:b0:3d3:ae40:51e8 with SMTP id adf61e73a8af0-3dd5f7ce95emr14785609637.28.1789637660222;
        Thu, 17 Sep 2026 02:34:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:310c:b0:3d3:ae40:51e8 with SMTP id adf61e73a8af0-3dd5f7ce95emr14785551637.28.1789637659819;
        Thu, 17 Sep 2026 02:34:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm11453434c88.9.2026.09.17.02.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:34:19 -0700 (PDT)
Date: Thu, 17 Sep 2026 17:34:13 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jingyi Wang <quic_jingyw@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Fix intr_target_width for modern SoCs
Message-ID: <aqu0FebMYP13xfA_@QCOM-aGQu4IUr3Y>
References: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfX32xFrblDLQCs
 BzSy/oF4WWu0rqSeNv7420RO/LZD2ZpCieZQIWmegpHThdlf1h6ekjuO9Hc3xCkAfoE4ShuwB27
 8+eipVzJKvNA1IDo22aenAZgfLDGNScXzUhxWtFfGuVK62VC+yTC0osyk/JhuyCoTjRO1l+5Wqd
 UkxSzm4LR4PemUEsy5W+clRccXhpEvLupYBPdFfQ9fN5xfhoI1+eKJ1d7U0B0sqehTH+XCab0SI
 x+J9QydNo8ZJ8ueTjDX2g/gdUTB6BDWvYOGacCPAwN9Ui2JnjNMXkU3/PYbOxjMRX8e3lVDuNQg
 ySMZXcZVNT9dFTdKgdzqBVtdjffJszvc4tqAb8l2/XiweE1nzTVnE5z96M5u/vibqSVniYasYhL
 O/4/9yZ84HBcnbXdEvNcxP1FwxkfNnErEhL1cNms2nxlRLBVVLL4IbwR3hhGyJRMPh4hylYVRj1
 VR/JcJtBj392Dj/RBDw==
X-Proofpoint-GUID: b44Qq9GSwnktDRH2Vn6Pfgg77LBfFzOz
X-Proofpoint-ORIG-GUID: b44Qq9GSwnktDRH2Vn6Pfgg77LBfFzOz
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabb41d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=x6tdKxaZRr1psv9HlzsA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfXy3ycUAdiwvBx
 eKRpEU88psyXGqgmNmY31fFKCeK0//jYCs9eku3Nap20Ah6vZOBXgP7YsddPf9QRNvbI8dCwSL0
 ZaZhldRlJR2D3Q5+iTmuZw8kPppdx3E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170130

On Thu, Sep 17, 2026 at 11:03:24AM +0200, Konrad Dybcio wrote:
> Following the Nord patch, I asked the robot to ensure the value is
> correct on all other SoCs and it found a couple outliers. This series
> fixes that up. 
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (3):
>       pinctrl: qcom: hawi: Fix intr_target_width
>       pinctrl: qcom: maili: Fix intr_target_width
>       pinctrl: qcom: qcs8300: Fix intr_target_width

For the series:

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
