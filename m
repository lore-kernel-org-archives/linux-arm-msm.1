Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED3A3CB2FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075433; cv=none; b=HI30SOO3jmqHYb9Giy4XdWvcLd+CyXeBRBjJLVCPTcuAplluLzbId788bjYGmuSUXNx3cKsUsP2w2euX45bcT8rqIj0Z7CnA6db5vqWusgbfS3LNSH7E5Tq4AKLlUOjDVrhjcTwcBnlvjhqHD3w3qRpUD3ETyVJJCRRVqL8D2Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075433; c=relaxed/simple;
	bh=DXjyIndIDwV3dd6kJq4K5YDy+8+s7quV+iZlTF5mzCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAVeduAffAJAjzRiwi1JnSE7lUi50SKxtUf133E4JXbQUwLDtbNgTn2/QbjORybuRlQ2hMcEaY5sGBHlU9FomdQqxb8CU5XWZKIEN11Izvn+FQwuGHkcaeaQu8fFb4qDzA8buhHLeGwcATzKTUYoAkXIDV+uG4mVbyji36BFGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjaBIApH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjpQhgLM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjaBIApH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjpQhgLM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOKV2114134
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ctsq3+iuFi3MtzssQO1t1IJwSkNjscSenYh4eM7gop4=; b=UjaBIApHvRcGsN3E
	zZg8lbX6CeNRwMA5Bs/oJPMq54LfOrzquf+qSfrNDQPru8CieubfmHPWMRcUKuD2
	w2THhpjkRYBPQSBFpisG9cQ04zwqgauizi/uANJ9oF0XlyACIi/HDgOiqJF2IY2G
	vheBEfPmOnjpltaEtouQ4k+c1iMAdmCiBu0T1joYJj/tqo/56WO/64GhHyEksALa
	XV5tK1iuwlbXbKG2QyD1Pz4jRsCJd+Gy1bMi6YbHOcAUuM3B9GYw8WBeKZxtAenA
	qutyrf2JLWqNIIH+BuXumNvUlQPh4Oh3AH0DLremXkiRgE4VycaNhnDFnDVFQB85
	RlrIVg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmybk5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:43:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a54501a8so13792796d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075430; x=1792680230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctsq3+iuFi3MtzssQO1t1IJwSkNjscSenYh4eM7gop4=;
        b=LjpQhgLMWCIUaPNUEzE1ey/te0yiQhXadvuu8zWyYOrYqDFVNtbs43dmfLjsHjnd4V
         gUAlgG1+NrnXrO+4mxKbrfBwdPamN6raHxqqf1jLO8gVFczk7kTQOR4/YD9z+yEWw0J5
         zRA67FahwEKVdEuTAAjAc52okSqXJYRFOpsvEh67TSBlvPgj4OA3N6guVewQWnBlGeKk
         dsX6d6Ur4d2arIoPduCzZi6BHaEb/OAKbULbXcK0G/ijl0uWx5Hi33MUG5LjcseDEW7T
         QZN3caVAWYccTBh9V76YSKNh+O3yITpEaxMV38gqyG6iZCO5gZopAXGaUCjXg973CVfQ
         Efzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075430; x=1792680230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ctsq3+iuFi3MtzssQO1t1IJwSkNjscSenYh4eM7gop4=;
        b=WJiRB8SS1umHtOeShO5vP7X46+G9gJOlTiz4Nj8dh+FUoijjFPj6xb0ktNmkgwJ0Yi
         5rko1CDeuxVtNcA016yT9ibt9l7wNf0MiB78rb5ILEZz800YA4ARN9NcQorErc+5jWTk
         yriHH3GRrh2DRxRXtFUJfotsczwkvhJWcZR+QjTlgQ2yWfi9OpP3fm1XrspEiQvWHtUl
         5P2K7VWnRQrUqkLNH37jXAsnJpINypH2c94ZNT+mUOCNvUnT5owSCZ6NwkaAQ0C8oEtZ
         M2sAEkuMjicbbzIZUZYaROUZH5+cTDAvoMuoPqNLZMzBfc8eATyaTS6CoUEdR2xo4u2Y
         +32g==
