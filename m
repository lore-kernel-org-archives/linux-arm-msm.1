Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461334;
	b=DvZ/fiFkqEJyuLJ1jLwwhyYQyCuJErqteZ1JdIcDpyfcWzPZ4vHBBJBKy8YnUJeVz3ik
	 qzuz59aPPa2XQN7P5O36zgHTw5lllqIme9Qjl+5dtSZdwoPRYplxGGFkH+k6GWC5l2wUW
	 pxes9pIf//eZw6O7tBQRD0ZrftnvcPbDgGblqhyP+nTGURcCUpxKO8f42s0SzaWbIc5eU
	 Fl4LdVwJIAg9c2P6KONSyIP78ncjlElp24Zq21WpF2oxz3ytd/KyC6FShU2r7dinHN3Dw
	 n9bsOZlby3gt12wGCjFq9y/8Y5ojJeVjM7ej8An8oz19tEz79Zph7fZfosXDEJOYqRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aFV3TPaYtQ5flXiMSYRlyBEMDBAUTU6tbyACU0qLOVk=;
	b=Au2qu6SmZEfy0RIiiOckXQX9zXjtg7Kbwu3wZzY/nB3xgx4AKt056NMwmt7pTfqa80t4
	 6C/CVx8/btNoEGdLo/z1rTcrdlXUhva7M+J3Y5B553elYpSu/QUY/61dUy0csJguq8mLU
	 cvH383HzMr+EHTcvgRUcIHI/5TFIjhAmryFNulKJgvzxqjSwCvo8JHOWslIuc2b5HH9rA
	 bmbYB13qBhXpRxsHa5HrTPaP20fx+HT9i321CtOl+Ho9FYv+chgAD42t6nIgW2jV55OBq
	 Ye8dVk3S4hAQK2A7hE6rpe5SSxPKZCG8CN4tT7jfEmAOCHowj/GJ96ySwVgEYrpBxEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZmKGfkc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IVCHG3jo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FA7606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FA7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZmKGfkc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IVCHG3jo
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0282590455
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFV3TPaYtQ5flXiMSYRlyBEMDBAUTU6tbyACU0qLOVk=; b=jZmKGfkcQHp/K7Co
	1SBTyA2or4VZDoYvwyxP/e1gwPL/aAD+pva6G3TGl59sCV4ALs0QuaZ3zQ4U7yt1
	0TWtfTWVRDKV9oe9WsiJqWKIpTiutiELbnAsnzx0pickcQs42ZU1718wrQnS5NoY
	ubPRVou3pQU+0AOcGQpnTb7HPfQur/dcnXpzLwkoAO9VnoY0Nf7J1xm+EinKNAMa
	mG0NUXgIN8MaiHAJgCBK+HKPgGcn2UjEr1GX+yzSgLGyxWdtpZ770AVgqcusx5f4
	eInPboOgp2Jan5w41YcYmPfcJZdE42HsklZ78lLJaMUtWd/dZX11msvDweBeS6+2
	m5g7hQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk1870-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 15:42:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36637676140so2386230eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793461333; x=1794066133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFV3TPaYtQ5flXiMSYRlyBEMDBAUTU6tbyACU0qLOVk=;
        b=IVCHG3jopRQppD5o2GU0P34uDiwhFj/mBJ+dihCW5J43JRhHThLFhZfWUlI+6xQTTG
         4YXtLtctz5g2s7eRwGxWnEIzAc1TT/k9mIc1LexuISgPbd64AT13DvvLxN9kBq+yIhs2
         bG0gcKv8OYc9Q23JDzaGyBymNqJpUBKop00vbhN97FpJz6XPc9C1cPcBm8uHkPvQ/xIF
         pOtrVG8hxqy9Oe6aSiKoXBd0B2CCaEChQImrpUuJ91Kc6CFntk9w+qp8/xsjOzL9SdmN
         /1Q3FywA2bwtAAHKul/SzOSXAOBzf7oakQQ0x85Fv5bIKIc+wiUtJAzEquRkz+w31MoL
         xVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793461333; x=1794066133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFV3TPaYtQ5flXiMSYRlyBEMDBAUTU6tbyACU0qLOVk=;
        b=rWrIVOqNTmEodJzrhvnSVl1GxFhWxIEX6RHUnA39dxr1v6E3hzMcq5klLXBfjDsFAO
         +1cNbJnmHlXxXZgGcmJG0P5qAyXohQE8P+nQnxU0wP2aSRkDgAhhzqf80RS5FqjKtwEZ
         i/W95ZLqwV7zfa+nep0BJV+PwCwyTGSYXSIYpm7KD2OKoEEsBO0HV6s406rGrEig5pby
         tEWzDYgUmyj+sPmTpFbUMNmYIzZRg+FMUVdyQHvrYw0ohTg9REV0htDBcUxjSkQLLq0i
         C9soHOAes+2Yt6YOUKx2W5Xbu7hzDzA4etaZDtBNUEbfACWc43fpAmHEm541O6ArCEWP
         RzoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMgQMYHsEKLZhqYZBugb8ksuG8A+pWa4zfBpBLgkYkgWl6CTNeoSu2IjkzP83Lo26uTihcqblr2Kkb+B3n@vger.kernel.org
