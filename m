Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63EB51DAEA
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902582; cv=none; b=Kt+DVx7R04Zpwaj5b5x775mpP3RTOr2N4RdoCF0Q38J6htfqy8WGkdxhu58cCSV6p1LfA1rDjrSxvBjdsBx7feO0CQWtbhV9IXquSL7gQGSfTD0ddTjBwXsb3UNTKu/T5tYCz0QqEy3VGVTNkWuOrkhOi5sDU5bhL7wc9dkWfpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902582; c=relaxed/simple;
	bh=nJihTvkKW/jjyq9FDC5njYiM5VHlRg6tH7LUP9HrO1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZV2L85rhUe0qGStJsj0FekBbkJmfYs3lego5Nyurjlm1IpUZZc2MFZYbJZk9TgFDzB/cv+rGbLVsL31J0gkEUOnUklJVAg1jo1UGzuBlN8FZZDgYT8nk8uKT1BBSw5bwlWIwA9RTQv+5DAcDghpKhNWcrLIj/IA9VVsx3pINrdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhVsVR76; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYrRN1Ux; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhVsVR76";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYrRN1Ux"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE40l41492138
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkHu4wTimsYHH73cELX+ahkGCMN5v288obw2pjrFEcQ=; b=BhVsVR76itck0D3z
	zg5QPmRmTmTshnVrtAy3gUypdrbPrRbE8opK5kfXg173xKSMZjBmX5h3XlasoTKe
	WBCAx6+Fn7xz/IKL5I0X5EntGwE+mITdDgaFAO2+vnXlRSERTYXbY5k8dlYaUEGL
	1AV6rBZG1dAZN9NUvpVbTBcbCcC5hfHe6Jr+QNG4MPe33R/YZ07oJhLOWUHe6S0Z
	7onQOckA4TbnYyW7YP5yoKFR59O7d4alksWf9l/VNSVURANpifW86OXdP1OdYV8P
	0CDHXnifePpnH1nC4eBY4T5CbY2VI1NCH8+r/mriwmPRmc+JqIO2VsOj5QOsKRJH
	f7ulKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqthsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:43:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bf3eeb42cso23565285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902579; x=1792507379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkHu4wTimsYHH73cELX+ahkGCMN5v288obw2pjrFEcQ=;
        b=CYrRN1UxNVjOJzrltHuRDmJbrMlT8O8FJsAokPVtz+XYzVP2/A5YsMXR8ojja6ZlmM
         T+JAp3LAnJgFIluRAMXB/wrIYT3aVnTVbRlRCkPxd6UFrJSZmeBHAy/kgKscMDAUsnPo
         DggqCGBAGb4Ck3r7IrJRuIJtg1CAfXStqjmhdeBM+7j/riCKlwM+L2qR+jwnt+1Cqdac
         FuP70IL54MBKHaYRNZIPWx+mmQ4iqkTkT0n6kLKGhteYTZwPm8vmNQKlI6LacA9gzB/n
         YSpPRVPLO8JmSKNbrJRzNOpzsimuxUVlqWsgNCnNBZy5rVTKv7jQLRsMq2NCK69NlIuf
         ybBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902579; x=1792507379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkHu4wTimsYHH73cELX+ahkGCMN5v288obw2pjrFEcQ=;
        b=WQXNcmMTvFfzfgAlGqKcF9V9jDnsJYctrwXzL0DJK8/Jlf4MxF1LClN5wtnBv5Jo4F
         7IMtUsIf+MOQMLT5Zwh9sErZk4yUvKWck3SYwU4p6W3yFrgLkKIfAv9tGMu1oy31cGNw
         MW74ApfWE/DNketakork+S5K1DTXh04tqRfJ7SLtj07Qen/fNRAskGCxeA4orz8iItvE
         3R86CKKnXeKoxFgCG/e49/xFPb7h+rH3+t/iqZQ4B1im7ez6X66HF/3X02ur6H8Wyd7A
         2iG93elGeVq4aqVv66hmYpPvYOVpoXSg2DncQveBPR4kSVLE3XaH7xYl277JzTai0OPm
         bFRw==
