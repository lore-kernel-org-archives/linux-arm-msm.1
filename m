Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455153D566F
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647353; cv=none; b=NLl9rADobNMQ5K/uFvMcI4xqsjRRL7LK0G9DOOTjvVXC9G76PLplPVZvQszJP1H859B+BcL8NOjQJEFPvKUPjMiBfzWA9EEJJcVYiat+yxi6J/Maaq53itA+eU+Z6n8E09Hx01+4qICbf4FH5FTHc4fzKU8EdXBGFFor7pbeY4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647353; c=relaxed/simple;
	bh=ayRTa2nQVP7hszy2MsPoyKk+f6EPiComELT6oUW1tjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRC5xe/TFzXcP17GvEScqrZjlbjQC8RcvraJ03hSrIMHPXm9LJvKGVV0fs5Xy8EvSG+sXEbE4EfVxpm2CtLIaHbJinjw8aHDId/qPEEKCdsgGwbo7i8iEkC7QzQB1WoatCmcDK5iw/bAIisU91hTh9H4HZ2sH1xCPeJPYhSHH3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPPeeGAQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbLBr9Fo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPPeeGAQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbLBr9Fo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88DQY1934800
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3lp+DUWM8yXhcm4IeP7nLZRH08qIolnoMgoT1U63h4E=; b=dPPeeGAQ6s2sr0Z8
	JGDhyBC9yVMI3iaPlTbnd3eYCo7OwmQaoJq9QZY1YF8Y1TNF+Nb4ocdc1IVqbKiI
	zFTUQ9aaLn/Tjbw8AVTD1bznvCMpVP/gsWzd1OTpJtGf4bsU+bNvPio19ft39YTD
	zfXhPe4eybxwGDfg3yDXzQ6/K37DZId1wlfoX/d3CEBMHWhrO/GChrzIkFnTnCWC
	UajP7ArieznSTQGrjQZ3NdvNIfyHg0wePvtp1gCs6KcbgMnmCCpuohgGcC48/Tmh
	LZ+Z/ngwr+L04CW2CQqqQKqEs4l25RfCGCf9oxzH6/z2p77Vao5S/vXdD5tf7wXq
	pfkJRg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g92jqs800-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:42:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930bd2bfc45so100341885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 01:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787647350; x=1788252150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lp+DUWM8yXhcm4IeP7nLZRH08qIolnoMgoT1U63h4E=;
        b=jbLBr9FoqXMufGonR/UhRLnoii64cstNgVK4eLt1ZJWvvT3bve8MTIFf8rP+F81Njl
         GRxydYTq++zGpm/0jTF2aFwpNVaUFPqCTmAv4G3AR0BBRaqum/3w2ou8FYCRC7uWVDoK
         9tDgBJuPJdhZQzIpc724z/42NmNThGXcEhwKuM9gvEPToLyztryGJWDHH+qxECydaDdd
         S/K/STZ1qdusJ/qmHumaBhJ+QuaphbnCVjs51j9IZYeI8nbmOFptt5pKsqHFPimdwH84
         NXRNTdg8ASEv8o3aIrkC0gIV9A1O9HUtJybtLiWFSB0T8+R5m7NBJKHBLI5B3h7LPfaL
         ZM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647350; x=1788252150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lp+DUWM8yXhcm4IeP7nLZRH08qIolnoMgoT1U63h4E=;
        b=h0NnxOekWfHtoBdBImda5TyKLMEByZorczFU78pyAsL6K6S5AGFWC13KWKIGhQowD1
         loEpg+cMK0INKdKbYsKakExqrFbsfUhpc5BjEqiMuYnCN4w9figWNZjTTp3D9LJjEo8B
         SimRfIA1nu+b9vWUprYoaor7nLNgH7RoDGit4IW4lrZTpDDwM6zubdlkVAjgy+KeCqIj
         C0ERMg/kpOYJ2QXDnrw8G+bNo1X111sq+rmQPVlDiFrzspEKzumla+QGX3gydSWO2fiD
         IJsFKgsjc81UfVhn2ghatmJ96LOET36+Skyy5tR3DbHpG1yClVSwrEakis0u8WG26VQ+
         Wyfg==
