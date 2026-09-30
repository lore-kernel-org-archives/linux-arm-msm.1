Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCC53AFAE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761385; cv=none; b=Amr8u+kSnVFo5tBfyUV5lz7LbPagiaJ6PJetGyrObI8iMB3xHRVJgg9bG89i3y8//25VtBgtnPeSkaEsAOZwNPBygWDUvu6+Vlrhc2Wc33o2zNkS6rVrxVXsFIV8K4TZP6ss6eq2fYZPqvfxZEeHjuVhLAeUZIGkJeXztvS0eTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761385; c=relaxed/simple;
	bh=F61vfpCLUs230+Kga6ah7vN3n1G+Njimcu3inI12qr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPZJabDt7ZZQZ36Mo6m2oKS2+ld+Bl2GyhpJXJOE2BUQpd2hb33Z5l1A8Y4Fs1A7jbcrfnlCnc37/WHktltgcCeBLyHW9JciJBv7aTbWud6rWvddlQ5ZcGIevgbOVv4fP4bvihcLxIHR68EalAjBmw02tZfVrasQxWZaumXNO44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcquKj9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egqlScXC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcquKj9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egqlScXC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dTfL1556164
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 09:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ff0K97C/PDgp13TGJrhCjv+N3JCxrJHQbq4bZUuBrM=; b=WcquKj9Nb25jIoOy
	3e9y30+dQhDIpJE6EqEi4IV8LcWXoiLaX1ntxCOQhRoV8ov4g6+fomzoxzqJEPMA
	TiGwSQY/zuMeSelcR7P/8k+w3O4tU0zTMhPrJ+0XvQEPfS1Oyt9NxdkUdtEl6R6P
	z14d9ppkf/wIi8BR89ddG2SHwi7OCAjE3qtejTbO32NCKR3F+IrzNlCrDxQCa+D1
	ijD6y3+W4Wjo51csLWZzX+BMg1DAHyr8OKRmFnRcJH08RFpPmMxGZeqh2AIDcs3Q
	/pN87YR1Y1MVIMbjaw6EilslAedsCxuSowlaeUETzZ9cjrRnF2J4/No1fehYwlBu
	Iws+TA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c0k3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 09:43:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c4d46037eso7505856d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 02:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790761379; x=1791366179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ff0K97C/PDgp13TGJrhCjv+N3JCxrJHQbq4bZUuBrM=;
        b=egqlScXCsq8AWlbLXdGtw2ndr6fEpVLNjwepDbPxzSYORQzjolC28qnJeurQ4A2XH3
         jY9w7LuDxlVzHcjjIrboQt+AbUTro++xYeiCB0tC0T2tNZkjxnENA1Xq5eixntnN8dP5
         cSu5zVqVLPKBqs1echcwuxFzfJgwNxYbI7Cz6/exmESNGehTtkpZEtBoWFfln3VPWX8F
         NDxGXGU7i/BXPpy5FgNMfYbPF5lNkMj9M3g2Pd0lF30cEJUBc8ycGqaIAjGV7vTb51yG
         E8HeNcKGMVv7PqbQHWYSb987v72NQDDzVpWRvADHPFtpnJRYzNjKHGpblcizdqkXaiOB
         UPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761379; x=1791366179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ff0K97C/PDgp13TGJrhCjv+N3JCxrJHQbq4bZUuBrM=;
        b=0oMWA+QyXOIWK5wrcGRr5qIYLgzZ1CgA+FFxZFzdWM3sCSdNuqCtpIJV1Jz+3m87Yk
         zVjoNU8gg5ZIlRBnwBZhXKOfc+zMQWLL0I3a28jnly2iAWk0r2eoMH4BA9w42XMZB5Vk
         qfFLqxk6RcUAXu5Vgdlvo+JokLy+387jxhVFJWN8oaL0AqbZDMAJRgWKmAkHqPd7P2n2
         ccGnrLnuIHY/2VJMwDOBM+aHVqcP+aPosr+8BqEq9/1M+ytzPjX87sOMwYLrg6OlVPH9
         Hzk5RVX1AMsTgDqbg/NnY+wfb5w9w+RcsE2YL1p5HNZ72ZFbbGZZdE7kP3n2dX5fGm36
         DUZQ==
