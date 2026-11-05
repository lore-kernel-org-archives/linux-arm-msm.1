Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866077;
	b=RY/cJ+YHujBDvSj/sDqfBStMkHC+kDDys8etbEVQtDJEwpnTqnc2JTW8M8xUIGTkxgTO
	 nNrZJe+eGMlL267PYGrOkk4NEJQ2F9X6odxhOMh5yogGPTVC3KjN1FeUhL4NlrHSe89Zk
	 B8Yl1EjIcyeWzVFtsTBzCaNIyvmqRmm6eZ9uDnwpzAR9Xqpa3hpWMfwo6a0AaWCvsVSvB
	 ANOR8nCY99LttFwWN0uh///GGzBmaCsSYSmGg+i2JvVCw7Y0VjSZlw8/ifsldgZ4uz84e
	 aY1gbJ3nnuEM76SmkqTAINIPBXXn3bgwDOT04oKoSDKiyCi3GQY3ex2zA+3PKzkbWNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K5CgyL6wkC55flU3cPg0zwdEWrmj5DP7BYobqVRqAyo=;
	b=uzoE7xYLa2s6q1verypnx7Nga9Xb2W2HvCS8KsWbEkE+650vwHSTuyx8LCUUWBVP8csk
	 C/2Tf8ULeraG24BcgB4gtKMDpCFUzCkPm00yMcxSfRZfvof/yySEKMcjY5poad/XUaxt8
	 SuQoAV1oI7TkX6sJvMAoFVQ99O5HrcPozzelXafMjQg6xqB5FXTZhp1tbQ1zSDJyEzs3A
	 CztQbgpebSPv10sUbklQZX6aRHdhI34WjZrCm7s5+fxFuD81e32x4Wg/Ib1DYYTYZwjlY
	 Z2vYeGCav67uEs4svw0cIn0Zv/pbQANTVOiVAJNwCH6wdxZb7509mq63RiEQ11B0IvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OzQDKC7C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzZcaNCV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35E9606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OzQDKC7C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzZcaNCV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56TtqO3073284
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5CgyL6wkC55flU3cPg0zwdEWrmj5DP7BYobqVRqAyo=; b=OzQDKC7CxAHiLMut
	iSdFiHG8IFC3eQGM0ZWd75RncmWLuW+xyVeW1uJBPYMdmyvXPqC6gX5TYF9Q4GNC
	0mSWiVWqV6IF2Yl7XkVhhpuE179UZCBKgXkpVT14+fzxC8bRDh6DML76K++sai3m
	JKNawe4sK8cWyGGB/0v1mYLD51kfDi8nIkRnlwJdlPXJtsYeTVO2koc3RZe6l+pl
	uJ0nOxWDhUpozvuN/DwVGR30B/QMVtgBntMQ+X/LBVMLT9v1bG0M+jDWnXLGRQgX
	JFZx7LIhsnrX9TTn1f7usIieUsy2I8XYc7WIcJqeLWAGKbX4NRuOzJ07VI2zJOz+
	9vjNfA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq8jm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:07:55 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecbb3b4696so9371e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866075; x=1794470875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5CgyL6wkC55flU3cPg0zwdEWrmj5DP7BYobqVRqAyo=;
        b=PzZcaNCVUN6WoqFdqwAvSQwqwEQvdgBKxjRfpxHtvea6whNOaMU99v4AfsGcpx6nGC
         1G2yd5Ac721TqyJ9+kFuntIJ30bIbRfWLfpAxaPgZrL/B2rs3YAe86kyndw0x9Ho17X5
         JpWptze+Tjivz73XCs1GFtpfkm9QJ88fBa8e1zeM8DlDH+ppreG3PZGiAEX+hmAIGJl7
         o4gTxyecLDLyDg/ULxEcluGZddLdnapcB2AZOpUilavH2sSC8Qvag27Di7qFF/kd6liv
         9UQAsG3GOdVV5TY/xD20V3Na71DAPFyQmM2gi2sIS+b3FQLDjpO21VdleLMXOgQRmx2w
         HXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866075; x=1794470875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5CgyL6wkC55flU3cPg0zwdEWrmj5DP7BYobqVRqAyo=;
        b=XOZbW0s55pnyv1700pIK05aKpizMoTSo9HKZJkmNxUzstGw4hXst52H+n9Bftvc/Rd
         LBDBA44xqX88V+5KNdlpRN40sMptv/zw7nG6lxrT3c9U4OAUCltFaoxFelrli8fPhBXp
         yM+xGS9Sgweg+DWnftnEIUFP/rWtoCfPQ9K45Eb8i084xJwqvCfhxRmUJHqfj4m53dFP
         QA16GP8vD30/0vwuE2TeCL2yDMceD5k6pEWrY6ofFatJc61i3Nzy+1KjDDjxELqYNxGA
         3vnt6GtvrfEaJB1R48oRlZDPqtLSWvn1nrjf5wllJyp2GI8H+GnNlheff5vWiLxFj54P
         y3yg==
