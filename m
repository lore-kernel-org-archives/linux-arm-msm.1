Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576621;
	b=x9BHvqwex2zyU7aAYPMqeubd0uO/z+lvdMxFJSI9dmDPjJw40T72s7K3o4dPbo+LWOZG
	 NyijGR2VVKyGupIkWnEwyBCQrgsJUKiSOU3DzFCBDHZf1t2nGJW8UA6oGXyzp+5voqAz8
	 jJUXRRNc35yQXLEvWggdbG0f2JU3zGyElNfCVXQ13ZIRo0tM3cR1wBvvrPaLSSkdtCbg7
	 dIOb2DQ12ATe3gjhP2k1BWvMnMQou5yeWGeJZMVYPqmIr0r5HptltP9PBkOX1G8H1hv/c
	 uvF8UkgKexgZJ1fIaorSGIy4FwgmvcQ/iQcLniJdJxmoxkmPfVclPZrEcFkofgEaAhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576621;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eKY9xsZpiB2hvy81yowzV1na85VWyKF8Dx5LqzKmNxg=;
	b=xga93nhZZaWpFFfrSKbH/gav1p3u0fnPCtdhfN4tcFjGj5sqgnZ1thr6y25rkTcRBCJi
	 ieMsEdDYK+9Et6zFdr6as/z5QMy/j/GOAaVKDhX2QIBTbG4hEFe2HNWXc/I8J9FqVYBfT
	 YA8oJelD8h3YErH5g/GJit5pGeY+O2L2mJZFZ6mwRFIt6UrPF0WvP1RaoHgwRp/qqwtu4
	 D13cJK+JXb3NXxYE571y6HzWGGqtcbEGJtVGsldW+bqSXZEUDg36A6uhbJ3NITfWeEYvN
	 LqLw0fWtQ8IYGod9cexfILxjIFhLGWmxCOw+1euKTBMk1QzCuLbK2rTSWemqoZTxtdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kxntffuu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NVZ6m1f2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E98D606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E98D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kxntffuu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NVZ6m1f2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0oC756368
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKY9xsZpiB2hvy81yowzV1na85VWyKF8Dx5LqzKmNxg=; b=kxntffuuGMwXjxkn
	gOl0blnyh5KYfX6lAiuPZWEnEZ+wI228RcmeF9Ft8brzaJuk9IVb/814q244u6TN
	gja38tjFsMUFoqKhWFnJ7jDxENiouEG7sdfybPrUBkzpNIl3zSGcq0IyEvMD6399
	+qQMm+0NjW7c5uzqS6f+U30Fe2e7lKuvsbKczcOoXeoFMXigll2lazoR88CoQehj
	O6yQRbieWHV3xhjCVhW+vW6ljIgX6Osemgq3zPF46rbjr/mq02+JrwTBLFZn1Q3a
	K0mTkor1CmAI+DBzshIeOTJYgfBujdIUFj3cBSz/7r5n+aowwvvhNNJiwDAfmrCr
	ArcXqQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ub06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:56:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a04d1cb2so1713936d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576619; x=1793181419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKY9xsZpiB2hvy81yowzV1na85VWyKF8Dx5LqzKmNxg=;
        b=NVZ6m1f2CGeIazpdKJhYEdF/4UQ0nQwMco6apm5ZPN/J/a+SveGWrRecDxqtNPxVWF
         /Y/iMJ688gC6cUUsIo0ZNsz1nO6E/gvLSwhenzAqmyX3pPHKdcMSDyPQJsr+9g6oh2M/
         ZtbEyfNskPbd4u1i8fGMNczcn06s7ArUbAX3CNO4XntKrbFZYg2716X1+glgu5QUfxvZ
         7w12sG/v3mIQmd49Iu7dWnyBwzw0EiAcbclvVVMlxyaXYZMaQ0dgm2Zg/lYGvrMZMdJM
         Q6OUpQR0JQEFiX6ZmNZJ2rG3OXpctjI8KqZoMwLmg8Tbyu21czVmM//7JxXhLMwkVHWG
         7tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576619; x=1793181419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKY9xsZpiB2hvy81yowzV1na85VWyKF8Dx5LqzKmNxg=;
        b=tbvzZ8bvpWBSYlKhx4qNcoaCeteuCfc/8a5L2QomNcxfesuChxmhZNImDNUp83uy25
         2CqR6rfU87yAkrRkBZ7qXRiYOsqZHoQVlA7/pLk5WLwbgfQpftL/iWPYV5tEsXZExH3d
         sBkTGFC8ERtM0ECm8SbYhS6Vqlikpozs5eX9Sgsmexd11KJH5CQzDqXvYURDLzzl0k5f
         BOGSXCFtc4Hi4uhSAm1PrfDT39lB1cZCJ5xe3YHgpSQW2ia7w3W1Av4xEcgH13CxtbJP
         F/NxC6t6iy2dyD0IVHiYILOk4JLstE7mpJW+xHW8SlQg0+1dEoQ07xxniEY9/anbjlMg
         lvPA==
