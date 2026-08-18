Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148A037CD53
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054048; cv=none; b=Xtd+dynQyl/9SlxFjQS4srtppQGfU3C9WK8ORd6fsvH7GbNIa+kP6G4iPjf8MMONW1tgR+IC7tdJz1C4ZuR+yKjvdAqB3K4ypRneUIJF4h8uYcEOJ8NghNI2oY5YpHX5aI+ejn831iGaG9cHGv7E/Tx645PHaPGvjCUUUJ5BVaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054048; c=relaxed/simple;
	bh=Gm83kI5+Or8ic2NrERuV7cshEDLlCX1xEvN2n8lP8uY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHccvRv/YRHYZzHHaskeDOE3vbJuZkEgUTQ6P3utLHg0melRyOmYtb/9A+hrfS73gpWgJ6bU99bl8UXrCCxPR92BCcsKVv5akWvGQ4+RzJyiZl2qovfwhUnZGzpw9N4cPumIPVt89hbufcq7VQZYyNVnHvKDq8Gsb83/FBj1LWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6socj6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCFnu964; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6socj6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCFnu964"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABZC63979097
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVfv3eOvsoBar4Xbl83OmRfJDnlf75LuYHs5lRGa9g4=; b=i6socj6pKFg9vdlu
	YK/Ak6hXxVF5qLE21dhFjKMV2cCCs6Dnyr8M0UJSK8REiBcSEzYKuaOuBz5jXzzd
	Ce1ttZfyE+9yLEvJRF7HxfFOxS1MpmHZvw0uYvRCNLeDt/pdufdhidApABHAfAb+
	gXvwX9nthW96Roa9Gog5I/MGIDrYS5DBIeCQ850pVTsQ1jLr33u74EFvNEoE6GxO
	0M/0QFoOsLvSbU86qcfZzoHk1eLKBUo+x3DjZQlhBe+xnvDcFGA5/C+fdZRE/T8A
	jzJCpbXqAEHgyP4SlQi9E82kH+cX5aO7YS7CjcLOZBPVwG012ZC9qSDS8JEExjQj
	U2CUgg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpt9s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:54:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso13011201cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787054045; x=1787658845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVfv3eOvsoBar4Xbl83OmRfJDnlf75LuYHs5lRGa9g4=;
        b=kCFnu964y6sE0XX8oCZFcUHXvXEUFRyomJwq94VPkZSULDBacZfy3yFDs93TUk682J
         z5z1yCrXEme4aCc9NOK+ALMhleZN0tSlxHBRDwUXaU1PATzmE9cSLp2zrliOrFmmO76J
         XA3zcdzgB6et5iN0JqjfuRiZEKEF1fJ//r2ZU6TX5wSVkqVOOGCfHcKdmnVUVK8JMNtn
         nTdN5UhnN9FdnotjqVNyg2/ruMk7hx9IcNLeopA/9MYEgLW3iXoOovGd33izcxqWDv9S
         NihCpUiK0x+gRQHhO895XUPL/43BC/B6e9Xn1t6xLmiBi0waekXLh76XtQKOtsA34wro
         RDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787054045; x=1787658845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVfv3eOvsoBar4Xbl83OmRfJDnlf75LuYHs5lRGa9g4=;
        b=tUz30Cp3aFwQLJVsFRu3H0PAQTK9DCX2KFU3B0mU0ynrIFLvO+/U6NYFOO/+LWmNIm
         hFW8eyA3gAdGkQoJDvzotONz7r3SklL6Mo7KOmzRHhwcJQNmbvc5fdRYAFuDh7TutrrW
         R7pgxW3hipy9FP8D/APRPt/9R1bj8vGBpwufIEguaDYk3gbZgc3YJuhnR9b4Ea1ZVhyW
         9Cld1m3aQKg0uRJOnSJrgEtuO+oYvLW7d/Ca5NeKGzMnZNlyRkCPRIYK5RGKdCoyhUmv
         tMhu1E5y9bbUacQG5Ym78jM65VKfh2JFfUHSnxmiP3K5iOOP9G94YWJGF9FiOBtQbmou
         WNMA==
X-Gm-Message-State: AOJu0Yynt/miJnshRwh8dnD2v3NHuIdYepY0c6/XiMi4ypg4NYvLApJ7
	eiftUY9yWzOuR3Q899hEcgftLFrRUSMGOmBDbksy+C7DGygD9x9nI27W2rc5f3+xYNoUpurfyfu
	hwiK4jtLXEfgo7aS+MK7HSYKkwjBqK47lNU4ynDr5n1ZzOZukt7FxLW5Nt7Q9Aswq/QF9