X-Forwarded-Encrypted: i=1; AKwUvBy40xvNxJXwcFkB8fR8LqvPn7YJjvTUNtRc26fljl3fIIADs9jkSht9fyHjLJc+IuatX2hcQkOh6C/tnO30@vger.kernel.org
X-Gm-Message-State: APuU4Z/7g+U7noNZXCbH3hmjkRr63qx1ozJ4cIweil6apKaAdN/Yqdnz
	UzdS1zstz7cMb8BgxsAMA6gKL8Rk//ZNacARouBxTZdiXUE7P6mSDbLxjDY3U4UcJas4ArSPgVW
	SKCiLuchveN36z7S21viO1jIB9UmRbZTYdhDoydku23vgudEYANFmF6DxK3GF5w0CSQgP
X-Gm-Gg: AYBFou0qxrPJRP4vEIZjKCr9TFzPgoEZMw1sJIO88SO9Nd6lpgk0OCAOega3X1i7xmD
	9S56eRj1WEeBSnWj4ucErh+7Z9tzcL8CkPHCItbgmMCr2VnGblm5gwhxEVE+J8+fG8s/uJzxRwC
	OrfH1IJMqTkQaBV/JYmQO6C9VpcGLlNTDqz5aPJs+WVDI5vDCjdV/lUcsWDMzo4YlKXS0UvuQYh
	aH8TmpKloA2247P8ePoYRlDUsOpwzwx28RlXfYWWltIYItuMiMt09zb0bcnlgqB8iFSKx1ez5pp
	/efhW6S7MWEex3100iU9L14XUro3+PAG/DBkLgu2PcDJWWu4Hz21DN2zzeBnPSLx60lJSqEarb8
	UQib7UnvCLQ8Yq10e9gDgtEkIWImRJn0eyXsyt/dfiulyOuUtmIwzG/IAT3zCYlPepeZj
X-Received: by 2002:ac5:cd24:0:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ecabdcbd50mr2502447e0c.2.1793866074938;
        Thu, 05 Nov 2026 00:07:54 -0800 (PST)
X-Received: by 2002:ac5:cd24:0:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ecabdcbd50mr2502424e0c.2.1793866074496;
        Thu, 05 Nov 2026 00:07:54 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e1402c6sm151963566b.2.2026.11.05.00.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:07:53 -0800 (PST)
Message-ID: <31d38c50-665c-4f1d-b191-55ce5d38660d@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:07:50 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8994-octagon: Fix side touch
 interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce
 <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX7PTGrlPBbn73
 wYpT9NfxfLrkr0jlsim+XUW4PCP1CLQZUuVVEz2piS2vRL65yGdBNjSxIYm6gMeW0mZTbxwmQPA
 /d9oXrFflgzrgxEROXsGzXIhckI0nnQFC6mSsq4A+8tCdnoYJ6jYVguZ0vbc9J7sHLBwB3sscNK
 rJN0zfvZ+Dg8/lXjuiONWOspJsT8gbqB4HgEDYqj6OAc/mgn22kwUS+cDfb3KoP8omgnigAztDt
 IGgv/HQLGQyL+fkgw4C10/vW26gvyNq8u8ZW8ax8Z1yNTvkxhYQ5Pyv+/tDvGNhu7z+Jj/rhYpH
 qHwSMXTrbQag483yC4JBzzKAjBUR6LbzJEDEn/5jTd18fnaV5/9T7Emvq+ERl2/yr/U+bT5KBfC
 4iIcoHjZhLWgY+p0U8KGXLXwvXeJ2CaEUuXMg7YVYLjSY+nbP3pc8IhlyZhAoW7/Sb25DiIqSs0
 2/r0XMnuQgOxnrZd1bQ==
X-Proofpoint-ORIG-GUID: YQbmoGrr1wVhdJpj_U076oubBqcdgv8l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX/OhOnTu6NzA6
 aipG/Ajndt/cUNNzro1cKK13Z4AlTaJIeTOT87LgUGV1cEVeg0tTwHE5Xm+jOZ+lMdS0uzfqF6e
 TT4dHwufRtpcE2aWzFx21mw1YHOF8LA=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec395b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S5PwCt2dg2jEj5C25JAA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: YQbmoGrr1wVhdJpj_U076oubBqcdgv8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050032

On 11/4/26 8:17 PM, Krzysztof Kozlowski wrote:
> Interrupts property takes a number, not a phandle.  Passing the TLMM
> phandle made most likely the interrupt as broken, which could affect
> touch operation.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-759fcb27-d081-4ec4-9683-6667b54fa3dc
> Fixes: c636eeb751f6 ("arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

fwiw

https://lore.kernel.org/linux-arm-msm/20260911-topic-lumia_drop_captouch-v1-1-6f92f1f3c6d3@oss.qualcomm.com/

Konrad
