Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420804;
	b=0RKqKKJF9LY0Wdcr0TJDyxmIumCQFsCppOvEmvrviSnZUKBUphLDlq53h2jnuKrV/Dlt
	 CZ8yu+nbnTDK5CaxEUawAmD9CJdgoVzUnQoxnAp+pf0nswXOop0roj2WCeocCmwrwgI0Q
	 wclpMwFrN7wbguGygMDqK6mxaKj1noKEqgchURiKQDi5jtBqQ88m89SZBlzLRzW4hrqWy
	 Jk7JfIaw+aHVdjq7MeNyGtgb4oOuNlk64Z+ZnvPBKysnTNgfgEEGMTM8CND3iykkEv3Z6
	 C0W/LcTQ8ufXt8T1uQKLbFrZGoj363H2ERMEUDmwqqy3h4JKFxt0Q8NAB1DCQM6tSIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vqwMgBBAIrIccsbaUs5qyWO3n3mmYzB8oRH1B9/XhhQ=;
	b=Q0SvfmTTILe3xh7BBPpS7kyfslCzqFnBMKFdEhFfRU6/6QY6YLYpCdbKWdTDqHeubVVR
	 jPFPkNs6KYLFOcneqkDm4nRv8yj7Al+BQZsn/yp+2jMbMHdslH37uSkiwcYjwWP23cz4U
	 KgmEB8DcWFtIY4gRI46a81D3D7QbTYZmIi1okhtbBkPfpU+yuz2nCKBmSiRgSIseyovaG
	 qtIAoirxyIWKcjhxFci17Ebphw0TRerEepOYXyakcXbmt2xm06S7JuUhg0fUXKT/YG2JI
	 iTACa1SubZ/DS3qq9imhXiQNZsXAy/SklxUxSuLlknGdKel4ZqwYxehtVcRfygB9LJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RgGAo6g7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4aIFWpU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F764606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F764606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RgGAo6g7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4aIFWpU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtNga2499420
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vqwMgBBAIrIccsbaUs5qyWO3
	n3mmYzB8oRH1B9/XhhQ=; b=RgGAo6g7+T2CoN3qbu6ujPRQjGYF1EHQpIdnGAon
	UEDJ2xDBUmAp3zWPanKfxrYudMNGirThmjc8tUs6PVEiW/esgH1KUaeECz3CN4wh
	1oBhS5WHbfBLAle0TBgUTh8tV2RvDhAyqY7wskTOvEPOTq2Zh/RoyIO/haPNoB09
	Kl9B2obGL8k9BKH4uchwjUWdQ3lt54SHzQx3V8WtGXevYremtxO/C6fGKb9mLSS0
	pIdqwlkUT5uA1zLOSKl+jeRqkkhIGAjHNa8f19t4qaFQ3n5ReLTYppKIIZ+js6AP
	o4zxel37UKz2lFLWye+Mk2JcL4aZnnNN06u61ICaDc3WCQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawkfxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:13:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ea9e91221so66685726d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420802; x=1795025602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vqwMgBBAIrIccsbaUs5qyWO3n3mmYzB8oRH1B9/XhhQ=;
        b=O4aIFWpU/ZlST5KMk0c44Jd1SZ/ZEqe53RIBLtcbT8btufYyZ7/Zc+Kdu1TkMuh11t
         4VYUHdBxxfin8HKclTBH0T2Sm3mXK8lT/FQWtsCUb5+E6/2kqnUulvEc48y/sKtGCFvf
         ZOTmhPr2Lg89jV9UIyUKmJWOLFcA/+kpKXKJb64Er6TzykkKmJUFm0PSd0FsTmWI5/yA
         xw+zy//ITNO9ypet3EfHSN2KD0rFN6XAtKFMXmF7A0I+GvN/k3DcjOOj94KyDbEbMRK+
         vZhgAbrM1Un1sliztjsRH3MfAKzoTlX/i3pp9DlLAm30eGxzdkVjANnapnYEkj/QYUUu
         NuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420802; x=1795025602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vqwMgBBAIrIccsbaUs5qyWO3n3mmYzB8oRH1B9/XhhQ=;
        b=F743mhm8dVQ1FZswZbI3YxDngepECDQpvf/pCTA+spOyuBU8jBtotg4TiJuEEICq2E
         tdYIx6PD9Jaj/R8srlwgtCTAXeAsfbSPm+5Vr5rrO+eYnaLxOAXhKCvAyQQKPFwzef7J
         E0/mp5ZGz+pKGXSq5dR/Q4pfLuppxXqcx8S4vC1+87WrNcyMzRV+cnPKVVuqn8SGDEwe
         D1VroIMdEOz8g+3ERK95QHOz38sWopyJos+EL1JNmIoh+4J1KcVQl5/g7oqsTtcumPzI
         P+foktF3Nr1YA+7/wQVu6Im5OjGy4Dj2KT++e/7JZkXHwrmUyunNoNggTdRDcjV3IXz4
         L6Sg==
