Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482057;
	b=2K+TBIW+fAjFUWdkm925UmOqr/yoP1t+lSTeb8oEX+t0jIpMcjmzIvlhD3RVh/2e5beu
	 2WviH3tTyqkfL7TSbjnqF1EicVm5yhv0l7wh0DveXTgw+xVgvMVzXwHY/qlcUopD0dcz4
	 wKdjXJNuajU0M0IKnKEU/e1zF+ZuI3uM2LgG3VHSAH/IpwyTi+Z2N7AUNm6rVjT99WTlV
	 izd+rZ0K1rcT0ZnSdsu/8CSB89/yWEU792XFu2nUkE6xS4Eu5r54S5DZQHAGwWgplodNF
	 tXOdBg24nL7ztH4MEJOXPX5umSZMIOqDqdCH8Aod5z6b3xRQ+korCE7wWYsgSkurCwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hy4W6mMhOKdF/nbRv32rjMZMzD9lBQeunFVQ1Fygj/8=;
	b=ERwckrk9Bg5hzoqivC3ZoEXBnP+tkTxZta2qTp/o7CN4pbwFh6/bFtwrCPAMjgXaQcwZ
	 wGG6cUawNfrXpxNYE1kOkzTRw1hOC0SGdJEFRSwzTdoCD3qJHRBu/J/M2h7QqM3tGBeEm
	 xmKJ3sF01nWgUr0KTeQNtfNdvZlXX1tg/FJMAM5q5LQHw+8c674YFPRs0PI3KcF6BTTj0
	 bVhrUBpDD8GeFqK3WtQw13QMj+RYxvNKoI6sniiPtX9ZR97h5FlGG//TkGBwqjnfG2R8q
	 thLrWILd5t67eHPwUVqX/4paLE8Gmc7Fa8vFIAjVEqbbDoihK4JTkVil3S/BCJZsOqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqdI2ViU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="II+s4/OT";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D29606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D29606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GqdI2ViU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=II+s4/OT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tPD81211286
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hy4W6mMhOKdF/nbRv32rjMZMzD9lBQeunFVQ1Fygj/8=; b=GqdI2ViUBphwRsIq
	LJdO7tVHBBCXtj+kZrsG8IxGgvJBUUgDo+fB9cNCo8JchN1seaMleSoNtvqW/HjO
	dWo12bzQitn7JoVFBLDFARms+8FnK2ijKgQ9IpyrmGE8nQjprv3KBAnsk5fk987J
	lGGGxTcVmlLDiWA55N1cDu2m665VU8OBWtdPg7GYLXL2f/lWPNxRhNts/JwDt8th
	Rs6sUvvDWx7OB5JvSBErZ23z85H+73cKKLDZzmOg5OfDI+gyCCP5QCp3xRcuDgRn
	uw4C9+lneT2f0jQA9NmPVRnyZJyZW84VpsKMdpxc9d5M/rdbdzePpOGyhzWkDQS1
	eYjMgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1e8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:40:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac5877bso56173485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482055; x=1793086855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hy4W6mMhOKdF/nbRv32rjMZMzD9lBQeunFVQ1Fygj/8=;
        b=II+s4/OTaH/Fl+iViWfkTJWFnHrWfqJpEg4nEfQ8Q94+8eZwMuiR466bWjPmgG45YN
         PaZjGJlm4JCT1PYLFvKwcgJCUUyj34ZnP48i5JpjRebLk+phDGptzFqjmiU5ndBp9ZdK
         tX61Yg209vB3QBejtA86v82MOp9Cpqi474ielILquzG7ajojq2fkSosLxUrFelcpzng3
         WEUe3zrfRB9zBe5u/prIaz7rNxtMu48T93FZGsFyjW/5TZ689PAZ95DdGfjCtM5V6RHg
         d2W2JQBsh11oWX0jifpKLO0AfjBVVbODlPnz3dQOGGLAFMBjqE1Hdosv5Ms9D2dMEKiq
         kJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482055; x=1793086855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hy4W6mMhOKdF/nbRv32rjMZMzD9lBQeunFVQ1Fygj/8=;
        b=0SjYchWZ9eTYSei8cBvjaF8JuZYMD2kNYm+OOPk21H6pUT2r7X/jNIL39ZS0EFKdX6
         CkXvZ0N2+Cb88OPwZbnTCPC5nv7PO4rrnR4O9KeegZRkA2exSwuhCqOfDVXmkTrEgow4
         lNpMgUiFbrXi1lSRSh/eXXEfywY6+Wd+LklxiGM1tVlRm3CPvyV6ZTF15YpZ2NhEAqDm
         +zk8vKoSEGXqIQnFCxr0c0IM1Ud0WOWiyE2c+aIASx2a4PCTYO92wz47PqczQf37MX2z
         0VrqzrERZjhq/njijKXmMR3/WdGqaJDwgWLzk0s0zQu+972/TSae4HLyXMnGQFh34YlP
         VgGQ==
