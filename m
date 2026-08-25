Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD13F3EB107
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652945; cv=none; b=OjOhWZ9uY8QJnVxb5NiV3A6mynW8gelKSx8xgAp7trOok2llTJy1d3J5lsasdh6KfPdo6H56rZn5MQYkTZIzTuNWvu5JIxs7x7uPLuUk/41Yyz+sTWSTMhhn+1v9BtQd9XcDErNyn7OJwkQ9J2Jjp7J4qRBNAkTGnFGC2xUSB4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652945; c=relaxed/simple;
	bh=uj69b6K/3X/AlbMsky2fdzUfT94fwWCpCE5MCZPbtDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RqNuRQTnKL5VdhdZyomo0eQcRwJsPVX/Medtn2xbX7QuyCZF/tRuLl35SB06HwmQqIVZsfCeZPy7Fx+PfF1B5yrJ18JxRDreYGckCL6b5LP6YyIuL9WuYy61cyxyVE//r0azlre5RMSbwigdlA0VSPG9pRtF68V8Kv0P8WuiQJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmtqvjgP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZ9azhIH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmtqvjgP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZ9azhIH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88euE1253700
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7POdjrXeXOe8rEz7+WixrKTIdekxp+VUit6nV/G0GJY=; b=dmtqvjgP2GwJiZxT
	Cr5Rfus9Omk/g3StzhBqqhJfsEh/cPd/8Hvpcwn98O+OLDmxnaKi2AvVczGrByzL
	i6SNUIqcDTqfX/vDpuglEhwOhi4ryCN/MoLyvklE27COfVYDtnsfYhcGSqKOh9lv
	nn4zg4xOy8uAf80lAc1Lv5BT69ZmD5TVO75nKMy1B+0lQFxi04Qp17dFxpjMeNOn
	qxRliH4hM7kCb/nD+URsZ3tzgaVNaaYTNdPbSH9fpeKFzccSU/CT9S4TzvVyOgHD
	jy8Tsm0jxfVdRq2mGa/Dd3vrs3zB8Y7bOFMpBjP+79uoblD3o3kfz1w4TAbq57Kv
	Anre3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s3cuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:15:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d57d17d6cso9501671cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787652942; x=1788257742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7POdjrXeXOe8rEz7+WixrKTIdekxp+VUit6nV/G0GJY=;
        b=JZ9azhIHgpLw+iD15JHFDUb4ajlYcTlb7YZkOgZUXSfjvb6Tez2lo32ebEYvUEwPNk
         HBtyJGrGIazZCd70GP/1QQWNG1DrgBpQo5PNE80+LiYBG1JoF/t8EqJ7TDgWbbTcdBVE
         lBoGKf8dcTo9wwSXGtMWAExiaeR7Bt6DULafBLMf5w+l3lKJylfepLrf8ka29uqUBRGT
         ccuN2cojyJ2sd+a1RhtfdxdZQ/w6mX2YH/ouIDy0qYD3RCoVBmMszj4crz8TTli7Lo1O
         0FMLYB+454SCEQzwwuL948x7UssL4DkG1RqrxcGAmKEb5Nd4+VTa6yiEgSHVuWoAAlTi
         g/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652942; x=1788257742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7POdjrXeXOe8rEz7+WixrKTIdekxp+VUit6nV/G0GJY=;
        b=NFSjTKxW5RpCdsD4GRcwwfaeHiXYGj31iX3exV64YAGI9Rc4mjVwT6hKW7LG7ytIXe
         xZA92ZI67niWGB162vQGgjRn24sN0dmQa2ZaD+HZyVcDWGfr50HJHAiRQosxKcD1Zuwm
         SAfLmTjj2BBdVLheZmYTQPCiUTg/dmxdwnSc4DhPhsTBssTNSgB/f4b3Mbr/QYLhbwni
         OR9nh+Ano/jd2OpYGZjtLedL9Mc7zNmrnEQdNKAU7ZWWqdGGVEVnJQElrlOftmm9/Nbu
         T/K59jnyMIyy3IdCQHGjZ3HCdu4I1XSgGMEbRsFXdG5rXoxTFPWXB1E4FcLoYLrg+tH9
         Lqxw==
