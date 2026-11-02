Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620710;
	b=SjPvFBXyLTO/udDSdIDaAWdnk4H0t8RKvdq9OKd0iO01F/UeaygAFygbaW1EggNtp49U
	 4E9w6XsSMYBFnsypiO7txktX9sztP185t6Y0gFEjHAAI0MBeceDDCCW1GlJU2OO7JqWHm
	 k1pAr0Junj3kodNyJ80iKaoKSoriL9d3vDA8RwfGy9WW8UO0c2VxwBwWXtOOyQg0VXiG+
	 il+ejnY4ux8rCM2k3qQvvlwINBpO+E0yTyF7fp2XU7rt8f4SKExy8h/8q/IEc/hb95m78
	 VKfG4bpFRTETYNNFY3E1ILKNQoabmXBq4cETJJ/KHQ5ziBu89m3bM/S0CtVqTtSrNCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HYqwDlxIzrVgKHvVxNjVgcktbuyT/DDsBjlgMBa52zI=;
	b=VKN+ocjGrgKI54wKsTCuyLwhsTQrWdlpKXgljKU/o063yhk4i4URa6FYBaJYbKmre61F
	 YceHQ4iZp74ghApLNySi0KqCR4IbqTVYVIwt3pxdfeP0d6XpUo5QV14/9DcV1fs/rBvrK
	 dcpgR723Gp/giYqef4LcGC8qYuPg+RFOUFpJC25ghnJ8OSFPiwv6YtAWub/KsX4mRjl/J
	 0fsPIn21MveGcx4bcYG7FmE2h8ZmGuQ53c2X751CZJjWTGIDiERkcU6J3nRIDJgav6nYK
	 l8sa2OxHejzuNpc8auGCo4+t9IqgouLGk2pAhCMSWuwudWqgkOPXHV7J1P2aKfEF4Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C0M4XKP3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MJRGPqST;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BFD606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42BFD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C0M4XKP3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MJRGPqST
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AJKc260836
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYqwDlxIzrVgKHvVxNjVgcktbuyT/DDsBjlgMBa52zI=; b=C0M4XKP3WMXlU/3W
	I6Pj1JJOyuu6q8lbDD5FGGJsuqIZAn9QacRYoyujRdBogKQr5PyQq1El44cJhoKR
	ucaxCi8rYv+YXWlHpDzqUmcBpTTZhHgZlgmysX2Y0d8DK1JJiqws1V2GXBnqXibM
	4lAyjxIRZWsCyvf18riHvXJAe/HJe4lKMRDttvtnsZS8j+SYQQXwvs0YF3lWOKH4
	sR26Z47ZrAzBHAJ722VqhS9652ZXxw0SQn/Av1JpYKZaZSkgV+NV0XSEXzii8rC6
	rbeTDTHTJrrwpysUyn2jptg+rNkw3eNqGffeQ22D85iMbErKtFr6IPHaOlthnRQO
	rzgWCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrmec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:58:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f1f2ecfso49151785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620708; x=1794225508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYqwDlxIzrVgKHvVxNjVgcktbuyT/DDsBjlgMBa52zI=;
        b=MJRGPqSToaooX5qXz56yx+/XhNzWc90LAy11B/ZIpkwzI4ea8sKpoPE0G0Dgu/EAAM
         QCMwjv5i7pm0RsKn+Mwvu37NsYJIiTpAmCOwq29I9YNNe3HciKcqivn02ECp1LrZR+1b
         nnM50ANpy1ke6JtREYtMEpQcv0cpAh24QCE1VqjKfsGGQnexWdgtaoynQUxS0Ilki76R
         vdn/lDu6w5TM6QoNF/vSI7CiQMu3w3h9np0KzJNlQ9qzOsO4XCmwxaCeYB9kIOvKBDaN
         9QI5EVHRrvXQ2dSw3IQUg+JIkPhYV/Y7lLeKSBdzZmf4tIaYdcYrrJNtVejZO/f1Mfho
         XCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620708; x=1794225508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYqwDlxIzrVgKHvVxNjVgcktbuyT/DDsBjlgMBa52zI=;
        b=EX5R3phXHjhqhNQMSewpsOBambwYjyvt4B2n3gE1cV9z1/Mi5/m6zOLVDypE5srzF6
         wjoJLYZ75fWRqNUJ1dql0ctWhWKZTtkvB1JopEzK6chjUkV3eGvw2tS+wlXtY3hkdzKo
         Yh0C3nSyy0RvTjnWMgdq7EtW+klI4bXM7HAmk6ql5k/Tve+xSnf8HY+cHPm3MZGeYnaw
         ztPCdqPs9n218nXqv+XhJt7189LyO/IK631GZbkrfAcxR0uZbzb/A9QDwVNEjPx55V/z
         OuGbI5v1InAlhXjcwDnwz38CgGe/9eKTSJSJGgwrgczO9CFTH6dwE63OJ5Oj8calQFnO
         gAnA==
