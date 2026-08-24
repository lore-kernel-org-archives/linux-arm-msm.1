Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C26A3ED5C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561986; cv=none; b=VvI8P1UTeD13d3QnDf+ypgXqr10iJqbYy6RPNNc5d9Y8FI4hprUcSJeDaXzYCF/65El6dNdtobwpDYgAMTYZuZK7ivxTWcfjMtipmubwolHjTL65bDigWKK3hZBj5CJd1CqQQI+Lc7ZCdD/OKYp44FzWu8bdU3nsx75GPFrohM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561986; c=relaxed/simple;
	bh=9Yeg4pEJAq2y1vfd7BWO5GQQThMFfvnhf4s5AWl9EVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikjuRPgzmFXRwkVZSA5p2ncfasEVt0VYT8f5Sk9pq1hUtAAsoTLx/tpe3oEnSjImv+se68hFEhjC5hFjL+ejA2VRiBDSM+lnSr2pLwtsWW7LcLzUY7LpRNE+ZP3C9dWOhDsTu/iQd+a1/+NbMNujIZIg7BiHZfi+/4JO1JGN6jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyOIpsfu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBQ0XDGm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyOIpsfu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBQ0XDGm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RGoS3067019
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=; b=JyOIpsfupR88VhDZ
	JoxXevbOuacWGU1AB84hVVd/etDDKXD7slDEZ9mdh4JxcIaVrGmf60m9a3PlMdoi
	Eo0Bh5a19QkpNJglfjPifGUWAPEjchlVXNtIDsLB97t+NYDNhp9YhE1IZvbCtKKn
	ALYMZh5wCTlUrMsyD6WWcpUP1u1k01KCt/A7mw4qiQpjyKhW+qiUZs/N3SKhbO/D
	pDsLQCWdM2UXH65cM60UmwpW9D8/+BlloDGok+TG93DrI/6e+/S4w1//DU2wm8kr
	aG57QrMH1mUhU6tbcERPvmcM2LO/AN2HzfiG+rvnEk0sVtG5TGZpuqC04WnkN8ai
	XmaHNg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpht3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:59:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ddb567146so6875941cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561977; x=1788166777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=;
        b=FBQ0XDGmHAlSgBvo4UKH2UhyLveRHw9lc0rknS27OWINVBytyEKv7DBrTBiBGmWMGi
         MXfFTTd76TCXsrmyHgj9K5dDw10XHu7EZkDoTYE0t1qrfS3AFKI3iWc9UPqVGW5hrNSt
         sZ0YaerRi1hibzHHlL2yzffudX+CRzgak15y3BF0EFhsUFZRqnPl26jnMnZYsieOy3Q5
         98h8jb3TafkL6QA6eTkb6XcdRsbvEHYoylBGn4BfeQnBfpfTsO1ODfiTuco6xJkf09EA
         PfVil21guKF4LEAg3BWKscWXp2g5UqCNQ8u9HAov6IUEQX23ArYJBtzR9pwDFKtKrcdZ
         ONBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561977; x=1788166777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=;
        b=ChR9IuQY+xMgO7Yve1on0lGmpDg03+RAzpgD22ShiS24kcSibWNWLz9F/JQ3DHedxc
         NaK5xWKQ9heBuWXaIZd9N5n7lgPfi758e/3XY0Z9QuOLOXpVecrWCTFQ/QVS9agZkSV0
         o0R/XMasPnfvWnjbnDN2WzlULUKzNpjfd18xMJn6Au7av7YJPlp2EnBH6sEVtOzvW5hS
         wjMzNKNsZke/yEDMkUOAVTxsj2V8gF8pFEb4mFc5dNxQi0hNlv18HU6J5guKx54xrvNo
         SrQ6FR+4QxTT4PfGElg2ET2TVaE/+JryKXeeUh4tWZiNMfcIvkLFrq4bEZFmZ6edMjgg
         IYUA==