X-Gm-Message-State: AFq9FYKFjf/RrIVmy9VWLpdt34MmvyAVK+aevo1rmDEJsajJTA/4713a
	av8OZV3/8Qfv6p5OHSugY9Oh2tP4ifacGbnIu2IWPIRR/Y0vpXjkM9f6H7+me+t3tZuzqrV4sFQ
	pGDJ8ONWJi3t5WfVZckVLYd9LBypM0yTaXK2ZdQDxsp5bPouFbqNv0Nu2sukuwQwF9c9e
X-Gm-Gg: AYBFou3IltrX+/9E9+Dz5f1lcc+Vwwdnt1/PWcHKsFVB2ZXK7ibIB7To0ubUzi8Xrf2
	vmHdcUxUboIlKIOz61rHzMGF8gj4UD6NXUrK4byjx/BzeLzDiuWveLJcsd2G+ltr9BLrdgvNe89
	aLPWb1Rmv0mktCaPKx58sXaKjEQwMP4zx4lMBag7hN5uUMoTXNpwWlbg1Ecfdc/HjyuBhCovXa+
	sxOTaa7TPBGeFg2IVDFNmhIP+oI2ST3kF9Gdy7wz30dpTycjs8C007DadVuNoglFqBa0v49539A
	qeOA9zRZpmdQcdzLpR0BWIMhS9r7/mmVMaRFEt9mJsJNZBtO+qPzjkMVC5nYNH/pYMwePiqlinh
	NNBZgnYlt//fyHvjIv+FAnA==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1773168885a.6.1792482055304;
        Tue, 20 Oct 2026 00:40:55 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1773166985a.6.1792482054808;
        Tue, 20 Oct 2026 00:40:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c42a3f4eaa0sm287773166b.0.2026.10.20.00.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:40:53 -0700 (PDT)
Message-ID: <bcdc5f69-bce4-424e-b498-893a95f3cdc6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:40:51 +0200
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
Subject: Re: [PATCH 2/3] arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: add
 'qcom,ipq0518' compatible
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
 <20261007-tplink-ax55-v1-ipq0518-v1-2-0ef058756596@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-2-0ef058756596@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4A7ljEWHxi51764zh2OpqYH0nJeOzsk3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXwHfEVmjoxMmL
 tDEa/lkIYjhv1KnltjVy+yGIDFBwvvOYVbazwYErJYh0cGvPOB0D0saCQ6L6BMU+qTJ5j9H5tt/
 yL6fhDfE/wzx3v14e7xWA0BCQ/NgeXk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX5IAN3c6rztxJ
 QfalnMFjdu/GNsR/3+/6+nJg79ANw1UxcV14Jn7Tf7ejE3UUUhh8gnGGpz2skwLfohJEkaC0Mj8
 lxU/Y/1A+tU5jBL1lLNUlzij8B8s7ik3cY9kGkXlaPfbv6W0vun9NLHbkGVvMh1FeauE/JkfTUx
 dc2CTyQdYOxnx08TF9PbYF2Ck0hGVp9BDYafkUMw/zWfezikYzBOu8XS8h0XpuA9y8t+M8lYo0+
 YHnrg2J2m+H0f1UKZ9TucYI9KklhLNcWvWr26NkHn7gUhgz5vLK4yyA8AeNL3z+2q4A/pVgoPRS
 pNj7BvUvvUJA47Wyy3pvMrMOXQqbFyHWRdGWvE0A5U931UBiievzX6lOWC3sLCcAjbXGs+404zB
 KMCAZgNzQukYINVPrRTxn9rZbTTe4wQ0cZTg19GC/E5/fPOBR4Bijo7yDMA6UnprhRBcERvqqfu
 QKwYcgVOklk8pPbGY0A==
X-Proofpoint-GUID: 4A7ljEWHxi51764zh2OpqYH0nJeOzsk3
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad71b08 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GWSpooEIi9OgKuXyjjUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200030

On 10/7/26 6:59 PM, Gabor Juhos wrote:
> The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC, so add a
> new 'qcom,ipq0518' compatible string to the board dts file.
> 
> Since the SoC is a trimmed down version of IPQ5018, keep the 'qcom,ipq5018'
> compatible string as a fallback.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

The naming is really confusing indeed

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