X-Gm-Message-State: AFq9FYLmU7Bi4iw/q3RXlPJviIqu9STe2L1JJy7k34n+sGsIt1gxyr9n
	w83cI4X2JD7F4eWVNW9wMpSFdnYPv5XEiMVXFC1l3jMk/hk67dvMZEW4ERlg4R2jBAlpv6b7gMK
	061tlFeG5M2JQuToggbQvPGUgOqip1luQjCqf4T8C8qUvs+csXHa+TQKd7OFAMXySfO01
X-Gm-Gg: AYBFou2t6pbCxNy68bxU6G7xuyq3hMjvn9sRpe3jalHFFPEL7B8JarL+nSBhbaMKmgJ
	oyx4ATRGBbaAnT9XRXvP8w4uocMywpmyBKsra//R/Rmsgodq3Au1zuwkxcxTnD7Kpu1OPlrP5zl
	KkoD68eeSHjjZrx++VdFAV47RYyX42TylK8caYcqgkzZErNLbUgIi5cHijeMOarJ/BnVkqx/9P0
	Ez1MiYSGrJZ2GeEsA3qeUkIJoGqajWI3BdVLSY6+Fzn92M65gPOqwX7e+8NXZd0JSv5YR3vtdTe
	oQNZdcjSV4yvEoZGDFP8pLK+EKXF3JhOUTjjl3yK8cY7ii2wmT2dFwrufH3FwBsh5PeeLC8OZVl
	dJpnUERUJ8p6ZxiCpOc613tMSTD6xsCV5YCJwoQRLKkdy4bYq3Pg+pxplD5oBwcIv34kNHb7zwf
	I=
X-Received: by 2002:a05:7301:1a01:b0:369:f85c:787c with SMTP id 5a478bee46e88-36a4236a1d9mr8367557eec.10.1793461332266;
        Sat, 31 Oct 2026 08:42:12 -0700 (PDT)
X-Received: by 2002:a05:7301:1a01:b0:369:f85c:787c with SMTP id 5a478bee46e88-36a4236a1d9mr8367488eec.10.1793461331549;
        Sat, 31 Oct 2026 08:42:11 -0700 (PDT)
Received: from [192.168.1.6] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm18944606eec.9.2026.10.31.08.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 08:42:11 -0700 (PDT)
Message-ID: <f033b603-d397-4397-a2de-a3014c997278@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 21:12:02 +0530
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
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vz@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-4-vz@kernel.org>
 <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
 <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org>
 <d35b7934-54e7-425b-a223-570512be0374@oss.qualcomm.com>
 <CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fkjZKPW0J0GbvfwBgIq8ROMWPFqCUlCK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MiBTYWx0ZWRfX0nbEKGt6swCo
 7YQCYz30+Po/5CHx+afsAj4+WTYYLXsiWphFznyJHPpqgEt3h8HYMB8FKzlnGaivMCYX6PR/aE+
 jWhvK68Pm6K3qJTKUE1ulC8LRxX5cQlJKdWp8zmrQbFUYQq9k7yVXGFIpUhnR6UaLdJ5SvvJR0x
 RUim6Xut6osASJniD0T6zfwis9vWw76REIyD2KdkuBq3EGqrOYwejHbnPjl7IkRWjTJ1UdznPxE
 CMHb7k67UteCdMBIKw48O3WJyOazrRzoyxUIHviHzPCqvAnZEdZuTr6h4xXgdi+ltjUfz7T/qQ1
 RnOF9lL/gT51uHV8GNXjH5qLr2dBHiskcLCXD3PjbMc99quCGLZVQkRvjc5YbiC4x0CpGkusm6G
 VTZSXEDNUC2/69B8dy9kRoctL5Qbj/Np1PRXblZGs9vH4xqDRCNT0/AZvjcManNirjbnRb8gQok
 npBrUIfsYJO2gp0vjvA==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae60c55 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=fhbCC2ozS9dPJYT3FEkA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MiBTYWx0ZWRfX9WDfkKaUQ5Pl
 Foi8A3BA2btmqj/BcPUzGGMNsWZQPq0FGg+qXvKFzzPVQDjudOGOzg+cEide4j1AsVURVLrgVDT
 uNOiJT06oIyGC8sLW8G5TDbAJ5BaCaA=
X-Proofpoint-ORIG-GUID: fkjZKPW0J0GbvfwBgIq8ROMWPFqCUlCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310062



On 31-10-2026 20:44, Loic Poulain wrote:
>> Bryan, Loic, do you think we need that change now, or should Glymur keep
>> the current approach for this DTS series?
> I see in the following in your Glymur series:
> port@3 {
>    reg = <3>;
>    camss_csiphy4_inep: endpoint {
>    remote-endpoint = <&csiphy4_out_ep>;
> };
> 
> Which CAMSS pipeline interface index/instance is CSIPHY4 connected to?
> If it is connected to interface 4 on CAMSS side, then we should use
> port@4.

CSIPHY4 is connected to CAMSS interface/index 4, so the DT should describe
it as port@4 for a direct one-to-one hardware mapping. 

I will raise a patch to update that.
-- 
Regards,
Nihal Kumar Gupta