X-Gm-Message-State: AFuF++ll8QHCX6Yu7jS8xNWNQUYTylzulEQZtBPyPIGAWZgK/H2dm+8S
	T1cL1y4U8vbSMryPcpEznZYAYbN0Gy0hEykVGDC8zHBkT3wFJbUPSkP77hYPuk3hXsgjd4RLmEe
	V1KHWvXc/l0MKoIDplcg2GencwJ/LJY85l5ZnhdsKAtj4l0pTJaaoYbeecQP+un35iQqC
X-Gm-Gg: AR+sD117nZh/hoxXDdG6ySqQYhHEnJyU0vPhCFnriapHQH/8vicOrQ51MpJqKRL8W1W
	Y0YU7NRM6In1a8mQkSDOW6Yli561r3KHm/DgRqujye3pUe8ocu9wJVKnQqzG9u9ds+PzDzt6PA2
	/zR6mkbIea33ylwgFjHxt1jmP6z7RfqS/Ntm+4aN3jHA4B0hr7e235ra+Zx/uKgMI/US//2p7ZJ
	pZ4E/ubc6UTsdmRwK2JIkT5G2RJm/tyoNSqfUnVOjLkpo8dmA/U3bxtLdBBmFz87NboL7IPcnE1
	E6wS6Hk14IkdE1LDLe4MekkqrTMqQPix3xl0h/I2OO9AapmfxERKmnLG19KuZIVEDBWwq5cYZlN
	+ZraczaF7SNICRP4KmrmcHyyA
X-Received: by 2002:ac8:5fc9:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52df56ad290mr183183181cf.2.1787561976951;
        Mon, 24 Aug 2026 01:59:36 -0700 (PDT)
X-Received: by 2002:ac8:5fc9:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52df56ad290mr183182981cf.2.1787561976582;
        Mon, 24 Aug 2026 01:59:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606bd05sm1095582766b.2.2026.08.24.01.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:59:35 -0700 (PDT)
Message-ID: <8e175474-1275-4287-9101-1c54afdfcd09@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:59:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] arm64: dts: qcom: ipq5018: Flatten usb
 controller node
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-5-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-5-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX3SaLt1ggTgk9
 UQG4lwr+rVlxm9pCzowEf7u/riVnvbzjMyEVdOsD9Ee7QlWymf+BFtsPW20/S5+iA5Q/qqwevGp
 xo3niihdFJ/r2afMiS2zcMRIpdrUMEpMknTLDlDJXOr67Q2fvQ9c7hteJ0nbaoepNm1XgAmHKMu
 OqwWvV4h2rX9kdeWblPuOrapMKZPVL9DBS9K0Kb1XtsMvcN8d+/r1NlxCY3QiSM0yIUse2klMVr
 AihRiTUA/7UjqoztTTjNho4hyYp5ybdJLCxgg79UcG5K7Ybn02GJjhwfDauejl1+hyeWEpbqV+c
 ylqbMPJcI38bq2hzOOGtW7A9VwlQLb0G3NJxIyr0AnN+JtbKKPvnYmYgrwkS7Hjdvbibn2zAMgc
 lzEWYARFmB8IzDLLKNmO1Q6U2I9zB+NxS2108e7txM9+Uj6Jndav74mBRazOQdz3hfuV5tudyV1
 FyMLs7ndjSV1mDMbqwQ==
X-Proofpoint-GUID: 5RPzbSFTp6U0NYxdJef-VG49gc8OvS8h
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfXxuUVOf5zx86o
 J3rnseUkdfwluwFO37PbXtvWDUOh/13ouqnCO+MdUdW5hLmcLasKTL8+tGUevczm0n+J5TlHWp3
 8DQxJozVRlQJc1qeVBBhTfNa5N2UcEk=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c07f9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 5RPzbSFTp6U0NYxdJef-VG49gc8OvS8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240078

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller node and update to using latest bindings and
> flattened driver approach.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
