Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722165;
	b=Nb88xBzrP38VWO1NskEnvpXLC273Gs2y1L0/nefTFFX1oFIn1SHAuNjMffE68T4j6yQT
	 azUGUO7MV2TqWfQr5HjAdJFuqKvVareIlQspRj2/hmaO7zkaG2VjhxXgLLjgEaJRzFepK
	 v2PkxkrbvJyr7piQkljVeDrmQ961w8YOyc6jAitYTBicYAG7Tz1sBsO4jO3nCrNv5552J
	 SsMMZiNTKTnQBtorQ1wXQWtjVVNc2T44GEPmvCi+nvlTy2HyhoYudTUAR+P/8J4NYTlOB
	 OD4spHRXsnQjKwNUefMjpq1VpJUVWD6XNaX7RaxzFiWDBXMNaesqsXcxKnJzcU37nrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7qH6C/bojM+5YQ/ZabGS6/zYTmCOp3ZJSa5Tlo03HjA=;
	b=xdQIjidcjcrZEbSkUa96Uf6ZuKIAtQvkBfHssM2+28n83RYO5GRs2QmNiKB8iZT3pg81
	 QT12uWYxc6WODkofHVXnnG/uugEINTglJ+FDtyKl+0D5IDJUKMAd8xLsJiQvLeL99GHUK
	 8O/+8sMJ8vA3IyCeHgwM12MhgX+vUlK9UVBvMP0AzmU3u/HKb+3LJO7aUbm3deRoKtuUX
	 hFZ0JRQ/VL/Mx9CrN6JhKvX5HfbYzM0wUKrTEJqlLrVxZBzJszyTa5e8MKGtYzOGVcnja
	 jIUJUXfX4U37CO3hnkpdqlR396cAPG2GqK/8GfaUiOctzfg3jwmGfgL0RYBGJnu+8vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="WEwZs/3/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8Xwb7hD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28388606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28388606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEwZs/3/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8Xwb7hD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGbxH6595613
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qH6C/bojM+5YQ/ZabGS6/zYTmCOp3ZJSa5Tlo03HjA=; b=WEwZs/3/2F0ukAJp
	BAiBZeoL9v1RSJMNfzDV8iNpGZTtj2RZT078x2gka/1I+HmeurEbdboDErwzdx8S
	snbGm+nMRL/ZL9lJXU4JaRMy8FlhL11TDW7lSWzUz2kyCTxT+MGSbfJCafVeneLX
	EohW1QyUc2br44NRGBVfj/wPOrJUMXuU68D52kkMbTo44Ur7+yF07c2xsGKBQEnm
	ejgROT6fmPA9wiaxbOaIQQ5mY0ZlTnxY93ox6+TEwgBqRr1cID8DWBi7dhJmH2iC
	F01eqcFhAjiD2bajPX30KoBNV/XeAlqHSl+l22e1/d1sxPKyShbDIaWFFGk9GkvE
	2xphpw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90gek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:42:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38531c1a566so2520646eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795722164; x=1796326964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7qH6C/bojM+5YQ/ZabGS6/zYTmCOp3ZJSa5Tlo03HjA=;
        b=Y8Xwb7hD/d4w3Mhqlb6r8INoEM8R3fyxolBSATOsZKnmsyY5YEug5Yb9g52eT4V0WJ
         D9Z989Nmn0kIGNdg091Is1N7AKMDhChbpKJnBVN++E2nqs7BYkWD1yjkLVaDAI1ji5lb
         GWxolKvZW8qP/5LAUk5QuOR26QUIpCla9pX4uP/GTFvo99igoyQ5ysSTKx4S049ARKBx
         lNmavnpaZoWrnOwetxcS/nu35oqbibNBnGiUsfY74jZKAra2Uu4vMJsSH8adjntPRbz5
         j+KacS7p0OEa8JYtez1rmUly/X5ewJgch7qVy/FXu+soP/RLX3DRfJDfKcRPECKKbVaF
         Gs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722164; x=1796326964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7qH6C/bojM+5YQ/ZabGS6/zYTmCOp3ZJSa5Tlo03HjA=;
        b=WaLEx4eN4Wnk+TczM8BpPETnM9c7psvuCI2T3DUHbrBI/bi+A+ZJIOo19U3otrwKyW
         pKLnPpizq8Z8GgNM3qKmRighoRm4ffy6z3UXpqmLbWkR0Ro/8u+VsyX2GW6QFgyxMGPR
         kppY83Rvor7j3RluyFAp/Hoih1EF6iXnsoJciGD6N9qw38LAZWGpiOEfNxEMi9AlYN6u
         EHKOyobwt6N99F+gYM6ay5ToEMZxnIHjyRpVsmeeUbMECf6gJPHLZQVom5u/ppH0YD1t
         tfbQ2WhDdQFtf+6YcJn512hOf0bJ20p+eba7ZPNuEd+6aULG+4L67ZVJ2MBYlHg22tQ5
         NysA==
