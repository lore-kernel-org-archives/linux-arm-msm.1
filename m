Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9F44A43E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820308; cv=none; b=j740Zo1QxnkxmATB3pMG9P8c2fLYixil4sVQocmOgfGtymoHZ1ZFtRu9Pg4HKKq/QahMeYRks4gAhaw12VPhQvJAxAPxmhmsngXhSuxWqcnv5aKz+Mz0lBWOdmjOemKvbhiSaJhHx2+VN4ETTMOpH6heRScDnt+eaBriAzT8euI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820308; c=relaxed/simple;
	bh=fTnw0g7gx5Aw2Y5mxm9ltk+r5VwLNvbSYXJynxSDXak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDWoLJScerSPGVY9bmhBNf+dvrZeV+1Ip+e3s7qVnznNasfgAKzelWxyrJjnnqt0vOr53RL1PftftmV9eZEsJiiBMF0+Bjw4KKc+ZsOqJY5tIuuf27wGmcUZq8S36hKKHbmAE2sm8JgTCuaGUBsyGh0YCHSC5r0wxwas22QiRLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbiPvxCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgA6jY9E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbiPvxCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgA6jY9E"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFfSFk2768440
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qS6AZ4+ULj8E4qmw5derPFvpwNN8WBKWDU4Fh7Or1Hk=; b=jbiPvxCnQb5m35UD
	vCGNHveyraG9lxzNplHqRUI0xDbEy4r93Nzq5bkcPsUnrWBGG7oUIIHCDHdfOITl
	rGYjqi/30R5Pd4S+fSAkMB2gJyKqooMdKlaS37aZsrdAnD6GyR9cWKRr1GoRvlX/
	wOT5mizpWQ9Mi6/vJARGByALyiceTg6+d8U1P+i5sBHs4SIRguT+TzTvVx7uAkZp
	K6Q2ycxl5rSgaeCeg8BSe073U0fJt2Ue+XlG9LmJl55w3pXwAYIsca4MQkvEOAE8
	vG9WIHLmENNsQVg7UMWUWyesrDlgHydOzpir2zqvk+urbdidGHDgc3uhF6lZDVzd
	ADSNyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq25hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so27692285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820306; x=1792425106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qS6AZ4+ULj8E4qmw5derPFvpwNN8WBKWDU4Fh7Or1Hk=;
        b=fgA6jY9EvsdhKbpgr6CAxMLBQMHGE5WlU2cRMp0oBniNHCmHBMxvTiNjD56mpg1zSP
         Bztj3GqpNOQjVeCSnd25nWy5GSyZMNUpZwuq8Oe3WbtJ1zvLpXarYLjn6tgnNPnlleBR
         A9rr5tJwmBqh3A6oyqnigG0hbz+hXMY7sbU0cGHxLktHeylqf36gpXqZZgEzq32iEjNC
         2/AxmdB8MTbkK66vD/+i98sWwl6vlcSyR9v/1USwIL8D/mtgZkldb9DsLPBA7KAxCEfV
         fgsx/J9vieV56OA/W/mvy22dpNdju4Kaoe0rgKaDfrVV8bPrWqS014OrPOn9AcbSHQK8
         6S3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820306; x=1792425106;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qS6AZ4+ULj8E4qmw5derPFvpwNN8WBKWDU4Fh7Or1Hk=;
        b=DkF9xhMJnI+v5o1MpQ13og4Id/Z0bFZPTrdfYKJqeevUCdCwBSH/FjX5Q8hSFb2KAa
         +MzZN8SHn0HJpFbOgq/JaMfnkkt2kcTa330Ly6MH14hilKcm2EEhMF55ggHqr3RseEfh
         /EmyXBADGAIWjPrcUUPcWkzelTg7PkglN9SxGPNZt9kpm2tX9So4y73J6rKEkFwM6TQk
         plRIuz9MEyl30MvtYxnZKZeEoSvCncS1a6t3chTzdDZGiInwmzw1YM+D9LKCKis8A2w0
         NZDqG3WxT46P7AUtuQYGhPWMsw63Ue0cootnQ/JK77wi2TFtrrCX8CY9KGmknedIIJDX
         H2KA==
