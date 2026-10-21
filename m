Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578891;
	b=MFKro4+XT297tV85wgAAsYXJLwB7GhibD1sJANVAT9zGE8wtH4R7CYEv+jfhjpa4e75l
	 D06uqI07oM9guxUsKyTOT8Nc+ZvzevxE4c8pIPjOlpeZ6IaHYEdgjrJVCJfNfA3kWAkdm
	 3cF+LHEDZvzvNsIxnIX03DmAnE+T/EixIZAHNq9/V6JXBW3LTwWLsmX0YeSScyT1XQKTb
	 b0oyZFu6Y63AMGoBXj0gDihi0EKulgp9lVmkoA0iZnsFRj2apFfnvHLmIabgH8ZRXv0fs
	 AXoXc5IWDuwIVRztSmQKfcgA9Kga3Rtlo15vrIMC8SHfpn/DYUCvC+uMcRgt6PHWvjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GRV6xyghtvclnyTeVw1ch2ppma1cwDC0cp387OCS+mk=;
	b=FoRmWxiiEEUfN8/ImACQDNcv9wN37+8nIDGFL+XuQ2E9fsdsWuyG8m9Gm9XPlZJZD+GD
	 qMir/4ZRYnCM5hPQoNO+UYpIjOfx6KU/vm99ncHVNoSxsXXyxaBaxi8467IXwWkAS7jMH
	 8HHth9qgtzb6hdIucRRByicqyDlO1DWLGQQd1fDT1X57j+u5/iUtiTW7YyEjrYiviaZng
	 vE2BdnyeRhB1fyhP6KYeu+ZTs1scsMFv+KDODuQbGCV5EbqImDN56TB2Cv8TrDksor2tm
	 wNcFsN4aMWXdg1AGrz9EsO8vj3nc9MS6/mWUyB8UvveOLrYJTpeSGKBcMUrkRLTFQZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eX/FNpXU";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TS+kvIc1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777A3606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 777A3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eX/FNpXU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TS+kvIc1
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA63pE1358647
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRV6xyghtvclnyTeVw1ch2ppma1cwDC0cp387OCS+mk=; b=eX/FNpXUfuenY2Ci
	2H6fPOnzL1G/ukqW3h41RL3Ppdv4fb/9Y9WyXizK1AuN/zqBzTh14wDgkVXuI+lH
	C7az/ySApzI5KVb3AKzf1KrYgTD+diCfzchyFvE4QTTW31uprRaftSsaSW2UgmVb
	7CXftigCpNTHEpVR0eToUgCXUmobcqPXsFacTsCmcEU+hy1YfzPIDVzRD/r0Va90
	fbnNrfEKJAxvoAMQKD7r4M0rhBD8q87yUrkcrw0FhYh5ZiMf9UNrYiUVw/YCtKUT
	oeI8Ky9E9SiURn3/f9E5rEiENz7J7IAGRjYKCSwdazYdSMPlbDORQjAEYF53dbC2
	84mRZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ufdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:34:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso18052885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578890; x=1793183690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRV6xyghtvclnyTeVw1ch2ppma1cwDC0cp387OCS+mk=;
        b=TS+kvIc1YxETwAdzrHZZl8hdfVSnxLkFDqGajuvIAe4j6/xMbPyPJI5QkPenpAyjI6
         l9CcPmJtfglG683Lu8jZg84Pc/W25dKJT2E2Jv+ct3cwaIYqCVnU1zVIQHOBWqlPKEgr
         fTaBbo3oF9HvSsWaqH2Wofzei93riVGYLo1CzNsdJFbT0+5APc3jQe8h0hpBcEKTwWEp
         Q5jL5HKhk3zq6kxEObmwqCMaDg4SrMV5VeEFgq8QtaLV7EPg1ZCot8novBZ+ZNNMyxta
         W5HKqjKdsrfTw01/zDvjibNEv/dzYR+n2azzkJQDI7VWlCXsmpc2R+vqcaRoj5sJ49SD
         dhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578890; x=1793183690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRV6xyghtvclnyTeVw1ch2ppma1cwDC0cp387OCS+mk=;
        b=rb0cGkNaytgpwYEuUu6x5c9omgyyRL6wq/ny7QMOSlC//6eyVZa3NG4n2HIeJlR+BM
         fpYJuY+QPz+H+txyV+nDZuEz9Lq5M/YLP1yD0tn6/o0P/Ek1fCk/g1dCoBPrWVolNMNA
         lXD0b2+151ypxIrrCfXrYiBHrEFe0EWu0rRFOpI9950pa29ZO20O5bywR6q1D5plMqwe
         0lrATUyr0dywywVnoK6SPM/jyZp8FaYd+fHDn1YB5puQhdfzWappLvh6CSFeF/8dhh0M
         uOqfU6xfAV0OGAK7/jS7E/BhZDTE98fiynhzkimRr3lVnGRQfCZ8++OE8ItdpiFvYo+5
         5IUQ==
