Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461280;
	b=XRVEQf3fJLRFxL7LmCwXnlx9MH+xZB4GB+XNADY5c2cvJEweOVH1Zkakg72CnSCDL796
	 PYp/epfwbLw8vM3uOZW+lQWXC0AF9iCEfcWub7XAFpnNO/sc828/a4aiTWfbdP+GWsqoD
	 1F1iZXJ6cl/g/FNS+sRJMo15G05q0rxf5wh289bKPSDdFaHUdpg3OIDXvSwzVjp2PywzZ
	 MHlGTUZLzbQPrBBcmDc7uw3DiyLNs68c2k6qB/luaTL9kgiMNny55OlAiJb00CHabYu7B
	 Sxjs6LRdpSlrJJJC5A3NBffWiKokcfXJR7fm4aLCISyqxdJBlwBRrn5WOdyhWxV8ccA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gS38KZJNFZ90HKGYbwLzukxI5ECwcquZsp/UfDpMK3Y=;
	b=YywFJftwqaq6UZgkdRWP7j4/h8AW3HYI+QQJ9WF9/0ZN8+e6Pa1BkNiI/vd8zhbeikk5
	 GIeIexXycdNAMAtOkzab4bXOVs4aIeywb4fMQOrdiBviDKEkepzqCYUYdHwP8JMP4r+Wt
	 oI5hz6NN2bjmPeQFjeZq6GpVNjLg6RbApSG+x8/1JgrHyp8r12zSSsYBfKuuKPByM3G1R
	 IGRIPfd0aBQQh5DIQCEZZkZHHf6xrk6GwnnAUMBSoX/mm5320Q17J3OvyEDuvouAACRt4
	 XrPrmGOkzDlA/X7yv8iZc1Fg+n6h6DwpJdRP3dXTJxu//PVR9V9f5B4r+R7bnBKcsYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jelOsaT4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPjnMqgJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9F0606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jelOsaT4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPjnMqgJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlYG1861143
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gS38KZJNFZ90HKGYbwLzukxI
	5ECwcquZsp/UfDpMK3Y=; b=jelOsaT4+k3tFs7zutmo/m1M/Rc+fyYFWqb2lpJE
	7fBv3RWcNVFSWvDqNC8fqgzM1pbcUPZbU7KE5lwjgq56hJREKvIyIqda9cnGsf9I
	Dxc4gekx3N22swDh7fA9ErldGowDQWp4j72GtD8bJHe1BVYfGZdzqVnzbWXooozQ
	ZJmA+jgHSlHsFzdN4ee/uJpH98hwmULMF1gxYjCegLl/LU9Jpf+d2++edar9HIWQ
	r9LMlC0XIVb2624Bw1iB9xzMxOkQEKw8rUmzjyifOw5230cLHbi8CU4uV7ypBN76
	Tvuyu7MFXi8igQKseeBpNfA1JvAnQsCkNgQw1NuojrQTIA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a30w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:14:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9210ec7cb34so99490966d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461278; x=1796066078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gS38KZJNFZ90HKGYbwLzukxI5ECwcquZsp/UfDpMK3Y=;
        b=IPjnMqgJY4S3zRf+tpsd4tQs1+oCDoUGtGq3Z5VjSgLLu7BrW9/FwOoF0RnkczZbEr
         4lgfN8v+GHanMtMDOv7s1i3OKUk6HvClU6nOk+ldl2qOghAkBoif0w6Rm4HMCJFZBWgO
         U7Z05hAGeZw/q6dUb7oOwtAcS12ahxgCqb7Lq9q68Vqzw1Ssjp7779lojYpI44UJHiev
         Fjq+Gr/DNYaWqvkJjbBWQYyMR8EIEcZt6j2PRtZXrob1fjtzmk15yVJEMTpJVYPWa4FG
         IWyKZCpcWv0LhO8GS0YxTw67c7UnE8+HWevbDsQjPmpPyniImdUJN4wSWjSO+qrzo+UU
         HiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461278; x=1796066078;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gS38KZJNFZ90HKGYbwLzukxI5ECwcquZsp/UfDpMK3Y=;
        b=KJs0/HmZqDx8gNc+X0YJwyiCuwQo34XpZ2dhhK72cZ45aeVhvUCK3esEB8mAdgQXVe
         kmY3BtEwKPsk+Lj7eJ3I0lqKd3Tdbl/YK9FQbvsTcnvn0N4ItgsAJqTTKX1ZNcQQazzR
         NFhwgZ9l6shm7bj3PDgT3iLy1bXmZnNlS3IlriTpyWBH59alTO0VcHOjo7mgO7bFmAfO
         b1q+R0UJqcMOUrOdxgaRjFippShnfHuXzu1z1FbFPVVvMDzNi1nY5n2xzAFXGU82mIWU
         OtRRdRZI13UfNvvkVeWa1Oa9nLp68ZnXmJlvuRwynULWSL3Hwcx7rmTyb/Qu80DHuFut
         7uyw==