X-Forwarded-Encrypted: i=1; AL+hErFogQS7T9iTDlTfFQgdLyIDwcmCd3ZEbZWA9150aRb73YtMSEgA6vCxuid9OIrAlcFAkQBXnQWWwCvDYOjw@vger.kernel.org
X-Gm-Message-State: APuU4Z/q/Eipl+z1mLgScaoUK6niKa+RsIqgx2J9H1dV+7vztmslKts1
	vezxrHDO6C1DmajkUHTO4khcQVQlPi1Su0T4J5r3qpciJFaRG2jXba4eM/zPRomUUaNKEu6P7BI
	U4LHQje2hnuvfGRI39H/ilbLZyRJBvEmYrX6crsKasez7AraLSRkucjwF7HYyEoMUWqIy
X-Gm-Gg: AZFdTZdaO3ZNkJm7//IO8a0lmVpwdXN6gPuhvLOrdzTDg+NgKdimz7aDrKnso2fsYTT
	8qaXN90OJKDCc45vIgjE+WwTq4xSkSh7RTOGeuHF09rBEGrwVFUPxKzfzV8ntvsSDa5EogtcXuD
	4uOTeWssJRxjgEIvhWkrJKmWqgls+mr0VjkdWljdRqczMNtzWoMgy9aO3BWSv5ClF4X9T8q2Wvc
	SOebXRavKJFQjdyM9VhpNgA/qGtj5rhjr3hp/SthutJvwgcyvsZ/O3zUstW/D5tT7TAPmTGKwM0
	xd7j5G6ZYiIx/XfJq8cAIAqw9Buiwk2nj1kpxjZ9Z5en5EtRtvNPLYlz1r2/tRhL7Ih8DMqTMoi
	M1Bwd2RMwBXY0vQHr0RY1hAzF1rMxvzwjlZILUfVBfdnI25jWd8MaJyxHe4VfrDb+IiG4mYs0Z8
	4uYDhC
X-Received: by 2002:a05:693c:880b:20b0:386:b025:1e1e with SMTP id 5a478bee46e88-386b02522d2mr13900453eec.16.1795722163564;
        Thu, 26 Nov 2026 11:42:43 -0800 (PST)
X-Received: by 2002:a05:693c:880b:20b0:386:b025:1e1e with SMTP id 5a478bee46e88-386b02522d2mr13900435eec.16.1795722163015;
        Thu, 26 Nov 2026 11:42:43 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm79449604eec.10.2026.11.26.11.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:42:42 -0800 (PST)
