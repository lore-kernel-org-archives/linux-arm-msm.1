Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F83A4513
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047794; cv=none; b=ScC+/52RKdlSN3UFdhwxNW7355IStqrx1yFdV5nzRE2yxOLc6nBoPWrMWFJzbcnUgrIcq0Pa2pBKyJdEg2rQua0z+bFTuSsdA9H3xqeyl2yUvsve9fOOYRJ1ln5JrWO9axajnvV+tmOu+ClsxfjL77xmzDxyFxJ5h/xvoTLBf+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047794; c=relaxed/simple;
	bh=IXR9wGNx7CzokaRE34xfRHOOYI4ya6dNRV42KZaq90g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuGjyldTpZyQJGAXRTCxpctpT+dnuRchzpD2WpcnB8h4mN6fsFWB0gr4G0x2HjymWBFkho9CwhmUHq6BXtTzw32pXGUm8WpAVba3DKUfCsWOkEsK8QT/8SwKqzYaVZpY0KSwWi9wk8X6n6w8hlqLwcx+V9Vf5bh+ajh1XsoDwf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHrkjbwJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdGj69xr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHrkjbwJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DdGj69xr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M1At972173114
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qZJWFTWzFMs7KDBz2CdtOMeCpgViM/RneB5GO+CAeiI=; b=VHrkjbwJ8pRjGR9F
	SZ4gY+9s6guu85svjYcm0Sm9500Ltu2p4af7Yy0/FM77L4lDGunxrS7jp4b+2OkR
	sMgzXf8UtFZiUq8WN0T0kGR3ggJ2liS+VVVp1fqQhHjeqvdbtLXaQjvIQlBEwA7+
	IZLNIboyF5NSejbSuBd+NXoeAs0Cd+8m/Fsl9zL+B1Ud7PpHK1gAf8Pt25M/4jwT
	m8/bf8fPO9E+jzuBWVDOXui+AoniQu8G/H4SrqhFtDE3FLGhZ956bl4WWatrP/j4
	HWiM5LRRB2g6uP1WMkJiHI8qQbXtHkUFtgBLUOphVIO0u2k41sX4SJXxh8r7RurJ
	NLAg2Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsq8dsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:29:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so4881939a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 20:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790047791; x=1790652591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZJWFTWzFMs7KDBz2CdtOMeCpgViM/RneB5GO+CAeiI=;
        b=DdGj69xrdxtilFMFN2C5xOGoWi0o335tuCXGXAA6C2osiwOh3WQ86JEXDGc7O6X+FK
         i5It13ErxX6o+HfaR78RgbZ9FTJMfelL+95jVKEgSOfWVMdM0/1x0GQd72GKpd57d7xB
         H6t7Vqy/LNO0bxAbQW7eONTSZCwtQessu5so1lZYERlD7jqZ2GKp4M3Zdfn/fxVEVaUB
         P5QGKc+XCuBdDF6AnY5ufYv2wC2u0r0DZ/nDBtP8K9k7mwN48K4eoe2zY3Gb6TNGlqtV
         2Gsq1mqSlse/6RGBMIXtFiXy48IRHN+Crk/PvesJ4KP4Lw1WKCLBzqYfQXvEh2V1nXiW
         uTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047791; x=1790652591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZJWFTWzFMs7KDBz2CdtOMeCpgViM/RneB5GO+CAeiI=;
        b=S0ZBRAmvMbWShwd/YthfTaSseZeDQXvUDxvniVcSVBuXepGsGvdE0Ls98vK3iTZVLf
         Nl6Td5BzZeoNTmRJLV8DWVtL6YpVbSxDEyGLfOwVRYlsrRbKxNBMuavSuj99S1aWJlV9
         ISRB7LkyDK92oxBB/VZ20v6XdeMoXmTzmzgcJ6OjkQ56ftzxnHwjToUWh2dkpcfaxj81
         ErkKzvhMurlXB9lzR+MaLbWO3OWNXTCkQOFc3oxwPyvBR7yqj4HZsEX0s6XSJOQRuqcM
         PeuFspI3SCqDh0OUm7tFZ/im/J5/5URcZEGy653V2wvUCHkfRHWj8viQSgO9n763iCpV
         yPdQ==
X-Gm-Message-State: AFuF++m8Im/28apU0Zj2qMEcK19oxubEqCJdOTUlt5e5iscrPwGtfFix
	nFhBz2SMNGtNszn1T48js9gbN3vVjp5w2FP1CifL6bUFFsbmql+ApfTBPo+5t+0auFNfoxsfvqJ
	+1ZNV2hyQM8WdHnnUi/GyiTMQGEoyXlEgRrylXYJvP5uIvmq7eGIPDHp9YIk/pGwkKAQx
