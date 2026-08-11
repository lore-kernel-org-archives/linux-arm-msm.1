Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9B3331EA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 00:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786409918; cv=none; b=ZVK7gAum2GXVjcrIPymS+q3BW0W5zIYcUbhZxUMnSfDvez9a/XFhEg0gotm7Ll5kKykm0OYyU31ZFwln7QHkyFeiQinYqRNIeCwscaUGgt3lkCri3c3Th6cQSPT/uvcdx1APW4ztDIp1FxqKGM7za8Uj7rxD5bKxWDHroohs4HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786409918; c=relaxed/simple;
	bh=pErCnijODy4fEgUHDnc72g3nTdTWc7uPAXgFC+YdY2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdrqEIV/LK/pB8UN49nMG8tsqplXN1GJYct3h1taHgZcNA6Tz96zdlq+XQpZ4rtks/lHumgVY20D1ebRIKfkl9zAGZZPFvmUQ/CTGSQGgeAin5UnmEGxhsAqs1F6zKngNai2RIlwEUmwSCZYq6RbppeJoaj9RsI0CjNn681ebJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cu5PUPsN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jp4PjF4d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cu5PUPsN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jp4PjF4d"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpxca3008793
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 00:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pkBx6g0ZwIllK7kPvgkzwBWW
	DwY+Y8f971ch+fkJ02g=; b=Cu5PUPsNJ2vv5nMJOVn/TWvRx3ePaKRMbudwcJwg
	+Po/S6NdQAo12XAgFqZQyZ8jrVsF5SIQdezznxr2ocljEFLhDDUA3yJIoK1FOGta
	VByxyKdnG61FbeAmaN9DRFUmu+zUEwx5AhHNIVMANEeYaVLDQJgmyied/jmizJ/n
	GzE5JItvcFnKK47Vs0dfcbRSBeRjUAVcdAtYoGWWjjliJOJnkHBx6pWHXOcRb7wM
	uCDX7yakeTXgDmy9SX5KJcJhm/wSFE6gEc+ygg2x/Zpz7Dlcyzkd+5MIM96OyOXO
	N+ran2TizBy+XC03fa66psVMpXdAT83CJb8gi+KSSH5RyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjthpwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 00:58:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso42752721cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 17:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786409910; x=1787014710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkBx6g0ZwIllK7kPvgkzwBWWDwY+Y8f971ch+fkJ02g=;
        b=Jp4PjF4dPaL39MdU+R6rfFKkRdoiYGnr1M90Kk9RGWHWd/IcBWiN2+iaaag9+2wKZR
         8IBHxUttz5GbMWzjtrmhLkwF9Um2HSz1PSBQEa+ox6CUuJyOhOnJRnpvBeaaT1DmmAtp
         DlBLkxSiPkV1CRI7sQtYX+EsIuiAf2e8aqaAhCbshR2bqCNF/p8vfDtwBmYIetcXMCu0
         ckpn5XB0VGWG80hyGt2RCvKWSgVmnOec4uvnVnK+z8agd3bQl7h9VZlS9JnJyVqkVmJx
         KL3J0dUyzsw/2FT10XG+H/XR5ov0bz10XDT65G3wwGmkzWCbdaL+WyKcM1R0GTkMH7P5
         lmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786409910; x=1787014710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkBx6g0ZwIllK7kPvgkzwBWWDwY+Y8f971ch+fkJ02g=;
        b=DcTpJ2+rCTppWj/KP/CrGxZ7aoo8JznNGI4kjxZLVyu9MOXAZXScnFlFbyxR1woD6Y
         VxEhbwYIfp9yAOwyNc+i/lRvMlw/k4VMCNtTqt93hddU/VLkBzd68eSZVFLRqgLlpvQN
         4+a7sX3ZxMZuVVWuDeafbwueBzQEeGk2rD54Ta3GDuv0ZC6ybcsJ34dtbJ3xteejGQBU
         ahpuBw5+QHkpbOGINAaYpll2W9wLIdpmQViDLTCj3H0/RPFSTPlB1jMICQXhoKkEVcod
         3B180rp+0Tz6FG6jty+kqlT3wk/1TnIx9UNkvJLgFnlyB2225zY2+pBURPweU+JgSiZV
         xNag==
