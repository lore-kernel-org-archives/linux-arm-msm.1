Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481033FFF9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144184; cv=none; b=ayIODXM2N0zbywXmdVJR4oy14IKPLLAxfHqmmHOjvBZQoQ6et4TY2UQH3Na6MQN7w9bLvXggNj8VjEkZq+jl/Lspwql33MrsGbv66tDtRrkMYI1QNa9CRk4nhe4GYybG0/hgxJkugZNUjOdseGVwIMt7gCDVCngar06F1tfEP34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144184; c=relaxed/simple;
	bh=sZ0YEEJM+nQC9l3aPVYzo33JA4V892pPBT/BXf8zA1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OknqrkZelhWVIjFoXCrHOyiQtZmKEDNLemWzn5gprjPRRUnCyh3C46QVFT10Q64JQ+7sZ1HiKqSGM2guJoiZdKV6TBV140x9cI9MaNC5hCZzqc9LuyK8eH7WlygZem4J47rDqckvWU63mjrKfrTygYzvPmd/7AEdJtBAoHRx8SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8kwL6Sy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqfWtlNe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8kwL6Sy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqfWtlNe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lDVe1761526
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56f64g6oLreLCUIowP41hw9zucQESMG8NygFkLofNIY=; b=Z8kwL6SyCsVD+soQ
	dLZ5g8n8IPDPJb/2xXKCcv0FSJCpiksMujS9qNAgdwMq58UXKG096D2g8n3zm2Q3
	agk3+qSCNj4nw7GDTIUg4bkDc1J1ty4RCQdkU7YdOfrEQjUE/1f5sRJnKO8IBuW9
	kvDllT6dkS+/bwoXMXFpLIRnMQdkVnwkXXS9OLQLPjuRUqNMS/YypUpymFTrr4qT
	zZIrUuuInxYomymOWImDyarCNrb89gXWZJfmqXx9KHv+9kzI1WA4dtnRGk6L3wm3
	GtTFBFNDwx5IUTi+iJI/2hLit96ec6wFNRjErIeGlGWTAG3v6SEqLutlZYPRYgnr
	3IsXAA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yrcm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:49:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53630cded29so840101cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 02:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144180; x=1792748980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56f64g6oLreLCUIowP41hw9zucQESMG8NygFkLofNIY=;
        b=jqfWtlNertLx8O3w6Yu/V/ruKU4axKgy5bClzIn91gBi6UE9Xbin+4wNw+vxvU4dOM
         5KvqUIvs6CP+xj9xlMjRgmhmOMoELgeg1CTtUpjyrGCOmj4om62c/+4zZFicHQtJRI0e
         BINwHaDt5c4XdmkKg9WY83J7CbyW/wPiUwt6MQVY9c1O4zt0wxqvm5zdGnjC4CR/ZJtE
         qH9XZ3Q4H4E+U05jo1SN5hrPBnlToxA8cbOVkTZJ18ZiyYLX1R2CkYocI3zPfgcpSS2c
         J2QYCMtfh+BNWtDVtF1riOoksS35WYy0VMLi25s7OMnBRn/1kz18RTALh38U3FhG/f6A
         GaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144180; x=1792748980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56f64g6oLreLCUIowP41hw9zucQESMG8NygFkLofNIY=;
        b=0PdrZI64KHs3FCc2mte39jiI5yMBfv7e5X8eSiMXnbfGwo4PY3nIOLT4dDl6YhYGmQ
         n0EpvLUa11RautMMIR27v2eyYoVB3+xvd84m1NWkqjQWWpYZ5w1fg/laPm/38AAqYp++
         7t4dAWbJR7xYHmOr0FVnWKH6IcfC+CiNQOdwhtftTrbaziib5HkRfwXhySW3as9cn+eC
         N96kOhODF1bSrktxs3XwDGSzABaAGEEJJme6g/uGOublt4xoa3iDrU0c0vSB1bjYFLGC
         NKvsICVZwQIUCxznP8Q+n44koLK4QUDNHBeEllfbBZJ/umeJB44xuaTci3FpWYk4dxG+
         6FfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCrYmMIU7jVRFUaYrw9sgJZSapuN9pLsxCyuIXcEIn7LZ7O2Y8ed765lneFsvWQmw5cL/bYZ0BXpqjZ/Wi@vger.kernel.org