X-Forwarded-Encrypted: i=1; AKwUvBzZAD37EpWww8/IIxmeVAUVnJshLqnfQ3TCNLMcqg1taXTiIXzZ1BdP9oWvAhrXrfu3XhXH+sB0hM22H2GA@vger.kernel.org
X-Gm-Message-State: AFq9FYLeIwGoPhxJf7C4KsSGyK0vII/mFhBAPZLsc98R+n2nHJ0rp1aq
	gJeNgGM2IxGfw39mG7mtM3M3mIYhzgkrQM22qO78OdymIKMfq/uXmRAsp+DHRMWyd+Zki8xObSD
	qwZu2BIx4WPZ7TBwrQAKAUgwAFf4nr619XAwRDQAxnES2lnwgr1ukhcu9GDZmAvkZiTnR
X-Gm-Gg: AYBFou2UVcxHQxi62DaQ5nWbXqetBMv9k42aSijKhQtXC4AfbqZ8CdKZnPeBgfFc43B
	n9WFC67a5RBMQmeFBpVYN++V7qw21S2iwnKsw/infvgyZTO4048jCaLLpHKzLn/IxRN6Hl8sbhX
	yZ6+tGkSb5inWfdiV9V3jrlfneGB3eP/d3Wz4Ok0iBa+QzcvwRtsTZ5x8feaCoUGAFnmX5JYwKK
	AQv36FQU9Gi2kWjEk4CYMtmhsUW8iA6ka8MDp2HxRsxPD7+XkjBLqBIAU7jZQCRdRMCZtG1HrjT
	6HfYwlE9X+rCo+b5ar/s9RxmaToAkkWw1kTuKlwnospOJejmaLVYGqZ9vcTyUhFi81xTsAkjtWK
	qBUzczr56gVQjeVUKtyrlkA==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1902167985a.5.1791820305570;
        Mon, 12 Oct 2026 08:51:45 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1902160885a.5.1791820304915;
        Mon, 12 Oct 2026 08:51:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3498276daasm160389366b.51.2026.10.12.08.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:51:44 -0700 (PDT)
Message-ID: <8b22f94f-4091-46cd-aa4d-d45c05aad13a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:51:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/38] arm: dts: qcom: msm8974: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <fba7a99d988200d102d88c7f644ea8cef7047d65.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fba7a99d988200d102d88c7f644ea8cef7047d65.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acd0212 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=AsWBEyVj_8_gRfwDEGkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX1sm23eJ07Vmx
 wz/OKB9M59RJf9NNtFjd2e3fXiYnZOn2a/jCQG1fJwMhrOvvDWNL+Xh69DXDHV0pVxw8+wq0ko8
 cLdYET86aPVcRA8Aj/6cvjMUllUSMts=
X-Proofpoint-GUID: wvTOm-f4H74VTcCPwOzX-wWAxzkXG7W7
X-Proofpoint-ORIG-GUID: wvTOm-f4H74VTcCPwOzX-wWAxzkXG7W7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXxcIw61erQFRr
 ctH93lMthU6o3yJ/y/fBQAE/8PmNtkx0yyYw0XdD061EVKxenIt621VM6g/IY6DB7YnGFvJ0W0b
 FvE/Ik9YxqeGuIlQt/GFdLrVcOw8yJVjY/wrEvNrgFkhBRG1iOG09QGTZTOpyBNOfgaelXbjmQv
 xPsge/sOTOQZGa+Xa44Lonke7vXC3Mfk5YdXSAbHn5vjvAGTFlCC0R3AB2qjicmheoL9ClnNKHR
 9mRg0e3dRDfw0SeuguIrAOCCE4zGBHGhJyKqhAJEbzCoZte19KlRR5QpusOB9ldgeyK/QMJAZUd
 ovsCLtqefHGfOaxpvv58fn8ncKdwsJ5WGA4uGTEBnqjEgIvURktMsHkGRhYPoIH8NuTte3QBFbL
 Ayf+GNDDb3gtj8vtH0qqN54pAVBBwn0KqhzpiNiQe/4mPZX9hsbVHBs1y4smL7YYTX+yAUyOprD
 O3fMxmbz0ctfAxdCmZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> index 4c2730b34cd1d..1a2f0cc9f8a03 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -960,6 +960,7 @@ replicator_out0: endpoint {
>  						remote-endpoint = <&etr_in>;
>  					};
>  				};
> +
>  				port@1 {
>  					reg = <1>;
>  					replicator_out1: endpoint {

P.S. ^^ we should also have a \n between the last property and the
following subnode