X-Forwarded-Encrypted: i=1; AL+hErGPoys+rovQ/JCuWR6O+Ra6TPn1FUhDD5FzvOeDggP4Rd1iFCKLcIR6IH6hCjuLWH/PmBJ24MQRFai+W792@vger.kernel.org
X-Gm-Message-State: APuU4Z/mO9IpxDnMPuU/TZEJZVUQnkLICbW7mYb2q59QfPe5zV2T5PPK
	wAEdr8KHvXhBlv4O5zLsSrFDhlosOFoN6s/4c7jnjdR3MvwsHpomy8aNKQwDWbbuMakG0ZAThl5
	ZopQAW4ZfN99J0ZGV9/uf6DvRByymlFAn13SqXoASsKfDqFYq5OoPLAULEg2R9AFmE6dE
X-Gm-Gg: AYBFou392PtKLBzTjNytuTpH34JvKF75qOU4E5DZLaEBlL5ZIndbBldC5o56hkTMMPw
	/zwA6z4NJ7FuV46jYr/J1bzjIK0ZQ7Lc/BUqF5jjM0J5LROG3xUx/eU1Qq+eSXSMUNX+l1EuOYn
	R9AZsk0CjBngP+E+NlULChccgb54FXTCpXPj9wvJVX7RND6JCQ1z2kYjnsupxlByLk6mhnjr8p6
	vTWrtrnteE8zpHo63+Xb1OF2huKkM78q26yKqAhMONPVBZkqwpUjWa4tXhrw5yk7Im1ryD+Uey0
	HoGSeFRXab7FbHLw3Wf1IhS4w4l0+JcDRLQSCE0ETqtIxs/yyaNWOwbRfEAzGJRknuQmy8eIi7d
	2BpnWxjLACViRBU/dFbz6a7PfyTtPeMSwHY9WqHHu4pyiZ8lVUbd871JuC/P3tvZdTQpWV7OVI2
	/oadSYaVJD1AP+jh+EbyABd9qFSFFX4kiZ4+zXVGys+1L5PeH5/QQ1N7B1xLeqfQ==
X-Received: by 2002:a05:620a:4544:b0:93c:9d56:a860 with SMTP id af79cd13be357-947affe689amr564278385a.19.1794420802157;
        Wed, 11 Nov 2026 10:13:22 -0800 (PST)
X-Received: by 2002:a05:620a:4544:b0:93c:9d56:a860 with SMTP id af79cd13be357-947affe689amr564271585a.19.1794420801627;
        Wed, 11 Nov 2026 10:13:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0924f262sm13151041fa.22.2026.11.11.10.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:13:20 -0800 (PST)
Date: Wed, 11 Nov 2026 20:13:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: msm8916: Disable disconnected
 DSI
Message-ID: <ft3rayikzieiuttoaqz7lcgv2sgn73cslgh6urur3pud57sqqg@aouonlfb2klw>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX/epGW/uL0vw3
 AHho8NxiRSlFgqO6Qb77WUB75nCzPz06a3vphsLsWz4v5Eaxux+icEElmWmqWPVCNvGl9yvuYDw
 YVfjgEh7/R0gKKkTPOiOskag2abICTs=
X-Proofpoint-ORIG-GUID: 0W7RuTlsRrUL9pbOKLYirrBxCOhiA2EO
X-Proofpoint-GUID: 0W7RuTlsRrUL9pbOKLYirrBxCOhiA2EO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX2/hBHSfVDtI4
 ffLxvKTBzAcZ5HfkaX3RZ1q1rZxfLieezc3V8V2mqhlEWzXbO83jizp4oC+e3B1CKSc2CZqQXbp
 +gNnhes/r5H4cgrFQKx7kqnZGgk7hX+PxDZtwT8sXRLn7Qz3LAxuibwxAaLFN5beEJ19D6hCFhA
 wsDBYt+fVGC2Wner7h7XSLppIuGEm7ZwMp9WfApMftMVU4eslI8+YGgvWUUXOxtCpultvhv6N2s
 m3wlObP+rEU70RYlcle1QPB7MgT0RaEmujj6nXjFJvn6qUXlsfwuDHV5mm4nU1NH3YaWzgWjjnJ
 iCGO2Nmy4RX4Whlfzs9OjaNZsvwEKCDbTPiUyWCSOtN/SurZrzI/pRCGRo4WnNDfDL+zpmaWJF/
 Y677GMsE6mOmxKjhfOjtpkSTsOvLs5bNm6djicLVidBXXqCRUAxMYQ5pc4opYiJdSrf0t3uW3o4
 JOog392kczx6YMDFNng==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af4b043 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=udFPpGrmtiWedX3Zxo8A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Wed, Nov 11, 2026 at 06:45:00PM +0100, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dts               | 4 ++++
>  arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts  | 4 ++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
>  7 files changed, 36 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