X-Gm-Message-State: AFuF++lclIYFvM688tiKKGmWI7G23Qcm1LnZIvrjQMNkQEwjiTwtL/jx
	RcDoKlaTuiKGwS74zlcXe8CIYf9FNg8YHE3VtGe1XcAz9+wcZZe3rNL66J+SUz/yyrG2J5Dogkj
	PrFCz2H5ayVn2plC1fMIGpFHvjwCZbhenTkh0QfYOA9XaqVTQHcswYExMoywBkvaimSij
X-Gm-Gg: AR+sD10SBvhcdhVL8w6mT0SYnsn2mKKx6s3xTI5o5sG9scM0jr/dyqfwikCz80qyAEy
	/iasB9b7/8NWDGHKHX2sG6kURmptJ86nPRVzOxSAsnCLVzcrk8Nm+KzR4c5QJsDKRaof2mHzmg6
	AZlffBTa0bqo49ZcMbi7I1rrlxA38ucs+sli0PRyFtuLaJ8VEsb9WJLhpxeU+nHP1lfDWwJloSR
	7hbaVe5ETx8W/jnom7pMMGaOQokGUgHgEWWN8zqvD0Lw6HQ9YN5sO7U8Pr/NMFDDfclqG6Mmcuu
	h7lgwDa26vpIe0kAGnataf7vs+iv7S1KGVY00Vz8nMu55woOp3tcO562frJTY0x3/AY3gm9ABY1
	DKamyXenMuopGE1kEzuHE82VU
X-Received: by 2002:a05:622a:1102:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52df5a21154mr244029791cf.5.1787652941957;
        Tue, 25 Aug 2026 03:15:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1102:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52df5a21154mr244029421cf.5.1787652941444;
        Tue, 25 Aug 2026 03:15:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b431sm1397241266b.1.2026.08.25.03.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:15:40 -0700 (PDT)
Message-ID: <eee2a3eb-6199-495b-880a-7c94a697d900@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:15:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Introduce new locking mechanism
 for SCM driver
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ninad Naik <quic_ninanaik@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Venkatakrishnaiah Pari <quic_vpari@quicinc.com>,
        Jian Shu <quic_jianshu@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
References: <20260824-port-scm-patches-v1-0-1dfd69374402@redhat.com>
 <20260824-port-scm-patches-v1-1-1dfd69374402@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-port-scm-patches-v1-1-1dfd69374402@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 46o2FQJG_6FZ08fh4kVvItY2rvVXVuny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NiBTYWx0ZWRfX5ybjvtOtpQlw
 wTsQYqqkZLI/zVOQN+E4mb0gPmPByRch/zAHaC/YxpQ5bOd45VnfNthWbEfJntgr8PTBMHeYbim
 pmbsErvx3gteIXQn7/+e30Aydy+EjeVYagUNaTL4dWyOL9TaO9juPI3mcq5e+uvzZp/3e5gUPG6
 Pw67Ac02+rcz2a0XRSfwcZ3tGiwu64yJNBCxEFH4VnsGlpJQ1pzaNtrICKXiRD3mSgREkE8a31U
 x6UUnk0/rDIGt746lRtoCIeKKGH1sqh+TdaEgEWga4PZiW5oVE513+AgZgaa8iHp/7OIzV3o6eK
 NGmWNiuc0rv5JkAKiEEDeFVxbXL14rVF9ULv5zmzn2n4mF0it8L1LPRLH+lfwMEw4gBQSzHQ4aS
 H/ZHq23KBbID4pJ6GgQGa6pdDXpYxqQ6hJ2iWYpj7E1TSrNRuB9ZIbUy2C2tSH44TkbZZ/pdycg
 uqazXKEUOEbE9m0jPjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NiBTYWx0ZWRfX7AABm1d7FlTQ
 0/4GC7eNXVkRemFutcLgwNvgo6Crko9qypUzFJQd/5fT7pF+64Jre4/WuZWv0P7LIFn43sH0+eG
 2CouZDDwaDk1BKy5Zqw5VdfQr41oO1E=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8d6b4e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=9NaPMQSaEhmwODzW0qsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 46o2FQJG_6FZ08fh4kVvItY2rvVXVuny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250086

On 8/24/26 1:35 PM, Albert Esteve wrote:
> From: Ninad Naik <quic_ninanaik@quicinc.com>
> 
> With the existing global mutex lock, there is a possibility that it
> could resulty into a deadlock when SMCInvoke and smc call go to
> firmware in the same order and both wait on same WAITQ in firmware.

I think the commit message should be extended to better explain how
that may happen (because presumably it did in  the real world)

A Fixes tag may also be applicable here

Konrad