X-Gm-Message-State: AFq9FYKdZ32kDfu5F4hAuSc9kJ3AlVz+xBidEbwvrCB6QEbEF2UpoQmP
	R11bsjPkE5MEP5miEAa9Y9chLru+DpfAXa1D+qUTjkML04mPxzgSg+ruIwmuxrZMaeAaAHo5/Cu
	2O2Sc6cmjpm2Jo1Eb8iU/PwcDXODKy/d9VMgYXEUPOAGYkFWNnOwRAmHgm7yyPNMHvogE
X-Gm-Gg: AYBFou0cK1k3fYrKP/ynYe2DreJaUnRPspcUJrOR5wQk3lymyLX+uEsiMnYdxn8j6wl
	OZk5ULyJjq6CSwSoKRfui8Cx2xVxdVGeBJdJkZxba+45htIKPD8Y2TzM2P949rQaZRaaxN4O9bk
	QperuQ00XX1eFvxrkMxQrh9q40Q2cRL301/NAvvxQRSAXfEqc/30ETVdoZrbMDLgHawtxG3kRUn
	HeEmrp0G4D/ofWxUaaMLXGHFWOM0wTy7BrMDpBJjF0ZOJtF1TXA3BuW66JUkgDyPj8SePO0BMyu
	xlY9+XmjVWs4QameBzMu+uvnalWqgkiS2IVslyMTiLRg1z5YS1Sk/GKM9V5Fg6EOLYTHfpx1sqL
	6Nd2MVnROqx5yNqDgtGsEuQ==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2186833185a.0.1791902579058;
        Tue, 13 Oct 2026 07:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2186829885a.0.1791902578567;
        Tue, 13 Oct 2026 07:42:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9764cc9sm608540966b.10.2026.10.13.07.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:42:57 -0700 (PDT)
Message-ID: <591af0a5-ff8f-469d-b7e9-7e0d72b03ff0@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:42:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-5-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-5-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q5PlCa35hConxlNXi0-0d9sJs9gRlVrg
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace4374 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kLrOTjvlBrV8dJFV1dcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX85b3tleTZzmK
 v+bynGk7Dv7wpSTaGEeZ7/2GTP0efAqg1eVrbhKWOZ06RmmRb6YgM8h8YVSJglrGZp+ZoGTxalc
 xJ2dkajn7DTh4n9hZ2MrKaEMsANaWgQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX7YaEOUfNDQBW
 pZUK7pl9mmDHSMpbGlf0w5CJT1Ov2LeJMlABzk1N9TF+1puvt6Jz/eWyMQvlMiKXQOy7gUR3irX
 Sb1kuEOgo2XGdFxqBjYEOKPpCfWhqfvVxGY2kHloWOMAHwsKdRKFfJTqnHhH4LoJJkfFk81Fg3H
 97/0oy8KXuCUziiBilboblynEJW/7wd5veKWXmCXkxdjUSRCF/1Do5TezvKwdX0FLwXrS5i0Np1
 pEd6gyshlhYKGkIfgpfwAk+Agts3JoFVPDD2xr8FL+rxvzfXWwKV3yeNsf9wUGZ/B6mex5xyo9q
 YJkJ6EQFCngp++bH8dZkdP6Y6/via2mi63wQ8ZJJfMZZMIn38/eecrnXG8sVs30RRNQyLdlKaP7
 bq5bSUW/FrUlwM28Cr7ha3UeCMmipNeiq74FvYkchV3Is6pCP6Le5Gdar8+Me6JsUqoaAzLv26s
 zikfabpA9hcVyXLc1Ew==
X-Proofpoint-ORIG-GUID: Q5PlCa35hConxlNXi0-0d9sJs9gRlVrg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
> all CPU nodes.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

[...]

> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_sleep_0: cpu-sleep-c3 { /* C3 */

Let's drop this comment and rename the node to cpu-sleep-0

Konrad