X-Gm-Message-State: AFuF++l4ZJ6HJ31e0aWFOPinoG/IkDk2lPQ57BVHkc7Ap7dT6ocrSpfL
	HZEPe8Ov+cxTxagU6LAEXcJ1skZktO1eBpdEsAzg5bSfoOq1hHuqWV4Br1dS8eqi72/nZmKxNCH
	aWPY8puHSUb3wMHWbcbEnSU3oXTlV5faxnntEJhOaUJkn2FtsFaeghfTE8PYxsKopjlME
X-Gm-Gg: AR+sD10Q/i3e/N6jwgSUItp2xEs3gvEDDKQ+4A5jY8VOiqTrg9dY9q2FbSXG7d7aY/y
	OqRXpBxiyXXOtmwakQ3AuSFW7RLtpOAYojrYkELejHwf0+u42Axz/NjDJIsLNlNJ+4pgxNcM7nA
	CPkRNb6VnVXbBf1VAp2flX4fiLBc2/kXXzpXSe6rTYT0fYxL+TBHEKmfTzBJHmGReROEeZ/MdKw
	nHkG3WdsH28F21U4ob6icVw6rDu/F/S9qUaxPs4/E177TL+Ol34Vrhxvz2t0+AeQfo9ZcAk2sWy
	YSl4U4pOgVDUPQ74WeuTw9H3ejhOxluw8Ke8Rpap0TrIgv0ZPanc/0QI/7a6oj9H42j4ppkP8BV
	uKsaf8l+KWML6sBbh3Wp/4+yp
X-Received: by 2002:a05:620a:2806:b0:92e:6485:f640 with SMTP id af79cd13be357-937395ae7ecmr2164411185a.4.1787647350230;
        Tue, 25 Aug 2026 01:42:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2806:b0:92e:6485:f640 with SMTP id af79cd13be357-937395ae7ecmr2164408685a.4.1787647349855;
        Tue, 25 Aug 2026 01:42:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b683sm1807087766b.5.2026.08.25.01.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:42:28 -0700 (PDT)
Message-ID: <26e39629-04d3-4fdb-8768-c93252bcc004@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:42:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/3] power: supply: qcom_battmgr: add Xiaomi taoyao
 support
To: Stanislav Zaikin <zstaseg@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260821123711.1579539-1-zstaseg@gmail.com>
 <20260821123711.1579539-3-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821123711.1579539-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SLAwCNsZFuR6PlvlUo1-U7CG7hlLwWfK
X-Proofpoint-ORIG-GUID: SLAwCNsZFuR6PlvlUo1-U7CG7hlLwWfK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3MyBTYWx0ZWRfX3qJMUf8fvwV+
 oqxyLtDT+YH81N1d7/Bcw4o9XVA+U1hzUIFQjk6Xq1crmIX4/UCqTjXsuZ6FnksU5525E+bnh+2
 KlorAnATnEpDVJAevd1t4dY8o9hbfObWVo6NXUAHYHv4PYkar76BfubkD8UrpPgmtAdz1KQtIPm
 Lh0+k1H4Pmj85DZDzMqjIiNU+6AM97weahKSLNdJJrmhWNgW67bDVnpVRtgA9blBCkLuvpUOJfC
 MuU2sm1brLPu7FBwNL4uBy/L5W15S5HGSnsEirMOEkIYoBaS9IHNTlCj2zk7FB6CT5KvMg0t5kH
 rfyZwYJAQO5+YGme9MUGxZS9YNvN27Vl+wzoI0ZFUvw6rnL1ozz+7OOfxzvIzsqH6VhcmeLcvVv
 F9biSu9jcCecwizTgWEk19NdexYOpiwDfGaQM02N4FqBQ7NSltpK29NUIsIajNjNyVk40DvGAgH
 nFM04cvmN73Q4XYTh1Q==
X-Authority-Analysis: v=2.4 cv=JJULdcKb c=1 sm=1 tr=0 ts=6a8d5577 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-Zqg0uhZhYSPuZ5HblIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3MyBTYWx0ZWRfX9tAZWOINH9qx
 GCzRn3i3iTxXMb1XYfozzz78nqERQIzrxPSqsh/dxyLqtVyXYpI5nh/WGcKVrKKMYxbIsXJMnkd
 H7DOL7QQVkLPFegL+IbntebAQGLohO8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250073

On 8/21/26 2:37 PM, Stanislav Zaikin wrote:
> The Xiaomi taoyao firmware defines an additional BATT_CONSTANT_CURRENT
> property (ID 12) between BATT_CHG_CTRL_LIM_MAX and BATT_TEMP, shifting
> all higher battery property IDs by one.
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

With a certain amount of pain,

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