X-Gm-Message-State: AFq9FYJ9sk99brqAM84Sf2OC6iO61f9qeFpvbElOB5K46pRE/b4xIq7k
	XR+eR4rq5ilYJHWCZUukhglFCs1dBwuwY5BCMli2hObMRF8DpEvF3hg2jXMyUnZDlkwB4p7LaAm
	aVPgR8favzahSBahPO/37Rq5cdyJU8+Z/myCy4Rdi7ct2HRmRibpcvKv8uRPpRIOwG+J0
X-Gm-Gg: AYBFou2/RSKtY1iofCqsn+r3Nad2uZg59OPTuNOo+aPgND3h2IdFclwWEAXt6jiFY+M
	YcX3vXNkbCJQr731BNOtg8aNzYZdFKOKy9zIRw6UGeZXPmejU5SOSWCmuecGOy/3kKyAPi0uKLn
	fIB/mnUuJxUz9bxKGuzd+LZ//3ityRnsNQ0AEep3LLU+zL3UCZFp57VPfG5+h1oR/SCEVMrf/kJ
	aPtiJMTuqxfT+wUcVLBYQv9Hd050zruaOp9tQSmlwZFYuUp2oVQH1gORwr8nwBs9oYAXaOonol3
	8DXY333uyzgy8wlL6SG1T7sLBl/bT9h5DmHZHJAAdWU94YUAZpVxpbXXyl/mlaEDiST31UYbkvP
	hF0MDFjdIfdggaIIJ8j/8Ow==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3654726985a.2.1792075430458;
        Thu, 15 Oct 2026 07:43:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3654721585a.2.1792075429968;
        Thu, 15 Oct 2026 07:43:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed95478efsm136191466b.27.2026.10.15.07.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:43:49 -0700 (PDT)
Message-ID: <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Jn-sOMh0H_j3g6Ib3m1ddekOUDq2uj4I
X-Proofpoint-ORIG-GUID: Jn-sOMh0H_j3g6Ib3m1ddekOUDq2uj4I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX3oJ2IyJejw9I
 ge5eSGniMnpGxzAlc/+vKum69sE9JSw32CWKOMivtRuVRFeyMCxhte/hq9xIoKusNr8s8MC64n0
 14WqAEOq4BCQu/y0akXaPO4UnCAKVyc=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0e6a7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=foisExlbF95jOuBURZEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX+ytce2sFMtT/
 PHgXwe15GcXY5DRtw6hyQwDK3gCQkhVaKEczw6TsZiwqgg2AkfqB5a9EzxuZop91aVPrFBdGBgI
 p3JXKVopZwK5ESu6tloYAJSnumfBJOX0rOpeRH2QuB/ZLnreg6BvrfZ9cayCBCexJduhYvQmEs2
 hhHh9Asnv9FXHIeHM70iQRY24tmfWRf1LWd+aFB2kPrJyPGWVphHMcAmtuzu1wh0mGfcu7esWYW
 ndcXmx+OM4sq/NklKE1B26qzGohl2u0JoTb4LMEXhZumojbshcuGd52Xiwy+M+56DKAzJplj9Gm
 xi9h/8s/O5yOG62DnfCYtCQc05vAbFLod5NpOY/ecjk4q1FQR/3aJbN00vU/IQBdqBIFFUqiN5M
 WKMJWA3kdVLbg1tpN6PBpxE6lEq9TI7+lWmkSo7NEg/ZL/Ld3YMhr/MKdwMWt75GZvvqPlAo6Z9
 gAbtVv8L8uHAmxhmz8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

On 9/29/26 11:35 PM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---


[...]

> +	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
> +	if (!sw) {
> +		of_node_put(controller_node);
> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
> +				     "Failed to get controller role switch for path %d\n",
> +				     path_num);
> +	}

This will always probe defer on a fixed-role controller, we should patch
dwc3 to always register a roleswitch

Konrad
