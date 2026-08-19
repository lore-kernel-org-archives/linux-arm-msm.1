Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B513B9616
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149482; cv=none; b=Pg2h+ySOhECBAFpZs2u/xSNj3gwiTAOJapma63Pw01DaIYKYWt9inP17FGgWyXfNsQrEEj7g1pHh11pckb8WTfM8I8Ly4bjwZKOvjQ9VQJAo9uPqMz/dgZHC7jhBmeAuixMScM3Z+TjCQz3h1HoY6ew3k/M39ckOf2jLLPntH/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149482; c=relaxed/simple;
	bh=by5hsC14pplzTKqn0dF8kWhEyEi5Si/jDZEGyYEFLl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ub/9x5R9G/LRGPTh5xKa6i1g9mOVEusDfrNnDUQxpa6BIwghOzX1tpTwZbUXvL27SXdAHrawsdgCBXtJjoirNe8mcRvM+eOB7mGGQbC9jsoXxk7WBmCvahXM1h1CdRrk3WrvTSW+3IIqmwY1A219gUGSp/Ywh/WKplFewhN2rJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkixAGCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fISaT/Vq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkixAGCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fISaT/Vq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0GGw1404845
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtsOjETQ5Ny0zIYiYUrPBSIvRAKOEzvAcJAprxh8wuI=; b=OkixAGCvtWDZsSVv
	OHu1Blv7QCIrnq2cVAEE4iQONA6hjGqziCF637Js8LcGjWC8g7NLTKoJgNWeSiLb
	W02AyW6jtU7oqB9Vnwv8PUoHcXxpjGUkmO4Rzu7itwDpKZp2GgpE7WOlLNE2ZXY1
	n3JY+O6KNnS1jjG2G5oLJdDprHoQ8ho1JOsg2P8LFfW45z+WnrtPoOSDB8Lsby5z
	EcJfc3Wub+ujHj8gGSfjkwDGp/JjsGtgFI3sXPwB57F10bH7mX3yy2fVxq1sCq5I
	BebyfaPJvTz6G6TVTfPNBxDgxulaxCXSPVPPNo8+PXvWzHkOLW2BiLQcB6MbkQn1
	TBaBCg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm3p4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:24:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930bd2bfc45so36438585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787149479; x=1787754279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtsOjETQ5Ny0zIYiYUrPBSIvRAKOEzvAcJAprxh8wuI=;
        b=fISaT/Vq92jhqLNx1EiIF78Xm+7vNvhZUUUtflDxJRn9jXUzTMu46cyIhvivmYnFfD
         aKkt5OMN15gVXTbS9H2O1qYpNG6M+2h+pbtisKqmZODhZbosEGFcA1P4CNNApdLu4a33
         50Aqbb5bXvBXkF77G2ozWNMuermOZp/JyKfMrzoUIZABsfgGAIPR9qrkkKZ4jdYEnFDh
         2miVmO7yTytlHVzKJdcALJCqEzjS1XIAI5+91ka6EeipA2850Y/9pzMYAregDC0OrLMw
         ZWflX97E+s0BHIuwK4AsmDYtOszxUOvbB0o1v/3n95H2MOH9fcQrF2htkW40SyA+InQs
         kYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787149479; x=1787754279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtsOjETQ5Ny0zIYiYUrPBSIvRAKOEzvAcJAprxh8wuI=;
        b=a54xv+6+S40Atjc8mu5Iq9w648RFx9Lp3eC8KypuoH0Zq4j9uWAnG+Ok7lLyQGgIvg
         fsRKDIsNj3Ffey84sogwp/vA9b/YoaAOehI56igNR5PVoPHhuOJN0mkep0RxzD0pJzFU
         26zUHlmqbx961BJ95oJ76pkfpR/S7+NzHsDnf/8cUXsHCdB2aE57fponhr2FvKUtsSbb
         WfuMlkgFoz8L0N7cwNk7dR1DaD7J1KM0gg4qNCkzPWmcG8vFwk3E9/zG/TiXh/+u6JIb
         91SSSsCDgnj8oefRyf2r20WFI5ibW8fZEtChtAaMx3dLU6x6rogPeodhHl9nI3su5Ju/
         Tvgw==
X-Forwarded-Encrypted: i=1; AHgh+RrbDyibe0Z2K8dC+yzp5uy5wai/VSfjt2aUAiShLC92XRnsm+gr7xJAzf5fthtvNzTB/qXAX8r1p7qc/W78@vger.kernel.org
X-Gm-Message-State: AOJu0YzwIWMkkr1DE2epbzBRQAvn/T8WyI0/F2mgE1NOrmaX2HhIsl/R
	ceiXYvMMIWRm7H9ULpLapcdKDBeuQ3IC0KYrRAyn2Z6QursY32F4gdm82uLzzR3OSf54hF91kJy
	KlzNK/E0N6PJuHMENnfAHHPzJbRBPpSS4Gaj2TM8vUlQccclhAynnsxG7j8dep3Z/2MDh
