Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F0C4E01E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658909; cv=none; b=twQN++heUYbNHhDf5BnlXxku+2BKdf+I2HpdF1keij94rLarNSwE7xvhkzjEiAx3Yxs6je9BSE/A/NCAIiNZxYUfLsvzJ3+Lf8w5YJV3Sb6VrIFP4lfAvzps/sMqYoYsVTwMf/WlvE0IKuVL1CW5SyZ4nbzxme44ZrDmzO7g5Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658909; c=relaxed/simple;
	bh=qwGaYA5J8cQoMsVQMVZn6rsA2VlKVu1tTczIgrpjkX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tr4P2ySuWfsjw2Hq5DZ/Wa6M1zo+mllOosSILirqQ0BHkSNaMYOPrHgizEFafT6ELPJUckf4dfAX7GerXcP9Ke0PN7hes629EkiBPsacywxE/OxIXYFz9/49DukUxTWNbYbfD3245VrpTI+/nMtsQp9hBZcTXr0QRqdvpNhHamI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SoDptICm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASzlukID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SoDptICm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASzlukID"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj3CM2777138
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/+Kdrxqgr+DvSDtGHpmdyPJ+
	B7JjcHm1WIvNra5tjA8=; b=SoDptICml04LDj+/Hm62uX9L2Hm9dE6SyQxVys8Q
	k7ktWMgoOV8o+O/EpE8Qp+cXlre8FEjO/SdNH3MwBzXNJGtMoIrI6g+s6U61AQ7T
	37sYmKtsXOOYyf+0vxHw4Zkx/DAXj2rgUksaIzaS8YDdQ1RYSuIz7WDHtg9tOZtp
	uQQBGFuVRb9ybhW9TsaznIgeGGrYljvpNc4FqhDc3R/2u5yOj0kHA8VoZEfelkFn
	aPm+6x/m22buDEGhOAbyBBsu7QHewNMActhvFlBDUN2LjS2ijS0PaB0uKAevdswT
	3p9MyAqJVqWMTrNpTIsXcFnVAALR1pKtR0bo7i2f76CM3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m38h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:28:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939062ecda9so162545785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658901; x=1790263701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+Kdrxqgr+DvSDtGHpmdyPJ+B7JjcHm1WIvNra5tjA8=;
        b=ASzlukIDuxICcITl9iPYDV+3iYdUNDfD6gkUS5UNm09dMB0oKW4FQUuQXlVzfzoaAs
         8GSpjmCKTXVkNopmgvqh4ievCT03QT7L+ozm2IcaxZz7ms4FfUWG693BSA/GBSNlOevM
         CFzYLdpphC4X1fW8mAJsYpt3PCaNu3Dke0niWDDipfvFVRM8SaVgm8/1+YQpqZLXRg8E
         5P0F3b9GZnWn/GyP3x9tjdpCMxYuHikEw60C+O7nC6Gw4wtQWSvnKz/7AdYseAvfXExx
         Bb2TOg+32dpl/x7EhJS7d5C2dlDyv7FafrI6pjOIW40qNrB1/sIAj1YI4rLnhJXR5Kwz
         OoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658901; x=1790263701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+Kdrxqgr+DvSDtGHpmdyPJ+B7JjcHm1WIvNra5tjA8=;
        b=KWw+a37ey+irKm1BMuTFY2FPPJrI9mo/Yz1FmN5sz4JNc5ryYvXwLzw6h38f7BAh9m
         FFGl+fR7dZTg8nl+XA0pYd4ocJ3DXwiUBfoV8n1nO0Rn7kc6vpXPX4J2HJZnvbHL+uEM
         qswlxg+tAHF5uLqV2rwIOetcbo7/hjDIkrOd/P8gWVf4GD/ohQc9fTC547HfddXWZkG1
         9c3h9S0kJTeQZutoeR0XuBcWvklF26lJdl9reW24FlBfZG2koEuMdsCeeq8K1FVnyVHM
         rVn4hVskxFmVPAaV3N4kSrbgxtjiyEDFWgNX7Y11avI9VM7QsOAQ/y02AZ9iQfw+WBzF
         mCkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFxk2599nO1KEdqdjw2Tda1qay4igKbYiZpLj1DYa8Xpc6VSrxneZlfkyA9OQEHI+j6IwNRLhOldYtwZTZ@vger.kernel.org