Message-ID: <eeb651bf-a627-4442-b9de-da73f70c0e97@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 01:12:38 +0530
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
Subject: Re: [PATCH] i2c: qcom-geni: Allow minor deviation in clock rate for
 clock map selection
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261126-i2c-rate-v1-1-6b8c5731077d@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261126-i2c-rate-v1-1-6b8c5731077d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 58l4TpmApL19KDQkqKQ_TvbDaRgfZ_OW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NyBTYWx0ZWRfX/h18WFfhpEXr
 +e15MUOTAbgl+Ee/q95gb+mO4l1RMCOhwq5RJl3Y6+Cd/IlG1Qy68oIdVSXTo6VgixVjJYZdqBH
 gXDdkySst3Z40V8uKLaseHfeCSAlhYoFA60JY1gSYr6BrK+eyjJUWAMJOaQ6Ozxelr7RqiP46Tm
 3qMcjg+/Xwcfcanjkuv/FHhehvxArfRVaH0Kf2LOJ166LYsHpR2p/YGhni0o26wM6CTVQWelOkk
 bkRtoU2asqumGw8UogozFQSGoqIu/JtPK3dqbCM9axDX7uQMn6WpzN3JP+hjSgr+mehhHTZ8ECE
 RW7XR+LSGr/rhmpL3Y1fTqjeTy4pTnGMtUFO4ULn63pRAhSrBZiCWglfHzVpdHQ1rHfSGbKSgnz
 8E+YHSPRBB9d0e1C31i9b+arBw1spIU46QRR7irKXfZ+O7+Ax6daw8EqgYtxdYdbBV30KnF7B4A
 YKqFrtkp25H5KLH6/BQ==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b088bb4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=5paVSw64R4kEUMRm3sSMUA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_1O-lDtd4d_n81_3sOMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NyBTYWx0ZWRfX3XEVIQ1V0C2I
 6GLGjWMv6rTNNjksof9o4P+hRlwxSM2MSJOjb9q8+GwLqIR/+5z6MguDj28+eIW72VBNWUpXkgr
 d1gOoq2R27wY23LAiZCqmATt4gCnjPo=
X-Proofpoint-GUID: 58l4TpmApL19KDQkqKQ_TvbDaRgfZ_OW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260077


On 11/26/2026 2:09 PM, Varadarajan Narayanan wrote:
> gi2c->se.clk rate is set to a value of 32MHz +/- delta by calc_rate().
> This results in the clock rate comparison against GENI_SE_CLK_32MHZ to
> fail, and the requested frequency is assumed as 19.2MHz.
> 
> To avoid this allow for a +/- delta in the rate comparison.

By How much ?

> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index ef48ab3e8b94..88b5b9aa4667 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -207,14 +207,19 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>   {
>   	const struct geni_i2c_clk_fld *itr;
>   	unsigned long req_freq, res_freq;
> +	unsigned long rate;
>   	int ret;
>   
>   	/*
>   	 * Use 32 MHz only if already selected, otherwise use 19.2 MHz.
>   	 * Preferring 32 MHz merely because DFS supports it breaks I2C
>   	 * transfers on X1E80100 CRD.
> +	 * The clock's rate may not exactly match 32 MHz. It is slightly off
> +	 * due to the calculation in mult_frac() in clk-rcg2.c:calc_rate().
>   	 */
> -	if (clk_get_rate(gi2c->se.clk) == GENI_SE_CLK_32MHZ) {
> +	rate = clk_get_rate(gi2c->se.clk);
> +
> +	if (abs_diff(rate, GENI_SE_CLK_32MHZ) <= HZ_PER_KHZ) {
It's like  +/- 1KHZ ? Can it deviate > 1Khz too ?
>   		req_freq = GENI_SE_CLK_32MHZ;
>   		itr = geni_i2c_clk_map_32mhz;
>   	} else {
> @@ -222,6 +227,8 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>   		itr = geni_i2c_clk_map_19p2mhz;
>   	}
>   
> +	dev_dbg(gi2c->se.dev, "rate: %lu req_freq: %lu\n", rate, req_freq);
> +
>   	ret = geni_se_clk_freq_match(&gi2c->se, req_freq, &gi2c->clk_idx,
>   				     &res_freq, true);
>   	if (ret)
> 
> ---
> base-commit: 47588e4c16d8876d3058bcec030ed8a016794b9e
> change-id: 20261126-i2c-rate-da11bbe02b6f
> 
> Best regards,

