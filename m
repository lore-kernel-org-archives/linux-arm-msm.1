Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4955C3B993B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883145; cv=none; b=HZDZ6jKs4mjaCh5IGPgg7+GCJLb0gDzaQ86t5dB6RFjATSlQvxu+ZVEtia07gIJmQHYDJzTJb7u6BNpvRmniSNHCq8MI3QVwo8ub5+Q9nWnosBCzeMNGO1Zb2i90gZy9XJQpAReVQsoRr7UKjPvdSuORPxICjePBIEWDKeRjZ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883145; c=relaxed/simple;
	bh=ZjDJCoA6MxAlqVBWalgo95rJlsZqJs5EHam3F2kFqFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCG6myWpXCmD5DfjXeelMCqcgjRCLItf3CQsc6xocM0fJM9jFsGLeeCPbBFPIgTdfohOcL1G46swERZz67oG6PuGcPBg5TtqCtcW0BmZp3gHgQVLIpWSMWCiUrouf+CIJbR1sHi8TMZxkyIMheQln00JE4CeV2gsnFJzjJoiofM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+3COEDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XegUqucV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+3COEDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XegUqucV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OXP2015284
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uQ82qhE+xbrPharhAgsD9+NR
	Ct+bFTtwURK4hSdKntQ=; b=m+3COEDlKoRKIgnoYo8+Ib/egwZwTuGWIqvL1820
	I2EeOkYgsfW2+9Ww2MmvcNxsU3HwoM7ARx9UyGQdxP+XtKGbZv1SksVPwiPIVfeK
	VSncdCH5da4DKRUneB088gg5LtLq4ddjw3Ibmcek6fERcag6jMxbwI5t9WXkvg9t
	qsz5z6AelYxBQs10BQdiQ11QcS9mhrWF5Wd/Zs35pADw8TOH60x+6/tx+FCl54B9
	PwIugTzhc/Kj53lLHxl4VRXIqnN6P3NUhO4y7he2H+PSj29+iVXOVrgypBcy/XmE
	duAXPHcP0lUXixC+f4ymtEWCMBM/WBRXOmpL5jdzwjznyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugf98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:18:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbacbb996so448420185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791883139; x=1792487939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uQ82qhE+xbrPharhAgsD9+NRCt+bFTtwURK4hSdKntQ=;
        b=XegUqucVk0IawPabM9lY0vVVthc16hJXk8o+Y2l1v/jfVPsFp2FpYUOBIEujSFGM89
         ZCeBBkPUcDDawMZ8dQNQ7GqXlFJ0ue6MM82ge7AkURT9ODArOVqnwGwD+SjQdtPt5Zae
         NAYLvOv2xAVQGMEPwv5iPXVDwFXH1WB4h4lGHSHzRvtdnXHFAtexdfwnMws3kMYmn2zT
         zlIPuV0huaL3YQCMoc7onxx5iRqCI6He6X16nAf4JbwKNWV1SRVUJoxzwwbnZY8BETxN
         flEwEZw5amVGbm2v3Twfk9W4/0IqLGfkBuJvNFM+ukaJfdhJYCXuaQaapxiOdCRqSDTz
         5Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883139; x=1792487939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQ82qhE+xbrPharhAgsD9+NRCt+bFTtwURK4hSdKntQ=;
        b=gVHARhONHUi+cxCdCwlOuAyXPJSkaPV7IsNfNklZMaaF965RKC7yNSEWj0WY7zFdWF
         rPJxAM+owTvuqPrGAgW2wQiWXtlsRWv7qqPFio7lbrdFlYZbgsTihhEhvdnOufJxVJ1R
         rtgzAUywhiyTHLhoVEEdE7xdDt4p9qjAT3Hhf6jaf+ObBjvZZhlXnLO3QDA1g65j5TTv
         cJGgenvfjiEpo4WjFD/oJ8tJS8f8k282tgmjzK6/8P//D08X0dsW9vgbwF7Jd1rlqpoP
         5o+1pObk0FkB8Dcm/15I7R62YyBDTVitAFcDHa3H3p0eoaVPHADsaEEfVzlNBuxsf0su
         lzdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxi0cHiHODPSW6zOLguwAsFQLQAbExP3oY4hpSjLqn3eKElvceLQDu3Dr/ltP71FtuKFp5gmf8PLYcwoePc@vger.kernel.org
