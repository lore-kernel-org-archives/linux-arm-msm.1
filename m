Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C02D274FE3
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 04:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789706438; cv=none; b=AW3v2l5snz6sFZPvBH91UZjp4uQKxv9y3Q1pbHy8peum7nr5hh/vB49/7cMud2SXqTOYKzbXutayJTE6qkFK4tkbXtJC93UqJSXqPaiyc3+64R797SxtFu54169RQ7H6Y8yof3Go1iEpROVDd/POULAobLgGB9dIgoaAPQCFUXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789706438; c=relaxed/simple;
	bh=GDh2B6VHzyz2DND7O7ADLJNH6RV0i2L/+VV5wUCVg+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpZrbrZw0xstkrI9aQgHYPBvNOB20A55tm13nNUxaIDukjBujcUPyTh5AX+fBeuwh458zIq4v2gXu+Qjhgpcgz7AUv+6WwcECb53+L7B1Dm5vJInKfo64g/61G14B67/W3Kw3hngcCfUKj5YlrAUUayy4ELsRZsnT4orzFP9DIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggcnYsdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnBOYQpz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggcnYsdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnBOYQpz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2Uk6I3761705
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 04:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GDh2B6VHzyz2DND7O7ADLJNH6RV0i2L/+VV5wUCVg+I=; b=ggcnYsdNZhkfVvU+
	9iG4KW0LuyTC+7SVgSdMRVjwIm1dyDGUTazZNW9r5aYL3TWKPxmkTj9skg1W4JsN
	6VsfF6itt/XgaAZ2MSr2Qj4DMGos3czDxGov3Wk7s4WghJRq7Yj+aAVMZK0y7QBL
	DIXA/75Ec4Sjy46i43u+felCoAaxduDcm7PnPPznUAisheo3wXSZKzTg+YyNFu9l
	+dhvPPZDZq24Yi0Zdqipwk3Gc3gH6iiJGeKLwYzeg4OChSNY0GZFYXZinoe0ruWm
	EBrj2iNAa5X+0QjBQOXRefSyIYJZ+odRCDDeuwNr/Vdm+HIjUmb1nESDxNqnJcMH
	m5C+Jg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqea3r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 04:40:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso424111a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 21:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789706435; x=1790311235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDh2B6VHzyz2DND7O7ADLJNH6RV0i2L/+VV5wUCVg+I=;
        b=DnBOYQpz8I7zgcmDoeqDQSOAb1N/no47ZSQUZkcP9p/27FcXO9QsnvN8aWrnFYT8JU
         WcBPpNTmCTkwROl40yZXQrbqT6JMaWBqbkXP8xHLcdBurbBM7uQV9IBq0QSPc2RtJE3i
         ugnM5ND7ZQ+RhVfexZr/mFhDZrosPlBN2khY5+dvxHRr3I5oF5dIi4ujtfs9YgHMNRhw
         e5BOf1pAfdvFQTFbXo0gEUr/XZyTNEPDMUahWDrwEmGEmUVYTKg9e3fYdNz8CjoCg43+
         DutHWydq4GuDBK1SRId8K3f1OY900F7sbrD3S2PttLBPd9euV4wYAoTX0XlNC6/mGMyE
         NLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789706435; x=1790311235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDh2B6VHzyz2DND7O7ADLJNH6RV0i2L/+VV5wUCVg+I=;
        b=veMXmPFIJlykUopWLzuW+eW9etfb4Jv347wIeB1qV2fVAVtJX91jD76hntJGJJlTi3
         nBqMTpeVJVI+wGH0fzKP+UZIepwiemid9FCPzlgDxGlVnwtioRg9NghS3YDUmL3kYbSv
         xUOjqZxn8nKIecT+BeLiKZs33mXRdDDWm+iFg6tYc3aZ+CyiFmdXZNh6HPEgPAxfNgxG
         IQbnTMkscrlpyUB+uaSLhe+YqhqS7aQ02Xhw7JlXq/pijg6sLwGeNYgRdtggc+Cyn7J3
         8Qtn325aKhisGx4CXTNdlRTxNwLH5kNrv0ISffHpbWfnLj3cLyhJCAc7zBrGlsB1VG8K
         iwoQ==
