Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF793F5BDB
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373653; cv=none; b=fe62RQsylc5quoaYl6RctnLy438xjytXMpNJS+3tnOtVTOYMlcPKrqxx41EyCax37pfaXeYJuIRyK55yG9xgJOKGXK4Ckkfiy32vaZigC3H6Nxafl+pJkeNcFzWQGtBWhhfC/+roGz563p3pw2Xe4u8bgK0il0voxgvguL/Xwm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373653; c=relaxed/simple;
	bh=y5T/F7vrssXPrR0h8cK35gqPOkp5meOnh4qAw5/OTjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sB01xO/AlVXqAeCtJBc5cpl0QSM1BIp5VnrTTIhoGUGfz++2xZaQf9IDizuVnAK4++iukyMTjBL3bR1Xi058pzWMhChJ9AXSUWxCpraqPkRqFDGDXCv9zYbBxLdNixZmqsmGVFTn142cDb5oewSCqxKXBJ3re4fcyo6iUZmANT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dU8XY3+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3GAlXY6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dU8XY3+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3GAlXY6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j4iB063677
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6slG+PlxKqF6Q98TkEjyPj1ZH9nSMFFefO7QrlI6Ul4=; b=dU8XY3+QUzdnFCrd
	XDVzW3ItUiB9RsOrZ1WDsqBO+rh3UuBRdhGY4dFeIMNuHRB09bsT4yKHg7d8mH8S
	IoP0yKe1QhHTyvix+X11/IER18drswGDVcvqUbVvripoKm9ZinF0yBivsBCEWiAZ
	AL8+ZjQtIAQ8CaSCsy8SuJJAW9nr5Fp7SHjWqcTwhvR9ZzNDL7fMDgedMZQhXuq9
	B2eRh+4wMsEEBqyWOvbwsGAtmrUrotF4CtH54lTFnze6FiJ4b311mAtecjYH+kBi
	zSOqCJJfJ/U5F0ddYyuDhab+OIG+TYwoChMyXSptzZz5yyc2zAOKftXoVnuotxzk
	xTUAlQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnqu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:14:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so49424785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789373650; x=1789978450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6slG+PlxKqF6Q98TkEjyPj1ZH9nSMFFefO7QrlI6Ul4=;
        b=I3GAlXY6wNO/BgyN4pwc4RUxIfdtL2+QS358yxYJsApJYVAraFGJKbg31zh3dfBxOQ
         PUweok5Nfor3SJ3vEHADviuRDA2va04cWpbSHuBB2qIlzgRLc+rXtUZeIa21qN+SS7f5
         iqJzf2wuVEE4f9EjOH2pQVk/dBjSs2l31QhIF8cYBDH8uZEsDKhp0VnVOrVKkIpZdS1s
         StjN+HzBqj4Tj4feWeffdiJOeLANsLWh5aOUlEZW+lYJjXnUmE5GR9NEp3SV3wp0+7DK
         zlifTC5Ut0SKlvfHzRr+5HH8bibuUdhf7bFPNfQhx0nAJQaqQPAVl2DFGIVUCPu/H98H
         HErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373650; x=1789978450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6slG+PlxKqF6Q98TkEjyPj1ZH9nSMFFefO7QrlI6Ul4=;
        b=gdmD9Do1Sh6Vn1eljN8Bp0YA0Xulhfzj2X8rtzjRrrT5rv5BrKWTJvNwRHDFdiqDfT
         8NObknjtUrH/XbTCQJOxNXyBVVx7b6y5ZooC7JsoOI/E6CjjrJjepneRTk9y8e6AalSb
         MdU6GDdQZfOmMhbDykceTvdUeHgY6bXRhW/J1OUcH9D/JtxVRbR/s3otOrJqQs30pygS
         pMELb0DtbrENlB2k67jDLKN+k+YzAeJ/aq9I9ihVgksk5Hlc6nKDwzzWGTkFqvTvoj0h
         DkVoji2zteqdNTeuEXjL1EJgHUPSMdZnAYxXZ5ggwnr6M8P6h8UeCdL1ofyWdrs7rtch
         V80Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyoG0uOhEZP9vPq7UKmrmXduoCHkm52WCFSUXIbTTeye/qKtteV3pp5cHtAj3ok9Mnjt8jZRNyKHhQjg2s@vger.kernel.org
