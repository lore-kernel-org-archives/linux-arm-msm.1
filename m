Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260763C1961
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704403; cv=none; b=TFX1m9gCyNTmHxMnRNOciaDLj4OvYjEDi3+aVO2WF2ol6U2aB3W2aXyopEPlshC9J1Y0QXYPlycnKdQCPqH0UDA2dh4rvDZ/+F9FIxVILZT0n0YLKm0J/kmna6VZmR+VOQ/fu547imom1w/d+fe/VBiltTYOyxBaaGMw/0DsWmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704403; c=relaxed/simple;
	bh=ZnLV/a5hdCoNMYjPosDmeMWDt60E2q1AWPD8RW/wiVw=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=EcnoqcQ5qF/HVcWhVrfHhhlAKTapxSsOm2XZRjGAOxCaaZvuA7JC97rlWzjYWiajSLiCshVoWuHbsKR5KfulyxbfUVtdSiZeKSz3tZhzqehrPUOCx+zc7ygkXubCSyGLX3rm9d360/lDxDFG9tqg9HHvAIZxa7RSP5SK/4V3w8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDcb8XA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCrTncQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDcb8XA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YCrTncQk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53hVf3917561
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	csGFu5RbC9huQdbcAYKh5q0jdyq9oL2CD75umdOlyVI=; b=oDcb8XA5MEFXSY/L
	BF/mlYWwsiAyRycu48mvi2oln/tEwZVxo57vvl/5hthjsWEY+9PU9SYR1sMnR4F4
	dyqbxat7S+mKJFM2pJAY3oeWPDrmN+ASB+Xy354fOwLSbKr96J6FXCqjEaCd3lCa
	A/Ikz6HsUkkcL936MWH2Id4vWb1eqlJ6s/eygSV/Ajpnpji0xDffjSRhM/MP/Zha
	kg2s5XBYcrxcPCPKQp/vRYvXh/cSdfAfd6vqf4og47L6QTJpSur4s6sQ52W7+0Jy
	XLKSG8+Y8jXPO9eEHG6F4nD2jdCN2LS+jJUVcGcNzZHdYvNHn6WwWRMpjSEkIJYk
	CItDGw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6aapq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:13:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84857446424so22661320b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784704400; x=1785309200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=csGFu5RbC9huQdbcAYKh5q0jdyq9oL2CD75umdOlyVI=;
        b=YCrTncQklgUPYSJeNjGkP36YKpXZFk35Alj7uO3vTEnXr0tPpn71qePTFvEejzg8uK
         rbPFWQ2DGXoUYRbYfuGBHlRXdtXjPoBEeY8yXgJwTMUidtLHwJDXZPKg3O8lfTU5t17W
         WVB0wgGGDDUi9vJkZgP9BTeFwJ3QPWXqVQpQadRDXlT/A02gvUERtP6Rfw0dQc3cts4L
         HL3soNuznFs7rT26ZLpxBHcj6pVZkJDpAZRZ7LblomcZngI1Vcrs5HMhMoxp5AYyv6mn
         LtXO58LgthlfolvyUasW0ivI7J4kyo7rk45g+9oP+JGUYFSmOfr1cx8cGfp0mn4MM4lH
         LPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704400; x=1785309200;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csGFu5RbC9huQdbcAYKh5q0jdyq9oL2CD75umdOlyVI=;
        b=FA7RS7ag/1wk58UQNz1YbNwYDmEUbP7hNl1LLvKz6XV4JfvfHn9aFjYbcYRWR7a5NV
         0l7Znc9milN2J2LUTB0C3d2x4DvN8DqvoQilpseKg+1QbuiF8vqfObHcL4KUE585F79X
         n3LnOYwISpW8mWkuBOKfmPjkxJl54wi+OL3KelgUH3uR5v0Rd+pdMR9xZsGc2o72G3HK
         0cfJSD0HrUFfZRIMd4pCQXlfZ0HcPN7LIEZVzoPyH7OtoY+pA+K4qsrOP/CFpcIrGY6V
         D1UP0YBcjnH33DEsu7UdnR1dZdzqvwGc/Ii8hgYEMNRdR/+aDD5nIoaJgYmncD3HdKCE
         A82g==
X-Forwarded-Encrypted: i=1; AHgh+RoTdQ1g6vt4hDXqQr9tGQ07J1Z4fOjUMI0YEU5ZBeiA/KKC8rmPqmfMovaFT3NrHkfUUxBG8VKxxh+IZBrq@vger.kernel.org
X-Gm-Message-State: AOJu0YzUJdeNOsMdZ+x/qIRz94LcKqVZ1nGSmOznyv3ivRhFK9cH4bFm
	kTCoqhxXFQfzEI+Q3De8BEr2v7owphFmfsXcGqgmkvuOG+3ChmxUW8kzQhiLM+qUo/Y+6eD3PNb
	QM9AFtQMnW81TfvZo4RICDaorXi7l916SuPL0s+uITVPkUol+SMVA+fEoPBxkZqI3wnHj