X-Forwarded-Encrypted: i=1; AHgh+RrFAeuXaoYWa01/o7+aIWBE9AmJyINuc5/9jUx+1IZWZnLsHAw+1bNzMJB5AIOzwkiBJuXkusiQo+/jrap3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2MLs73GiDq27va52NE3elnmmbatSOZR2tzvkE0G0AMXRqblfi
	kHRJLA4WjfRrj0fbKonK2nBf9lFagNh4CiAYiLJQASTuO+/tHCbhMPt0t6qlqvFS30yt6bMUCQ8
	YvHzuGEoTxqKV6NkPHVA9pRMYDYsA9KlFeGPeGFseYby2Vs728K2uSVooVFH1lcHtrtJl
X-Gm-Gg: AR+sD12zCGt3b0Gf/GWBCYhKNGDJuYTyDEfKiZSpFH0Wb6uUub+4BsVWXa0mWP57Bee
	Gg01fZQyTBHbHa+rlHJJOdO1RpOQmHPe+BZKsSk8Voq5/z1xrTcE7WZDlua4F3OT76YO/st/EEO
	Mw2h8n4EzJPI0Sg+bUln7PItqTrtUVal1n/iCYfTXYrbaznkUxuujcX3rIv+j5HZxQPCqREtfXQ
	lEjZp3AaWNOEJHm8CI63uj5X09H4rq+dt1Er+OD0s5ADD8O9r17PyITGizHA9RKVBd66guSHpQB
	Eax2oUTmY4+QieEITvUa0sdQVe/sdRooy/6cCA8vrB9EGY7igWltOey6U8cReLMY4kFxQkrJX5J
	/njLgLeqTnC9oOQTwtJaX2FiYudA3nkhdT4VaK3+NkrkMxhvywzbDvQCUXXkofK6XvSUHzhrhuy
	RiZ01givPYxuJKwg==
X-Received: by 2002:a05:622a:2595:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d0b00401emr409830851cf.5.1786409910281;
        Mon, 10 Aug 2026 17:58:30 -0700 (PDT)
X-Received: by 2002:a05:622a:2595:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d0b00401emr409830621cf.5.1786409909933;
        Mon, 10 Aug 2026 17:58:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055e9752sm2279876e87.59.2026.08.10.17.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 17:58:28 -0700 (PDT)
Date: Tue, 11 Aug 2026 03:58:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Message-ID: <4ovnsghrryj5gxvggztpw5qst3t2qwrxu4p54iyhm5tf2twcd6@stuooi7j4jo3>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-5-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-kuno-soc-support-v1-5-5e0ede4a0c72@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfX/97YmigvwGHO
 nL/Zmntf9WlfGkj0f7PVi2XtagMXL6SEE1icmLB1rZEoNXFRTJ3YmlO8htTn3FAcuRhbs+7KaP2
 jdIAdqrnEyMLoAZcdt7fiMTBkJAdMrZhZSrfSoCZcqW/DJ0Tv+blgIn9A9GUvp+xvnBnuSRwt6m
 5wun8DK8LXc9wPLhNliZivEmVq7S3xhWHLznaoGfc/YV+zWC0dHYCkct7J03fXqRrg1LLxi/WCO
 x1YyDPAr7hSv7COlndDwFNKIAns283KIGh5qnu7sOuQ7HjgvqqsIFoOr9aG+c4vnTjp6yk2muON
 sBXQkvKyihOo03ls7NgtyIdsILnrqJZAmg9FfWgHDBESjn6y4+T2uvbRhJEM7pPlC12e6A46tXG
 kJyLgsDmRqmMIf6Rny4kWyxGC/UjoU6yN7RbVUArM01yAquPqJu1PI4o8tZbU6Sht4KCOLrdP3/
 j+wmeMBgZ0QjTWZKWMQ==
X-Proofpoint-ORIG-GUID: J51xxdfFuYx9yNpr0LaWk3jMa1GRXVbk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfX8uK7F/lqDLnp
 Nwnt1RZi3SdvfdJ/PuGTLwOjwjrHEDKcc/xNvxLDefOL+dT30wdqausb7UmkQsNl4n85Tk5dn7e
 me9f4uaInXDXZXrH8g4+4xVrEcKqi5k=
X-Proofpoint-GUID: J51xxdfFuYx9yNpr0LaWk3jMa1GRXVbk
X-Authority-Analysis: v=2.4 cv=JsHBas4C c=1 sm=1 tr=0 ts=6a7a73b9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=-YGGs88sVoTMC7_f4VAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110005

On Sun, Aug 09, 2026 at 12:57:04PM +0530, Hardeep Sharma wrote:
> Add the RPMh clock description for the Qualcomm Kuno SoC so the
> qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
> consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
> always-on variant), the QPIC BCM clock and the IPA clock.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