X-Gm-Gg: AYBFou3v+IV10+CdiK/E8KxnaamsVnm/cRBLqxYMVoywe0I1VB6oxuA0N2eNwy6RVZZ
	C6/MkRTxS4Np417rrDXVFn/lDUFyXbSJv9WREE8m/hCLa5M7zNE054mtDW9zP3q0rVJgdmfk91L
	PwgIN5uRIfeKvhFHZ2JXeHru9AgeOs2iv+6v0HMeXiELBgAGNaa0yn2Kr8sMWInKKn87VNLfbZh
	DbpRktskLSoo8QogyeuNQI45UOcbCQQhpuq7GnOAQsnn9Kp8lcGorrVjkC/luNUapxfer+qtzvw
	djwluouWuCpYbk4uMac71IB343O7My8EJosmgrLcGevT6DSmOrVQO9C6szrUDG8CQZuAWDOGpMC
	N/F1/+fcuPqkY2B37tkxrEvIG5V4sxsbuFMI=
X-Received: by 2002:a17:90b:5408:b0:39e:6a80:dd9c with SMTP id 98e67ed59e1d1-39e6a810c1fmr12613883a91.35.1790047790676;
        Mon, 21 Sep 2026 20:29:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5408:b0:39e:6a80:dd9c with SMTP id 98e67ed59e1d1-39e6a810c1fmr12613866a91.35.1790047790232;
        Mon, 21 Sep 2026 20:29:50 -0700 (PDT)
Received: from [192.168.0.106] ([49.205.116.211])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29dc903sm1198945c88.3.2026.09.21.20.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 20:29:49 -0700 (PDT)
Message-ID: <2e4ab098-e656-48e9-a4de-b67eb44b9941@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 08:59:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: qcom: Add QAIF AIF MI2S and TDM DAI support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 48cnOqxO8iNzXd0Xi7NnwPsiG8G2Mfnc
X-Proofpoint-GUID: 48cnOqxO8iNzXd0Xi7NnwPsiG8G2Mfnc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA0NyBTYWx0ZWRfXyeQAya06+WCv
 auTfr3qsFV/8Y1WInjpFMAu8Usmv2CFOapNECG38zl1trZ3Yi8o1LfMrBPaGyZIO1ivqFic69Nf
 zVEBUvaK4dG5rXw9QcQFEY4bzG+2GKE=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab1f62f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=2ngnHYY/h7Qxskz9zhV0NA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PKOAMDuyrTqzGgetilwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA0NyBTYWx0ZWRfX/uRW9C+Sf9eN
 tJRXGPYAMKr5a1PC+wkcSWoYdUH0A1jJb8SM1Q0mlY7WY1qAp2k1OxaPxJUJQSp7JaG92hgzafR
 e03sCTXzcw58+9EF6hDJXoe/cEd/1bdRdtA+BV0mwCjAK61e+6/2sWrEcaPXSU8UhWCg8BG9DL9
 Lpadqhs9CYQqexU5VPTXtJ1Wk9vkMW6yG0l1Hua+vNnoJDdq+EzKJhpeLKBAy0e0w6fcxc3fZAt
 jK19OBkpir6u0dzt7aTjzZPHaHWLVhyaNgcE9rfvZWLMJowQGwH+eRDQW6oPuxyCOxGy/v/H3RN
 kaJ6tY/fSmdHKy8SLMpoTId3FBOON3a7X/RlGzvIkCtNQdGiKBFqCMxmni5M6cTkzg7PYErJ0dn
 7MrMNdCOre5ROQam2Bst6ibB9NveIR96YaxZTX2nX026mDP4i6dmXmUwDEzHFSfHt6v2CwynHKT
 iM8R3LBfnzjEC5gKezA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220047


On 9/18/2026 7:01 PM, Mohammad Rafi Shaik wrote:
> Add support for Qualcomm Audio Interface (QAIF) AIF MI2S and TDM DAI
> id's across the Qualcomm audio stack.
>
> The new DAI IDs are required for platforms such as Shikra, Hawi, and Nord,
> where QAIF audio interfaces are used to connect external audio devices.
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Thanks for the Patch, Rafi.
Tested on Hawi and Maili WSA885x speaker amp setups with the new AIF DAI 
IDs. Working as expected.

LGTM,

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

>
>