X-Gm-Message-State: AFuF++nI7ZHJZ3lEwMsjaP304N/8b116uH3NC9QRcoV5c7LURGSU5Atg
	rxSo3wx/+upG4eusUiogJk1N0+oWaJeTzlIlxTtDcwgj7WOt5JqtH8hHg/OM/H+B+ePHwPMoF8H
	Hpc3WlECJ/FJhi7qfY6e5DzRw482BStLTcOc2+pg2phXMOIoD0iwbfzUIjV5KA4A0sVAk
X-Gm-Gg: AYBFou1fIa+WWqzackiqL0h3fJ6BL9koDv7u6BKx6uoPGwd9PdMb+ULR/ftaFgOCNeK
	3EWwM1mhL++Xrsco/1G6zLXljA9OGcm7IEo6T1wOQ9V7kym3Yz6G0Q+I5ajYDxNMAkyLwHYtFQX
	J3TKQ3n906RbV6go+gjd1ltkmo6Ixj73JsrqAbUKzdl8o5hsAUetv2+iDjhF/9EEH+QdVY72u1S
	zzAaSAMA9pbIDmaOpj4THwWUdo7ZeigTF0qUog3Jf/bPkHG8iIjr/0uTspnwfU/hJ1IvnWvuLE0
	XCbT7QclnEzySePWIRQxcTet49JnQjziw8j8l8uIX/MaPt0YZs/dLTenh6ga/sVeszPvF/2pTCQ
	r/eAetmfTu3JvyuCKlGAb6Q==
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr113845985a.4.1790761379537;
        Wed, 30 Sep 2026 02:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr113842785a.4.1790761379026;
        Wed, 30 Sep 2026 02:42:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f42d25sm36994466b.13.2026.09.30.02.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 02:42:58 -0700 (PDT)
Message-ID: <a1f90a3c-1ec5-44da-9260-46186a4b8838@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:42:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sm6375: Use common clock controller probe
 data
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260926-clk-qcom-gcc-sm6375-rework-always-on-clocks-v1-1-28f581ab0289@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-clk-qcom-gcc-sm6375-rework-always-on-clocks-v1-1-28f581ab0289@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX1yIODPb/VSde
 RyFAhx68fvXiNBJ959mxnp5eMMLCXsz3Mvt/j9OqgHbOQw2op541s7OQNLU7C2LpO6FLXcS7ZI9
 vJ3qr/mye4wNqrAOyqTmiwThw0QV8d0=
X-Proofpoint-ORIG-GUID: 1fyHZ2lxZkARCtOToxTLZkbBbFViDPxn
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abcd9a4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=XUWX-FGXn234V1AR_7gA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 1fyHZ2lxZkARCtOToxTLZkbBbFViDPxn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX6dQiN79R4cJK
 htuO945QbX8CDRsId+za9qQwDkWeiHw8Gxo5iVOlVCV8FSj/a8exg6KMCMy2IZ6WIJO5DNrR3Vt
 nB3RzGI/L898efd9y+y3bSbcf+QT7zfVVxMOty5M5AwbX1+dyXWfHFV0efXmYuW1TPf5Dil78sX
 1UWsdW4f6EOVD2cH08EqwAsR4jRcwfERbUeAuvt83Xm3rtNky6X/axQsX53lHjJmwvxTGSGbXIC
 oSdR65jWdcup4EvM5GLb+iks/ls8ErA2XFWHEHLHWDbEtvlpSVaU2m/T/VgVJhqKlblLk57eS1z
 kSkX0eJlK77hQiFb+jaZe/3QTXQLFInQan/T1MGZFoI651Z8KFyE68yPrG24918t7LzwX0WsH9a
 lNPJCciB3TjqFfLuLLEHowxq5+1v9ZKM6b3snc8JalUIluaiaCH5SVH7kp1siEGDWPmD/gOP0CW
 NJvcXbdtaoHRItkmIGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300038

On 9/26/26 1:16 PM, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array
> and describe the DFS RCGs through qcom_cc_driver_data.
> 
> Move the configuration of GPLL10, GPLL11, GPLL8 and GPLL9 into the
> clk_regs_configure callback. This preserves the existing ordering of
> enabling the always-on branches before configuring these four PLLs.
> Using the alpha_plls array instead would configure the PLLs before the
> CBCR enables in the common probe path.

I don't think that's a problem

Konrad