X-Gm-Message-State: AFuF++kuvenJ2+uhALT6Ps/aVzMyPh8MvkCh7p+58+WrxFsovsrs1LGl
	L2d+5H/58+w4AkIK7X1t2qFs3ugYMhXwq14CFy92eiBQkikhDtqVg8CmnNAQOrlqaT1zc7Sc7rU
	0s9TuX/oUbBFdRK518uUOxWv6j7q3o2InEelBiHytJ8cTK5ytxChv4mFAxnZEKXfe4j2r
X-Gm-Gg: AYBFou0/5T86oatsqwY8WRd1eNQtaVV0uomczudeNw9+R5IBEBms2suCDoKUEA+akGF
	aG5UhSeaAFCp6Gi0Qy7PAQBTZfEN9VKaGVl5XBc1NBbEzlpSPa7ki3JhkAbJdio/8uuj1VeHc0r
	NsXPuJHOkxIpGlGJfV0vBJFPJExZHoBt4KthPM2GJ60cnT75CZXZXudsn/txsz47EoQLiE82H4k
	Qy1+kNCBGvHg+V9NE0sSfPNceHKhELt4SwF0XWlEdNRcePJU2xfU4oXP77SJQFhf9RCHMtlwg/S
	Vqcx14C8U1uSy3nJp4gmyqcatBog1nOfvc+cTay9S8542vjsLDS4twbzvvYPJOGht8aV+OjZFFQ
	B6gEI2zCpxO5dygeSyszxPXRp7pQTjowwMugQoZ4v2EJICU3+buLLodSOiDc4TL0VwSA1uw==
X-Received: by 2002:a05:6a20:258f:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3dd8c44eb2amr2685972637.21.1789706435215;
        Thu, 17 Sep 2026 21:40:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:258f:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3dd8c44eb2amr2685942637.21.1789706434812;
        Thu, 17 Sep 2026 21:40:34 -0700 (PDT)
Received: from ?IPV6:2406:b400:f14:c5fb:598d:4fca:aadc:2eb6? ([2406:b400:f14:c5fb:598d:4fca:aadc:2eb6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce065314sm1354633c88.14.2026.09.17.21.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 21:40:34 -0700 (PDT)
Message-ID: <3ddb920b-1d9f-4ec3-98a2-3477f845c145@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 10:10:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com>
 <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u-CkWjEt4njm80c_4tfTiGQog3ATKdLO
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aacc0c4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Y4doX2lIe-IihnvZzhwA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: u-CkWjEt4njm80c_4tfTiGQog3ATKdLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA1OSBTYWx0ZWRfX6UJREcP1zSgJ
 RYY/44SlfBKDUVbLU5t73URU5v+UK6j7qzKbDQqNCJUTNKXriFL+GVn2I+XvGWs9KTpzIxTEdcA
 vicEGK3IqT9e8amSegyMtXDNibPcLYNm335Lkt5nwWa9rB+ATekkklHTUyMDgbhoKdG/Cf2uka0
 +Klx6SYSfHhSEO0XaNvHDD+UpFV6kCgi5d8SdD6hwImroPyG2TDS291lTJjOGt6eKu565j7/uEo
 jY2ehjHrVaZrzqmZTxyUJCO7e9k8YqJiekXtdAs0pHPIYWrONi1W6WrGuF0/TDbjqajyjbTO1l2
 o+TADYylZVV9/XtuMsP/wedgjWPFP+om6APdKq/wAjGmisNMDdfl0N5quAGQ2JYhJz2NNYB8c6x
 n8zVq/WctVISSDSC1QPyeoKKEx5eRYHqRwM2FA+jA61WOkKXnscf9bPvCXRKdt9uvl9twdTdptW
 +Ei0/pgUCGrK4HCkTlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA1OSBTYWx0ZWRfX7zy0NVCjfHr1
 AKfKYgRnAW5t/A9M1OuoF+g/xeBqM0+uHF0vnQTIRj7O+BtU7f75Pzfw+hKki8EoYWr2awwdabL
 1PdJbifZz+naLTsTNXoyvtXV1W2SATY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180059


On 9/17/2026 7:27 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
>
> The HeartBeat Pulse, also known as RateGen Pulse, synchronizes the
> start of DMAs and Codec Interfaces for the audio usecases and can
> serve as a periodic wakeup source for the DSP.
>
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the
> other clocks during runtime PM resume and suspend.
>
> Attach the DT vote clocks to runtime PM and resume the device before
> programming the rate generator registers, so register accesses happen
> only after the LPASS votes are active.
>
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

Validated on Hawi and Maili platforms for WCD-Headset playback.

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