X-Gm-Message-State: AFq9FYJz3OYLtgf956W1FikVkreKo6ngbINtU+7HX4GfTibmRoFvqTPP
	gSjVDF/rG/lZLSKyvV9KtstZIqUeZfofTprDqgV6d4qWg5ucN7GSKxF88353e9QVID0xJCWVFLc
	YfTjeG3ML/FIcM0E4GMXDPa6eFt4D64FJ1BthFKm10cDKdCjbqoatIystFr8u4731AzWF
X-Gm-Gg: AYBFou2UFYM/bBzrITWC/6YVRVQfEKOcmoQO0lMgMV6jL5tZ9v3spg8zbHfsv2Y08nF
	NLDckeW7/e5Wtg138adeC44OCrpZAD1OM1bcyUGgD29JNr4A/82in/KKNA5sfmAaZnq/jN2oHg9
	4khy83JslSJ6zB5xD6C7jU3hGOc0yoM4dOW52A1DuW30TqCZ0B1OYvJBhA7bQplG0VXzS1NQ2r6
	ZAnSpnNRrqEDLONMjIJXUuqGPkBf2SkT+GQXkxsG745ilnUd3f8YB9QNE5Qaq9wzF9VVsOSLIyg
	slmrYB5u7yHSeiLa06Z4gOd3Z5G7dAMS9XujkyQ+8Qs63l6UBKTfNHQG97V6Jiv/mIHGxR42Syd
	sda2aatMYoDbkSNQ+oFN6lBMNMM/dio6ZTna/3ExyIuQFuPJWkCtzJO9MLtwDnUZjUKFHpF0EoT
	mNibrZzzQIlg4d
X-Received: by 2002:a05:620a:6601:b0:93e:7192:191c with SMTP id af79cd13be357-93ebd1e0044mr1950629885a.17.1791883138852;
        Tue, 13 Oct 2026 02:18:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6601:b0:93e:7192:191c with SMTP id af79cd13be357-93ebd1e0044mr1950626285a.17.1791883138276;
        Tue, 13 Oct 2026 02:18:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf8a3970asm1038505e87.79.2026.10.13.02.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:18:57 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:18:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 06/13] drm/msm/dp: Add support for DP controllers on
 Nord
Message-ID: <gmsyzeugteg67h5vwzf2y2e7k56eg6aicbonzjl72etgedd5oe@vlizd2npwtn6>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfXwk0BthW89QHW
 D5MbtnSqFf6ziitsDL3YHNED4KZGHIJUoxsAoRpTZy79eRgUjAdwxqhi8rAo/XWl5N5KSjzUmyX
 M894OAn4U52D8zTgUxF/y+dWT2wvK+LyIh1o59yNrIibcS79qDn82hPczEw799CHiOlOdSZvoJl
 ZDKEFRgewzIC5XjylHh/FNn1frPcursm+aKr6DV5An954fnO5neJ6RGxyKmxyE0877XsrkHYr2F
 vh8IgAfL4kGsifwDvjfVEmaOWR0IFFH24ABL3kn6KvbUlH5Uwk9Zyp1fRMp4fa24uiHB5vuvysL
 32MTNsN8vRMNJ1X8Sciwk7l+JR1nXrvFEka8h/L8ju/zQIMTfANNaC10Cnm3zkcG8fQ+fQoSN4n
 0MeMqpVdgDAIoNw94/H7GSnKUusBCPFec8EwdR9Y02HiKDFlG0ub9lBkeI8KuYDST8IqkQaCkzy
 QBKt4AtKgKnPGi3Kcog==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6acdf783 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=rMXm0_BZOgqvqhzNPSsA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: NsvduYcKw_ih4gjPfMkDxVpwpki2kX5T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX79JjtzT9rZp9
 htuTEqA8eQr/R2HIZ/Kh/XX1zig8LoH3jZdNPr6rcBjii8GfupH35AXN8B1ajI2e2Ksgu6BZcpp
 zCavvu2hW0NpAPMAgyEyeNEGQIfMIZ8=
X-Proofpoint-GUID: NsvduYcKw_ih4gjPfMkDxVpwpki2kX5T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130036

On Mon, Oct 12, 2026 at 07:02:16PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the Nord DP desc and compatible. Nord is supporting the
> four DP cotnrollers, two per MDSS instance.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Why are they not a part of the existing entries? Is it a newer core?

-- 
With best wishes
Dmitry