X-Gm-Message-State: AFq9FYIZ64GJU4ZhBWQKLr4Grz0cWWjKKfSFcJwbU46Ic53vC7AiRzhJ
	9tFjm1k6w/wy4Sjrs63aEqmJgORph09bldFgBqQZyA/6+B6rQYqODGB+Js23PiOyh+eWgq5nZYu
	m86l42HMvu8JmyRBlQJL3l+zaXnN1e1f2w2Nkvz3iPvt/2gyeKl+IxQ1KrWsqM1f0qyDV
X-Gm-Gg: AYBFou1Dqz0d/4G8MwyaI2vByYbGw1gWQsvDHVpXcx4SIf/BPL425BHUttEamVr1JJd
	iLcJSdbpannt5lEZtmJwMTa6rrKVv8toTWy/qvlakx+PxUZTs+Xe1UbMoeHrw0mohvhOH6PfXux
	t2Dpw39G01A+0YbuJ4Mp3SvPVsJkej8mE5u1ZFdy4yvNtAJ1H+MK25P02l3E7ZshwBkwQsd/CdX
	DyswCxFpm47o93hHGHGK4UbSGeEsbr9VDXxDURw/r7qNDZbL1OCo3l0IqrvatKCGfoGwahaCb6s
	AQDXMiXUFQGigKeK6YXiO8LEGM1yi/KFYm1MvY1fN3u5L7CKkF3EhSXHQ/ngjRxBtOIs/fImAoD
	3BbWIabKmvSwqbMlGfFKCtg==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr378214585a.3.1792578889891;
        Wed, 21 Oct 2026 03:34:49 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr378209685a.3.1792578889412;
        Wed, 21 Oct 2026 03:34:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fa80d7sm62589866b.32.2026.10.21.03.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:34:48 -0700 (PDT)
Message-ID: <be89838e-0eaf-4b6e-b77e-7cb89a2351f9@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:34:46 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: sm7325: Remove duplicate motorola-dubai
 dts
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261018211638.1137923-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018211638.1137923-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l_YuHQVwOUinaKzvQGc4WC-GUVksRsRT
X-Proofpoint-GUID: l_YuHQVwOUinaKzvQGc4WC-GUVksRsRT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX9FhY0LnUAjko
 odDDZqinpyExX5SdSwBtBtsdKJYsUhP602YX03SyqkcTtKODexzYJQmNYWIfy+ZZUvKIFdd9uEF
 toHcq528t7/R+Tdfe4vpaf6tpupIDko=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8954a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jfzu7Z7b5MERT2nfZJwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX8DWdKw9QSJGM
 u6wdzZB12GnMqIG0D3/pfrLF4dM4EuMad+NxBikdWF4jNuoylwilVIZ0VtJQ0PIlgC7UcvWjj6l
 OfJCu9Z7c3s/quE2ykDbMTAWbFTjjFg14Yrj9XUFJINZNsUpjp3xMqibOoC8g1UHTXZuo2VXQRb
 91GvIKm6a2P82HGGb6GSGmkMcJLN5Zovrl8g97NA7vk+yi5A0WqxN0LvmFwdPxCKvFFTg7afeTW
 aFo6n1RouCmNLRVkOh/gihPoQYjMa7GoUEJfc7bNArHBd044KlLgkfg/uYV6K6ucxorDeGE36lj
 DkAIPIi4Siqn4qzCofJr7C/9foYR2VzoKXxFTy2r17xGrAo0LqGTUnwLa3GUXVmztZePNZAwbZ0
 GYvE/SUg6hBKThyYA7wDM1Qc+TSb2tmoYXtVgf+L/zzXuKgbO70BxRdkM9g219ezKYtn62pQL88
 qzdDrmBIjB1TRJtTxmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210042

On 10/18/26 11:16 PM, Val Packett wrote:
> Both v2 and v3 of the patch series landed, so the non-split dts is
> present alongside the common dtsi + split per display panel dts.
> Remove the redundant non-split dts.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