X-Gm-Gg: AR+sD126aYf/pmVJSDX74QxZBl0vO2lXhDH12PKhThTJIG4IVaAROJWf0AbK2I2pZMI
	CSa3h3bLz/8T+B4p11qUH/vO8bSGr+zCtXv82VPQMmcu5L+4g5xmkrf44DhmPlapxgtWzIEodFu
	U9w4yb+wq4Oj54K/s+9+b8Bbq9TQ55pv6AiyMkCVACEQnIqd6qR8uBR9JrCnTddvY5IpRmH/N3G
	vrFkMa5YcRqOpguaoCfyi6n90dDzpURotv/H5amvmlJminkCjJxMoMwbsZL6n6cFR8raE8NegKc
	5EeZMWGMuwCLbA/utQyoAeZyMKiUlrkPMZtR/BmQFUI9EjRy98l7y9S0pxz2A71rGm/2HYlnYmj
	L8RN/Y1i0wOrtzkgLajxvA4lR6k0=
X-Received: by 2002:a05:6a00:18a0:b0:847:9bdb:2cd1 with SMTP id d2e1a72fcca58-84c294c0adfmr21781059b3a.54.1784704399781;
        Wed, 22 Jul 2026 00:13:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a0:b0:847:9bdb:2cd1 with SMTP id d2e1a72fcca58-84c294c0adfmr21781034b3a.54.1784704399345;
        Wed, 22 Jul 2026 00:13:19 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17573c0esm851062b3a.38.2026.07.22.00.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 00:13:19 -0700 (PDT)
Message-ID: <a5545d73-32c0-49d8-9601-1d2bf10d426e@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:13:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v15 1/8] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>
 <20260722-pristine-lemon-dugong-ec2c0e@quoll>
In-Reply-To: <20260722-pristine-lemon-dugong-ec2c0e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2NiBTYWx0ZWRfX+2CoZlgXN2Lc
 MBx2m1d/To9wPOq2IiOiy8MTkMhE50yB7PhJiMbIuVl0lDppEGSn47RqtE56L758PxfQzfV7J6A
 hnj1J0ssufBTkutRndBmbRzVd2YgKhrgH21fxWMYtM6iQtZR4Z1bnmQxGrvqX56bNF98VzypwqA
 lC6kCtQJKkJDVkSSCQ/AVODBnXJjtsXYQc2lZ8yh+dejQ02YVl1ilHN4Bl/ACcAb00ftBOT5Fln
 klt8Pa+xWBVMPONOZdSvrh7qLb7vvMIqGIZ8Qd0Dbk3brDoSBOiy5FRBDjNIxep9300HoFoMRwU
 JNjzIOycfV+hpWixypW4DTpdcGxspkM/TJKv8z9ckylTc7v5FRTooF5blpLaZoAYHAhYXYQuK2h
 NYssGFFDjZ5QfMrkwXS4Nkx1yFcAYvtms/4cgdn+5UpjcZf9U0O689aixAHadMi05jIBZOCnqRB
 IG6go6lK8D+iq/t/HtA==
X-Proofpoint-GUID: xc7oI4x0y09DwNolH6z1GoI_FFLSH595
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2NiBTYWx0ZWRfX0ssEUncYc4tJ
 bq0cVaZx2+iewIp+BwcsCGpuvZpa6cJiv9JLyR5MwHf9zurM0ZgOyFQtli21oMqXNGf3lIgPE8r
 jSIqcY0H7YKnKnA9+WajSZbuxcxbiE8=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a606d90 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e1oV9azWTbvrO268RREA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: xc7oI4x0y09DwNolH6z1GoI_FFLSH595
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220066

On 7/22/26 2:51 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Jul 20, 2026 at 09:50:34PM -0700, Hangxiang Ma wrote:
> > The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
> > C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.
> >
> > Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> > ---
> >   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
> 
> There is no such file on recent next and cover letter says nothing about
> dependencies.
> 
> Best regards,
> Krzysztof
> 
> 

Sorry, I also noticed that mistake after posting this series, so it won't occur in the subsequent SM8750 series. I'll add a description of the dependencies to the cover letter in the next revision if those dependencies haven't been merged yet. Thanks a lot.

Best regards,
Hangxiang
