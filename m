Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E4635DA5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221200; cv=none; b=ugKMWspPdoADDbkhhLlIDi08JeJLOInm2QPPjF96PVWJOpIcGn91qtqON8SrOJWTjFeW8VMoAcC4skg8JDydGujBCtrwpOUtmefY5RK103Ujt5j9hrvENByiZL0w98DolCpa6mjByFfM5UJSz+ViXgL+9+HT5C5rv9b3FxikvYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221200; c=relaxed/simple;
	bh=LnZIFP4KRs1Bkg+3+5TO+CUppho/ZxHsRv1im3UpGBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REPF6e2jsQpl7MneEUuApkfhjo0aovkRM5CodiGdLtSAtIePuSWvyw5CSnqmkwkuKvFMP8+WCzTI5J1N3UBUqaIbJF9Gy5zCwuDWT3LoFqrl7xfOMVM1U8dqaNvKzrHgJQTitWpCAIcUN6qvW+b+TWzxqbz49uz7d/I0HApd5ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXmtjz6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uu3nMiwR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bXmtjz6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uu3nMiwR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3akMY1673385
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUntKH//WDpyjjrkxEP54wDXZNI11wiNR5M6Q/uu5vQ=; b=bXmtjz6yXol3ZYix
	9lU/GxjtwWs/azO3uoFZpp2t9+kzE2VmlvKoW3PhmeNiyIMHJpzPtM0EGibFNhml
	4PlAN09eJU1tdFBaPs5PugRgGJpyOUK7WAx5H+drWnn8wekh6HaSe92nC0GQ7Hbn
	Mf2cH0J4ynLE4uxUbuFjG2F1NAttQ2z0halZ/XDKpFi0E1EmKrVTgnDugH9Ja2kC
	p92JtcE/8H8ICjcxv+FAipJH/BBuuYyuCYkWpa5TX3JG6/UigrTJ0MFC7nxqqf79
	0TLXfQ+GizE48oyAojUoCm64kWyPBkacuFg4glGSMVpzMvLUXa+LtxRkuO8tv9zY
	PB2/IQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbrstt7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:46:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab041eced3so4714646a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 23:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785221198; x=1785825998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUntKH//WDpyjjrkxEP54wDXZNI11wiNR5M6Q/uu5vQ=;
        b=Uu3nMiwREUxzupsbHlpFyV2leotWnk2eZAO7bqd/wcE6LcDU9oIY9LXiRJnb676H0h
         YOguqEQg6pf/F9CrP7Y54HqgOkN9s7mV2+DnJDgG8L/SYy/4O9FcEVjTS0hppUAQb7Nk
         HQ770sUZWrHmhs8JR2+3mxsEL09Nu/jjtlnJ9tL6A5WPmJ5OWCJo3LP+audcZpH9wSiG
         mkqeUF9y8xg26t4ppnbJV0sLm5fdXvr5vuYOTEjTGb/0es7ENUAawQKTYQbhC3nqkVCB
         P1qbbobTxIAplx+U84dAzU0OJrOUrDYmqptAaM75qIN3ZBDJwheDgtrtk/emO5CHM7s+
         mjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785221198; x=1785825998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUntKH//WDpyjjrkxEP54wDXZNI11wiNR5M6Q/uu5vQ=;
        b=JyIwfQlfIJlyk8zQ9+FUltgdeOfMvT6yjF8mT99pwYtZcDUSsq8xP2g43n5EhyKiop
         JQloSryeYCC6/XT1TL9ELf298nMKSyh3A/icPdgPc3J5kTxsWr148DJNoY0VpfSdNIkt
         nxtvbTf3PqWrlOhIVlXOPoUhMLoTMSXhGvmU4oNL2KPkH8Fm+AfgF7TtaSEJZ4Yq3ebw
         +kiG7nXlMj9ZoHyHQdi7XbN9ClB7MOofVn42rBBQfJU8FrioDbh7hbQO1o7skRBRsLNC
         L8Yzc2UuP+iU0Isp27RtDFF4KJJGyZTmkaY6tDWYGBAp6/1+UasR2TwGBQtOF17cA+DL
         uTNg==