X-Gm-Gg: AR+sD11O3NgubB3Z2C2rX7gJ9zcYpXfgKy5m/koPXUM4YEQuuN2J3vFG9ynl8QjUc/q
	/TdGVJch7p+duXSf7GLjrnPH0kmV8Kd1A0ZtRge5a2UY8ESuiySbZg5v73RbfRwutYpgBIsmTwR
	ww6YeAy5pNWRDSBXvoRJRp8NCabE9N9ttujMpw8BIbcDkeRkJnyoqaPDf7TfiogaBSJFzWtAn/j
	s/wfFvrv/ig1GPWVWutK/C6fWtVrnOBjnoPTHmsuE5ZnYtBbKLTeDhrgXCRneXpihv9h384fCOa
	49B+M7geHCFAXj1YeNO2DUhcp8ZDulaYxwDzfQiBndgs2srJIPjBlh9Mq+IjTDDTGjqPv3pEWsC
	ctr4bQ2McQYnUJ6git+Zs9BxZ
X-Received: by 2002:a05:620a:278c:b0:936:6e2f:a34d with SMTP id af79cd13be357-9371e6bcc32mr337086785a.3.1787149479299;
        Wed, 19 Aug 2026 07:24:39 -0700 (PDT)
X-Received: by 2002:a05:620a:278c:b0:936:6e2f:a34d with SMTP id af79cd13be357-9371e6bcc32mr337083485a.3.1787149478778;
        Wed, 19 Aug 2026 07:24:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b47885b280sm579454e87.30.2026.08.19.07.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:24:37 -0700 (PDT)
Message-ID: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:24:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <c547f8c1-7a49-4cdf-b1d9-22f00c6035de@oss.qualcomm.com>
 <20260729023654.3840494-1-wei.deng@oss.qualcomm.com>
 <20260819141353.96467-1-wei.deng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819141353.96467-1-wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExMiBTYWx0ZWRfXw2OWF+SW1Xir
 xuMGduVVLLFuKeCgNGBJmeu/F/lGALazwjUAei6MkoCRBrLC6tRNIyR3AXkmdlGV1V/zanaMW34
 Bonh4cZ3vrokRZeYoVn9iEQc5V/vUpU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExMiBTYWx0ZWRfX2xD7n5pEeD0R
 YPpcRyvo3YjyRewIEbLhbbuzKWA4eVUTi4FOt96mYWtCYLcqs00l501r1joIJxi05d5i/tNTP8c
 BD2LeRLLUGmpbTxCPMTF+rP2S0Ji4UaFusnkQQA2wbh7s7+klcyjleINrVU629S2IyiJvLSXpGZ
 teM6CwAyuLzVbxn96e6giQ41BnXwGz1ullww6tg+BWcy4Uq/cbSYw4fGwPBAkY0tVcDetOOOEHE
 ouu6Qm1tKHmrH7NjTOJ14TdgcFkJS32IvlsGDt0UA2viZfmfSPPsNi6i2anZ0dPuRLlKzw/9Xrm
 ch1/yMVUl591pfSR975OCJuLaCTDScBtwBV14P0IG4OcoZ7kmdSQEH/Q5L1NCYPeHbaFbFMpwZ7
 PUiMLHwJmZLw9+JmUnYACEsX7AM8gxr9A24HINmmX4QK5V7OIF0i+WvDato/tmNRSBWn5dham5R
 kBboquNlG210GcfQe1Q==
X-Proofpoint-ORIG-GUID: Ep0MBEbm9ynUi7PIR9m5lS6DfuCBUP0F
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a85bca8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ya91ShjpW29wvZP1Js8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Ep0MBEbm9ynUi7PIR9m5lS6DfuCBUP0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190112

On 8/19/26 4:13 PM, Wei Deng wrote:
> On Wed, 29 Jul 2026 08:06:54 +0530, Wei Deng wrote:
>> Fair point. I will move the port/endpoint anchors to monaco.dtsi in v2.
> 
> After testing v2 on qcs8300-ride-sx, BT init broke. qcs8300-ride-sx has a
> soldered WCN6855 and no M.2 Key E connector, but the pending series [1]
> uses of_graph_is_present() to detect whether an M.2 connector is present.
> Since of_graph_is_present() only checks for a 'port' child node, the empty
> anchors in monaco.dtsi caused hci_qca to incorrectly enter the M.2 pwrseq
> path on all monaco boards.
> 
> v3 moves the port/endpoint nodes back to monaco-evk.dts. Please review.
> 
> [1] https://lore.kernel.org/all/20260720-monza-wireless-v5-1-69ec6743543c@oss.qualcomm.com/

The series should test of_graph_get_remote_endpoint() instead

Konrad
