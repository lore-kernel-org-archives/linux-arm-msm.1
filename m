Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861B056C63E
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658784; cv=none; b=CD6LWLWe88XcEwLL4WM8ZMRZC/Xzskk5b0oX8+3+mqBTHrAy+rr39t8UNXuCYZ0fSaEYAw+Eu06Vbby3bnQxo8iSFEAa1rH1lG5AN7e8klFqkkGlE9/JY7IHApR6W3gVZxVQAQE9ghkoPmMMBF7e4enZ7O9950KkSjIH3DEZ1MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658784; c=relaxed/simple;
	bh=3qmlskWMzY85Oikfhb/KXg46Z6tfOC9OdCPH+ZehnJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEwqi6lH2zWFQ6P9or8jgHUBB3vOUrmc7HfJBS6y0+vg3ev4ZXqoiMWqGaETqIDxPe1SS+ZlOIiUVuiP7qn8n9VrMVGU8bglF/JP1hg5SatjGV9lChDQYIjzvi7xvh+5+GrJP8eNB4zTH5ANBqCKnbqoxVpSqrh5NcOy8Anwuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/r+rU3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoJeDqDd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/r+rU3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoJeDqDd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiRrk2086477
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ln57oQHyBkL7V+ZLstDX/rR8
	u1lfqU3aYXYeyOqWe4E=; b=U/r+rU3nLB+dvF0TXAM7NKyQDeLKUjbIyQ8IyH8q
	zHYKb7kGN7xu4WIAEOq4K9kOAyIvvKrJ3us66pLC62z5kP/9cEDYX7xB1ohEIOA5
	CcJTkZL8NVU8CFt8i9qCv73hftU1mjLTZUcXG8tftC1nrPH8qsMPuMowLxI4OKd9
	Bo1VMNr4MCVaX3OCEqqHHZ9Ygln1anRO/2vULSoIgjpp/5mHU+H7D2RwLYK7FlhP
	4vGTGMXKRXE0/az1woszeD7DVx1bvtnoq5gLTuxthBZxOpU+oqwhTYgG13Urn0B3
	lbJS+5dTNrKq5DB5mVH2xqhGre5Go7S74NzJPqWtTyeXjw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu410km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:26:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9123c523d0cso10845516d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658767; x=1790263567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ln57oQHyBkL7V+ZLstDX/rR8u1lfqU3aYXYeyOqWe4E=;
        b=aoJeDqDdLdHkj7EXitk/82HUu9mbJSvyeBgFtNUSQbdXMfSzryWzMPD8ouC2zfsKp9
         br7eh3Ax6LQ4xRyvZJHWyzxPMfRjoch93WJNlQn6cM8qoE3tyo8lkO7RHC33tO5onHGV
         APdT0Oa3th1kN5h6MWcEXwkhBDIG8Q7/tQPUv7YTlzJm+V8MuqERfClalmnB8C8kfyPn
         k4Nl4UIl42zdOa0ntCXfa9gt64Ejh2TAwScF3oJHTVAniVgh3uhY+Eckh/MX4cDs7HCn
         ckAoRa80E6CM7qUnYrqt4zCTmKZlxIj0Evdk9RQTPh1pZIIZ3hSsK00dweW+wKkarLtW
         ymnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658767; x=1790263567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ln57oQHyBkL7V+ZLstDX/rR8u1lfqU3aYXYeyOqWe4E=;
        b=EaWmQWvSuYbkCQ8gfHNG7m63F/+bGLeboyUv8nzAQUglGo997wQvhQKHd+LcR1XYop
         D/gGLazPFZP7ylBLImlAJRZU0SpMSctUo5n6Rlfz9kbBgsai+S0V+xQKgpWRk7pByKwH
         T/c7qqJXzm6ObY8a+TBSe+fSCbW8u02q5a2nzZ8+7fr8N6OvAcbpSeAUof3J1PLLMkEu
         1yrAY9sr7RDmdcPjpNBP98li/wWcGM9vbtynQYYGAEMbwgYmsmXp3g2obAarT70XaclO
         4Ipr5bZ+1fs7MHB3RtlgG8Grz+0RHIaosYklnWgK0bKmw1GQNfN659s1QSm1ZkV3trBX
         Q8MA==