X-Gm-Message-State: AOJu0YzZvz2EzdvZHzMD9rP2hfSZ6NstiZeoPyM0nVYedKRmUm34Woqm
	H9P0ghBTGvxo3aVxQzMxRNcQ4iy/z2vWuSuW8A/GI6Ky5dKE1mkpaU1PAm+zBXOgMRG3twEU7sR
	z5As+3qR4tEkQrWewdL8rpGpz9LgfCK2gtjm/lazYxNQA5/Lbee4Jvq0/13SRkUQxXUCj
X-Gm-Gg: AR+sD11Edp6Jp2vkJ6tV45eeDQ3bdlQnHNqt+TjYfE00t7IpuXMOoqdba9su+0YqQ4q
	b6xvRYs4QNBHXpiRuDtJMgD2Lfobla8QJtkXnGBYVuP8Q4TJqbX/HGPHdFOZTAHUjiaPQ6mloPS
	VcIGMvOMM33iWqVFhUQI1hJutCRV631qYXReGcKPbXWXosy3oMNyBLIXNhDKX/rglGRa9X4SAt4
	Mj9U5YM6OC90PluKwQbnnvFLMXXmhR40kWGe8Iknj0MkZGRCBWc3oWKQHGgAZ2C2CMS8xj0v13V
	LsiG1YAMvWBCScXM3fU//BXYGdA/jck/LK5zd4TAfmt4WZKRYe5ZIoGI2SPQZ80/9GRHxyJJI5E
	nAGG09uscQqvZFF0QHS6j2xnwUgsH
X-Received: by 2002:a05:6a20:6a2c:b0:3c3:853a:8d15 with SMTP id adf61e73a8af0-3c8ba5f539bmr1590950637.72.1785221197746;
        Mon, 27 Jul 2026 23:46:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a2c:b0:3c3:853a:8d15 with SMTP id adf61e73a8af0-3c8ba5f539bmr1590911637.72.1785221197224;
        Mon, 27 Jul 2026 23:46:37 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66c848asm4165498a12.22.2026.07.27.23.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:46:36 -0700 (PDT)
Message-ID: <d8ac3c2a-d9b5-46d9-b33d-d65010933361@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:16:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for camera clock controller on
 Maili
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com>
 <20260727-maili_camcc-v1-2-01dbd7ddb276@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260727-maili_camcc-v1-2-01dbd7ddb276@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX/qf62NznEuiB
 ZBNdId8H5fDCkOQjtDzhEt0uXvBAvCSpOgooe4e4hpnT8cWTp4alU4DlR3f92fHXQe5CHiLzoK/
 cKD8G9HdWBbvwQzBuY+bUqxtwwTcFyS7+zg7GtcPAdKL2XaP5bQ4TD26fzCJJKmFHEY1YcOgGKT
 m439V/n78lHwvA/rgcWT/mfSOffFwFUmvzpy7i413vveN7YoAIbfOG+3yFDlLrLGwy04kmKnTyZ
 PiD9IzIIHpH2Y1nAjXnlhN1Fha6GvdAsdARAaLvPhHOmbJRlnWOvTFYVRftz6Y+z2gfU4C3qwbW
 hthnuz2GbmV5BCzuEHHo80lmsg81PHiwNahcQ2c66JEba6YjGuPRBEf0/TXzurwp6PVRasFh6Gy
 i1Sjnu9+CYOcTNAo86yT8zPN5QEiPfJ5+G9GEyJV+zN0OldAxpsPx0Cv6LNUYcPtu9BA9mCCMJp
 wStBshO9mKCD3r3ovsg==
X-Proofpoint-ORIG-GUID: 8ObC-ZN7COwLEFZv-DgugL-FFHtNzGNC
X-Proofpoint-GUID: 8ObC-ZN7COwLEFZv-DgugL-FFHtNzGNC
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a68504e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0XqRBWWcr7USVrq_zZ0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX0R4XRkdZyepf
 drQGoDRJRjSMvl7f5pis1QxFEJc6HIeMWSYrRkWJiLlwYu3294Y7VLtdE3f52eOorc4Qldc1eir
 HlI+Co9qmPnBL/NaN8UIumNr7aWizEg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280060



On 7/27/2026 11:59 PM, Jagadeesh Kona wrote:
> Maili camcc is mostly identical to Hawi camcc, with a few clocks
> removed, frequency table updates for a few other clocks, and PLL
> configuration changes. Hence, reuse the Hawi camera clock controller
> driver and extend it for the Qualcomm Maili SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/camcc-hawi.c | 158 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