X-Gm-Gg: AR+sD12hEjXlRg8RUxk5Fd+sP6fp4FyPpzrAhiDE0UHszSGa9TWVcgJ/QI6Uqv3VWWR
	8oDkLZAOL4eczKa+Vl0O+BEZZ/7Cesob/OhmTYNXDg/N4HwvIMvLZTDExcrOfaUCBJcFmKfKKtR
	yHoyRpVSSSGUl/CCBizgCmjQ+rnqdkuT/6iOZiAkyjipxY4nycYYzIoLbV4gfTF5RFgc/NIna4D
	QrghJA9z0EQJar94CBJc+eTHnwOYFFndawhYTGH9xiOuryOfAN9cTDy35ahp9aYq27nC6Md0Noe
	vAQ1KXgEA8yWAf4qKZ7J/6fh3Ka+ERBN6Eu9rb9gMjf4gefzqKqxW4jOC4x2tkETPMohJr5xB1o
	YmQqUEyHT6TkRYZr07iZbGS8l
X-Received: by 2002:ac8:58c9:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52d85529b51mr241697451cf.5.1787054045217;
        Tue, 18 Aug 2026 04:54:05 -0700 (PDT)
X-Received: by 2002:ac8:58c9:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52d85529b51mr241697101cf.5.1787054044822;
        Tue, 18 Aug 2026 04:54:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea2cdcsm172531766b.18.2026.08.18.04.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:54:04 -0700 (PDT)
Message-ID: <9ded6077-559e-4a12-9ea1-3816d55ec00d@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:54:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] soc: qcom: rpmh-rsc: fix kernel-doc issues in
 rpmh-rsc.c
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260802-b4b4-rpmh-kdoc-v1-0-0f5026293d9a@oss.qualcomm.com>
 <20260802-b4b4-rpmh-kdoc-v1-3-0f5026293d9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802-b4b4-rpmh-kdoc-v1-3-0f5026293d9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BxVBKp6zqZfgXk6utEejj4tTVwpPMnBQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfXxZDrHf1MJ2mu
 kvIA5AvZRuo+YmYLcyihLivkv015hsqdV4XNUotUPtieSfTzeHzf8N/w7vCSTCkJR8u5bfcmmcl
 CvUxsrnAMf0B7XtnO4MkodIz03VhH1BJwgY9p6nu/P9/WmCy5NEgBTPL1On6uUsEK8Ki17xYHcG
 X9rfp3TmIAwO5U+Pe0GrbL7iXvhgPq1KHOQgBq0vbS5uGGzshh6C8n8A+ZV1G9+T9xpd6OZfFqr
 UuFgwOJA5ORyWo2smLqDBPLuh48NQI509d7F4UGdRl2yMLSrMIrs/4KZVNp2RwOO3EOC0ezDiDD
 IqzI0UDXBy5GHuwRVrFRQf3jik9Cg/EMjV2WfUyBj2kvfJ9T56Qsi8TibBZcFEjFwBLz4sSC9yl
 XFlud17MowUOlrYEd88JUh+xvVBalSnLTj+1MW6+1AMNDA3Q527cTa/rKWHL3/TG5H2S3hj+StE
 8A4w7TdLi2yA7qFyr6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfX/5visZ+yBVHh
 8K6kPpespYuqyluwPYcpfbSEUNPLtZW6yPFIyNkCRcW2D5htOsvs+ZN6ddDuyhc3Gw78rUWIRYF
 oUCILGkkkrLvf7NEkfhnD9k0XjYgNKE=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a8447de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0ebOOpqRR-hS9UzF32kA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: BxVBKp6zqZfgXk6utEejj4tTVwpPMnBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180087

On 8/2/26 3:28 PM, Maulik Shah wrote:
> Two documentation issues in rpmh-rsc.c:
> 
> - rpmh_rsc_pd_callback() has a copy-paste title 'Check if any of
>   the AMCs are busy' which describes rpmh_rsc_ctrlr_is_busy() not
>   this function. Fix the title to accurately describe what this
>   callback does: flush sleep/wake TCS data on PM domain power-off.
> 
> - rpmh_rsc_cpu_pm_callback() has the same copy-paste title 'Check
>   if any of the AMCs are busy'. Fix the title to accurately describe
>   what this callback does: flush sleep/wake TCS data when all CPUs
>   enter power down.
> 
> No functional impact.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