X-Forwarded-Encrypted: i=1; AKwUvBwIU4qysQdv8vrQy0qc99ynoeDTDWwn4wOsfHYYDE/iOjEgLyAZO7Mq+7ZFLZeuetx8jnQdW4BjkK3hq75a@vger.kernel.org
X-Gm-Message-State: AFq9FYLrZKHNmgucysClo/5avQh+KBDSVpChafmfm7jaa4KDZ1yY+Gcw
	Mx9s+Xng1y9ulc/JAscBRjm1s9njovAknHdiMiZ1IXRBGrvyy/UiItUaFFy9p/2wo5bWtblQaSo
	fXYJWWiECzMrNizN7o8kilV/EMFStsMOlSL+DPSghqg5VqO+lUogYMvhgczsrbcxTRu9h
X-Gm-Gg: AYBFou307fAFpX1IU7cAEG4ji51kIeW93JW0jHu1RxipzP0dM1FRWgOTrmzT2VAfash
	7J1bFOpLOHEFFdo5I93F3DUTldu9l1RuL0z54AQXiZvhjEfARpyNzRUQx6oNRqumWF6PCdCTeFq
	/Qo3VfhajqMZ04HtnLGwebt9huHZCQlEdI4MVsvUt000qsA5E5YLQSkh41Ag3ZON4GC+68V65ik
	hW2y99PFkhZxQs0h3aG26HHXbZlE2KM4hWz4ZON7KitONsCyp5KQnhbtmSoBFR5fbgzvT5ENs0J
	Us+eYtkTiOIat+wx+2P5T2OTPTuws/TlV5N5N9bQnszuReVKiqU5OancsbHF1l4DQYGh5xgHm+L
	moGtAQcELCd2RiY3KNi3TEGVmUW7obW5qexmESf/RNuc2F8zwx9DyN7b/Tj18w5k0LVQSHfk=
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1514682885a.5.1793620708494;
        Mon, 02 Nov 2026 03:58:28 -0800 (PST)
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1514678885a.5.1793620708014;
        Mon, 02 Nov 2026 03:58:28 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca211ddsm3086049a12.34.2026.11.02.03.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:58:27 -0800 (PST)
Message-ID: <4f1ec92b-0ef1-4139-856d-e9077cd7d4bb@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:58:24 +0100
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
Subject: Re: [PATCH v3 03/12] arm64: dts: qcom: sm6350-lena: Add
 qcom,rmtfs-mem node
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-3-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-3-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae87ae5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6H0WHjuAAAAA:8 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=RC7kgf61jvLRIQ5xqpwA:9
 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Soq9LBFxuPC4vsCAQt-j:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-GUID: cGrDRk2ZFQCc73qvkWeeEohPmP8Du29R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX8SYBnxG1SAzX
 a3T50lR40VXaRmEjq63wl5Z1iWqsTtuJ3bP42TSsJ9r94+dw+Ndei9bEoP8IX4mmvxhBz/ILNk8
 A6x8g5/3lnNUZ7QfNiLfSirVjLQ12HU=
X-Proofpoint-ORIG-GUID: cGrDRk2ZFQCc73qvkWeeEohPmP8Du29R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX36BupsvC1Sno
 brKlXAUW+6I735FfrdKx8pN2ibJ7X90RecHrB+HOHwnpAB8QcJP2n6j7iAnf58MN6fWA8VVxzE2
 8taj25ofg0SGIesY/RlK7LLNybjz8LqCYMy0qnZIIfpjcpXrgJSl9k1EomXirIcF8l1VBfYVFln
 BaXx/lMay76Iu/byPq9IlZq6Y7yUmsuE22xmdH7X6YffekZMzJtTqzFcnJbm9NmrebwaNacLk8o
 eLtJOyF9FfGqhl91dSOu9Ynz1GkItFfiIAJ7uoVr5p3s0TnhTFuA4laLipTGTFYvduGXUpCv/se
 l2yz9tdHhm98DJ+DGhOK3+XKzDfyJJkppKY6E72j38tgWLfRF/V875RJ0ty3kC8uDww1mdddxOp
 uWVFZkSaImzTCRD+yB/4TedF5jkb2m9Azx0ccSu0jvgmv/SXlLuum10PM8l+ubIfe75nQCUfxDE
 8ivXISita+AAQHh6p0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> Adds the qcom,rmtfs-mem node required for the modem
> 
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