X-Gm-Message-State: AFuF++kB0NwH0Kj1zplQw2/9vAi24Gx1xVJQzloFqMyLCwHMqSaX8Fcl
	h8sBC9OC5+URNdqru1IKWsfZwS8nnvYv6MuGWbk64w8fOdVbvuWMA4JGEXDtflcnKWHk/aIVVrE
	5YmU4vOYiDF+5uzL8vxXS4UgTwsNKpfWOqahj85zI+o7fVhY0Tx/EmWPjt5MgtIz8YxX4
X-Gm-Gg: AYBFou3DSBcCT0riDtgHwPxCQ8M2R/3SaUivg9k44MAKCudFFnndtyWXba98TlWtVxt
	oO1UiVlvXyO7g7gNaRZeaiqiNaRLxC0EB2GfBjIuHqfXYMMPl+tbpwHo2R12+VJzMKg6dmthAkk
	nEeYKLqybTJHE4jQc28PvoBHrO2zaocPdGxJfEDHAtYow2ARAim0896iw2pFojzBnbxrjAsuzkO
	ttTamOI98+1HLpoI1wUf85lD0UFL8ijK4Z7L9PWUjxxyOYl0k/G52HvhytyOG/qw+pms6ULC8GA
	Eyw/9qQaKq14tGOWRdv2j6IlHOvJaVTI6zwSxxTDMjxiBOl/VzpKaWl+Oe9x6YTy6NWF29DHELe
	UmzasfcI4jdewmzLjqMQ0Cw==
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr167361885a.5.1789373647858;
        Mon, 14 Sep 2026 01:14:07 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr167359285a.5.1789373647409;
        Mon, 14 Sep 2026 01:14:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e1ffsm376092166b.7.2026.09.14.01.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:14:06 -0700 (PDT)
Message-ID: <a66a9afe-f649-44f8-ab13-06455f95ccec@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:14:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Correct inconsistent indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExNiBTYWx0ZWRfXygfWZh8LfLZl
 T0z78kjUdArfaxTnHEFKIqSbwmv25XiQcAsXVtKe8t8Js5oo7Dc6j/a4GnT4Uq3TaQQH59QzSTj
 uitkSoVlB6/LoiXkM3Nhm0WbQlHLmt2VsIIwuKof+N472bMuSwPiozGpMJvSP9FMlGb49ypo8Y9
 vboKXRvPeWoI/nSDxMSZCSm6VUELgOHxXvn7DEEMDj+aoBkhkkETwnatkemp8kVoFnCbAdxW7ez
 /RurFO+SAcNIxggoGcEE5O5fAiTTbVUVdW2qulQuwXTaOk3lfOpbkrQpByOtQEG3YLqbizjyHbb
 pbkN1oMZU1bL2XnzXtcnvW25+3a0pBt1wFLUG6HbuWo07pDuFcz4BXPM+qKhLt/OdlfE4kpUePG
 GRTL8/H1a0o6mMGfPI65SQ58srdnL2U5paXIFk5Cl1TNao1Sb5Rkvrg5OcncGOUbMOeZ81lp+tN
 rA5lSd6DmWgX6zLWKeA==
X-Proofpoint-ORIG-GUID: IhPjNQO87dO09vaFpxc1pEPYnza556g7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExNiBTYWx0ZWRfX/eTq4mxp0HyM
 VaZd5+9iuQ3ERtZt9ual/dKTrydAptgMNf0N3GigcOLs4g733coQbgXBfEtjlVxT+LTHkBOWi3L
 xNNZfXNTlcefPziTjuA4gKQuJQaPqsI=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7acd2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tPLuR_csD6jfBswSsDEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: IhPjNQO87dO09vaFpxc1pEPYnza556g7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140116

On 9/13/26 4:14 PM, Krzysztof Kozlowski wrote:
> Fixup mis-indentation, e.g. spaces or tabs mixed with spaces, to fix
> dt-check-style warnings like:
> 
>   talos-evk.dts:39: [indent-consistent] indent mismatch (expected depth 4 * '\t')
> 
> No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