X-Forwarded-Encrypted: i=1; AKwUvByokXrQKy/c8GLowGmeQkEUBC78KV2bKIUkHcieeOzfC9wHRwsrLnKr7dF3nwUbHxxidrU6ufV0wJGTmuuR@vger.kernel.org
X-Gm-Message-State: AFq9FYLwF69X3gMnPSaicPZ2ls2diEFRklFtkEawPJsctcRXpWSTfDns
	8oNZJXrkWwCCBQ5NOXVqSQzpy4l+avabCUDnIBG9YnEQgfC9v8mAXnfDOQ1yuy5nzp8ddRIVCzN
	Rkv08COOl62tN+ONgYw/3YsY0iUtFxqpPk54rQ7jnLyNE11T8wQ3zUZ4QvpgLKxNSdMfWXY8kni
	MRpU8d2g==
X-Gm-Gg: AYBFou2pNm7qpKj0152pT176wB+nz0bmM35xa80liIQgesqE+prmVo8nojfZ+AmW9KB
	bylGOneCkF25RbYR+24mIOIcQGhGuPK9HEMx7bh5NuhJQ3wPWTGsRtBUNHoAa5FrPQqjUfCHZT4
	mdY27yA/b8TTsmAfbN89HR58TxI/vvk3zSZE9FqXwjM0S37PvdGfPPFpyGb1WC7O6wUxFVbA47P
	Z+zZSkRwZR/h5xZwgrZA3ZgpABA1kEiYuXBFpzgr7PbJlkdCVpzo4PjTWQKvMYzcJq2FfMKN+YM
	jgUaSeBA3R0Ww74zITB27+upfg17uQ0ESHXPBDypfjiutP8jaV2aRv/FN2W3ntU/PeidgknQQvP
	QDY8wX0no2kGxV+JYzaKVuw==
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr380062385a.2.1792576618783;
        Wed, 21 Oct 2026 02:56:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr380059585a.2.1792576618283;
        Wed, 21 Oct 2026 02:56:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679035df0sm60238066b.84.2026.10.21.02.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:56:57 -0700 (PDT)
Message-ID: <d4349c3b-f6c7-41c1-963c-ca0e21e2f436@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:56:55 +0200
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
Subject: Re: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ICfizNjIK2--WOG6WV4UAf7TTu56eloi
X-Proofpoint-GUID: ICfizNjIK2--WOG6WV4UAf7TTu56eloi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX109yIM8ix6vY
 3TfS3jDCqsP1JeI1a47wyy5EO6fDc0Y0gqx6TGNk4Jg8Z9maEV8KTN/Jqvop/mbDXUUdlcrbWuT
 h5M8806tKSw95pDmoBfGstj3AbDuP3Y=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad88c6b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kut_hORSmwJb1qpv2dgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX/X3IxbqLW2sz
 mgylZp36fcLXWdTu1QSKVXHfFqXnIKDxMgjsVrDeYcJ5xAbhf9nOzN9gH2ZC3oTtDexDUGSZ+rr
 n4r3UZNxr3nZbG77S+G/C69n0hCc3MCcziP/8EebqLh2PbQXcJq5ZHPcRgvLR8AKBwQesshM2PA
 8k1wud2QkqSJibJImOM8x5E6RvVGaivacV2CidU8i2k4QPAfqzYyNRxT8tYHTVo9jywtsdp/I9p
 c13Q0LWRNH/hGx9bGVyrz/RYcjkLv1jFr8eQXlR0JxjlRTwJZOQLJikG0T1nYyiGxGQU0OZqrkK
 ivjYtk5gjuuU+c2xPdlHWsKZ3Mn053gOxOxI9sUJVkU8X4f/oWRUw9WiFMTlwaTiUgBUs0rStlB
 KI+B0M2dQxlqqqbLSkB7KvkKVjy9qhgHKERMD7KbP5FEZ7M3l1Vtupbq2T6llwnxQhn98VMzRPb
 rQ29bV7nWT1QArq8dyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210039

On 10/21/26 9:36 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add support for the Qualcomm Nord SoC to the protection domain mapper.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_pdm_domain_data *nord_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd,
> +	&adsp1_root_pd,
> +	&cdsp_root_pd,

I see 3 more CDSPs:

https://lore.kernel.org/linux-arm-msm/20260929155152.1898666-3-shengchao.guo@oss.qualcomm.com/

Konrad