X-Gm-Message-State: AFuF++lTFSnF+Laue6i4mKkXHf1XWTahBG/XluOmnAUMiLI7U6O6qm4K
	2IZ7KcCNTMUojhoB7SxCodPulKrS8VnE3NTkbWZSnDaZemzWcxiHTH7DAwtymlel6z25eFCleRi
	aD4O9sSG1dDtzywu12VLN9S57lQG2BERXycpy8RdZVYL6CccYOZVsuL0LQjvtB2sY+xlO
X-Gm-Gg: AYBFou02y51JKgf5Cy08o/zXnj0yLQzD5ThjQMh0CgI+DBE2gjMY9peGm5dh4WPSYhu
	L11igcBIv5NMKeHFwVAfjLalqMOxIVEB0XE3SBUYv3Ku01IAdaNz0xW6iByEAySYigWl4qCKumL
	mlKO/9LhqZhPJcdvlCQMxrCcYaHxJHNo3OBfIMoEfWQV9iqIohak2jACtb29lyF/0Ni84PL110a
	oJVfGBDaCQ3kHvynuZiIbrbQZIH+Eu9NT7s1lbaaxDWHENY3tmBDkNShFnxjWrRm3O4umvr3L/8
	cjjlQyx1fYTqUjdd5oiI9JLFQyzpum0mJl+Y6V1dGKcs7o862liDuJ5LS9YNlMwwtMuSNU6B61A
	FvikAdLLkduxPQQo=
X-Received: by 2002:a05:620a:600b:b0:939:fc74:b6af with SMTP id af79cd13be357-93bb76bb19emr1300809685a.11.1789658900960;
        Thu, 17 Sep 2026 08:28:20 -0700 (PDT)
X-Received: by 2002:a05:620a:600b:b0:939:fc74:b6af with SMTP id af79cd13be357-93bb76bb19emr1300804985a.11.1789658900484;
        Thu, 17 Sep 2026 08:28:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847ecf52sm135817625e9.2.2026.09.17.08.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:28:19 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:28:16 +0300
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
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/5] arm64: dts: qcom: shikra: Add mclks pin
 configuration for Shikra
Message-ID: <o4tjzh6mufahuvhllyxse7p6vvbmbnw4mlqg5zrmgyqa6ated7@m6rmnyse42g4>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aac0716 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: c41o2SCUbYP0EtasOuQT7-a42oY9sJVJ
X-Proofpoint-ORIG-GUID: c41o2SCUbYP0EtasOuQT7-a42oY9sJVJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfXzI1f4PwMfZqv
 pkz6O1MHX6uIokBVDGYGC9HW0wYikpVfiRsPq/fZCwsR7drMFIrsk6sqLD/VSC7jfxZ3SWZIpF1
 gtrNzJgpZVayjLzD9FHIpwqEnTAJsl1TiTNz0uAAeyiTD3s+1Duv/xHBYu7qnz2HjGPbC2pHOBV
 zPfFNfWX4YAOhZU4EP59LJJGbAMvbJ74I95bbFVo9D2fpoLVtqiYaVfwQNYem1HYIuwNK5iF/PS
 j+CkPps9icPEPtBxLb8DVFTKXNEPPpN+q/vTW/Kuu7+rHaSArhlbaTgZoHGgDXNYvL7AlBWBbRk
 82CwqOzHf7zmrKi7gNNdfklShWMfw7cJKSkEpxUOUX+VkqgfVI5VTIZQhOom51AAfeKXPalf5TE
 jv+Fg5/Ns/k6vRCjkRFBasGJmUJ99B8B2waWAotP5Kyx6s8PAektiD0QVhTvIwm9b+vM6i0Cw3r
 tmLWyG/k967rlCzoTyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX2Ej2nWgyM5YG
 T8/U2Bice9aSN/wYyc4UlLdgigHmqPi5Iwel4Nb+bgzlnkKFzY+WxwmCxWG6ExrLE+zY+W8z2N8
 /rHQ3wH0aeSc9kXQFKXzUS3rrigO9zQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170218

On 26-09-17 17:11:02, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