X-Forwarded-Encrypted: i=1; AKwUvByoq2vatzuSUSyRJsXkgxnB7lMeahg5N+iapagwpLr+uONRMsNscFvth1cfr6E2FNd9hX9XBAgH3JhuoL2v@vger.kernel.org
X-Gm-Message-State: AFuF++lYPztUpUdQT29neEXxTcKu0tqQhx4ck/1zuG4Vz4KZ7wfTZw4m
	mfruW9FOSybvFIKR/3QZQWaTWJ2SVnZhf8d1k4LkiwTnKb9KBHHQ1iVClxMoVTTibNNaLx3tGjO
	w0WRQ5rDtbG877Um2WEioaxhun9zvu1N4LHt5TGHpOci43x3qQl8hUVFMJOC70Ln6yrFa
X-Gm-Gg: AYBFou2GMFkmgZjXRrz3+L9wRgoWH3k7p9mUY8Gobk6kmr3j0cqhaGac3kJP3i616XR
	bZXSEKOQthsHvl96l86g9ESLNZ58ALXvkCE11qvpTJUCTLZ38U9LDmcN3KNeFPXzckSkAiT6MQU
	C1RBPSlX5nWioSzqB4v8+YwTafnBo79FDL+o8majgIqk1sjCReli7LHfcqQB5TPQEkvlpGbcjms
	qfGtv/2j7ZRNAc90kzNJFrwyFwFET5CmliKlqu5XrJ7jIYbQ/mEq/Wo9G1Iwd5CJdY60JOTdkxR
	TkHmXPM/1rBFgxUgBOUzTUdftAOxnP0nLCQWrj/Azf4LpLAhB7ICCOIEYVD+LE4XY5DDiSGLGIb
	sziwwTDlZjVyUKBo=
X-Received: by 2002:a05:6214:5b86:b0:912:264a:874b with SMTP id 6a1803df08f44-9123d70d4a8mr129825816d6.8.1789658766427;
        Thu, 17 Sep 2026 08:26:06 -0700 (PDT)
X-Received: by 2002:a05:6214:5b86:b0:912:264a:874b with SMTP id 6a1803df08f44-9123d70d4a8mr129825146d6.8.1789658765936;
        Thu, 17 Sep 2026 08:26:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232d5bsm82102005e9.12.2026.09.17.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:26:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:26:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/5] arm64: dts: qcom: shikra: Add CAMSS node for
 Shikra
Message-ID: <2zraylrv7h25qgkxbqpq7rg7nodw7hsajshsdxxf5gsgtrigxy@3keepqqao3eb>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-GUID: IYArc33bOyrIxq94n9UvZjlEigO3Ko4O
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfXwbeT4BK4Uzqx
 Fzl9gb3oKhLYZ0MrKpM/9c+XjaT1vRHv91m+ws49/4vcL2gune+fwU9319QdL5yCW6E+v/n4oVu
 aJpzRe6IixfdcoVu1E6RYSqjCyIBCN4=
X-Proofpoint-ORIG-GUID: IYArc33bOyrIxq94n9UvZjlEigO3Ko4O
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aac068f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX5b7jvdn5HSaS
 nSzz5TANqes85ReIV6ennwxrXA86FiWufGBO/HD2zbOlbhG49Sn+iMjD8TdtZYnPEOybZ+egtSt
 qfKVKHAgQobJvgOriE45sml0/lApvQeMoV1UtNx50tx0AYM0YCanG4QjOoaNJ2ti/wdQELzBNJq
 nnvLBUU0TMqN5QqXJUgPfoc/vHijIC5AlmNq4MMJ+y5dcciSVHV9AcjIlf/kC1FKg7aO7QDyrHU
 4kpGLb6mpYJw0vR2vEsVb8jgeDSrfEv3kOlVt3BRtg5bqwQixawoKThTOPBal90Rby1HtVK9jvB
 7ozjdtwuVwmNWiwYcVsX+xX//cAZ8fwdutL954Swb/BGdxFTdJxDu5y2bQ+LmverCUtV2zMp2Gu
 PVm0WdAlQqW9CxEClmxuWQ38uvj5+5cNnEe6y/V56S7r0scR31BQzXf/fnIdCoP6cbvoFgBeBLO
 ksOk8FqX3QolI2hompA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170218

On 26-09-17 17:11:00, Nihal Kumar Gupta wrote:
> Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
> with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
> and OPE blocks, so only a single IOMMU context bank is needed.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