X-Forwarded-Encrypted: i=1; AL+hErE+tsloy9x9m719oy7Kt+2cLzPChRFmliwwdLQY5FEE37aUL59X7C6Mo8Nje5UQrFYpOwp30TYiWhVct/hL@vger.kernel.org
X-Gm-Message-State: APuU4Z+K0X/RWgrst9wxM0G03NNr97didgr0RqMKMfeIhNHaNGbSfU4z
	726kaYVC4+lmilnYVpp/Z0f1GMOBcvk6dlNtwLxrRRu5Gbur9oOlZrZMrOa0QutlV9HM56eOmlh
	ecQb3ltY2dQQgiLFhbiAVYP1NXivcj5CRsr8GYdY3LXlf/jyPyo7qDmMgelja5QON+JPz
X-Gm-Gg: AZFdTZfpFb0h3aXCTrcOj3v1lNxvv1ZxLUBSLbL2+OyFTYyDV+ygYaalycyNunvPIBd
	gsj7B1j/b991g3wplCESO3ge/gwDeano9x59wUX8kWENrP9Tlf13yh45+oK/vp/i+g2yGnF2jlZ
	Xoc8cypjUQ1+dNXasgPo/UbIbquepTE+1hO5lXQLpbf+aev1WPVd6bt93T4qMTh0KbpYAsB9kHC
	WzVH6F81OtdnwQB2Rxk5dGVKDB5Md8D5b2xsc3FSsMtMpkxCaq+KkgVpvPny1ykACu91E9rwkhJ
	KWGo/HYMDhMkiyDyHpL8OYp9x4ijLBGmfL3ZZpNBPhl+ObyjH3LqR3eeq7nDzelS5XRrRYpmW8T
	uT3V0cgOniTGiFadNnV/JqpjLp1njCKohnVrxhsb8oLZiEM2ryola8Hgvo+PpfyBd
X-Received: by 2002:a05:620a:7113:b0:949:569a:a3fa with SMTP id af79cd13be357-949ba9b82f4mr2029469085a.25.1795461277623;
        Mon, 23 Nov 2026 11:14:37 -0800 (PST)
X-Received: by 2002:a05:620a:7113:b0:949:569a:a3fa with SMTP id af79cd13be357-949ba9b82f4mr2029460285a.25.1795461276970;
        Mon, 23 Nov 2026 11:14:36 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm532978665e9.11.2026.11.23.11.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:14:36 -0800 (PST)
Date: Mon, 23 Nov 2026 21:14:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        usb4-upstream@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] clk: qcom: gcc-glymur: Add missing USB4 resets
Message-ID: <f2oeebfrfdqwhaqusxksunzc5poutvtwtycfokgsvotiyt55t5@kylt62n5yvv3>
References: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
 <20261123-topic-usb4_clks-v1-2-531ab5635c03@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-topic-usb4_clks-v1-2-531ab5635c03@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX7FN2a9hPVUS6
 dlp7HIcQ+3jCnGknGwxqyQGBI0v3LaVavwhRQWSTbeDUDRWNZfHXSSliPViJiM/xN3wRLgrdlc/
 UPlrjOY0dBYWB1T8Zw4t1aDF/Dzgg4w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX/uEOOQg2F/XA
 ztedd6CjuB9jUR9IV0iyeCCyna2gY32q+W52QnTRJykDZCit66jAuVD0guonuJr9b4qHi7wzpks
 oTYJole2CPpgobGHbY2R2+9W1jCrHUf492V/Ylt4MemdxEjuRkfdnONcplXqnXsJUwz/KZbKE1p
 WGicGal2M8FgYJWBZCcge4j3IS4bxcD45KssNfmj2zZ5D1VCNL4PM+XBDabdXlseuAaLEKTz09E
 R3HjlNWA5LsuYax+BAt6NCN14Zjj0TYFxaqaUVwKoe94wv+27ZL7rrcqw7Jl5cEL50qBiDFOCZq
 K8TuvCLZnfqKcwuYoSoqanVHc13SVt0rTQfCyduNZThI6a/W9erGrm55G3aoAJXsP2eCMj7DcTZ
 oiOIMqbHnIsA5EjLM0GjiG7CS4+ltaHZUwkeX0Iy6hu6LlcdPnPqkLT9jZxCArvygx1r7zW7JXC
 p82kZerj/C+FDc1n41A==
X-Proofpoint-ORIG-GUID: kAfdUZtMSpCPWmNBfV6pHskgiotR_6j0
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04909e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=w0_0LCA9YDJ5smxPYiAA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: kAfdUZtMSpCPWmNBfV6pHskgiotR_6j0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230076

On 26-11-23 19:34:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> A number of the USB4-related resets were left undescribed. Plumb them
> in.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