X-Gm-Message-State: AFq9FYKRUGHrOhxbKDBUc1Rl4hBsc9E6p1raZU/6CadOwtaAfzUyGzXw
	jOreYk/Tx+NpZiFEA2RKutNe5Ub/16XKWlu1gCgOAOi1chZemS4tM9TF8SgYej9T4Th2jfNz7lS
	gZqR8rg8iKjqrs3hck1iz7W0GxHLYGOMA80F9d+HubgicLfBrBQknQKFJPkl/V5xrgMKq
X-Gm-Gg: AYBFou04hKs8LAyko9mS/T/GuM133ffhqEGGxrY8uYz92RNuQBZC+Wzd5ouO2K2OTaX
	pg8n+H70WQ7vDZVvoclzu16ndIDZ/CB+TvPZUR9DXt0O+yNBlGAAlCWGgtUuv82UmDeYv1x6d4X
	Klngpfrw/VZnC17QQkvVEzs4zQUNS/DJM1u+Eh2Op3A8ZeeksyMD7fP6g3n1CaVbt0Nugxz5U3J
	lr/Q1ybkLSpq4KIUe5ndDzV4DxyPpaxXAUxcSY89CAheefaRv4hpz6AezXF8tJHjTh4y2W2H6Dt
	hKRjP7QBvZH0z1zPeu2QfhdYGVoxUEsUOBdNv7N9NTJV1xUPYYHtwHeJ3nH97r4ONRaq+Y9rBg3
	7RlspRL5PVKayBCEgNs++rA==
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr4276519585a.5.1792144180639;
        Fri, 16 Oct 2026 02:49:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr4276515285a.5.1792144180098;
        Fri, 16 Oct 2026 02:49:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d6280sm690572a12.24.2026.10.16.02.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:49:38 -0700 (PDT)
Message-ID: <734a6666-e420-45ca-ab5b-f00a0a7aacfe@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:49:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: arduino-imola: add support for sound
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260930124607.1109167-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930124607.1109167-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5HdYA0SX4Zoj4oYlMnArmiQvyixIOtSX
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1f335 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=iMdRMZ7CqAKYY1MXlagA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX7tunUaD8+84l
 pJ+pVR1X0hxrN9N7nKxVbArb1KTK4YSYqmVcl0yLFVDhDq4iGuPYFRurHDJEgKZSSBGRNxlJ0Yl
 EVuytVSVR7T+P4NgHyMIQF25PAaWSQo=
X-Proofpoint-GUID: 5HdYA0SX4Zoj4oYlMnArmiQvyixIOtSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX9UYGSEOtXRc2
 2pvWTaLxSwnWGKiLErwraNO1fLCu6ODTgSb/f4MFmkBno/oYWr4fVxiFnafHd5pUL5xHhNxPJIC
 QfmoI2MN6NzPTEV+RL593QYAJ1VFsIV4ae23odP8MScTrY/bbNEyz66AHDCqnNYK/FJ1WYNfhd9
 pF2DWqPnoDC11OZF3Z35DPXIlreFpnHCnKK/rtc0fP23vF5CcCciOyJ0sR8fnei1bkmTAGe/yOe
 OfMhIhCVjZ2MG5Rhzxks2m1196fiuNsmBOD4JRdicpf5CkUKeqmgEC/XQmATfZnr0blpz9/QIO/
 Q7v3a5tbgguBzZDzNtHnsRcoDRGZhrlUTRvJQKUtkQ6sYGtgU/sknTfgPCpDLUQBw5NBIvSsHsj
 dSerABEIeoyOoLCqUM8tGB6sd3SSpLTZ6ZvadzH7Wc1CWsAC4Xelc5f2OofLpHhoypyDd1p46Ju
 Un+idjhn0J+lQmo47Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160038

On 9/30/26 2:46 PM, Srinivas Kandagatla wrote:
> Add support for sound on Arduino UNO Q board, which includes
> - Headset playback and record.
> - Lineout
> - Ear Out
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
